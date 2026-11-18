local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modifiers/hero/vanilla-ability-stubs.lua"
__TS__SourceMapTraceBack("modifiers/hero/vanilla-ability-stubs.lua", {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 8,["18"] = 9,["19"] = 8,["20"] = 12,["21"] = 13,["22"] = 12,["23"] = 17,["24"] = 18,["25"] = 17,["26"] = 18,["27"] = 18,["28"] = 17,["29"] = 18,["31"] = 18,["32"] = 20,["33"] = 21,["34"] = 20,["35"] = 21,["36"] = 21,["37"] = 20,["38"] = 21,["40"] = 21});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local HiddenUnpurgableModifier = __TS__Class()
HiddenUnpurgableModifier.name = "HiddenUnpurgableModifier"
__TS__ClassExtends(HiddenUnpurgableModifier, BaseModifier)
function HiddenUnpurgableModifier.prototype.IsHidden(self)
    return true
end
function HiddenUnpurgableModifier.prototype.IsPurgable(self)
    return false
end
function HiddenUnpurgableModifier.prototype.RemoveOnDeath(self)
    return false
end
____exports.modifier_skywrath_mage_arcane_bolt = __TS__Class()
local modifier_skywrath_mage_arcane_bolt = ____exports.modifier_skywrath_mage_arcane_bolt
modifier_skywrath_mage_arcane_bolt.name = "modifier_skywrath_mage_arcane_bolt"
__TS__ClassExtends(modifier_skywrath_mage_arcane_bolt, HiddenUnpurgableModifier)
modifier_skywrath_mage_arcane_bolt = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_skywrath_mage_arcane_bolt")},
    modifier_skywrath_mage_arcane_bolt
)
____exports.modifier_skywrath_mage_arcane_bolt = modifier_skywrath_mage_arcane_bolt
____exports.modifier_lina_dragon_slave_burn = __TS__Class()
local modifier_lina_dragon_slave_burn = ____exports.modifier_lina_dragon_slave_burn
modifier_lina_dragon_slave_burn.name = "modifier_lina_dragon_slave_burn"
__TS__ClassExtends(modifier_lina_dragon_slave_burn, HiddenUnpurgableModifier)
modifier_lina_dragon_slave_burn = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_lina_dragon_slave_burn")},
    modifier_lina_dragon_slave_burn
)
____exports.modifier_lina_dragon_slave_burn = modifier_lina_dragon_slave_burn
return ____exports
