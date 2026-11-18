local ____lualib = require("lualib_bundle")
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/abyss/abyss-rules.lua"
__TS__SourceMapTraceBack("modules/abyss/abyss-rules.lua", {["6"] = 16,["7"] = 17,["8"] = 18,["9"] = 19,["10"] = 20,["11"] = 22,["12"] = 23,["13"] = 23,["14"] = 23,["15"] = 23,["16"] = 24,["17"] = 25,["19"] = 28,["20"] = 22,["21"] = 35,["22"] = 36,["23"] = 37,["25"] = 39,["26"] = 35,["27"] = 42,["28"] = 43,["29"] = 44,["31"] = 46,["32"] = 42,["33"] = 49,["34"] = 52,["35"] = 52,["37"] = 54,["38"] = 54,["39"] = 54,["40"] = 54,["41"] = 55,["42"] = 56,["44"] = 58,["45"] = 49,["46"] = 61,["47"] = 62,["48"] = 63,["50"] = 65,["51"] = 65,["52"] = 65,["53"] = 65,["54"] = 66,["55"] = 61,["56"] = 69,["57"] = 73,["58"] = 73,["59"] = 73,["60"] = 73,["61"] = 74,["62"] = 75,["63"] = 76,["64"] = 77,["65"] = 79,["66"] = 79,["67"] = 79,["68"] = 79,["69"] = 79,["70"] = 79,["71"] = 79,["72"] = 79,["73"] = 79,["74"] = 69});
local ____exports = {}
local ABYSS_TOME_STAT_BONUS = 100
local ABYSS_FIRST_DISPLAY_BLOCK_SIZE = 20
local ABYSS_COMPRESSED_DISPLAY_BLOCK_SIZE = 15
local ABYSS_DISPLAY_SKIP_PER_BLOCK = 5
local ABYSS_FINAL_GROWTH_START_DISPLAY_WAVE = 86
function ____exports.getAbyssDisplayWave(self, actualWave)
    local wave = math.max(
        0,
        math.floor(actualWave)
    )
    if wave <= ABYSS_FIRST_DISPLAY_BLOCK_SIZE then
        return wave
    end
    return wave + ABYSS_DISPLAY_SKIP_PER_BLOCK * math.ceil((wave - ABYSS_FIRST_DISPLAY_BLOCK_SIZE) / ABYSS_COMPRESSED_DISPLAY_BLOCK_SIZE)
end
function ____exports.isAbyssLongPreparationDisplayWave(self, displayWave)
    if displayWave <= 0 or displayWave % 10 ~= 0 then
        return false
    end
    return math.floor(displayWave / 10) % 2 == 0
end
function ____exports.getAbyssNetWorthGrowthRate(self, baseGrowthRate, displayWave)
    if displayWave < ABYSS_FINAL_GROWTH_START_DISPLAY_WAVE then
        return baseGrowthRate
    end
    return 1 + (baseGrowthRate - 1) * 2
end
function ____exports.getAbyssWaveBotCount(self, wave, radiantHumanCount, maxBotCount)
    if maxBotCount == nil then
        maxBotCount = 10
    end
    local baseCount = math.min(
        math.max(radiantHumanCount, 1) * 3,
        maxBotCount
    )
    if wave <= 3 then
        return baseCount
    end
    return math.min(baseCount + wave - 3, maxBotCount)
end
function ____exports.getSecondHighestValue(self, values, fallback)
    if #values == 0 then
        return fallback
    end
    local sorted = __TS__ArraySort(
        {unpack(values)},
        function(____, a, b) return b - a end
    )
    return sorted[math.min(1, #sorted - 1) + 1] or fallback
end
function ____exports.getAbyssOverflowTomePlan(self, pairCount, _hasLuoshu)
    local ____pairs = math.max(
        0,
        math.floor(pairCount)
    )
    local nativeLuoshuCount = 0
    local directStrengthStacks = ____pairs * 4
    local directAgilityStacks = ____pairs
    local directIntellectStacks = ____pairs
    return {
        nativeLuoshuCount = nativeLuoshuCount,
        directStrengthStacks = directStrengthStacks,
        directAgilityStacks = directAgilityStacks,
        directIntellectStacks = directIntellectStacks,
        directStrengthBonus = directStrengthStacks * ABYSS_TOME_STAT_BONUS,
        directAgilityBonus = directAgilityStacks * ABYSS_TOME_STAT_BONUS,
        directIntellectBonus = directIntellectStacks * ABYSS_TOME_STAT_BONUS
    }
end
return ____exports
