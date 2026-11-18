local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____player = require("api.player")
local Player = ____player.Player
____exports.PlayerMemberPointApi = __TS__Class()
local PlayerMemberPointApi = ____exports.PlayerMemberPointApi
PlayerMemberPointApi.name = "PlayerMemberPointApi"
function PlayerMemberPointApi.prototype.____constructor(self)
end
function PlayerMemberPointApi.UseMemberPoint(self, steamId, memberPoint, reason)
ApiClient:sendWithRetry({
method = HttpMethod.POST,
path = "/player/member-points/use",
body = {steamId = steamId, memberPoint = memberPoint, reason = reason},
successFunc = function(____, data)
local player = (json.decode(data))
Player:MergePlayerInfo(player)
end,
failureFunc = function(____, data)
print("[PlayerMemberPoint] UseMemberPoint failed: " .. data)
end
})
end
return ____exports
