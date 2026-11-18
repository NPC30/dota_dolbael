function OnAbilityExecuted(keys)
local ability = keys.event_ability
local abilityName = ability:GetAbilityName()
local caster = keys.caster
if abilityName == "tusk_snowball" then
local snowball_ability = caster:FindAbilityByName("tusk_snowball")
local search_radius = (snowball_ability:GetSpecialValueFor("snowball_radius") or 200) * 1.5
local kick_ability = caster:FindAbilityByName("tusk_walrus_kick")
local upgrade_ability = caster:FindAbilityByName("special_bonus_unique_tusk_upgrade")
local has_autocast = upgrade_ability:GetAutoCastState()
local has_scepter = caster:HasModifier("modifier_item_ultimate_scepter")
local base_attack_time = caster:GetBaseAttackTime(true)
local attack_speed = caster:GetAttackSpeed(false)
local attack_interval = base_attack_time / (attack_speed)
local lowered_attack_interval = keys.lowered_attack_interval
if has_autocast and has_scepter then
attack_interval = attack_interval * lowered_attack_interval / 2
else
attack_interval = attack_interval * lowered_attack_interval
end
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
search_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
if enemy:IsAlive() then
if has_autocast and has_scepter then
caster:PerformAttack(enemy, true, true, true, false, false, false, true)
kick_ability:EndCooldown()
caster:SetCursorCastTarget(enemy)
caster:CastAbilityImmediately(kick_ability, caster:GetPlayerOwnerID())
caster:SetCursorCastTarget(nil)
else
caster:PerformAttack(enemy, true, true, true, false, false, false, true)
end
end
end
local attack_timer = Timers:CreateTimer(attack_interval, function()
if not caster:HasModifier("modifier_tusk_snowball_movement") then
return nil
end
local original_cast_point = kick_ability:GetCastPoint()
kick_ability:SetOverrideCastPoint(0)
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
search_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
if enemy:IsAlive() then
if has_autocast and has_scepter then
caster:PerformAttack(enemy, true, true, true, false, false, false, true)
kick_ability:EndCooldown()
caster:SetCursorCastTarget(enemy)
caster:CastAbilityImmediately(kick_ability, caster:GetPlayerOwnerID())
caster:SetCursorCastTarget(nil)
else
caster:PerformAttack(enemy, true, true, true, false, false, false, true)
end
end
end
kick_ability:SetOverrideCastPoint(original_cast_point)
return attack_interval
end)
end
end
