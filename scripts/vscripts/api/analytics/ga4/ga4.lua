local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Number = ____lualib.__TS__Number
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__ParseFloat = ____lualib.__TS__ParseFloat
local __TS__NumberIsNaN = ____lualib.__TS__NumberIsNaN
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____GameConfig = require("modules.GameConfig")
local GameConfig = ____GameConfig.GameConfig
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____ga4_2Ddto = require("api.analytics.ga4.dto.ga4-dto")
local SERVER_TYPE = ____ga4_2Ddto.SERVER_TYPE
____exports.SERVER_TYPE = SERVER_TYPE
____exports.GA4 = __TS__Class()
local GA4 = ____exports.GA4
GA4.name = "GA4"
function GA4.prototype.____constructor(self)
end
function GA4.Initialize(self, config)
self.measurementId = config.measurementId
self.apiSecret = config.apiSecret
self.serverType = config.serverType
self.isInitialized = true
if IsInToolsMode() then
self.isDebugMode = true
end
print("[GA4] Initialized with measurementId: " .. self.measurementId)
print("[GA4] Server type: " .. self.serverType)
print("[GA4] Debug mode: " .. (self.isDebugMode and "enabled" or "disabled"))
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
print("[GA4] Not initialized, skipping event send")
return
end
self:SendEvents(steamId, {event}, userProperties)
end
function GA4.SendEvents(self, steamId, events, userProperties)
if not self:IsInitialized() then
print("[GA4] Not initialized, skipping events send")
return
end
local BATCH_SIZE = 25
do
local i = 0
while i < #events do
local payload = {
client_id = tostring(steamId),
user_id = tostring(steamId),
events = __TS__ArraySlice(events, i, i + BATCH_SIZE)
}
if userProperties then
payload.user_properties = userProperties
end
self:SendPayload(payload)
i = i + BATCH_SIZE
end
end
end
function GA4.SendPayload(self, payload)
if not self:IsInitialized() then
print("[GA4] Missing configuration, cannot send payload")
return
end
local fullUrl = (((self.MEASUREMENT_PROTOCOL_URL .. "?measurement_id=") .. tostring(self.measurementId)) .. "&api_secret=") .. tostring(self.apiSecret)
print((("[GA4] Sending " .. tostring(#payload.events)) .. " event(s) to GA4: ") .. json.encode(payload))
local request = CreateHTTPRequestScriptVM("POST", fullUrl)
request:SetHTTPRequestHeaderValue("Content-Type", "application/json")
request:SetHTTPRequestRawPostBody(
"application/json",
json.encode(payload)
)
request:SetHTTPRequestNetworkActivityTimeout(10)
request:Send(function(result)
if result.StatusCode >= 200 and result.StatusCode < 300 then
print("[GA4] Successfully sent events. Status: " .. tostring(result.StatusCode))
else
print((("[GA4] Failed to send events. Status: " .. tostring(result.StatusCode)) .. ", Response: ") .. result.Body)
end
end)
end
function GA4.FetchCurrentTime(self, callback)
local apiUrl = "https://cloudflare.com/cdn-cgi/trace"
print("[GA4] Fetching current time from: " .. apiUrl)
local request = CreateHTTPRequestScriptVM("GET", apiUrl)
request:SetHTTPRequestNetworkActivityTimeout(5)
request:Send(function(result)
if result.StatusCode >= 200 and result.StatusCode < 300 then
do
local function ____catch()
print("[GA4] Failed to parse time API response: " .. result.Body)
end
local ____try = pcall(function()
local body = result.Body
local lines = __TS__StringSplit(body, "\n")
for ____, line in ipairs(lines) do
if __TS__StringStartsWith(line, "ts=") then
local timestamp = __TS__ParseFloat(__TS__StringSubstring(line, 3))
if not __TS__NumberIsNaN(__TS__Number(timestamp)) then
print("[GA4] Successfully fetched time: " .. tostring(timestamp))
callback(nil, timestamp)
end
end
if __TS__StringStartsWith(line, "loc=") then
self.countryCode = __TS__StringSubstring(line, 4)
print("[GA4] Successfully fetched server location: " .. self.countryCode)
end
end
end)
if not ____try then
____catch()
end
end
else
print("[GA4] Time API request failed with status: " .. tostring(result.StatusCode))
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
function GA4.SendGameEndMatchTimeEvents(self)
self:FetchCurrentTime(function(____, endRealTime)
if self.gameStartRealTime == nil or self.gameStartDotatime == nil then
print("[GA4] Game start real time not recorded, skipping event send")
return
end
if endRealTime == nil then
print("[GA4] Failed to fetch end real time, skipping event send")
return
end
local dotaDuration = Time() - self.gameStartDotatime
local realDuration = endRealTime - self.gameStartRealTime
local realDurationRatio = realDuration / dotaDuration
self:SendMatchTimingEvent(realDurationRatio, dotaDuration, realDuration)
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
