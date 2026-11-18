local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/lottery-helper.lua"
__TS__SourceMapTraceBack("modules/lottery/lottery-helper.lua", {["7"] = 4,["8"] = 4,["9"] = 4,["11"] = 4,["12"] = 13,["13"] = 14,["15"] = 17,["16"] = 17,["17"] = 18,["18"] = 19,["20"] = 17,["23"] = 23,["24"] = 13,["25"] = 26,["26"] = 27,["28"] = 29,["29"] = 29,["30"] = 30,["31"] = 31,["33"] = 29,["36"] = 35,["37"] = 26,["38"] = 38,["39"] = 38,["40"] = 38,["42"] = 39,["43"] = 40,["44"] = 41,["45"] = 42,["46"] = 38,["47"] = 45,["48"] = 49,["49"] = 49,["51"] = 50,["52"] = 50,["54"] = 53,["56"] = 54,["57"] = 54,["58"] = 55,["59"] = 56,["60"] = 57,["62"] = 54,["66"] = 62,["67"] = 63,["69"] = 64,["70"] = 64,["71"] = 65,["72"] = 66,["75"] = 68,["76"] = 69,["78"] = 70,["79"] = 71,["80"] = 72,["81"] = 64,["84"] = 74,["85"] = 45,["86"] = 6,["87"] = 6,["88"] = 6,["89"] = 6,["90"] = 6,["91"] = 6,["92"] = 6,["93"] = 11,["94"] = 11,["95"] = 11,["96"] = 11,["97"] = 11,["98"] = 11,["99"] = 11});
local ____exports = {}
____exports.LotteryHelper = __TS__Class()
local LotteryHelper = ____exports.LotteryHelper
LotteryHelper.name = "LotteryHelper"
function LotteryHelper.prototype.____constructor(self)
end
function LotteryHelper.getRandomTier(self, tiers)
    local random = RandomInt(1, 100)
    do
        local i = 0
        while i < #self.BASE_TIER_RATES do
            if random <= self.BASE_TIER_RATES[i + 1] then
                return tiers[i + 1]
            end
            i = i + 1
        end
    end
    return tiers[#tiers]
end
function LotteryHelper.getRandomHighTier(self, tiers)
    local random = RandomInt(1, 100)
    do
        local i = 0
        while i < #self.PREMIUM_TIER_RATES do
            if random <= self.PREMIUM_TIER_RATES[i + 1] then
                return tiers[i + 1]
            end
            i = i + 1
        end
    end
    return tiers[#tiers]
end
function LotteryHelper.getRandomLotteryDto(self, tiers, isHighTier)
    if isHighTier == nil then
        isHighTier = false
    end
    local tier = isHighTier and self:getRandomHighTier(tiers) or self:getRandomTier(tiers)
    local name = tier.names[math.floor(math.random() * #tier.names) + 1]
    local level = tier.level
    return {name = name, level = level}
end
function LotteryHelper.getRandomAbilities(self, tiers, count, currentHero, executedNames, isHighTier)
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
LotteryHelper.BASE_TIER_RATES = {
    1,
    5,
    20,
    60,
    100
}
LotteryHelper.PREMIUM_TIER_RATES = {
    5,
    25,
    50,
    80,
    100
}
return ____exports
