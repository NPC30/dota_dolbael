LinkLuaModifier( "modifier_goku_super_saiyan", "heroes/hero_goku/goku_super_saiyan", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_goku_super_saiyan_passive", "heroes/hero_goku/goku_super_saiyan", LUA_MODIFIER_MOTION_NONE )
goku_super_saiyan = goku_super_saiyan or class({})
modifier_goku_super_saiyan = modifier_goku_super_saiyan or class({})
modifier_goku_super_saiyan_passive = modifier_goku_super_saiyan_passive or class({})
function goku_super_saiyan:GetIntrinsicModifierName()
return "modifier_goku_super_saiyan_passive"
end
function goku_super_saiyan:OnSpellStart()
local caster = self:GetCaster()
local duration = self:GetSpecialValueFor("duration")
caster:AddNewModifier(
caster,
self,
"modifier_goku_super_saiyan",
{ duration = duration }
)
local particle = ParticleManager:CreateParticle("particles/custom/goku/goku_super_saiyan.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
ParticleManager:SetParticleControl(particle,60,Vector(255,255,0))
ParticleManager:SetParticleControl(particle,61,Vector(255,255,255))
ParticleManager:DestroyParticle(particle,false)
ParticleManager:ReleaseParticleIndex(particle)
caster:EmitSound("goku.3")
end
function modifier_goku_super_saiyan_passive:DeclareFunctions()
if not self:GetParent():PassivesDisabled() then
local funcs =
{
MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
MODIFIER_PROPERTY_STATS_INTELLECT_BONUS
}
return funcs
end
end
function modifier_goku_super_saiyan_passive:GetModifierBonusStats_Strength()
return self:GetAbility():GetSpecialValueFor("bonus_attribute")
end
function modifier_goku_super_saiyan_passive:GetModifierBonusStats_Agility()
return self:GetAbility():GetSpecialValueFor("bonus_attribute")
end
function modifier_goku_super_saiyan_passive:GetModifierBonusStats_Intellect()
return self:GetAbility():GetSpecialValueFor("bonus_attribute")
end
function modifier_goku_super_saiyan:IsPurgable() return false end
function modifier_goku_super_saiyan:IsPurgeException() return false end
function modifier_goku_super_saiyan:OnCreated(keys)
local ability = self:GetAbility()
self.status_resistance = ability:GetSpecialValueFor("bonus_status_resistance")
self.regen = ability:GetSpecialValueFor("regen")
end
function modifier_goku_super_saiyan:OnRefresh(keys)
self:OnCreated(keys)
end
function modifier_goku_super_saiyan:DeclareFunctions()
local funcs =
{
MODIFIER_PROPERTY_MODEL_CHANGE,
MODIFIER_PROPERTY_STATUS_RESISTANCE,
MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE,
MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE
}
return funcs
end
function modifier_goku_super_saiyan:GetModifierModelChange()
return "models/heroes/goku/npc_dota_hero_goku_super_saiyan.vmdl"
end
function modifier_goku_super_saiyan:GetModifierStatusResistance()
return self.status_resistance
end
function modifier_goku_super_saiyan:GetModifierTotalPercentageManaRegen()
return self.regen
end
function modifier_goku_super_saiyan:GetModifierHealthRegenPercentage()
return self.regen
end
function modifier_goku_super_saiyan:GetEffectName()
return "particles/units/heroes/hero_leshrac/leshrac_pulse_nova_ambient.vpcf"
end
