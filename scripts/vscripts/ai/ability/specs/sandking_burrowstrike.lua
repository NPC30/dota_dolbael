local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "sandking_burrowstrike", targetSide = TargetSide.EnemyHero, condition = {self = {unitCondition = {healthPercent = {gte = 20}}}}}, {abilityName = "sandking_burrowstrike", targetSide = TargetSide.EnemyCreep, condition = {target = {count = {gte = 2}}}}}
return ____exports
