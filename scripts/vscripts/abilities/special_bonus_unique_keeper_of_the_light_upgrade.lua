local MODIFIER_ILLUMINATE_DAMAGE = "modifier_special_bonus_unique_keeper_of_the_light_illuminate_damage"
local ILLUMINATE_ABILITY_NAME = "keeper_of_the_light_illuminate"
local ILLUMINATE_MODIFIER_DURATION = 1.3
local function ComputeIlluminateBonusPct(caster, illuminate_ability, upgrade_ability)
if not caster or not illuminate_ability or not upgrade_ability then return 0 end
local total_damage = illuminate_ability:GetSpecialValueFor("total_damage") or 600
if total_damage <= 0 then return 0 end
local pct = upgrade_ability:GetSpecialValueFor("illuminate_damage_pct") or 60
local mana = caster:GetMana()
return (mana * (pct / 100) / total_damage) * 100
end
function OnAbilityExecuted_KeeperOfTheLight(keys)
if not IsServer() then return end
local caster = keys.caster or keys.unit
local ability_executed = keys.event_ability or keys.ability
local target = keys.target
if not caster or not ability_executed then return end
local upgrade_ability = caster:FindAbilityByName("special_bonus_unique_keeper_of_the_light_upgrade")
if not upgrade_ability or upgrade_ability:GetLevel() < 1 then return end
local abil_name = ability_executed:GetAbilityName()
if abil_name == "keeper_of_the_light_chakra_magic" then
if target then
local chakra_pct = upgrade_ability:GetSpecialValueFor("chakra_mana_pct") or 6
local spell_amp = caster:GetSpellAmplification(false) or 0
local max_mana = caster:GetMaxMana()
local bonus = max_mana * (chakra_pct / 100) * (1 + spell_amp)
if bonus > 0 then
target:GiveMana(bonus)
target:Heal(bonus, ability_executed)
SendOverheadEventMessage(nil, OVERHEAD_ALERT_MANA_ADD, caster, bonus, nil)
SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, caster, bonus, nil)
end
end
return
end
if abil_name == ILLUMINATE_ABILITY_NAME then
Timers:CreateTimer(3, function()
local bonus_pct = ComputeIlluminateBonusPct(caster, ability_executed, upgrade_ability)
caster:RemoveModifierByName(MODIFIER_ILLUMINATE_DAMAGE)
caster:AddNewModifier(caster, upgrade_ability, MODIFIER_ILLUMINATE_DAMAGE, {
duration = ILLUMINATE_MODIFIER_DURATION,
bonus_pct = bonus_pct,
})
return nil
end)
end
end
LinkLuaModifier(MODIFIER_ILLUMINATE_DAMAGE, "abilities/special_bonus_unique_keeper_of_the_light_upgrade.lua",
LUA_MODIFIER_MOTION_NONE)
modifier_special_bonus_unique_keeper_of_the_light_illuminate_damage = class({})
function modifier_special_bonus_unique_keeper_of_the_light_illuminate_damage:IsHidden()
return true
end
function modifier_special_bonus_unique_keeper_of_the_light_illuminate_damage:IsPurgable()
return false
end
function modifier_special_bonus_unique_keeper_of_the_light_illuminate_damage:RemoveOnDeath()
return true
end
function modifier_special_bonus_unique_keeper_of_the_light_illuminate_damage:OnCreated(kv)
self.bonus_pct = tonumber(kv.bonus_pct) or 0
end
function modifier_special_bonus_unique_keeper_of_the_light_illuminate_damage:DeclareFunctions()
return {
MODIFIER_PROPERTY_TOTALDAMAGEOUTGOING_PERCENTAGE,
}
end
function modifier_special_bonus_unique_keeper_of_the_light_illuminate_damage:GetModifierTotalDamageOutgoing_Percentage(
params)
if not IsServer() then return 0 end
if params.inflictor and params.inflictor:GetAbilityName() == ILLUMINATE_ABILITY_NAME then
return self.bonus_pct or 0
end
return 0
end
