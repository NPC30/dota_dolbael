local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/mode/mode-push.lua"
__TS__SourceMapTraceBack("ai/mode/mode-push.lua", {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 6,["14"] = 6,["15"] = 6,["16"] = 6,["18"] = 6,["19"] = 7,["20"] = 6,["21"] = 9,["22"] = 11,["23"] = 12,["24"] = 14,["25"] = 16,["26"] = 17,["27"] = 18,["28"] = 19,["30"] = 22,["31"] = 23,["32"] = 24,["33"] = 25,["34"] = 26,["35"] = 27,["36"] = 28,["38"] = 30,["39"] = 31,["40"] = 32,["43"] = 36,["44"] = 41,["45"] = 9});
local ____exports = {}
local ____bot_2Dpush_2Dtiming = require("ai.bot-push-timing")
local BotPushTiming = ____bot_2Dpush_2Dtiming.BotPushTiming
local ____mode_2Dbase = require("ai.mode.mode-base")
local ModeBase = ____mode_2Dbase.ModeBase
local ____mode_2Denum = require("ai.mode.mode-enum")
local ModeEnum = ____mode_2Denum.ModeEnum
____exports.ModePush = __TS__Class()
local ModePush = ____exports.ModePush
ModePush.name = "ModePush"
__TS__ClassExtends(ModePush, ModeBase)
function ModePush.prototype.____constructor(self, ...)
    ModeBase.prototype.____constructor(self, ...)
    self.mode = ModeEnum.PUSH
end
function ModePush.prototype.GetDesire(self, heroAI)
    local currentTime = heroAI.gameTime
    local desire = 0
    desire = math.floor(currentTime / 60) * 0.03
    local heroLevel = heroAI:GetHero():GetLevel()
    if heroLevel >= heroAI.PushLevel then
        desire = desire + 0.5
        desire = desire + 0.01 * (heroLevel - heroAI.PushLevel)
    end
    local pid = heroAI:GetHero():GetPlayerOwnerID()
    if PlayerResource:IsValidPlayerID(pid) and PlayerResource:IsFakeClient(pid) then
        desire = desire + 0.32
        desire = math.max(desire, 0.58)
        if BotPushTiming:isAfterPhaseStart(currentTime) then
            desire = desire + 0.2
            desire = math.max(desire, 0.72)
        end
        if GameRules.Option.midOnlyMode and not GameRules.Option.abyssMode then
            desire = desire + 0.08
            desire = math.max(desire, 0.8)
        end
    end
    desire = math.min(desire, GameRules.Option.midOnlyMode and not GameRules.Option.abyssMode and 0.86 or 0.75)
    return desire
end
return ____exports
