local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____player = require("api.player")
local Player = ____player.Player
____exports.ConductApi = __TS__Class()
local ConductApi = ____exports.ConductApi
ConductApi.name = "ConductApi"
function ConductApi.prototype.____constructor(self)
CustomGameEventManager:RegisterListener(
"player_conduct",
function(_, event) return self:onPlayerConduct(event) end
)
end
function ConductApi.prototype.onPlayerConduct(self, event)
local fromPlayerId = event.PlayerID
local fromSteamId = PlayerResource:GetSteamAccountID(fromPlayerId)
local toSteamId = PlayerResource:GetSteamAccountID(event.toPlayerId)
local ____type = event.type
if fromSteamId == 0 or toSteamId == 0 then
print((("[ConductApi] Invalid steamId: from=" .. tostring(fromSteamId)) .. " to=") .. tostring(toSteamId))
return
end
if fromSteamId == toSteamId then
print("[ConductApi] Cannot conduct self")
return
end
ApiClient:sendWithRetry({
method = HttpMethod.POST,
path = "/player/conduct",
body = {fromSteamId = fromSteamId, toSteamId = toSteamId, type = ____type},
successFunc = function(____, data) return ____exports.ConductApi:onSuccess(data) end,
failureFunc = function(____, data) return print("[ConductApi] Failed: " .. data) end,
retryTimes = 1
})
end
function ConductApi.onSuccess(self, data)
local targetPlayer = (json.decode(data))
Player:MergePlayerInfo(targetPlayer)
print("[ConductApi] Success, updated conductPoint=" .. tostring(targetPlayer.conductPoint))
end
return ____exports
