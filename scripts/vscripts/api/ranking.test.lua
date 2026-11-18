local ____lualib = require("lualib_bundle")
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/ranking.test.lua"
__TS__SourceMapTraceBack("api/ranking.test.lua", {["7"] = 9,["8"] = 9,["9"] = 10,["10"] = 10,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 2,["16"] = 2,["17"] = 1,["18"] = 1,["19"] = 1,["20"] = 1,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 13,["26"] = 15,["27"] = 15,["28"] = 15,["29"] = 16,["30"] = 17,["31"] = 18,["32"] = 20,["33"] = 21,["34"] = 18,["35"] = 15,["36"] = 15,["37"] = 26,["38"] = 26,["39"] = 26,["40"] = 27,["41"] = 28,["42"] = 28,["44"] = 26,["45"] = 26,["46"] = 31,["47"] = 31,["48"] = 31,["49"] = 31,["50"] = 32,["51"] = 33,["52"] = 34,["53"] = 36,["54"] = 37,["55"] = 37,["56"] = 37,["57"] = 37,["58"] = 37,["59"] = 36,["60"] = 40,["61"] = 41,["62"] = 41,["63"] = 41,["64"] = 41,["65"] = 41,["66"] = 41,["67"] = 41,["68"] = 31,["69"] = 31,["70"] = 50,["71"] = 50,["72"] = 50,["73"] = 50,["74"] = 51,["75"] = 52,["76"] = 53,["77"] = 57,["78"] = 57,["79"] = 57,["80"] = 57,["81"] = 57,["82"] = 53,["83"] = 66,["84"] = 50,["85"] = 50,["86"] = 12,["87"] = 12});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local ____ranking = require("api.ranking")
local Ranking = ____ranking.Ranking
jest:mock(
    "./api-client",
    function() return {
        ApiClient = {
            sendToBackupHost = jest:fn(),
            DebugLog = jest:fn()
        },
        HttpMethod = {GET = "GET"}
    } end
)
describe(
    nil,
    "Ranking compact game response",
    function()
        local tables = {}
        beforeAll(
            nil,
            function()
                local testGlobal = _G
                testGlobal.json = {decode = function(____, value) return {JSON:parse(value)} end}
                testGlobal.CustomNetTables = {SetTableValue = jest:fn(function(____, ____table, key, value)
                    tables[____table] = tables[____table] or ({})
                    tables[____table][key] = value
                end)}
            end
        )
        beforeEach(
            nil,
            function()
                jest:clearAllMocks()
                for ____, key in ipairs(__TS__ObjectKeys(tables)) do
                    __TS__Delete(tables, key)
                end
            end
        )
        it(
            nil,
            "requests game-v2 and restores the leaderboard net tables",
            function()
                Ranking:LoadRankingInfo()
                local request = ApiClient.sendToBackupHost.mock.calls[1][0]
                expect(nil, request.querys):toEqual({compact = "game-v2"})
                request:successFunc(JSON:stringify({d = "20260918", i = {123, 456}, s = {
                    1000,
                    900,
                    800,
                    700,
                    600
                }}))
                expect(nil, tables.ranking_table.topSteamIds):toEqual({"123", "456"})
                expect(nil, tables.ranking_table.rankScores):toEqual({
                    top1000 = 1000,
                    top2000 = 900,
                    top3000 = 800,
                    top4000 = 700,
                    top5000 = 600
                })
            end
        )
        it(
            nil,
            "continues to accept the full legacy response",
            function()
                Ranking:LoadRankingInfo()
                local request = ApiClient.sendToBackupHost.mock.calls[1][0]
                request:successFunc(JSON:stringify({id = "20260918", topSteamIds = {"789"}, rankScores = {
                    top1000 = 50,
                    top2000 = 40,
                    top3000 = 30,
                    top4000 = 20,
                    top5000 = 10
                }}))
                expect(nil, tables.ranking_table.topSteamIds):toEqual({"789"})
            end
        )
    end
)
return ____exports
