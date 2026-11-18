local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "axe_culling_blade", targetSide = TargetSide.EnemyHero, condition = {target = {unitCondition = {healthAbilityValue = {key = "damage", lte = true, includeSpellAmp = true}}}}}}
return ____exports
