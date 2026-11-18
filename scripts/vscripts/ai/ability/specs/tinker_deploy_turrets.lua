local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "tinker_deploy_turrets", targetSide = TargetSide.EnemyHero, condition = {target = {range = {lte = 1800}, castMode = "projectedOnCastRange"}}}}
return ____exports
