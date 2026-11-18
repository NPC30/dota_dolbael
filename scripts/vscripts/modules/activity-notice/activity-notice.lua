local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/activity-notice/activity-notice.lua"
__TS__SourceMapTraceBack("modules/activity-notice/activity-notice.lua", {["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 2,["16"] = 2,["17"] = 3,["18"] = 3,["19"] = 68,["20"] = 68,["21"] = 68,["23"] = 73,["24"] = 74,["25"] = 77,["26"] = 77,["27"] = 77,["28"] = 78,["29"] = 79,["30"] = 77,["31"] = 77,["32"] = 76,["33"] = 83,["34"] = 84,["35"] = 85,["36"] = 83,["37"] = 88,["38"] = 89,["39"] = 89,["40"] = 89,["41"] = 89,["42"] = 89,["43"] = 89,["44"] = 95,["45"] = 96,["46"] = 97,["47"] = 98,["48"] = 89,["49"] = 100,["50"] = 101,["51"] = 89,["52"] = 89,["53"] = 88,["54"] = 106,["55"] = 107,["56"] = 108,["59"] = 111,["60"] = 111,["61"] = 111,["62"] = 114,["63"] = 114,["64"] = 114,["65"] = 111,["66"] = 111,["67"] = 111,["68"] = 117,["69"] = 118,["70"] = 119,["71"] = 120,["72"] = 111,["73"] = 111,["74"] = 111,["75"] = 106,["76"] = 126,["77"] = 127,["78"] = 128,["79"] = 129,["81"] = 131,["82"] = 132,["83"] = 133,["85"] = 135,["86"] = 126,["87"] = 138,["88"] = 139,["89"] = 140,["90"] = 140,["92"] = 141,["93"] = 142,["94"] = 142,["96"] = 143,["97"] = 143,["98"] = 145,["99"] = 145,["100"] = 145,["101"] = 145,["102"] = 145,["103"] = 145,["104"] = 145,["105"] = 145,["106"] = 145,["107"] = 143,["108"] = 143,["109"] = 138,["110"] = 155,["111"] = 156,["112"] = 157,["113"] = 157,["115"] = 158,["116"] = 159,["117"] = 155,["118"] = 162,["119"] = 163,["120"] = 164,["122"] = 165,["123"] = 165,["125"] = 166,["126"] = 167,["127"] = 167,["128"] = 167,["129"] = 167,["130"] = 167,["131"] = 167,["132"] = 167,["133"] = 167,["134"] = 170,["135"] = 171,["137"] = 173,["138"] = 173,["139"] = 173,["140"] = 173,["141"] = 173,["142"] = 173,["143"] = 173,["144"] = 173,["147"] = 165,["150"] = 182,["151"] = 162,["152"] = 185,["153"] = 186,["154"] = 187,["156"] = 189,["157"] = 190,["159"] = 193,["160"] = 194,["161"] = 195,["162"] = 196,["164"] = 198,["165"] = 198,["166"] = 198,["167"] = 198,["168"] = 198,["169"] = 198,["170"] = 198,["171"] = 198,["172"] = 198,["175"] = 191,["178"] = 208,["179"] = 185,["180"] = 211,["181"] = 212,["182"] = 213,["185"] = 216,["188"] = 216,["190"] = 216,["191"] = 216,["192"] = 216,["193"] = 216,["194"] = 216,["195"] = 220,["198"] = 223,["199"] = 223,["200"] = 223,["201"] = 224,["202"] = 225,["203"] = 226,["205"] = 228,["206"] = 229,["207"] = 223,["208"] = 223,["209"] = 231,["212"] = 234,["213"] = 234,["214"] = 234,["215"] = 234,["216"] = 235,["217"] = 236,["218"] = 236,["219"] = 236,["220"] = 239,["221"] = 239,["222"] = 239,["223"] = 239,["224"] = 241,["225"] = 241,["226"] = 241,["227"] = 239,["228"] = 239,["229"] = 239,["230"] = 246,["231"] = 248,["232"] = 249,["233"] = 249,["236"] = 249,["238"] = 246,["239"] = 246,["240"] = 246,["241"] = 246,["242"] = 249,["243"] = 249,["244"] = 249,["245"] = 249,["246"] = 246,["247"] = 246,["248"] = 211,["249"] = 253,["250"] = 254,["251"] = 254,["252"] = 254,["253"] = 254,["254"] = 254,["255"] = 254,["256"] = 254,["257"] = 254,["258"] = 254,["259"] = 254,["260"] = 253,["261"] = 257,["262"] = 261,["263"] = 262,["264"] = 263,["267"] = 263,["269"] = 263,["271"] = 264,["272"] = 264,["273"] = 264,["274"] = 264,["275"] = 265,["276"] = 266,["278"] = 268,["279"] = 269,["283"] = 271,["284"] = 257,["285"] = 274,["286"] = 275,["287"] = 276,["289"] = 278,["290"] = 279,["292"] = 281,["293"] = 274,["294"] = 284,["295"] = 285,["296"] = 286,["298"] = 288,["299"] = 284,["300"] = 69,["301"] = 70,["302"] = 71});
local ____exports = {}
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____player = require("api.player")
local Player = ____player.Player
____exports.ActivityNotice = __TS__Class()
local ActivityNotice = ____exports.ActivityNotice
ActivityNotice.name = "ActivityNotice"
function ActivityNotice.prototype.____constructor(self)
    self.globalNotices = {}
    self.publishedKeys = {}
    Timers:CreateTimer(
        ____exports.ActivityNotice.REFRESH_DELAY,
        function()
            self:refreshAll()
            return nil
        end
    )
end
function ActivityNotice.prototype.refreshAll(self)
    self:refreshCurrentActivity()
    PlayerHelper:ForEachPlayer(function(____, playerId) return self:refreshPlayerNotices(playerId) end)
end
function ActivityNotice.prototype.refreshCurrentActivity(self)
    ApiClient:sendToBackupHost({
        method = HttpMethod.GET,
        path = "/activity/current",
        querys = {compact = "game-v2"},
        retryTimes = 1,
        timeoutSeconds = 5,
        successFunc = function(____, data)
            local activity = self:decodeActivityResponse(data)
            self.globalNotices = activity and self:buildActivityNotices(activity) or ({})
            PlayerHelper:ForEachPlayer(function(____, playerId) return self:publishPlayerNotices(playerId, {}) end)
        end,
        failureFunc = function()
            self.globalNotices = {}
        end
    })
end
function ActivityNotice.prototype.refreshPlayerNotices(self, playerId)
    local steamId = PlayerResource:GetSteamAccountID(playerId)
    if not steamId or steamId <= 0 then
        return
    end
    ApiClient:sendToBackupHost({
        method = HttpMethod.GET,
        path = "/showcase/profile",
        querys = {
            steamId = tostring(steamId),
            compact = "game-v2"
        },
        retryTimes = 1,
        timeoutSeconds = 5,
        successFunc = function(____, data)
            local profile = self:decodeProfileResponse(data)
            local profileNotices = self:buildProfileNotices(profile)
            self:publishPlayerNotices(playerId, profileNotices)
        end,
        failureFunc = function() return self:publishPlayerNotices(playerId, {}) end
    })
end
function ActivityNotice.prototype.decodeResponse(self, data)
    local decoded = (json.decode(data))
    if not decoded then
        return nil
    end
    local response = decoded
    if response.data ~= nil then
        return response.data
    end
    return decoded
end
function ActivityNotice.prototype.decodeActivityResponse(self, data)
    local activity = self:decodeResponse(data)
    if not activity then
        return nil
    end
    local compact = activity
    if compact.a == nil then
        return activity
    end
    return {
        title = compact.t,
        tasks = __TS__ArrayMap(
            compact.a,
            function(____, row) return {
                title = row[1],
                description = row[2],
                rewardText = row[3],
                startDate = row[4],
                endDate = row[5]
            } end
        )
    }
end
function ActivityNotice.prototype.decodeProfileResponse(self, data)
    local profile = self:decodeResponse(data)
    if not profile then
        return nil
    end
    local compact = profile
    return compact.n == nil and profile or ({activityNotices = compact.n})
end
function ActivityNotice.prototype.buildActivityNotices(self, activity)
    local notices = {}
    local tasks = activity.tasks or ({})
    do
        local i = 0
        while i < #tasks do
            do
                local task = tasks[i + 1]
                local lines = __TS__ArrayFilter(
                    {
                        task.description,
                        task.rewardText,
                        self:formatWindow(task)
                    },
                    function(____, line) return line ~= nil and line ~= "" end
                )
                if #lines == 0 then
                    goto __continue24
                end
                notices[#notices + 1] = {
                    id = "activity_current_" .. tostring(i),
                    type = "activity_current",
                    title = task.title or activity.title or "活动公告",
                    lines = lines,
                    primaryText = "知道了",
                    primaryAction = ""
                }
            end
            ::__continue24::
            i = i + 1
        end
    end
    return notices
end
function ActivityNotice.prototype.buildProfileNotices(self, profile)
    local rawNotices = profile and profile.activityNotices or ({})
    local notices = {}
    do
        local i = 0
        while i < #rawNotices and #notices < ____exports.ActivityNotice.MAX_PROFILE_NOTICES do
            do
                local raw = rawNotices[i + 1]
                local lines = self:normalizeLines(raw.lines)
                if not raw.title and #lines == 0 then
                    goto __continue28
                end
                notices[#notices + 1] = {
                    id = raw.noticeKey or raw.id or "profile_notice_" .. tostring(i),
                    type = raw.type or "profile_notice",
                    title = raw.title or "通知",
                    lines = lines,
                    primaryText = raw.primaryText or "知道了",
                    primaryAction = raw.primaryAction or "",
                    secondaryText = raw.secondaryText or ""
                }
            end
            ::__continue28::
            i = i + 1
        end
    end
    return notices
end
function ActivityNotice.prototype.publishPlayerNotices(self, playerId, profileNotices)
    local steamId = PlayerResource:GetSteamAccountID(playerId)
    if not steamId or steamId <= 0 then
        return
    end
    local ____array_2 = __TS__SparseArrayNew(unpack(profileNotices))
    __TS__SparseArrayPush(
        ____array_2,
        unpack(self.globalNotices)
    )
    local notices = __TS__ArraySlice(
        {__TS__SparseArraySpread(____array_2)},
        0,
        ____exports.ActivityNotice.MAX_TOTAL_NOTICES
    )
    if #notices == 0 then
        return
    end
    local newNotices = __TS__ArrayFilter(
        notices,
        function(____, notice)
            local key = (((tostring(steamId) .. "|") .. notice.id) .. "|") .. self:formatNoticeTitle(notice)
            if self.publishedKeys[key] then
                return false
            end
            self.publishedKeys[key] = true
            return true
        end
    )
    if #newNotices == 0 then
        return
    end
    local startGamePointInfo = __TS__ArrayFilter(
        Player.pointInfoList,
        function(____, item) return item.steamId == steamId end
    )
    local currentPointInfo = CustomNetTables:GetTableValue(
        "point_info",
        tostring(steamId)
    ) or ({})
    local noticePointInfo = __TS__ArrayMap(
        newNotices,
        function(____, notice) return {
            steamId = steamId,
            title = {
                cn = self:formatNoticeTitle(notice),
                en = self:formatNoticeTitle(notice)
            }
        } end
    )
    local ____CustomNetTables_SetTableValue_6 = CustomNetTables.SetTableValue
    local ____tostring_result_5 = tostring(steamId)
    local ____self_mergePointInfo_4 = self.mergePointInfo
    local ____array_3 = __TS__SparseArrayNew(unpack(startGamePointInfo))
    __TS__SparseArrayPush(
        ____array_3,
        unpack(currentPointInfo)
    )
    ____CustomNetTables_SetTableValue_6(
        CustomNetTables,
        "point_info",
        ____tostring_result_5,
        ____self_mergePointInfo_4(
            self,
            {__TS__SparseArraySpread(____array_3)},
            noticePointInfo
        )
    )
end
function ActivityNotice.prototype.formatNoticeTitle(self, notice)
    return table.concat(
        __TS__ArrayFilter(
            {
                notice.title,
                unpack(notice.lines)
            },
            function(____, line) return line and line ~= "" end
        ),
        "<br>"
    )
end
function ActivityNotice.prototype.mergePointInfo(self, existing, incoming)
    local merged = {}
    local seen = {}
    local ____array_12 = __TS__SparseArrayNew(unpack(existing))
    __TS__SparseArrayPush(
        ____array_12,
        unpack(incoming)
    )
    for ____, item in ipairs({__TS__SparseArraySpread(____array_12)}) do
        do
            local ____opt_7 = item.title
            local ____temp_11 = ____opt_7 and ____opt_7.cn or ""
            local ____opt_9 = item.title
            local key = (____temp_11 .. "|") .. (____opt_9 and ____opt_9.en or "")
            if seen[key] then
                goto __continue41
            end
            seen[key] = true
            merged[#merged + 1] = item
        end
        ::__continue41::
    end
    return merged
end
function ActivityNotice.prototype.normalizeLines(self, lines)
    if not lines then
        return {}
    end
    if type(lines) == "table" then
        return lines
    end
    return {lines}
end
function ActivityNotice.prototype.formatWindow(self, task)
    if task.startDate and task.endDate then
        return (task.startDate .. " - ") .. task.endDate
    end
    return ""
end
ActivityNotice.REFRESH_DELAY = 12
ActivityNotice.MAX_PROFILE_NOTICES = 4
ActivityNotice.MAX_TOTAL_NOTICES = 6
return ____exports
