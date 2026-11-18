local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/player-task.lua"
__TS__SourceMapTraceBack("api/player-task.lua", {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 44,["14"] = 44,["15"] = 44,["17"] = 44,["18"] = 48,["19"] = 49,["22"] = 52,["23"] = 53,["24"] = 48,["25"] = 56,["26"] = 57,["29"] = 60,["30"] = 56,["31"] = 63,["32"] = 64,["33"] = 64,["34"] = 64,["35"] = 67,["36"] = 67,["37"] = 67,["38"] = 64,["39"] = 64,["40"] = 64,["41"] = 64,["42"] = 64,["43"] = 72,["44"] = 73,["45"] = 74,["46"] = 74,["47"] = 74,["48"] = 74,["49"] = 74,["50"] = 74,["51"] = 74,["52"] = 64,["53"] = 64,["54"] = 63,["55"] = 82,["56"] = 83,["57"] = 86,["58"] = 88,["59"] = 88,["60"] = 88,["61"] = 88,["62"] = 88,["63"] = 88,["64"] = 88,["65"] = 88,["66"] = 88,["67"] = 82,["68"] = 96,["69"] = 97,["70"] = 97,["71"] = 97,["72"] = 97,["73"] = 97,["74"] = 96,["75"] = 100,["76"] = 101,["77"] = 100,["78"] = 45,["79"] = 46});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____player_2Dlanguage = require("api.player-language")
local PlayerLanguage = ____player_2Dlanguage.PlayerLanguage
____exports.PlayerTask = __TS__Class()
local PlayerTask = ____exports.PlayerTask
PlayerTask.name = "PlayerTask"
function PlayerTask.prototype.____constructor(self)
end
function PlayerTask.LoadPlayerTasksOnce(self, steamId)
    if not steamId or steamId <= 0 or ____exports.PlayerTask.requestedSteamIds:has(steamId) then
        return
    end
    ____exports.PlayerTask.requestedSteamIds:add(steamId)
    ____exports.PlayerTask:LoadPlayerTasks(steamId)
end
function PlayerTask.RefreshPlayerTasks(self, steamId)
    if not steamId or steamId <= 0 then
        return
    end
    ____exports.PlayerTask:LoadPlayerTasks(steamId)
end
function PlayerTask.LoadPlayerTasks(self, steamId)
    ApiClient:sendToBackupHost({
        method = HttpMethod.GET,
        path = ____exports.PlayerTask.PLAYER_TASK_URL,
        querys = {
            steamId = tostring(steamId),
            lang = PlayerLanguage:GetApiLang(steamId)
        },
        retryTimes = 1,
        timeoutSeconds = 8,
        silent = true,
        successFunc = function(____, data) return ____exports.PlayerTask:LoadPlayerTasksSuccess(steamId, data) end,
        failureFunc = function(____, data)
            ApiClient:DebugLog((("[PlayerTask] request failed steamId=" .. tostring(steamId)) .. ", data=") .. data)
            ____exports.PlayerTask:SavePlayerTasks(
                steamId,
                {
                    message = ____exports.PlayerTask:Text(steamId, "任务加载失败", "Failed to load tasks"),
                    tasks = {}
                }
            )
        end
    })
end
function PlayerTask.LoadPlayerTasksSuccess(self, steamId, data)
    local decoded = (json.decode(data))
    local taskData = decoded.data or decoded
    ____exports.PlayerTask:SavePlayerTasks(
        steamId,
        {
            title = taskData.title or ____exports.PlayerTask:Text(steamId, "我的任务", "My Tasks"),
            summary = taskData.summary or ({}),
            tasks = taskData.tasks or ({}),
            message = taskData.message or ""
        }
    )
end
function PlayerTask.SavePlayerTasks(self, steamId, taskData)
    CustomNetTables:SetTableValue(
        "player_task_table",
        tostring(steamId),
        taskData
    )
end
function PlayerTask.Text(self, steamId, zh, en)
    return PlayerLanguage:GetApiLang(steamId) == "en" and en or zh
end
PlayerTask.PLAYER_TASK_URL = "/activity/tasks"
PlayerTask.requestedSteamIds = __TS__New(Set)
return ____exports
