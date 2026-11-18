local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "winter_wyvern_arctic_burn", targetSide = TargetSide.EnemyHero, condition = {self = {unitCondition = {hasScepter = true}}, target = {range = {lte = 1800}}, action = {toggleOn = true}}}, {abilityName = "winter_wyvern_arctic_burn", targetSide = TargetSide.Self, condition = {self = {unitCondition = {hasScepter = true}, noEnemyHeroInRange = 1800}, action = {toggleOff = true}}}}
return ____exports
