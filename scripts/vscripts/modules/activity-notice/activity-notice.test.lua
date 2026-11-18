local ____lualib = require("lualib_bundle")
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local __TS__TypeOf = ____lualib.__TS__TypeOf
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/activity-notice/activity-notice.test.lua"
__TS__SourceMapTraceBack("modules/activity-notice/activity-notice.test.lua", {["12"] = 12,["13"] = 12,["14"] = 13,["15"] = 13,["16"] = 1,["17"] = 1,["18"] = 1,["19"] = 1,["20"] = 1,["21"] = 1,["22"] = 1,["23"] = 5,["24"] = 5,["25"] = 5,["26"] = 5,["27"] = 8,["28"] = 8,["29"] = 8,["30"] = 8,["31"] = 15,["32"] = 15,["33"] = 15,["34"] = 15,["35"] = 16,["36"] = 17,["37"] = 19,["38"] = 19,["39"] = 19,["40"] = 20,["41"] = 21,["42"] = 23,["43"] = 21,["44"] = 26,["45"] = 27,["46"] = 28,["47"] = 28,["48"] = 28,["49"] = 27,["50"] = 29,["51"] = 30,["52"] = 31,["53"] = 27,["54"] = 27,["55"] = 34,["56"] = 35,["57"] = 36,["58"] = 19,["59"] = 19,["60"] = 39,["61"] = 39,["62"] = 39,["63"] = 40,["64"] = 41,["65"] = 41,["67"] = 39,["68"] = 39,["69"] = 44,["70"] = 44,["71"] = 44,["72"] = 44,["73"] = 45,["74"] = 46,["75"] = 46,["76"] = 46,["77"] = 46,["78"] = 47,["79"] = 47,["80"] = 47,["81"] = 47,["82"] = 50,["83"] = 50,["84"] = 50,["85"] = 50,["86"] = 53,["87"] = 54,["88"] = 56,["89"] = 59,["90"] = 59,["91"] = 59,["92"] = 59,["93"] = 59,["94"] = 56,["95"] = 62,["96"] = 71,["97"] = 72,["98"] = 72,["99"] = 72,["100"] = 72,["101"] = 72,["102"] = 72,["103"] = 72,["104"] = 44,["105"] = 44,["106"] = 77,["107"] = 77,["108"] = 77,["109"] = 77,["110"] = 78,["111"] = 82,["112"] = 82,["113"] = 82,["114"] = 82,["115"] = 87,["116"] = 87,["117"] = 87,["118"] = 87,["119"] = 77,["120"] = 77,["121"] = 15,["122"] = 15});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local ____activity_2Dnotice = require("modules.activity-notice.activity-notice")
local ActivityNotice = ____activity_2Dnotice.ActivityNotice
jest:mock(
    "../../api/api-client",
    function() return {
        ApiClient = {sendToBackupHost = jest:fn()},
        HttpMethod = {GET = "GET"}
    } end
)
jest:mock(
    "../helper/player-helper",
    function() return {PlayerHelper = {ForEachPlayer = jest:fn(function(____, callback) return callback(nil, 0) end)}} end
)
jest:mock(
    "../../api/player",
    function() return {Player = {pointInfoList = {}}} end
)
describe(
    nil,
    "ActivityNotice compact game responses",
    function()
        local tables = {}
        local refresh
        beforeAll(
            nil,
            function()
                local testGlobal = _G
                testGlobal.Timers = {CreateTimer = jest:fn(function(____, _delay, callback)
                    refresh = callback
                end)}
                testGlobal.PlayerResource = {GetSteamAccountID = jest:fn(function() return 123 end)}
                testGlobal.CustomNetTables = {
                    GetTableValue = jest:fn(function(____, ____table, key)
                        local ____opt_0 = tables[____table]
                        return ____opt_0 and ____opt_0[key]
                    end),
                    SetTableValue = jest:fn(function(____, ____table, key, value)
                        tables[____table] = tables[____table] or ({})
                        tables[____table][key] = value
                    end)
                }
                testGlobal.json = {decode = function(____, value) return {JSON:parse(value)} end}
                testGlobal.type = function(____, value) return __TS__ArrayIsArray(value) and "table" or __TS__TypeOf(value) end
                __TS__New(ActivityNotice)
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
            "preserves current-activity and profile notifications from game-v2",
            function()
                refresh(nil)
                local requests = __TS__ArrayMap(
                    ApiClient.sendToBackupHost.mock.calls,
                    function(____, call) return call[0] end
                )
                local activityRequest = __TS__ArrayFind(
                    requests,
                    function(____, request) return request.path == "/activity/current" end
                )
                local profileRequest = __TS__ArrayFind(
                    requests,
                    function(____, request) return request.path == "/showcase/profile" end
                )
                expect(nil, activityRequest.querys):toEqual({compact = "game-v2"})
                expect(nil, profileRequest.querys):toEqual({steamId = "123", compact = "game-v2"})
                activityRequest:successFunc(JSON:stringify({code = 200, data = {t = "活动", a = {{
                    "任务",
                    "说明",
                    "奖励",
                    "开始",
                    "结束"
                }}}}))
                profileRequest:successFunc(JSON:stringify({code = 200, data = {n = {{noticeKey = "notice-1", type = "notice", title = "通知", lines = {"正文"}}}}}))
                local notices = tables.point_info["123"]
                expect(
                    nil,
                    __TS__ArrayMap(
                        notices,
                        function(____, notice) return notice.title.cn end
                    )
                ):toEqual(expect:arrayContaining({"任务<br>说明<br>奖励<br>开始 - 结束", "通知<br>正文"}))
            end
        )
        it(
            nil,
            "continues to decode full legacy notification responses",
            function()
                local notice = __TS__New(ActivityNotice)
                expect(
                    nil,
                    notice:decodeActivityResponse(JSON:stringify({code = 200, data = {title = "旧活动", tasks = {{title = "旧任务"}}}}))
                ):toEqual({title = "旧活动", tasks = {{title = "旧任务"}}})
                expect(
                    nil,
                    notice:decodeProfileResponse(JSON:stringify({code = 200, data = {activityNotices = {{title = "旧通知"}}}}))
                ):toEqual({activityNotices = {{title = "旧通知"}}})
            end
        )
    end
)
return ____exports
