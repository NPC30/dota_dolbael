local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ObjectEntries = ____lualib.__TS__ObjectEntries
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/build-item/sell-item.lua"
__TS__SourceMapTraceBack("ai/build-item/sell-item.lua", {["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 3,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["20"] = 13,["21"] = 13,["22"] = 13,["24"] = 13,["25"] = 35,["26"] = 37,["27"] = 38,["28"] = 39,["31"] = 42,["32"] = 35,["33"] = 51,["34"] = 52,["35"] = 51,["36"] = 63,["37"] = 67,["38"] = 67,["40"] = 70,["41"] = 71,["42"] = 74,["44"] = 77,["45"] = 78,["46"] = 79,["47"] = 82,["49"] = 86,["50"] = 87,["51"] = 88,["52"] = 91,["53"] = 92,["54"] = 93,["55"] = 94,["56"] = 97,["57"] = 63,["58"] = 106,["59"] = 108,["60"] = 109,["61"] = 110,["62"] = 111,["64"] = 115,["65"] = 117,["66"] = 118,["67"] = 119,["68"] = 120,["69"] = 121,["70"] = 122,["74"] = 128,["75"] = 130,["76"] = 131,["77"] = 132,["78"] = 133,["79"] = 134,["82"] = 138,["83"] = 106,["84"] = 147,["85"] = 148,["86"] = 148,["87"] = 148,["88"] = 149,["89"] = 150,["92"] = 153,["93"] = 147,["94"] = 162,["95"] = 166,["96"] = 167,["97"] = 168,["98"] = 169,["101"] = 172,["102"] = 162,["103"] = 181,["104"] = 185,["105"] = 185,["106"] = 185,["107"] = 186,["108"] = 187,["111"] = 190,["112"] = 181,["113"] = 199,["114"] = 201,["115"] = 201,["116"] = 201,["117"] = 203,["118"] = 205,["119"] = 206,["120"] = 207,["121"] = 208,["122"] = 211,["127"] = 216,["128"] = 199,["129"] = 225,["130"] = 229,["131"] = 231,["132"] = 232,["134"] = 235,["135"] = 236,["136"] = 237,["137"] = 238,["140"] = 242,["141"] = 225,["142"] = 252,["143"] = 253,["144"] = 254,["145"] = 255,["146"] = 256,["147"] = 257,["150"] = 260,["151"] = 252,["152"] = 263,["153"] = 264,["154"] = 265,["155"] = 267,["156"] = 268,["157"] = 270,["159"] = 271,["160"] = 272,["161"] = 273,["163"] = 275,["164"] = 277,["165"] = 278,["166"] = 280,["168"] = 281,["169"] = 282,["170"] = 283,["172"] = 285,["173"] = 286,["174"] = 287,["175"] = 288,["180"] = 292,["181"] = 293,["182"] = 294,["183"] = 295,["190"] = 301,["191"] = 302,["193"] = 304,["194"] = 263,["195"] = 307,["196"] = 308,["197"] = 309,["199"] = 311,["200"] = 312,["201"] = 307,["202"] = 321,["203"] = 322,["204"] = 321,["205"] = 330,["206"] = 331,["207"] = 332,["209"] = 335,["210"] = 336,["211"] = 337,["212"] = 338,["213"] = 339,["214"] = 340,["216"] = 343,["217"] = 344,["219"] = 347,["220"] = 330,["221"] = 355,["222"] = 357,["223"] = 360,["224"] = 361,["225"] = 362,["227"] = 366,["228"] = 369,["229"] = 370,["231"] = 375,["232"] = 376,["234"] = 380,["235"] = 381,["237"] = 385,["238"] = 386,["240"] = 390,["241"] = 391,["243"] = 395,["244"] = 396,["246"] = 400,["247"] = 401,["249"] = 405,["250"] = 406,["251"] = 407,["254"] = 411,["255"] = 355,["256"] = 14,["257"] = 15,["258"] = 15,["259"] = 15,["260"] = 15,["261"] = 15,["262"] = 15,["263"] = 15,["264"] = 15,["265"] = 24});
local ____exports = {}
local ____cached_2Ditem_2Dstate = require("ai.action.cached-item-state")
local CachedItemState = ____cached_2Ditem_2Dstate.CachedItemState
local ____sell_2Ditem_2Dconfig = require("ai.build-item.sell-item-config")
local ItemUpgradeReplacements = ____sell_2Ditem_2Dconfig.ItemUpgradeReplacements
local SellItemCommonJunkList = ____sell_2Ditem_2Dconfig.SellItemCommonJunkList
local SellItemHeroList = ____sell_2Ditem_2Dconfig.SellItemHeroList
local SpecialConsumableItems = ____sell_2Ditem_2Dconfig.SpecialConsumableItems
local ValueBasedSellItemsList = ____sell_2Ditem_2Dconfig.ValueBasedSellItemsList
--- 出售物品功能类
____exports.SellItem = __TS__Class()
local SellItem = ____exports.SellItem
SellItem.name = "SellItem"
function SellItem.prototype.____constructor(self)
end
function SellItem.GetSellThreshold(self, itemsMap)
    for ____, consumableItem in ipairs(SpecialConsumableItems) do
        if itemsMap:has(consumableItem) then
            return 8
        end
    end
    return 7
end
function SellItem.GetItemsMapIncludeStash(self, hero)
    return CachedItemState:GetItemsMap(hero)
end
function SellItem.SellItem(self, hero, items, itemName, fullPrice)
    if fullPrice == nil then
        fullPrice = false
    end
    if not items then
        print((("[AI] SellItem ERROR: items is null, hero: " .. hero:GetUnitName()) .. ", itemName: ") .. itemName)
        return false
    end
    local item = items[1]
    if not item then
        print((("[AI] SellItem ERROR: item is null, hero: " .. hero:GetUnitName()) .. ", itemName: ") .. itemName)
        return false
    end
    local originalCost = GetItemCost(itemName)
    local sellPrice = fullPrice and originalCost or math.floor(originalCost / 2)
    hero:ModifyGold(sellPrice, true, DOTA_ModifyGold_SellItem)
    UTIL_RemoveImmediate(item)
    CachedItemState:InvalidateHero(hero)
    local priceType = fullPrice and "full price" or "half price"
    print(((((((("[AI] SellItem hero: " .. hero:GetUnitName()) .. ", item: ") .. itemName) .. ", sold for ") .. tostring(sellPrice)) .. " gold (") .. priceType) .. ")")
    return true
end
function SellItem.SellConsumedItems(self, hero, itemsMap)
    local aghanimsShardItem = "item_aghanims_shard"
    if itemsMap:has(aghanimsShardItem) and hero:HasModifier("modifier_item_aghanims_shard") then
        local shardItems = itemsMap:get(aghanimsShardItem)
        return self:SellItem(hero, shardItems, aghanimsShardItem, true)
    end
    if hero:HasModifier("modifier_item_wings_of_haste_consumed") then
        local bootsList = {"item_power_treads", "item_arcane_boots", "item_tranquil_boots"}
        for ____, bootItem in ipairs(bootsList) do
            if itemsMap:has(bootItem) then
                local items = itemsMap:get(bootItem)
                print((("[AI] SellConsumedItems " .. hero:GetUnitName()) .. " 出售急速之翼配方鞋子: ") .. bootItem)
                return self:SellItem(hero, items, bootItem, true)
            end
        end
    end
    if hero:HasModifier("modifier_item_ultimate_scepter_2") then
        local aghanimsScepter = "item_ultimate_scepter"
        if itemsMap:has(aghanimsScepter) then
            local items = itemsMap:get(aghanimsScepter)
            print(("[AI] SellConsumedItems " .. hero:GetUnitName()) .. " 出售阿哈利姆神杖（已有真·神杖buff）")
            return self:SellItem(hero, items, aghanimsScepter, true)
        end
    end
    return false
end
function SellItem.SellRecipeItems(self, hero, itemsMap)
    for ____, ____value in __TS__Iterator(itemsMap) do
        local itemName = ____value[1]
        local items = ____value[2]
        if __TS__StringIncludes(itemName, "recipe") then
            return self:SellItem(hero, items, itemName, true)
        end
    end
    return false
end
function SellItem.SellCommonJunkItems(self, hero, itemsMap)
    for ____, itemName in ipairs(SellItemCommonJunkList) do
        if itemsMap:has(itemName) then
            local items = itemsMap:get(itemName)
            return self:SellItem(hero, items, itemName, true)
        end
    end
    return false
end
function SellItem.SellDuplicateItems(self, hero, itemsMap)
    for ____, ____value in __TS__Iterator(itemsMap) do
        local itemName = ____value[1]
        local items = ____value[2]
        if #items > 1 then
            return self:SellItem(hero, items, itemName, true)
        end
    end
    return false
end
function SellItem.SellUpgradedItems(self, hero, itemsMap)
    for ____, ____value in ipairs(__TS__ObjectEntries(ItemUpgradeReplacements)) do
        local upgradeItem = ____value[1]
        local replaceItems = ____value[2]
        if itemsMap:has(upgradeItem) then
            for ____, replaceItem in ipairs(replaceItems) do
                if itemsMap:has(replaceItem) then
                    local items = itemsMap:get(replaceItem)
                    print(((((("[AI] SellUpgradedItems " .. hero:GetUnitName()) .. " 出售被替代装备: ") .. replaceItem) .. " (已拥有: ") .. upgradeItem) .. ")")
                    return self:SellItem(hero, items, replaceItem, true)
                end
            end
        end
    end
    return false
end
function SellItem.SellHeroSpecificItems(self, hero, itemsMap)
    local heroSellList = SellItemHeroList[hero:GetUnitName()]
    if not heroSellList then
        return false
    end
    for ____, itemName in ipairs(heroSellList) do
        if itemsMap:has(itemName) then
            local items = itemsMap:get(itemName)
            return self:SellItem(hero, items, itemName)
        end
    end
    return false
end
function SellItem.SellItemsByValue(self, hero, itemsMap)
    for ____, itemName in ipairs(ValueBasedSellItemsList) do
        if itemsMap:has(itemName) then
            local items = itemsMap:get(itemName)
            print((("[AI] SellItemsByValue " .. hero:GetUnitName()) .. " 按价值出售物品: ") .. itemName)
            return self:SellItem(hero, items, itemName, true)
        end
    end
    return false
end
function SellItem.OrganizeInventoryByValue(self, hero)
    local swapped = false
    local shouldContinue = true
    while shouldContinue do
        shouldContinue = false
        for ____, inventorySlot in ipairs(self.inventorySlots) do
            do
                local inventoryItem = hero:GetItemInSlot(inventorySlot)
                if self:IsInventoryOrganizerLockedItem(inventoryItem) then
                    goto __continue49
                end
                local inventoryValue = self:GetItemSortValue(inventoryItem)
                local bestBackpackSlot
                local bestBackpackValue = inventoryValue
                for ____, backpackSlot in ipairs(self.backpackSlots) do
                    do
                        local backpackItem = hero:GetItemInSlot(backpackSlot)
                        if self:IsInventoryOrganizerLockedItem(backpackItem) then
                            goto __continue51
                        end
                        local backpackValue = self:GetItemSortValue(backpackItem)
                        if backpackValue > bestBackpackValue then
                            bestBackpackValue = backpackValue
                            bestBackpackSlot = backpackSlot
                        end
                    end
                    ::__continue51::
                end
                if bestBackpackSlot ~= nil then
                    hero:SwapItems(inventorySlot, bestBackpackSlot)
                    swapped = true
                    shouldContinue = true
                    break
                end
            end
            ::__continue49::
        end
    end
    if swapped then
        CachedItemState:InvalidateHero(hero)
    end
    return swapped
end
function SellItem.IsInventoryOrganizerLockedItem(self, item)
    if not item or item:IsNull() then
        return false
    end
    local itemName = item:GetName()
    return itemName == "item_aegis" or self:IsWardItemName(itemName) and itemName ~= "item_titanium_ward_eye" and item:GetItemSlot() >= DOTA_ITEM_SLOT_1 and item:GetItemSlot() <= DOTA_ITEM_SLOT_6
end
function SellItem.IsWardItemName(self, itemName)
    return itemName == "item_ward_observer" or itemName == "item_ward_sentry" or itemName == "item_ward_dispenser" or itemName == "item_titanium_ward_eye"
end
function SellItem.GetItemSortValue(self, item)
    if not item or item:IsNull() then
        return -1
    end
    local itemName = item:GetName()
    local valueOrder = __TS__ArrayIndexOf(ValueBasedSellItemsList, itemName)
    local itemCost = GetItemCost(itemName)
    if itemCost > 0 then
        local valueTieBreaker = valueOrder >= 0 and valueOrder or #ValueBasedSellItemsList
        return itemCost * 1000 + valueTieBreaker
    end
    if valueOrder >= 0 then
        return valueOrder + 1
    end
    return 0
end
function SellItem.SellExtraItems(self, hero)
    local itemsMap = self:GetItemsMapIncludeStash(hero)
    local totalItemCount = 0
    for ____, items in __TS__Iterator(itemsMap:values()) do
        totalItemCount = totalItemCount + #items
    end
    local sellThreshold = self:GetSellThreshold(itemsMap)
    if totalItemCount < sellThreshold then
        return false
    end
    if self:SellConsumedItems(hero, itemsMap) then
        return true
    end
    if self:SellRecipeItems(hero, itemsMap) then
        return true
    end
    if self:SellCommonJunkItems(hero, itemsMap) then
        return true
    end
    if self:SellDuplicateItems(hero, itemsMap) then
        return true
    end
    if self:SellUpgradedItems(hero, itemsMap) then
        return true
    end
    if self:SellHeroSpecificItems(hero, itemsMap) then
        return true
    end
    if totalItemCount >= self.sellItemsByValueSellThreshold then
        if self:SellItemsByValue(hero, itemsMap) then
            return true
        end
    end
    return false
end
SellItem.sellItemsByValueSellThreshold = 8
SellItem.inventorySlots = {
    DOTA_ITEM_SLOT_1,
    DOTA_ITEM_SLOT_2,
    DOTA_ITEM_SLOT_3,
    DOTA_ITEM_SLOT_4,
    DOTA_ITEM_SLOT_5,
    DOTA_ITEM_SLOT_6
}
SellItem.backpackSlots = {DOTA_ITEM_SLOT_7, DOTA_ITEM_SLOT_8, DOTA_ITEM_SLOT_9}
return ____exports
