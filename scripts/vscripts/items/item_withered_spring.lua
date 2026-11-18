LinkLuaModifier("modifier_item_withered_spring", "items/item_withered_spring", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_withered_spring_active", "items/item_withered_spring", LUA_MODIFIER_MOTION_NONE)
item_withered_spring = class({})
function item_withered_spring:GetIntrinsicModifierName()
return "modifier_item_withered_spring"
end
function item_withered_spring:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
local duration = self:GetSpecialValueFor("active_duration")
caster:EmitSound("Item.GuardianGreaves.Activate")
caster:EmitSound("DOTA_Item.AeonDisk.Activate")
caster:AddNewModifier(caster, self, "modifier_item_withered_spring_active", { duration = duration })
caster:Purge(false, true, false, true, true)
local instant_heal = self:GetSpecialValueFor("instant_heal")
caster:Heal(instant_heal, self)
end
modifier_item_withered_spring = class({})
function modifier_item_withered_spring:IsHidden() return true end
function modifier_item_withered_spring:IsPurgable() return false end
function modifier_item_withered_spring:IsPurgeException() return false end
function modifier_item_withered_spring:RemoveOnDeath() return false end
function modifier_item_withered_spring:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_withered_spring:OnCreated()
self:OnRefresh()
if not self:GetAbility() then return end
local ability = self:GetAbility()
self.health_regen_pct = ability:GetSpecialValueFor("health_regen_pct")
self.status_resistance = ability:GetSpecialValueFor("status_resistance")
self.hp_threshold = ability:GetSpecialValueFor("hp_threshold")
if IsServer() then
self:StartIntervalThink(0.2)
end
end
function modifier_item_withered_spring:OnRefresh()
self.stats_modifier_name = "modifier_item_withered_spring_stats"
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_withered_spring:OnIntervalThink()
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
function modifier_item_withered_spring:OnDestroy()
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_withered_spring:DeclareFunctions()
return {
MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE_UNIQUE,
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
}
end
function modifier_item_withered_spring:GetModifierHealthRegenPercentageUnique()
return self.health_regen_pct or 0
end
function modifier_item_withered_spring:GetModifierStatusResistanceStacking()
return self.status_resistance or 0
end
modifier_item_withered_spring_active = class({})
function modifier_item_withered_spring_active:IsHidden() return false end
function modifier_item_withered_spring_active:IsDebuff() return false end
function modifier_item_withered_spring_active:IsPurgable() return false end
function modifier_item_withered_spring_active:GetTexture()
return "kumufengchun"
end
function modifier_item_withered_spring_active:OnCreated()
if not self:GetAbility() then return end
self.bonus_armor_active = self:GetAbility():GetSpecialValueFor("bonus_armor_active")
self.bonus_regen_active = self:GetAbility():GetSpecialValueFor("bonus_regen_active")
self.status_resistance = self:GetAbility():GetSpecialValueFor("status_resistance_active") or 80
if not IsServer() then return end
self.damage_reduction = self:GetAbility():GetSpecialValueFor("damage_reduction") or -30
local particle = ParticleManager:CreateParticle(
"particles/items4_fx/combo_breaker_buff.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
self:GetParent()
)
self:AddParticle(particle, false, false, -1, false, false)
end
function modifier_item_withered_spring_active:DeclareFunctions()
return {
MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
}
end
function modifier_item_withered_spring_active:GetModifierPhysicalArmorBonus()
return self.bonus_armor_active or 0
end
function modifier_item_withered_spring_active:GetModifierConstantHealthRegen()
return self.bonus_regen_active or 0
end
function modifier_item_withered_spring_active:GetModifierIncomingDamage_Percentage()
return self.damage_reduction or -30
end
function modifier_item_withered_spring_active:GetModifierStatusResistanceStacking()
return self.status_resistance or 80
end
function modifier_item_withered_spring_active:CheckState()
return {
[MODIFIER_STATE_DEBUFF_IMMUNE] = true,
}
end
