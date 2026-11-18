local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "dragon_knight_breathe_fire", targetSide = TargetSide.EnemyHero}, {abilityName = "dragon_knight_breathe_fire", targetSide = TargetSide.EnemyCreep, condition = {target = {count = {gte = 2}}}}}
return ____exports
