local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/game.test.lua"
__TS__SourceMapTraceBack("api/game.test.lua", {["5"] = 26,["6"] = 26,["7"] = 27,["8"] = 27,["9"] = 28,["10"] = 28,["11"] = 29,["12"] = 29,["13"] = 31,["14"] = 31,["15"] = 1,["16"] = 1,["17"] = 1,["18"] = 2,["19"] = 2,["20"] = 2,["21"] = 2,["22"] = 1,["23"] = 1,["24"] = 1,["25"] = 1,["26"] = 13,["27"] = 13,["28"] = 13,["29"] = 14,["30"] = 14,["31"] = 13,["32"] = 13,["33"] = 20,["34"] = 20,["35"] = 20,["36"] = 20,["37"] = 33,["38"] = 34,["39"] = 33,["40"] = 40,["41"] = 40,["42"] = 40,["43"] = 40,["44"] = 41,["45"] = 41,["46"] = 41,["47"] = 42,["48"] = 43,["49"] = 44,["50"] = 47,["51"] = 48,["52"] = 51,["53"] = 54,["54"] = 55,["55"] = 58,["56"] = 59,["57"] = 60,["58"] = 61,["59"] = 62,["60"] = 62,["61"] = 63,["62"] = 63,["63"] = 64,["64"] = 64,["65"] = 65,["66"] = 66,["67"] = 67,["68"] = 41,["69"] = 41,["70"] = 70,["71"] = 70,["72"] = 70,["73"] = 71,["74"] = 70,["75"] = 70,["76"] = 74,["77"] = 74,["78"] = 74,["79"] = 74,["80"] = 75,["81"] = 78,["82"] = 78,["83"] = 78,["84"] = 78,["85"] = 78,["86"] = 83,["87"] = 85,["88"] = 87,["89"] = 88,["90"] = 98,["91"] = 100,["92"] = 101,["93"] = 74,["94"] = 74,["95"] = 111,["96"] = 111,["97"] = 111,["98"] = 111,["99"] = 112,["100"] = 115,["101"] = 118,["102"] = 118,["103"] = 118,["104"] = 118,["105"] = 118,["106"] = 118,["107"] = 118,["108"] = 115,["109"] = 120,["110"] = 120,["111"] = 123,["112"] = 125,["113"] = 126,["114"] = 128,["115"] = 129,["116"] = 130,["117"] = 139,["118"] = 140,["119"] = 141,["120"] = 141,["121"] = 141,["122"] = 141,["123"] = 141,["124"] = 142,["125"] = 111,["126"] = 111,["127"] = 40,["128"] = 40,["129"] = 146,["130"] = 146,["131"] = 146,["132"] = 146,["133"] = 147,["134"] = 147,["135"] = 147,["136"] = 148,["137"] = 149,["138"] = 157,["139"] = 158,["140"] = 159,["141"] = 160,["142"] = 161,["143"] = 162,["144"] = 147,["145"] = 147,["146"] = 165,["147"] = 165,["148"] = 165,["149"] = 165,["150"] = 167,["151"] = 167,["152"] = 167,["153"] = 167,["154"] = 168,["155"] = 169,["156"] = 170,["157"] = 171,["158"] = 172,["159"] = 175,["160"] = 178,["161"] = 175,["162"] = 182,["163"] = 185,["164"] = 186,["165"] = 187,["166"] = 188,["167"] = 188,["168"] = 189,["169"] = 190,["170"] = 192,["171"] = 192,["172"] = 192,["173"] = 190,["174"] = 193,["175"] = 194,["176"] = 195,["177"] = 201,["178"] = 202,["179"] = 204,["180"] = 205,["181"] = 206,["182"] = 207,["183"] = 208,["184"] = 209,["185"] = 210,["186"] = 211,["187"] = 212,["188"] = 220,["189"] = 222,["190"] = 222,["192"] = 223,["193"] = 224,["194"] = 225,["195"] = 226,["196"] = 228,["197"] = 229,["198"] = 229,["200"] = 230,["201"] = 232,["202"] = 233,["203"] = 233,["205"] = 234,["206"] = 167,["207"] = 167,["208"] = 237,["209"] = 237,["210"] = 237,["211"] = 237,["212"] = 238,["213"] = 239,["214"] = 240,["215"] = 241,["216"] = 242,["217"] = 243,["218"] = 244,["219"] = 246,["220"] = 247,["221"] = 249,["222"] = 250,["223"] = 237,["224"] = 237,["225"] = 260,["226"] = 260,["227"] = 260,["228"] = 260,["229"] = 261,["230"] = 262,["231"] = 263,["232"] = 264,["233"] = 265,["234"] = 265,["235"] = 268,["236"] = 269,["237"] = 275,["238"] = 276,["239"] = 277,["240"] = 278,["241"] = 280,["242"] = 281,["243"] = 282,["244"] = 282,["245"] = 282,["246"] = 282,["247"] = 282,["248"] = 260,["249"] = 260,["250"] = 146,["251"] = 146});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local ____game = require("api.game")
local Game = ____game.Game
local ____player = require("api.player")
local Player = ____player.Player
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____client_2Dapi_2Dtransport = require("api.client-api-transport")
local ClientApiTransport = ____client_2Dapi_2Dtransport.ClientApiTransport
jest:mock(
    "./api-client",
    function() return {
        ApiClient = {
            DebugLog = jest:fn(),
            sendToBackupHost = jest:fn(),
            sendWithRetry = jest:fn()
        },
        HttpMethod = {GET = "GET", POST = "POST"}
    } end
)
jest:mock(
    "../modules/property/property_controller",
    function() return {PropertyController = {
        LevelupPlayerProperty = jest:fn(),
        RemoveAllPlayerProperty = jest:fn()
    }} end
)
jest:mock(
    "../modules/helper/player-helper",
    function() return {PlayerHelper = {ForEachPlayer = jest:fn()}} end
)
local function player(____, id, marker)
    return {id = id, playerName = marker, properties = {}}
