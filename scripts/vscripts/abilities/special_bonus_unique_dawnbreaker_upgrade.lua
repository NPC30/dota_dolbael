LinkLuaModifier("modifier_special_bonus_unique_dawnbreaker_upgrade",
"abilities/special_bonus_unique_dawnbreaker_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_dawnbreaker_upgrade = class({})
function special_bonus_unique_dawnbreaker_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_dawnbreaker_upgrade"
end
modifier_special_bonus_unique_dawnbreaker_upgrade = class({})
function modifier_special_bonus_unique_dawnbreaker_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_dawnbreaker_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_dawnbreaker_upgrade:IsDebuff() return false end
function modifier_special_bonus_unique_dawnbreaker_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_START,
}
end
function modifier_special_bonus_unique_dawnbreaker_upgrade:OnAbilityStart(keys)
if not IsServer() then return end
local parent = self:GetParent()
if keys.unit ~= parent then
return
end
local ability = keys.ability
local abilityName = ability:GetAbilityName()
if abilityName == "dawnbreaker_fire_wreath" then
local duration = self:GetAbility():GetSpecialValueFor("invulnerability_duration") or 1.2
ApplyItemDataDrivenModifier(_, parent, "modifier_item_saint_orb_passive",
{ duration = duration, block_cooldown = 0 })
end
end
