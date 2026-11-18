LinkLuaModifier("modifier_attack_range_bonus", "abilities/special_bonus_unique_templar_assassin_upgrade.lua",
LUA_MODIFIER_MOTION_NONE)
function OnAbilityExecuted(keys)
local caster = keys.unit
local ability = keys.ability
local ability_executed = keys.event_ability
if ability_executed:GetAbilityName() == "templar_assassin_meld" then
local start_time = GameRules:GetGameTime()
local attack_range_increase_max = ability:GetSpecialValueFor("attack_range_increase_max")
local attack_range_increase_time = ability:GetSpecialValueFor("attack_range_increase_time")
local attack_range_duration_time = ability:GetSpecialValueFor("attack_range_duration_time")
caster:RemoveModifierByName("modifier_attack_range_bonus")
caster:AddNewModifier(caster, ability, "modifier_attack_range_bonus", {
duration = -1,
attack_range_bonus = 0
})
local update_timer = Timers:CreateTimer(0.5, function()
if not caster:HasModifier("modifier_templar_assassin_meld") then
local mod = caster:FindModifierByName("modifier_attack_range_bonus")
if mod then
mod:SetDuration(attack_range_duration_time, true)
end
return nil
end
local current_time = GameRules:GetGameTime()
local stealth_duration = current_time - start_time
local attack_range_increase_rate = attack_range_increase_max / attack_range_increase_time
local calculated_range = math.min(stealth_duration * attack_range_increase_rate, attack_range_increase_max)
local mod = caster:FindModifierByName("modifier_attack_range_bonus")
if mod then
mod.attack_range_bonus = calculated_range
mod:SetStackCount(calculated_range)
end
return 0.5
end)
end
end
modifier_attack_range_bonus = class({})
function modifier_attack_range_bonus:OnCreated()
self:SetStackCount(0)
end
function modifier_attack_range_bonus:DeclareFunctions()
return {
MODIFIER_PROPERTY_ATTACK_RANGE_BONUS
}
end
function modifier_attack_range_bonus:GetModifierAttackRangeBonus()
return self:GetStackCount()
end
function modifier_attack_range_bonus:IsHidden()
return false
end
function modifier_attack_range_bonus:IsPurgable()
return true
end
