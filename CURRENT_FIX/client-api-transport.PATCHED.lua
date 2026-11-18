local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__Number = ____lualib.__TS__Number
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/client-api-transport.lua"
__TS__SourceMapTraceBack("api/client-api-transport.lua", {["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 5,["19"] = 5,["20"] = 92,["21"] = 92,["22"] = 92,["24"] = 92,["25"] = 126,["26"] = 127,["29"] = 128,["30"] = 129,["31"] = 130,["32"] = 130,["33"] = 130,["34"] = 130,["35"] = 133,["36"] = 133,["37"] = 133,["38"] = 133,["39"] = 136,["40"] = 136,["41"] = 136,["42"] = 136,["43"] = 139,["44"] = 139,["45"] = 139,["46"] = 139,["47"] = 142,["48"] = 142,["49"] = 142,["50"] = 142,["51"] = 145,["52"] = 145,["53"] = 145,["54"] = 145,["55"] = 148,["56"] = 148,["57"] = 148,["58"] = 148,["59"] = 151,["60"] = 151,["61"] = 151,["62"] = 151,["63"] = 154,["64"] = 154,["65"] = 154,["66"] = 157,["67"] = 158,["68"] = 159,["69"] = 154,["70"] = 154,["71"] = 126,["72"] = 164,["73"] = 165,["74"] = 164,["75"] = 168,["76"] = 169,["77"] = 168,["78"] = 172,["79"] = 174,["80"] = 174,["82"] = 176,["83"] = 176,["84"] = 176,["85"] = 176,["86"] = 177,["88"] = 179,["89"] = 179,["91"] = 180,["92"] = 180,["94"] = 181,["95"] = 182,["96"] = 172,["97"] = 185,["98"] = 186,["99"] = 189,["100"] = 190,["102"] = 191,["103"] = 191,["105"] = 191,["109"] = 195,["110"] = 195,["111"] = 195,["112"] = 195,["113"] = 196,["114"] = 197,["115"] = 198,["116"] = 199,["117"] = 200,["118"] = 201,["119"] = 202,["120"] = 206,["121"] = 207,["122"] = 207,["123"] = 207,["124"] = 207,["125"] = 207,["126"] = 207,["127"] = 207,["128"] = 207,["129"] = 207,["130"] = 207,["131"] = 207,["132"] = 207,["133"] = 207,["134"] = 221,["135"] = 221,["136"] = 221,["137"] = 224,["138"] = 225,["139"] = 226,["142"] = 227,["143"] = 230,["144"] = 221,["145"] = 221,["146"] = 233,["147"] = 234,["148"] = 235,["150"] = 185,["151"] = 239,["152"] = 246,["153"] = 247,["154"] = 247,["155"] = 247,["156"] = 247,["157"] = 248,["158"] = 249,["159"] = 250,["160"] = 251,["163"] = 254,["164"] = 255,["165"] = 256,["166"] = 257,["167"] = 258,["168"] = 259,["169"] = 260,["170"] = 262,["172"] = 263,["173"] = 264,["174"] = 265,["175"] = 266,["177"] = 268,["178"] = 273,["179"] = 273,["180"] = 273,["181"] = 273,["182"] = 277,["183"] = 277,["184"] = 277,["185"] = 277,["186"] = 277,["187"] = 277,["188"] = 277,["189"] = 277,["190"] = 285,["191"] = 285,["192"] = 285,["193"] = 288,["194"] = 289,["195"] = 290,["196"] = 290,["198"] = 291,["199"] = 291,["200"] = 291,["201"] = 291,["202"] = 291,["203"] = 291,["204"] = 291,["205"] = 291,["206"] = 299,["207"] = 285,["208"] = 285,["212"] = 304,["213"] = 305,["216"] = 308,["217"] = 309,["218"] = 309,["219"] = 309,["220"] = 309,["221"] = 309,["222"] = 239,["223"] = 316,["224"] = 321,["225"] = 322,["226"] = 323,["227"] = 324,["230"] = 328,["231"] = 329,["232"] = 330,["233"] = 331,["235"] = 332,["236"] = 332,["237"] = 333,["238"] = 334,["239"] = 334,["240"] = 334,["241"] = 332,["244"] = 340,["245"] = 340,["246"] = 340,["247"] = 340,["248"] = 340,["249"] = 340,["250"] = 340,["251"] = 340,["252"] = 348,["253"] = 349,["255"] = 351,["256"] = 351,["257"] = 351,["258"] = 354,["259"] = 355,["260"] = 356,["261"] = 356,["263"] = 351,["264"] = 351,["265"] = 316,["266"] = 361,["267"] = 364,["268"] = 365,["269"] = 366,["270"] = 367,["271"] = 368,["273"] = 370,["275"] = 373,["276"] = 374,["277"] = 375,["278"] = 376,["279"] = 377,["282"] = 379,["283"] = 383,["285"] = 374,["286"] = 386,["287"] = 387,["288"] = 388,["290"] = 392,["291"] = 361,["292"] = 395,["293"] = 396,["294"] = 396,["296"] = 397,["297"] = 397,["299"] = 398,["300"] = 398,["302"] = 399,["303"] = 399,["305"] = 400,["306"] = 400,["308"] = 401,["309"] = 402,["310"] = 395,["311"] = 405,["312"] = 406,["313"] = 406,["315"] = 407,["316"] = 408,["317"] = 409,["319"] = 411,["320"] = 412,["321"] = 412,["323"] = 414,["324"] = 415,["325"] = 415,["326"] = 415,["327"] = 415,["328"] = 416,["329"] = 417,["330"] = 418,["331"] = 419,["332"] = 420,["333"] = 421,["334"] = 422,["335"] = 423,["336"] = 424,["337"] = 425,["338"] = 426,["342"] = 427,["343"] = 427,["344"] = 428,["345"] = 428,["346"] = 428,["347"] = 428,["348"] = 428,["349"] = 428,["350"] = 428,["351"] = 428,["352"] = 428,["353"] = 428,["354"] = 428,["355"] = 428,["356"] = 427,["359"] = 424,["360"] = 442,["361"] = 443,["362"] = 443,["363"] = 443,["364"] = 446,["365"] = 447,["366"] = 448,["367"] = 449,["369"] = 451,["370"] = 452,["371"] = 443,["372"] = 443,["373"] = 455,["374"] = 455,["375"] = 455,["376"] = 458,["377"] = 459,["378"] = 460,["381"] = 463,["382"] = 455,["383"] = 455,["384"] = 466,["385"] = 405,["386"] = 469,["387"] = 470,["388"] = 470,["390"] = 471,["391"] = 472,["392"] = 473,["394"] = 475,["395"] = 476,["396"] = 476,["398"] = 478,["399"] = 478,["400"] = 478,["401"] = 478,["402"] = 479,["403"] = 480,["404"] = 481,["405"] = 482,["406"] = 483,["407"] = 484,["408"] = 485,["409"] = 486,["413"] = 487,["414"] = 487,["415"] = 488,["416"] = 488,["417"] = 488,["418"] = 488,["419"] = 488,["420"] = 488,["421"] = 488,["422"] = 488,["423"] = 488,["424"] = 488,["425"] = 487,["428"] = 484,["429"] = 500,["430"] = 501,["431"] = 501,["432"] = 501,["433"] = 504,["434"] = 505,["435"] = 506,["436"] = 507,["438"] = 509,["439"] = 510,["440"] = 501,["441"] = 501,["442"] = 513,["443"] = 513,["444"] = 513,["445"] = 516,["446"] = 517,["447"] = 518,["450"] = 521,["451"] = 513,["452"] = 513,["453"] = 524,["454"] = 469,["455"] = 527,["456"] = 528,["459"] = 530,["460"] = 533,["463"] = 536,["464"] = 537,["465"] = 538,["466"] = 539,["467"] = 540,["468"] = 541,["469"] = 542,["470"] = 542,["471"] = 543,["472"] = 544,["473"] = 527,["474"] = 549,["475"] = 550,["478"] = 551,["479"] = 552,["480"] = 553,["481"] = 554,["482"] = 555,["483"] = 555,["486"] = 557,["487"] = 549,["488"] = 560,["489"] = 561,["492"] = 562,["493"] = 563,["494"] = 564,["495"] = 565,["499"] = 569,["500"] = 570,["502"] = 571,["503"] = 572,["504"] = 572,["506"] = 573,["511"] = 560,["512"] = 578,["513"] = 579,["514"] = 580,["515"] = 581,["516"] = 581,["519"] = 583,["520"] = 584,["521"] = 585,["522"] = 585,["525"] = 587,["526"] = 578,["527"] = 590,["528"] = 591,["531"] = 592,["532"] = 593,["533"] = 594,["535"] = 597,["536"] = 597,["538"] = 597,["540"] = 598,["541"] = 599,["542"] = 590,["543"] = 602,["544"] = 607,["547"] = 608,["548"] = 609,["549"] = 610,["550"] = 611,["551"] = 612,["552"] = 602,["553"] = 615,["554"] = 624,["555"] = 624,["557"] = 625,["558"] = 625,["560"] = 626,["561"] = 615,["562"] = 629,["563"] = 630,["566"] = 631,["567"] = 632,["570"] = 633,["571"] = 634,["572"] = 629,["573"] = 637,["574"] = 638,["575"] = 639,["576"] = 640,["577"] = 641,["579"] = 643,["580"] = 643,["582"] = 644,["583"] = 646,["585"] = 647,["586"] = 648,["587"] = 648,["589"] = 649,["590"] = 650,["591"] = 651,["593"] = 653,["594"] = 654,["595"] = 655,["596"] = 656,["597"] = 657,["598"] = 658,["599"] = 659,["600"] = 660,["601"] = 661,["605"] = 663,["607"] = 664,["608"] = 665,["609"] = 665,["611"] = 666,["612"] = 667,["613"] = 668,["614"] = 669,["615"] = 670,["619"] = 672,["620"] = 637,["621"] = 675,["622"] = 676,["623"] = 677,["624"] = 678,["625"] = 679,["629"] = 683,["630"] = 675,["631"] = 686,["632"] = 687,["633"] = 687,["635"] = 688,["636"] = 689,["637"] = 689,["638"] = 689,["639"] = 689,["640"] = 689,["641"] = 689,["642"] = 689,["643"] = 696,["644"] = 696,["645"] = 696,["646"] = 696,["647"] = 696,["648"] = 696,["649"] = 696,["650"] = 696,["651"] = 696,["652"] = 696,["653"] = 707,["654"] = 711,["656"] = 713,["657"] = 713,["659"] = 714,["660"] = 686,["661"] = 722,["662"] = 723,["663"] = 724,["664"] = 724,["666"] = 725,["667"] = 726,["668"] = 726,["671"] = 727,["672"] = 727,["673"] = 728,["674"] = 728,["675"] = 728,["676"] = 728,["677"] = 728,["679"] = 727,["682"] = 730,["683"] = 722,["684"] = 733,["685"] = 734,["686"] = 736,["687"] = 740,["689"] = 742,["690"] = 743,["691"] = 733,["692"] = 746,["693"] = 747,["694"] = 748,["695"] = 748,["696"] = 748,["697"] = 749,["698"] = 750,["699"] = 752,["702"] = 763,["705"] = 764,["706"] = 765,["708"] = 766,["709"] = 766,["710"] = 767,["713"] = 766,["716"] = 770,["717"] = 771,["720"] = 778,["723"] = 773,["725"] = 774,["726"] = 774,["727"] = 774,["728"] = 774,["731"] = 775,["732"] = 776,["733"] = 776,["734"] = 776,["735"] = 776,["737"] = 776,["743"] = 780,["744"] = 746,["745"] = 783,["746"] = 784,["747"] = 785,["748"] = 785,["749"] = 785,["750"] = 786,["753"] = 787,["754"] = 788,["755"] = 789,["756"] = 792,["757"] = 783,["758"] = 795,["759"] = 797,["762"] = 802,["763"] = 803,["764"] = 804,["765"] = 805,["766"] = 806,["767"] = 807,["768"] = 808,["769"] = 809,["770"] = 809,["774"] = 812,["775"] = 813,["776"] = 813,["777"] = 813,["778"] = 813,["779"] = 813,["781"] = 795,["782"] = 816,["783"] = 817,["784"] = 823,["785"] = 824,["786"] = 824,["788"] = 825,["789"] = 825,["791"] = 826,["792"] = 826,["794"] = 827,["795"] = 828,["797"] = 830,["798"] = 830,["801"] = 832,["802"] = 816,["803"] = 835,["804"] = 836,["805"] = 837,["808"] = 838,["809"] = 839,["810"] = 840,["811"] = 841,["812"] = 842,["813"] = 843,["814"] = 844,["816"] = 846,["817"] = 849,["818"] = 850,["821"] = 835,["822"] = 855,["823"] = 856,["824"] = 857,["825"] = 858,["826"] = 859,["827"] = 861,["830"] = 874,["833"] = 879,["834"] = 880,["835"] = 881,["837"] = 882,["838"] = 882,["839"] = 883,["842"] = 882,["845"] = 886,["846"] = 887,["848"] = 888,["849"] = 888,["850"] = 888,["851"] = 888,["854"] = 889,["855"] = 890,["856"] = 893,["857"] = 894,["858"] = 894,["860"] = 895,["862"] = 895,["865"] = 896,["866"] = 897,["867"] = 855,["868"] = 900,["869"] = 901,["870"] = 902,["873"] = 903,["874"] = 906,["875"] = 907,["877"] = 900,["878"] = 911,["879"] = 912,["882"] = 913,["883"] = 914,["884"] = 915,["885"] = 916,["886"] = 917,["887"] = 917,["889"] = 918,["890"] = 919,["891"] = 920,["892"] = 921,["893"] = 921,["895"] = 922,["896"] = 923,["897"] = 924,["898"] = 925,["899"] = 925,["902"] = 927,["903"] = 928,["905"] = 911,["906"] = 934,["907"] = 935,["910"] = 936,["913"] = 937,["914"] = 938,["915"] = 939,["916"] = 940,["917"] = 941,["918"] = 942,["919"] = 943,["921"] = 945,["922"] = 949,["923"] = 949,["924"] = 949,["925"] = 949,["926"] = 949,["927"] = 949,["928"] = 949,["929"] = 949,["930"] = 949,["931"] = 949,["932"] = 949,["933"] = 961,["934"] = 962,["936"] = 966,["937"] = 967,["938"] = 968,["939"] = 968,["940"] = 968,["941"] = 968,["942"] = 968,["943"] = 968,["944"] = 968,["946"] = 976,["947"] = 934,["948"] = 979,["949"] = 980,["952"] = 981,["953"] = 983,["954"] = 988,["955"] = 989,["956"] = 990,["957"] = 990,["958"] = 990,["959"] = 990,["960"] = 990,["961"] = 990,["962"] = 990,["966"] = 1000,["967"] = 1001,["968"] = 979,["969"] = 93,["970"] = 94,["971"] = 95,["972"] = 96,["973"] = 97,["974"] = 98,["975"] = 99,["976"] = 100,["977"] = 101,["978"] = 102,["979"] = 103,["980"] = 104,["981"] = 105,["982"] = 106,["983"] = 107,["984"] = 108,["985"] = 109,["986"] = 110,["987"] = 111,["988"] = 112,["989"] = 115,["990"] = 116,["991"] = 117,["992"] = 118,["993"] = 119,["994"] = 120,["995"] = 121,["996"] = 123,["997"] = 124});
local ____exports = {}
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____api_2Elocal_game_auth = require("api.local_game_auth")
local LocalGameAuth = ____api_2Elocal_game_auth.LocalGameAuth
local ____client_2Dapi_2Dcodec = require("api.client-api-codec")
local ClientApiCodec = ____client_2Dapi_2Dcodec.ClientApiCodec
____exports.ClientApiTransport = __TS__Class()
local ClientApiTransport = ____exports.ClientApiTransport
ClientApiTransport.name = "ClientApiTransport"
function ClientApiTransport.prototype.____constructor(self)
end
function ClientApiTransport.RegisterListeners(self)
    if self.registered then
        return
    end
    self.registered = true
    self.relayEpoch = RandomInt(100000000, 999999999)
    CustomGameEventManager:RegisterListener(
        "client_api_start_chunk",
        function(_userId, event) return self:OnStartChunk(event) end
    )
    CustomGameEventManager:RegisterListener(
        "client_api_start_failure",
        function(_userId, event) return self:OnStartFailure(event) end
    )
    CustomGameEventManager:RegisterListener(
        "client_api_game_end_ack",
        function(_userId, event) return self:OnGameEndAck(event) end
    )
    CustomGameEventManager:RegisterListener(
        "client_api_relay_response_chunk",
        function(_userId, event) return self:OnRelayResponseChunk(event) end
    )
    CustomGameEventManager:RegisterListener(
        "client_api_relay_failure",
        function(_userId, event) return self:OnRelayFailure(event) end
    )
    CustomGameEventManager:RegisterListener(
        "client_api_transport_ack",
        function(_userId, event) return self:OnTransportAck(event) end
    )
    CustomGameEventManager:RegisterListener(
        "client_api_transport_ready",
        function(_userId, event) return self:OnTransportReady(event) end
    )
    CustomGameEventManager:RegisterListener(
        "client_api_transport_heartbeat",
        function(_userId, event) return self:OnTransportHeartbeat(event) end
    )
    CustomGameEventManager:RegisterListener(
        "omg_gate_trace",
        function(_userId, event) return self:OnGateTrace(event) end
    )
    Timers:CreateTimer({
        endTime = self.RELAY_MONITOR_SECONDS,
        useGameTime = false,
        callback = function()
            self:MaintainRelayPool()
            return self.RELAY_MONITOR_SECONDS
        end
    })
end
function ClientApiTransport.SetRelayEnabled(self, enabled)
    self.relayEnabled = enabled
end
function ClientApiTransport.IsRelayEnabled(self)
    return self.relayEnabled
end
function ClientApiTransport.TrySendApiRequest(self, apiParameter, forceClientRelay)
    if forceClientRelay == nil then
        forceClientRelay = false
    end
    if not self:IsGenericRelayRequest(
        string.upper(apiParameter.method),
        apiParameter.path
    ) then
        return false
    end
    if not self.relayEnabled and not forceClientRelay then
        return false
    end
    if forceClientRelay then
        self.relayEnabled = true
    end
    self:SendApiRequest(apiParameter)
    return true
end
function ClientApiTransport.SendApiRequest(self, apiParameter)
    print((("[ClientApiTransport] relay request: method=" .. apiParameter.method) .. ", path=") .. apiParameter.path)
    local credential = self:ResolveRelayCredential()
    if not credential then
        local ____this_1
        ____this_1 = apiParameter
        local ____opt_0 = ____this_1.failureFunc
        if ____opt_0 ~= nil then
            ____opt_0(____this_1, "client relay credential unavailable")
        end
        return
    end
    local ____self_2, ____relayGeneration_3 = self, "relayGeneration"
    local ____self_relayGeneration_4 = ____self_2[____relayGeneration_3] + 1
    ____self_2[____relayGeneration_3] = ____self_relayGeneration_4
    local requestId = (("api_" .. tostring(____self_relayGeneration_4)) .. "_") .. tostring(RandomInt(100000000, 999999999))
    local queryJson = json.encode(apiParameter.querys or ({}))
    local bodyJson = apiParameter.body == nil and "null" or json.encode(apiParameter.body)
    local envelope = ((("{\"query\":" .. queryJson) .. ",\"body\":") .. bodyJson) .. "}"
    local encoded = ClientApiCodec:Encode(envelope)
    self:Trace(string.format("RELAY_QUEUE id=%s method=%s path=%s bytes=%d", requestId, string.upper(apiParameter.method), apiParameter.path, #encoded), "#FFCC66")
    local chunks = ClientApiCodec:Chunk(encoded, self.RELAY_REQUEST_CHUNK_SIZE)
    local method = string.upper(apiParameter.method)
    local signature = LocalGameAuth:HmacSha256Hex(credential.secret, (((((("OMG2|relay|" .. requestId) .. "|") .. method) .. "|") .. apiParameter.path) .. "|") .. encoded)
    local timeout = math.max(apiParameter.timeoutSeconds or 0, self.RELAY_TIMEOUT_SECONDS)
    self.relayResponses[requestId] = {
        requestId = requestId,
        method = method,
        path = apiParameter.path,
        requestChunks = chunks,
        signature = signature,
        requestBytes = #encoded,
        deadlineAt = Time() + timeout,
        complete = false,
        chunks = {},
        success = apiParameter.successFunc,
        failure = apiParameter.failureFunc
    }
    Timers:CreateTimer({
        endTime = timeout,
        useGameTime = false,
        callback = function()
            local pending = self.relayResponses[requestId]
            if not pending or pending.complete then
                return
            end
            print((((((("[ClientApiTransport] relay timeout: requestId=" .. requestId) .. ", method=") .. pending.method) .. ", path=") .. pending.path) .. ", timeout=") .. tostring(timeout))
            self:CompleteRelayFailure(pending, "client relay timeout")
        end
    })
    local pending = self.relayResponses[requestId]
    if self:HasAssignedRelayWork() or not self:DispatchRelayRequest(pending) then
        self:EnqueueRelayRequest(pending)
    end
end
function ClientApiTransport.Chat(self, message, color)
    if GameRules == nil or GameRules.SendCustomMessage == nil then
        return
    end
    GameRules:SendCustomMessage("<font color='" .. (color or "#66CCFF") .. "'>[Gate] " .. message .. "</font>", 0, 0)
end
function ClientApiTransport.Trace(self, message, color)
    self:Chat("TRACE " .. string.format("%.1f", Time()) .. " " .. message, color or "#AADDFF")
end
function ClientApiTransport.OnGateTrace(self, event)
    if event.PlayerID == nil then
        return
    end
    local playerId = tonumber(event.PlayerID) or -1
    local stage = tostring(event.stage or "TRACE")
    local info = tostring(event.info or "")
    print("[GateTrace] p=" .. tostring(playerId) .. " " .. stage .. " " .. info)
    local shortInfo = #info > 200 and (string.sub(info, 1, 197) .. "...") or info
    local color = "#AADDFF"
    if string.find(stage, "FAIL", nil, true) or string.find(stage, "TIMEOUT", nil, true) or string.find(stage, "BAD", nil, true) then
        color = "#FF5555"
    elseif string.find(stage, "CHUNK", nil, true) or string.find(stage, "LOADED", nil, true) or string.find(stage, "RESP", nil, true) then
        color = "#66FF99"
    elseif string.find(stage, "URL", nil, true) or string.find(stage, "RELAY", nil, true) then
        color = "#FFCC66"
    end
    self:Trace(stage .. " p=" .. tostring(playerId) .. " " .. shortInfo, color)
end
function ClientApiTransport.SendGameStartRequest(self, playerId, steamId, matchId, randomDraftValue, credential, generation)
    local player = PlayerResource:GetPlayer(playerId)
    if not player then
        return false
    end
    local key = tostring(playerId)
    local previous = self.startPending[key]
    local attempts = previous and previous.attempts or 0
    -- game-start-v2.html is keyed by requestId on the backend. A shared
    -- id makes every player after the first receive an empty/stale page
    -- and time out on chunk 0, so give each player its own id.
    local requestId = (((matchId .. "_") .. tostring(generation)) .. "_") .. tostring(RandomInt(100000, 999999))
    self.startPending[key] = {
        requestId = requestId,
        chunks = {},
        complete = false,
        success = false,
        attempts = attempts + 1
    }
    local playerSignature = LocalGameAuth:HmacSha256Hex(
        credential.secret,
        (((((("OMG2|start|" .. requestId) .. "|") .. tostring(steamId)) .. "|") .. matchId) .. "|") .. tostring(randomDraftValue)
    )
    local payload = {
        requestId = requestId,
        steamId = steamId,
        matchId = matchId,
        randomDraftMode = randomDraftValue,
        signature = playerSignature,
        backendUrl = self.BACKEND_URL
    }
    print(("[ClientApiTransport] game/start request sent: playerId=" .. tostring(playerId)) .. ", requestId=" .. requestId)
    print(
        ((((("[ClientApiTransport] game/start sign: playerId=" .. tostring(playerId)) .. ", key=") .. tostring(credential.source)) .. ", signature=") .. playerSignature) .. ((", backend=" .. tostring(self.BACKEND_URL)))
    )
    self:Chat(
        (((("SEND player=" .. tostring(playerId)) .. ((", req=" .. requestId) .. ((", try=" .. tostring(attempts + 1)) .. ("/" .. tostring(self.GATE_START_MAX_ATTEMPTS))))) .. ", key=") .. tostring(credential.source)),
        "#66CCFF"
    )
    self:Trace(string.format(
        "SERVER_SEND p=%s req=%s src=%s sig=%s path=/api/panorama/game-start-v2.html?requestId=%s&steamId=%s&matchId=%s&randomDraftMode=%s&chunk=0",
        tostring(playerId), requestId, tostring(credential.source), playerSignature, requestId, tostring(steamId), matchId, tostring(randomDraftValue)
    ), "#66CCFF")
    CustomGameEventManager:Send_ServerToPlayer(player, "client_api_start_request", payload)
    Timers:CreateTimer({
        endTime = 1,
        useGameTime = false,
        callback = function()
            local pending = self.startPending[key]
            if not pending or pending.requestId ~= requestId or pending.complete or pending.acknowledged then
                return nil
            end
            CustomGameEventManager:Send_ServerToPlayer(player, "client_api_start_request", payload)
            return 1
        end
    })
    return true
end
function ClientApiTransport.FetchGameStart(self, players, matchId, randomDraftMode, success, failure, expectedPlayers, timeoutSeconds)
    print((("[ClientApiTransport] game/start relay: players=" .. tostring(#players)) .. ", matchId=") .. matchId)
    self.gateExpectedPlayers = expectedPlayers or 0
    self.gateTimeoutSeconds = timeoutSeconds or 0
    if self.gateExpectedPlayers > 0 then
        local waitSeconds = self.gateTimeoutSeconds > 0 and self.gateTimeoutSeconds or self.START_TIMEOUT_SECONDS
        self:Chat(
            (((("WAIT expected=" .. tostring(self.gateExpectedPlayers)) .. ", timeout=") .. tostring(waitSeconds)) .. "s, connected=") .. tostring(#players),
            "#FFDD55"
        )
    end
    local ____self_5, ____startGeneration_6 = self, "startGeneration"
    local ____self_startGeneration_7 = ____self_5[____startGeneration_6] + 1
    ____self_5[____startGeneration_6] = ____self_startGeneration_7
    local generation = ____self_startGeneration_7
    local credential = self:ResolveRelayCredential()
    if not credential then
        failure(nil, "signing_credential_unavailable")
        return
    end
    local randomDraftValue = randomDraftMode and 1 or 0
    self.startPending = {}
    self.startResults = {}
    self.startExpected = #players
    if self.gateExpectedPlayers > 0 then
        self.startExpected = self.gateExpectedPlayers
    end
    self.startFinished = 0
    self.startSuccess = success
    self.startFailure = failure
    for ____, entry in ipairs(players) do
        do
            if not self:SendGameStartRequest(entry.playerId, entry.steamId, matchId, randomDraftValue, credential, generation) and self.gateExpectedPlayers <= 0 then
                self.startFinished = self.startFinished + 1
            end
        end
    end
    if #players == 0 and self.gateExpectedPlayers <= 0 then
        failure(nil, "no_players")
        return
    end
    self:TryFinishStart(generation, false)
    local waitSeconds = self.gateTimeoutSeconds > 0 and self.gateTimeoutSeconds or self.START_TIMEOUT_SECONDS
    print((("[ClientApiTransport] game/start gate: expected=" .. tostring(self.gateExpectedPlayers)) .. ", timeout=") .. tostring(waitSeconds))
    Timers:CreateTimer({
        endTime = waitSeconds,
        useGameTime = false,
        callback = function() return self:TryFinishStart(generation, true) end
    })
    if self.gateExpectedPlayers > 0 then
        Timers:CreateTimer({
            endTime = 2,
            useGameTime = false,
            callback = function()
                if generation ~= self.startGeneration or not self.startSuccess then
                    return nil
                end
                if #self.startResults >= self.gateExpectedPlayers then
                    return nil
                end
                PlayerHelper:ForEachPlayer(function(____, playerId)
                    if generation ~= self.startGeneration or not self.startSuccess then
                        return
                    end
                    if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
                        return
                    end
                    local key = tostring(playerId)
                    local pending = self.startPending[key]
                    local attempts = pending and pending.attempts or 0
                    local needSend = not pending or pending.complete and not pending.success and attempts < self.GATE_START_MAX_ATTEMPTS
                    if needSend then
                        local steamId = PlayerResource:GetSteamAccountID(playerId)
                        if self:SendGameStartRequest(playerId, steamId, matchId, randomDraftValue, credential, generation) then
                            print((("[ClientApiTransport] game/start gate player added/retried: playerId=" .. tostring(playerId)) .. ", attempts=") .. tostring(attempts + 1))
                            self:Chat(
                                (((attempts > 0) and "RETRY " or "LATE ") .. "player=") .. (tostring(playerId) .. (", try=" .. (tostring(attempts + 1) .. ("/" .. tostring(self.GATE_START_MAX_ATTEMPTS))))),
                                "#FFDD55"
                            )
                        end
                    end
                end)
                return 2
            end
        })
    end
end
function ClientApiTransport.SendGameEnd(self, gameEndDto, success, failure)
    print("[ClientApiTransport] game/end relay: matchId=" .. gameEndDto.matchId)
    local credential = self:ResolveRelayCredential()
    if not credential then
        failure(nil, "signing_credential_unavailable")
        return
    end
    local encoded = ClientApiCodec:Encode(json.encode(gameEndDto))
    local chunks = ClientApiCodec:Chunk(encoded, self.END_CHUNK_SIZE)
    local uploadId = (gameEndDto.matchId .. "_") .. tostring(RandomInt(100000000, 999999999))
    local signatures = {}
    do
        local index = 0
        while index < #chunks do
            signatures[#signatures + 1] = LocalGameAuth:HmacSha256Hex(
                credential.secret,
                (((((uploadId .. "|") .. tostring(index)) .. "|") .. tostring(#chunks)) .. "|") .. chunks[index + 1]
            )
            index = index + 1
        end
    end
    self.endUploads[uploadId] = {
        complete = false,
        chunks = chunks,
        signatures = signatures,
        deadlineAt = Time() + self.END_TIMEOUT_SECONDS,
        success = success,
        failure = failure
    }
    if not self:HasAssignedRelayWork() then
        self:DispatchEndUpload(uploadId, self.endUploads[uploadId])
    end
    Timers:CreateTimer({
        endTime = self.END_TIMEOUT_SECONDS,
        useGameTime = false,
        callback = function()
            local pending = self.endUploads[uploadId]
            if pending and not pending.complete then
                self:CompleteEndFailure(uploadId, pending, "timeout")
            end
        end
    })
end
function ClientApiTransport.ResolveRelayPlayer(self)
    if self.primaryPlayerId ~= nil then
        local primary = self.relayPeers[tostring(self.primaryPlayerId)]
        local player = PlayerResource:GetPlayer(self.primaryPlayerId)
        if primary and player and self:IsRelayPeerUsable(primary) then
            return {playerId = self.primaryPlayerId, player = player, peer = primary}
        end
        self.primaryPlayerId = nil
    end
    local result
    PlayerHelper:ForEachPlayer(function(____, playerId)
        local peer = self.relayPeers[tostring(playerId)]
        local player = PlayerResource:GetPlayer(playerId)
        if not peer or not player or not self:IsRelayPeerUsable(peer) then
            return
        end
        if not result or peer.consecutiveFailures < result.peer.consecutiveFailures or peer.consecutiveFailures == result.peer.consecutiveFailures and playerId < result.playerId then
            result = {playerId = playerId, player = player, peer = peer}
        end
    end)
    if result then
        self.primaryPlayerId = result.playerId
        print((("[ClientApiTransport] primary relay selected: playerId=" .. tostring(result.playerId)) .. ", failures=") .. tostring(result.peer.consecutiveFailures))
    end
    return result
end
function ClientApiTransport.IsRelayPeerUsable(self, peer)
    if peer.cooldownUntil > Time() then
        return false
    end
    if not peer.legacy and peer.leaseExpiresAt <= Time() then
        return false
    end
    if not PlayerResource:IsValidPlayer(peer.playerId) then
        return false
    end
    if not PlayerHelper:IsHumanPlayerByPlayerId(peer.playerId) then
        return false
    end
    if PlayerResource:GetSteamAccountID(peer.playerId) <= 0 then
        return false
    end
    local state = PlayerResource:GetConnectionState(peer.playerId)
    return state == DOTA_CONNECTION_STATE_CONNECTED or state == DOTA_CONNECTION_STATE_LOADING
end
function ClientApiTransport.DispatchRelayRequest(self, pending)
    if pending.complete then
        return false
    end
    if pending.deadlineAt <= Time() then
        self:CompleteRelayFailure(pending, "client relay timeout")
        return false
    end
    local relay = self:ResolveRelayPlayer()
    if not relay then
        return false
    end
    self:RemoveQueuedRelayRequest(pending)
    local ____self_8, ____dispatchGeneration_9 = self, "dispatchGeneration"
    local ____self_dispatchGeneration_10 = ____self_8[____dispatchGeneration_9] + 1
    ____self_8[____dispatchGeneration_9] = ____self_dispatchGeneration_10
    local dispatchId = (("dispatch_" .. tostring(____self_dispatchGeneration_10)) .. "_") .. tostring(RandomInt(100000, 999999))
    pending.playerId = relay.playerId
    pending.leaseId = relay.peer.leaseId
    pending.dispatchId = dispatchId
    pending.strictDispatch = not relay.peer.legacy
    pending.acknowledged = false
    pending.status = nil
    pending.total = nil
    pending.chunks = {}
    self:Trace(string.format("RELAY_DISPATCH id=%s dispatch=%s to=p%s path=%s", pending.requestId, dispatchId, tostring(relay.playerId), pending.path), "#FFCC66")
    local function sendChunks()
        local active = self.relayResponses[pending.requestId]
        if not active or active.complete or active.dispatchId ~= dispatchId then
            return
        end
        do
            local index = 0
            while index < #pending.requestChunks do
                CustomGameEventManager:Send_ServerToPlayer(relay.player, "client_api_relay_request_chunk", {
                    requestId = pending.requestId,
                    method = pending.method,
                    path = pending.path,
                    index = index,
                    total = #pending.requestChunks,
                    data = pending.requestChunks[index + 1],
                    signature = pending.signature,
                    backendUrl = self.BACKEND_URL,
                    dispatchId = dispatchId,
                    leaseId = relay.peer.leaseId
                })
                index = index + 1
            end
        end
    end
    sendChunks(nil)
    Timers:CreateTimer({
        endTime = 1,
        useGameTime = false,
        callback = function()
            local active = self.relayResponses[pending.requestId]
            if not active or active.complete or active.dispatchId ~= dispatchId or active.acknowledged then
                return nil
            end
            sendChunks(nil)
            return 1
        end
    })
    Timers:CreateTimer({
        endTime = self.RELAY_DISPATCH_ACK_SECONDS,
        useGameTime = false,
        callback = function()
            local active = self.relayResponses[pending.requestId]
            if not active or active.complete or active.dispatchId ~= dispatchId or active.acknowledged then
                return
            end
            self:HandleRelayPlayerFailure(relay.playerId, "relay_ack_timeout")
        end
    })
    return true
end
function ClientApiTransport.DispatchEndUpload(self, uploadId, pending)
    if pending.complete then
        return false
    end
    if pending.deadlineAt <= Time() then
        self:CompleteEndFailure(uploadId, pending, "timeout")
        return false
    end
    local relay = self:ResolveRelayPlayer()
    if not relay then
        return false
    end
    local ____self_11, ____dispatchGeneration_12 = self, "dispatchGeneration"
    local ____self_dispatchGeneration_13 = ____self_11[____dispatchGeneration_12] + 1
    ____self_11[____dispatchGeneration_12] = ____self_dispatchGeneration_13
    local dispatchId = (("dispatch_" .. tostring(____self_dispatchGeneration_13)) .. "_") .. tostring(RandomInt(100000, 999999))
    pending.playerId = relay.playerId
    pending.leaseId = relay.peer.leaseId
    pending.dispatchId = dispatchId
    pending.strictDispatch = not relay.peer.legacy
    pending.acknowledged = false
    local function sendChunks()
        local active = self.endUploads[uploadId]
        if not active or active.complete or active.dispatchId ~= dispatchId then
            return
        end
        do
            local index = 0
            while index < #pending.chunks do
                CustomGameEventManager:Send_ServerToPlayer(relay.player, "client_api_game_end_chunk", {
                    uploadId = uploadId,
                    index = index,
                    total = #pending.chunks,
                    data = pending.chunks[index + 1],
                    signature = pending.signatures[index + 1],
                    backendUrl = self.BACKEND_URL,
                    dispatchId = dispatchId,
                    leaseId = relay.peer.leaseId
                })
                index = index + 1
            end
        end
    end
    sendChunks(nil)
    Timers:CreateTimer({
        endTime = 1,
        useGameTime = false,
        callback = function()
            local active = self.endUploads[uploadId]
            if not active or active.complete or active.dispatchId ~= dispatchId or active.acknowledged then
                return nil
            end
            sendChunks(nil)
            return 1
        end
    })
    Timers:CreateTimer({
        endTime = self.RELAY_DISPATCH_ACK_SECONDS,
        useGameTime = false,
        callback = function()
            local active = self.endUploads[uploadId]
            if not active or active.complete or active.dispatchId ~= dispatchId or active.acknowledged then
                return
            end
            self:HandleRelayPlayerFailure(relay.playerId, "game_end_ack_timeout")
        end
    })
    return true
end
function ClientApiTransport.EnqueueRelayRequest(self, pending)
    if pending.complete or pending.queued then
        return
    end
    if #self.relayQueue >= self.RELAY_QUEUE_MAX_JOBS or self.relayQueueBytes + pending.requestBytes > self.RELAY_QUEUE_MAX_BYTES then
        self:CompleteRelayFailure(pending, "client relay queue full")
        return
    end
    pending.playerId = nil
    pending.leaseId = nil
    pending.dispatchId = nil
    pending.strictDispatch = nil
    pending.acknowledged = false
    pending.queued = true
    local ____self_relayQueue_14 = self.relayQueue
    ____self_relayQueue_14[#____self_relayQueue_14 + 1] = pending.requestId
    self.relayQueueBytes = self.relayQueueBytes + pending.requestBytes
    print((((("[ClientApiTransport] relay queued: requestId=" .. pending.requestId) .. ", jobs=") .. tostring(#self.relayQueue)) .. ", bytes=") .. tostring(self.relayQueueBytes))
end
function ClientApiTransport.RemoveQueuedRelayRequest(self, pending)
    if not pending.queued then
        return
    end
    pending.queued = false
    self.relayQueueBytes = math.max(0, self.relayQueueBytes - pending.requestBytes)
    local nextQueue = {}
    for ____, requestId in ipairs(self.relayQueue) do
        if requestId ~= pending.requestId then
            nextQueue[#nextQueue + 1] = requestId
        end
    end
    self.relayQueue = nextQueue
end
function ClientApiTransport.DrainRelayQueues(self)
    if self:HasAssignedRelayWork() then
        return
    end
    for uploadId in pairs(self.endUploads) do
        local pending = self.endUploads[uploadId]
        if not pending.complete and pending.playerId == nil then
            self:DispatchEndUpload(uploadId, pending)
            return
        end
    end
    local queued = {unpack(self.relayQueue)}
    for ____, requestId in ipairs(queued) do
        do
            local pending = self.relayResponses[requestId]
            if not pending or pending.complete then
                goto __continue88
            end
            self:DispatchRelayRequest(pending)
            return
        end
        ::__continue88::
    end
end
function ClientApiTransport.HasAssignedRelayWork(self)
    for uploadId in pairs(self.endUploads) do
        local pending = self.endUploads[uploadId]
        if not pending.complete and pending.playerId ~= nil then
            return true
        end
    end
    for requestId in pairs(self.relayResponses) do
        local pending = self.relayResponses[requestId]
        if not pending.complete and pending.playerId ~= nil then
            return true
        end
    end
    return false
end
function ClientApiTransport.CompleteRelayFailure(self, pending, reason)
    if pending.complete then
        return
    end
    pending.complete = true
    self:RemoveQueuedRelayRequest(pending)
    print((((((("[ClientApiTransport] relay failed: requestId=" .. pending.requestId) .. ", method=") .. pending.method) .. ", path=") .. pending.path) .. ", reason=") .. reason)
    self:Trace(string.format("RELAY_FAIL id=%s path=%s reason=%s", pending.requestId, pending.path, tostring(reason)), "#FF5555")
    local ____this_16
    ____this_16 = pending
    local ____opt_15 = ____this_16.failure
    if ____opt_15 ~= nil then
        ____opt_15(____this_16, reason)
    end
    __TS__Delete(self.relayResponses, pending.requestId)
    self:DrainRelayQueues()
end
function ClientApiTransport.CompleteEndFailure(self, uploadId, pending, reason)
    if pending.complete then
        return
    end
    pending.complete = true
    print((("[ClientApiTransport] game/end relay failed: uploadId=" .. uploadId) .. ", reason=") .. reason)
    pending:failure(reason)
    __TS__Delete(self.endUploads, uploadId)
    self:DrainRelayQueues()
end
function ClientApiTransport.MatchesDispatch(self, event, pending)
    if pending.playerId ~= event.PlayerID then
        return false
    end
    if not pending.strictDispatch then
        return true
    end
    return pending.dispatchId == event.dispatchId and pending.leaseId == event.leaseId
end
function ClientApiTransport.MarkRelaySuccess(self, playerId)
    if playerId == nil then
        return
    end
    local peer = self.relayPeers[tostring(playerId)]
    if not peer then
        return
    end
    peer.consecutiveFailures = 0
    peer.cooldownUntil = 0
end
function ClientApiTransport.HandleRelayPlayerFailure(self, playerId, reason)
    local peer = self.relayPeers[tostring(playerId)]
    if peer ~= nil then
        peer.consecutiveFailures = peer.consecutiveFailures + 1
        peer.cooldownUntil = Time() + self.RELAY_COOLDOWN_SECONDS
    end
    if self.primaryPlayerId == playerId then
        self.primaryPlayerId = nil
    end
    print((("[ClientApiTransport] relay degraded: playerId=" .. tostring(playerId)) .. ", reason=") .. reason)
    for requestId in pairs(self.relayResponses) do
        do
            local pending = self.relayResponses[requestId]
            if pending.complete or pending.playerId ~= playerId then
                goto __continue111
            end
            if pending.method ~= "GET" then
                self:CompleteRelayFailure(pending, "relay lost after dispatch: " .. reason)
                goto __continue111
            end
            pending.playerId = nil
            pending.leaseId = nil
            pending.dispatchId = nil
            pending.strictDispatch = nil
            pending.acknowledged = false
            pending.status = nil
            pending.total = nil
            pending.chunks = {}
            self:EnqueueRelayRequest(pending)
        end
        ::__continue111::
    end
    for uploadId in pairs(self.endUploads) do
        do
            local pending = self.endUploads[uploadId]
            if pending.complete or pending.playerId ~= playerId then
                goto __continue115
            end
            pending.playerId = nil
            pending.leaseId = nil
            pending.dispatchId = nil
            pending.strictDispatch = nil
            pending.acknowledged = false
        end
        ::__continue115::
    end
    self:DrainRelayQueues()
end
function ClientApiTransport.MaintainRelayPool(self)
    if self.primaryPlayerId ~= nil then
        local primary = self.relayPeers[tostring(self.primaryPlayerId)]
        if not primary or not self:IsRelayPeerUsable(primary) then
            self:HandleRelayPlayerFailure(self.primaryPlayerId, "relay_lease_or_connection_lost")
            return
        end
    end
    self:DrainRelayQueues()
end
function ClientApiTransport.IsGenericRelayRequest(self, method, path)
    if method ~= "GET" and method ~= "POST" and method ~= "PUT" then
        return false
    end
    local putPaths = {"/player/property", "/player/properties"}
    local getPaths = {
        "/showcase/profile",
        "/showcase/catalog",
        "/activity/tasks",
        "/player/ranking",
        "/activity/current"
    }
    local postPaths = {
        "/player/property/reset",
        "/showcase/purchase",
        "/showcase/random-box/open",
        "/showcase/random-box/claim",
        "/showcase/awakening/activate",
        "/showcase/awakening/lottery-pool/unlock-random",
        "/game/treasure/prepare",
        "/game/treasure/claim"
    }
    if method == "PUT" and __TS__ArrayIncludes(putPaths, path) or method == "GET" and __TS__ArrayIncludes(getPaths, path) or method == "POST" and __TS__ArrayIncludes(postPaths, path) then
        return true
    end
    if not __TS__StringStartsWith(path, "/player/") then
        return false
    end
    return method == "GET" and self:IsSteamPlayerPath(path, "/property-panel") or method == "POST" and self:IsSteamPlayerPath(path, "/rookie-gift/claim") or (method == "GET" or method == "PUT") and self:IsSteamPlayerPath(path, "/setting") or method == "GET" and self:IsSteamPlayerPath(path, "/info")
end
function ClientApiTransport.IsSteamPlayerPath(self, path, suffix)
    local prefix = "/player/"
    if not __TS__StringStartsWith(path, prefix) or not __TS__StringEndsWith(path, suffix) then
        return false
    end
    local steamId = __TS__StringSubstring(path, #prefix, #path - #suffix)
    if #steamId < 1 or #steamId > 20 then
        return false
    end
    do
        local index = 0
        while index < #steamId do
            if not __TS__StringIncludes(
                "0123456789",
                __TS__StringSubstring(steamId, index, index + 1)
            ) then
                return false
            end
            index = index + 1
        end
    end
    return true
end
function ClientApiTransport.ResolveRelayCredential(self)
    -- Read-only GET check: /api/panorama/game-start-v2.html accepts an HMAC
    -- made with the addon's LOCAL_GAME_API_SECRET and returns a valid
    -- "OMG1|start|..." title. Prefer it: on -insecure dedicated servers the
    -- "v2" key can be a local value the backend does not know, so every chunk
    -- request comes back 400 and the client reports chunk_0_timeout.
    local localSecret = LocalGameAuth:GetSecret()
    if localSecret then
        return {secret = localSecret, source = "local"}
    end
    local dedicatedKey = GetDedicatedServerKeyV3("v2")
    if type(dedicatedKey) == "string" and #dedicatedKey > 0 and (string.find(dedicatedKey, "Invalid_", nil, true) or 0) - 1 ~= 0 then
        return {secret = dedicatedKey, source = "dedicated"}
    end
    return nil
end
function ClientApiTransport.OnStartChunk(self, event)
    local playerId = event.PlayerID
    local ____self_startPending_19 = self.startPending
    local ____opt_17 = playerId
    local pending = ____self_startPending_19[____opt_17 and tostring(playerId) or ""]
    local index = __TS__Number(event.index)
    local total = __TS__Number(event.total)
    if not pending or pending.complete or event.requestId ~= pending.requestId or total <= 0 or total > 128 or index < 0 or index >= total then
        return
    end
    if pending.total ~= nil and pending.total ~= total then
        return
    end
    pending.total = total
    pending.chunks[tostring(index)] = event.data
    if index == 0 or index + 1 == total or (index + 1) % 6 == 0 then
        self:Trace(string.format("CLIENT_CHUNK p=%s idx=%d/%d req=%s bytes=%d", tostring(playerId), index, total, pending.requestId, #tostring(event.data)), "#66FF99")
    end
    if index == 0 then
        self:Chat(
            (((("CHUNK0 player=" .. tostring(playerId)) .. ", total=") .. tostring(total)) .. ", req=") .. pending.requestId,
            "#66FF99"
        )
    end
    do
        local i = 0
        while i < total do
            if pending.chunks[tostring(i)] == nil then
                return
            end
            i = i + 1
        end
    end
    pending.complete = true
    pending.success = true
    self.startFinished = self.startFinished + 1
    local loadedText = ""
    if self.gateExpectedPlayers > 0 then
        loadedText = ", loaded=" .. tostring(#self.startResults + 1) .. "/" .. tostring(self.gateExpectedPlayers)
    end
    self:Chat(
        "LOADED player=" .. tostring(playerId) .. ", chunks=" .. tostring(total) .. "/" .. tostring(total) .. ", req=" .. pending.requestId .. loadedText,
        "#66FF99"
    )
    do
        local function ____catch(____error)
            print("[ClientApiTransport] invalid game/start response: " .. tostring(____error))
        end
        local ____try, ____hasReturned = pcall(function()
            local encoded = ""
            do
                local i = 0
                while i < total do
                    encoded = encoded .. pending.chunks[tostring(i)]
                    i = i + 1
                end
            end
            local decoded = (json.decode(ClientApiCodec:Decode(encoded)))
            local ____self_startResults_23 = self.startResults
            local ____temp_22 = decoded and decoded.data
            if ____temp_22 == nil then
                ____temp_22 = decoded
            end
            ____self_startResults_23[#____self_startResults_23 + 1] = ____temp_22
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    self:TryFinishStart(self.startGeneration, false)
end
function ClientApiTransport.OnStartFailure(self, event)
    local playerId = event.PlayerID
    local ____self_startPending_26 = self.startPending
    local ____opt_24 = playerId
    local pending = ____self_startPending_26[____opt_24 and tostring(playerId) or ""]
    if not pending or pending.complete or event.requestId ~= pending.requestId then
        return
    end
    pending.complete = true
    pending.success = false
    if self.gateExpectedPlayers <= 0 then
        self.startFinished = self.startFinished + 1
    end
    print((("[ClientApiTransport] game/start relay failed: player=" .. tostring(playerId)) .. ", reason=") .. event.reason)
    self:Trace(string.format("CLIENT_FAIL p=%s req=%s try=%d reason=%s", tostring(playerId), pending.requestId, pending.attempts or 1, tostring(event.reason)), "#FF5555")
    self:Chat(
        ("FAIL player=" .. tostring(playerId)) .. ((", req=" .. pending.requestId) .. ((", try=" .. tostring(pending.attempts or 1)) .. ("/" .. tostring(self.GATE_START_MAX_ATTEMPTS) .. (", reason=" .. tostring(event.reason))))),
        "#FF5555"
    )
    self:TryFinishStart(self.startGeneration, false)
end
function ClientApiTransport.TryFinishStart(self, generation, force)
    if generation ~= self.startGeneration or not force and self.startFinished < self.startExpected then
        return
    end
    local success = self.startSuccess
    local failure = self.startFailure
    self.startSuccess = nil
    self.startFailure = nil
    local required = self.gateExpectedPlayers or 0
    if required > 0 then
        local loaded = #self.startResults
        if loaded >= required then
            print(("[ClientApiTransport] game/start gate passed: loaded=" .. tostring(loaded)) .. ("/" .. tostring(required)))
            self:Trace(string.format("GATE_PASS loaded=%d/%d", loaded, required), "#66FF99")
            self:Chat("PASSED " .. tostring(loaded) .. "/" .. tostring(required) .. " - game starting", "#66FF99")
            if success ~= nil then
                success(nil, self:MergeStartResults(self.startResults))
            end
            return
        end
        local reason = force and "timeout" or "not_enough_players_loaded"
        print((((("[ClientApiTransport] game/start gate FAILED: loaded=" .. tostring(loaded)) .. "/") .. tostring(required)) .. ", reason=") .. reason)
        self:Trace(string.format("GATE_FAIL loaded=%d/%d reason=%s", loaded, required, reason), "#FF5555")
        self:Chat("FAILED " .. tostring(loaded) .. "/" .. tostring(required) .. ", reason=" .. reason, "#FF5555")
        if failure ~= nil then
            failure(nil, (reason .. ":") .. (tostring(loaded) .. ("/" .. tostring(required))))
        end
        return
    end
    if #self.startResults == 0 then
        local reason = force and "timeout" or "all_relays_failed"
        print("[ClientApiTransport] game/start relay failed: reason=" .. reason)
        if failure ~= nil then
            failure(nil, reason)
        end
        return
    end
    print("[ClientApiTransport] game/start relay succeeded: responses=" .. tostring(#self.startResults))
    if success ~= nil then
        success(
            nil,
            self:MergeStartResults(self.startResults)
        )
    end
end
function ClientApiTransport.MergeStartResults(self, results)
    local merged = {members = {}, players = {}, pointInfo = {}, lotteryRefreshExtraCounts = {}}
    for ____, result in ipairs(results) do
        if result.members then
            __TS__ArrayPushArray(merged.members, result.members)
        end
        if result.players then
            __TS__ArrayPushArray(merged.players, result.players)
        end
        if result.pointInfo then
            __TS__ArrayPushArray(merged.pointInfo, result.pointInfo)
        end
        if result.lotteryRefreshExtraCounts then
            __TS__ArrayPushArray(merged.lotteryRefreshExtraCounts, result.lotteryRefreshExtraCounts)
        end
        if not merged.ga4Config and result.ga4Config then
            merged.ga4Config = result.ga4Config
        end
    end
    return merged
end
function ClientApiTransport.OnGameEndAck(self, event)
    local pending = self.endUploads[event.uploadId]
    if not pending or pending.complete or not self:MatchesDispatch(event, pending) then
        return
    end
    if __TS__Number(event.success) == 1 then
        pending.complete = true
        self:MarkRelaySuccess(pending.playerId)
        print("[ClientApiTransport] game/end relay succeeded: uploadId=" .. event.uploadId)
        pending:success()
        __TS__Delete(self.endUploads, event.uploadId)
        self:DrainRelayQueues()
    else
        print((("[ClientApiTransport] game/end relay failed: uploadId=" .. event.uploadId) .. ", reason=") .. (event.reason or "rejected"))
        if pending.playerId ~= nil then
            self:HandleRelayPlayerFailure(pending.playerId, event.reason or "game_end_rejected")
        end
    end
end
function ClientApiTransport.OnRelayResponseChunk(self, event)
    local pending = self.relayResponses[event.requestId]
    local status = __TS__Number(event.status)
    local index = __TS__Number(event.index)
    local total = __TS__Number(event.total)
    if not pending or pending.complete or not self:MatchesDispatch(event, pending) or status < 100 or status > 599 or total < 1 or total > 1024 or index < 0 or index >= total then
        return
    end
    if pending.status ~= nil and pending.status ~= status or pending.total ~= nil and pending.total ~= total then
        return
    end
    pending.status = status
    pending.total = total
    pending.chunks[tostring(index)] = event.data
    do
        local i = 0
        while i < total do
            if pending.chunks[tostring(i)] == nil then
                return
            end
            i = i + 1
        end
    end
    pending.complete = true
    local encoded = ""
    do
        local i = 0
        while i < total do
            encoded = encoded .. pending.chunks[tostring(i)]
            i = i + 1
        end
    end
    local responseBody = ClientApiCodec:Decode(encoded)
    print((((((("[ClientApiTransport] relay response: requestId=" .. event.requestId) .. ", method=") .. pending.method) .. ", path=") .. pending.path) .. ", status=") .. tostring(status))
    self:Trace(string.format("CLIENT_RELAY_RESP id=%s status=%d path=%s", event.requestId, status, pending.path), "#66FF99")
    self:MarkRelaySuccess(pending.playerId)
    if status >= 200 and status < 300 then
        pending:success(responseBody)
    else
        local ____opt_31 = pending.failure
        if ____opt_31 ~= nil then
            ____opt_31(pending, responseBody)
        end
    end
    __TS__Delete(self.relayResponses, event.requestId)
    self:DrainRelayQueues()
end
function ClientApiTransport.OnRelayFailure(self, event)
    local pending = self.relayResponses[event.requestId]
    if not pending or pending.complete or not self:MatchesDispatch(event, pending) then
        return
    end
    print((((((("[ClientApiTransport] relay failure: requestId=" .. event.requestId) .. ", method=") .. pending.method) .. ", path=") .. pending.path) .. ", reason=") .. event.reason)
    self:Trace(string.format("CLIENT_RELAY_FAIL id=%s reason=%s", event.requestId, tostring(event.reason)), "#FF5555")
    if pending.playerId ~= nil then
        self:HandleRelayPlayerFailure(pending.playerId, event.reason)
    end
end
function ClientApiTransport.OnTransportAck(self, event)
    if event.PlayerID == nil then
        return
    end
    local accepted = false
    if event.kind == "start" then
        local pending = self.startPending[tostring(event.PlayerID)]
        accepted = (pending and pending.requestId) == event.requestId
        if accepted and pending then
            pending.acknowledged = true
        end
    elseif event.kind == "relay" then
        local pending = self.relayResponses[event.requestId]
        accepted = pending ~= nil and self:MatchesDispatch(event, pending)
        if accepted and pending then
            pending.acknowledged = true
        end
    elseif event.kind == "game_end" then
        local pending = self.endUploads[event.requestId]
        accepted = pending ~= nil and self:MatchesDispatch(event, pending)
        if accepted and pending then
            pending.acknowledged = true
        end
    end
    if accepted then
        print((((("[ClientApiTransport] client received: kind=" .. event.kind) .. ", requestId=") .. event.requestId) .. ", playerId=") .. tostring(event.PlayerID))
        self:Trace(string.format("CLIENT_ACK p=%s kind=%s req=%s", tostring(event.PlayerID), tostring(event.kind), tostring(event.requestId)), "#66CCFF")
    end
end
function ClientApiTransport.OnTransportReady(self, event)
    if event.PlayerID == nil then
        return
    end
    if not PlayerHelper:IsHumanPlayerByPlayerId(event.PlayerID) then
        return
    end
    local key = tostring(event.PlayerID)
    local protocolVersion = __TS__Number(event.protocolVersion or 1)
    local legacy = protocolVersion < self.RELAY_PROTOCOL_VERSION or not event.clientNonce
    local clientNonce = event.clientNonce or "legacy_" .. tostring(event.PlayerID)
    local existing = self.relayPeers[key]
    if existing and not legacy and existing.clientNonce ~= clientNonce then
        self:HandleRelayPlayerFailure(event.PlayerID, "relay_client_restarted")
    end
    local leaseId = existing and existing.clientNonce == clientNonce and existing.leaseId or (((("lease_" .. tostring(self.relayEpoch)) .. "_") .. tostring(event.PlayerID)) .. "_") .. tostring(RandomInt(100000, 999999))
    self.relayPeers[key] = {
        playerId = event.PlayerID,
        clientNonce = clientNonce,
        leaseId = leaseId,
        protocolVersion = protocolVersion,
        leaseExpiresAt = Time() + (legacy and 86400 or self.RELAY_LEASE_SECONDS),
        lastSeenAt = Time(),
        consecutiveFailures = existing and existing.clientNonce == clientNonce and existing.consecutiveFailures or 0,
        cooldownUntil = existing and existing.clientNonce == clientNonce and existing.cooldownUntil or 0,
        legacy = legacy
    }
    if not existing or existing.clientNonce ~= clientNonce then
        print((((("[ClientApiTransport] client ready: playerId=" .. tostring(event.PlayerID)) .. ", protocol=") .. tostring(protocolVersion)) .. ", legacy=") .. tostring(legacy))
    end
    local player = PlayerResource:GetPlayer(event.PlayerID)
    if player and not legacy then
        CustomGameEventManager:Send_ServerToPlayer(player, "client_api_transport_ready_ack", {
            protocolVersion = self.RELAY_PROTOCOL_VERSION,
            relayEpoch = self.relayEpoch,
            leaseId = leaseId,
            renewAfterSeconds = self.RELAY_RENEW_AFTER_SECONDS,
            accepted = 1
        })
    end
    self:DrainRelayQueues()
end
function ClientApiTransport.OnTransportHeartbeat(self, event)
    if event.PlayerID == nil then
        return
    end
    local peer = self.relayPeers[tostring(event.PlayerID)]
    if not peer or peer.legacy or __TS__Number(event.relayEpoch) ~= self.relayEpoch or event.leaseId ~= peer.leaseId then
        local player = PlayerResource:GetPlayer(event.PlayerID)
        if player and PlayerHelper:IsHumanPlayerByPlayerId(event.PlayerID) then
            CustomGameEventManager:Send_ServerToPlayer(player, "client_api_transport_ready_ack", {
                protocolVersion = self.RELAY_PROTOCOL_VERSION,
                relayEpoch = self.relayEpoch,
                leaseId = "",
                renewAfterSeconds = self.RELAY_RENEW_AFTER_SECONDS,
                accepted = 0
            })
        end
        return
    end
    peer.lastSeenAt = Time()
    peer.leaseExpiresAt = Time() + self.RELAY_LEASE_SECONDS
end
ClientApiTransport.BACKEND_URL = "https://wx.renoomgai.top/api/panorama"
ClientApiTransport.START_TIMEOUT_SECONDS = 15
ClientApiTransport.END_TIMEOUT_SECONDS = 30
ClientApiTransport.END_CHUNK_SIZE = 600
ClientApiTransport.RELAY_REQUEST_CHUNK_SIZE = 600
ClientApiTransport.RELAY_TIMEOUT_SECONDS = 45
ClientApiTransport.RELAY_PROTOCOL_VERSION = 2
ClientApiTransport.RELAY_LEASE_SECONDS = 30
ClientApiTransport.RELAY_RENEW_AFTER_SECONDS = 10
ClientApiTransport.RELAY_MONITOR_SECONDS = 2
ClientApiTransport.RELAY_COOLDOWN_SECONDS = 8
ClientApiTransport.RELAY_DISPATCH_ACK_SECONDS = 5
ClientApiTransport.RELAY_QUEUE_MAX_JOBS = 32
ClientApiTransport.RELAY_QUEUE_MAX_BYTES = 512 * 1024
ClientApiTransport.registered = false
ClientApiTransport.startGeneration = 0
ClientApiTransport.startPending = {}
ClientApiTransport.startResults = {}
ClientApiTransport.gateExpectedPlayers = 0
ClientApiTransport.gateTimeoutSeconds = 0
ClientApiTransport.GATE_START_MAX_ATTEMPTS = 3
ClientApiTransport.startExpected = 0
ClientApiTransport.startFinished = 0
ClientApiTransport.endUploads = {}
ClientApiTransport.relayEnabled = false
ClientApiTransport.relayGeneration = 0
ClientApiTransport.relayEpoch = 0
ClientApiTransport.dispatchGeneration = 0
ClientApiTransport.relayResponses = {}
ClientApiTransport.relayPeers = {}
ClientApiTransport.relayQueue = {}
ClientApiTransport.relayQueueBytes = 0
return ____exports
