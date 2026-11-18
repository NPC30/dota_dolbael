(function () {
  'use strict';

  var START_CHUNK_TIMEOUT = 10;
  var START_CHUNK_RETRIES = 2;
  var END_CHUNK_TIMEOUT = 8;
  var END_CHUNK_RETRIES = 2;
  var RELAY_CHUNK_TIMEOUT = 10;
  var RELAY_CHUNK_RETRIES = 2;
  var RELAY_PROTOCOL_VERSION = 2;
  var clientNonce = cacheBuster();
  var readySequence = 0;
  var heartbeatSequence = 0;
  var heartbeatToken = 0;
  var announcingReady = false;
  var leaseId;
  var relayEpoch;
  var leaseRenewAfter = 5;
  var startRequest;
  function trace(stage, info) {
    try {
      GameEvents.SendCustomGameEventToServer('omg_gate_trace', {
        stage: String(stage),
        info: String(info || ''),
      });
    } catch (e) {}
  }
  var uploads = {};
  var relayRequests = {};

  function cacheBuster() {
    return String(Date.now()) + '_' + String(Math.floor(Math.random() * 1000000000));
  }

  function removePanel(panel) {
    if (panel && panel.IsValid()) panel.DeleteAsync(0);
  }

  function matchesCurrentLease(event) {
    return !event.leaseId || (leaseId && String(event.leaseId) === leaseId);
  }

  function resetLeasedWork() {
    var uploadId;
    var requestId;
    for (uploadId in uploads) {
      if (!uploads.hasOwnProperty(uploadId)) continue;
      uploads[uploadId].finished = true;
      removePanel(uploads[uploadId].panel);
    }
    for (requestId in relayRequests) {
      if (!relayRequests.hasOwnProperty(requestId)) continue;
      relayRequests[requestId].finished = true;
      removePanel(relayRequests[requestId].panel);
    }
    uploads = {};
    relayRequests = {};
  }

  function failStart(request, reason) {
    if (!request || request.finished) return;
    trace('START_FAIL', request.requestId + ' reason=' + reason);
    request.finished = true;
    removePanel(request.panel);
    GameEvents.SendCustomGameEventToServer('client_api_start_failure', {
      requestId: request.requestId,
      reason: reason,
    });
  }

  function loadStartChunk(request, index, attempt) {
    if (!request || request.finished || request !== startRequest) return;
    removePanel(request.panel);
    var panel = $.CreatePanel('DOTAHTMLPanel', $.GetContextPanel(), 'ClientApiStart_' + index);
    request.panel = panel;
    request.token++;
    var token = request.token;
    panel.style.width = '1px';
    panel.style.height = '1px';
    panel.style.opacity = '0.01';

    $.RegisterEventHandler('HTMLTitle', panel, function (_sourcePanel, title) {
      if (request.finished || request.token !== token || typeof title !== 'string') return;
      if (index === 0 || attempt > 0)
        trace('START_TITLE', request.requestId + ' idx=' + index + ' try=' + attempt + ' len=' + title.length + ' head=' + title.slice(0, 70));
      var fields = title.split('|');
      if (
        fields.length !== 6 ||
        fields[0] !== 'OMG1' ||
        fields[1] !== 'start' ||
        fields[2] !== request.requestId
      ) {
        trace('START_TITLE_BAD', request.requestId + ' idx=' + index + ' fields=' + fields.length + ' head=' + title.slice(0, 70));
        return;
      }

      var receivedIndex = Number(fields[3]);
      var total = Number(fields[4]);
      if (receivedIndex !== index || total < 1 || total > 128 || request.seen[index]) {
        trace('START_TITLE_BAD', request.requestId + ' idx=' + index + ' got=' + receivedIndex + ' total=' + total + ' seen=' + (request.seen[index] ? 1 : 0));
        return;
      }
      request.seen[index] = true;
      if (index === 0 || index + 1 === total || (index + 1) % 6 === 0)
        trace('START_CHUNK', request.requestId + ' idx=' + index + ' total=' + total + ' bytes=' + fields[5].length);
      GameEvents.SendCustomGameEventToServer('client_api_start_chunk', {
        requestId: request.requestId,
        index: receivedIndex,
        total: total,
        data: fields[5],
      });
      removePanel(panel);
      if (index + 1 < total) {
        loadStartChunk(request, index + 1, 0);
      } else {
        request.finished = true;
        trace('START_LOADED', request.requestId + ' total=' + total);
      }
    });

    var url =
      request.backendUrl +
      '/game-start-v2.html' +
      '?requestId=' +
      encodeURIComponent(request.requestId) +
      '&steamId=' +
      encodeURIComponent(String(request.steamId)) +
      '&matchId=' +
      encodeURIComponent(request.matchId) +
      '&randomDraftMode=' +
      encodeURIComponent(String(request.randomDraftMode)) +
      '&chunk=' +
      encodeURIComponent(String(index)) +
      '&signature=' +
      encodeURIComponent(request.signature) +
      '&_=' +
      cacheBuster();
    if (index === 0 || attempt > 0 || index % 6 === 0)
      trace('START_URL', request.requestId + ' idx=' + index + ' try=' + attempt + ' url=' + url);
    panel.SetURL(url);

    $.Schedule(START_CHUNK_TIMEOUT, function () {
      if (request.finished || request.token !== token || request.seen[index]) return;
      trace('START_TIMEOUT', request.requestId + ' idx=' + index + ' try=' + attempt + ' url=' + url);
      removePanel(panel);
      if (attempt < START_CHUNK_RETRIES) loadStartChunk(request, index, attempt + 1);
      else failStart(request, 'chunk_' + index + '_timeout');
    });
  }

  function onStartRequest(event) {
    if (startRequest && !startRequest.finished && startRequest.requestId === event.requestId)
      return;
    trace('START_EVENT', String(event.requestId) + ' url=' + String(event.backendUrl) + ' sig=' + String(event.signature).slice(0, 12));
    if (startRequest) failStart(startRequest, 'superseded');
    startRequest = {
      requestId: String(event.requestId),
      steamId: event.steamId,
      matchId: String(event.matchId),
      randomDraftMode: event.randomDraftMode,
      signature: String(event.signature),
      backendUrl: String(event.backendUrl),
      seen: {},
      token: 0,
      finished: false,
      panel: undefined,
    };
    GameEvents.SendCustomGameEventToServer('client_api_transport_ack', {
      kind: 'start',
      requestId: startRequest.requestId,
    });
    loadStartChunk(startRequest, 0, 0);
  }

  function finishUpload(upload, success, reason) {
    if (!upload || upload.finished) return;
    upload.finished = true;
    removePanel(upload.panel);
    GameEvents.SendCustomGameEventToServer('client_api_game_end_ack', {
      uploadId: upload.uploadId,
      success: success ? 1 : 0,
      reason: reason || '',
      dispatchId: upload.dispatchId,
      leaseId: upload.leaseId,
    });
    delete uploads[upload.uploadId];
  }

  function uploadChunk(upload, index, attempt) {
    if (!upload || upload.finished) return;
    var chunk = upload.chunks[index];
    if (!chunk) {
      finishUpload(upload, false, 'missing_chunk_' + index);
      return;
    }
    removePanel(upload.panel);
    var panel = $.CreatePanel('Image', $.GetContextPanel(), 'ClientApiEnd_' + index);
    upload.panel = panel;
    upload.token++;
    var token = upload.token;
    panel.style.width = '1px';
    panel.style.height = '1px';
    panel.style.opacity = '0.01';

    panel.SetPanelEvent('onload', function () {
      if (upload.finished || upload.token !== token) return;
      removePanel(panel);
      if (index + 1 < upload.total) uploadChunk(upload, index + 1, 0);
      else finishUpload(upload, true, '');
    });

    var url =
      chunk.backendUrl +
      '/game-end/chunk.png' +
      '?uploadId=' +
      encodeURIComponent(upload.uploadId) +
      '&index=' +
      encodeURIComponent(String(index)) +
      '&total=' +
      encodeURIComponent(String(upload.total)) +
      '&data=' +
      encodeURIComponent(chunk.data) +
      '&signature=' +
      encodeURIComponent(chunk.signature) +
      '&_=' +
      cacheBuster();
    panel.SetImage(url);

    $.Schedule(END_CHUNK_TIMEOUT, function () {
      if (upload.finished || upload.token !== token) return;
      removePanel(panel);
      if (attempt < END_CHUNK_RETRIES) uploadChunk(upload, index, attempt + 1);
      else finishUpload(upload, false, 'chunk_' + index + '_timeout');
    });
  }

  function onGameEndChunk(event) {
    if (!matchesCurrentLease(event)) return;
    var uploadId = String(event.uploadId);
    var index = Number(event.index);
    var total = Number(event.total);
    if (total < 1 || total > 256 || index < 0 || index >= total) return;
    var upload = uploads[uploadId];
    if (
      upload &&
      (upload.dispatchId !== String(event.dispatchId || '') ||
        upload.leaseId !== String(event.leaseId || ''))
    ) {
      upload.finished = true;
      removePanel(upload.panel);
      delete uploads[uploadId];
      upload = undefined;
    }
    if (!upload) {
      upload = uploads[uploadId] = {
        uploadId: uploadId,
        dispatchId: String(event.dispatchId || ''),
        leaseId: String(event.leaseId || ''),
        total: total,
        chunks: {},
        received: 0,
        token: 0,
        finished: false,
        started: false,
        panel: undefined,
      };
    }
    if (upload.total !== total || upload.chunks[index]) return;
    upload.chunks[index] = {
      data: String(event.data),
      signature: String(event.signature),
      backendUrl: String(event.backendUrl),
    };
    upload.received++;
    if (upload.received === upload.total && !upload.started) {
      upload.started = true;
      GameEvents.SendCustomGameEventToServer('client_api_transport_ack', {
        kind: 'game_end',
        requestId: upload.uploadId,
        dispatchId: upload.dispatchId,
        leaseId: upload.leaseId,
      });
      uploadChunk(upload, 0, 0);
    }
  }

  function failRelay(request, reason) {
    if (!request || request.finished) return;
    trace('RELAY_FAIL', request.requestId + ' reason=' + reason);
    request.finished = true;
    removePanel(request.panel);
    GameEvents.SendCustomGameEventToServer('client_api_relay_failure', {
      requestId: request.requestId,
      reason: reason,
      dispatchId: request.dispatchId,
      leaseId: request.leaseId,
    });
    delete relayRequests[request.requestId];
  }

  function loadRelayResponseChunk(request, index, attempt) {
    if (!request || request.finished) return;
    removePanel(request.panel);
    var panel = $.CreatePanel(
      'DOTAHTMLPanel',
      $.GetContextPanel(),
      'ClientApiRelayResponse_' + request.requestId + '_' + index,
    );
    request.panel = panel;
    request.token++;
    var token = request.token;
    panel.style.width = '1px';
    panel.style.height = '1px';
    panel.style.opacity = '0.01';

    $.RegisterEventHandler('HTMLTitle', panel, function (_sourcePanel, title) {
      if (request.finished || request.token !== token || typeof title !== 'string') return;
      if (index === 0 || attempt > 0)
        trace('RELAY_TITLE', request.requestId + ' idx=' + index + ' try=' + attempt + ' len=' + title.length + ' head=' + title.slice(0, 70));
      var fields = title.split('|');
      if (
        fields.length !== 7 ||
        fields[0] !== 'OMG2' ||
        fields[1] !== 'relay' ||
        fields[2] !== request.requestId
      )
        return;
      var receivedIndex = Number(fields[3]);
      var total = Number(fields[4]);
      var status = Number(fields[5]);
      if (
        receivedIndex !== index ||
        total < 1 ||
        total > 1024 ||
        status < 100 ||
        status > 599 ||
        request.responseSeen[index]
      )
        return;

      request.responseSeen[index] = true;
      if (index === 0 || index + 1 === total)
        trace('RELAY_RESP', request.requestId + ' idx=' + index + ' status=' + status + ' total=' + total);
      GameEvents.SendCustomGameEventToServer('client_api_relay_response_chunk', {
        requestId: request.requestId,
        status: status,
        index: index,
        total: total,
        data: fields[6],
        dispatchId: request.dispatchId,
        leaseId: request.leaseId,
      });
      removePanel(panel);
      if (index + 1 < total) loadRelayResponseChunk(request, index + 1, 0);
      else {
        request.finished = true;
        delete relayRequests[request.requestId];
      }
    });

    var url =
      request.backendUrl +
      '/relay-v1.html' +
      '?requestId=' +
      encodeURIComponent(request.requestId) +
      '&chunk=' +
      encodeURIComponent(String(index)) +
      '&signature=' +
      encodeURIComponent(request.signature) +
      '&_=' +
      cacheBuster();
    panel.SetURL(url);

    $.Schedule(RELAY_CHUNK_TIMEOUT, function () {
      if (request.finished || request.token !== token || request.responseSeen[index]) return;
      trace('RELAY_TIMEOUT', request.requestId + ' idx=' + index + ' try=' + attempt + ' url=' + url);
      removePanel(panel);
      if (attempt < RELAY_CHUNK_RETRIES) loadRelayResponseChunk(request, index, attempt + 1);
      else failRelay(request, 'response_chunk_' + index + '_timeout');
    });
  }

  function uploadRelayChunk(request, index, attempt) {
    if (!request || request.finished) return;
    var data = request.chunks[index];
    if (data === undefined) {
      failRelay(request, 'missing_request_chunk_' + index);
      return;
    }
    removePanel(request.panel);
    var panel = $.CreatePanel(
      'Image',
      $.GetContextPanel(),
      'ClientApiRelayUpload_' + request.requestId + '_' + index,
    );
    request.panel = panel;
    request.token++;
    var token = request.token;
    panel.style.width = '1px';
    panel.style.height = '1px';
    panel.style.opacity = '0.01';
    panel.SetPanelEvent('onload', function () {
      if (request.finished || request.token !== token) return;
      removePanel(panel);
      if (index + 1 < request.total) uploadRelayChunk(request, index + 1, 0);
      else loadRelayResponseChunk(request, 0, 0);
    });

    var url =
      request.backendUrl +
      '/relay-v1/chunk.png' +
      '?requestId=' +
      encodeURIComponent(request.requestId) +
      '&method=' +
      encodeURIComponent(request.method) +
      '&path=' +
      encodeURIComponent(request.path) +
      '&index=' +
      encodeURIComponent(String(index)) +
      '&total=' +
      encodeURIComponent(String(request.total)) +
      '&data=' +
      encodeURIComponent(data) +
      '&signature=' +
      encodeURIComponent(request.signature) +
      '&_=' +
      cacheBuster();
    panel.SetImage(url);

    $.Schedule(RELAY_CHUNK_TIMEOUT, function () {
      if (request.finished || request.token !== token) return;
      trace('RELAY_UPLOAD_TIMEOUT', request.requestId + ' idx=' + index + ' try=' + attempt);
      removePanel(panel);
      if (attempt < RELAY_CHUNK_RETRIES) uploadRelayChunk(request, index, attempt + 1);
      else failRelay(request, 'request_chunk_' + index + '_timeout');
    });
  }

  function onRelayRequestChunk(event) {
    if (!matchesCurrentLease(event)) return;
    var requestId = String(event.requestId);
    var index = Number(event.index);
    var total = Number(event.total);
    if (total < 1 || total > 256 || index < 0 || index >= total) return;
    var request = relayRequests[requestId];
    if (
      request &&
      (request.dispatchId !== String(event.dispatchId || '') ||
        request.leaseId !== String(event.leaseId || ''))
    ) {
      request.finished = true;
      removePanel(request.panel);
      delete relayRequests[requestId];
      request = undefined;
    }
    if (!request) {
      request = relayRequests[requestId] = {
        requestId: requestId,
        dispatchId: String(event.dispatchId || ''),
        leaseId: String(event.leaseId || ''),
        method: String(event.method),
        path: String(event.path),
        signature: String(event.signature),
        backendUrl: String(event.backendUrl),
        total: total,
        chunks: {},
        received: 0,
        token: 0,
        started: false,
        finished: false,
        responseSeen: {},
        panel: undefined,
      };
    }
    if (
      request.total !== total ||
      request.method !== String(event.method) ||
      request.path !== String(event.path) ||
      request.signature !== String(event.signature) ||
      request.chunks[index] !== undefined
    )
      return;
    request.chunks[index] = String(event.data);
    request.received++;
    if (request.received === request.total && !request.started) {
      request.started = true;
      GameEvents.SendCustomGameEventToServer('client_api_transport_ack', {
        kind: 'relay',
        requestId: request.requestId,
        dispatchId: request.dispatchId,
        leaseId: request.leaseId,
      });
      uploadRelayChunk(request, 0, 0);
    }
  }

  GameEvents.Subscribe('client_api_start_request', onStartRequest);
  GameEvents.Subscribe('client_api_game_end_chunk', onGameEndChunk);
  GameEvents.Subscribe('client_api_relay_request_chunk', onRelayRequestChunk);

  function announceReady() {
    if (!announcingReady || leaseId) return;
    readySequence++;
    GameEvents.SendCustomGameEventToServer('client_api_transport_ready', {
      protocolVersion: RELAY_PROTOCOL_VERSION,
      clientNonce: clientNonce,
      sequence: readySequence,
    });
    $.Schedule(1, announceReady);
  }

  function startReadyLoop() {
    if (announcingReady) return;
    announcingReady = true;
    announceReady();
  }

  function sendHeartbeat(expectedLeaseId, token) {
    if (!leaseId || leaseId !== expectedLeaseId || heartbeatToken !== token) return;
    heartbeatSequence++;
    GameEvents.SendCustomGameEventToServer('client_api_transport_heartbeat', {
      relayEpoch: relayEpoch,
      leaseId: leaseId,
      sequence: heartbeatSequence,
    });
    $.Schedule(leaseRenewAfter, function () {
      sendHeartbeat(expectedLeaseId, token);
    });
  }

  function onReadyAck(event) {
    if (Number(event.protocolVersion) !== RELAY_PROTOCOL_VERSION) return;
    if (Number(event.accepted) === 0 || !event.leaseId) {
      if (leaseId) resetLeasedWork();
      leaseId = undefined;
      relayEpoch = undefined;
      heartbeatToken++;
      announcingReady = false;
      startReadyLoop();
      return;
    }
    var nextLeaseId = String(event.leaseId);
    var leaseChanged = leaseId !== nextLeaseId;
    if (leaseId && leaseId !== nextLeaseId) resetLeasedWork();
    leaseId = nextLeaseId;
    announcingReady = false;
    relayEpoch = Number(event.relayEpoch);
    leaseRenewAfter = Math.max(1, Number(event.renewAfterSeconds) || 5);
    if (leaseChanged) {
      heartbeatToken++;
      sendHeartbeat(leaseId, heartbeatToken);
    }
  }

  GameEvents.Subscribe('client_api_transport_ready_ack', onReadyAck);
  startReadyLoop();
  $.Msg('[ClientApiTransport] ready');
})();
