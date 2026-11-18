# АКТУАЛЬНАЯ ЗАМЕТКА — два актуальных фикса (2026-11-18)

Читать ПЕРВЫМ, если пользователь пришёл после патча кастомки/игры.
Старые бэкапы и эксперименты удалены намеренно — не искать и не воскрешать.

Рабочая папка аддона:
`E:\SteamLibrary\steamapps\common\dota 2 beta\game\dota_addons\3564393242`

Папка бэкапа:
`E:\SteamLibrary\steamapps\common\dota 2 beta\game\dota_addons\_backup_3564393242\CURRENT_FIX`

VPK **не трогать**:
`E:\SteamLibrary\steamapps\workshop\content\570\3564393242\3564393242.vpk`

---

## 1. Первый фикс (подтверждён пользователем): разные `requestId` для игроков

### Суть бага
`Game:StartGame()` вызывается один раз. Раньше оба игрока получали одинаковый
`requestId`, например `0_1_259868`. Бэкенд ключёт `game-start-v2.html` по
`requestId`: первый игрок забирал все 21 чанк (только свой steamId), второй
получал пустую/stale-страницу → `chunk_0_timeout` → `responses=1`.

### Суть фикса
Генерация `requestId` перенесена в отдельную функцию
`ClientApiTransport.SendGameStartRequest`, то есть выполняется **для каждого
игрока отдельно**:

```lua
local requestId = (((matchId .. "_") .. tostring(generation)) .. "_") .. tostring(RandomInt(100000, 999999))
```

Подпись `OMG2|start|...` считается от этого же `requestId`. Формат id не
меняется (`matchId_generation_random`), `matchId` не меняется.

В логах признак: у `playerId=0` и `playerId=1` разные id, например
`0_1_665599` и `0_1_662770` / `0_1_854379`.

---

## 2. Второй фикс: настраиваемое ожидание загрузки всех игроков

### Где лежит конфиг
`scripts\vscripts\omg_loading_gate_config.lua` внутри папки аддона:

```lua
return {
    expected_players = 2,
    timeout_seconds = 120,
}
```

- `expected_players` — сколько игроков должны полностью догрузить чанки/картинки.
  `0` = гейт выключен, старое поведение.
- `timeout_seconds` — максимум секунд ожидания. Минимум 30; если меньше или
  кривое значение — будет 120.
- После правки конфига **перезапустить dedicated-сервер**.
- Читается через `pcall(require, "omg_loading_gate_config")`. Если файл битый
  или отсутствует, печатается `loading gate config invalid, using defaults:
  expected=2, timeout=120` и берутся значения 2/120 — гейт **не выключается
  молча**.
- Старый вариант `scripts\kv\omg_loading_gate.kv` удалён: `LoadKeyValues`
  дважды не смог его прочитать (сначала из-за кириллических комментариев, потом
  даже с ASCII), из-за чего гейт выключался с `expected=0`. KV **не возвращать**.
- Добавлять cvars в `gameindota_native_n7.cfg` **нельзя**: проба показала
  `Unknown command 'omg_probe_expected_players'!`. Dota не создаёт произвольные
  cvars из cfg. В серверном cfg сейчас только комментарий, указывающий на
  Lua-конфиг.

### Что делает гейт
1. `Game:GetLoadingGateConfig()` читает Lua-конфиг через `require`.
2. Если `expected_players > 0`:
   - печатается `[Game] loading gate enabled: expected=N, timeout=T`;
   - `PauseGame(true)` + удержание custom game setup на `T` секунд;
   - таймер раз в секунду обновляет remaining time (использует `Time()`,
     поэтому работает на паузе);
   - принудительно идём через клиентский релей, **минуя backup host**,
     потому что только там есть пер-плеерные `requestId` и чанки.
3. `ClientApiTransport.FetchGameStart(..., expected, timeout)`:
   - `startExpected` поднимается до `expected`, поэтому при 0/1 игроке игра
     не завершается сразу, а ждёт до таймаута;
   - immediate `no_players` теперь только когда гейт выключен;
   - `TryFinishStart` считает успех только при `#startResults >= expected`;
   - при таймауте failure = `timeout:x/y`, при раннем завершении =
     `not_enough_players_loaded:x/y`.
