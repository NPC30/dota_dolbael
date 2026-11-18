local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____member_2Dhelper = require("modules.helper.member-helper")
local MemberHelper = ____member_2Dhelper.MemberHelper
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____player = require("api.player")
local Player = ____player.Player
____exports.PlayerInfoApi = __TS__Class()
local PlayerInfoApi = ____exports.PlayerInfoApi
PlayerInfoApi.name = "PlayerInfoApi"
function PlayerInfoApi.prototype.____constructor(self)
CustomGameEventManager:RegisterListener(
"player_info_refresh",
function(_, event) return self:onPlayerInfoRefresh(event) end
)
end
function PlayerInfoApi.prototype.onPlayerInfoRefresh(self, event)
local playerId = event.PlayerID
local steamId = PlayerResource:GetSteamAccountID(playerId)
ApiClient:sendWithRetry({
method = HttpMethod.GET,
path = ("/player/" .. tostring(steamId)) .. "/info",
querys = {include = "member"},
successFunc = function(____, data) return ____exports.PlayerInfoApi:RefreshSuccess(data, playerId) end,
failureFunc = ____exports.PlayerInfoApi.RefreshFailure
})
end
function PlayerInfoApi.RefreshSuccess(self, data, playerId)
local player = (json.decode(data))
Player:MergePlayerInfo(player)
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
if hero then
MemberHelper:ApplyMemberModifier(hero)
end
end
function PlayerInfoApi.RefreshFailure(self, data)
print("[PlayerInfo] Refresh failed: " .. data)
end
return ____exports
