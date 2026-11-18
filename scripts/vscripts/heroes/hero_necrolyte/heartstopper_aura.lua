function HeartstopperAura(keys)
local caster = keys.caster
local ability = keys.ability
local target = keys.target
local target_max_hp = target:GetMaxHealth() / 100
local aura_damage = ability:GetLevelSpecialValueFor("aura_damage", (ability:GetLevel() - 1))
local aura_damage_interval = ability:GetLevelSpecialValueFor("aura_damage_interval", (ability:GetLevel() - 1))
local base_damage = target_max_hp * aura_damage * aura_damage_interval
if caster:HasScepter() then
local heal_regen_to_damage = ability:GetSpecialValueFor("heal_regen_to_damage")
local caster_health_regen = caster:GetHealthRegen()
local regen_damage = caster_health_regen * (heal_regen_to_damage / 100) * aura_damage_interval
base_damage = base_damage + regen_damage
end
local damage_table = {}
damage_table.attacker = caster
damage_table.victim = target
damage_table.damage_type = DAMAGE_TYPE_MAGICAL
damage_table.ability = ability
damage_table.damage = base_damage
ApplyDamage(damage_table)
if not caster.heartstopper_refresh_timer then
caster.heartstopper_refresh_timer = true
Timers:CreateTimer(2.0, function()
if not caster or caster:IsNull() then
return nil
end
if not ability or ability:IsNull() or caster:FindAbilityByName("necrolyte_heartstopper_aura_datadriven") ~= ability then
caster.heartstopper_refresh_timer = nil
return nil
end
caster:RemoveModifierByName("modifier_heartstopper_aura_datadriven")
ability:ApplyDataDrivenModifier(caster, caster, "modifier_heartstopper_aura_datadriven", {})
return 2.0
end)
end
end
