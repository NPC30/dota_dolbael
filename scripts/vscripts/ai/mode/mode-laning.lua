local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/mode/mode-laning.lua"
__TS__SourceMapTraceBack("ai/mode/mode-laning.lua", {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 6,["14"] = 6,["15"] = 6,["16"] = 6,["18"] = 6,["19"] = 7,["20"] = 6,["21"] = 9,["22"] = 10,["23"] = 12,["24"] = 13,["25"] = 14,["27"] = 18,["28"] = 19,["29"] = 20,["30"] = 23,["31"] = 24,["33"] = 30,["34"] = 31,["35"] = 32,["37"] = 35,["38"] = 36,["40"] = 39,["41"] = 41,["42"] = 45,["43"] = 46,["45"] = 49,["46"] = 50,["47"] = 51,["48"] = 9});
local ____exports = {}
local ____bot_2Dpush_2Dtiming = require("ai.bot-push-timing")
local BotPushTiming = ____bot_2Dpush_2Dtiming.BotPushTiming
local ____mode_2Dbase = require("ai.mode.mode-base")
local ModeBase = ____mode_2Dbase.ModeBase
local ____mode_2Denum = require("ai.mode.mode-enum")
local ModeEnum = ____mode_2Denum.ModeEnum
____exports.ModeLaning = __TS__Class()
local ModeLaning = ____exports.ModeLaning
ModeLaning.name = "ModeLaning"
__TS__ClassExtends(ModeLaning, ModeBase)
function ModeLaning.prototype.____constructor(self, ...)
    ModeBase.prototype.____constructor(self, ...)
    self.mode = ModeEnum.LANING
end
function ModeLaning.prototype.GetDesire(self, heroAI)
    local desire = 0
    local hero = heroAI:GetHero()
    if hero.isAbyssBot then
        return 0
    end
    if hero.isBoss then
        local bossLevel = hero:GetLevel()
        local targetLevel = 30
        if bossLevel < targetLevel then
            desire = desire + 0.55
        end
        desire = math.min(desire, 0.7)
        desire = math.max(desire, 0)
        return desire
    end
    if heroAI:GetHero():GetLevel() < heroAI.PushLevel then
        desire = desire + 0.55
    end
    local pid = hero:GetPlayerOwnerID()
    if PlayerResource:IsValidPlayerID(pid) and PlayerResource:IsFakeClient(pid) and BotPushTiming:isAfterPhaseStart(heroAI.gameTime) then
        desire = desire * 0.08
        desire = math.min(desire, 0.08)
    end
    desire = math.min(desire, 0.7)
    desire = math.max(desire, 0)
    return desire
end
return ____exports
