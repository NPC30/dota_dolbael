function OnAbilityExecuted(keys)
local ability = keys.event_ability
local abilityName = ability:GetAbilityName()
local caster = keys.caster
if abilityName == "monkey_king_boundless_strike" then
if ability.upgrade_triggered and ability.upgrade_triggered > 0 then
return nil
end
if ability.upgrade_sequence_active and ability.upgrade_sequence_active > 0 then
return nil
end
local attack_delay = keys.attack_delay or 0.1
local attack_count = keys.attack_count or 1
local search_radius = keys.search_radius or 2000
Timers:CreateTimer(attack_delay, function()
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
local stunnedCount = 0
local totalAttacks = 0
for _, hero in pairs(heroes) do
if hero:HasModifier("modifier_monkey_king_boundless_strike_stun") then
stunnedCount = stunnedCount + 1
for i = 1, attack_count do
caster:PerformAttack(hero, true, true, true, false, false, false, true)
totalAttacks = totalAttacks + 1
end
end
end
local gameTime = GameRules:GetDOTATime(false, false)
local currentSeconds = math.floor(gameTime % 60)
local requiredHits = math.floor(currentSeconds / 10)
if requiredHits == 0 then
requiredHits = 6
end
if stunnedCount == requiredHits or (stunnedCount > 6 and requiredHits == 6) then
ability:EndCooldown()
caster:GiveMana(ability:GetManaCost(-1))
end
end)
local ability = caster:FindAbilityByName("monkey_king_boundless_strike")
local target_pos = ability:GetCursorPosition()
if target_pos.x == 0 and target_pos.y == 0 then
target_pos = caster:GetAbsOrigin() + caster:GetForwardVector() * 100
end
do
local max_extra_casts = tonumber(keys.max_extra_casts) or 8
local max_times = math.floor(caster:GetAgility() / (keys.agility_per_cast or 500))
max_times = math.min(max_times, max_extra_casts)
if max_times >= 1 then
ability.upgrade_sequence_active = 1
local casted_times = 0
local cast_point = ability:GetCastPoint()
Timers:CreateTimer(keys.interval or 0.5, function()
if caster:FindModifierByName("modifier_spectre_ursa_enrage") then
ability.upgrade_triggered = 1
ability:EndCooldown()
ability:SetOverrideCastPoint(0.0)
caster:GiveMana(ability:GetManaCost(-1))
caster:SetCursorPosition(target_pos)
caster:CastAbilityImmediately(ability, caster:GetPlayerOwnerID())
ability:SetOverrideCastPoint(cast_point)
Timers:CreateTimer(0.05, function()
ability.upgrade_triggered = 0
return nil
end)
end
casted_times = casted_times + 1
if casted_times >= max_times then
ability.upgrade_sequence_active = 0
return nil
end
return keys.interval or 0.5
end)
end
end
end
end
