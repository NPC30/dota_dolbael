centaur_sturdy = class( {} )
function centaur_sturdy:GetIntrinsicModifierName()
return "modifier_centaur_sturdy"
end
modifier_centaur_sturdy = class({})
LinkLuaModifier("modifier_centaur_sturdy", "abilities/centaur_sturdy", LUA_MODIFIER_MOTION_NONE)
function modifier_centaur_sturdy:DeclareFunctions()
local funcs =
{
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
MODIFIER_PROPERTY_STATS_STRENGTH_BONUS
}
return funcs
end
function modifier_centaur_sturdy:IsHidden()return true end
function modifier_centaur_sturdy:IsPurgable() return false end
function modifier_centaur_sturdy:GetModifierStatusResistanceStacking() return self:GetAbility():GetSpecialValueFor("status") end
function modifier_centaur_sturdy:GetModifierBonusStats_Strength() return self:GetAbility():GetSpecialValueFor("strength")end
