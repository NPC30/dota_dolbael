ancient_apparition_freezing_aura = class({})
function ancient_apparition_freezing_aura:GetIntrinsicModifierName()
return "modifier_ancient_apparition_freezing_aura"
end
function ancient_apparition_freezing_aura:OnSpellStart()
self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ancient_apparition_freezing_damage_aura",
{ duration = 8 })
end
modifier_ancient_apparition_freezing_damage_aura = class({})
LinkLuaModifier("modifier_ancient_apparition_freezing_damage_aura", "abilities/ancient_apparition_freezing_aura",
LUA_MODIFIER_MOTION_NONE)
function modifier_ancient_apparition_freezing_damage_aura:IsPurgable() return false end
function modifier_ancient_apparition_freezing_damage_aura:IsHidden() return true end
function modifier_ancient_apparition_freezing_damage_aura:GetEffectName()
return "particles/econ/items/crystal_maiden/crystal_maiden_maiden_of_icewrack/maiden_freezing_field_snow_arcana1.vpcf"
end
function modifier_ancient_apparition_freezing_damage_aura:OnCreated(keys)
if not IsServer() then return end
EmitSoundOn("Hero_Lich.ChainFrostLoop", self:GetCaster())
end
function modifier_ancient_apparition_freezing_damage_aura:OnDestroy(keys)
if not IsServer() then return end
self:GetCaster():StopSound("Hero_Lich.ChainFrostLoop")
end
function modifier_ancient_apparition_freezing_damage_aura:GetAuraDuration() return 0 end
function modifier_ancient_apparition_freezing_damage_aura:GetAuraRadius() return 800 end
function modifier_ancient_apparition_freezing_damage_aura:IsAura() return true end
function modifier_ancient_apparition_freezing_damage_aura:GetModifierAura() return
"modifier_ancient_apparition_freezing_damage" end
function modifier_ancient_apparition_freezing_damage_aura:GetAuraSearchTeam() return DOTA_UNIT_TARGET_TEAM_ENEMY end
function modifier_ancient_apparition_freezing_damage_aura:GetAuraSearchType() return DOTA_UNIT_TARGET_BASIC + 1 end
function modifier_ancient_apparition_freezing_damage_aura:GetAuraSearchFlags() return 48 end
modifier_ancient_apparition_freezing_damage = class({})
LinkLuaModifier("modifier_ancient_apparition_freezing_damage", "abilities/ancient_apparition_freezing_aura",
LUA_MODIFIER_MOTION_NONE)
function modifier_ancient_apparition_freezing_damage:IsPurgable() return false end
function modifier_ancient_apparition_freezing_damage:DeclareFunctions()
local funcs =
{
MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
}
return funcs
end
function modifier_ancient_apparition_freezing_damage:OnCreated(keys)
self:OnIntervalThink()
self:StartIntervalThink(1)
end
function modifier_ancient_apparition_freezing_damage:OnIntervalThink()
self.percentage = 1 - math.max((CalcDistanceBetweenEntityOBB(self:GetParent(), self:GetCaster()) - 100), 0) / 800
if not IsServer() then return end
local damage = self:GetAbility():GetSpecialValueFor("damage") +
self:GetCaster():GetAverageTrueAttackDamage(nil) * self:GetAbility():GetSpecialValueFor("ad")
local damageInfo = { victim = self:GetParent(), attacker = self:GetCaster(), damage = damage * self.percentage, damage_type =
DAMAGE_TYPE_MAGICAL, ability = self:GetAbility() }
ApplyDamage(damageInfo)
end
function modifier_ancient_apparition_freezing_damage:GetModifierMoveSpeedBonus_Percentage()
return -50 * (1 - math.max((CalcDistanceBetweenEntityOBB(self:GetParent(), self:GetCaster()) - 100), 0) / 800)
end
modifier_ancient_apparition_freezing_aura = class({})
LinkLuaModifier("modifier_ancient_apparition_freezing_aura", "abilities/ancient_apparition_freezing_aura",
LUA_MODIFIER_MOTION_NONE)
function modifier_ancient_apparition_freezing_aura:IsHidden() return true end
function modifier_ancient_apparition_freezing_aura:IsPurgable() return false end
function modifier_ancient_apparition_freezing_aura:GetAuraRadius() return 1200 end
function modifier_ancient_apparition_freezing_aura:IsAura() return true end
function modifier_ancient_apparition_freezing_aura:GetModifierAura() return "modifier_ancient_apparition_freezing_aura2" end
function modifier_ancient_apparition_freezing_aura:GetAuraSearchTeam() return DOTA_UNIT_TARGET_TEAM_ENEMY end
function modifier_ancient_apparition_freezing_aura:GetAuraSearchType() return DOTA_UNIT_TARGET_BASIC + 1 end
function modifier_ancient_apparition_freezing_aura:GetAuraSearchFlags() return 48 end
modifier_ancient_apparition_freezing_aura2 = class({})
LinkLuaModifier("modifier_ancient_apparition_freezing_aura2", "abilities/ancient_apparition_freezing_aura",
LUA_MODIFIER_MOTION_NONE)
function modifier_ancient_apparition_freezing_aura2:DeclareFunctions()
local funcs =
{
MODIFIER_PROPERTY_HP_REGEN_AMPLIFY_PERCENTAGE,
MODIFIER_PROPERTY_LIFESTEAL_AMPLIFY_PERCENTAGE,
MODIFIER_PROPERTY_SPELL_LIFESTEAL_AMPLIFY_PERCENTAGE,
MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET,
MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
}
return funcs
end
function modifier_ancient_apparition_freezing_aura2:OnCreated(keys)
self.percentage = self:GetAbility():GetSpecialValueFor("percentage")
end
function modifier_ancient_apparition_freezing_aura2:IsHidden() return false end
function modifier_ancient_apparition_freezing_aura2:IsPurgable() return false end
function modifier_ancient_apparition_freezing_aura2:GetModifierHPRegenAmplify_Percentage(keys) return -self.percentage end
function modifier_ancient_apparition_freezing_aura2:GetModifierLifestealRegenAmplify_Percentage(keys) return -self
.percentage end
function modifier_ancient_apparition_freezing_aura2:GetModifierSpellLifestealRegenAmplify_Percentage(keys) return -self
.percentage end
function modifier_ancient_apparition_freezing_aura2:GetModifierHealAmplify_PercentageTarget(keys) return -self
.percentage end
function modifier_ancient_apparition_freezing_aura2:GetModifierConstantHealthRegen(keys)
return -self:GetAbility():GetSpecialValueFor("hp_regen")
end
