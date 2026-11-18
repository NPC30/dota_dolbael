local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "lion_mana_drain", targetSide = TargetSide.EnemyHero, condition = {self = {noEnemyHeroInRange = 300, unitCondition = {manaPercent = {lte = 40}}}, target = {unitCondition = {manaPercent = {gte = 30}}}}}, {abilityName = "lion_mana_drain", targetSide = TargetSide.EnemyCreep, condition = {self = {unitCondition = {manaPercent = {lte = 60}}}, target = {unitCondition = {manaPercent = {gte = 50}}}, ability = {level = {gte = 1}}}}}
return ____exports
