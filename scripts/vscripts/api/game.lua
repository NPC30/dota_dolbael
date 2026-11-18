local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/game.lua"
__TS__SourceMapTraceBack("api/game.lua", {["7"] = 1,["8"] = 1,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 9,["19"] = 9,["21"] = 9,["22"] = 17,["23"] = 17,["24"] = 17,["26"] = 21,["27"] = 32,["28"] = 33,["31"] = 36,["32"] = 37,["33"] = 38,["34"] = 39,["35"] = 39,["36"] = 39,["37"] = 39,["38"] = 39,["39"] = 39,["40"] = 45,["42"] = 49,["43"] = 49,["44"] = 49,["45"] = 50,["46"] = 52,["49"] = 61,["50"] = 62,["51"] = 63,["52"] = 49,["53"] = 49,["54"] = 32,["55"] = 67,["56"] = 68,["57"] = 69,["58"] = 70,["59"] = 71,["60"] = 72,["61"] = 73,["62"] = 74,["63"] = 75,["64"] = 76,["67"] = 79,["68"] = 67,["69"] = 84,["70"] = 85,["71"] = 86,["72"] = 87,["73"] = 88,["74"] = 84,["75"] = 91,["76"] = 97,["77"] = 98,["78"] = 91,["79"] = 106,["80"] = 107,["81"] = 108,["84"] = 111,["85"] = 111,["86"] = 111,["87"] = 111,["88"] = 112,["89"] = 113,["90"] = 113,["91"] = 113,["92"] = 113,["93"] = 113,["94"] = 118,["95"] = 119,["96"] = 120,["98"] = 113,["99"] = 123,["100"] = 124,["103"] = 127,["104"] = 128,["105"] = 113,["106"] = 132,["107"] = 133,["110"] = 136,["111"] = 139,["112"] = 140,["113"] = 113,["114"] = 113,["115"] = 106,["116"] = 145,["117"] = 146,["118"] = 146,["119"] = 146,["120"] = 146,["121"] = 147,["122"] = 148,["123"] = 148,["124"] = 150,["125"] = 151,["128"] = 152,["129"] = 153,["130"] = 148,["131"] = 155,["132"] = 156,["135"] = 157,["136"] = 158,["137"] = 148,["138"] = 148,["139"] = 145,["140"] = 163,["141"] = 164,["142"] = 165,["143"] = 165,["144"] = 165,["146"] = 165,["147"] = 163,["148"] = 168,["149"] = 169,["150"] = 170,["151"] = 171,["152"] = 172,["153"] = 175,["154"] = 176,["155"] = 177,["157"] = 181,["159"] = 185,["160"] = 186,["161"] = 187,["162"] = 189,["163"] = 190,["164"] = 168,["165"] = 195,["166"] = 201,["167"] = 201,["168"] = 201,["169"] = 204,["170"] = 204,["171"] = 204,["172"] = 204,["173"] = 201,["174"] = 209,["175"] = 210,["178"] = 215,["179"] = 216,["182"] = 212,["183"] = 213,["189"] = 201,["190"] = 219,["191"] = 220,["192"] = 221,["193"] = 201,["194"] = 201,["195"] = 201,["196"] = 201,["197"] = 227,["198"] = 195,["199"] = 230,["200"] = 231,["201"] = 232,["203"] = 230,["204"] = 236,["205"] = 237,["206"] = 236,["207"] = 242,["208"] = 243,["209"] = 244,["210"] = 248,["211"] = 249,["212"] = 250,["213"] = 251,["214"] = 252,["215"] = 253,["216"] = 254,["217"] = 255,["218"] = 251,["219"] = 257,["220"] = 259,["221"] = 260,["222"] = 261,["223"] = 263,["224"] = 264,["225"] = 264,["226"] = 264,["227"] = 264,["228"] = 264,["229"] = 269,["230"] = 270,["231"] = 271,["232"] = 271,["234"] = 272,["235"] = 264,["236"] = 264,["237"] = 263,["238"] = 279,["239"] = 279,["240"] = 279,["241"] = 279,["242"] = 279,["243"] = 280,["244"] = 281,["245"] = 279,["246"] = 279,["247"] = 242,["248"] = 285,["249"] = 286,["250"] = 287,["251"] = 285,["252"] = 305,["253"] = 305,["254"] = 305,["256"] = 306,["257"] = 306,["258"] = 307,["259"] = 308,["260"] = 307,["261"] = 309,["263"] = 311,["264"] = 312,["265"] = 316,["266"] = 317,["267"] = 318,["270"] = 322,["271"] = 323,["272"] = 323,["273"] = 323,["274"] = 323,["275"] = 323,["278"] = 334,["279"] = 335,["280"] = 335,["281"] = 335,["282"] = 335,["283"] = 339,["284"] = 343,["285"] = 335,["286"] = 347,["287"] = 348,["290"] = 349,["291"] = 353,["292"] = 356,["293"] = 357,["294"] = 357,["295"] = 357,["296"] = 357,["297"] = 357,["298"] = 335,["299"] = 335,["300"] = 371,["301"] = 372,["302"] = 305,["303"] = 18,["304"] = 19,["305"] = 22,["306"] = 23,["307"] = 24,["308"] = 26,["309"] = 27,["310"] = 28,["311"] = 29,["312"] = 30});
local ____exports = {}
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____ga4 = require("api.analytics.ga4")
local GA4 = ____ga4.GA4
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____client_2Dapi_2Dtransport = require("api.client-api-transport")
local ClientApiTransport = ____client_2Dapi_2Dtransport.ClientApiTransport
local ____player = require("api.player")
local Player = ____player.Player
local GameStart = __TS__Class()
GameStart.name = "GameStart"
function GameStart.prototype.____constructor(self)
end
____exports.Game = __TS__Class()
local Game = ____exports.Game
Game.name = "Game"
function Game.prototype.____constructor(self)
end
function Game.RegisterListeners(self)
    if self.listenersRegistered then
        return
    end
    self.listenersRegistered = true
    ClientApiTransport:RegisterListeners()
    if IsInToolsMode() then
        Convars:RegisterCommand(
            "omg_api_transport",
            function(_commandName, mode) return self:SetToolsTransportMode(mode) end,
            "Simulate API transport in Tools Mode: blocked, auto, or status.",
            FCVAR_NONE
        )
        print("[Game] Tools Mode server HTTP simulation: unavailable=" .. tostring(ApiClient:IsSimulatingHttpUnavailableForTools()))
    end
    CustomGameEventManager:RegisterListener(
        "game_end_retry",
        function(_userId, event)
            local now = Time()
            if self.finalSettlementStatus ~= 3 or self.finalGameEndSnapshot == nil or event.PlayerID == nil or not PlayerResource:IsValidPlayerID(event.PlayerID) or now - self.lastManualRetryTime < self.MANUAL_RETRY_COOLDOWN_SECONDS then
                return
            end
            self.lastManualRetryTime = now
            print("[GameEndAPI] manual-retry: playerId=" .. tostring(event.PlayerID))
            self:SendFinalGameEnd(self.finalGameEndSnapshot)
        end
    )
