local function replaceItem(v, oldItemName, newItemName)
for i, vItem in ipairs(v) do
if vItem == oldItemName then
table.remove(v, i)
table.insert(v, newItemName)
end
end
end
local function replaceItemByRecipe(v, recipeComponents, newItemName)
for i, vItem in ipairs(v) do
for _, component in ipairs(recipeComponents) do
if vItem == component then
table.remove(v, i)
table.insert(v, newItemName)
return true
end
end
end
return false
end
local ABYSS_LATE_GAME_TEMPLATE_WAVE = 20
local ABYSS_TOME_REFILL_COUNT = 24
local ABYSS_TOME_STAT_BONUS = 100
local BOT_WARD_ITEM_NAME = "item_titanium_ward_eye"
LinkLuaModifier("modifier_str_tome", "items/item_tome_of_strength.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_agi_tome", "items/item_tome_of_agility.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_int_tome", "items/item_tome_of_intelligence.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_abyss_overflow_stats", "modifiers/modifier_abyss_overflow_stats.lua", LUA_MODIFIER_MOTION_NONE)
local function IsAbyssModeActive()
return _G.AbyssModeEnabled == true or (_G.AbyssModeWave or 0) > 0
end
local function IsAbyssBotHero(hHero)
return IsAbyssModeActive()
and hHero
and hHero:IsRealHero()
and hHero:GetTeamNumber() == DOTA_TEAM_BADGUYS
end
local function IsTomeItem(itemName)
return itemName == "item_tome_of_luoshu"
or itemName == "item_tome_of_strength"
or itemName == "item_tome_of_agility"
or itemName == "item_tome_of_intelligence"
end
local function CountTomeItems(purchaseList)
local count = 0
for _, itemName in ipairs(purchaseList) do
if IsTomeItem(itemName) then
count = count + 1
end
end
return count
end
local function EnsureAbyssTomeQueue(hHero, iHeroName)
if not IsAbyssBotHero(hHero) then
return
end
local purchaseList = tBotItemData.purchaseItemList[iHeroName] or {}
if not hHero.abyss_tome_sequence_initialized then
local rebuiltList = {}
for _, itemName in ipairs(purchaseList) do
if not IsTomeItem(itemName) then
table.insert(rebuiltList, itemName)
end
end
purchaseList = rebuiltList
hHero.abyss_tome_sequence_initialized = true
end
local tomeCount = CountTomeItems(purchaseList)
while tomeCount < ABYSS_TOME_REFILL_COUNT do
table.insert(purchaseList, "item_tome_of_strength")
table.insert(purchaseList, "item_tome_of_strength")
table.insert(purchaseList, "item_tome_of_strength")
table.insert(purchaseList, "item_tome_of_strength")
table.insert(purchaseList, "item_tome_of_agility")
table.insert(purchaseList, "item_tome_of_intelligence")
tomeCount = tomeCount + 6
end
tBotItemData.purchaseItemList[iHeroName] = purchaseList
end
function _G.AbyssModeConsumeOverflowTomes(hHero, pairCount, maybePairCount)
if hHero == _G then
hHero = pairCount
pairCount = maybePairCount
end
if hHero == nil and pairCount ~= nil and maybePairCount ~= nil then
hHero = pairCount
pairCount = maybePairCount
end
if not hHero or pairCount == nil or pairCount <= 0 then
return 0
end
local requestedCount = math.floor(pairCount)
local strengthStacks = requestedCount * 4
local agilityStacks = requestedCount
local intellectStacks = requestedCount
AddAbyssOverflowStats(hHero, strengthStacks, agilityStacks, intellectStacks)
AddTomeDisplayStacks(hHero, strengthStacks, agilityStacks, intellectStacks)
return requestedCount
end
function AddTomeDisplayStacks(hHero, strengthStacks, agilityStacks, intellectStacks)
AddTomeDisplayStack(hHero, "modifier_str_tome", strengthStacks)
AddTomeDisplayStack(hHero, "modifier_agi_tome", agilityStacks)
AddTomeDisplayStack(hHero, "modifier_int_tome", intellectStacks)
end
function AddTomeDisplayStack(hHero, modifierName, stackCount)
if stackCount <= 0 then
return
end
local modifier = hHero:FindModifierByName(modifierName)
if not modifier then
hHero:AddNewModifier(hHero, nil, modifierName, {})
modifier = hHero:FindModifierByName(modifierName)
end
if modifier then
modifier:SetStackCount(modifier:GetStackCount() + stackCount)
end
end
function AddAbyssOverflowStats(hHero, strengthStacks, agilityStacks, intellectStacks)
local strengthBonus = strengthStacks * ABYSS_TOME_STAT_BONUS
local agilityBonus = agilityStacks * ABYSS_TOME_STAT_BONUS
local intellectBonus = intellectStacks * ABYSS_TOME_STAT_BONUS
if strengthBonus <= 0 and agilityBonus <= 0 and intellectBonus <= 0 then
return
end
hHero:AddNewModifier(hHero, nil, "modifier_abyss_overflow_stats", {
strength = strengthBonus,
agility = agilityBonus,
intellect = intellectBonus,
})
end
local function addTome(k, v)
local multiplier = AIGameMode.fBotGoldXpMultiplier
if multiplier >= 10 then
local replace_chance = multiplier * 2
if multiplier >= 21 then
replace_chance = multiplier * 3
end
print("replace_chance", replace_chance)
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_sacred_six_vein", "item_ten_thousand_swords")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_eternal_shroud", "item_ten_thousand_swords")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_refresh_core", "item_time_gem")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_insight_armor", "item_beast_shield")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_blade_mail_2", "item_beast_armor")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_hallowed_scepter", "item_magic_abyss_staff")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_skadi_2", "item_magic_sword")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_bfury_ultra", "item_magic_sword")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_infernal_desolator", "item_magic_sword")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_dragon_lance_pro_max", "item_swift_glove")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_dagon_5", "item_shadow_impact")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_abyssal_blade_v2", "item_shadow_judgment")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_blue_fantasy", "item_shadow_judgment")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_satanic_2", "item_dracula_mask")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_undying_heart", "item_withered_spring")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_aeon_pendant", "item_withered_spring")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_hallowed_scepter", "item_magic_crit_blade")
end
if RandomInt(1, 100) <= replace_chance then
if RandomInt(1, 2) == 1 then
replaceItem(v, "item_wasp_golden", "item_switchable_crit_blade")
else
replaceItem(v, "item_wasp_golden", "item_magic_phantom_crit_blade")
end
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_abyssal_blade_v2", "item_forbidden_blade")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_blue_fantasy", "item_forbidden_blade")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_necronomicon_staff", "item_forbidden_staff")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_gungir_2", "item_forbidden_staff")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_adi_king_plus", "item_hawkeye_fighter")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_hurricane_pike_2", "item_hawkeye_turret")
end
if RandomInt(1, 100) <= replace_chance then
replaceItem(v, "item_jump_jump_jump", "item_flight_bar")
end
end
if AIGameMode.fBotGoldXpMultiplier >= 20 then
if RandomInt(1, 2) == 1 then
replaceItem(v, "item_excalibur", "item_switchable_crit_blade")
else
replaceItem(v, "item_excalibur", "item_magic_phantom_crit_blade")
end
else
replaceItem(v, "item_excalibur", "item_rapier_ultra_bot_1")
end
table.insert(v, "item_tome_of_luoshu")
local amount = 0
if AIGameMode.fBotGoldXpMultiplier >= 100 then
amount = 200
elseif AIGameMode.fBotGoldXpMultiplier >= 41 then
amount = 50
elseif AIGameMode.fBotGoldXpMultiplier >= 21 then
amount = 35
elseif AIGameMode.fBotGoldXpMultiplier >= 20 then
amount = 25
elseif AIGameMode.fBotGoldXpMultiplier >= 10 then
amount = 20
elseif AIGameMode.fBotGoldXpMultiplier >= 8 then
amount = 15
elseif AIGameMode.fBotGoldXpMultiplier >= 5 then
amount = 12
elseif AIGameMode.fBotGoldXpMultiplier >= 4 then
amount = 9
elseif AIGameMode.fBotGoldXpMultiplier >= 3 then
amount = 6
elseif AIGameMode.fBotGoldXpMultiplier >= 2 then
amount = 3
end
for i = 1, amount do
table.insert(v, "item_tome_of_strength")
table.insert(v, "item_tome_of_agility")
table.insert(v, "item_tome_of_intelligence")
end
end
if BotThink == nil then
print("Bot Think initialize!")
_G.BotThink = class({})
end
function BotThink:SetTome()
local allPurchaseTable = tBotItemData.purchaseItemList
for k, v in pairs(allPurchaseTable) do
addTome(k, v)
end
end
function BotThink:FindItemByNameNotIncludeBackpack(hHero, sName)
for i = 0, 5 do
if hHero:GetItemInSlot(i) and hHero:GetItemInSlot(i):GetName() == sName then return hHero:GetItemInSlot(i) end
end
return nil
end
function BotThink:FindItemByNameIncludeBackpack(hHero, sName)
for i = 0, 8 do
local item = hHero:GetItemInSlot(i)
if item and item:GetName() == sName then
return item
end
end
return nil
end
function BotThink:FindWardItemByNameIncludeBackpack(hHero, sName)
local item = BotThink:FindItemByNameIncludeBackpack(hHero, sName)
if item then
return item
end
local titaniumWardEye = BotThink:FindItemByNameIncludeBackpack(hHero, BOT_WARD_ITEM_NAME)
if titaniumWardEye then
return titaniumWardEye
end
if sName == "item_ward_observer" or sName == "item_ward_sentry" then
return BotThink:FindItemByNameIncludeBackpack(hHero, "item_ward_dispenser")
end
return nil
end
function BotThink:FindItemByNameIncludeStash(hHero, sName)
for i = 0, 15 do
if hHero:GetItemInSlot(i) and hHero:GetItemInSlot(i):GetName() == sName then return hHero:GetItemInSlot(i) end
end
return nil
end
function BotThink:IsItemCanUse(hHero, sName)
if hHero:HasItemInInventory(sName) then
local item = BotThink:FindItemByNameNotIncludeBackpack(hHero, sName)
if item and item:IsCooldownReady() then
return true
end
end
return false
end
function BotThink:IsItemCanUseIncludeBackpack(hHero, sName)
local item = BotThink:FindWardItemByNameIncludeBackpack(hHero, sName)
if item == nil or not item:IsCooldownReady() then
return false
end
local itemSlot = item:GetItemSlot()
if itemSlot >= 0 and itemSlot <= 5 then
return not item.IsFullyCastable or item:IsFullyCastable()
end
return itemSlot >= 6 and itemSlot <= 8
end
function BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
local tAllHeroes = FindUnitsInRadius(hHero:GetTeam(), hHero:GetOrigin(), nil, iRange, DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_ANY_ORDER, false)
return tAllHeroes
end
function BotThink:FindNearestEnemyHeroesInRangeAndVisible(hHero, iRange)
local tAllHeroes = FindUnitsInRadius(hHero:GetTeam(), hHero:GetOrigin(), nil, iRange, DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_CLOSEST, false)
if #tAllHeroes > 0 then
return tAllHeroes[1]
end
return nil
end
function BotThink:FindFriendHeroesInRangeAndVisible(hHero, iRange)
local tAllHeroes = FindUnitsInRadius(hHero:GetTeam(), hHero:GetOrigin(), nil, iRange, DOTA_UNIT_TARGET_TEAM_FRIENDLY,
DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, FIND_ANY_ORDER, false)
return tAllHeroes
end
function BotThink:UseItemOnTarget(hHero, sItemName, hTarget)
if not hHero:HasItemInInventory(sItemName) then
return false
end
local hItem = BotThink:FindItemByNameNotIncludeBackpack(hHero, sItemName)
if hItem then
if hItem:IsCooldownReady() then
hHero:CastAbilityOnTarget(hTarget, hItem, hHero:GetPlayerOwnerID())
return true
end
end
return false
end
function BotThink:UseItemOnPostion(hHero, sItemName, hTarget)
if not hHero:HasItemInInventory(sItemName) then
return false
end
local hItem = BotThink:FindItemByNameNotIncludeBackpack(hHero, sItemName)
if hItem then
if hItem:IsCooldownReady() then
hHero:CastAbilityOnPosition(hTarget:GetOrigin(), hItem, hHero:GetPlayerOwnerID())
return true
end
end
return false
end
function BotThink:UseItem(hHero, sItemName)
if not hHero:HasItemInInventory(sItemName) then
return false
end
local hItem = BotThink:FindItemByNameNotIncludeBackpack(hHero, sItemName)
if hItem then
if hItem:IsCooldownReady() then
hHero:CastAbilityNoTarget(hItem, hHero:GetPlayerOwnerID())
return true
end
end
return false
end
function BotThink:GetCooldownTotal(hHero)
local iCooldownTotal = 0
for i = 0, 5 do
local hAbility = hHero:GetAbilityByIndex(i)
if hAbility then
iCooldownTotal = iCooldownTotal + hAbility:GetCooldownTimeRemaining()
end
end
for i = 0, 8 do
local hItem = hHero:GetItemInSlot(i)
if hItem then
iCooldownTotal = iCooldownTotal + hItem:GetCooldownTimeRemaining()
end
end
return iCooldownTotal
end
local function FindAllByClassnameWithinCompat(classname, origin, radius)
local result = {}
local ents = Entities:FindAllByClassname(classname) or {}
for _, ent in ipairs(ents) do
if ent and (ent:GetAbsOrigin() - origin):Length2D() <= radius then
table.insert(result, ent)
end
end
return result
end
function BotThink:IsBesideFriendTower(hHero, radius)
local vHeroPos = hHero:GetAbsOrigin()
local towers = FindAllByClassnameWithinCompat("npc_dota_tower", vHeroPos, radius)
for i, vTower in ipairs(towers) do
if vTower:GetTeamNumber() == hHero:GetTeamNumber() then
return true
end
end
return false
end
function BotThink:IsBesideEnemyTower(hHero, radius)
local vHeroPos = hHero:GetAbsOrigin()
local towers = FindAllByClassnameWithinCompat("npc_dota_tower", vHeroPos, radius)
for i, vTower in ipairs(towers) do
if vTower:GetTeamNumber() ~= hHero:GetTeamNumber() then
return true
end
end
return false
end
local function BuyItemIfGoldEnough(hHero, iPurchaseTable)
if not iPurchaseTable then
return false
end
if (#iPurchaseTable == 0) then
return false
end
local iItemName = iPurchaseTable[1]
if not iItemName then
return false
end
local iCost = GetItemCost(iItemName)
if (hHero:GetGold() > iCost) then
if hHero:GetNumItemsInInventory() > 8 then
else
local addedItem = hHero:AddItemByName(iItemName)
if addedItem then
PlayerResource:SpendGold(hHero:GetPlayerID(), iCost, DOTA_ModifyGold_PurchaseItem)
table.remove(iPurchaseTable, 1)
return true
else
return false
end
end
end
end
local function SellItemFromTable(hHero, iPurchaseTable)
for k, vName in ipairs(iPurchaseTable) do
local sellItem = BotThink:FindItemByNameIncludeStash(hHero, vName)
if sellItem then
local iCost = math.floor(GetItemCost(vName) / 2)
UTIL_RemoveImmediate(sellItem)
PlayerResource:ModifyGold(hHero:GetPlayerID(), iCost, true, DOTA_ModifyGold_SellItem)
return true
end
end
return false
end
local function GetItemSortValue(hItem)
if not hItem or hItem:IsNull() then
return -1
end
local itemCost = GetItemCost(hItem:GetName())
if itemCost and itemCost > 0 then
return itemCost
end
return 0
end
local tWardItemLockedUntil = {}
local function IsWardInventoryItemName(itemName)
return itemName == "item_ward_observer"
or itemName == "item_ward_sentry"
or itemName == "item_ward_dispenser"
or itemName == BOT_WARD_ITEM_NAME
end
local function LockWardItemForCast(hItem, duration)
if not hItem or hItem:IsNull() then
return
end
if IsWardInventoryItemName(hItem:GetName()) then
tWardItemLockedUntil[tostring(hItem:GetEntityIndex())] = GameRules:GetGameTime() + duration
end
end
local function IsWardItemTemporarilyLocked(hItem)
if not hItem or hItem:IsNull() then
return false
end
local lockedUntil = tWardItemLockedUntil[tostring(hItem:GetEntityIndex())]
return lockedUntil ~= nil and GameRules:GetGameTime() < lockedUntil
end
local function IsInventoryOrganizerLockedItem(hItem)
if not hItem or hItem:IsNull() then
return false
end
local itemName = hItem:GetName()
return itemName == "item_aegis"
or IsWardItemTemporarilyLocked(hItem)
or (itemName ~= BOT_WARD_ITEM_NAME and IsWardInventoryItemName(itemName) and hItem:GetItemSlot() >= 0 and hItem:GetItemSlot() <= 5)
end
local function OrganizeInventoryByValue(hHero)
local swapped = false
local shouldContinue = true
while shouldContinue do
shouldContinue = false
for inventorySlot = 0, 5 do
local inventoryItem = hHero:GetItemInSlot(inventorySlot)
if not IsInventoryOrganizerLockedItem(inventoryItem) then
local inventoryValue = GetItemSortValue(inventoryItem)
local bestBackpackSlot = nil
local bestBackpackValue = inventoryValue
for backpackSlot = 6, 8 do
local backpackItem = hHero:GetItemInSlot(backpackSlot)
if not IsInventoryOrganizerLockedItem(backpackItem) then
local backpackValue = GetItemSortValue(backpackItem)
if backpackValue > bestBackpackValue then
bestBackpackValue = backpackValue
bestBackpackSlot = backpackSlot
end
end
end
if bestBackpackSlot ~= nil then
hHero:SwapItems(inventorySlot, bestBackpackSlot)
swapped = true
shouldContinue = true
break
end
end
end
end
return swapped
end
local function EnsureItemInActiveInventory(hHero, hItem)
if not hItem or hItem:IsNull() then
return nil, false
end
local itemSlot = hItem:GetItemSlot()
if itemSlot >= 0 and itemSlot <= 5 then
return hItem, false
end
if itemSlot < 6 or itemSlot > 8 then
return nil, false
end
for activeSlot = 0, 5 do
if not hHero:GetItemInSlot(activeSlot) then
hHero:SwapItems(itemSlot, activeSlot)
return hHero:GetItemInSlot(activeSlot), true
end
end
local cheapestSlot = nil
local cheapestValue = nil
for activeSlot = 0, 5 do
local activeItem = hHero:GetItemInSlot(activeSlot)
if not IsInventoryOrganizerLockedItem(activeItem) then
local activeValue = GetItemSortValue(activeItem)
if cheapestValue == nil or activeValue < cheapestValue then
cheapestValue = activeValue
cheapestSlot = activeSlot
end
end
end
if cheapestSlot ~= nil then
hHero:SwapItems(itemSlot, cheapestSlot)
return hHero:GetItemInSlot(cheapestSlot), true
end
return nil, false
end
local tWardCastFailedUntil = {}
local tWardCastPendingUntil = {}
local tWardCastSuccessUntil = {}
local function GetWardCastKey(hHero, sWardItemName)
return tostring(hHero:GetEntityIndex()) .. ":" .. sWardItemName
end
local function GetWardHeroKey(hHero)
return tostring(hHero:GetEntityIndex())
end
local function IsWardCastThrottled(hHero, sWardItemName)
local failedUntil = tWardCastFailedUntil[GetWardCastKey(hHero, sWardItemName)]
local pendingUntil = tWardCastPendingUntil[GetWardCastKey(hHero, sWardItemName)]
local dispenserPendingUntil = tWardCastPendingUntil[GetWardCastKey(hHero, "item_ward_dispenser")]
local successUntil = tWardCastSuccessUntil[GetWardHeroKey(hHero)]
local now = GameRules:GetGameTime()
return (failedUntil ~= nil and now < failedUntil)
or (pendingUntil ~= nil and now < pendingUntil)
or (dispenserPendingUntil ~= nil and now < dispenserPendingUntil)
or (successUntil ~= nil and now < successUntil)
end
local function MarkWardCastFailed(hHero, sWardItemName)
tWardCastFailedUntil[GetWardCastKey(hHero, sWardItemName)] = GameRules:GetGameTime() + 12
end
local function MarkWardCastSucceeded(hHero)
tWardCastSuccessUntil[GetWardHeroKey(hHero)] = GameRules:GetGameTime() + 120
end
local function IsWardItemReadyToCast(hItem)
if hItem == nil or hItem:IsNull() then
return false
end
local itemSlot = hItem:GetItemSlot()
if itemSlot < 0 or itemSlot > 8 then
return false
end
if not hItem:IsCooldownReady() then
return false
end
if hItem.IsOwnersManaEnough and not hItem:IsOwnersManaEnough() then
return false
end
if itemSlot >= 0 and itemSlot <= 5 and hItem.IsFullyCastable and not hItem:IsFullyCastable() then
return false
end
return true
end
local function CastPreparedWardItem(hHero, wardItem, wardPosVector, sWardItemName, vWardPos)
if not hHero or hHero:IsNull() or not hHero:IsAlive() or IsHeroUncontrollable(hHero) then
return
end
if not IsWardItemReadyToCast(wardItem) then
MarkWardCastFailed(hHero, sWardItemName)
return
end
print("Think put ward " ..
hHero:GetName() .. " try to put " .. sWardItemName .. " at [" .. vWardPos[1] .. "," .. vWardPos[2] .. "]")
if wardItem:GetName() == BOT_WARD_ITEM_NAME and wardItem.OnSpellStart then
hHero:SetCursorCastTarget(nil)
hHero:SetCursorTargetingNothing(true)
hHero:SetCursorPosition(wardPosVector)
wardItem:OnSpellStart()
wardItem:UseResources(true, false, false, true)
MarkWardCastSucceeded(hHero)
return
end
hHero:CastAbilityOnPosition(wardPosVector, wardItem, hHero:GetPlayerOwnerID())
MarkWardCastSucceeded(hHero)
end
local function InsertUniqueItem(list, seen, itemName)
if itemName == nil or itemName == "" or seen[itemName] then
return
end
table.insert(list, itemName)
seen[itemName] = true
end
local function CopyPurchaseList(sourceList)
if sourceList == nil then
return nil
end
local copied = {}
for _, itemName in ipairs(sourceList) do
table.insert(copied, itemName)
end
return copied
end
function BotThink:BuildDefaultPurchaseList(hHero, iHeroName)
local fallbackHeroName = tBotItemData.fallbackPurchaseHeroMap and tBotItemData.fallbackPurchaseHeroMap[iHeroName]
if fallbackHeroName then
local fallbackList = CopyPurchaseList(tBotItemData.purchaseItemList[fallbackHeroName])
if fallbackList and #fallbackList > 0 then
return fallbackList
end
end
local seen = {}
local purchaseList = {}
InsertUniqueItem(purchaseList, seen, "item_magic_wand")
InsertUniqueItem(purchaseList, seen, "item_boots")
InsertUniqueItem(purchaseList, seen, "item_wings_of_haste")
InsertUniqueItem(purchaseList, seen, "item_aghanims_shard")
InsertUniqueItem(purchaseList, seen, "item_ultimate_scepter_2")
local templateItems = BotThink:GetTemplateItems(hHero, iHeroName)
if templateItems == nil then
local templates = tBotItemData.superLateGameTemplates
if hHero.IsRangedAttacker and hHero:IsRangedAttacker() then
templateItems = templates.ranged_dps_items
else
templateItems = templates.melee_dps_items
end
end
if templateItems then
for _, itemName in ipairs(templateItems) do
InsertUniqueItem(purchaseList, seen, itemName)
end
end
InsertUniqueItem(purchaseList, seen, "item_tome_of_agility")
InsertUniqueItem(purchaseList, seen, "item_tome_of_strength")
InsertUniqueItem(purchaseList, seen, "item_tome_of_intelligence")
InsertUniqueItem(purchaseList, seen, "item_tome_of_luoshu")
return purchaseList
end
function BotThink:ThinkPurchase(hHero)
local iHeroName = hHero:GetName()
local gameTime = GameRules:GetGameTime() / 60
if tBotItemData.purchaseItemList[iHeroName] == nil or #tBotItemData.purchaseItemList[iHeroName] == 0 then
tBotItemData.purchaseItemList[iHeroName] = BotThink:BuildDefaultPurchaseList(hHero, iHeroName)
end
local thresholdTime = 50
if AIGameMode.fBotGoldXpMultiplier >= 100 then
thresholdTime = 10
elseif AIGameMode.fBotGoldXpMultiplier >= 41 then
thresholdTime = 17
elseif AIGameMode.fBotGoldXpMultiplier >= 21 then
thresholdTime = 21
elseif AIGameMode.fBotGoldXpMultiplier >= 20 then
thresholdTime = 25
elseif AIGameMode.fBotGoldXpMultiplier >= 15 then
thresholdTime = 30
elseif AIGameMode.fBotGoldXpMultiplier >= 10 then
thresholdTime = 44
end
if AIGameMode.bMidOnlyMode == true or AIGameMode.bMidOnlyMode == 1 then
thresholdTime = thresholdTime * 0.7
end
EnsureAbyssTomeQueue(hHero, iHeroName)
local shouldUseLateGameTemplate = AIGameMode.fBotGoldXpMultiplier >= 15 and gameTime >= thresholdTime
if IsAbyssBotHero(hHero) and (_G.AbyssModeWave or 0) >= ABYSS_LATE_GAME_TEMPLATE_WAVE then
shouldUseLateGameTemplate = true
end
if shouldUseLateGameTemplate then
if not hHero.late_game_equipped then
if not hHero.fixed_late_game_items then
local templateItems = BotThink:GetTemplateItems(hHero, iHeroName)
if templateItems then
local currentList = tBotItemData.purchaseItemList[iHeroName] or {}
local tomeStartIndex = nil
for i, item in ipairs(currentList) do
if item == "item_tome_of_luoshu" or
item == "item_tome_of_strength" or
item == "item_tome_of_agility" or
item == "item_tome_of_intelligence" then
tomeStartIndex = i
break
end
end
local finalItems = {}
local tomeItems = {}
for _, item in ipairs(templateItems) do
table.insert(finalItems, item)
end
if tomeStartIndex then
for i = tomeStartIndex, #currentList do
table.insert(tomeItems, currentList[i])
end
end
local heroItems = {}
for i = 0, 15 do
local item = hHero:GetItemInSlot(i)
if item then
heroItems[item:GetName()] = true
end
end
local newPurchaseList = {}
for _, item in ipairs(templateItems) do
if not heroItems[item] then
table.insert(newPurchaseList, item)
end
end
for _, item in ipairs(tomeItems) do
table.insert(newPurchaseList, item)
end
hHero.fixed_late_game_items = newPurchaseList
tBotItemData.purchaseItemList[iHeroName] = newPurchaseList
end
end
if hHero.fixed_late_game_items then
hHero.late_game_equipped = true
end
end
end
EnsureAbyssTomeQueue(hHero, iHeroName)
local iPurchaseTable = tBotItemData.purchaseItemList[iHeroName]
if iPurchaseTable and #iPurchaseTable > 0 then
local nextItem = iPurchaseTable[1]
if hHero:GetNumItemsInInventory() >= 9 then
local cheapestItem = nil
local cheapestCost = 999999
for slot = 0, 8 do
local slotItem = hHero:GetItemInSlot(slot)
if slotItem then
local itemName = slotItem:GetName()
local cost = GetItemCost(itemName)
if cost > 100 and cost < 18000 and cost < cheapestCost and
itemName ~= "item_tome_of_luoshu" and
itemName ~= BOT_WARD_ITEM_NAME and
not string.find(itemName, "tome_of") then
cheapestCost = cost
cheapestItem = slotItem
end
end
end
if cheapestItem then
local itemName = cheapestItem:GetName()
local sellCost = math.floor(GetItemCost(itemName) / 2)
UTIL_RemoveImmediate(cheapestItem)
PlayerResource:ModifyGold(hHero:GetPlayerID(), sellCost, true, DOTA_ModifyGold_SellItem)
end
end
end
BuyItemIfGoldEnough(hHero, iPurchaseTable)
end
function BotThink:GetTemplateItems(hHero, iHeroName)
local heroName = hHero:GetName()
local templates = tBotItemData.superLateGameTemplates
if not templates then
return nil
end
local itemPool = nil
local heroType = "unknown"
if templates.ranged_dps[iHeroName] then
itemPool = templates.ranged_dps_items
heroType = "ranged_dps"
elseif templates.melee_dps[iHeroName] then
itemPool = templates.melee_dps_items
heroType = "melee_dps"
elseif templates.mage[iHeroName] then
itemPool = templates.mage_items
heroType = "mage"
elseif templates.tank[iHeroName] then
itemPool = templates.tank_items
heroType = "tank"
elseif templates.support[iHeroName] then
itemPool = templates.support_items
heroType = "support"
end
if not itemPool then
return nil
end
local finalItems = {}
for i = 1, 3 do
table.insert(finalItems, itemPool[i])
end
local randomPool = {}
for i = 4, 8 do
table.insert(randomPool, itemPool[i])
end
for i = 1, 3 do
local randomIndex = RandomInt(1, #randomPool)
local selectedItem = randomPool[randomIndex]
table.insert(finalItems, selectedItem)
table.remove(randomPool, randomIndex)
end
return finalItems
end
function BotThink:ThinkSell(hHero)
local iHeroName = hHero:GetName()
local iItemCount = hHero:GetNumItemsInInventory()
if iItemCount <= 7 then
OrganizeInventoryByValue(hHero)
return
end
local sellItemCommonList = tBotItemData.sellItemCommonList
if SellItemFromTable(hHero, sellItemCommonList) then
return
end
local iSellTable = tBotItemData.sellItemList[iHeroName]
if not iSellTable then
return
end
if SellItemFromTable(hHero, iSellTable) then
return
end
OrganizeInventoryByValue(hHero)
end
function BotThink:ThinkConsumeItem(hHero)
local tomeItems = {
'item_tome_of_agility',
'item_tome_of_strength',
'item_tome_of_intelligence',
'item_tome_of_luoshu'
}
if IsAbyssBotHero(hHero) then
tomeItems = {
'item_tome_of_strength',
'item_tome_of_agility',
'item_tome_of_intelligence'
}
end
for _, tomeName in ipairs(tomeItems) do
local item = BotThink:FindItemByNameIncludeStash(hHero, tomeName)
if item then
if item.OnSpellStart then
item:OnSpellStart()
end
UTIL_RemoveImmediate(item)
end
end
local itemConsumeList = tBotItemData.itemConsumeList
for i, vItemUseName in ipairs(itemConsumeList) do
BotThink:UseConsumableItemIncludeBackpack(hHero, vItemUseName)
end
end
function BotThink:UseConsumableItemIncludeBackpack(hHero, sItemName)
local item = BotThink:FindItemByNameIncludeBackpack(hHero, sItemName)
if not item or item:IsNull() or not item:IsCooldownReady() then
return false
end
if item.IsOwnersManaEnough and not item:IsOwnersManaEnough() then
return false
end
if sItemName == "item_wings_of_haste" then
local modifierName = "modifier_item_wings_of_haste_consumed"
if hHero:HasModifier(modifierName) then
return false
end
if item.ApplyDataDrivenModifier then
item:ApplyDataDrivenModifier(hHero, hHero, modifierName, {})
hHero:EmitSound("Hero_Alchemist.Scepter.Cast")
UTIL_RemoveImmediate(item)
return true
end
return false
end
if sItemName == "item_ultimate_scepter_2" then
local modifierName = "modifier_item_ultimate_scepter_2_consumed"
if hHero:HasModifier(modifierName) then
return false
end
if hHero:HasModifier("modifier_item_ultimate_scepter") then
hHero:RemoveModifierByName("modifier_item_ultimate_scepter")
end
hHero:AddNewModifier(hHero, nil, "modifier_item_ultimate_scepter", { duration = -1 })
hHero:AddNewModifier(hHero, item, modifierName, {})
hHero:EmitSound("Hero_Alchemist.Scepter.Cast")
UTIL_RemoveImmediate(item)
return true
end
if sItemName == "item_moon_shard_datadriven" then
local modifierName = "modifier_item_moon_shard_datadriven_consumed"
if item.ApplyDataDrivenModifier then
item:ApplyDataDrivenModifier(hHero, hHero, modifierName, {})
local currentStacks = hHero:GetModifierStackCount(modifierName, hHero)
hHero:SetModifierStackCount(modifierName, hHero, currentStacks + 1)
hHero:EmitSound("Item.MoonShard.Consume")
item:SpendCharge(1)
return true
end
return false
end
return BotThink:UseItemOnTarget(hHero, sItemName, hHero)
end
function BotThink:AddWardItem(hHero)
local iItemCount = hHero:GetNumItemsInInventory()
if iItemCount >= 8 then
return
end
if BotThink:FindItemByNameIncludeStash(hHero, BOT_WARD_ITEM_NAME) then
return
end
if BotThink:FindItemByNameIncludeStash(hHero, "item_dust") then
return
end
if BotThink:FindItemByNameIncludeStash(hHero, "item_gem") then
return
end
local addedItem = hHero:AddItemByName(BOT_WARD_ITEM_NAME)
end
function BotThink:PutWardObserver(hHero)
local wardPostionList = tBotItemData.wardObserverPostionList
local sWardItemName = "item_ward_observer"
local sUnitClassName = "npc_dota_ward_base"
if BotThink:IsBesideFriendTower(hHero, 1600) then
return
end
if BotThink:IsBesideEnemyTower(hHero, 900) then
return
end
if RandomInt(1, 5) == 1 then
wardPostionList = {}
table.insert(wardPostionList, hHero:GetAbsOrigin())
end
if BotThink:IsItemCanUseIncludeBackpack(hHero, sWardItemName) then
BotThink:PutWardItem(hHero, wardPostionList, sWardItemName, sUnitClassName)
end
end
function BotThink:PutWardSentry(hHero)
if BotThink:IsBesideFriendTower(hHero, 1000) then
return
end
local wardPostionList = tBotItemData.wardSentryPostionList
local sWardItemName = "item_ward_sentry"
local sUnitClassName = "npc_dota_ward_base_truesight"
if hHero:GetHealthPercent() < 80 then
wardPostionList = {}
table.insert(wardPostionList, hHero:GetAbsOrigin())
end
if BotThink:IsItemCanUseIncludeBackpack(hHero, sWardItemName) then
BotThink:PutWardItem(hHero, wardPostionList, sWardItemName, sUnitClassName)
end
end
function BotThink:PutWardItem(hHero, wardPostionList, sWardItemName, sUnitClassName)
if IsWardCastThrottled(hHero, sWardItemName) then
return
end
local iCastRange = 500
local iFindRange = 1200
if sWardItemName == "item_ward_observer" then
iFindRange = 1600
end
local wardItem = BotThink:FindWardItemByNameIncludeBackpack(hHero, sWardItemName)
local vHeroPos = hHero:GetAbsOrigin()
for _, vWardPos in ipairs(wardPostionList) do
if wardItem then
local wardPosVector = vWardPos + Vector(RandomInt(-50, 50), RandomInt(-50, 50), 0)
local wardPosDistance = (wardPosVector - vHeroPos):Length()
if wardPosDistance < iCastRange then
local wards = FindAllByClassnameWithinCompat(sUnitClassName, wardPosVector, iFindRange)
for i = #wards, 1, -1 do
if wards[i]:GetTeamNumber() ~= hHero:GetTeamNumber() then
table.remove(wards, i)
end
end
if #wards == 0 then
local swapped = false
if wardItem:GetName() ~= BOT_WARD_ITEM_NAME then
wardItem, swapped = EnsureItemInActiveInventory(hHero, wardItem)
end
if not IsWardItemReadyToCast(wardItem) then
if swapped and wardItem ~= nil and not wardItem:IsNull() then
LockWardItemForCast(wardItem, 6.5)
tWardCastPendingUntil[GetWardCastKey(hHero, sWardItemName)] = GameRules:GetGameTime() + 6.5
if wardItem:GetName() == "item_ward_dispenser" then
tWardCastPendingUntil[GetWardCastKey(hHero, "item_ward_dispenser")] = GameRules:GetGameTime() + 6.5
end
Timers:CreateTimer(6.2, function()
tWardCastPendingUntil[GetWardCastKey(hHero, sWardItemName)] = nil
tWardCastPendingUntil[GetWardCastKey(hHero, "item_ward_dispenser")] = nil
CastPreparedWardItem(hHero, wardItem, wardPosVector, sWardItemName, vWardPos)
end)
return
end
MarkWardCastFailed(hHero, sWardItemName)
return
end
CastPreparedWardItem(hHero, wardItem, wardPosVector, sWardItemName, vWardPos)
else
end
return
end
end
end
end
function BotThink:AddMoney(hHero)
local iAddBase = AIGameMode.playerNumber + 5
local GameTime = GameRules:GetDOTATime(false, false)
local totalGold = PlayerResource:GetTotalEarnedGold(hHero:GetPlayerID())
local goldPerSec = totalGold / GameTime
local multiplier = AIGameMode.fBotGoldXpMultiplier
if hHero:GetTeam() == DOTA_TEAM_GOODGUYS then
multiplier = AIGameMode.fPlayerGoldXpMultiplier
end
local iAddMoney = math.floor(multiplier * iAddBase)
if goldPerSec > iAddMoney then
return false
end
if iAddMoney > 0 then
hHero:ModifyGold(iAddMoney, true, DOTA_ModifyGold_GameTick)
return true
end
return false
end
