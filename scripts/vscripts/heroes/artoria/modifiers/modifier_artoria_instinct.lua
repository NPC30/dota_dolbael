modifier_artoria_instinct = class({})
function modifier_artoria_instinct:IsHidden()
return true
end
function modifier_artoria_instinct:RemoveOnDeath()
return true
end
function modifier_artoria_instinct:DeclareFunctions()
return {
MODIFIER_PROPERTY_REFLECT_SPELL,
MODIFIER_PROPERTY_ABSORB_SPELL,
MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
}
end
function modifier_artoria_instinct:OnCreated(args)
self.magic_res = self:GetAbility():GetSpecialValueFor("magic_res")
self.status_res = self:GetAbility():GetSpecialValueFor("status_res")
end
function modifier_artoria_instinct:OnRefresh(args)
self.magic_res = self:GetAbility():GetSpecialValueFor("magic_res")
self.status_res = self:GetAbility():GetSpecialValueFor("status_res")
end
function modifier_artoria_instinct:GetModifierMagicalResistanceBonus()
return self.magic_res
end
function modifier_artoria_instinct:GetModifierStatusResistanceStacking()
return self.status_res
end
function modifier_artoria_instinct:GetAbsorbSpell(params)
if IsServer() then
if params.ability:GetCaster():GetTeamNumber() == self:GetParent():GetTeamNumber() then return end
if self:GetAbility():IsFullyCastable() then
self:GetAbility():UseResources(false, false, false, true)
self:PlayEffects(true)
return 1
end
end
end
modifier_artoria_instinct.reflected_spell = nil
function modifier_artoria_instinct:GetReflectSpell(params)
if IsServer() then
if params.ability:GetCaster():GetTeamNumber() == self:GetParent():GetTeamNumber() then return end
if params.ability == nil or self.reflect_exceptions[params.ability:GetAbilityName()] then
return 0
end
if self:GetAbility():IsFullyCastable() then
self.reflect = true
if self.reflected_spell ~= nil then
self:GetParent():RemoveAbilityByHandle(self.reflected_spell)
end
local sourceAbility = params.ability
local selfAbility = self:GetParent():AddAbility(sourceAbility:GetAbilityName())
selfAbility:SetLevel(sourceAbility:GetLevel())
selfAbility:SetStolen(true)
selfAbility:SetHidden(true)
self.reflected_spell = selfAbility
self:GetParent():SetCursorCastTarget(sourceAbility:GetCaster())
local castResult = selfAbility:CastAbility()
self:GetParent():SetCursorCastTarget(nil)
if castResult then
self:GetParent():GiveMana(sourceAbility:GetManaCost(-1))
end
self:PlayEffects(false)
return 1
end
end
end
function modifier_artoria_instinct:PlayEffects(bBlock)
local particle_cast = ""
local sound_cast = ""
if bBlock then
particle_cast = "particles/units/heroes/hero_antimage/antimage_spellshield.vpcf"
else
particle_cast = "particles/units/heroes/hero_antimage/antimage_spellshield_reflect.vpcf"
end
local effect_cast = ParticleManager:CreateParticle(particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
ParticleManager:SetParticleControlEnt(
effect_cast,
0,
self:GetParent(),
PATTACH_POINT_FOLLOW,
"attach_hitloc",
self:GetParent():GetOrigin(),
true
)
ParticleManager:ReleaseParticleIndex(effect_cast)
EmitSoundOn("artoria_instinct", self:GetParent())
end
modifier_artoria_instinct.reflect_exceptions = {
["rubick_spell_steal"] = true,
["shadow_shaman_shackles"] = true,
}
