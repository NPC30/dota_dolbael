local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____action_2Ditem = require("ai.action.action-item")
local ActionItem = ____action_2Ditem.ActionItem
local CONSUME_ITEMS_WITH_TARGET = {"item_wings_of_haste", "item_ultimate_scepter_2", "item_moon_shard_datadriven"}
local CONSUME_ITEMS_NO_TARGET = {"item_tome_of_agility", "item_tome_of_strength", "item_tome_of_intelligence", "item_tome_of_luoshu"}
____exports.UseItem = __TS__Class()
local UseItem = ____exports.UseItem
UseItem.name = "UseItem"
function UseItem.prototype.____constructor(self)
end
function UseItem.UseConsumeItems(self, hero)
if hero:IsMuted() then
return false
end
for ____, itemName in ipairs(CONSUME_ITEMS_WITH_TARGET) do
if ActionItem:UseItemOnTarget(hero, itemName, hero) then
return true
end
end
for ____, itemName in ipairs(CONSUME_ITEMS_NO_TARGET) do
if ActionItem:UseItemNoTarget(hero, itemName) then
return true
end
end
return false
end
function UseItem.UseItemEnemy(self, hero, enemys)
if hero:IsMuted() then
return false
end
if not enemys then
return false
end
if #enemys == 0 then
return false
end
local _enemy = enemys[1]
return false
end
function UseItem.UseItemCreep(self, hero, creeps)
if hero:IsMuted() then
return false
end
if not creeps then
return false
end
if #creeps == 0 then
return false
end
local creep = creeps[1]
if creep:IsAncient() then
return false
end
if ActionItem:UseItemOnTarget(hero, "item_hand_of_group", creep) then
return true
end
return false
end
return ____exports