end
describe(
    nil,
    "Game.StartGame",
    function()
        beforeEach(
            nil,
            function()
                jest:clearAllMocks()
                local testGlobal = _G
                testGlobal.json = {decode = function(____, rawData) return {JSON:parse(rawData)} end}
                testGlobal.print = jest:fn()
                testGlobal.CustomNetTables = {SetTableValue = jest:fn()}
                testGlobal.GameRules = {Script_GetMatchID = function() return "match-1" end}
                testGlobal.GetMapName = function() return "rd" end
                testGlobal.PlayerResource = {GetSteamAccountID = function() return 123 end}
                testGlobal.IsInToolsMode = function() return false end
                testGlobal.GetSystemTimeMS = function() return 378375.251 end
                testGlobal.GetSystemDate = function() return "07/31/26" end
                testGlobal.GetSystemTime = function() return "22:48:08" end
                jest:spyOn(Player, "savePlayerToNetTable"):mockImplementation(function()
                end)
                jest:spyOn(Player, "saveMemberToNetTable"):mockImplementation(function()
                end)
                jest:spyOn(Player, "savePointInfoToNetTable"):mockImplementation(function()
                end)
                Player.memberList = {}
                Player.playerList = {}
                Player.pointInfoList = {}
            end
        )
        afterEach(
            nil,
            function()
                jest:restoreAllMocks()
            end
        )
        it(
            nil,
            "fetches backuphost game/start directly",
            function()
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback) return callback(nil, 0) end)
                local backupGameStart = {
                    members = {},
                    players = {player(nil, "123", "backup-direct")},
                    pointInfo = {}
                }
                local sendToBackupHost = ApiClient.sendToBackupHost
                Game:StartGame()
                expect(nil, sendToBackupHost):toHaveBeenCalledTimes(1)
                expect(nil, sendToBackupHost.mock.calls[1][0]):toMatchObject({method = "GET", path = "/game/start", querys = {steamIds = "123", matchId = "match-1", randomDraftMode = "1"}})
                sendToBackupHost.mock.calls[1][0]:successFunc(JSON:stringify(backupGameStart))
                expect(nil, Player.playerList):toEqual(backupGameStart.players)
                expect(nil, CustomNetTables.SetTableValue):toHaveBeenCalledWith("api_transport", "transport", {mode = 1, reason = "game_start_success"})
            end
        )
        it(
            nil,
            "locks client relay after the startup request fails and reuses it for settlement",
            function()
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback) return callback(nil, 0) end)
                local fetchClientStart = jest:spyOn(ClientApiTransport, "FetchGameStart"):mockImplementation(function(____, _players, _matchId, _rd, success)
                    success(
                        nil,
                        {
                            members = {},
                            players = {player(nil, "123", "client-relay")}
                        }
                    )
                end)
                local sendClientEnd = jest:spyOn(ClientApiTransport, "SendGameEnd"):mockImplementation(function()
                end)
                local sendToBackupHost = ApiClient.sendToBackupHost
                Game:StartGame()
                sendToBackupHost.mock.calls[1][0]:failureFunc("blocked")
                expect(nil, fetchClientStart):toHaveBeenCalledTimes(1)
                expect(nil, Player.playerList[1].playerName):toBe("client-relay")
                expect(nil, CustomNetTables.SetTableValue):toHaveBeenCalledWith("api_transport", "transport", {mode = 2, reason = "game_start_server_unreachable"})
                local dto = {matchId = "match-1", players = {}}
                Game:PostEndGame2(dto)
                expect(nil, sendClientEnd):toHaveBeenCalledWith(
                    dto,
                    expect:any(Function),
                    expect:any(Function)
                )
                expect(nil, sendToBackupHost):toHaveBeenCalledTimes(1)
            end
        )
    end
)
describe(
    nil,
    "Game final settlement retry",
    function()
        beforeEach(
            nil,
            function()
                jest:clearAllMocks()
                local state = Game
                state.transportMode = 1
                state.finalGameEndSnapshot = nil
                state.finalSendGeneration = 0
                state.finalSettlementStatus = 0
                state.listenersRegistered = false
                state.lastManualRetryTime = -1000
            end
        )
        afterEach(
            nil,
            function() return jest:restoreAllMocks() end
        )
        it(
            nil,
            "escalates direct final failure once and rate-limits manual relay retries",
            function()
                Game.transportMode = 1
                local testGlobal = _G
                local now = 100
                local retryListener
                testGlobal.CustomNetTables = {SetTableValue = jest:fn()}
                testGlobal.CustomGameEventManager = {RegisterListener = jest:fn(function(____, _name, listener)
                    retryListener = listener
                end)}
                testGlobal.PlayerResource = {IsValidPlayerID = jest:fn(function() return true end)}
                testGlobal.GameRules = {}
                testGlobal.Time = jest:fn(function() return now end)
                testGlobal.print = jest:fn()
                jest:spyOn(ClientApiTransport, "RegisterListeners"):mockImplementation(function()
                end)
                local relayFailures = {}
                local sendClientEnd = jest:spyOn(ClientApiTransport, "SendGameEnd"):mockImplementation(function(____, _dto, _success, failure)
                    local ____temp_0 = #relayFailures + 1
                    relayFailures[____temp_0] = failure
                    return ____temp_0
                end)
                local sendToBackupHost = ApiClient.sendToBackupHost
                sendToBackupHost:mockClear()
                local dto = {matchId = "match-1", winnerTeamId = 2, players = {{steamId = 123}}}
                Game:RegisterListeners()
                Game:PostEndGame2(dto)
                expect(nil, sendToBackupHost):toHaveBeenCalledTimes(1)
                local firstRequest = sendToBackupHost.mock.calls[1][0]
                expect(nil, firstRequest.body):toBe(dto)
                firstRequest:attemptFunc(2, 3)
                firstRequest:failureFunc("timeout")
                firstRequest:failureFunc("duplicate-timeout")
                expect(nil, sendClientEnd):toHaveBeenCalledTimes(1)
                expect(nil, sendClientEnd.mock.calls[1][1]):toBe(dto)
                expect(nil, testGlobal.CustomNetTables.SetTableValue):toHaveBeenLastCalledWith("ending_status", "ending_status", {status = 1, abyssWave = 0, attempt = 1, maxAttempts = 1})
                relayFailures[1](relayFailures, "relay-timeout")
                if retryListener ~= nil then
                    retryListener(nil, 0, {PlayerID = 0})
                end
                expect(nil, sendToBackupHost):toHaveBeenCalledTimes(1)
                expect(nil, sendClientEnd):toHaveBeenCalledTimes(2)
                expect(nil, sendClientEnd.mock.calls[2][1]):toBe(dto)
                relayFailures[2](relayFailures, "relay-rejected")
                now = 104
                if retryListener ~= nil then
                    retryListener(nil, 0, {PlayerID = 0})
                end
                expect(nil, sendClientEnd):toHaveBeenCalledTimes(2)
                now = 105
                if retryListener ~= nil then
                    retryListener(nil, 0, {PlayerID = 0})
                end
                expect(nil, sendClientEnd):toHaveBeenCalledTimes(3)
            end
        )
        it(
            nil,
            "keeps direct final success on the normal transport",
            function()
                local testGlobal = _G
                testGlobal.CustomNetTables = {SetTableValue = jest:fn()}
                testGlobal.GameRules = {}
                testGlobal.print = jest:fn()
                local sendClientEnd = jest:spyOn(ClientApiTransport, "SendGameEnd")
                local sendToBackupHost = ApiClient.sendToBackupHost
                local dto = {matchId = "match-success", players = {}}
                Game:PostEndGame2(dto)
                sendToBackupHost.mock.calls[1][0]:successFunc("OK")
                expect(nil, sendClientEnd)["not"]:toHaveBeenCalled()
                expect(nil, testGlobal.CustomNetTables.SetTableValue):toHaveBeenLastCalledWith("ending_status", "ending_status", {status = 2, abyssWave = 0, attempt = nil, maxAttempts = nil})
            end
        )
        it(
            nil,
            "falls back once for a failed progress settlement without final status changes",
            function()
                local testGlobal = _G
                testGlobal.CustomNetTables = {SetTableValue = jest:fn()}
                testGlobal.GameRules = {}
                testGlobal.print = jest:fn()
                local sendClientEnd = jest:spyOn(ClientApiTransport, "SendGameEnd"):mockImplementation(function()
                end)
                local sendToBackupHost = ApiClient.sendToBackupHost
                local dto = {matchId = "match-progress", isAbyssProgress = true, players = {}}
                Game:PostEndGame2(dto, false)
                local request = sendToBackupHost.mock.calls[1][0]
                request:failureFunc("timeout")
                request:failureFunc("duplicate-timeout")
                expect(nil, sendClientEnd):toHaveBeenCalledTimes(1)
                expect(nil, sendClientEnd.mock.calls[1][1]):toBe(dto)
                expect(nil, testGlobal.CustomNetTables.SetTableValue)["not"]:toHaveBeenCalledWith(
                    "ending_status",
                    "ending_status",
                    expect:anything()
                )
            end
        )
    end
)
return ____exports
