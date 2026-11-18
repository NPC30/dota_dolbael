local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modifiers/hero/dragon-knight.lua"
__TS__SourceMapTraceBack("modifiers/hero/dragon-knight.lua", {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 4,["25"] = 3,["26"] = 4,["28"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_dragon_knight_dragon_tail_intrinsic = __TS__Class()
local modifier_dragon_knight_dragon_tail_intrinsic = ____exports.modifier_dragon_knight_dragon_tail_intrinsic
modifier_dragon_knight_dragon_tail_intrinsic.name = "modifier_dragon_knight_dragon_tail_intrinsic"
__TS__ClassExtends(modifier_dragon_knight_dragon_tail_intrinsic, BaseModifier)
function modifier_dragon_knight_dragon_tail_intrinsic.prototype.IsHidden(self)
    return true
end
function modifier_dragon_knight_dragon_tail_intrinsic.prototype.IsPurgable(self)
    return false
end
function modifier_dragon_knight_dragon_tail_intrinsic.prototype.RemoveOnDeath(self)
    return false
end
modifier_dragon_knight_dragon_tail_intrinsic = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_dragon_knight_dragon_tail_intrinsic")},
    modifier_dragon_knight_dragon_tail_intrinsic
)
____exports.modifier_dragon_knight_dragon_tail_intrinsic = modifier_dragon_knight_dragon_tail_intrinsic
return ____exports
