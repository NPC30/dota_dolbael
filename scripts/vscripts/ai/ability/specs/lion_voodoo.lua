local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "lion_voodoo", targetSide = TargetSide.EnemyHero, condition = {target = {unitCondition = {notActionable = true}}}}}
return ____exports
