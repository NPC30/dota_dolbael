local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____player = require("api.player")
local Player = ____player.Player
____exports.PlayerSettingApi = __TS__Class()
local PlayerSettingApi = ____exports.PlayerSettingApi
PlayerSettingApi.name = "PlayerSettingApi"
function PlayerSettingApi.prototype.____constructor(self)
CustomGameEventManager:RegisterListener(
"save_bind_ability_key",
function(_, event) return self:SendBindAbilityKey(event) end
)
end
function PlayerSettingApi.prototype.SendBindAbilityKey(self, event)
local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
local playerSetting = {
isRememberAbilityKey = event.isRememberAbilityKey == 1,
activeAbilityKey = event.activeAbilityKey,
passiveAbilityKey = event.passiveAbilityKey,
passiveAbilityKey2 = event.passiveAbilityKey2,
activeAbilityQuickCast = event.activeAbilityQuickCast == 1,
passiveAbilityQuickCast = event.passiveAbilityQuickCast == 1,
passiveAbilityQuickCast2 = event.passiveAbilityQuickCast2 == 1
}
ApiClient:sendWithRetry({
method = HttpMethod.PUT,
path = ("/player/" .. tostring(steamId)) .. "/setting",
body = playerSetting,
successFunc = function(____, data)
local updatedSetting = (json.decode(data))
Player:MergePlayerInfo({
id = tostring(steamId),
playerSetting = updatedSetting
})
end
})
end
return ____exports
