LinkLuaModifier("modifier_special_bonus_unique_troll_warlord_upgrade", "abilities/special_bonus_unique_troll_warlord_upgrade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_special_bonus_unique_troll_warlord_upgrade_damage", "abilities/special_bonus_unique_troll_warlord_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_troll_warlord_upgrade = class({})
local DEFAULT_MAX_BONUS_DAMAGE = 100000000
local function IsExtraAttack(params)
return params.no_attack_cooldown == true or params.no_attack_cooldown == 1
end
function special_bonus_unique_troll_warlord_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_troll_warlord_upgrade"
end
modifier_special_bonus_unique_troll_warlord_upgrade = class({})
function modifier_special_bonus_unique_troll_warlord_upgrade:IsHidden()
return false
end
function modifier_special_bonus_unique_troll_warlord_upgrade:IsPurgable()
return false
end
function modifier_special_bonus_unique_troll_warlord_upgrade:RemoveOnDeath()
return false
end
function modifier_special_bonus_unique_troll_warlord_upgrade:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT
end
function modifier_special_bonus_unique_troll_warlord_upgrade:OnCreated()
self.same_target_stacks = 0
self.bonus_damage = 0
self.last_target_entindex = nil
if IsServer() then
self:UpdateDamageModifier()
end
end
function modifier_special_bonus_unique_troll_warlord_upgrade:OnRefresh()
self:RecalculateBonusDamage()
end
function modifier_special_bonus_unique_troll_warlord_upgrade:OnDestroy()
if not IsServer() then
return
end
local parent = self:GetParent()
if parent and not parent:IsNull() then
parent:RemoveModifierByName("modifier_special_bonus_unique_troll_warlord_upgrade_damage")
end
end
function modifier_special_bonus_unique_troll_warlord_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ATTACK_LANDED,
MODIFIER_PROPERTY_TOOLTIP,
}
end
function modifier_special_bonus_unique_troll_warlord_upgrade:OnAttackLanded(params)
if not IsServer() then
return
end
local parent = self:GetParent()
if params.attacker ~= parent or not params.target or params.target:IsNull() then
return
end
if IsExtraAttack(params) then
return
end
if parent:IsIllusion() or not parent:IsRealHero() then
return
end
if params.target:IsOther() or params.target:IsBuilding() then
return
end
local target_entindex = params.target:entindex()
if self.last_target_entindex == target_entindex then
self.same_target_stacks = (self.same_target_stacks or 0) + 1
else
self.last_target_entindex = target_entindex
self.same_target_stacks = 1
end
self:SetStackCount(self.same_target_stacks)
self:RecalculateBonusDamage()
end
function modifier_special_bonus_unique_troll_warlord_upgrade:OnTooltip()
local parent = self:GetParent()
if parent and not parent:IsNull() then
local damage_modifier = parent:FindModifierByName("modifier_special_bonus_unique_troll_warlord_upgrade_damage")
if damage_modifier then
return damage_modifier:GetStackCount()
end
end
return self.bonus_damage or 0
end
function modifier_special_bonus_unique_troll_warlord_upgrade:RecalculateBonusDamage()
local parent = self:GetParent()
local stacks = self.same_target_stacks or self:GetStackCount()
if not parent or stacks <= 0 then
self.bonus_damage = 0
if IsServer() then
self:UpdateDamageModifier()
end
return
end
local damage_modifier = parent:FindModifierByName("modifier_special_bonus_unique_troll_warlord_upgrade_damage")
local previous_damage_stack = 0
if damage_modifier then
previous_damage_stack = damage_modifier:GetStackCount()
damage_modifier:SetStackCount(0)
end
local base_damage = parent:GetAverageTrueAttackDamage(parent)
if damage_modifier then
damage_modifier:SetStackCount(previous_damage_stack)
end
local pct = self:GetAbilitySpecialValue("damage_pct_per_stack")
local max_bonus_damage = self:GetAbilitySpecialValue("max_bonus_damage")
if max_bonus_damage <= 0 then
max_bonus_damage = DEFAULT_MAX_BONUS_DAMAGE
end
local calculated_damage = math.floor(base_damage * (math.pow(1 + pct / 100, stacks) - 1) + 0.5)
if calculated_damage ~= calculated_damage or calculated_damage == math.huge or calculated_damage > max_bonus_damage then
calculated_damage = max_bonus_damage
end
self.bonus_damage = calculated_damage
if IsServer() then
self:UpdateDamageModifier()
end
end
function modifier_special_bonus_unique_troll_warlord_upgrade:UpdateDamageModifier()
if not IsServer() then
return
end
local parent = self:GetParent()
if not parent or parent:IsNull() then
return
end
local damage_modifier = parent:FindModifierByName("modifier_special_bonus_unique_troll_warlord_upgrade_damage")
if not damage_modifier then
damage_modifier = parent:AddNewModifier(parent, self:GetAbility(), "modifier_special_bonus_unique_troll_warlord_upgrade_damage", {})
end
if damage_modifier then
damage_modifier:SetStackCount(self.bonus_damage or 0)
end
end
function modifier_special_bonus_unique_troll_warlord_upgrade:GetDamageBonusPct()
local stacks = self.same_target_stacks or self:GetStackCount()
local pct = self:GetAbilitySpecialValue("damage_pct_per_stack")
if stacks <= 0 then
return 0
end
return (math.pow(1 + pct / 100, stacks) - 1) * 100
end
function modifier_special_bonus_unique_troll_warlord_upgrade:GetAbilitySpecialValue(name)
local ability = self:GetAbility()
if ability then
return ability:GetSpecialValueFor(name)
end
return 0
end
modifier_special_bonus_unique_troll_warlord_upgrade_damage = class({})
function modifier_special_bonus_unique_troll_warlord_upgrade_damage:IsHidden()
return true
end
function modifier_special_bonus_unique_troll_warlord_upgrade_damage:IsPurgable()
return false
end
function modifier_special_bonus_unique_troll_warlord_upgrade_damage:RemoveOnDeath()
return false
end
function modifier_special_bonus_unique_troll_warlord_upgrade_damage:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT
end
function modifier_special_bonus_unique_troll_warlord_upgrade_damage:DeclareFunctions()
return {
MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
}
end
function modifier_special_bonus_unique_troll_warlord_upgrade_damage:GetModifierPreAttack_BonusDamage()
return self:GetStackCount()
end
