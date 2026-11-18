local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local Set = ____lualib.Set
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local MAX_ORDERS_PER_GAME = 10
____exports.AlipayApi = __TS__Class()
local AlipayApi = ____exports.AlipayApi
AlipayApi.name = "AlipayApi"
function AlipayApi.prototype.____constructor(self)
self.orderCountMap = __TS__New(Map)
self.inFlightQuerySet = __TS__New(Set)
CustomGameEventManager:RegisterListener(
"alipay_order_create",
function(_, event) return self:onCreate(event) end
)
CustomGameEventManager:RegisterListener(
"alipay_order_query",
function(_, event) return self:onQuery(event) end
)
CustomGameEventManager:RegisterListener(
"alipay_order_clear",
function(_, event) return self:onClear(event) end
)
end
function AlipayApi.prototype.onCreate(self, event)
local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
local clientEpoch = event.clientEpoch
local currentCount = self.orderCountMap:get(steamId) or 0
if currentCount >= MAX_ORDERS_PER_GAME then
____exports.AlipayApi:ResetNetTable(
steamId,
{
status = "RATE_LIMITED",
clientEpoch = clientEpoch,
updatedAt = GameRules:GetGameTime()
}
)
return
end
self.orderCountMap:set(steamId, currentCount + 1)
____exports.AlipayApi:ResetNetTable(
steamId,
{
status = "CREATING",
productCode = event.productCode,
quantity = event.quantity,
clientEpoch = clientEpoch,
updatedAt = GameRules:GetGameTime()
}
)
ApiClient:sendWithRetry({
method = HttpMethod.POST,
path = "/alipay/order/create",
body = {steamId = steamId, productCode = event.productCode, quantity = event.quantity},
successFunc = function(____, data)
local dto = (json.decode(data))
____exports.AlipayApi:WriteNetTableIfEpoch(
steamId,
clientEpoch,
{
status = "WAITING",
productCode = event.productCode,
outTradeNo = dto.outTradeNo,
qrCode = dto.qrCode,
totalAmount = dto.totalAmount,
subject = dto.subject,
expiresAt = dto.expiresAt,
updatedAt = GameRules:GetGameTime()
}
)
end,
failureFunc = function(____, data)
____exports.AlipayApi:WriteNetTableIfEpoch(
steamId,
clientEpoch,
{
status = "ERROR",
errorMessage = data,
updatedAt = GameRules:GetGameTime()
}
)
end
})
end
function AlipayApi.prototype.onQuery(self, event)
local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
if self.inFlightQuerySet:has(steamId) then
return
end
self.inFlightQuerySet:add(steamId)
local currentEpoch = ____exports.AlipayApi:GetCurrentEpoch(steamId)
ApiClient:sendWithRetry({
method = HttpMethod.GET,
path = "/alipay/order/query",
querys = {outTradeNo = event.outTradeNo},
retryTimes = 1,
timeoutSeconds = 5,
successFunc = function(____, data)
self.inFlightQuerySet:delete(steamId)
local dto = (json.decode(data))
if dto.status == "SUCCESS" then
self.orderCountMap:delete(steamId)
end
____exports.AlipayApi:WriteNetTableIfEpoch(
steamId,
currentEpoch,
{
status = dto.status,
updatedAt = GameRules:GetGameTime()
}
)
end,
failureFunc = function()
self.inFlightQuerySet:delete(steamId)
end
})
end
function AlipayApi.prototype.onClear(self, event)
local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
____exports.AlipayApi:ResetNetTable(
steamId,
{
status = "IDLE",
clientEpoch = 0,
updatedAt = GameRules:GetGameTime()
}
)
end
function AlipayApi.GetCurrentEpoch(self, steamId)
local key = tostring(steamId)
local current = CustomNetTables:GetTableValue("alipay_order", key) or ({})
return current.clientEpoch or 0
end
function AlipayApi.ResetNetTable(self, steamId, value)
local key = tostring(steamId)
CustomNetTables:SetTableValue("alipay_order", key, value)
end
function AlipayApi.WriteNetTableIfEpoch(self, steamId, expectedEpoch, partial)
local key = tostring(steamId)
local current = CustomNetTables:GetTableValue("alipay_order", key) or ({})
if current.clientEpoch ~= expectedEpoch then
return
end
local next = __TS__ObjectAssign({}, current, partial)
CustomNetTables:SetTableValue("alipay_order", key, next)
end
return ____exports
