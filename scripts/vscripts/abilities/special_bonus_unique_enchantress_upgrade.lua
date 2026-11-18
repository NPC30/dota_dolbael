LinkLuaModifier("modifier_special_bonus_unique_enchantress_upgrade_autocast", "abilities/special_bonus_unique_enchantress_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_enchantress_upgrade = class({})
function special_bonus_unique_enchantress_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_enchantress_upgrade_autocast"
end
function special_bonus_unique_enchantress_upgrade:GetCastRange()
local caster = self:GetCaster()
if not caster then
return self:GetSpecialValueFor("cast_range_buffer")
end
return caster:Script_GetAttackRange() + self:GetSpecialValueFor("cast_range_buffer")
end
function special_bonus_unique_enchantress_upgrade:OnSpellStart()
self:ReleaseVolley(self:GetCursorTarget(), false)
end
function special_bonus_unique_enchantress_upgrade:ReleaseVolley(target, consume_resources)
local caster = self:GetCaster()
if not caster or not target or target:IsNull() or not target:IsAlive() then
return false
end
if target:TriggerSpellAbsorb(self) then
return false
end
if consume_resources then
self:UseResources(true, false, false, true)
end
self.is_releasing = true
target:EmitSound("Hero_DrowRanger.Multishot")
local interval = self:GetSpecialValueFor("interval")
if interval <= 0 then
interval = 0.1
end
local shots = self:GetSpecialValueFor("shots")
if shots <= 0 then
shots = 1
end
local shot_count = 0
Timers:CreateTimer(interval, function()
if not caster:IsAlive() or target:IsNull() or not target:IsAlive() then
self.is_releasing = false
return nil
end
caster:PerformAttack(target, true, true, true, false, true, false, true)
shot_count = shot_count + 1
if shot_count >= shots then
self.is_releasing = false
return nil
end
return interval
end)
return true
end
modifier_special_bonus_unique_enchantress_upgrade_autocast = class({})
function modifier_special_bonus_unique_enchantress_upgrade_autocast:IsHidden()
return true
end
function modifier_special_bonus_unique_enchantress_upgrade_autocast:IsPurgable()
return false
end
function modifier_special_bonus_unique_enchantress_upgrade_autocast:RemoveOnDeath()
return false
end
function modifier_special_bonus_unique_enchantress_upgrade_autocast:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ATTACK_LANDED,
}
end
function modifier_special_bonus_unique_enchantress_upgrade_autocast:OnAttackLanded(params)
if not IsServer() then
return
end
local parent = self:GetParent()
local ability = self:GetAbility()
local target = params.target
if params.attacker ~= parent or not ability or ability.is_releasing then
return
end
if not target or target:IsNull() or not target:IsAlive() then
return
end
if not ability:GetAutoCastState() or not ability:IsFullyCastable() then
return
end
if target:GetTeamNumber() == parent:GetTeamNumber() or target:IsBuilding() or target:IsOther() then
return
end
local distance = (target:GetAbsOrigin() - parent:GetAbsOrigin()):Length2D()
if distance > ability:GetCastRange() + parent:GetCastRangeBonus() then
return
end
ability:ReleaseVolley(target, true)
end
