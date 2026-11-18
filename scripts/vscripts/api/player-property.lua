local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Number = ____lualib.__TS__Number
local ____exports = {}
local ____property_controller = require("modules.property.property_controller")
local PropertyController = ____property_controller.PropertyController
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____player = require("api.player")
local Player = ____player.Player
____exports.PlayerPropertyApi = __TS__Class()
local PlayerPropertyApi = ____exports.PlayerPropertyApi
PlayerPropertyApi.name = "PlayerPropertyApi"
function PlayerPropertyApi.prototype.____constructor(self)
CustomGameEventManager:RegisterListener(
"player_property_levelup",
function(_, event) return self:onPlayerPropertyLevelup(event) end
)
CustomGameEventManager:RegisterListener(
"player_property_reset",
function(_, event) return self:onPlayerPropertyReset(event) end
)
end
function PlayerPropertyApi.SetPlayerProperty(self, hero)
if not hero then
return
end
local steamId = PlayerResource:GetSteamAccountID(hero:GetPlayerOwnerID())
local playerInfo = Player.playerInfoMap:get(tostring(steamId))
if playerInfo and playerInfo.properties then
for ____, property in ipairs(playerInfo.properties) do
PropertyController:LevelupHeroProperty(hero, property)
end
end
end
function PlayerPropertyApi.ApplyPropertyModifiers(self, player)
if not player.properties then
return
end
for ____, property in ipairs(player.properties) do
PropertyController:LevelupPlayerProperty(property)
end
end
function PlayerPropertyApi.prototype.onPlayerPropertyLevelup(self, event)
local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
ApiClient:sendWithRetry({
method = HttpMethod.PUT,
path = ("/player/" .. tostring(steamId)) .. "/property",
body = {name = event.name, level = event.level},
successFunc = ____exports.PlayerPropertyApi.PropertyLevelupSuccess,
failureFunc = ____exports.PlayerPropertyApi.PropertyLevelupFailure
})
end
function PlayerPropertyApi.PropertyLevelupSuccess(self, data)
local player = (json.decode(data))
Player:MergePlayerInfo(player)
____exports.PlayerPropertyApi:ApplyPropertyModifiers(player)
end
function PlayerPropertyApi.PropertyLevelupFailure(self, _data)
end
function PlayerPropertyApi.prototype.onPlayerPropertyReset(self, event)
local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
ApiClient:sendWithRetry({
method = HttpMethod.DELETE,
path = ("/player/" .. tostring(steamId)) .. "/property",
querys = {useMemberPoint = event.useMemberPoint == 1 and "true" or "false"},
successFunc = ____exports.PlayerPropertyApi.PropertyResetSuccess,
failureFunc = ____exports.PlayerPropertyApi.PropertyResetFailure
})
end
function PlayerPropertyApi.PropertyResetSuccess(self, data)
print("[PlayerProperty] Reset Success data " .. data)
local player = (json.decode(data))
PropertyController:RemoveAllPlayerProperty(__TS__Number(player.id))
Player:MergePlayerInfo(player)
____exports.PlayerPropertyApi:ApplyPropertyModifiers(player)
end
function PlayerPropertyApi.PropertyResetFailure(self, data)
print("[PlayerProperty] Reset Failure data " .. data)
end
return ____exports
