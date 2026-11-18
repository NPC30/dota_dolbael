local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "omniknight_purification", targetSide = TargetSide.FriendlyHero, condition = {target = {unitCondition = {healthPercent = {lte = 70}}}}}}
return ____exports
