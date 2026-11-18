require("libraries/popups")
item_tome_of_agility = class({})
LinkLuaModifier("modifier_agi_tome", "items/item_tome_of_agility.lua", LUA_MODIFIER_MOTION_NONE)
if IsServer() then
function item_tome_of_agility:OnSpellStart()
local caster = self:GetCaster()
local agi = self:GetSpecialValueFor("bonus")
local current_charges = self:GetCurrentCharges()
if current_charges <= 0 then
return
end
local tome_table = CustomNetTables:GetTableValue("player_tome_table", "agi_tome_" .. caster:GetUnitName())
local total_agi_bonus = agi * current_charges
caster:ModifyAgility(total_agi_bonus)
EmitSoundOnClient("Item.TomeOfKnowledge", caster)
if caster:HasModifier("modifier_agi_tome") then
local modifier = caster:FindModifierByName("modifier_agi_tome")
modifier:SetStackCount(modifier:GetStackCount() + current_charges)
local tomeValue = 0
if tome_table then
tomeValue = tome_table.agi
end
local newValue = tomeValue + total_agi_bonus
CustomNetTables:SetTableValue("player_tome_table", "agi_tome_" .. caster:GetUnitName(), { agi = newValue })
else
caster:AddNewModifier(caster, self, "modifier_agi_tome", {})
caster:FindModifierByName("modifier_agi_tome"):SetStackCount(current_charges)
CustomNetTables:SetTableValue("player_tome_table", "agi_tome_" .. caster:GetUnitName(),
{ agi = total_agi_bonus })
end
UTIL_RemoveImmediate(self)
PopupAgiTome(caster, total_agi_bonus)
end
end
modifier_agi_tome = class({})
function modifier_agi_tome:RemoveOnDeath()
return false
end
function modifier_agi_tome:AllowIllusionDuplicate()
return false
end
function modifier_agi_tome:IsPermanent()
return true
end
function modifier_agi_tome:OnCreated(kv)
if IsServer() then
local parent = self:GetParent()
if parent:IsIllusion() or parent:IsTempestDouble() then
local tome_table = CustomNetTables:GetTableValue("player_tome_table",
"agi_tome_" .. self:GetParent():GetUnitName())
local mod = parent:FindModifierByName("modifier_agi_tome")
local tomeValue = 0
if tome_table then
tomeValue = tome_table.agi
end
mod:SetStackCount(tomeValue / 50)
if parent:IsIllusion() then
parent:ModifyAgility(tomeValue)
end
end
end
end
function modifier_agi_tome:OnRefresh(kv)
if IsServer() then
local parent = self:GetParent()
if parent:IsIllusion() or parent:IsTempestDouble() then
local tome_table = CustomNetTables:GetTableValue("player_tome_table",
"agi_tome_" .. self:GetParent():GetUnitName())
local mod = parent:FindModifierByName("modifier_agi_tome")
local tomeValue = 0
if tome_table then
tomeValue = tome_table.agi
end
mod:SetStackCount(tomeValue / 50)
if parent:IsIllusion() then
parent:ModifyAgility(tomeValue)
end
end
end
end
function modifier_agi_tome:DeclareFunctions()
local funcs = {
MODIFIER_PROPERTY_TOOLTIP,
}
return funcs
end
function modifier_agi_tome:OnTooltip()
return self:GetStackCount() * 100
end
function modifier_agi_tome:GetTexture()
return "item_tome_of_agility"
end
