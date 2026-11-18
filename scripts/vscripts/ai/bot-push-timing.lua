local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/bot-push-timing.lua"
__TS__SourceMapTraceBack("ai/bot-push-timing.lua", {["7"] = 1,["8"] = 1,["11"] = 7,["12"] = 8,["13"] = 7,["15"] = 7,["16"] = 14,["17"] = 16,["18"] = 17,["20"] = 19,["21"] = 20,["23"] = 22,["24"] = 14,["25"] = 26,["26"] = 27,["27"] = 26,["28"] = 30,["29"] = 31,["30"] = 30,["31"] = 11,["32"] = 12,["33"] = 7,["34"] = 8});
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
--- Bot 抱团推进阶段时间。
-- 到达该游戏时间后，FSA 侧视为「抱团推进阶段」，用于拉高 PUSH/ATTACK、压低 LANING。
____exports.BotPushTiming = __TS__Class()
local BotPushTiming = ____exports.BotPushTiming
BotPushTiming.name = "BotPushTiming"
function BotPushTiming.prototype.____constructor(self)
end
function BotPushTiming.getPhaseStartMinutes(self)
    if GameRules.Option.abyssMode then
        return 0
    end
    if GameRules.Option.midOnlyMode and not GameRules.Option.abyssMode then
        return self.midOnlyPhaseStartMinutes
    end
    return self.normalPhaseStartMinutes
end
function BotPushTiming.getPhaseStartGameSeconds(self)
    return self:getPhaseStartMinutes() * 60
end
function BotPushTiming.isAfterPhaseStart(self, gameTimeSeconds)
    return gameTimeSeconds >= self:getPhaseStartGameSeconds()
end
BotPushTiming.midOnlyPhaseStartMinutes = 1.5
BotPushTiming.normalPhaseStartMinutes = 5
BotPushTiming = __TS__DecorateLegacy({reloadable}, BotPushTiming)
____exports.BotPushTiming = BotPushTiming
return ____exports
