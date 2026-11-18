local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local ____exports = {}
local ____random_2Dtier = require("modules.lottery.shared.random-tier")
local pickRandomTierByRate = ____random_2Dtier.pickRandomTierByRate
____exports.AbilityLotteryHelper = __TS__Class()
local AbilityLotteryHelper = ____exports.AbilityLotteryHelper
AbilityLotteryHelper.name = "AbilityLotteryHelper"
function AbilityLotteryHelper.prototype.____constructor(self)
end
function AbilityLotteryHelper.getRandomLotteryDto(self, tiers, isHighTier)
if isHighTier == nil then
isHighTier = false
end
local rates = isHighTier and self.PREMIUM_TIER_RATES or self.BASE_TIER_RATES
local tier = pickRandomTierByRate(nil, tiers, rates)
local name = tier.names[math.floor(math.random() * #tier.names) + 1]
return {name = name, level = tier.level}
end
function AbilityLotteryHelper.getRandomAbilities(self, tiers, count, currentHero, executedNames, isHighTier)
if executedNames == nil then
executedNames = {}
end
if isHighTier == nil then
isHighTier = false
end
if currentHero then
do
local i = 0
while i < currentHero:GetAbilityCount() do
local ability = currentHero:GetAbilityByIndex(i)
if ability then
executedNames[#executedNames + 1] = ability:GetAbilityName()
end
i = i + 1
end
end
end
local lotteryResults = {}
local maxAttempts = 10
do
local i = 0
while i < count do
local lotteryDto = {name = "earthshaker_aftershock", level = 1}
local attempts = 0
repeat
do
lotteryDto = self:getRandomLotteryDto(tiers, isHighTier)
attempts = attempts + 1
end
until not (__TS__ArrayIncludes(executedNames, lotteryDto.name) and attempts < maxAttempts)
lotteryResults[#lotteryResults + 1] = lotteryDto
executedNames[#executedNames + 1] = lotteryDto.name
i = i + 1
end
end
return lotteryResults
end
AbilityLotteryHelper.BASE_TIER_RATES = {
1,
5,
20,
60,
100
}
AbilityLotteryHelper.PREMIUM_TIER_RATES = {
5,
25,
60,
100,
100
}
return ____exports
