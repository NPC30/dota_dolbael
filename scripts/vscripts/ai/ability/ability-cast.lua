local ____exports = {}
local ____cast_2Dcondition = require("ai.action.cast-condition")
local IsAbilityBehavior = ____cast_2Dcondition.IsAbilityBehavior
function ____exports.GetFullCastRange(self, ____self, ability)
local range = ability:GetCastRange(
____self:GetAbsOrigin(),
nil
)
local castRangeIncrease = ____self:GetCastRangeBonus()
return range + castRangeIncrease
end
function ____exports.CastAbilityOnTargetByBehavior(self, hero, ability, target, castPosition)
local playerId = hero:GetPlayerOwnerID()
local abilityName = ability:GetName()
if IsAbilityBehavior(nil, ability, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) then
print(("[AI] CastByBehavior " .. abilityName) .. " on target")
hero:CastAbilityOnTarget(target, ability, playerId)
return true
end
if IsAbilityBehavior(nil, ability, DOTA_ABILITY_BEHAVIOR_POINT) then
print(("[AI] CastByBehavior " .. abilityName) .. " on point")
hero:CastAbilityOnPosition(
castPosition or target:GetAbsOrigin(),
ability,
playerId
)
return true
end
if IsAbilityBehavior(nil, ability, DOTA_ABILITY_BEHAVIOR_AOE) then
print(("[AI] CastByBehavior " .. abilityName) .. " on position")
hero:CastAbilityOnPosition(
castPosition or target:GetAbsOrigin(),
ability,
playerId
)
return true
end
if IsAbilityBehavior(nil, ability, DOTA_ABILITY_BEHAVIOR_NO_TARGET) then
print(("[AI] CastByBehavior " .. abilityName) .. " no target")
hero:CastAbilityNoTarget(ability, playerId)
return true
end
print(("[AI] ERROR CastByBehavior " .. abilityName) .. " behavior not supported")
return false
end
function ____exports.ApplyAbilityAction(self, ability, action)
if action.toggleOn and not ability:GetToggleState() then
print("[AI] toggleOn " .. ability:GetName())
ability:ToggleAbility()
return true
end
if action.toggleOff and ability:GetToggleState() then
print("[AI] toggleOff " .. ability:GetName())
ability:ToggleAbility()
return true
end
if action.autoCastOn and not ability:GetAutoCastState() then
print("[AI] autoCastOn " .. ability:GetName())
ability:ToggleAutoCast()
return true
end
return false
end
return ____exports
