function OnAttackLanded(keys)
local attacker = keys.attacker
if attacker:HasModifier("modifier_ember_spirit_sleight_of_fist_caster") then
if attacker.custom_passive_extra_attack then
return
end
local chance = keys.chance
if RandomInt(0, 100) < chance then
Timers:CreateTimer(0.1, function()
attacker.custom_passive_extra_attack = true
local target = keys.target
attacker:PerformAttack(target, true, true, true, true, false, false, true)
attacker.custom_passive_extra_attack = false
end)
end
end
end
function OnAbilityExecuted(keys)
local caster = keys.unit
local ability = keys.ability
local ability_executed = keys.event_ability
if ability_executed:GetAbilityName() == "ember_spirit_activate_fire_remnant" then
local aoe_radius = ability:GetSpecialValueFor("aoe_radius") or 800
local damage_pct = ability:GetSpecialValueFor("remnant_aoe_damage_pct") or 100
local attack_damage = caster:GetAverageTrueAttackDamage(nil)
local damage = attack_damage * (damage_pct / 100)
local enemies = FindUnitsInRadius(caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
aoe_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false)
for _, enemy in pairs(enemies) do
ApplyDamage({
victim = enemy,
attacker = caster,
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = ability
})
end
EmitSoundOn("Hero_EmberSpirit.FireRemnant.Explode", caster)
end
end