end
function Game.SetToolsTransportMode(self, mode)
    local normalizedMode = string.lower(mode or "status")
    if normalizedMode == "blocked" then
        ApiClient:SetSimulateHttpUnavailableForTools(true)
        self:SetTransportMode(0, "tools_http_blocked")
    elseif normalizedMode == "auto" then
        ApiClient:SetSimulateHttpUnavailableForTools(false)
        self:SetTransportMode(0, "tools_auto")
    elseif normalizedMode ~= "status" then
        print("[Game] usage: omg_api_transport blocked|auto|status")
        return
    end
    print((("[Game] API transport: mode=" .. tostring(self.transportMode)) .. ", simulatedHttpUnavailable=") .. tostring(ApiClient:IsSimulatingHttpUnavailableForTools()))
end
function Game.SetTransportMode(self, mode, reason)
    self.transportMode = mode
    ClientApiTransport:SetRelayEnabled(mode == 2)
    CustomNetTables:SetTableValue("api_transport", "transport", {mode = mode, reason = reason})
    print((("[Game] API transport mode=" .. tostring(mode)) .. ", reason=") .. (reason or "none"))
end
function Game.SetEndingStatus(self, status, gameEndDto, attempt, maxAttempts)
    self.finalSettlementStatus = status
    CustomNetTables:SetTableValue("ending_status", "ending_status", {status = status, abyssWave = gameEndDto.abyssWave or 0, attempt = attempt, maxAttempts = maxAttempts})
