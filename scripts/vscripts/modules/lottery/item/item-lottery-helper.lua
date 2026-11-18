local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/item/item-lottery-helper.lua"
__TS__SourceMapTraceBack("modules/lottery/item/item-lottery-helper.lua", {["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 8,["16"] = 11,["17"] = 13,["18"] = 13,["19"] = 13,["20"] = 13,["21"] = 13,["22"] = 11,["23"] = 14,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 11,["29"] = 15,["30"] = 15,["31"] = 15,["32"] = 15,["33"] = 15,["34"] = 11,["35"] = 18,["36"] = 18,["37"] = 18,["39"] = 18,["40"] = 19,["41"] = 21,["42"] = 21,["44"] = 24,["45"] = 25,["47"] = 26,["48"] = 26,["49"] = 27,["50"] = 29,["51"] = 30,["52"] = 26,["55"] = 32,["56"] = 19,["57"] = 35,["58"] = 36,["59"] = 36,["61"] = 40,["62"] = 41,["64"] = 43,["65"] = 43,["67"] = 44,["68"] = 45,["69"] = 46,["70"] = 47,["72"] = 49,["75"] = 43,["78"] = 52,["79"] = 35});
local ____exports = {}
local ____random_2Dtier = require("modules.lottery.shared.random-tier")
local pickRandomTierByRate = ____random_2Dtier.pickRandomTierByRate
local ____lottery_2Ditems = require("modules.lottery.item.lottery-items")
local itemTiers = ____lottery_2Ditems.itemTiers
____exports.ItemLotteryPool = ItemLotteryPool or ({})
____exports.ItemLotteryPool.INITIAL = "initial"
____exports.ItemLotteryPool.DEFAULT = "default"
____exports.ItemLotteryPool.PREMIUM = "premium"
local POOL_RATES = {[____exports.ItemLotteryPool.INITIAL] = {
    0,
    0,
    10,
    50,
    100
}, [____exports.ItemLotteryPool.DEFAULT] = {
    1,
    5,
    20,
    60,
    100
}, [____exports.ItemLotteryPool.PREMIUM] = {
    5,
    25,
    60,
    100,
    100
}}
____exports.ItemLotteryHelper = __TS__Class()
local ItemLotteryHelper = ____exports.ItemLotteryHelper
ItemLotteryHelper.name = "ItemLotteryHelper"
function ItemLotteryHelper.prototype.____constructor(self)
end
function ItemLotteryHelper.getRandomItems(self, count, pool, excludedNames)
    if pool == nil then
        pool = ____exports.ItemLotteryPool.DEFAULT
    end
    local results = {}
    local picked = __TS__New(Set)
    do
        local i = 0
        while i < count do
            local candidate = self:getRandomItem(pool, picked, excludedNames) or ({name = "item_branches", level = 1})
            picked:add(candidate.name)
            results[#results + 1] = candidate
            i = i + 1
        end
    end
    return results
end
function ItemLotteryHelper.getRandomItem(self, pool, pickedNames, excludedNames)
    if pool == nil then
        pool = ____exports.ItemLotteryPool.DEFAULT
    end
    local rates = POOL_RATES[pool]
    local maxAttempts = 20
    do
        local attempts = 0
        while attempts < maxAttempts do
            do
                local tierRow = pickRandomTierByRate(nil, itemTiers, rates)
                local name = tierRow.names[math.floor(math.random() * #tierRow.names) + 1]
                if pickedNames and pickedNames:has(name) or excludedNames and excludedNames:has(name) then
                    goto __continue6
                end
                return {name = name, level = tierRow.level}
            end
            ::__continue6::
            attempts = attempts + 1
        end
    end
    return nil
end
return ____exports
