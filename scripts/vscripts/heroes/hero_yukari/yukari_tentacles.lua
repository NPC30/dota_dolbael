yukari_tentacles = class({})
LinkLuaModifier("modifier_yukari_tentacles", "heroes/hero_yukari/yukari_tentacles", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_yukari_umb", "heroes/hero_yukari/yukari_tp", LUA_MODIFIER_MOTION_NONE)
function yukari_tentacles:GetAOERadius()
return self:GetSpecialValueFor("radius")
end
function yukari_tentacles:OnUpgrade()
local ability = self:GetCaster():FindAbilityByName("ability_thdots_yukari04")
if ability and ability:GetLevel() < self:GetLevel() then
ability:SetLevel(self:GetLevel())
end
end
function yukari_tentacles:GetIntrinsicModifierName()
return "modifier_yukari_umb"
end
function yukari_tentacles:OnSpellStart()
local caster = self:GetCaster()
local point = self:GetCursorPosition()
local duration = self:GetSpecialValueFor("duration")
CreateModifierThinker(
caster,
self,
"modifier_yukari_tentacles",
{ duration = duration },
point,
caster:GetTeamNumber(),
false
)
end
modifier_yukari_tentacles = class({})
function modifier_yukari_tentacles:IsHidden()
return false
end
function modifier_yukari_tentacles:IsDebuff()
return true
end
function modifier_yukari_tentacles:IsStunDebuff()
return false
end
function modifier_yukari_tentacles:IsPurgable()
return false
end
function modifier_yukari_tentacles:OnCreated(kv)
local interval = self:GetAbility():GetSpecialValueFor("tick_rate")
local caster = self:GetCaster()
local damage = (self:GetAbility():GetSpecialValueFor("damage_per_second") + caster:GetIntellect(false) * self:GetAbility():GetSpecialValueFor("intelligence_per_second")) *
interval
local caster = self:GetCaster()
self.slowdown = self:GetAbility():GetSpecialValueFor("root")
self.radius = self:GetAbility():GetSpecialValueFor("radius")
self.thinker = kv.isProvidedByAura ~= 1
if not IsServer() then return end
if not self.thinker then return end
self.damageTable = {
victim = target,
attacker = self:GetCaster(),
damage = damage,
damage_type = self:GetAbility():GetAbilityDamageType(),
ability = self:GetAbility(),
}
self:StartIntervalThink(interval)
self.sound_cast = "yukari.tentacles"
self:PlayEffects()
end
function modifier_yukari_tentacles:OnRefresh(kv)
end
function modifier_yukari_tentacles:OnRemoved()
end
function modifier_yukari_tentacles:OnDestroy()
if not IsServer() then return end
if not self.thinker then return end
UTIL_Remove(self:GetParent())
end
function modifier_yukari_tentacles:CheckState()
local state = {
[MODIFIER_STATE_INVISIBLE] = false,
}
return state
end
function modifier_yukari_tentacles:DeclareFunctions()
local func = {
MODIFIER_PROPERTY_FIXED_DAY_VISION,
MODIFIER_PROPERTY_FIXED_NIGHT_VISION,
MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
}
return func
end
function modifier_yukari_tentacles:GetModifierMoveSpeedBonus_Percentage()
return self.slowdown
end
function modifier_yukari_tentacles:GetFixedNightVision()
return 600
end
function modifier_yukari_tentacles:GetFixedDayVision()
return 600
end
function modifier_yukari_tentacles:OnIntervalThink()
local enemies = FindUnitsInRadius(
self:GetCaster():GetTeamNumber(),
self:GetParent():GetOrigin(),
nil,
self.radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
0,
0,
false
)
for _, enemy in pairs(enemies) do
self.damageTable.victim = enemy
ApplyDamage(self.damageTable)
EmitSoundOn(self.sound_cast, enemy)
end
end
function modifier_yukari_tentacles:IsAura()
return self.thinker
end
function modifier_yukari_tentacles:GetModifierAura()
return "modifier_yukari_tentacles"
end
function modifier_yukari_tentacles:GetAuraRadius()
return self.radius
end
function modifier_yukari_tentacles:GetAuraDuration()
return 0.5
end
function modifier_yukari_tentacles:GetAuraSearchTeam()
return DOTA_UNIT_TARGET_TEAM_ENEMY
end
function modifier_yukari_tentacles:GetAuraSearchType()
return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end
function modifier_yukari_tentacles:GetAuraSearchFlags()
return 0
end
function modifier_yukari_tentacles:GetEffectName()
return ""
end
function modifier_yukari_tentacles:GetEffectAttachType()
return PATTACH_ABSORIGIN_FOLLOW
end
function modifier_yukari_tentacles:PlayEffects()
local particle_cast = "particles/yukari_tentacles_base.vpcf"
local sound_cast = "yukari.tentacles_cast"
local effect_cast = ParticleManager:CreateParticle(particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
ParticleManager:SetParticleControl(effect_cast, 0, self:GetParent():GetOrigin())
ParticleManager:SetParticleControl(effect_cast, 1, Vector(self.radius, 1, 1))
self:AddParticle(
effect_cast,
false,
false,
-1,
false,
false
)
EmitSoundOn(sound_cast, self:GetParent())
end
