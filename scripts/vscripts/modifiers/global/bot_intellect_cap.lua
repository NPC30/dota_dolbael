local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack("?", {["8"] = 1,["9"] = 1,["10"] = 1,["13"] = 7,["14"] = 8,["15"] = 7,["16"] = 8,["17"] = 9,["18"] = 10,["19"] = 9,["20"] = 13,["21"] = 14,["22"] = 13,["23"] = 17,["24"] = 18,["25"] = 17,["26"] = 21,["27"] = 22,["28"] = 21,["29"] = 25,["30"] = 26,["31"] = 25,["32"] = 29,["33"] = 30,["34"] = 29,["35"] = 34,["36"] = 35,["37"] = 34,["38"] = 8,["39"] = 7,["40"] = 8,["42"] = 8});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_bot_intellect_cap = __TS__Class()
local modifier_bot_intellect_cap = ____exports.modifier_bot_intellect_cap
modifier_bot_intellect_cap.name = "modifier_bot_intellect_cap"
__TS__ClassExtends(modifier_bot_intellect_cap, BaseModifier)
function modifier_bot_intellect_cap.prototype.IsHidden(self)
return true
end
function modifier_bot_intellect_cap.prototype.IsPurgable(self)
return false
end
function modifier_bot_intellect_cap.prototype.IsPurgeException(self)
return false
end
function modifier_bot_intellect_cap.prototype.IsDebuff(self)
return false
end
function modifier_bot_intellect_cap.prototype.RemoveOnDeath(self)
return false
end
function modifier_bot_intellect_cap.prototype.DeclareFunctions(self)
return {MODIFIER_PROPERTY_STATS_INTELLECT_BONUS}
end
function modifier_bot_intellect_cap.prototype.GetModifierBonusStats_Intellect(self)
return -self:GetStackCount()
end
modifier_bot_intellect_cap = __TS__DecorateLegacy(
{registerModifier(nil)},
modifier_bot_intellect_cap
)
____exports.modifier_bot_intellect_cap = modifier_bot_intellect_cap
return ____exports
