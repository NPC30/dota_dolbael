local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "lion_finger_of_death", targetSide = TargetSide.EnemyHero, condition = {target = {unitCondition = {healthPercent = {lte = 95}}}}}}
return ____exports
