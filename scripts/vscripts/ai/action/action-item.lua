local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/action/action-item.lua"
__TS__SourceMapTraceBack("ai/action/action-item.lua", {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 4,["15"] = 8,["16"] = 8,["17"] = 8,["19"] = 9,["20"] = 10,["21"] = 12,["22"] = 13,["23"] = 14,["25"] = 16,["28"] = 19,["29"] = 20,["30"] = 21,["31"] = 22,["33"] = 24,["35"] = 27,["36"] = 28,["37"] = 29,["38"] = 30,["40"] = 32,["42"] = 34,["43"] = 35,["44"] = 36,["45"] = 8,["46"] = 42,["47"] = 48,["48"] = 49,["50"] = 51,["51"] = 52,["52"] = 53,["54"] = 57,["55"] = 58,["57"] = 61,["58"] = 62,["59"] = 63,["60"] = 64,["62"] = 67,["63"] = 67,["64"] = 67,["65"] = 67,["66"] = 67,["67"] = 68,["68"] = 69,["69"] = 70,["71"] = 72,["72"] = 42,["73"] = 75,["74"] = 76,["75"] = 77,["76"] = 78,["78"] = 82,["79"] = 82,["80"] = 82,["81"] = 82,["82"] = 82,["83"] = 83,["84"] = 84,["85"] = 75,["86"] = 90,["87"] = 94,["88"] = 95,["89"] = 96,["91"] = 98,["92"] = 99,["94"] = 101,["95"] = 90,["96"] = 104,["97"] = 105,["98"] = 106,["100"] = 109,["101"] = 110,["103"] = 113,["104"] = 114,["105"] = 115,["107"] = 117,["108"] = 104});
local ____exports = {}
local ____action_2Dability = require("ai.action.action-ability")
local ActionAbility = ____action_2Dability.ActionAbility
local ____cached_2Ditem_2Dstate = require("ai.action.cached-item-state")
local CachedItemState = ____cached_2Ditem_2Dstate.CachedItemState
____exports.ActionItem = __TS__Class()
local ActionItem = ____exports.ActionItem
ActionItem.name = "ActionItem"
function ActionItem.prototype.____constructor(self)
end
function ActionItem.BuyItem(self, hero, itemName, checkSame)
    if checkSame == nil then
        checkSame = true
    end
    if checkSame then
        local item = CachedItemState:FindItem(hero, itemName)
        if item then
            if IsInToolsMode() then
                print(("[AI] BuyItem " .. itemName) .. " failed, already has")
            end
            return false
        end
    end
    local cost = GetItemCost(itemName)
    if cost > hero:GetGold() then
        if IsInToolsMode() then
            print(("[AI] BuyItem " .. itemName) .. " failed, not enough gold")
        end
        return false
    end
    local addedItem = hero:AddItemByName(itemName)
    if not addedItem then
        if IsInToolsMode() then
            print(("[AI] BuyItem " .. itemName) .. " failed")
        end
        return false
    end
    hero:SpendGold(cost, DOTA_ModifyGold_PurchaseItem)
    CachedItemState:InvalidateHero(hero)
    return true
end
function ActionItem.UseItemOnTarget(self, hero, itemName, target, condition)
    if target == nil then
        return false
    end
    local item = self:FindItemInInventoryUseable(hero, itemName)
    if not item then
        return false
    end
    if condition and condition(nil, target, item) == false then
        return false
    end
    local distance = hero:GetRangeToUnit(target)
    local castRange = ActionAbility:GetFullCastRange(hero, item)
    if distance > castRange then
        return false
    end
    hero:CastAbilityOnTarget(
        target,
        item,
        hero:GetPlayerOwnerID()
    )
    CachedItemState:MarkItemUsed(hero, itemName, item)
    if IsInToolsMode() then
        print((("[AI] UseItemOnTarget " .. itemName) .. " on ") .. target:GetUnitName())
    end
    return true
end
function ActionItem.UseItemOnPosition(self, hero, itemName, pos)
    local item = self:FindItemInInventoryUseable(hero, itemName)
    if not item then
        return false
    end
    hero:CastAbilityOnPosition(
        pos,
        item,
        hero:GetPlayerOwnerID()
    )
    CachedItemState:MarkItemUsed(hero, itemName, item)
    return true
end
function ActionItem.FindItemInInventoryUseable(self, hero, itemName)
    local item = CachedItemState:FindUsableItem(hero, itemName)
    if not item then
        return nil
    end
    if self:IsItemCastable(hero, item) == false then
        return nil
    end
    return item
end
function ActionItem.IsItemCastable(self, hero, item)
    if item:GetCooldownTimeRemaining() > 0 then
        return false
    end
    if item:GetAbilityChargeRestoreTime(-1) > 0 and item:GetCurrentCharges() == 0 then
        return false
    end
    local manaCost = item:GetManaCost(-1)
    if manaCost > hero:GetMana() then
        return false
    end
    return true
end
return ____exports
