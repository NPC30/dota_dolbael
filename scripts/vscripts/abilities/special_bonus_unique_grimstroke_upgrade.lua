function OnAbilityExecuted(keys)
local ability_executed = keys.event_ability
if ability_executed:GetAbilityName() == "grimstroke_spirit_walk" then
local caster = keys.unit
local parent = keys.target
local radius = keys.radius
local total_executions = math.floor(keys.duration / keys.interval)
local current_execution = 0
local damage = caster:GetAverageTrueAttackDamage(nil) * keys.damage_pct / 100
local damage_table = {
victim = nil,
attacker = caster,
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = ability_executed
}
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
parent:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
damage_table.victim = enemy
ApplyDamage(damage_table)
end
Timers:CreateTimer(keys.interval, function()
current_execution = current_execution + 1
if current_execution > total_executions then
return nil
end
if not parent:IsAlive() then
return nil
end
local damage = caster:GetAverageTrueAttackDamage(nil) * keys.damage_pct / 100
damage_table.damage = damage
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
parent:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
damage_table.victim = enemy
ApplyDamage(damage_table)
end
return keys.interval
end)
end
end
