require("libraries/popups")
item_tome_of_intelligence = class({})
LinkLuaModifier("modifier_int_tome", "items/item_tome_of_intelligence.lua", LUA_MODIFIER_MOTION_NONE)
if IsServer() then
local function updateBotIntellectCapAfterTome(caster)
local ok, botCap = pcall(require, "modules.helper.bot-intellect-cap")
if ok and botCap and botCap.BotIntellectCap then
botCap.BotIntellectCap:Update(caster)
end
end
function item_tome_of_intelligence:OnSpellStart()
local caster = self:GetCaster()
local int = self:GetSpecialValueFor("bonus")
local current_charges = self:GetCurrentCharges()
if current_charges <= 0 then
return
end
local tome_table = CustomNetTables:GetTableValue("player_tome_table", "int_tome_" .. caster:GetUnitName())
local total_int_bonus = int * current_charges
caster:ModifyIntellect(total_int_bonus)
EmitSoundOnClient("Item.TomeOfKnowledge", caster)
if caster:HasModifier("modifier_int_tome") then
local modifier = caster:FindModifierByName("modifier_int_tome")
modifier:SetStackCount(modifier:GetStackCount() + current_charges)
local tomeValue = 0
if tome_table then
tomeValue = tome_table.int
end
local newValue = tomeValue + total_int_bonus
CustomNetTables:SetTableValue("player_tome_table", "int_tome_" .. caster:GetUnitName(), { int = newValue })
else
caster:AddNewModifier(caster, self, "modifier_int_tome", {})
caster:FindModifierByName("modifier_int_tome"):SetStackCount(current_charges)
CustomNetTables:SetTableValue("player_tome_table", "int_tome_" .. caster:GetUnitName(),
{ int = total_int_bonus })
end
updateBotIntellectCapAfterTome(caster)
UTIL_RemoveImmediate(self)
PopupIntTome(caster, total_int_bonus)
end
end
modifier_int_tome = class({})
function modifier_int_tome:RemoveOnDeath()
return false
end
function modifier_int_tome:AllowIllusionDuplicate()
return false
end
function modifier_int_tome:IsPermanent()
return true
end
function modifier_int_tome:OnCreated(kv)
if IsServer() then
local parent = self:GetParent()
if parent:IsIllusion() or parent:IsTempestDouble() then
local tome_table = CustomNetTables:GetTableValue("player_tome_table",
"int_tome_" .. self:GetParent():GetUnitName())
local mod = parent:FindModifierByName("modifier_int_tome")
local tomeValue = 0
if tome_table then
tomeValue = tome_table.int
end
mod:SetStackCount(tomeValue / 50)
if parent:IsIllusion() then
parent:ModifyIntellect(tomeValue)
end
end
end
end
function modifier_int_tome:OnRefresh(kv)
if IsServer() then
local parent = self:GetParent()
if parent:IsIllusion() or parent:IsTempestDouble() then
local tome_table = CustomNetTables:GetTableValue("player_tome_table",
"int_tome_" .. self:GetParent():GetUnitName())
local mod = parent:FindModifierByName("modifier_int_tome")
local tomeValue = 0
if tome_table then
tomeValue = tome_table.int
end
mod:SetStackCount(tomeValue / 50)
if parent:IsIllusion() then
parent:ModifyIntellect(tomeValue)
end
end
end
end
function modifier_int_tome:DeclareFunctions()
local funcs = {
MODIFIER_PROPERTY_TOOLTIP,
}
return funcs
end
function modifier_int_tome:OnTooltip()
return self:GetStackCount() * 100
end
function modifier_int_tome:GetTexture()
return "item_tome_of_intelligence"
end
