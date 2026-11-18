local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____cast_2Dcondition = require("ai.action.cast-condition")
local CheckAbilityConditionFailure = ____cast_2Dcondition.CheckAbilityConditionFailure
local CheckNumberRangeFailure = ____cast_2Dcondition.CheckNumberRangeFailure
local CheckUnitConditionFailure = ____cast_2Dcondition.CheckUnitConditionFailure
local DeepMerge = ____cast_2Dcondition.DeepMerge
local FilterTargetWithCondition = ____cast_2Dcondition.FilterTargetWithCondition
local ____ability_2Dcast = require("ai.ability.ability-cast")
local ApplyAbilityAction = ____ability_2Dcast.ApplyAbilityAction
local CastAbilityOnTargetByBehavior = ____ability_2Dcast.CastAbilityOnTargetByBehavior
local GetFullCastRange = ____ability_2Dcast.GetFullCastRange
local ____ability_2Dregistry = require("ai.ability.ability-registry")
local AbilityRegistry = ____ability_2Dregistry.AbilityRegistry
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
local CREEP_DEFAULT_CONDITION = {self = {unitCondition = {manaPercent = {gte = 40}, healthPercent = {gte = 40}}, noEnemyHeroInRange = 900}, ability = {level = {gte = 3}}}
____exports.AbilityDispatcher = __TS__Class()
local AbilityDispatcher = ____exports.AbilityDispatcher
AbilityDispatcher.name = "AbilityDispatcher"
function AbilityDispatcher.prototype.____constructor(self)
end
function AbilityDispatcher.Run(self, ai)
local hero = ai:GetHero()
local abilityCount = hero:GetAbilityCount()
do
local i = 0
while i < abilityCount do
do
local ability = hero:GetAbilityByIndex(i)
if not ability then
goto __continue4
end
if not ability:IsFullyCastable() then
goto __continue4
end
local specs = AbilityRegistry:get(ability:GetName())
if not specs then
goto __continue4
end
for ____, spec in ipairs(specs) do
if self:tryCast(ai, ability, spec) then
return true
end
end
end
::__continue4::
i = i + 1
end
end
return false
end
function AbilityDispatcher.tryCast(self, ai, ability, spec)
local hero = ai:GetHero()
local condition = spec.targetSide == TargetSide.EnemyCreep and DeepMerge(nil, CREEP_DEFAULT_CONDITION, spec.condition) or spec.condition
local ____CheckUnitConditionFailure_4 = CheckUnitConditionFailure
local ____opt_0 = condition and condition.self
if ____CheckUnitConditionFailure_4(nil, hero, ____opt_0 and ____opt_0.unitCondition) then
return false
end
if CheckAbilityConditionFailure(nil, ability, condition and condition.ability) then
return false
end
local ____opt_7 = condition and condition.self
local noHeroRange = ____opt_7 and ____opt_7.noEnemyHeroInRange
if noHeroRange ~= nil then
for ____, enemy in ipairs(ai.aroundEnemyHeroes) do
if enemy:IsAlive() and hero:GetRangeToUnit(enemy) <= noHeroRange then
return false
end
end
end
local ____opt_11 = condition and condition.self
local friendlyCreepNearby = ____opt_11 and ____opt_11.friendlyCreepNearby
if friendlyCreepNearby ~= nil then
local range = friendlyCreepNearby.range or 900
local creeps = FindUnitsInRadius(
hero:GetTeamNumber(),
hero:GetAbsOrigin(),
nil,
range,
DOTA_UNIT_TARGET_TEAM_FRIENDLY,
DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
if CheckNumberRangeFailure(nil, #creeps, friendlyCreepNearby.count) then
return false
end
end
local target = self:pickTarget(ai, ability, spec.targetSide, condition)
if not target then
return false
end
if condition and condition.debug then
print((("[AI] Dispatcher hit " .. ability:GetName()) .. " side=") .. spec.targetSide)
end
if condition and condition.action then
return ApplyAbilityAction(nil, ability, condition.action)
end
local castPosition = self:resolveCastPosition(hero, ability, target, condition)
return CastAbilityOnTargetByBehavior(
nil,
hero,
ability,
target,
castPosition
)
end
function AbilityDispatcher.resolveCastPosition(self, hero, ability, target, condition)
local ____opt_19 = condition and condition.target
if (____opt_19 and ____opt_19.castMode) ~= "projectedOnCastRange" then
return nil
end
local heroPos = hero:GetAbsOrigin()
local targetPos = target:GetAbsOrigin()
local delta = targetPos:__sub(heroPos)
local len = delta:Length2D()
if len < 1 then
return targetPos
end
local castRange = GetFullCastRange(nil, hero, ability)
if len <= castRange then
return targetPos
end
local direction = delta:__mul(1 / len)
return heroPos:__add(direction:__mul(castRange))
end
function AbilityDispatcher.pickTarget(self, ai, ability, targetSide, condition)
local hero = ai:GetHero()
if targetSide == TargetSide.Self then
return hero
end
local candidates = self:candidatesFor(ai, targetSide)
local filledCondition = self:fillRangeFromCastRange(condition, hero, ability)
return FilterTargetWithCondition(
nil,
filledCondition,
candidates,
hero,
ability
)
end
function AbilityDispatcher.fillRangeFromCastRange(self, condition, hero, ability)
local ____opt_23 = condition and condition.target
local existing = ____opt_23 and ____opt_23.range
if (existing and existing.lte) ~= nil then
return condition
end
local ____opt_29 = condition and condition.target
local specialValueKey = ____opt_29 and ____opt_29.rangeFromAbilityValue
local castRange = specialValueKey and ability:GetSpecialValueFor(specialValueKey) or GetFullCastRange(nil, hero, ability)
local range = {lte = castRange}
if (existing and existing.gte) ~= nil then
range.gte = existing.gte
end
local target = condition and condition.target or ({})
target.range = range
return {
target = target,
self = condition and condition.self,
ability = condition and condition.ability,
action = condition and condition.action,
debug = condition and condition.debug
}
end
function AbilityDispatcher.candidatesFor(self, ai, side)
if side == TargetSide.EnemyHero then
return ai.aroundEnemyHeroes
end
if side == TargetSide.EnemyCreep then
return ai.aroundEnemyCreeps
end
if side == TargetSide.EnemyBuilding then
return ai.aroundEnemyBuildings
end
if side == TargetSide.FriendlyHero then
return ai.aroundFriendlyHeroes
end
if side == TargetSide.FriendlyBuilding then
return ai.aroundFriendlyBuildings
end
return {}
end
return ____exports