4. **Ожидание поздних игроков (новое, намеренно):** раз в 2 секунды
   human-only watcher (`PlayerHelper:IsHumanPlayerByPlayerId`) проверяет
   подключившихся игроков и досылает им `client_api_start_request`, если
   `startResults < expected`. Ботов он не трогает. Неудавшиеся запросы
   переотправляются с **новым `requestId`**, максимум
   `GATE_START_MAX_ATTEMPTS = 3` попытки на игрока.
5. Успех → `FinalizeStartGame()` снимает паузу и запускает игру.
6. Ошибка → пауза снимается, в консоль пишется `[LoadingGate] ERROR: ...`,
   в чат красным сообщение, `loading_status.status = 3`.

### Важно
- `useGameTime = false` у таймеров → используется `Time()`, а не игровое время,
  поэтому таймаут течёт даже когда игра на паузе.
- Старый watcher «late player connected, reloading game start», который дёргал
  ботов, удалён и не возвращать. Новый watcher — другой: только human, только
  `client_api_start_request`, с лимитом попыток.

### Логи в чате Доты
Добавлены через `GameRules:SendCustomMessage(..., 0, 0)` с префиксом `[Gate]`,
поэтому видны прямо в игровом чате (цветом):
- `WAIT expected=N, timeout=T s, connected=X` — старт ожидания;
- `SEND player=P, req=R, try=K/M` — ушёл старт-запрос игроку;
- `LATE player=P, try=K/M` / `RETRY player=P, try=K/M` — досылка/watchdog;
- `CHUNK0 player=P, total=N, req=R` — **первый чанк принят** (ключевой признак);
- `LOADED player=P, chunks=N/N, req=R, loaded=x/y` — игрок полностью загрузился;
- `FAIL player=P, req=R, try=K/M, reason=...` — ошибка загрузки игрока;
- `PASSED x/y - game starting` / `FAILED x/y, reason=...` — итог гейта.

Старый красный `[LoadingGate] ERROR: ...` в чате тоже остался.

---

## Что делать после патча кастомки

1. **Не трогать VPK.** Патч перезаписывает рыхлые файлы из VPK — правки, скорее
   всего, слетели.
2. Проверить признаки обеих правок:
   ```powershell
   Select-String -Path 'E:\SteamLibrary\steamapps\common\dota 2 beta\game\dota_addons\3564393242\scripts\vscripts\api\client-api-transport.lua' -Pattern 'keyed by requestId','game/start gate','SendGameStartRequest'
   Select-String -Path 'E:\SteamLibrary\steamapps\common\dota 2 beta\game\dota_addons\3564393242\scripts\vscripts\api\game.lua' -Pattern 'GetLoadingGateConfig'
   Test-Path 'E:\SteamLibrary\steamapps\common\dota 2 beta\game\dota_addons\3564393242\scripts\vscripts\omg_loading_gate_config.lua'
   ```
3. Быстрый путь — скопировать три пропатченных файла:
   ```powershell
   $b='E:\SteamLibrary\steamapps\common\dota 2 beta\game\dota_addons\_backup_3564393242\CURRENT_FIX'
   $w='E:\SteamLibrary\steamapps\common\dota 2 beta\game\dota_addons\3564393242'
   Copy-Item "$b\client-api-transport.PATCHED.lua" "$w\scripts\vscripts\api\client-api-transport.lua" -Force
   Copy-Item "$b\game.PATCHED.lua" "$w\scripts\vscripts\api\game.lua" -Force
   Copy-Item "$b\omg_loading_gate_config.lua" "$w\scripts\vscripts\omg_loading_gate_config.lua" -Force
   ```
4. Если VPK поменял сами файлы (новая версия аддона) — лучше наложить
   `patch.diff` вручную, чтобы не потерять чужие изменения.
5. Проверить синтаксис Lua (luaparser доступен с
   `PYTHONPATH=C:\Users\user\AppData\Local\Temp\opencode\pylibs`).
6. Перезапустить сервер с двумя игроками и взять свежий
   `game\dota_addons\3564393242\log.txt`.

### Состав бэкапа
- `client-api-transport.ORIGINAL.lua` — pristine-оригинал до первого фикса.
- `client-api-transport.PATCHED.lua` — текущая версия с requestId + гейтом.
- `game.ORIGINAL.lua` — восстановленная версия до гейта.
- `game.PATCHED.lua` — текущая версия с гейтом.
- `omg_loading_gate_config.lua` — копия Lua-конфига гейта.
- `patch.diff` — united diff по обоим Lua-файлам.
- `NOTE.md` — этот файл.

