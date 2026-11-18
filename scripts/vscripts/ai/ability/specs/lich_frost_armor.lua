local ____exports = {}
local ____ability_2Dspec = require("ai.ability.ability-spec")
local TargetSide = ____ability_2Dspec.TargetSide
____exports.SPECS = {{abilityName = "lich_frost_armor", targetSide = TargetSide.FriendlyHero, condition = {target = {unitCondition = {noModifier = "modifier_lich_frost_armor"}}}}}
return ____exports
