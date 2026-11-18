LinkLuaModifier("modifier_special_bonus_unique_leshrac_upgrade",
"abilities/special_bonus_unique_leshrac_upgrade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_special_bonus_unique_leshrac_upgrade_debuff_immune",
"abilities/special_bonus_unique_leshrac_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_leshrac_upgrade = class({})
function special_bonus_unique_leshrac_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_leshrac_upgrade"
end
modifier_special_bonus_unique_leshrac_upgrade = class({})
function modifier_special_bonus_unique_leshrac_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_leshrac_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_leshrac_upgrade:RemoveOnDeath() return false end
function modifier_special_bonus_unique_leshrac_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED
}
end
function modifier_special_bonus_unique_leshrac_upgrade:OnAbilityExecuted(params)
if not IsServer() then return end
local caster = self:GetParent()
if params.unit ~= caster then return end
local event_ability = params.ability
if not event_ability or event_ability:IsNull() then return end
if event_ability:GetAbilityName() ~= "leshrac_greater_lightning_storm" then return end
local duration = event_ability:GetSpecialValueFor("duration")
if duration <= 0 then
duration = self:GetAbility():GetSpecialValueFor("duration")
end
caster:AddNewModifier(caster, self:GetAbility(),
"modifier_special_bonus_unique_leshrac_upgrade_debuff_immune", { duration = duration })
end
modifier_special_bonus_unique_leshrac_upgrade_debuff_immune = class({})
function modifier_special_bonus_unique_leshrac_upgrade_debuff_immune:IsHidden() return false end
function modifier_special_bonus_unique_leshrac_upgrade_debuff_immune:IsPurgable() return false end
function modifier_special_bonus_unique_leshrac_upgrade_debuff_immune:CheckState()
return {
[MODIFIER_STATE_DEBUFF_IMMUNE] = true
}
end
