LinkLuaModifier("modifier_item_dracula_mask", "items/item_dracula_mask", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_dracula_mask_active", "items/item_dracula_mask", LUA_MODIFIER_MOTION_NONE)
item_dracula_mask = class({})
function item_dracula_mask:GetIntrinsicModifierName()
return "modifier_item_dracula_mask"
end
function item_dracula_mask:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
local duration = self:GetSpecialValueFor("active_duration")
caster:EmitSound("DOTA_Item.AeonDisk.Activate")
caster:EmitSound("DOTA_Item.Satanic.Activate")
caster:AddNewModifier(caster, self, "modifier_item_dracula_mask_active", { duration = duration })
caster:Purge(false, true, false, true, true)
local particle = ParticleManager:CreateParticle(
"particles/items4_fx/combo_breaker_buff.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
caster
)
ParticleManager:ReleaseParticleIndex(particle)
end
modifier_item_dracula_mask = class({})
function modifier_item_dracula_mask:IsHidden() return true end
function modifier_item_dracula_mask:IsPurgable() return false end
function modifier_item_dracula_mask:IsPurgeException() return false end
function modifier_item_dracula_mask:RemoveOnDeath() return false end
function modifier_item_dracula_mask:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_dracula_mask:OnCreated()
self:OnRefresh()
if not self:GetAbility() then return end
local ability = self:GetAbility()
self.lifesteal_percent = ability:GetSpecialValueFor("lifesteal_percent")
self.spell_lifesteal = ability:GetSpecialValueFor("spell_lifesteal")
self.hp_threshold = ability:GetSpecialValueFor("hp_threshold")
if IsServer() then
self:StartIntervalThink(0.1)
end
end
function modifier_item_dracula_mask:OnRefresh()
self.stats_modifier_name = "modifier_item_dracula_mask_stats"
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_dracula_mask:DeclareFunctions()
return {
MODIFIER_PROPERTY_PHYSICAL_LIFESTEAL,
MODIFIER_PROPERTY_MAGICAL_LIFESTEAL,
}
end
function modifier_item_dracula_mask:OnDestroy()
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_dracula_mask:OnIntervalThink()
if not IsServer() then return end
local parent = self:GetParent()
local ability = self:GetAbility()
if not ability or ability:IsNull() then return end
local hp_pct = parent:GetHealthPercent()
if hp_pct <= self.hp_threshold and ability:IsFullyCastable() and parent:IsAlive() then
ability:OnSpellStart()
ability:UseResources(false, false, false, true)
end
end
function modifier_item_dracula_mask:GetModifierProperty_PhysicalLifesteal()
return self.lifesteal_percent or 0
end
function modifier_item_dracula_mask:GetModifierProperty_MagicalLifesteal()
return self.spell_lifesteal or 0
end
modifier_item_dracula_mask_active = class({})
function modifier_item_dracula_mask_active:IsHidden() return false end
function modifier_item_dracula_mask_active:IsDebuff() return false end
function modifier_item_dracula_mask_active:IsPurgable() return false end
function modifier_item_dracula_mask_active:GetTexture()
return "xixuemianzhao"
end
function modifier_item_dracula_mask_active:OnCreated()
if not self:GetAbility() then return end
self.lifesteal_active = self:GetAbility():GetSpecialValueFor("lifesteal_active")
self.spell_lifesteal_active = self:GetAbility():GetSpecialValueFor("spell_lifesteal_active")
self.lifesteal_percent = self:GetAbility():GetSpecialValueFor("lifesteal_percent")
self.spell_lifesteal = self:GetAbility():GetSpecialValueFor("spell_lifesteal")
self.bonus_attack_speed_active = self:GetAbility():GetSpecialValueFor("bonus_attack_speed_active")
self.bonus_movement_speed_active = self:GetAbility():GetSpecialValueFor("bonus_movement_speed_active")
self.damage_reduction = self:GetAbility():GetSpecialValueFor("damage_reduction") or -30
self.status_resistance = self:GetAbility():GetSpecialValueFor("status_resistance_active") or 80
if not IsServer() then return end
self.damage_reduction = self:GetAbility():GetSpecialValueFor("damage_reduction") or -100
end
function modifier_item_dracula_mask_active:DeclareFunctions()
return {
MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
MODIFIER_PROPERTY_PHYSICAL_LIFESTEAL,
MODIFIER_PROPERTY_MAGICAL_LIFESTEAL,
}
end
function modifier_item_dracula_mask_active:GetModifierAttackSpeedBonus_Constant()
return self.bonus_attack_speed_active or 0
end
function modifier_item_dracula_mask_active:GetModifierMoveSpeedBonus_Percentage()
return self.bonus_movement_speed_active or 0
end
function modifier_item_dracula_mask_active:GetModifierIncomingDamage_Percentage()
return self.damage_reduction or -30
end
function modifier_item_dracula_mask_active:GetModifierStatusResistanceStacking()
return self.status_resistance or 80
end
function modifier_item_dracula_mask_active:GetModifierProperty_PhysicalLifesteal()
return math.max((self.lifesteal_active or 0) - (self.lifesteal_percent or 0), 0)
end
function modifier_item_dracula_mask_active:GetModifierProperty_MagicalLifesteal()
return math.max((self.spell_lifesteal_active or 0) - (self.spell_lifesteal or 0), 0)
end
function modifier_item_dracula_mask_active:CheckState()
return {
[MODIFIER_STATE_UNSLOWABLE] = true,
[MODIFIER_STATE_DEBUFF_IMMUNE] = true,
}
end
