local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/ranking.lua"
__TS__SourceMapTraceBack("api/ranking.lua", {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 3,["14"] = 3,["15"] = 23,["16"] = 23,["17"] = 23,["19"] = 23,["20"] = 27,["21"] = 28,["22"] = 28,["23"] = 28,["24"] = 28,["25"] = 28,["26"] = 28,["27"] = 28,["28"] = 28,["29"] = 27,["30"] = 38,["31"] = 39,["32"] = 43,["33"] = 44,["34"] = 45,["35"] = 45,["36"] = 47,["37"] = 47,["38"] = 47,["39"] = 45,["40"] = 48,["41"] = 48,["42"] = 48,["43"] = 48,["44"] = 48,["45"] = 48,["46"] = 45,["47"] = 45,["50"] = 58,["51"] = 63,["52"] = 64,["55"] = 67,["56"] = 38,["57"] = 70,["58"] = 71,["59"] = 70,["60"] = 74,["61"] = 75,["62"] = 76,["63"] = 77,["64"] = 81,["65"] = 82,["66"] = 74,["67"] = 24,["68"] = 25});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local PlayerRanking = __TS__Class()
PlayerRanking.name = "PlayerRanking"
function PlayerRanking.prototype.____constructor(self)
end
____exports.Ranking = __TS__Class()
local Ranking = ____exports.Ranking
Ranking.name = "Ranking"
function Ranking.prototype.____constructor(self)
end
function Ranking.LoadRankingInfo(self)
    ApiClient:sendToBackupHost({
        method = HttpMethod.GET,
        path = ____exports.Ranking.PLAYER_RANKING_URL,
        querys = {compact = "game-v2"},
        successFunc = ____exports.Ranking.LoadRankingSuccess,
        failureFunc = ____exports.Ranking.LoadRankingFailure,
        timeoutSeconds = 30
    })
end
function Ranking.LoadRankingSuccess(self, data)
    local rankingResponse = (json.decode(data))
    local compact = rankingResponse
    if compact.i ~= nil and compact.s ~= nil then
        ____exports.Ranking:SaveRankingToNetTable({
            id = compact.d or "",
            topSteamIds = __TS__ArrayMap(
                compact.i,
                function(____, steamId) return tostring(steamId) end
            ),
            rankScores = {
                top1000 = compact.s[1] or 0,
                top2000 = compact.s[2] or 0,
                top3000 = compact.s[3] or 0,
                top4000 = compact.s[4] or 0,
                top5000 = compact.s[5] or 0
            }
        })
        return
    end
    local playerRanking = rankingResponse.topSteamIds ~= nil and rankingResponse or rankingResponse[1]
    if not playerRanking then
        ApiClient:DebugLog("[Rank] LoadRanking empty")
        return
    end
    ____exports.Ranking:SaveRankingToNetTable(playerRanking)
end
function Ranking.LoadRankingFailure(self, _)
    ApiClient:DebugLog("[Rank] LoadRanking failure")
end
function Ranking.SaveRankingToNetTable(self, playerRanking)
    local topSteamIds = playerRanking.topSteamIds or ({})
    local netTableTopSteamIds = __TS__ArraySlice(topSteamIds, 0, ____exports.Ranking.MAX_NET_TABLE_RANKING_STEAM_IDS)
    ApiClient:DebugLog((("[Rank] SaveRanking topSteamIds=" .. tostring(#topSteamIds)) .. " netTable=") .. tostring(#netTableTopSteamIds))
    CustomNetTables:SetTableValue("ranking_table", "topSteamIds", netTableTopSteamIds)
    CustomNetTables:SetTableValue("ranking_table", "rankScores", playerRanking.rankScores)
end
Ranking.PLAYER_RANKING_URL = "/player/ranking"
Ranking.MAX_NET_TABLE_RANKING_STEAM_IDS = 500
return ____exports
