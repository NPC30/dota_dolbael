dark_seer_normal_punch2 = class({})
function dark_seer_normal_punch2:GetIntrinsicModifierName()
return "modifier_dark_seer_normal_punch2"
end
function dark_seer_normal_punch2:Precache(context)
PrecacheResource("particle", "particles/units/heroes/hero_dark_seer/dark_seer_attack_normal_punch.vpcf", context)
end
modifier_dark_seer_normal_punch2 = class({})
LinkLuaModifier("modifier_dark_seer_normal_punch2", "abilities/dark_seer_normal_punch2", LUA_MODIFIER_MOTION_NONE)
function modifier_dark_seer_normal_punch2:IsPurgable() return false end
function modifier_dark_seer_normal_punch2:IsHidden() return true end
function modifier_dark_seer_normal_punch2:DeclareFunctions()
local funcs =
{
MODIFIER_EVENT_ON_ATTACK_LANDED,
}
return funcs
end
function modifier_dark_seer_normal_punch2:OnAttackLanded(keys)
if IsServer() and keys.attacker == self:GetParent() and self:GetAbility():IsCooldownReady() then
local ability = self:GetAbility()
ability:StartCooldown(ability:GetCooldown(-1) * self:GetParent():GetCooldownReduction())
if keys.target:IsRealHero() then
local illusion = CreateIllusions(
self:GetCaster(),
keys.target,
{
outgoing_damage = 0,
incoming_damage = 0,
duration = ability:GetSpecialValueFor("illusion_duration"),
},
1,
100,
false,
true
)
end
EmitSoundOn("Hero_Dark_Seer.NormalPunch.Lv2", keys.target)
local damage = self:GetAbility():GetSpecialValueFor("max_damage") +
self:GetCaster():GetAverageTrueAttackDamage(nil) * self:GetAbility():GetSpecialValueFor("ad")
local damageInfo = {
victim = keys.target,
attacker = self:GetCaster(),
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
ability = self:GetAbility()
}
ApplyDamage(damageInfo)
local stun_duration = self:GetAbility():GetSpecialValueFor("max_stun")
keys.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_stunned", { duration = stun_duration })
local Particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_dark_seer/dark_seer_attack_normal_punch.vpcf", 0, self:GetCaster())
ParticleManager:SetParticleControl(Particle, 2, keys.target:GetOrigin())
end
end
