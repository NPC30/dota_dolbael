local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "medusa_split_shot", targetSide = TargetSide.EnemyHero, condition = {target = {count = {gte = 2}, range = {lte = 900}}, ability = {level = {gte = 2}}, action = {toggleOn = true}}}, {abilityName = "medusa_split_shot", targetSide = TargetSide.EnemyHero, condition = {target = {count = {lte = 1}, range = {lte = 900}}, ability = {level = {gte = 1, lte = 3}}, action = {toggleOff = true}}}, {abilityName = "medusa_split_shot", targetSide = TargetSide.EnemyCreep, condition = {target = {count = {gte = 3}, range = {lte = 900}}, ability = {level = {gte = 2}}, action = {toggleOn = true}}}, {abilityName = "medusa_split_shot", targetSide = TargetSide.EnemyCreep, condition = {target = {count = {lte = 1}, range = {lte = 900}}, ability = {level = {gte = 1, lte = 3}}, action = {toggleOff = true}}}}
return ____exports
