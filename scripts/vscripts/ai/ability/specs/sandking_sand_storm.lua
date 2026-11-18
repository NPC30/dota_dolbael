local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "sandking_sand_storm", targetSide = TargetSide.EnemyHero, condition = {target = {rangeFromAbilityValue = "sand_storm_radius"}}}, {abilityName = "sandking_sand_storm", targetSide = TargetSide.EnemyCreep, condition = {target = {count = {gte = 3}, rangeFromAbilityValue = "sand_storm_radius"}}}}
return ____exports
