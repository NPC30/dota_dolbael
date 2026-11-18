local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/mode/mode-split-push.lua"
__TS__SourceMapTraceBack("ai/mode/mode-split-push.lua", {["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 6,["16"] = 6,["17"] = 6,["19"] = 6,["20"] = 7,["21"] = 9,["22"] = 9,["23"] = 9,["24"] = 9,["25"] = 9,["26"] = 9,["27"] = 9,["28"] = 9,["29"] = 9,["30"] = 9,["31"] = 9,["32"] = 9,["33"] = 6,["34"] = 22,["35"] = 23,["36"] = 24,["37"] = 26,["38"] = 30,["40"] = 33,["41"] = 36,["42"] = 37,["44"] = 41,["45"] = 42,["46"] = 43,["48"] = 47,["49"] = 48,["50"] = 49,["52"] = 52,["53"] = 55,["54"] = 58,["55"] = 61,["56"] = 62,["58"] = 66,["59"] = 67,["60"] = 68,["61"] = 69,["62"] = 70,["64"] = 74,["65"] = 75,["66"] = 76,["67"] = 77,["68"] = 79,["69"] = 80,["70"] = 82,["73"] = 87,["74"] = 88,["75"] = 89,["76"] = 90,["77"] = 92,["79"] = 96,["80"] = 97,["81"] = 98,["82"] = 101,["83"] = 102,["86"] = 107,["87"] = 108,["88"] = 110,["90"] = 113,["91"] = 113,["92"] = 113,["93"] = 113,["94"] = 22,["95"] = 116,["96"] = 117,["98"] = 118,["99"] = 118,["100"] = 119,["101"] = 120,["102"] = 121,["103"] = 122,["104"] = 123,["105"] = 124,["109"] = 118,["112"] = 129,["113"] = 116});
local ____exports = {}
local ____bot_2Dpush_2Dtiming = require("ai.bot-push-timing")
local BotPushTiming = ____bot_2Dpush_2Dtiming.BotPushTiming
local ____mode_2Dbase = require("ai.mode.mode-base")
local ModeBase = ____mode_2Dbase.ModeBase
local ____mode_2Denum = require("ai.mode.mode-enum")
local ModeEnum = ____mode_2Denum.ModeEnum
____exports.ModeSplitPush = __TS__Class()
local ModeSplitPush = ____exports.ModeSplitPush
ModeSplitPush.name = "ModeSplitPush"
__TS__ClassExtends(ModeSplitPush, ModeBase)
function ModeSplitPush.prototype.____constructor(self, ...)
    ModeBase.prototype.____constructor(self, ...)
    self.mode = ModeEnum.SPLIT_PUSH
    self.splitPushHeroes = {
        "npc_dota_hero_death_prophet",
        "npc_dota_hero_dragon_knight",
        "npc_dota_hero_juggernaut",
        "npc_dota_hero_luna",
        "npc_dota_hero_medusa",
        "npc_dota_hero_sniper",
        "npc_dota_hero_drow_ranger",
        "npc_dota_hero_tinker",
        "npc_dota_hero_windrunner",
        "npc_dota_hero_bristleback"
    }
end
function ModeSplitPush.prototype.GetDesire(self, heroAI)
    local hero = heroAI:GetHero()
    local pid = hero:GetPlayerOwnerID()
    if PlayerResource:IsValidPlayerID(pid) and PlayerResource:IsFakeClient(pid) and BotPushTiming:isAfterPhaseStart(heroAI.gameTime) then
        return 0
    end
    local heroName = hero:GetUnitName()
    if not __TS__ArrayIncludes(self.splitPushHeroes, heroName) and not hero.isBoss then
        return 0
    end
    local heroLevel = hero:GetLevel()
    if heroLevel < 20 then
        return 0
    end
    local gameTime = GameRules:GetDOTATime(false, false)
    if gameTime < 10 * 60 then
        return 0
    end
    local desire = 0
    desire = desire + 0.5
    desire = desire + math.floor(gameTime / 60) * 0.02
    if heroLevel > 30 then
        desire = desire + 0.2
    end
    local nearbyAllies = heroAI:FindNearbyAllies(1500)
    if #nearbyAllies >= 3 then
        desire = desire + 0.2
    elseif #nearbyAllies >= 2 then
        desire = desire + 0.1
    end
    local nearestEnemy = heroAI:FindNearestEnemyHero()
    if nearestEnemy then
        local distance = heroAI:GetDistanceTo(nearestEnemy)
        if distance < 1200 then
            desire = desire - 0.5
        elseif distance < 2000 then
            desire = desire - 0.3
        end
    end
    local healthPercent = hero:GetHealthPercent()
    if healthPercent < 50 then
        desire = desire - 0.5
    elseif healthPercent > 80 then
        desire = desire + 0.1
    end
    if hero.isBoss then
        local bossLevel = hero:GetLevel()
        local highestPlayerLevel = self:GetHighestPlayerLevel()
        if bossLevel >= highestPlayerLevel + 10 then
            desire = desire + 0.2
        end
    end
    local nearestTower = heroAI:FindNearestEnemyTower()
    if not nearestTower then
        desire = desire - 0.2
    end
    return math.max(
        0,
        math.min(desire, 0.75)
    )
end
function ModeSplitPush.prototype.GetHighestPlayerLevel(self)
    local highestLevel = 0
    do
        local i = 0
        while i < 24 do
            if PlayerResource:IsValidPlayerID(i) and not PlayerResource:IsFakeClient(i) then
                local playerHero = PlayerResource:GetSelectedHeroEntity(i)
                if playerHero and not playerHero:IsNull() then
                    local level = playerHero:GetLevel()
                    if level > highestLevel then
                        highestLevel = level
                    end
                end
            end
            i = i + 1
        end
    end
    return highestLevel
end
return ____exports
