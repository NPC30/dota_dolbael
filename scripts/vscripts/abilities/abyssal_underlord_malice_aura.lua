abyssal_underlord_malice_aura = class({})
function abyssal_underlord_malice_aura:GetIntrinsicModifierName()
return "modifier_abyssal_underlord_malice_aura"
end
modifier_abyssal_underlord_malice_aura = class({})
LinkLuaModifier("modifier_abyssal_underlord_malice_aura", "abilities/abyssal_underlord_malice_aura", LUA_MODIFIER_MOTION_NONE)
function modifier_abyssal_underlord_malice_aura:IsPurgable()return false end
function modifier_abyssal_underlord_malice_aura:IsHidden()return true end
function modifier_abyssal_underlord_malice_aura:GetAuraRadius() return self:GetAbility():GetSpecialValueFor("radius") end
function modifier_abyssal_underlord_malice_aura:IsAura() return true end
function modifier_abyssal_underlord_malice_aura:GetModifierAura() return "modifier_abyssal_underlord_malice_aura_buff" end
function modifier_abyssal_underlord_malice_aura:GetAuraSearchTeam() return DOTA_UNIT_TARGET_TEAM_ENEMY end
function modifier_abyssal_underlord_malice_aura:GetAuraSearchType() return DOTA_UNIT_TARGET_BASIC+1 end
function modifier_abyssal_underlord_malice_aura:GetAuraSearchFlags() return 48 end
modifier_abyssal_underlord_malice_aura_buff = class({})
LinkLuaModifier("modifier_abyssal_underlord_malice_aura_buff", "abilities/abyssal_underlord_malice_aura", LUA_MODIFIER_MOTION_NONE)
function modifier_abyssal_underlord_malice_aura_buff:GetEffectName()
return "particles/units/heroes/hero_omniknight/omniknight_degen_aura_debuff.vpcf"
end
function modifier_abyssal_underlord_malice_aura_buff:OnCreated(keys)
if not IsServer() then return end
self:StartIntervalThink(4)
end
function modifier_abyssal_underlord_malice_aura_buff:OnIntervalThink()
self:GetParent():AddNewModifier(self:GetAbility():GetCaster(),self:GetAbility(),"modifier_abyssal_underlord_malice_aura_root",{duration=self:GetAbility():GetSpecialValueFor("duration")})
local damageInfo ={victim = self:GetParent(),attacker = self:GetAbility():GetCaster(),damage = self:GetAbility():GetSpecialValueFor("damage"),damage_type = DAMAGE_TYPE_MAGICAL,ability = self:GetAbility()}
ApplyDamage( damageInfo )
end
modifier_abyssal_underlord_malice_aura_root = class({})
LinkLuaModifier("modifier_abyssal_underlord_malice_aura_root", "abilities/abyssal_underlord_malice_aura", LUA_MODIFIER_MOTION_NONE)
function modifier_abyssal_underlord_malice_aura_root:CheckState()
local state = {
[MODIFIER_STATE_ROOTED] = true,
}
return state
end
function modifier_abyssal_underlord_malice_aura_root:OnCreated(keys)
if not IsServer() then return end
EmitSoundOn( "Hero_AbyssalUnderlord.Pit.TargetHero", self:GetParent() )
end
function modifier_abyssal_underlord_malice_aura_root:GetEffectName()
return "particles/units/heroes/heroes_underlord/abyssal_underlord_pitofmalice_stun.vpcf"
end
