local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/mode/mode-attack.lua"
__TS__SourceMapTraceBack("ai/mode/mode-attack.lua", {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 7,["16"] = 7,["17"] = 7,["18"] = 7,["20"] = 7,["21"] = 8,["22"] = 7,["23"] = 10,["24"] = 11,["25"] = 12,["26"] = 14,["27"] = 15,["28"] = 16,["29"] = 19,["30"] = 20,["33"] = 26,["34"] = 27,["36"] = 29,["37"] = 30,["39"] = 32,["40"] = 33,["42"] = 35,["43"] = 36,["45"] = 39,["46"] = 41,["47"] = 45,["48"] = 46,["49"] = 47,["51"] = 49,["52"] = 50,["55"] = 54,["56"] = 58,["57"] = 10,["58"] = 61,["59"] = 62,["60"] = 63,["61"] = 64,["63"] = 66,["64"] = 67,["65"] = 68,["66"] = 69,["67"] = 70,["69"] = 73,["70"] = 73,["71"] = 73,["72"] = 73,["73"] = 77,["74"] = 78,["77"] = 81,["78"] = 61});
local ____exports = {}
local ____bot_2Dpush_2Dtiming = require("ai.bot-push-timing")
local BotPushTiming = ____bot_2Dpush_2Dtiming.BotPushTiming
local ____hero_2Dutil = require("ai.hero.hero-util")
local HeroUtil = ____hero_2Dutil.HeroUtil
local ____mode_2Dbase = require("ai.mode.mode-base")
local ModeBase = ____mode_2Dbase.ModeBase
local ____mode_2Denum = require("ai.mode.mode-enum")
local ModeEnum = ____mode_2Denum.ModeEnum
____exports.ModeAttack = __TS__Class()
local ModeAttack = ____exports.ModeAttack
ModeAttack.name = "ModeAttack"
__TS__ClassExtends(ModeAttack, ModeBase)
function ModeAttack.prototype.____constructor(self, ...)
    ModeBase.prototype.____constructor(self, ...)
    self.mode = ModeEnum.ATTACK
end
function ModeAttack.prototype.GetDesire(self, heroAI)
    local desire = 0
    local hero = heroAI:GetHero()
    if hero.isBoss then
        local bossLevel = hero:GetLevel()
        local targetLevel = 30
        if bossLevel < targetLevel then
            desire = desire - 0.3
        end
    end
    if heroAI.mode == ModeEnum.RETREAT then
        desire = desire - 0.4
    end
    if heroAI.mode == ModeEnum.LANING then
        desire = desire - 0.1
    end
    if heroAI.mode == ModeEnum.PUSH then
        desire = desire + 0.1
    end
    if heroAI.mode == ModeEnum.ATTACK then
        desire = desire + 0.1
    end
    local pid = hero:GetPlayerOwnerID()
    if PlayerResource:IsValidPlayerID(pid) and PlayerResource:IsFakeClient(pid) and BotPushTiming:isAfterPhaseStart(heroAI.gameTime) then
        desire = desire + 0.52
        if #heroAI.aroundEnemyHeroes > 0 then
            desire = desire + 0.26
        end
        if GameRules.Option.midOnlyMode and not GameRules.Option.abyssMode then
            desire = desire + 0.1
        end
    end
    desire = math.min(desire, GameRules.Option.midOnlyMode and not GameRules.Option.abyssMode and 0.94 or 0.88)
    return desire
end
function ModeAttack.prototype.HasEnemyNotNearTower(self, heroAI)
    local nearestHero = heroAI:FindNearestEnemyHero()
    if not nearestHero then
        return false
    end
    local nearestTower = heroAI:FindNearestEnemyTowerInvulnerable()
    if nearestTower then
        local isNearestHeroInTowerRange = HeroUtil:IsInAttackRange(nearestTower, nearestHero)
        if isNearestHeroInTowerRange then
            return false
        end
        local distanceToTowerRange = HeroUtil:GetDistanceToAttackRange(
            nearestTower,
            heroAI:GetHero()
        )
        if distanceToTowerRange < 400 then
            return false
        end
    end
    return true
end
return ____exports
