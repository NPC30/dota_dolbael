LinkLuaModifier("modifier_special_bonus_unique_sven_upgrade",
"abilities/special_bonus_unique_sven_upgrade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_special_bonus_unique_sven_upgrade_bonus_damage",
"abilities/special_bonus_unique_sven_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_sven_upgrade = class({})
function special_bonus_unique_sven_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_sven_upgrade"
end
modifier_special_bonus_unique_sven_upgrade = class({})
function modifier_special_bonus_unique_sven_upgrade:IsHidden()
return true
end
function modifier_special_bonus_unique_sven_upgrade:IsDebuff()
return false
end
function modifier_special_bonus_unique_sven_upgrade:IsPurgable()
return false
end
function modifier_special_bonus_unique_sven_upgrade:RemoveOnDeath()
return false
end
function modifier_special_bonus_unique_sven_upgrade:OnCreated()
if not IsServer() then return end
self.parent = self:GetParent()
self.ability = self:GetAbility()
end
function modifier_special_bonus_unique_sven_upgrade:OnRefresh()
if not IsServer() then return end
self.ability = self:GetAbility()
end
function modifier_special_bonus_unique_sven_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ATTACK_START,
}
end
function modifier_special_bonus_unique_sven_upgrade:OnAttackStart(params)
if not IsServer() then return end
local parent = self.parent or self:GetParent()
if params.attacker ~= parent then return end
local target = params.target
if not parent or parent:IsNull() or not parent:IsAlive() then return end
if not target or target:IsNull() or not target:IsAlive() then return end
if parent:IsIllusion() then return end
if target:IsBuilding() or target:IsOther() then return end
local ability = self.ability or self:GetAbility()
if not ability or ability:GetLevel() < 1 then return end
local chance = ability:GetSpecialValueFor("chance")
if not chance or chance <= 0 then return end
if RandomInt(1, 100) > chance then return end
local damage_pct = ability:GetSpecialValueFor("damage_pct")
if not damage_pct or damage_pct <= 0 then return end
local max_hp = target:GetMaxHealth()
if not max_hp or max_hp <= 0 then return end
local bonus_damage = math.floor(max_hp * damage_pct / 100)
parent:AddNewModifier(parent, ability, "modifier_special_bonus_unique_sven_upgrade_bonus_damage", {
duration = 1.0,
bonus_damage = bonus_damage,
})
end
modifier_special_bonus_unique_sven_upgrade_bonus_damage = class({})
function modifier_special_bonus_unique_sven_upgrade_bonus_damage:IsHidden()
return false
end
function modifier_special_bonus_unique_sven_upgrade_bonus_damage:IsPurgable()
return false
end
function modifier_special_bonus_unique_sven_upgrade_bonus_damage:GetTexture()
return "sven_gods_strength"
end
function modifier_special_bonus_unique_sven_upgrade_bonus_damage:OnCreated(kv)
if not IsServer() then return end
local bonus_damage = math.floor(tonumber(kv.bonus_damage) or 0)
self:SetStackCount(bonus_damage)
end
function modifier_special_bonus_unique_sven_upgrade_bonus_damage:OnRefresh(kv)
if not IsServer() then return end
local bonus_damage = math.floor(tonumber(kv.bonus_damage) or self:GetStackCount())
self:SetStackCount(bonus_damage)
end
function modifier_special_bonus_unique_sven_upgrade_bonus_damage:DeclareFunctions()
return {
MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
MODIFIER_PROPERTY_TOOLTIP,
}
end
function modifier_special_bonus_unique_sven_upgrade_bonus_damage:GetModifierPreAttack_BonusDamage()
return self:GetStackCount()
end
function modifier_special_bonus_unique_sven_upgrade_bonus_damage:OnTooltip()
return self:GetStackCount()
end
