local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "silencer_glaives_of_wisdom", targetSide = TargetSide.Self, condition = {ability = {level = {gte = 2}}, action = {autoCastOn = true}}}}
return ____exports
