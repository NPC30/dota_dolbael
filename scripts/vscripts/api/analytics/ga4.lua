local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Number = ____lualib.__TS__Number
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__ParseFloat = ____lualib.__TS__ParseFloat
local __TS__NumberIsNaN = ____lualib.__TS__NumberIsNaN
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/analytics/ga4.lua"
__TS__SourceMapTraceBack("api/analytics/ga4.lua", {["15"] = 1,["16"] = 1,["17"] = 2,["18"] = 2,["19"] = 3,["20"] = 8,["21"] = 13,["32"] = 27,["33"] = 28,["34"] = 27,["36"] = 27,["37"] = 45,["38"] = 46,["41"] = 49,["42"] = 45,["43"] = 57,["44"] = 58,["45"] = 59,["46"] = 60,["47"] = 61,["48"] = 64,["49"] = 65,["51"] = 68,["52"] = 69,["53"] = 70,["54"] = 57,["55"] = 76,["56"] = 77,["57"] = 76,["58"] = 88,["59"] = 94,["60"] = 95,["61"] = 95,["62"] = 97,["63"] = 97,["64"] = 97,["65"] = 97,["66"] = 97,["67"] = 97,["68"] = 97,["69"] = 97,["70"] = 97,["71"] = 97,["72"] = 97,["73"] = 97,["74"] = 97,["75"] = 95,["76"] = 95,["77"] = 110,["78"] = 88,["79"] = 119,["80"] = 120,["81"] = 121,["84"] = 125,["85"] = 119,["86"] = 134,["87"] = 135,["88"] = 136,["91"] = 141,["92"] = 141,["93"] = 141,["94"] = 141,["95"] = 141,["96"] = 147,["97"] = 148,["99"] = 152,["100"] = 134,["101"] = 159,["102"] = 160,["103"] = 161,["106"] = 165,["107"] = 167,["108"] = 171,["109"] = 172,["110"] = 173,["111"] = 173,["112"] = 173,["113"] = 173,["114"] = 174,["115"] = 176,["116"] = 177,["117"] = 178,["119"] = 180,["121"] = 176,["122"] = 159,["123"] = 190,["124"] = 193,["125"] = 195,["126"] = 196,["127"] = 197,["128"] = 199,["129"] = 200,["132"] = 219,["135"] = 203,["136"] = 204,["137"] = 205,["138"] = 206,["139"] = 207,["140"] = 208,["141"] = 209,["142"] = 210,["145"] = 213,["146"] = 214,["147"] = 215,["156"] = 222,["158"] = 199,["159"] = 190,["160"] = 231,["161"] = 233,["162"] = 234,["163"] = 235,["164"] = 236,["166"] = 233,["167"] = 231,["168"] = 247,["169"] = 252,["170"] = 253,["171"] = 259,["172"] = 260,["173"] = 247,["174"] = 269,["175"] = 270,["176"] = 270,["177"] = 270,["178"] = 272,["181"] = 275,["182"] = 277,["183"] = 270,["184"] = 270,["185"] = 269,["186"] = 288,["187"] = 294,["188"] = 295,["189"] = 297,["190"] = 298,["191"] = 299,["194"] = 302,["195"] = 302,["196"] = 303,["197"] = 304,["198"] = 305,["199"] = 305,["200"] = 305,["201"] = 305,["203"] = 302,["206"] = 309,["207"] = 310,["208"] = 311,["209"] = 311,["210"] = 311,["211"] = 311,["213"] = 314,["214"] = 315,["215"] = 316,["216"] = 316,["217"] = 316,["218"] = 316,["220"] = 320,["221"] = 321,["222"] = 321,["223"] = 321,["224"] = 323,["225"] = 324,["226"] = 325,["227"] = 326,["228"] = 327,["229"] = 327,["230"] = 327,["232"] = 322,["233"] = 322,["234"] = 322,["235"] = 322,["236"] = 322,["237"] = 322,["238"] = 322,["239"] = 322,["240"] = 322,["241"] = 332,["242"] = 333,["243"] = 321,["244"] = 321,["245"] = 336,["246"] = 288,["247"] = 345,["248"] = 347,["249"] = 348,["250"] = 349,["253"] = 352,["254"] = 353,["257"] = 357,["258"] = 358,["259"] = 359,["260"] = 362,["261"] = 365,["262"] = 347,["263"] = 345,["264"] = 30,["265"] = 33,["266"] = 34,["267"] = 35,["268"] = 36,["269"] = 37,["270"] = 40,["271"] = 41,["272"] = 43,["273"] = 27,["274"] = 28});
local ____exports = {}
local ____GameConfig = require("modules.GameConfig")
local GameConfig = ____GameConfig.GameConfig
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____ga4_2Ddto = require("api.analytics.dto.ga4-dto")
local SERVER_TYPE = ____ga4_2Ddto.SERVER_TYPE
____exports.SERVER_TYPE = SERVER_TYPE
--- GA4 - Google Analytics 4 集成
-- 
-- 此类处理使用 Measurement Protocol 向 Google Analytics 4 发送事件
-- 参考: https://developers.google.com/analytics/devguides/collection/protocol/ga4
-- 
-- 架构:
-- - 配置从 /api/game/start 接收（仅官方服务器）
-- - 事件直接发送到 GA4 Measurement Protocol 端点
-- - 使用 Dota 2 的 CreateHTTPRequestScriptVM 发送 HTTP 请求
-- - 在 Tools 模式下自动启用调试模式（IsInToolsMode）
____exports.GA4 = __TS__Class()
local GA4 = ____exports.GA4
GA4.name = "GA4"
function GA4.prototype.____constructor(self)
end
function GA4.DebugLog(self, message)
    if not IsInToolsMode() then
        return
    end
    print(message)
