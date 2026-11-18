local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "sandking_scorpion_strike", targetSide = TargetSide.EnemyCreep, condition = {target = {count = {gte = 2}}}}}
return ____exports
