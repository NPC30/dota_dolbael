local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "lich_frost_shield", targetSide = TargetSide.FriendlyHero, condition = {target = {unitCondition = {healthPercent = {lte = 90}, noModifier = "modifier_lich_frost_shield"}}}}, {abilityName = "lich_frost_shield", targetSide = TargetSide.FriendlyBuilding, condition = {target = {unitCondition = {noModifier = "modifier_lich_frost_shield"}}}}}
return ____exports
