require("libraries/popups")
require("items/item_tome_of_strength")
require("items/item_tome_of_agility")
require("items/item_tome_of_intelligence")
require("items/item_moon_shard")
LinkLuaModifier("modifier_gold_consumable_converter", "abilities/gold_consumable_converter", LUA_MODIFIER_MOTION_NONE)
gold_consumable_converter = gold_consumable_converter or class({})
modifier_gold_consumable_converter = modifier_gold_consumable_converter or class({})
local MODES = {
{
item = "item_tome_of_strength",
texture = "gold_consumable_converter_strength",
label = "力量之书",
stat = "str",
},
{
item = "item_tome_of_agility",
texture = "gold_consumable_converter_agility",
label = "敏捷之书",
stat = "agi",
},
{
item = "item_tome_of_intelligence",
texture = "gold_consumable_converter_intelligence",
label = "智力之书",
stat = "int",
},
{
item = "item_moon_shard_datadriven",
texture = "gold_consumable_converter_moon_shard",
label = "真·银月之晶",
},
}
local function GetModeIndex(ability)
local caster = ability:GetCaster()
if caster and not caster:IsNull() then
local mode = caster:GetModifierStackCount("modifier_gold_consumable_converter", caster)
if mode >= 1 and mode <= #MODES then
return mode
end
end
return 1
end
local function GetMode(ability)
return MODES[GetModeIndex(ability)]
end
local function GetPending(ability)
ability.converter_pending = ability.converter_pending or { 0, 0, 0, 0 }
return ability.converter_pending
end
local function GetPendingCount(ability, modeIndex)
return GetPending(ability)[modeIndex] or 0
end
local function GetTotalPending(ability)
local pending = GetPending(ability)
return (pending[1] or 0) + (pending[2] or 0) + (pending[3] or 0) + (pending[4] or 0)
end
local function SyncState(ability)
local caster = ability:GetCaster()
if not caster or caster:IsNull() then return end
local playerId = caster:GetPlayerOwnerID()
if playerId == nil or playerId < 0 then return end
local modeIndex = GetModeIndex(ability)
local mode = MODES[modeIndex]
local pending = GetPending(ability)
CustomNetTables:SetTableValue("gold_consumable_converter", tostring(playerId), {
unlocked = 1,
enabled = ability.converter_enabled == true and 1 or 0,
mode = modeIndex,
texture = mode.texture,
label = mode.label,
pendingCount = GetPendingCount(ability, modeIndex),
totalPending = GetTotalPending(ability),
pending1 = pending[1] or 0,
pending2 = pending[2] or 0,
pending3 = pending[3] or 0,
pending4 = pending[4] or 0,
})
end
local function CreateTempItem(itemName, caster, charges)
local item = CreateItem(itemName, caster, caster)
if not item then return nil end
item:SetPurchaser(caster)
item:SetOwner(caster)
item:SetCurrentCharges(charges)
return item
end
local function GetItemBonus(itemName, caster)
local item = CreateTempItem(itemName, caster, 1)
if not item then return 0 end
local bonus = item:GetSpecialValueFor("bonus")
UTIL_RemoveImmediate(item)
return bonus
end
local function SetTomeStacks(caster, modifierName, stacks)
local modifier = caster:FindModifierByName(modifierName)
if not modifier then
caster:AddNewModifier(caster, nil, modifierName, {})
modifier = caster:FindModifierByName(modifierName)
end
if modifier then
modifier:SetStackCount(modifier:GetStackCount() + stacks)
end
end
local function AddTomeTableValue(caster, tablePrefix, fieldName, bonus)
local key = tablePrefix .. caster:GetUnitName()
local tomeTable = CustomNetTables:GetTableValue("player_tome_table", key)
local oldValue = 0
if tomeTable then
oldValue = tomeTable[fieldName] or 0
end
CustomNetTables:SetTableValue("player_tome_table", key, { [fieldName] = oldValue + bonus })
end
local function UpdateBotIntellectCapAfterTome(caster)
local ok, botCap = pcall(require, "modules.helper.bot-intellect-cap")
if ok and botCap and botCap.BotIntellectCap then
botCap.BotIntellectCap:Update(caster)
end
end
local function ConsumeTome(caster, mode, charges)
local bonusPerTome = GetItemBonus(mode.item, caster)
if bonusPerTome <= 0 then return false end
local totalBonus = bonusPerTome * charges
if mode.stat == "str" then
caster:ModifyStrength(totalBonus)
AddTomeTableValue(caster, "str_tome_", "str", totalBonus)
SetTomeStacks(caster, "modifier_str_tome", charges)
PopupStrTome(caster, totalBonus)
elseif mode.stat == "agi" then
caster:ModifyAgility(totalBonus)
AddTomeTableValue(caster, "agi_tome_", "agi", totalBonus)
SetTomeStacks(caster, "modifier_agi_tome", charges)
PopupAgiTome(caster, totalBonus)
elseif mode.stat == "int" then
caster:ModifyIntellect(totalBonus)
AddTomeTableValue(caster, "int_tome_", "int", totalBonus)
SetTomeStacks(caster, "modifier_int_tome", charges)
UpdateBotIntellectCapAfterTome(caster)
PopupIntTome(caster, totalBonus)
else
return false
end
EmitSoundOnClient("Item.TomeOfKnowledge", caster)
return true
end
local function ConsumeMoonShard(caster, charges)
if not caster:IsRealHero() or caster:HasModifier("modifier_arc_warden_tempest_double") then
return false
end
local item = CreateTempItem("item_moon_shard_datadriven", caster, charges)
if not item then return false end
local modifierName = "modifier_item_moon_shard_datadriven_consumed"
for _ = 1, charges do
MoonShardOnSpell({
caster = caster,
target = caster,
ability = item,
modifier = modifierName,
})
end
return true
end
function gold_consumable_converter:GetIntrinsicModifierName()
return "modifier_gold_consumable_converter"
end
function gold_consumable_converter:GetAbilityTextureName()
return GetMode(self).texture
end
function gold_consumable_converter:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
local nextMode = GetModeIndex(self) + 1
if nextMode > #MODES then
nextMode = 1
end
caster:SetModifierStackCount("modifier_gold_consumable_converter", caster, nextMode)
end
function gold_consumable_converter:ConvertGold()
local caster = self:GetCaster()
if not caster or caster:IsNull() or not caster:IsAlive() then return false end
local mode = GetMode(self)
local cost = GetItemCost(mode.item)
if not cost or cost <= 0 then return false end
if caster:GetGold() < cost then return false end
local charges = 1
caster:SpendGold(cost, DOTA_ModifyGold_PurchaseItem)
if mode.item == "item_moon_shard_datadriven" then
return ConsumeMoonShard(caster, charges)
end
return ConsumeTome(caster, mode, charges)
end
function gold_consumable_converter:AccumulateGold()
local caster = self:GetCaster()
if not caster or caster:IsNull() or not caster:IsAlive() then return false end
local modeIndex = GetModeIndex(self)
local mode = MODES[modeIndex]
local cost = GetItemCost(mode.item)
if not cost or cost <= 0 then return false end
if caster:GetGold() < cost then return false end
caster:SpendGold(cost, DOTA_ModifyGold_PurchaseItem)
local pending = GetPending(self)
pending[modeIndex] = (pending[modeIndex] or 0) + 1
SyncState(self)
return true
end
function gold_consumable_converter:ConsumePending()
local caster = self:GetCaster()
if not caster or caster:IsNull() or not caster:IsAlive() then return false end
local pending = GetPending(self)
local consumed = false
for modeIndex, charges in ipairs(pending) do
if charges and charges > 0 then
local mode = MODES[modeIndex]
local ok = false
if mode.item == "item_moon_shard_datadriven" then
ok = ConsumeMoonShard(caster, charges)
else
ok = ConsumeTome(caster, mode, charges)
end
if ok then
pending[modeIndex] = 0
consumed = true
end
end
end
if consumed then
caster:EmitSound("DOTA_Item.Mango.Activate")
end
SyncState(self)
return consumed
end
function modifier_gold_consumable_converter:IsHidden()
return true
end
function modifier_gold_consumable_converter:IsPurgable()
return false
end
function modifier_gold_consumable_converter:RemoveOnDeath()
return false
end
function modifier_gold_consumable_converter:OnCreated()
if not IsServer() then return end
if self:GetStackCount() < 1 then
self:SetStackCount(1)
end
local ability = self:GetAbility()
local interval = 0.5
if ability then
interval = ability:GetSpecialValueFor("interval")
if interval <= 0 then
interval = 0.5
end
end
self:StartIntervalThink(interval)
end
function modifier_gold_consumable_converter:OnIntervalThink()
if not IsServer() then return end
local ability = self:GetAbility()
if not ability or ability:IsNull() then return end
if ability.converter_enabled ~= true and not ability:GetAutoCastState() then return end
ability:AccumulateGold()
end
