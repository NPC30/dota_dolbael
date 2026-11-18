item_tome_of_luoshu = class({})
LinkLuaModifier("modifier_luoshu_tome", "items/item_tome_of_luoshu.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_str_tome", "items/item_tome_of_strength.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_agi_tome", "items/item_tome_of_agility.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_int_tome", "items/item_tome_of_intelligence.lua", LUA_MODIFIER_MOTION_NONE)
if IsServer() then
function item_tome_of_luoshu:OnSpellStart()
local caster = self:GetCaster()
local bonus_all_stats = self:GetSpecialValueFor("bonus_all_stats")
if caster:HasModifier("modifier_luoshu_tome") then
local str_table = CustomNetTables:GetTableValue("player_tome_table", "str_tome_" .. caster:GetUnitName())
local total_str_bonus = bonus_all_stats
caster:ModifyStrength(total_str_bonus)
if caster:HasModifier("modifier_str_tome") then
local modifier = caster:FindModifierByName("modifier_str_tome")
modifier:SetStackCount(modifier:GetStackCount() + 1)
local tomeValue = 0
if str_table then
tomeValue = str_table.str
end
local newValue = tomeValue + total_str_bonus
CustomNetTables:SetTableValue("player_tome_table", "str_tome_" .. caster:GetUnitName(),
{ str = newValue })
else
caster:AddNewModifier(caster, self, "modifier_str_tome", {})
caster:FindModifierByName("modifier_str_tome"):SetStackCount(1)
CustomNetTables:SetTableValue("player_tome_table", "str_tome_" .. caster:GetUnitName(),
{ str = total_str_bonus })
end
local agi_table = CustomNetTables:GetTableValue("player_tome_table", "agi_tome_" .. caster:GetUnitName())
local total_agi_bonus = bonus_all_stats
caster:ModifyAgility(total_agi_bonus)
if caster:HasModifier("modifier_agi_tome") then
local modifier = caster:FindModifierByName("modifier_agi_tome")
modifier:SetStackCount(modifier:GetStackCount() + 1)
local tomeValue = 0
if agi_table then
tomeValue = agi_table.agi
end
local newValue = tomeValue + total_agi_bonus
CustomNetTables:SetTableValue("player_tome_table", "agi_tome_" .. caster:GetUnitName(),
{ agi = newValue })
else
caster:AddNewModifier(caster, self, "modifier_agi_tome", {})
caster:FindModifierByName("modifier_agi_tome"):SetStackCount(1)
CustomNetTables:SetTableValue("player_tome_table", "agi_tome_" .. caster:GetUnitName(),
{ agi = total_agi_bonus })
end
local int_table = CustomNetTables:GetTableValue("player_tome_table", "int_tome_" .. caster:GetUnitName())
local total_int_bonus = bonus_all_stats
caster:ModifyIntellect(total_int_bonus)
if caster:HasModifier("modifier_int_tome") then
local modifier = caster:FindModifierByName("modifier_int_tome")
modifier:SetStackCount(modifier:GetStackCount() + 1)
local tomeValue = 0
if int_table then
tomeValue = int_table.int
end
local newValue = tomeValue + total_int_bonus
CustomNetTables:SetTableValue("player_tome_table", "int_tome_" .. caster:GetUnitName(),
{ int = newValue })
else
caster:AddNewModifier(caster, self, "modifier_int_tome", {})
caster:FindModifierByName("modifier_int_tome"):SetStackCount(1)
CustomNetTables:SetTableValue("player_tome_table", "int_tome_" .. caster:GetUnitName(),
{ int = total_int_bonus })
end
else
caster:ModifyIntellect(bonus_all_stats)
caster:ModifyAgility(bonus_all_stats)
caster:ModifyStrength(bonus_all_stats)
caster:AddNewModifier(caster, self, "modifier_luoshu_tome", {})
ApplyItemDataDrivenModifier(_, caster, "modifier_item_tome_of_luoshu_stats", {})
EmitSoundOnClient("Item.TomeOfKnowledge", caster)
end
self:SpendCharge(1)
end
end
if modifier_luoshu_tome == nil then modifier_luoshu_tome = class({}) end
function modifier_luoshu_tome:RemoveOnDeath() return false end
function modifier_luoshu_tome:IsPermanent() return true end
function modifier_luoshu_tome:OnCreated()
if self:GetAbility() then
self.status_resistance = self:GetAbility():GetSpecialValueFor("status_resistance")
self.bonus_cast_range = self:GetAbility():GetSpecialValueFor("bonus_cast_range")
end
end
function modifier_luoshu_tome:DeclareFunctions()
return {
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
MODIFIER_PROPERTY_CAST_RANGE_BONUS_STACKING,
}
end
function modifier_luoshu_tome:GetModifierStatusResistanceStacking()
return self.status_resistance
end
function modifier_luoshu_tome:GetModifierCastRangeBonusStacking()
return self.bonus_cast_range
end
function modifier_luoshu_tome:GetTexture()
return "item_tome_of_luoshu"
end
