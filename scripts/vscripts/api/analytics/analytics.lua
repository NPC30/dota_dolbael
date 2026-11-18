local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/analytics/analytics.lua"
__TS__SourceMapTraceBack("api/analytics/analytics.lua", {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 3,["16"] = 8,["17"] = 9,["18"] = 8,["20"] = 20,["21"] = 19,["22"] = 39,["24"] = 40,["26"] = 39,["27"] = 48,["29"] = 49,["31"] = 48,["32"] = 57,["33"] = 61,["34"] = 62,["35"] = 63,["36"] = 65,["37"] = 68,["38"] = 68,["39"] = 57,["40"] = 77,["42"] = 78,["43"] = 79,["44"] = 80,["45"] = 80,["46"] = 80,["47"] = 80,["48"] = 84,["49"] = 85,["50"] = 80,["51"] = 89,["52"] = 90,["53"] = 80,["54"] = 80,["55"] = 94,["57"] = 77,["58"] = 10,["59"] = 11,["60"] = 12,["61"] = 13,["62"] = 8,["63"] = 9});
local ____exports = {}
local ____GameConfig = require("modules.GameConfig")
local GameConfig = ____GameConfig.GameConfig
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
____exports.Analytics = __TS__Class()
local Analytics = ____exports.Analytics
Analytics.name = "Analytics"
function Analytics.prototype.____constructor(self)
    ApiClient:DebugLog("[Analytic] constructor")
end
function Analytics.SendGameEndPickAbilitiesEvent(self, pickListDto)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        ApiClient:DebugLog(("[Analytic] old SendGameEndPickAbilitiesEvent disabled for " .. tostring(#pickListDto.picks)) .. " picks")
    end)
end
function Analytics.SendGameEndItemBuildsEvent(self, itemListDto)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        ApiClient:DebugLog(("[Analytic] old SendGameEndItemBuildsEvent disabled for " .. tostring(#itemListDto.items)) .. " players")
    end)
end
function Analytics.ListenToPlayerLanguageEvent(self, _userId, event)
    local playerId = event.PlayerID
    local language = event.language
    local steamId = PlayerResource:GetSteamAccountID(playerId)
    ApiClient:DebugLog((("[Analytic] ListenToPlayerLanguageEvent playerId " .. tostring(playerId)) .. " language ") .. language)
    local ____self_PLAYER_LANGUAGES_players_0 = self.PLAYER_LANGUAGES.players
    ____self_PLAYER_LANGUAGES_players_0[#____self_PLAYER_LANGUAGES_players_0 + 1] = {steamId = steamId, language = language}
end
function Analytics.SendUserLanguageStatistics(self)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        ____exports.Analytics.PLAYER_LANGUAGES.matchId = tostring(GameRules:Script_GetMatchID())
        ____exports.Analytics.PLAYER_LANGUAGES.version = GameConfig.GAME_VERSION
        local apiParameter = {
            method = HttpMethod.POST,
            path = self.POST_PLAYER_LANGUAGE_URL,
            body = ____exports.Analytics.PLAYER_LANGUAGES,
            successFunc = function()
                ApiClient:DebugLog(("[Analytic] backup SendUserLanguageStatistics success for " .. tostring(#____exports.Analytics.PLAYER_LANGUAGES.players)) .. " players")
            end,
            failureFunc = function(____, data)
                ApiClient:DebugLog("[Analytic] backup SendUserLanguageStatistics failed " .. data)
            end
        }
        ApiClient:sendToBackupHost(apiParameter)
    end)
end
Analytics.POST_GAME_END_PICK_ABILITIES_URL = "/analytics/game-end/pick/abilities"
Analytics.POST_GAME_END_ITEM_BUILDS_URL = "/analytics/game-end/item-builds"
Analytics.POST_PLAYER_LANGUAGE_URL = "/analytics/player/language"
Analytics.PLAYER_LANGUAGES = {players = {}, matchId = "", version = ""}
Analytics = __TS__DecorateLegacy({reloadable}, Analytics)
____exports.Analytics = Analytics
return ____exports
