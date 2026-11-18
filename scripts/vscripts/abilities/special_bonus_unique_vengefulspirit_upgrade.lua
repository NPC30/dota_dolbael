function OnAbilityExecuted(keys)
local event_ability = keys.event_ability
local abilityName = event_ability:GetAbilityName()
local caster = keys.caster
if abilityName == "vengefulspirit_wave_of_terror" then
local attack_delay = keys.attack_delay or 0.8
local attack_count = keys.attack_count or 1
local search_radius = keys.search_radius or 2000
local heroes = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
search_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
local attackedHeroes = {}
local elapsedTime = 0
local checkInterval = 0.1
for _, hero in pairs(heroes) do
if hero:HasModifier("modifier_vengefulspirit_wave_of_terror") and not attackedHeroes[hero:GetEntityIndex()] then
for i = 1, attack_count do
caster:PerformAttack(hero, true, true, true, false, true, false, true)
end
attackedHeroes[hero:GetEntityIndex()] = true
end
end
Timers:CreateTimer(checkInterval, function()
elapsedTime = elapsedTime + checkInterval
if elapsedTime >= attack_delay then
return nil
end
local currentHeroes = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
search_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, hero in pairs(currentHeroes) do
if hero:HasModifier("modifier_vengefulspirit_wave_of_terror") and not attackedHeroes[hero:GetEntityIndex()] then
for i = 1, attack_count do
caster:PerformAttack(hero, true, true, true, false, true, false, true)
end
attackedHeroes[hero:GetEntityIndex()] = true
end
end
return checkInterval
end)
end
if abilityName == "vengefulspirit_nether_swap" then
local target = keys.target
local ability = keys.ability
local mul_attack = keys.burst_mul
local burst_radius = keys.burst_radius
if target then
target:AddNewModifier(caster, ability, "modifier_item_nullifier_mute", { duration = keys.duration })
target:AddNewModifier(caster, ability, "modifier_break", { duration = keys.duration })
end
Timers:CreateTimer(0.5, function()
local heroes = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
burst_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
local caster_attack_damage = caster:GetAverageTrueAttackDamage(nil) or 1000
local damage = caster_attack_damage * mul_attack
for _, hero in pairs(heroes) do
ApplyDamage({
victim = hero,
attacker = caster,
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = ability
})
end
end)
end
end
