local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local ____exports = {}
local ____net_2Dtable_2Dhelper = require("modules.helper.net-table-helper")
local NetTableHelper = ____net_2Dtable_2Dhelper.NetTableHelper
local ____ability_2Ditem_2Dtype = require("modules.lottery.ability.ability-item-type")
local AbilityItemTypes = ____ability_2Ditem_2Dtype.AbilityItemTypes
local ____lottery_2Dabilities = require("modules.lottery.ability.lottery-abilities")
local abilityTiersPassive = ____lottery_2Dabilities.abilityTiersPassive
local ____ga4 = require("api.analytics.ga4.ga4")
local GA4 = ____ga4.GA4
____exports.GA4PickAbilityTracker = __TS__Class()
local GA4PickAbilityTracker = ____exports.GA4PickAbilityTracker
GA4PickAbilityTracker.name = "GA4PickAbilityTracker"
function GA4PickAbilityTracker.prototype.____constructor(self)
end
function GA4PickAbilityTracker.SendAtGameEnd(self, gameEndDto)
local eventName = "game_end_pick_ability"
__TS__ArrayForEach(
gameEndDto.players,
function(____, player)
local picks = self:CollectPlayerPicks(player)
if #picks == 0 then
return
end
local isBot = player.steamId <= 0
local winMetrics = player.teamId == gameEndDto.winnerTeamId
local events = __TS__ArrayMap(
picks,
function(____, pick) return GA4:BuildEvent(eventName, player.steamId, {
steam_id = player.steamId,
ability_name = pick.name,
type = pick.type,
tier = pick.tier,
difficulty = gameEndDto.difficulty,
win_metrics = winMetrics,
hero_name = player.heroName,
team_id = player.teamId,
is_bot = isBot
}) end
)
GA4:SendEvents(player.steamId, events)
end
)
end
function GA4PickAbilityTracker.CollectPlayerPicks(self, player)
local picks = {}
local function addPick(____, name, ____type, tier)
if not name then
return
end
picks[#picks + 1] = {name = name, type = ____type, tier = tier or 0}
end
if player.steamId > 0 then
local steamAccountID = tostring(player.steamId)
local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
addPick(nil, lotteryStatus.activeAbilityName, AbilityItemTypes.Active, lotteryStatus.activeAbilityLevel)
addPick(nil, lotteryStatus.passiveAbilityName, AbilityItemTypes.Passive, lotteryStatus.passiveAbilityLevel)
addPick(nil, lotteryStatus.passiveAbilityName2, AbilityItemTypes.Passive, lotteryStatus.passiveAbilityLevel2)
else
local botAbilities = CustomNetTables:GetTableValue(
"bot_passive_abilities",
tostring(player.playerId)
)
if not botAbilities then
return picks
end
addPick(
nil,
botAbilities.passiveAbilityName1,
AbilityItemTypes.Passive,
self:GetAbilityTier(botAbilities.passiveAbilityName1, abilityTiersPassive)
)
addPick(
nil,
botAbilities.passiveAbilityName2,
AbilityItemTypes.Passive,
self:GetAbilityTier(botAbilities.passiveAbilityName2, abilityTiersPassive)
)
end
return picks
end
function GA4PickAbilityTracker.GetAbilityTier(self, abilityName, tiers)
for ____, tier in ipairs(tiers) do
if __TS__ArrayIncludes(tier.names, abilityName) then
return tier.level
end
end
return 0
end
return ____exports