end
function GA4.Initialize(self, config)
    self.measurementId = config.measurementId
    self.apiSecret = config.apiSecret
    self.serverType = config.serverType
    self.isInitialized = true
    if IsInToolsMode() then
        self.isDebugMode = true
    end
    self:DebugLog("[GA4] Initialized with measurementId: " .. self.measurementId)
    self:DebugLog("[GA4] Server type: " .. self.serverType)
    self:DebugLog("[GA4] Debug mode: " .. (self.isDebugMode and "enabled" or "disabled"))
end
function GA4.IsInitialized(self)
    return self.isInitialized and self.measurementId ~= nil and self.apiSecret ~= nil
end
function GA4.BuildEvent(self, eventName, steamId, eventParams, engagementTimeMsec)
    local matchId = tostring(GameRules:Script_GetMatchID())
    local event = {
        name = eventName,
        params = __TS__ObjectAssign(
            {},
            eventParams,
            {
                session_id = (tostring(steamId) .. "-") .. matchId,
                session_number = __TS__Number(matchId),
                version = GameConfig.GAME_VERSION,
                match_id = __TS__Number(matchId),
                server_type = self.serverType,
                country = self.countryCode,
                engagement_time_msec = engagementTimeMsec or eventParams.engagement_time_msec or 1000,
                debug_mode = self.isDebugMode
            }
        )
    }
    return event
end
function GA4.SendEvent(self, steamId, event, userProperties)
    if not self:IsInitialized() then
        self:DebugLog("[GA4] Not initialized, skipping event send")
        return
    end
    self:SendEvents(steamId, {event}, userProperties)
end
function GA4.SendEvents(self, steamId, events, userProperties)
    if not self:IsInitialized() then
        self:DebugLog("[GA4] Not initialized, skipping events send")
        return
    end
    local payload = {
        client_id = tostring(steamId),
        user_id = tostring(steamId),
        events = events
    }
    if userProperties then
        payload.user_properties = userProperties
    end
    self:SendPayload(payload)