---

## Откат

### Только выключить ожидание
Не надо ничего откатывать: в `scripts\vscripts\omg_loading_gate_config.lua`
поставить `expected_players = 0`. Первый фикс с разными `requestId` останется.

### Полный откат обоих фиксов
```powershell
$b='E:\SteamLibrary\steamapps\common\dota 2 beta\game\dota_addons\_backup_3564393242\CURRENT_FIX'
$w='E:\SteamLibrary\steamapps\common\dota 2 beta\game\dota_addons\3564393242'
Copy-Item "$b\client-api-transport.ORIGINAL.lua" "$w\scripts\vscripts\api\client-api-transport.lua" -Force
Copy-Item "$b\game.ORIGINAL.lua" "$w\scripts\vscripts\api\game.lua" -Force
Remove-Item "$w\scripts\vscripts\omg_loading_gate_config.lua" -Force -ErrorAction SilentlyContinue
```

---

## Как понять по логе, что всё работает

Успех:
```
[Game] loading gate enabled: expected=2, timeout=120
[ClientApiTransport] game/start relay: players=2, matchId=...
[ClientApiTransport] game/start gate: expected=2, timeout=120
[ClientApiTransport] game/start request sent: playerId=0, requestId=0_1_xxxxxx
[ClientApiTransport] game/start request sent: playerId=1, requestId=0_1_yyyyyy   <- РАЗНЫЕ id
client received: kind=start, ..., requestId=0_1_xxxxxx, playerId=0
client received: kind=start, ..., requestId=0_1_yyyyyy, playerId=1
[ClientApiTransport] game/start gate passed: loaded=2/2
[ClientApiTransport] game/start relay succeeded: responses=2
```

Если второй игрок подключился позже:
```
[ClientApiTransport] game/start relay: players=1, matchId=0
[ClientApiTransport] game/start gate player added/retried: playerId=1, attempts=1
[ClientApiTransport] game/start gate passed: loaded=2/2
```

Ошибка/таймаут:
```
[ClientApiTransport] game/start gate FAILED: loaded=1/2, reason=timeout
[Game] [LoadingGate] ERROR: timeout:1/2
```
или:
```
[ClientApiTransport] game/start gate FAILED: loaded=0/2, reason=not_enough_players_loaded
[Game] [LoadingGate] ERROR: not_enough_players_loaded:0/2
```

То же в чате Доты:
```
[Gate] WAIT expected=2, timeout=120s, connected=1
[Gate] SEND player=0, req=0_1_881168, try=1/3
[Gate] LATE player=1, try=1/3
[Gate] FAIL player=0, req=0_1_881168, try=1/3, reason=chunk_0_timeout
[Gate] FAILED 0/2, reason=timeout
```

Плохие признаки (старый баг):
- одинаковый `requestId` у `playerId=0` и `1`;
- `game/start relay succeeded: responses=1`;
- `game/start relay failed: player=1, reason=chunk_0_timeout`;
- `late player connected, reloading game start` — СТАРЫЙ watcher удалён, не возвращать.

---

## История ретестов и GET-проверки

### Лог 21:05
- `[Game] loading gate config missing: scripts/kv/omg_loading_gate.kv`
  → `LoadKeyValues` вернул nil, `game/start gate: expected=0` → гейт был выключен.
  Исправлено сначала ASCII-комментариями, затем полным переходом на Lua-конфиг.
- `requestId 0_1_665599` у playerId=0 и `requestId 0_1_662770` у playerId=1 —
  **разные**, первый фикс на месте.
- При этом у обоих `chunk_0_timeout`, плюс таймауты обычного relay-запроса
  `GET /activity/current` → похоже на проблему транспорта/бэка, а не гейта.

### Лог 21:28
- `[Game] loading gate config invalid, using defaults: expected=2, timeout=120`
  → fail-safe сработал, гейт включился.
- `[ClientApiTransport] game/start relay: players=1` — второй игрок подключился
  уже после `StartGame`, поэтому ему запрос не уходил; добавлен human-only
  watcher с досылкой и 3 попытками.
- Итог: `[Game] [LoadingGate] ERROR: timeout:0/2` — гейт корректно заблокировал
  игру и выдал ошибку.

