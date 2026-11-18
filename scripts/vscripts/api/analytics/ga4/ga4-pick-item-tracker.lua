local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ga4 = require("api.analytics.ga4.ga4")
local GA4 = ____ga4.GA4
____exports.GA4PickItemTracker = __TS__Class()
local GA4PickItemTracker = ____exports.GA4PickItemTracker
GA4PickItemTracker.name = "GA4PickItemTracker"
function GA4PickItemTracker.prototype.____constructor(self)
end
function GA4PickItemTracker.SendPick(self, playerId, itemName, tier)
local steamId = PlayerResource:GetSteamAccountID(playerId)
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
local event = GA4:BuildEvent(
self.EVENT_NAME,
steamId,
{
steam_id = steamId,
item_name = itemName,
tier = tier,
hero_name = hero and hero:GetUnitName() or "unknown",
team_id = hero and hero:GetTeamNumber() or 0,
dota_duration = math.floor(GameRules:GetDOTATime(false, true))
}
)
GA4:SendEvent(steamId, event)
end
GA4PickItemTracker.EVENT_NAME = "pick_item"
return ____exports
