local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "items/ts_items/base_item_modifier.lua"
__TS__SourceMapTraceBack("items/ts_items/base_item_modifier.lua", {["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 3,["13"] = 3,["14"] = 14,["15"] = 15,["16"] = 16,["17"] = 17,["19"] = 14,["20"] = 21,["21"] = 22,["22"] = 23,["24"] = 21,["25"] = 27,["26"] = 28,["27"] = 29,["29"] = 27,["30"] = 33,["31"] = 34,["32"] = 35,["34"] = 33,["35"] = 39,["36"] = 40,["37"] = 39,["38"] = 43,["39"] = 44,["40"] = 43,["41"] = 47,["42"] = 48,["43"] = 47,["44"] = 51,["45"] = 52,["46"] = 51,["47"] = 55,["48"] = 56,["49"] = 55,["50"] = 59,["51"] = 60,["52"] = 59});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
____exports.BaseItemModifier = __TS__Class()
local BaseItemModifier = ____exports.BaseItemModifier
BaseItemModifier.name = "BaseItemModifier"
__TS__ClassExtends(BaseItemModifier, BaseModifier)
function BaseItemModifier.prototype.RefreshStatsModifier(self)
    if self.statsModifierName and __TS__StringTrim(self.statsModifierName) ~= "" then
        local item = self:GetAbility()
        RefreshItemDataDrivenModifier(nil, item, self.statsModifierName)
    end
end
function BaseItemModifier.prototype.OnCreated(self)
    if IsServer() then
        self:RefreshStatsModifier()
    end
end
function BaseItemModifier.prototype.OnRefresh(self)
    if IsServer() then
        self:RefreshStatsModifier()
    end
end
function BaseItemModifier.prototype.OnDestroy(self)
    if IsServer() then
        self:RefreshStatsModifier()
    end
end
function BaseItemModifier.prototype.IsHidden(self)
    return true
end
function BaseItemModifier.prototype.IsPurgable(self)
    return false
end
function BaseItemModifier.prototype.IsPurgeException(self)
    return false
end
function BaseItemModifier.prototype.AllowIllusionDuplicate(self)
    return false
end
function BaseItemModifier.prototype.RemoveOnDeath(self)
    return false
end
function BaseItemModifier.prototype.GetAttributes(self)
    return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
return ____exports
