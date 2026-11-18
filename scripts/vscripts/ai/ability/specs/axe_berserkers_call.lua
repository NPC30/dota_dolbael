local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "axe_berserkers_call", targetSide = TargetSide.EnemyHero, condition = {target = {unitCondition = {notActionable = true}, rangeFromAbilityValue = "radius", ignoresMagicImmune = true}}}}
return ____exports
