LinkLuaModifier("modifier_item_shadow_judgment", "items/item_shadow_judgment", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_shadow_judgment_silence", "items/item_shadow_judgment", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_shadow_judgment_mute", "items/item_shadow_judgment", LUA_MODIFIER_MOTION_NONE)
local PlayerProperty = require("libraries/player_property")
item_shadow_judgment = class({})
function item_shadow_judgment:GetIntrinsicModifierName()
return "modifier_item_shadow_judgment"
end
function item_shadow_judgment:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
local target = self:GetCursorTarget()
if not target or target:IsNull() then return end
if target:TriggerSpellAbsorb(self) then return end
EmitSoundOn("Hero_Nevermore.Requiem", target)
self:ApplyAbyssalEffect(target)
if not target:IsMagicImmune() then
self:ApplyBlueFantasyEffect(target)
end
if not target:IsMagicImmune() then
self:ApplyBloodthornEffect(target)
end
end
function item_shadow_judgment:ApplyAbyssalEffect(target)
if not IsServer() then return end
local caster = self:GetCaster()
local stun_duration = self:GetSpecialValueFor("stun_duration") * (1 - target:GetStatusResistance())
local active_damage_base = self:GetSpecialValueFor("active_damage_base")
local active_damage_multi = self:GetSpecialValueFor("active_damage_multi")
local primary_stat = 0
if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_STRENGTH then
primary_stat = caster:GetStrength()
elseif caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_AGILITY then
primary_stat = caster:GetAgility()
elseif caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_INTELLECT then
primary_stat = caster:GetIntellect(false)
end
local damage = active_damage_base + primary_stat * active_damage_multi
FindClearSpaceForUnit(caster, target:GetAbsOrigin() - caster:GetForwardVector() * 56, false)
target:AddNewModifier(caster, self, "modifier_stunned", { duration = stun_duration })
PlayerProperty.ApplyPureDamageWithReduction({
victim = target,
attacker = caster,
damage = damage,
damage_type = DAMAGE_TYPE_PURE,
ability = self
})
EmitSoundOn("DOTA_Item.AbyssalBlade.Activate", target)
end
function item_shadow_judgment:ApplyBlueFantasyEffect(target)
if not IsServer() then return end
local caster = self:GetCaster()
target:Purge(true, false, false, false, false)
local duration = self:GetSpecialValueFor("mute_duration") * (1 - target:GetStatusResistance())
target:AddNewModifier(caster, self, "modifier_shadow_judgment_mute", { duration = duration })
EmitSoundOn("DOTA_Item.Nullifier.Target", target)
end
function item_shadow_judgment:ApplyBloodthornEffect(target)
if not IsServer() then return end
local caster = self:GetCaster()
local duration = self:GetSpecialValueFor("silence_duration") * (1 - target:GetStatusResistance())
target:AddNewModifier(caster, self, "modifier_shadow_judgment_silence", { duration = duration })
EmitSoundOn("DOTA_Item.Bloodthorn.Activate", target)
end
modifier_item_shadow_judgment = class({})
function modifier_item_shadow_judgment:IsHidden() return true end
function modifier_item_shadow_judgment:IsPurgable() return false end
function modifier_item_shadow_judgment:RemoveOnDeath() return false end
function modifier_item_shadow_judgment:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_shadow_judgment:OnCreated()
self:OnRefresh()
end
function modifier_item_shadow_judgment:OnRefresh()
self.stats_modifier_name = "modifier_item_shadow_judgment_stats"
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_shadow_judgment:OnDestroy()
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
modifier_shadow_judgment_mute = class({})
function modifier_shadow_judgment_mute:IsHidden() return false end
function modifier_shadow_judgment_mute:IsDebuff() return true end
function modifier_shadow_judgment_mute:IsPurgable() return false end
function modifier_shadow_judgment_mute:IsPurgeException() return false end
function modifier_shadow_judgment_mute:GetTexture()
return "item_blue_fantasy"
end
function modifier_shadow_judgment_mute:GetEffectAttachType()
return PATTACH_OVERHEAD_FOLLOW
end
function modifier_shadow_judgment_mute:GetEffectName()
return "particles/items4_fx/nullifier_mute.vpcf"
end
function modifier_shadow_judgment_mute:GetStatusEffectName()
return "particles/status_fx/status_effect_nullifier.vpcf"
end
function modifier_shadow_judgment_mute:GetPriority()
return 20
end
function modifier_shadow_judgment_mute:OnCreated()
self.slow_pct = self:GetAbility():GetSpecialValueFor("slow_pct")
self.attack_slow = self:GetAbility():GetSpecialValueFor("attack_slow")
self.max_hp_dmg_pct = self:GetAbility():GetSpecialValueFor("max_hp_dmg_pct") * 0.01
self.hp_regen_reduction = self:GetAbility():GetSpecialValueFor("hp_regen_reduction")
if not IsServer() then return end
self.damageTable = {
attacker = self:GetCaster(),
victim = self:GetParent(),
damage_type = DAMAGE_TYPE_PURE,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION,
ability = self:GetAbility(),
}
self:GetParent():EmitSound("DOTA_Item.Nullifier.Slow")
local FX = ParticleManager:CreateParticle("particles/items4_fx/nullifier_mute_debuff.vpcf", PATTACH_ROOTBONE_FOLLOW,
self:GetParent())
self:AddParticle(FX, false, false, -1, false, false)
self:StartIntervalThink(1)
end
function modifier_shadow_judgment_mute:OnIntervalThink()
if not IsServer() then return end
self:GetParent():Purge(true, false, false, false, false)
self.damageTable.damage = self:GetParent():GetMaxHealth() * self.max_hp_dmg_pct
PlayerProperty.ApplyPureDamageWithReduction(self.damageTable)
end
function modifier_shadow_judgment_mute:CheckState()
return {
[MODIFIER_STATE_MUTED] = true,
[MODIFIER_STATE_PASSIVES_DISABLED] = true,
[MODIFIER_STATE_EVADE_DISABLED] = true
}
end
function modifier_shadow_judgment_mute:DeclareFunctions()
return {
MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET,
MODIFIER_PROPERTY_HP_REGEN_AMPLIFY_PERCENTAGE,
MODIFIER_PROPERTY_LIFESTEAL_AMPLIFY_PERCENTAGE,
MODIFIER_PROPERTY_SPELL_LIFESTEAL_AMPLIFY_PERCENTAGE
}
end
function modifier_shadow_judgment_mute:GetModifierMoveSpeedBonus_Percentage()
return self.slow_pct
end
function modifier_shadow_judgment_mute:GetModifierAttackSpeedBonus_Constant()
return self.attack_slow
end
function modifier_shadow_judgment_mute:GetModifierHealAmplify_PercentageTarget()
return self.hp_regen_reduction
end
function modifier_shadow_judgment_mute:GetModifierHPRegenAmplify_Percentage()
return self.hp_regen_reduction
end
function modifier_shadow_judgment_mute:GetModifierLifestealRegenAmplify_Percentage()
return self.hp_regen_reduction
end
function modifier_shadow_judgment_mute:GetModifierSpellLifestealRegenAmplify_Percentage()
return self.hp_regen_reduction
end
modifier_shadow_judgment_silence = class({})
function modifier_shadow_judgment_silence:IsHidden() return false end
function modifier_shadow_judgment_silence:IsDebuff() return true end
function modifier_shadow_judgment_silence:IsPurgable() return true end
function modifier_shadow_judgment_silence:GetTexture()
return "item_bloodthorn"
end
function modifier_shadow_judgment_silence:OnCreated()
if not IsServer() then return end
self.damage_record = 0
if self:GetAbility() then
self.silence_damage_percent = self:GetAbility():GetSpecialValueFor("silence_damage_percent")
else
self.silence_damage_percent = 30
end
end
function modifier_shadow_judgment_silence:OnDestroy()
if not IsServer() then return end
local ability = self:GetAbility()
if not ability then return end
local bonus_damage = self.damage_record * self.silence_damage_percent / 100
ApplyDamage({
victim = self:GetParent(),
attacker = self:GetCaster(),
damage = bonus_damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = ability
})
local particle = ParticleManager:CreateParticle(
"particles/items4_fx/bloodthorn_pop.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
self:GetParent()
)
ParticleManager:ReleaseParticleIndex(particle)
EmitSoundOn("DOTA_Item.Bloodthorn.Target.Pop", self:GetParent())
end
function modifier_shadow_judgment_silence:CheckState()
return {
[MODIFIER_STATE_SILENCED] = true,
}
end
function modifier_shadow_judgment_silence:DeclareFunctions()
return {
MODIFIER_EVENT_ON_TAKEDAMAGE,
}
end
function modifier_shadow_judgment_silence:OnTakeDamage(params)
if not IsServer() then return end
if params.damage < 10 then return end
if params.unit ~= self:GetParent() then return end
if params.damage > 0 then
self.damage_record = self.damage_record + params.damage
end
end
