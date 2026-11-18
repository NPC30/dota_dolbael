LinkLuaModifier("modifier_special_bonus_unique_huskar_upgrade",
"abilities/special_bonus_unique_huskar_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_huskar_upgrade = class({})
function special_bonus_unique_huskar_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_huskar_upgrade"
end
function special_bonus_unique_huskar_upgrade:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
local duration = self:GetSpecialValueFor("duration")
if not duration or duration <= 0 then duration = 3 end
caster:AddNewModifier(caster, self, "modifier_dazzle_shallow_grave", { duration = duration })
caster:EmitSound("Hero_Dazzle.Shallow_Grave")
end
modifier_special_bonus_unique_huskar_upgrade = class({})
function modifier_special_bonus_unique_huskar_upgrade:IsHidden()
return false
end
function modifier_special_bonus_unique_huskar_upgrade:IsDebuff()
return false
end
function modifier_special_bonus_unique_huskar_upgrade:IsPurgable()
return false
end
function modifier_special_bonus_unique_huskar_upgrade:RemoveOnDeath()
return false
end
function modifier_special_bonus_unique_huskar_upgrade:OnCreated()
if not IsServer() then return end
self.parent = self:GetParent()
self.ability = self:GetAbility()
self:GetAbilityValues()
local interval = self.update_interval or 0.3
if interval <= 0 then interval = 0.3 end
self:SetHasCustomTransmitterData(true)
self:StartIntervalThink(interval)
end
function modifier_special_bonus_unique_huskar_upgrade:OnRefresh()
if not IsServer() then return end
self.ability = self:GetAbility()
self:GetAbilityValues()
local interval = self.update_interval or 0.3
if interval <= 0 then interval = 0.3 end
self:StartIntervalThink(interval)
end
function modifier_special_bonus_unique_huskar_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_INTERVAL_THINK,
MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
MODIFIER_PROPERTY_TOOLTIP,
}
end
function modifier_special_bonus_unique_huskar_upgrade:GetAbilityValues()
local ab = self.ability or self:GetAbility()
if not ab then
self.update_interval = 0.1
self.attack_from_loss_pct = 100
self.status_resist_max = 40
self.damage_reduction_max = 30
return
end
self.update_interval = ab:GetSpecialValueFor("update_interval")
if not self.update_interval or self.update_interval <= 0 then self.update_interval = 0.1 end
self.attack_from_loss_pct = ab:GetSpecialValueFor("attack_from_loss_pct")
if not self.attack_from_loss_pct or self.attack_from_loss_pct < 0 then self.attack_from_loss_pct = 100 end
self.status_resist_max = ab:GetSpecialValueFor("status_resist_max")
if not self.status_resist_max or self.status_resist_max < 0 then self.status_resist_max = 40 end
self.damage_reduction_max = ab:GetSpecialValueFor("damage_reduction_max")
if not self.damage_reduction_max or self.damage_reduction_max < 0 then self.damage_reduction_max = 30 end
end
function modifier_special_bonus_unique_huskar_upgrade:OnIntervalThink()
if not IsServer() then return end
local parent = self.parent or self:GetParent()
if not parent or parent:IsNull() or not parent:IsAlive() then return end
local max_hp = parent:GetMaxHealth()
local hp = parent:GetHealth()
local loss_ratio = 0
if max_hp > 0 then
loss_ratio = math.max(0, math.min(1, (max_hp - hp) / max_hp))
end
self:SetStackCount(0)
local base_ad = parent:GetAverageTrueAttackDamage(parent)
local atk_pct = self.attack_from_loss_pct or 100
local bonus = math.floor(base_ad * loss_ratio * atk_pct / 100)
self:SetStackCount(bonus)
self.status_resist_stack = (self.status_resist_max or 0) * loss_ratio
self.damage_reduction_stack = -((self.damage_reduction_max or 0) * loss_ratio)
end
function modifier_special_bonus_unique_huskar_upgrade:GetModifierPreAttack_BonusDamage()
return self:GetStackCount()
end
function modifier_special_bonus_unique_huskar_upgrade:GetModifierStatusResistanceStacking()
return self.status_resist_stack or 0
end
function modifier_special_bonus_unique_huskar_upgrade:GetModifierIncomingDamage_Percentage()
return self.damage_reduction_stack or 0
end
function modifier_special_bonus_unique_huskar_upgrade:AddCustomTransmitterData()
return {
status_resist_stack = self.status_resist_stack or 0,
damage_reduction_stack = self.damage_reduction_stack or 0
}
end
function modifier_special_bonus_unique_huskar_upgrade:HandleCustomTransmitterData(data)
self.status_resist_stack = data.status_resist_stack or 0
self.damage_reduction_stack = data.damage_reduction_stack or 0
end
function modifier_special_bonus_unique_huskar_upgrade:GetModifierToolTip()
return self:GetStackCount()
end