### Лог 21:40 (после human-only watcher)
- Watcher отработал идеально: `player=1` добавлен (`attempts=1`), затем по 2–3
  попытки для каждого игрока, всего 6 старт-запросов, все получили
  `client received: kind=start`.
- **Ни один `CHUNK0` не пришёл**: все 6 попыток закончились `chunk_0_timeout`.
- Параллельно затаймаутились **все** обычные relay-GET:
  `/activity/current`, `/activity/tasks`, `/showcase/profile`,
  `/showcase/catalog`, `/player/ranking` (45с, `client relay timeout`).
- Вывод: гейт и per-player `requestId` работают; проблема — клиентский
  HTTP-релей до `wx.renoomgai.top` (сеть/доступ/подпись/эндпоинт), а не логика
  ожидания. Добавлены чат-логи `CHUNK0`/`FAIL`, чтобы видеть это без log.txt.

### GET-проверки бэка (только чтение, WRITE не отправлялись)
- `GET /api/panorama/game/start?...` → 404
- `GET /api/panorama/game-start-v2.html` → 400
- `GET /api/panorama/game-start-v2.html?requestId=...` → 400
  (`{"status":400,"error":"Bad Request","path":"/api/panorama/game-start-v2.html"}`)
- `GET /api/panorama/game-start-v2?requestId=...` → 404
- `GET /api/panorama/activity/current` → 404

### Проверка подписи (важно!)
Собран тот же URL, что делает клиент (`DOTAHTMLPanel.SetURL`), с реальной
канонической строкой и HMAC от **локального секрета аддона**
`e16bc81b...`:

```
GET /api/panorama/game-start-v2.html
  ?requestId=0_999_123456&steamId=383575544&matchId=0
  &randomDraftMode=0&chunk=0
  &signature=HMAC_SHA256("e16bc81b...",
       "OMG2|start|0_999_123456|383575544|0|0")
```

Результат: **HTTP 200**, `<title>OMG1|start|0_999_123456|0|24|eyJtZW1iZXJz...`.
То есть бэк принимает подпись локальным секретом: **никакой доп. токен или
сертификат не нужен**. Раньше «GET без signature → 400», теперь понятно почему.

Поэтому в `ResolveRelayCredential()` теперь **всегда предпочитается**
`LocalGameAuth:GetSecret()` (source=`local`), а `GetDedicatedServerKeyV3("v2")`
используется только как fallback. Причина: на `-insecure`-сервере ключ v2 может
быть локальным/неизвестным бэку → каждый chunk-запрос получает 400 → клиент
пишет `chunk_0_timeout`. В лог добавлена строка `game/start sign: ... key=...
signature=... backend=...`, в чат — `SEND ... key=local`.

Если после этого `CHUNK0` всё равно не появится — значит подпись не при чём,
и проблема именно в загрузке внешнего URL самим Dota-клиентом
(`DOTAHTMLPanel` / CEF / прокси-доступ), поскольку все обычные relay-GET тоже
таймаутятся.

Прямая проверка «чужих» requestId бессмысленна: бэк отдаёт страницу по любому
корректно подписанному id.

---

## Smoke-тест, уже проведённый

Сервер с настоящим `gameindota_native_n7.cfg` и аддоном запускался с
`-condebug`; в `game\dota\console.log` аддон загрузился (`AI Wars Loaded`,
`addon='3564393242'`), ошибок Lua / `Unknown command` нет. Полный цикл
успех/ошибка гейта без реальных клиентов проверить нельзя — нужен тест с двумя
игроками от пользователя.

---

## ЧЕГО НЕ ДЕЛАТЬ категорически
- Не отправлять WRITE-запросы на прод-бэк (`wx.renoomgai.top`).
- Не трогать VPK.
- Не возвращать старые эксперименты: relay `POST /game/end`,
  `END_CHUNK_SIZE=2400`, watchdog-таймеры `upload started`, диагностические
  print'ы, СТАРЫЙ watcher «позднего игрока», правки `api-client.lua`,
  `event-game-state-change.lua`, `game-end.lua`, `standalone-server.lua`,
  Panorama JS. Всё это пробовалось и не помогло / мешало.
  Новый human-only watcher с лимитом попыток — часть текущего фикса.
- Не возвращать KV-конфиг — он не парсился.
- Не добавлять кастомные cvars в серверный cfg — Dota их не создаёт.
