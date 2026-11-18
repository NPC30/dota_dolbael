local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "shadow_shaman_urnaconda", targetSide = TargetSide.EnemyHero, condition = {target = {count = {gte = 2}}}}, {abilityName = "shadow_shaman_urnaconda", targetSide = TargetSide.EnemyBuilding, condition = {self = {noEnemyHeroInRange = 1200, friendlyCreepNearby = {count = {gte = 3}}}}}}
return ____exports
