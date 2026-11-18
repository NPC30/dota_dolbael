function OnAbilityExecuted(keys)
local caster = keys.unit
local upgrade_ability = keys.ability
local executed_ability = keys.event_ability
local primary_target = keys.target
if not caster or caster:IsNull() then return end
if not upgrade_ability or upgrade_ability:IsNull() then return end
if not executed_ability or executed_ability:IsNull() then return end
if executed_ability:GetAbilityName() ~= "chaos_knight_reality_rift" then return end
if caster:IsIllusion() or not caster:IsRealHero() then return end
if not primary_target or primary_target:IsNull() then return end
if not primary_target:IsAlive() then return end
if primary_target:GetTeamNumber() == caster:GetTeamNumber() then return end
local radius = tonumber(keys.radius) or upgrade_ability:GetSpecialValueFor("radius")
if not radius or radius <= 0 then return end
local target_origin = primary_target:GetAbsOrigin()
local caster_origin = caster:GetAbsOrigin()
local pull_origin = (caster_origin + target_origin) * 0.5
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
target_origin,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
FIND_ANY_ORDER,
false
)
local count = #enemies
if count <= 0 then return end
for index, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() and enemy:IsAlive() and enemy:GetTeamNumber() ~= caster:GetTeamNumber() then
local angle = (index - 1) * 2 * math.pi / count
local offset = Vector(math.cos(angle) * 72, math.sin(angle) * 72, 0)
FindClearSpaceForUnit(enemy, pull_origin + offset, true)
enemy:FaceTowards(caster_origin)
end
end
ResolveNPCPositions(pull_origin, 144)
Timers:CreateTimer(0.03, function()
if caster:IsNull() or not caster:IsAlive() then return end
for _, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() and enemy:IsAlive() and enemy:GetTeamNumber() ~= caster:GetTeamNumber() then
caster:PerformAttack(enemy, true, true, true, true, false, false, true)
end
end
end)
end
