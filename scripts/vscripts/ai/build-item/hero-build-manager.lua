local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local ____exports = {}
local ____item_2Dtier_2Dconfig = require("ai.build-item.item-tier-config")
local ItemTier = ____item_2Dtier_2Dconfig.ItemTier
____exports.HeroBuildManager = __TS__Class()
local HeroBuildManager = ____exports.HeroBuildManager
HeroBuildManager.name = "HeroBuildManager"
function HeroBuildManager.prototype.____constructor(self)
end
function HeroBuildManager.DetermineCurrentTier(self, hero, buildState)
local currentItems = self:GetHeroItems(hero)
local currentTier = buildState.currentTier
local currentTierItems = buildState.resolvedItems[currentTier]
local allBought = true
for ____, itemName in ipairs(currentTierItems) do
if not __TS__ArrayIncludes(currentItems, itemName) then
allBought = false
break
end
end
if allBought and currentTier < ItemTier.T5 then
local nextTier = currentTier + 1
print((("[AI] BuildItemManager.DetermineCurrentTier: " .. hero:GetUnitName()) .. " 升级到 T") .. tostring(nextTier))
return nextTier
end
return currentTier
end
function HeroBuildManager.GetHeroItems(self, hero)
local items = {}
do
local i = 0
while i < 15 do
local item = hero:GetItemInSlot(i)
if item and not item:IsNull() then
items[#items + 1] = item:GetName()
end
i = i + 1
end
end
return items
end
function HeroBuildManager.TryPurchaseItem(self, hero, buildState)
local currentItems = self:GetHeroItems(hero)
if self:TryPurchaseConsumable(hero, buildState, currentItems) then
return true
end
if self:TryPurchaseNormalItem(hero, buildState, currentItems) then
return true
end
return false
end
function HeroBuildManager.TryPurchaseConsumable(self, hero, buildState, currentItems)
local currentTier = buildState.currentTier
local currentTierConsumables = buildState.consumables[currentTier]
if not currentTierConsumables then
return false
end
for ____, itemName in ipairs(currentTierConsumables) do
local result = self:BuyItem(hero, itemName, currentItems)
if result then
local index = __TS__ArrayIndexOf(currentTierConsumables, itemName)
if index ~= -1 then
__TS__ArraySplice(currentTierConsumables, index, 1)
print(((((("[AI] BuildItem " .. hero:GetUnitName()) .. " 从消耗品列表移除: ") .. itemName) .. " (T") .. tostring(currentTier)) .. ")")
end
buildState.currentTier = self:DetermineCurrentTier(hero, buildState)
return true
end
end
return false
end
function HeroBuildManager.TryPurchaseNormalItem(self, hero, buildState, currentItems)
local currentTier = buildState.currentTier
local currentTierItems = buildState.resolvedItems[currentTier]
if not currentTierItems then
return false
end
for ____, itemName in ipairs(currentTierItems) do
local result = self:BuyItem(hero, itemName, currentItems)
if result then
buildState.currentTier = self:DetermineCurrentTier(hero, buildState)
return true
end
end
return false
end
function HeroBuildManager.BuyItem(self, hero, itemName, currentItems)
if __TS__ArrayIncludes(currentItems, itemName) then
return false
end
if #currentItems >= 9 then
return false
end
local cost = GetItemCost(itemName)
if cost > hero:GetGold() then
return false
end
local addedItem = hero:AddItemByName(itemName)
if not addedItem then
print(((((("[AI] BuyItem " .. hero:GetUnitName()) .. " 购买失败: ") .. itemName) .. " ") .. tostring(cost)) .. "金")
return false
end
hero:SpendGold(cost, DOTA_ModifyGold_PurchaseItem)
print(((((("[AI] BuyItem " .. hero:GetUnitName()) .. " 成功购买: ") .. itemName) .. " ") .. tostring(cost)) .. "金")
return true
end
return ____exports