end
function Game.SendFinalGameEnd(self, gameEndDto)
    if self.transportMode == 2 then
        self:SendFinalGameEndViaClient(gameEndDto)
        return
    end
    local ____self_0, ____finalSendGeneration_1 = self, "finalSendGeneration"
    local ____self_finalSendGeneration_2 = ____self_0[____finalSendGeneration_1] + 1
    ____self_0[____finalSendGeneration_1] = ____self_finalSendGeneration_2
    local generation = ____self_finalSendGeneration_2
    self:SetEndingStatus(1, gameEndDto, 1, self.GAME_END_RETRY_TIMES)
    ApiClient:sendToBackupHost({
        method = HttpMethod.POST,
        path = self.GAME_END_URL,
        body = gameEndDto,
        retryTimes = self.GAME_END_RETRY_TIMES,
        attemptFunc = function(____, attempt, maxAttempts)
            if generation == self.finalSendGeneration then
                self:SetEndingStatus(1, gameEndDto, attempt, maxAttempts)
            end
        end,
        successFunc = function()
            if generation ~= self.finalSendGeneration then
                return
            end
            self:SetEndingStatus(2, gameEndDto)
            ApiClient:DebugLog(("[Game] game/end callback: phase=final, wave=" .. tostring(gameEndDto.abyssWave or "none")) .. ", result=success")
        end,
        failureFunc = function()
            if generation ~= self.finalSendGeneration then
                return
            end
            ApiClient:DebugLog(("[Game] game/end callback: phase=final, wave=" .. tostring(gameEndDto.abyssWave or "none")) .. ", result=failure, fallback=client")
            self:SetTransportMode(2, "game_end_server_unreachable")
            self:SendFinalGameEndViaClient(gameEndDto)
        end
    })
end
function Game.SendFinalGameEndViaClient(self, gameEndDto)
    local ____self_3, ____finalSendGeneration_4 = self, "finalSendGeneration"
    local ____self_finalSendGeneration_5 = ____self_3[____finalSendGeneration_4] + 1
    ____self_3[____finalSendGeneration_4] = ____self_finalSendGeneration_5
    local generation = ____self_finalSendGeneration_5
    self:SetEndingStatus(1, gameEndDto, 1, 1)
    ClientApiTransport:SendGameEnd(
        gameEndDto,
        function()
            if generation ~= self.finalSendGeneration then
                return
            end
            self:SetEndingStatus(2, gameEndDto)
            ApiClient:DebugLog("[Game] client relay game/end succeeded")
        end,
        function(____, reason)
            if generation ~= self.finalSendGeneration then
                return
            end
            self:SetEndingStatus(3, gameEndDto)
            ApiClient:DebugLog("[Game] client relay game/end failed: " .. reason)
        end
    )
end
function Game.DecodeGameStart(self, rawData)
    local decoded = (json.decode(rawData))
    local ____temp_8 = decoded and decoded.data
    if ____temp_8 == nil then
        ____temp_8 = decoded
    end
    return ____temp_8
end
function Game.FinalizeStartGame(self, gameStart)
    self:ReleaseGameAfterLoading()
    Player.memberList = gameStart.members or ({})
    Player.playerList = gameStart.players or ({})
    Player.pointInfoList = gameStart.pointInfo or ({})
    Player.lotteryRefreshExtraList = gameStart.lotteryRefreshExtraCounts or ({})
    if gameStart.ga4Config then
        GA4:Initialize(gameStart.ga4Config)
        ApiClient:DebugLog("[Game] GA4 initialized with measurementId: " .. gameStart.ga4Config.measurementId)
    else
        ApiClient:DebugLog("[Game] GA4 config not provided (non-official server)")
    end
    Player:savePlayerToNetTable()
    Player:saveMemberToNetTable()
    Player:savePointInfoToNetTable()
    local status = #Player.playerList > 0 and 2 or 3
    CustomNetTables:SetTableValue("loading_status", "loading_status", {status = status})
