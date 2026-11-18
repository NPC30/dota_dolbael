local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ObjectRest = ____lualib.__TS__ObjectRest
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local ____exports = {}
local ____neutral_2Ditem = require("ai.item.neutral-item")
local NeutralItemManager = ____neutral_2Ditem.NeutralItemManager
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____ga4 = require("api.analytics.ga4.ga4")
local GA4 = ____ga4.GA4
____exports.GA4ItemTracker = __TS__Class()
local GA4ItemTracker = ____exports.GA4ItemTracker
GA4ItemTracker.name = "GA4ItemTracker"
function GA4ItemTracker.prototype.____constructor(self)
end
function GA4ItemTracker.StartTracking(self)
if self.isTracking then
return
end
self.isTracking = true
Timers:CreateTimer(
self.SAMPLE_INTERVAL_SECONDS,
function()
self:Sample()
return self.SAMPLE_INTERVAL_SECONDS
end
)
print("[GA4ItemTracker] Started item tracking")
end
function GA4ItemTracker.Sample(self)
local sampleNumber = math.floor(GameRules:GetGameTime() / self.SAMPLE_INTERVAL_SECONDS + 0.5)
print(((("[GA4ItemTracker] Sample #" .. tostring(sampleNumber)) .. " at ") .. tostring(GameRules:GetGameTime())) .. "s")
PlayerHelper:ForEachPlayer(function(____, playerId)
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
if not hero then
return
end
self:SampleHeroItems(playerId, hero)
end)
end
function GA4ItemTracker.SampleHeroItems(self, playerId, hero, isGameEnd)
if isGameEnd == nil then
isGameEnd = false
end
do
local i = 0
while i < 6 do
local item = hero:GetItemInSlot(i)
if item then
self:AddSample(
playerId,
item:GetAbilityName(),
"normal",
item:GetCost(),
isGameEnd
)
end
i = i + 1
end
end
local neutralActive = hero:GetItemInSlot(DOTA_ITEM_NEUTRAL_ACTIVE_SLOT)
if neutralActive then
self:AddSample(
playerId,
neutralActive:GetAbilityName(),
"neutral_active",
neutralActive:GetCost(),
isGameEnd,
NeutralItemManager:GetNeutralItemTier(
neutralActive:GetAbilityName(),
neutralActive:GetLevel()
)
)
end
local neutralPassive = hero:GetItemInSlot(DOTA_ITEM_NEUTRAL_PASSIVE_SLOT)
if neutralPassive then
self:AddSample(
playerId,
neutralPassive:GetAbilityName(),
"neutral_passive",
neutralPassive:GetCost(),
isGameEnd,
NeutralItemManager:GetNeutralItemTier(
neutralPassive:GetAbilityName(),
neutralPassive:GetLevel()
)
)
end
end
function GA4ItemTracker.AddSample(self, playerId, itemName, ____type, cost, isGameEnd, tier)
if isGameEnd == nil then
isGameEnd = false
end
local key = (tostring(playerId) .. ":") .. itemName
local existing = self.samples:get(key)
if existing then
existing.sampleCount = existing.sampleCount + 1
if isGameEnd then
existing.isCarriedAtEnd = true
end
else
self.samples:set(key, {
playerId = playerId,
itemName = itemName,
type = ____type,
cost = cost,
tier = tier,
sampleCount = 1,
isCarriedAtEnd = isGameEnd
})
end
end
function GA4ItemTracker.SendAtGameEnd(self, gameEndDto)
PlayerHelper:ForEachPlayer(function(____, playerId)
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
if not hero then
return
end
self:SampleHeroItems(playerId, hero, true)
end)
local byPlayer = __TS__New(Map)
self.samples:forEach(function(____, entry)
local ____entry_0 = entry
local playerId = ____entry_0.playerId
local itemEntry = __TS__ObjectRest(____entry_0, {playerId = true})
local existing = byPlayer:get(playerId)
if existing then
existing[#existing + 1] = itemEntry
else
byPlayer:set(playerId, {itemEntry})
end
end)
local eventName = "game_end_item_duration"
__TS__ArrayForEach(
gameEndDto.players,
function(____, player)
local playerItems = byPlayer:get(player.playerId)
if not playerItems or #playerItems == 0 then
return
end
local steamId = player.steamId
local isBot = steamId <= 0
local win_metrics = player.teamId == gameEndDto.winnerTeamId and 1 or 0
local itemEvents = __TS__ArrayMap(
playerItems,
function(____, entry) return GA4:BuildEvent(eventName, steamId, {
hero_name = player.heroName,
item_name = entry.itemName,
type = entry.type,
cost = entry.cost,
tier = entry.tier or 0,
sample_count = entry.sampleCount,
duration_seconds = entry.sampleCount * ____exports.GA4ItemTracker.SAMPLE_INTERVAL_SECONDS,
is_carried_at_end = entry.isCarriedAtEnd,
difficulty = gameEndDto.difficulty,
team_id = player.teamId,
is_bot = isBot,
win_metrics = win_metrics
}) end
)
GA4:SendEvents(steamId, itemEvents)
end
)
end
GA4ItemTracker.SAMPLE_INTERVAL_SECONDS = 30
GA4ItemTracker.samples = __TS__New(Map)
GA4ItemTracker.isTracking = false
return ____exports
