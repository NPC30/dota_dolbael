dark_seer_normal_punch3 = class({})
function dark_seer_normal_punch3:GetIntrinsicModifierName()
return "modifier_dark_seer_normal_punch3"
end
function dark_seer_normal_punch3:Precache(context)
PrecacheResource("particle", "particles/units/heroes/hero_dark_seer/dark_seer_attack_normal_punch.vpcf", context)
end
modifier_dark_seer_normal_punch3 = class({})
LinkLuaModifier("modifier_dark_seer_normal_punch3", "abilities/dark_seer_normal_punch3", LUA_MODIFIER_MOTION_NONE)
function modifier_dark_seer_normal_punch3:IsPurgable() return false end
function modifier_dark_seer_normal_punch3:IsHidden() return true end
function modifier_dark_seer_normal_punch3:DeclareFunctions()
local funcs =
{
MODIFIER_EVENT_ON_ATTACK_LANDED,
}
return funcs
end
function modifier_dark_seer_normal_punch3:OnAttackLanded(keys)
if IsServer() and keys.attacker == self:GetParent() and self:GetAbility():IsCooldownReady() then
local ability = self:GetAbility()
local cooldown = ability:GetSpecialValueFor("AbilityCooldown")
if cooldown <= 0 then
cooldown = ability:GetCooldown(ability:GetLevel() - 1)
end
ability:StartCooldown(cooldown * self:GetParent():GetCooldownReduction())
EmitSoundOn("Hero_Dark_Seer.NormalPunch.Lv2", keys.target)
local strength_damage = self:GetCaster():GetStrength() * self:GetAbility():GetSpecialValueFor("ad")
local damageInfo = {
victim = keys.target,
attacker = self:GetCaster(),
damage = strength_damage,
damage_type = DAMAGE_TYPE_PURE,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
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
