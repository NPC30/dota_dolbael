local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local global = _G
if not global.wardSlotProcessedItemEntIndexes then
global.wardSlotProcessedItemEntIndexes = __TS__New(Set)
end
____exports.WardSlot = __TS__Class()
local WardSlot = ____exports.WardSlot
WardSlot.name = "WardSlot"
function WardSlot.prototype.____constructor(self)
self.processedItemEntIndexes = global.wardSlotProcessedItemEntIndexes
GameRules:GetGameModeEntity():ClearItemAddedToInventoryFilter()
ListenToGameEvent(
"npc_spawned",
function(____, keys) return self:onNpcSpawned(keys) end,
self
)
ListenToGameEvent(
"dota_inventory_item_added",
function(____, keys) return self:onInventoryItemAdded(keys) end,
self
)
end
function WardSlot.prototype.onNpcSpawned(self, keys)
local npc = EntIndexToHScript(keys.entindex)
if not npc or not npc:IsRealHero() or keys.is_respawn == 1 then
return
end
if not PlayerHelper:IsHumanPlayer(npc) then
return
end
self:ensureSlotAbilities(npc)
end
function WardSlot.prototype.ensureSlotAbilities(self, hero)
for ____, abilityName in ipairs(__TS__ObjectValues(____exports.WardSlot.WARD_ITEM_TO_ABILITY)) do
local ability = hero:FindAbilityByName(abilityName)
local isNewAbility = ability == nil
if not ability then
ability = hero:AddAbility(abilityName)
end
ability:SetLevel(1)
ability:SetActivated(true)
if isNewAbility then
ability:SetCurrentAbilityCharges(0)
end
end
end
function WardSlot.prototype.onInventoryItemAdded(self, event)
local isDispenser = event.itemname == "item_ward_dispenser"
local abilityName = ____exports.WardSlot.WARD_ITEM_TO_ABILITY[event.itemname]
if not abilityName and not isDispenser then
return
end
local playerId = event.inventory_player_id
if not PlayerResource:IsValidPlayerID(playerId) or not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
return
end
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
if not hero or not hero:IsRealHero() then
return
end
if self.processedItemEntIndexes:has(event.item_entindex) then
return
end
self.processedItemEntIndexes:add(event.item_entindex)
self:ensureSlotAbilities(hero)
Timers:CreateTimer(
0,
function()
local item = EntIndexToHScript(event.item_entindex)
if not item then
return
end
if isDispenser then
self:addAbilityCharges(
hero,
"ability_ward_observer_slot",
math.max(
0,
item:GetCurrentCharges()
)
)
self:addAbilityCharges(
hero,
"ability_ward_sentry_slot",
math.max(
0,
item:GetSecondaryCharges()
)
)
elseif abilityName ~= nil then
self:addAbilityCharges(
hero,
abilityName,
math.max(
1,
item:GetCurrentCharges()
)
)
end
self:removeInventoryItem(event.inventory_parent_entindex, hero, item)
end
)
end
function WardSlot.prototype.removeInventoryItem(self, inventoryParentEntIndex, hero, item)
local inventoryParent = EntIndexToHScript(inventoryParentEntIndex)
if inventoryParent and inventoryParent:IsBaseNPC() then
inventoryParent:RemoveItem(item)
return
end
hero:RemoveItem(item)
end
function WardSlot.prototype.addAbilityCharges(self, hero, abilityName, charges)
if charges <= 0 then
return
end
local ability = hero:FindAbilityByName(abilityName)
if ability ~= nil then
ability:SetCurrentAbilityCharges(ability:GetCurrentAbilityCharges() + charges)
end
end
WardSlot.WARD_ITEM_TO_ABILITY = {item_ward_observer = "ability_ward_observer_slot", item_ward_sentry = "ability_ward_sentry_slot"}
WardSlot = __TS__DecorateLegacy({reloadable}, WardSlot)
____exports.WardSlot = WardSlot
return ____exports
