spectre_desolate_curse = class({})
function spectre_desolate_curse:GetCastRange()
return FIND_UNITS_EVERYWHERE
end
function spectre_desolate_curse:OnSpellStart()
local caster = self:GetCaster()
caster:EmitSound("Hero_Spectre.Haunt")
local duration = self:GetSpecialValueFor("duration")
local desolate_ability = caster:FindAbilityByName("spectre_desolate")
local desolate_damage
if desolate_ability then
desolate_damage = desolate_ability:GetSpecialValueFor("bonus_damage")
else
desolate_damage = 25 + (caster:GetLevel() or 0) * 2
end
local total_damage = desolate_damage * 0.7
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
FIND_UNITS_EVERYWHERE,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
enemy:EmitSound("Hero_Spectre.Haunt")
enemy:AddNewModifier(caster, self, "modifier_spectre_desolate_curse", {
duration = duration,
damage = total_damage
})
end
end
LinkLuaModifier("modifier_spectre_desolate_curse", "abilities/spectre_desolate_curse", LUA_MODIFIER_MOTION_NONE)
modifier_spectre_desolate_curse = class({})
function modifier_spectre_desolate_curse:IsDebuff()
return true
end
function modifier_spectre_desolate_curse:IsHidden()
return false
end
function modifier_spectre_desolate_curse:IsPurgable()
return false
end
function modifier_spectre_desolate_curse:GetAttributes()
return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_spectre_desolate_curse:GetTexture()
return "spectre_haunt"
end
function modifier_spectre_desolate_curse:OnCreated(kv)
if IsServer() then
self.caster = self:GetCaster()
self.ability = self:GetAbility()
self.damage = kv.damage
local base_attack_time = self.caster:GetBaseAttackTime(true)
local attack_speed = self.caster:GetAttackSpeed(false)
self.attack_interval = base_attack_time / (attack_speed)
self:StartIntervalThink(self.attack_interval * 2)
end
end
function modifier_spectre_desolate_curse:OnIntervalThink()
if IsServer() then
ApplyDamage({
victim = self:GetParent(),
attacker = self.caster,
damage = self.damage,
damage_type = DAMAGE_TYPE_PURE,
ability = self.ability,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL
})
local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_spectre/spectre_desolate.vpcf",
PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
ParticleManager:ReleaseParticleIndex(particle)
self:GetParent():EmitSound("Hero_Spectre.Desolate")
end
end
function modifier_spectre_desolate_curse:DeclareFunctions()
local funcs = {
MODIFIER_PROPERTY_PROVIDES_FOW_POSITION,
}
return funcs
end
function modifier_spectre_desolate_curse:GetModifierProvidesFOWVision()
return 1
end