end
function Game.FetchStartGameFromBackupHostWithFailure(self, steamIds, matchId, randomDraftMode, failureFunc)
    local apiParameter = {
        method = HttpMethod.GET,
        path = ____exports.Game.GAME_START_URL,
        querys = {
            steamIds = table.concat(steamIds, ","),
            matchId = matchId,
            randomDraftMode = randomDraftMode and "1" or "0"
        },
        successFunc = function(____, data)
            ApiClient:DebugLog("[Game] backup game/start callback data " .. data)
            do
                local function ____catch(____error)
                    ApiClient:DebugLog("[Game] failed to parse backup game/start " .. tostring(____error))
                    failureFunc(nil, data)
                end
                local ____try, ____hasReturned = pcall(function()
                    ____exports.Game:SetTransportMode(1, "game_start_success")
                    ____exports.Game:FinalizeStartGame(____exports.Game:DecodeGameStart(data))
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end,
        failureFunc = function(____, data)
            ApiClient:DebugLog("[Game] backup game/start failed " .. data)
            failureFunc(nil, data)
        end,
        retryTimes = 2,
        timeoutSeconds = 5
    }
    ApiClient:sendToBackupHost(apiParameter)
end
function Game.NotifyEndGameDebug(self, message)
    if IsInToolsMode() then
        GameRules:SendCustomMessage("<font color='#66CCFF'>[GameEndDebug]</font> " .. message, 0, 0)
    end
end
function Game.PostSaveTempPoints(self, steamId, matchId, battlePoints)
    ApiClient:DebugLog((((("[Game] old save temp points disabled: steamId=" .. tostring(steamId)) .. ", matchId=") .. matchId) .. ", battlePoints=") .. tostring(battlePoints))
end
function Game.GetLoadingGateConfig(self)
    local kv = LoadKeyValues("scripts/kv/omg_loading_gate.kv")
    local section = kv and kv.OMGLoadingGate or nil
    if not section then
        print("[Game] loading gate config invalid, using defaults: expected=2, timeout=120")
        return 2, 120
    end
    local expected = tonumber(section.expected_players)
    local timeout = tonumber(section.timeout_seconds)
    if expected == nil then
        expected = 2
    end
    if expected < 0 then
        expected = 0
    end
    if timeout == nil or timeout < 30 then
        timeout = 120
    end
    return expected, timeout
end
function Game.HoldGameForLoading(self, seconds)
    self.loadingGateHold = true
    PauseGame(true)
    GameRules:SetCustomGameSetupAutoLaunchDelay(seconds)
    GameRules:SetCustomGameSetupRemainingTime(seconds)
    Timers:CreateTimer({
        endTime = 1,
        useGameTime = false,
        callback = function()
            if not self.loadingGateHold then
                return nil
            end
            if GameRules:State_Get() == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP then
                GameRules:SetCustomGameSetupRemainingTime(seconds)
            end
            return 1
        end
    })
end
function Game.ReleaseGameAfterLoading(self)
    if not self.loadingGateHold then
        return
    end
    self.loadingGateHold = nil
    GameRules:SetCustomGameSetupAutoLaunchDelay(50)
    GameRules:SetCustomGameSetupRemainingTime(3)
    if GameRules:IsGamePaused() then
        PauseGame(false)
    end
end
function Game.StartGame(self)
    self:SetTransportMode(0, "probing_game_start")
    CustomNetTables:SetTableValue("loading_status", "loading_status", {status = 1})
    local expectedPlayers, timeoutSeconds = self:GetLoadingGateConfig()
    if expectedPlayers > 0 then
        print((("[Game] loading gate enabled: expected=" .. tostring(expectedPlayers)) .. ", timeout=") .. tostring(timeoutSeconds))
        self:HoldGameForLoading(timeoutSeconds)
    end
    local steamIds = {}
    local clientPlayers = {}
    local playerCount = 0
    PlayerHelper:ForEachPlayer(function(____, playerId)
        local steamId = PlayerResource:GetSteamAccountID(playerId)
        steamIds[#steamIds + 1] = steamId
        clientPlayers[#clientPlayers + 1] = {playerId = playerId, steamId = steamId}
        playerCount = playerCount + 1
    end)
    Player.playerCount = playerCount
    local matchId = tostring(GameRules:Script_GetMatchID())
    local mapName = string.lower(GetMapName())
    local randomDraftMode = mapName == "rd" or __TS__StringIncludes(mapName, "/rd") or __TS__StringIncludes(mapName, "\\rd")
    local function fetchStartViaClient()
        if expectedPlayers > 0 then
            self:SetTransportMode(2, "loading_gate_client_relay")
        end
        ClientApiTransport:FetchGameStart(
            clientPlayers,
            matchId,
            randomDraftMode,
            function(____, gameStart) return ____exports.Game:FinalizeStartGame(gameStart) end,
            function(____, reason)
                self:ReleaseGameAfterLoading()
                ApiClient:DebugLog("[Game] client relay game/start failed: " .. reason)
                if IsInToolsMode() then
                    Player:saveMemberToNetTable()
                end
                local message = "[LoadingGate] ERROR: " .. tostring(reason)
                print("[Game] " .. message)
                GameRules:SendCustomMessage("<font color='#FF5555'>" .. message .. "</font>", 0, 0)
                CustomNetTables:SetTableValue("loading_status", "loading_status", {status = 3})
            end,
            expectedPlayers,
            timeoutSeconds
        )
    end
    if expectedPlayers > 0 then
        fetchStartViaClient(nil)
    else
        ____exports.Game:FetchStartGameFromBackupHostWithFailure(
            steamIds,
            matchId,
            randomDraftMode,
            function()
                ____exports.Game:SetTransportMode(2, "game_start_server_unreachable")
                fetchStartViaClient(nil)
            end
        )
    end
end
function Game.EndGame(self, gameEndDto)
    ApiClient:DebugLog("[Game] old /game/end disabled: matchId=" .. gameEndDto.matchId)
    self:NotifyEndGameDebug("/game/end disabled: matchId=" .. gameEndDto.matchId)
end
function Game.PostEndGame2(self, gameEndDto2, updateEndingStatus)
    if updateEndingStatus == nil then
        updateEndingStatus = true
    end
    local ____opt_9 = GameRules.Option
    if ____opt_9 and ____opt_9.abyssMode and gameEndDto2.abyssWave == nil then
        local ____gameEndDto2_13 = gameEndDto2
        local ____opt_11 = GameRules.AbyssMode
        ____gameEndDto2_13.abyssWave = ____opt_11 and ____opt_11:GetCompletedWave() or _G.AbyssModeCompletedWave or 0
        gameEndDto2.isAbyssProgress = false
    end
    local phase = gameEndDto2.isAbyssProgress == true and "progress" or "final"
    ApiClient:DebugLog((((("[Game] post game/end: phase=" .. phase) .. ", wave=") .. tostring(gameEndDto2.abyssWave or "none")) .. ", updateEndingStatus=") .. tostring(updateEndingStatus))
    if updateEndingStatus and phase == "final" then
        self.finalGameEndSnapshot = gameEndDto2
        self:SendFinalGameEnd(gameEndDto2)
        return
    end
    if self.transportMode == 2 then
        ClientApiTransport:SendGameEnd(
            gameEndDto2,
            function() return ApiClient:DebugLog("[Game] client relay game/end progress succeeded: phase=" .. phase) end,
            function(____, reason) return ApiClient:DebugLog((("[Game] client relay game/end progress failed: phase=" .. phase) .. ", reason=") .. reason) end
        )
        return
    end
    local fallbackStarted = false
    local apiParameter = {
        method = HttpMethod.POST,
        path = self.GAME_END_URL,
        body = gameEndDto2,
        successFunc = function()
            ApiClient:DebugLog(((("[Game] game/end callback: phase=" .. phase) .. ", wave=") .. tostring(gameEndDto2.abyssWave or "none")) .. ", result=success")
        end,
        failureFunc = function()
            if fallbackStarted then
                return
            end
            fallbackStarted = true
            ApiClient:DebugLog(((("[Game] game/end callback: phase=" .. phase) .. ", wave=") .. tostring(gameEndDto2.abyssWave or "none")) .. ", result=failure, fallback=client")
            self:SetTransportMode(2, "game_end_server_unreachable")
            ClientApiTransport:SendGameEnd(
                gameEndDto2,
                function() return ApiClient:DebugLog("[Game] client relay game/end succeeded after direct failure: phase=" .. phase) end,
                function(____, reason) return ApiClient:DebugLog((("[Game] client relay game/end failed after direct failure: phase=" .. phase) .. ", reason=") .. reason) end
            )
        end
    }
    ApiClient:sendToBackupHost(apiParameter)
    ApiClient:DebugLog("[ApiClient-back] game-data-sent to new url")
end
Game.GAME_START_URL = "/game/start"
Game.GAME_END_URL = "/game/end"
Game.POST_SAVE_TEMP_POINTS_URL = "/game/saveTempPoints"
Game.GAME_END_RETRY_TIMES = 3
Game.MANUAL_RETRY_COOLDOWN_SECONDS = 5
Game.finalSendGeneration = 0
Game.finalSettlementStatus = 0
Game.listenersRegistered = false
Game.lastManualRetryTime = -1000
Game.transportMode = 0
return ____exports
