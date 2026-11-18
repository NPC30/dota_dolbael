local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ga4 = require("api.analytics.ga4.ga4")
local GA4 = ____ga4.GA4
____exports.TreasureTier = TreasureTier or ({})
____exports.TreasureTier.UNKNOWN = 0
____exports.TreasureTier[____exports.TreasureTier.UNKNOWN] = "UNKNOWN"
____exports.TreasureTier.INITIAL = 1
____exports.TreasureTier[____exports.TreasureTier.INITIAL] = "INITIAL"
____exports.TreasureTier.EASY = 2
____exports.TreasureTier[____exports.TreasureTier.EASY] = "EASY"
____exports.TreasureTier.JUNGLE = 3
____exports.TreasureTier[____exports.TreasureTier.JUNGLE] = "JUNGLE"
____exports.TreasureTier.HARD = 4
____exports.TreasureTier[____exports.TreasureTier.HARD] = "HARD"
____exports.GA4TreasureTracker = __TS__Class()
local GA4TreasureTracker = ____exports.GA4TreasureTracker
GA4TreasureTracker.name = "GA4TreasureTracker"
function GA4TreasureTracker.prototype.____constructor(self)
end
function GA4TreasureTracker.SendOpen(self, opener, spawnCount, vector, tier)
local playerId = opener:GetPlayerOwnerID()
local steamId = playerId >= 0 and PlayerResource:IsValidPlayerID(playerId) and PlayerResource:GetSteamAccountID(playerId) or 0
local isBot = steamId <= 0
local event = GA4:BuildEvent(
self.EVENT_NAME,
steamId,
{
steam_id = steamId,
hero_name = opener:GetUnitName(),
team_id = opener:GetTeamNumber(),
is_bot = isBot,
level = spawnCount,
vector = ((((("Vector(" .. tostring(vector.x)) .. ", ") .. tostring(vector.y)) .. ", ") .. tostring(vector.z)) .. ")",
tier = tier,
dota_duration = math.floor(GameRules:GetDOTATime(false, true))
}
)
GA4:SendEvent(steamId, event)
end
GA4TreasureTracker.EVENT_NAME = "treasure_open"
return ____exports
