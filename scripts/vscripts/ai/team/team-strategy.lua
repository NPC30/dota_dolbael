local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/team/team-strategy.lua"
__TS__SourceMapTraceBack("ai/team/team-strategy.lua", {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["16"] = 4,["17"] = 5,["18"] = 3,["19"] = 11,["20"] = 12,["23"] = 16,["24"] = 17,["25"] = 17,["26"] = 17,["27"] = 18,["28"] = 17,["29"] = 17,["30"] = 11,["31"] = 22,["32"] = 22,["33"] = 26,["34"] = 27,["35"] = 26,["36"] = 30,["37"] = 31,["38"] = 30,["39"] = 34,["40"] = 35,["41"] = 34,["42"] = 4,["43"] = 3,["44"] = 4,["46"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.TeamStrategy = __TS__Class()
local TeamStrategy = ____exports.TeamStrategy
TeamStrategy.name = "TeamStrategy"
__TS__ClassExtends(TeamStrategy, BaseModifier)
function TeamStrategy.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.ThinkInterval = 2
end
function TeamStrategy.prototype.OnCreated(self)
    if IsClient() then
        return
    end
    local delay = 1
    Timers:CreateTimer(
        delay,
        function()
            self:StartIntervalThink(self.ThinkInterval)
        end
    )
end
function TeamStrategy.prototype.OnIntervalThink(self)
end
function TeamStrategy.prototype.IsPurgable(self)
    return false
end
function TeamStrategy.prototype.RemoveOnDeath(self)
    return false
end
function TeamStrategy.prototype.IsHidden(self)
    return true
end
TeamStrategy = __TS__DecorateLegacy(
    {registerModifier(nil)},
    TeamStrategy
)
____exports.TeamStrategy = TeamStrategy
return ____exports
