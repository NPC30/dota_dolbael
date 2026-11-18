function OnAbilityExecuted(keys)
local ability_executed = keys.event_ability
if ability_executed:GetAbilityName() == "nyx_assassin_spiked_carapace" then
local aoe_radius = keys.SpikeRadius
local caster = keys.unit
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
caster:PerformAttack(enemy, true, true, true, true, false, false, true)
end
end
end
