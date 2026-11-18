local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "lich_frost_nova", targetSide = TargetSide.EnemyHero, condition = {ability = {level = {gte = 2}}}}, {abilityName = "lich_frost_nova", targetSide = TargetSide.EnemyCreep, condition = {target = {count = {gte = 2}}}}}
return ____exports
