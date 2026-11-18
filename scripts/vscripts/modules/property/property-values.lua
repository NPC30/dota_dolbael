local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/property/property-values.lua"
__TS__SourceMapTraceBack("modules/property/property-values.lua", {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 11,["13"] = 12,["14"] = 11});
local ____exports = {}
____exports.PLAYER_PROPERTY_VALUE_PER_LEVEL = {
    property_attack_damage_pct = 10,
    property_strength_bonus_pct = 4,
    property_agility_bonus_pct = 4,
    property_intellect_bonus_pct = 4,
    property_pure_damage_reduction = 11
}
function ____exports.getPropertyValue(self, name, level)
    return ____exports.PLAYER_PROPERTY_VALUE_PER_LEVEL[name] * level
end
return ____exports
