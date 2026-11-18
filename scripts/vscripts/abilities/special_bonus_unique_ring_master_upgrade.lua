function OnAbilityExecuted(keys)
local ability_executed = keys.event_ability
local function RotatePointAroundOrigin2D(origin, point, degrees)
local rad = math.rad(degrees)
local cosv = math.cos(rad)
local sinv = math.sin(rad)
local ox = origin.x or origin[1]
local oy = origin.y or origin[2]
local oz = origin.z or origin[3] or 0
local px = point.x or point[1]
local py = point.y or point[2]
local pz = point.z or point[3] or oz
local dx = px - ox
local dy = py - oy
local rx = dx * cosv - dy * sinv
local ry = dx * sinv + dy * cosv
return Vector(ox + rx, oy + ry, pz)
end
if ability_executed:GetAbilityName() == "ringmaster_wheel" then
if ability_executed.upgrade_triggered and ability_executed.upgrade_triggered > 0 then
return nil
end
local caster = keys.unit
local target_pos = ability_executed:GetCursorPosition()
local caster_pos = caster:GetAbsOrigin()
local direction = (target_pos - caster_pos):Normalized()
local side_length = keys.distance
local height = side_length * math.sqrt(3) / 2
local pos1 = target_pos
local angle_offset = 150
local pos2 = RotatePointAroundOrigin2D(target_pos, target_pos + direction * height, angle_offset)
local angle_offset_right = -150
local pos3 = RotatePointAroundOrigin2D(target_pos, target_pos + direction * height, angle_offset_right)
ability_executed:SetContextThink("think_ringmaster_multicast", function()
ability_executed.upgrade_triggered = 3
CastAbilityAtPosition(caster, ability_executed, pos2)
CastAbilityAtPosition(caster, ability_executed, pos3)
Timers:CreateTimer(0.1, function()
ability_executed.upgrade_triggered = nil
return nil
end)
return nil
end, 0.1)
end
if ability_executed:GetAbilityName() == "ringmaster_the_box" then
local caster = keys.unit
local parent = keys.target
local beast_tame_ability = caster:FindAbilityByName("ringmaster_tame_the_beasts")
local tame_range = 300
local min_damage = 100
local duration = 1
if beast_tame_ability then
local damage_level = beast_tame_ability:GetLevel() - 1
if damage_level >= 0 then
tame_range = beast_tame_ability:GetSpecialValueFor("start_width") or 600
min_damage = beast_tame_ability:GetSpecialValueFor("damage_min") or 500
duration = beast_tame_ability:GetSpecialValueFor("fear_duration_min") or 1.0
end
end
min_damage = min_damage + (caster:GetIntellect(false) or 500)
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
parent:GetAbsOrigin(),
nil,
tame_range,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
local damage_table = {
victim = enemy,
attacker = caster,
damage = min_damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = beast_tame_ability
}
ApplyDamage(damage_table)
enemy:AddNewModifier(caster, ability_executed, "modifier_ringmaster_tame_the_beasts_fear",
{ duration = duration })
end
Timers:CreateTimer(keys.interval, function()
if not parent:HasModifier("modifier_ringmaster_the_box_buff") then
return nil
end
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
parent:GetAbsOrigin(),
nil,
tame_range,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
local damage_table = {
victim = enemy,
attacker = caster,
damage = min_damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = beast_tame_ability
}
ApplyDamage(damage_table)
enemy:AddNewModifier(caster, ability_executed, "modifier_ringmaster_tame_the_beasts_fear",
{ duration = duration })
end
return keys.interval
end)
end
end
function CastAbilityAtPosition(caster, ability, position)
local current_mana = caster:GetMana()
local mana_cost = ability:GetManaCost(ability:GetLevel() - 1)
local original_cast_point = ability:GetCastPoint()
ability:EndCooldown()
ability:SetOverrideCastPoint(0)
if current_mana < mana_cost then
caster:GiveMana(mana_cost - current_mana)
end
caster:SetCursorPosition(position)
caster:CastAbilityImmediately(ability, caster:GetPlayerOwnerID())
caster:SetMana(current_mana)
ability:SetOverrideCastPoint(original_cast_point)
end
