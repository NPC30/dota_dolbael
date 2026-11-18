local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/ability-replace/ability-replace-item-limit.lua"
__TS__SourceMapTraceBack("modules/lottery/ability-replace/ability-replace-item-limit.lua", {["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 4,["15"] = 10,["16"] = 11,["17"] = 10,["18"] = 14,["19"] = 15,["20"] = 14,["21"] = 18,["22"] = 19,["23"] = 18,["24"] = 22,["25"] = 23,["26"] = 22,["27"] = 26,["28"] = 31,["29"] = 32,["31"] = 35,["32"] = 36,["33"] = 37,["34"] = 39,["36"] = 40,["37"] = 41,["38"] = 42,["39"] = 43,["41"] = 46,["42"] = 47,["43"] = 48,["44"] = 49,["45"] = 50,["47"] = 53,["48"] = 54,["52"] = 57,["53"] = 26,["54"] = 5,["55"] = 7,["56"] = 8});
local ____exports = {}
local ____item_2Dlottery_2Dhelper = require("modules.lottery.item.item-lottery-helper")
local ItemLotteryHelper = ____item_2Dlottery_2Dhelper.ItemLotteryHelper
____exports.AbilityReplaceItemLimit = __TS__Class()
local AbilityReplaceItemLimit = ____exports.AbilityReplaceItemLimit
AbilityReplaceItemLimit.name = "AbilityReplaceItemLimit"
function AbilityReplaceItemLimit.prototype.____constructor(self)
end
function AbilityReplaceItemLimit.canDropFromAbyssBoss(self)
    return not self.abyssBossDropped
end
function AbilityReplaceItemLimit.markDroppedFromAbyssBoss(self)
    self.abyssBossDropped = true
end
function AbilityReplaceItemLimit.hasTreasureGrant(self, playerId)
    return self.treasureGrantedByPlayer[tostring(playerId)] == true
end
function AbilityReplaceItemLimit.markTreasureGranted(self, playerId)
    self.treasureGrantedByPlayer[tostring(playerId)] = true
end
function AbilityReplaceItemLimit.sanitizeTreasureCandidates(self, playerId, candidates, pool)
    if not self:hasTreasureGrant(playerId) then
        return candidates
    end
    local excludedNames = __TS__New(Set, {self.ITEM_NAME})
    local sanitized = {}
    local pickedNames = __TS__New(Set)
    for ____, candidate in ipairs(candidates) do
        do
            if candidate.name ~= self.ITEM_NAME then
                sanitized[#sanitized + 1] = candidate
                pickedNames:add(candidate.name)
                goto __continue9
            end
            local replacement = ItemLotteryHelper:getRandomItem(pool, pickedNames, excludedNames)
            if replacement then
                sanitized[#sanitized + 1] = replacement
                pickedNames:add(replacement.name)
                goto __continue9
            end
            sanitized[#sanitized + 1] = candidate
            pickedNames:add(candidate.name)
        end
        ::__continue9::
    end
    return sanitized
end
AbilityReplaceItemLimit.ITEM_NAME = "item_tome_of_ability_replace"
AbilityReplaceItemLimit.abyssBossDropped = false
AbilityReplaceItemLimit.treasureGrantedByPlayer = {}
return ____exports
