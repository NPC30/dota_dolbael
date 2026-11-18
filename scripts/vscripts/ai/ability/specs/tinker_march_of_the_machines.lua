local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "tinker_march_of_the_machines", targetSide = TargetSide.EnemyHero, condition = {target = {range = {lte = 900}, castMode = "projectedOnCastRange"}}}, {abilityName = "tinker_march_of_the_machines", targetSide = TargetSide.EnemyCreep, condition = {target = {count = {gte = 2}, range = {lte = 900}, castMode = "projectedOnCastRange"}, ability = {level = {gte = 1}}}}}
return ____exports
