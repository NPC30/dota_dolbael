local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/mode/FSA.lua"
__TS__SourceMapTraceBack("ai/mode/FSA.lua", {["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 8,["19"] = 8,["20"] = 10,["21"] = 10,["22"] = 11,["23"] = 11,["24"] = 13,["25"] = 14,["26"] = 13,["28"] = 22,["29"] = 26,["30"] = 26,["31"] = 27,["32"] = 27,["33"] = 28,["34"] = 28,["35"] = 29,["36"] = 29,["37"] = 30,["38"] = 30,["39"] = 31,["40"] = 31,["41"] = 25,["42"] = 35,["43"] = 36,["44"] = 37,["45"] = 38,["46"] = 39,["47"] = 40,["50"] = 44,["51"] = 45,["52"] = 46,["53"] = 47,["54"] = 48,["55"] = 49,["56"] = 50,["57"] = 51,["60"] = 55,["61"] = 56,["63"] = 61,["65"] = 63,["67"] = 35,["68"] = 16,["69"] = 19,["70"] = 20,["71"] = 13,["72"] = 14});
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____mode_2Dattack = require("ai.mode.mode-attack")
local ModeAttack = ____mode_2Dattack.ModeAttack
local ____mode_2Denum = require("ai.mode.mode-enum")
local ModeEnum = ____mode_2Denum.ModeEnum
local ____mode_2Dlaning = require("ai.mode.mode-laning")
local ModeLaning = ____mode_2Dlaning.ModeLaning
local ____mode_2Dpush = require("ai.mode.mode-push")
local ModePush = ____mode_2Dpush.ModePush
local ____mode_2Dretreat = require("ai.mode.mode-retreat")
local ModeRetreat = ____mode_2Dretreat.ModeRetreat
local ____mode_2Dassassin = require("ai.mode.mode-assassin")
local ModeAssassin = ____mode_2Dassassin.ModeAssassin
local ____mode_2Dsplit_2Dpush = require("ai.mode.mode-split-push")
local ModeSplitPush = ____mode_2Dsplit_2Dpush.ModeSplitPush
____exports.FSA = __TS__Class()
local FSA = ____exports.FSA
FSA.name = "FSA"
function FSA.prototype.____constructor(self)
    self.ModeList = {}
    local ____self_ModeList_0 = self.ModeList
    ____self_ModeList_0[#____self_ModeList_0 + 1] = __TS__New(ModeLaning)
    local ____self_ModeList_1 = self.ModeList
    ____self_ModeList_1[#____self_ModeList_1 + 1] = __TS__New(ModeAttack)
    local ____self_ModeList_2 = self.ModeList
    ____self_ModeList_2[#____self_ModeList_2 + 1] = __TS__New(ModeRetreat)
    local ____self_ModeList_3 = self.ModeList
    ____self_ModeList_3[#____self_ModeList_3 + 1] = __TS__New(ModePush)
    local ____self_ModeList_4 = self.ModeList
    ____self_ModeList_4[#____self_ModeList_4 + 1] = __TS__New(ModeSplitPush)
    local ____self_ModeList_5 = self.ModeList
    ____self_ModeList_5[#____self_ModeList_5 + 1] = __TS__New(ModeAssassin)
end
function FSA.prototype.GetMode(self, heroAI)
    local hero = heroAI:GetHero()
    local pid = hero:GetPlayerOwnerID()
    if PlayerResource:IsValidPlayerID(pid) and PlayerResource:IsFakeClient(pid) then
        if not hero.isAbyssBot and hero:GetHealth() < heroAI:GetRetreatHealthThreshold() then
            return ModeEnum.RETREAT
        end
    end
    local currentMode = heroAI.mode
    local maxDesire = 0
    local desireMode
    for ____, mode in ipairs(self.ModeList) do
        local desire = mode:GetDesire(heroAI)
        if desire > maxDesire then
            maxDesire = desire
            desireMode = mode.mode
        end
    end
    if maxDesire >= ____exports.FSA.MODE_SWITCH_THRESHOLD then
        if desireMode ~= currentMode then
        end
        return desireMode
    else
        return currentMode
    end
end
FSA.MODE_SWITCH_THRESHOLD = 0.5
FSA.BOT_RETREAT_HP_PERCENT = 25
FSA.BOT_TOWER_TARGET_RETREAT_BONUS_HEALTH = 2000
FSA = __TS__DecorateLegacy({reloadable}, FSA)
____exports.FSA = FSA
return ____exports
