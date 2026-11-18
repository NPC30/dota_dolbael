LinkLuaModifier("modifier_break_speed_limit", "abilities/break_speed_limit.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_break_speed_limit_stacks", "abilities/break_speed_limit.lua", LUA_MODIFIER_MOTION_NONE)
break_speed_limit = class({})
function break_speed_limit:GetIntrinsicModifierName()
return "modifier_break_speed_limit"
end
modifier_break_speed_limit = class({})
function modifier_break_speed_limit:IsHidden() return true end
function modifier_break_speed_limit:IsPurgable() return false end
function modifier_break_speed_limit:IsPermanent() return true end
function modifier_break_speed_limit:OnCreated()
end
function modifier_break_speed_limit:DeclareFunctions()
return {
MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
MODIFIER_EVENT_ON_HERO_KILLED
}
end
function modifier_break_speed_limit:GetModifierAttackSpeedBonus_Constant()
return 100
end
function modifier_break_speed_limit:OnHeroKilled(keys)
local parent = self:GetParent()
if keys.attacker == parent and keys.unit:IsRealHero() then
local ability = self:GetAbility()
if not ability then
return
end
local current_attack_speed = parent:GetAttackSpeed(false)
local max_attack_speed = 7
if current_attack_speed < max_attack_speed then
return
end
local duration = ability:GetSpecialValueFor("duration")
local max_stacks = ability:GetSpecialValueFor("max_stacks")
local speed_per_stack = ability:GetSpecialValueFor("speed_limit_per_stack")
local current_stacks = parent:GetModifierStackCount("modifier_break_speed_limit_stacks", ability)
if current_stacks == 0 then
parent:AddNewModifier(parent, ability, "modifier_break_speed_limit_stacks", { duration = duration })
current_stacks = speed_per_stack / 50
else
current_stacks = current_stacks + speed_per_stack / 50
if current_stacks > max_stacks then
current_stacks = max_stacks
end
end
parent:SetModifierStackCount("modifier_break_speed_limit_stacks", ability, current_stacks)
end
end
modifier_break_speed_limit_stacks = class({})
function modifier_break_speed_limit_stacks:IsHidden() return false end
function modifier_break_speed_limit_stacks:IsDebuff() return false end
function modifier_break_speed_limit_stacks:IsPurgable() return false end
function modifier_break_speed_limit_stacks:OnCreated(kv)
if IsServer() then
local duration = self:GetAbility():GetSpecialValueFor("duration")
self:SetDuration(duration, true)
end
end
function modifier_break_speed_limit_stacks:DeclareFunctions()
return {
MODIFIER_PROPERTY_IGNORE_ATTACKSPEED_LIMIT,
MODIFIER_PROPERTY_ATTACKSPEED_BASE_OVERRIDE,
}
end
function modifier_break_speed_limit_stacks:GetModifierAttackSpeedBaseOverride()
return 7 + self:GetStackCount() * 0.5
end
function modifier_break_speed_limit_stacks:OnStackCountChanged(oldStacks)
if IsServer() then
local ability = self:GetAbility()
local duration = ability:GetSpecialValueFor("duration")
self:SetDuration(duration, true)
end
end
function modifier_break_speed_limit_stacks:GetModifierIgnoreAttackspeedLimit()
return 1
end
