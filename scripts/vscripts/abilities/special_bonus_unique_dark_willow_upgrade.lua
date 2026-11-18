local CONFIG = {
["dark_willow_bramble_maze"] = "placement_range",
["dark_willow_terrorize"] = "destination_radius",
["dark_willow_cursed_crown"] = "stun_radius",
}
local RADIUS_FALLBACK = {
["dark_willow_bramble_maze"] = 500,
["dark_willow_terrorize"] = 500,
["dark_willow_cursed_crown"] = 360,
}
function OnAbilityExecuted_DarkWillow(keys)
if not IsServer() then return end
local caster = keys.caster or keys.unit
local ability_executed = keys.event_ability or keys.ability
local target = keys.target
if not caster or not ability_executed then return end
local abil_name = ability_executed:GetAbilityName()
local radius_key = CONFIG[abil_name]
if not radius_key then return end
local bonus_ability = caster:FindAbilityByName("special_bonus_unique_dark_willow_upgrade")
if not bonus_ability or bonus_ability:GetLevel() < 1 then return end
local radius = ability_executed:GetSpecialValueFor(radius_key)
if not radius or radius <= 0 then
radius = RADIUS_FALLBACK[abil_name]
end
local center
if abil_name == "dark_willow_cursed_crown" and target and not target:IsNull() then
center = target:GetAbsOrigin()
else
center = ability_executed:GetCursorPosition()
if not center or center == Vector(0, 0, 0) then
center = caster:GetAbsOrigin()
end
end
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
center,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() and enemy:IsAlive() then
caster:PerformAttack(enemy, true, true, true, false, true, false, true)
end
end
end
