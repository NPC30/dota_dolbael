function OnAttacked(params)
local attacker = params.attacker
local parent = params.caster
if attacker:IsBuilding() then
return
end
local fireblast = parent:FindAbilityByName("ogre_magi_fireblast")
local unrefined_fireblast = parent:FindAbilityByName("ogre_magi_unrefined_fireblast")
local available_abilities = {}
if fireblast and fireblast:GetLevel() > 0 then
table.insert(available_abilities, fireblast)
end
if unrefined_fireblast and unrefined_fireblast:GetLevel() > 0 then
table.insert(available_abilities, unrefined_fireblast)
end
if #available_abilities == 0 then
return
end
local ability = available_abilities[RandomInt(1, #available_abilities)]
if ability then
local cast_target = attacker
local remaining_cooldown = ability:GetCooldownTimeRemaining() or 0
local current_mana = parent:GetMana()
local mana_cost = ability:GetManaCost(ability:GetLevel() - 1)
local original_cast_point = ability:GetCastPoint()
ability:EndCooldown()
ability:SetOverrideCastPoint(0)
if current_mana < mana_cost then
parent:GiveMana(mana_cost - current_mana)
end
parent:SetCursorCastTarget(cast_target)
local cast_success = parent:CastAbilityImmediately(ability, parent:GetPlayerOwnerID())
parent:SetCursorCastTarget(nil)
parent:SetMana(current_mana)
ability:SetOverrideCastPoint(original_cast_point)
local restore_delay = FrameTime()
ability:SetContextThink("restore_cooldown_" .. ability:GetEntityIndex(), function()
if remaining_cooldown and remaining_cooldown > 0 then
ability:EndCooldown()
ability:StartCooldown(remaining_cooldown)
else
ability:EndCooldown()
end
return nil
end, restore_delay)
end
end
function OnAbilityExecuted(params)
local ability = params.event_ability
local parent = params.caster
local target = params.target
if not ability or not parent or not target then
return
end
local ability_name = ability:GetAbilityName()
if ability_name ~= "ogre_magi_fireblast" and ability_name ~= "ogre_magi_unrefined_fireblast" then
return
end
ability:SetContextThink("think_ringmaster_multicast", function()
if ability.upgrade_triggered then
return
end
local aoe_radius = params.aoe_radius or ability:GetSpecialValueFor("blast_aoe") or 0
if aoe_radius <= 0 then
aoe_radius = 300
end
local cast_position = target:GetAbsOrigin()
local enemies = FindUnitsInRadius(
parent:GetTeamNumber(),
cast_position,
nil,
aoe_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
local remaining_cooldown = ability:GetCooldownTimeRemaining() or 0
local current_mana = parent:GetMana()
local mana_cost = ability:GetManaCost(ability:GetLevel() - 1)
local original_cast_point = ability:GetCastPoint()
ability.upgrade_triggered = true
ability:SetOverrideCastPoint(0)
local cast_count = 0
for _, enemy in ipairs(enemies) do
if cast_count > params.ability:GetLevel() then
break
end
cast_count = cast_count + 1
if enemy ~= target then
ability:EndCooldown()
local loop_mana = parent:GetMana()
if loop_mana < mana_cost then
parent:GiveMana(mana_cost - loop_mana)
end
parent:SetCursorCastTarget(enemy)
parent:CastAbilityImmediately(ability, parent:GetPlayerOwnerID())
parent:SetCursorCastTarget(nil)
end
end
parent:SetMana(current_mana)
ability:SetOverrideCastPoint(original_cast_point)
local restore_delay = FrameTime()
ability:SetContextThink("restore_cooldown_" .. ability:GetEntityIndex(), function()
if remaining_cooldown > 0 then
ability:EndCooldown()
ability:StartCooldown(remaining_cooldown)
else
ability:EndCooldown()
end
ability.upgrade_triggered = false
return nil
end, restore_delay)
return nil
end, 0.1)
end
