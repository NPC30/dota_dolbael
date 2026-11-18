function OnAbilityExecuted_Riki(keys)
if not IsServer() then return end
local caster = keys.caster or keys.unit
local ability_executed = keys.event_ability or keys.ability
if not caster or not ability_executed then
return
end
local abil_name = ability_executed:GetAbilityName()
if abil_name ~= "riki_tricks_of_the_trade" then return end
local bonus_ability = caster:FindAbilityByName("special_bonus_unique_riki_upgrade")
if not bonus_ability or bonus_ability:GetLevel() < 1 then
return
end
local level_per_attack = tonumber(keys.level_per_attack) or 6
if level_per_attack <= 0 then level_per_attack = 6 end
local hero_level = caster:GetLevel()
local attack_count = math.floor(hero_level / level_per_attack) + ability_executed:GetLevel()
if attack_count <= 0 then return end
local radius = ability_executed:GetSpecialValueFor("radius")
if not radius or radius <= 0 then
radius = tonumber(keys.bonus_radius) or 500
end
local center = ability_executed:GetCursorPosition()
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
local attacked = 0
for _, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() and enemy:IsAlive() and attacked < attack_count then
caster:PerformAttack(enemy, true, true, true, false, true, false, true)
attacked = attacked + 1
end
end
end
