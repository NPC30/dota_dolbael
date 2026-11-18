local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "jakiro_dual_breath", targetSide = TargetSide.EnemyHero}, {abilityName = "jakiro_dual_breath", targetSide = TargetSide.EnemyCreep, condition = {target = {count = {gte = 2}}}}}
return ____exports
