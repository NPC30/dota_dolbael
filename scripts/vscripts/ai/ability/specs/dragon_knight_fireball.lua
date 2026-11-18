local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "dragon_knight_fireball", targetSide = TargetSide.EnemyHero, condition = {self = {unitCondition = {hasShard = true}}}}, {abilityName = "dragon_knight_fireball", targetSide = TargetSide.EnemyCreep, condition = {self = {unitCondition = {hasShard = true}}, target = {count = {gte = 2}}, ability = {level = {gte = 1}}}}}
return ____exports
