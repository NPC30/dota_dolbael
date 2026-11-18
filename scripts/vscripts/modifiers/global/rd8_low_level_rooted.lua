local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modifiers/global/rd8_low_level_rooted.lua"
__TS__SourceMapTraceBack("modifiers/global/rd8_low_level_rooted.lua", {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 13,["22"] = 14,["23"] = 13,["24"] = 17,["25"] = 18,["26"] = 17,["27"] = 21,["28"] = 22,["29"] = 21,["30"] = 25,["31"] = 26,["32"] = 25,["33"] = 29,["34"] = 30,["35"] = 29,["36"] = 33,["37"] = 34,["38"] = 33,["39"] = 37,["40"] = 38,["41"] = 37,["42"] = 41,["43"] = 42,["44"] = 41,["45"] = 45,["46"] = 46,["47"] = 45,["48"] = 51,["49"] = 52,["52"] = 54,["53"] = 55,["56"] = 57,["57"] = 58,["58"] = 59,["60"] = 51,["61"] = 4,["62"] = 3,["63"] = 4,["65"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_rd8_low_level_rooted = __TS__Class()
local modifier_rd8_low_level_rooted = ____exports.modifier_rd8_low_level_rooted
modifier_rd8_low_level_rooted.name = "modifier_rd8_low_level_rooted"
__TS__ClassExtends(modifier_rd8_low_level_rooted, BaseModifier)
function modifier_rd8_low_level_rooted.prototype.OnCreated(self)
    self:ApplyRestrictionImmediately()
end
function modifier_rd8_low_level_rooted.prototype.OnRefresh(self)
    self:ApplyRestrictionImmediately()
end
function modifier_rd8_low_level_rooted.prototype.IsHidden(self)
    return false
end
function modifier_rd8_low_level_rooted.prototype.IsDebuff(self)
    return true
end
function modifier_rd8_low_level_rooted.prototype.IsPurgable(self)
    return false
end
function modifier_rd8_low_level_rooted.prototype.IsPurgeException(self)
    return false
end
function modifier_rd8_low_level_rooted.prototype.RemoveOnDeath(self)
    return false
end
function modifier_rd8_low_level_rooted.prototype.GetTexture(self)
    return "rooted"
end
function modifier_rd8_low_level_rooted.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE}
end
function modifier_rd8_low_level_rooted.prototype.GetModifierMoveSpeed_Absolute(self)
    return 0
end
function modifier_rd8_low_level_rooted.prototype.CheckState(self)
    return {[MODIFIER_STATE_ROOTED] = true}
end
function modifier_rd8_low_level_rooted.prototype.ApplyRestrictionImmediately(self)
    if IsClient() then
        return
    end
    local parent = self:GetParent()
    if not parent or parent:IsNull() then
        return
    end
    parent:Stop()
    if parent:IsRealHero() then
        parent:CalculateStatBonus(true)
    end
end
modifier_rd8_low_level_rooted = __TS__DecorateLegacy(
    {registerModifier(nil)},
    modifier_rd8_low_level_rooted
)
____exports.modifier_rd8_low_level_rooted = modifier_rd8_low_level_rooted
return ____exports
