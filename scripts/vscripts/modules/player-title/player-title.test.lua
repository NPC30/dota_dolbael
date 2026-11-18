local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/player-title/player-title.test.lua"
__TS__SourceMapTraceBack("modules/player-title/player-title.test.lua", {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 6,["13"] = 6,["14"] = 6,["15"] = 6,["16"] = 6,["17"] = 6,["18"] = 6,["19"] = 15,["20"] = 15,["21"] = 15,["22"] = 15,["23"] = 47,["24"] = 47,["25"] = 47,["26"] = 47,["27"] = 48,["28"] = 48,["29"] = 48,["30"] = 49,["31"] = 51,["32"] = 54,["33"] = 58,["34"] = 59,["35"] = 62,["36"] = 65,["37"] = 68,["38"] = 71,["39"] = 72,["40"] = 48,["41"] = 48,["42"] = 75,["43"] = 75,["44"] = 75,["45"] = 75,["46"] = 76,["47"] = 77,["48"] = 78,["49"] = 80,["50"] = 81,["51"] = 80,["52"] = 94,["53"] = 104,["54"] = 112,["55"] = 113,["56"] = 114,["57"] = 114,["58"] = 75,["59"] = 75,["60"] = 47,["61"] = 47});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____player_2Dtitle = require("modules.player-title.player-title")
local PlayerTitleService = ____player_2Dtitle.PlayerTitleService
jest:mock(
    "../../api/api-client",
    function() return {
        ApiClient = {sendToBackupHost = jest:fn()},
        HttpMethod = {GET = "GET"}
    } end
)
jest:mock(
    "../helper/player-helper",
    function() return {PlayerHelper = {ForEachPlayer = jest:fn()}} end
)
describe(
    nil,
    "PlayerTitleService",
    function()
        beforeEach(
            nil,
            function()
                jest:clearAllMocks()
                global.GameRules = {State_Get = jest:fn():mockReturnValue(0)}
                global.GameState = {PRE_GAME = 2, POST_GAME = 6}
                global.ListenToGameEvent = jest:fn()
                global.Timers = {CreateTimer = jest:fn()}
                global.PlayerResource = {GetSteamAccountID = jest:fn()}
                global.CustomNetTables = {SetTableValue = jest:fn()}
                global.json = {decode = jest:fn(function(____, data) return {JSON:parse(data)} end)}
                global.print = jest:fn()
                PlayerHelper.ForEachPlayer:mockImplementation(function() return nil end)
            end
        )
        test(
            nil,
            "requests and parses a player title by steam id without writing the player title table",
            function()
                local service = __TS__New(PlayerTitleService)
                local success = jest:fn()
                local failure = jest:fn()
                ApiClient.sendToBackupHost:mockImplementation(function(____, request)
                    request:successFunc(JSON:stringify({code = 200, data = {achievementTitleDetails = {{title = "title1", level = 3}, {title = "二转·轮回勇士", level = 6}}}}))
                end)
                service:requestTitleBySteamId(123456, success, failure)
                expect(nil, ApiClient.sendToBackupHost):toHaveBeenCalledWith(expect:objectContaining({method = "GET", path = "/player/123456/info", retryTimes = 1, silent = true}))
                expect(nil, success):toHaveBeenCalledWith({title = "title1  二转·轮回勇士", level = 3})
                expect(nil, failure)["not"]:toHaveBeenCalled()
                local ____opt_0 = global.CustomNetTables
                expect(nil, ____opt_0 and ____opt_0.SetTableValue)["not"]:toHaveBeenCalled()
            end
        )
    end
)
return ____exports