end
function GA4.SendPayload(self, payload)
    if not self:IsInitialized() then
        self:DebugLog("[GA4] Missing configuration, cannot send payload")
        return
    end
    local fullUrl = (((self.MEASUREMENT_PROTOCOL_URL .. "?measurement_id=") .. tostring(self.measurementId)) .. "&api_secret=") .. tostring(self.apiSecret)
    self:DebugLog((("[GA4] Sending " .. tostring(#payload.events)) .. " event(s) to GA4: ") .. json.encode(payload))
    local request = CreateHTTPRequestScriptVM("POST", fullUrl)
    request:SetHTTPRequestHeaderValue("Content-Type", "application/json")
    request:SetHTTPRequestRawPostBody(
        "application/json",
        json.encode(payload)
    )
    request:SetHTTPRequestNetworkActivityTimeout(10)
    request:Send(function(result)
        if result.StatusCode >= 200 and result.StatusCode < 300 then
            self:DebugLog("[GA4] Successfully sent events. Status: " .. tostring(result.StatusCode))
        else
            self:DebugLog((("[GA4] Failed to send events. Status: " .. tostring(result.StatusCode)) .. ", Response: ") .. result.Body)
        end
    end)
end
function GA4.FetchCurrentTime(self, callback)
    local apiUrl = "https://cloudflare.com/cdn-cgi/trace"
    self:DebugLog("[GA4] Fetching current time from: " .. apiUrl)
    local request = CreateHTTPRequestScriptVM("GET", apiUrl)
    request:SetHTTPRequestNetworkActivityTimeout(5)
    request:Send(function(result)
        if result.StatusCode >= 200 and result.StatusCode < 300 then
            do
                local function ____catch()
                    self:DebugLog("[GA4] Failed to parse time API response: " .. result.Body)
                end
                local ____try = pcall(function()
                    local body = result.Body
                    local lines = __TS__StringSplit(body, "\n")
                    for ____, line in ipairs(lines) do
                        if __TS__StringStartsWith(line, "ts=") then
                            local timestamp = __TS__ParseFloat(__TS__StringSubstring(line, 3))
                            if not __TS__NumberIsNaN(__TS__Number(timestamp)) then
                                self:DebugLog("[GA4] Successfully fetched time: " .. tostring(timestamp))
                                callback(nil, timestamp)
                            end
                        end
                        if __TS__StringStartsWith(line, "loc=") then
                            self.countryCode = __TS__StringSubstring(line, 4)
                            self:DebugLog("[GA4] Successfully fetched server location: " .. self.countryCode)
                        end
                    end
                end)
                if not ____try then
                    ____catch()
                end
            end
        else
            self:DebugLog("[GA4] Time API request failed with status: " .. tostring(result.StatusCode))
        end
    end)
end
function GA4.RecordGameStartTime(self)
    self:FetchCurrentTime(function(____, timestamp)
        if timestamp ~= nil then
            self.gameStartRealTime = timestamp
            self.gameStartDotatime = Time()
        end
    end)
end
function GA4.SendMatchTimingEvent(self, realDurationRatio, dotaDuration, realDuration)
    local eventName = "game_end_match_time"
    local eventParams = {dota_duration = dotaDuration, real_duration = realDuration, real_duration_ratio = realDurationRatio}
    local event = self:BuildEvent(eventName, 0, eventParams)
    self:SendEvent(0, event)
end
function GA4.SendPlayerLevelEvents(self, gameEndDto, realDurationRatio)
    __TS__ArrayForEach(
        gameEndDto.players,
        function(____, player)
            if player.steamId <= 0 then
                return
            end
            local itemEvents = self:BuildItemEvents(player, gameEndDto, realDurationRatio)
            self:SendEvents(player.steamId, itemEvents)
        end
    )
end
function GA4.BuildItemEvents(self, player, gameEndDto, realDurationRatio)
    local eventName = "game_end_item_build"
    local itemSlots = {}
    local hero = PlayerResource:GetSelectedHeroEntity(player.playerId)
    if not hero then
        return {}
    end
    do
        local i = 0
        while i < 6 do
            local item = hero:GetItemInSlot(i)
            if item then
                itemSlots[#itemSlots + 1] = {
                    name = item:GetAbilityName(),
                    type = "normal"
                }
            end
            i = i + 1
        end
    end
    local neutralActiveItem = hero:GetItemInSlot(DOTA_ITEM_NEUTRAL_ACTIVE_SLOT)
    if neutralActiveItem then
        itemSlots[#itemSlots + 1] = {
            name = neutralActiveItem:GetAbilityName(),
            type = "neutral_active"
        }
    end
    local neutralPassiveItem = hero:GetItemInSlot(DOTA_ITEM_NEUTRAL_PASSIVE_SLOT)
    if neutralPassiveItem then
        itemSlots[#itemSlots + 1] = {
            name = neutralPassiveItem:GetAbilityName(),
            type = "neutral_passive"
        }
    end
    local itemEvents = {}
    __TS__ArrayForEach(
        itemSlots,
        function(____, slot)
            local ____player_heroName_1 = player.heroName
            local ____slot_name_2 = slot.name
            local ____slot_type_3 = slot.type
            local ____gameEndDto_difficulty_4 = gameEndDto.difficulty
            local ____gameEndDto_isWin_0 = gameEndDto.isWin
            if ____gameEndDto_isWin_0 == nil then
                ____gameEndDto_isWin_0 = false
            end
            local eventParams = {
                hero_name = ____player_heroName_1,
                item_name = ____slot_name_2,
                type = ____slot_type_3,
                difficulty = ____gameEndDto_difficulty_4,
                win_metrics = ____gameEndDto_isWin_0,
                team_id = player.teamId,
                real_duration_ratio = realDurationRatio
            }
            local event = self:BuildEvent(eventName, player.steamId, eventParams)
            itemEvents[#itemEvents + 1] = event
        end
    )
    return itemEvents
end
function GA4.SendGameEndEvents(self, gameEndDto)
    self:FetchCurrentTime(function(____, endRealTime)
        if self.gameStartRealTime == nil or self.gameStartDotatime == nil then
            self:DebugLog("[GA4] Game start real time not recorded, skipping event send")
            return
        end
        if endRealTime == nil then
            self:DebugLog("[GA4] Failed to fetch end real time, skipping event send")
            return
        end
        local dotaDuration = Time() - self.gameStartDotatime
        local realDuration = endRealTime - self.gameStartRealTime
        local realDurationRatio = realDuration / dotaDuration
        self:SendMatchTimingEvent(realDurationRatio, dotaDuration, realDuration)
        self:SendPlayerLevelEvents(gameEndDto, realDurationRatio)
    end)
end
GA4.MEASUREMENT_PROTOCOL_URL = "https://www.google-analytics.com/mp/collect"
GA4.measurementId = nil
GA4.apiSecret = nil
GA4.serverType = SERVER_TYPE.UNKNOWN
GA4.isInitialized = false
GA4.isDebugMode = false
GA4.gameStartRealTime = nil
GA4.gameStartDotatime = nil
GA4.countryCode = ""
GA4 = __TS__DecorateLegacy({reloadable}, GA4)
____exports.GA4 = GA4
return ____exports
