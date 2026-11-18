local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/mode/mode-retreat.lua"
__TS__SourceMapTraceBack("ai/mode/mode-retreat.lua", {["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 6,["16"] = 6,["17"] = 6,["19"] = 6,["20"] = 7,["21"] = 6,["22"] = 9,["23"] = 10,["24"] = 11,["26"] = 14,["27"] = 15,["28"] = 16,["30"] = 20,["31"] = 21,["32"] = 22,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 29,["38"] = 29,["39"] = 29,["40"] = 33,["41"] = 34,["44"] = 38,["45"] = 39,["46"] = 40,["47"] = 41,["50"] = 47,["51"] = 48,["52"] = 49,["53"] = 51,["54"] = 51,["55"] = 51,["56"] = 51,["57"] = 52,["58"] = 52,["59"] = 52,["60"] = 54,["64"] = 58,["65"] = 60,["66"] = 61,["67"] = 61,["68"] = 61,["69"] = 61,["70"] = 61,["71"] = 61,["72"] = 61,["73"] = 62,["77"] = 67,["78"] = 68,["80"] = 71,["81"] = 72,["82"] = 9,["83"] = 75,["84"] = 76,["85"] = 77,["86"] = 77,["87"] = 77,["88"] = 77,["89"] = 79,["90"] = 80,["91"] = 82,["92"] = 83,["94"] = 85,["95"] = 86,["96"] = 75});
local ____exports = {}
local ____hero_2Dutil = require("ai.hero.hero-util")
local HeroUtil = ____hero_2Dutil.HeroUtil
local ____mode_2Dbase = require("ai.mode.mode-base")
local ModeBase = ____mode_2Dbase.ModeBase
local ____mode_2Denum = require("ai.mode.mode-enum")
local ModeEnum = ____mode_2Denum.ModeEnum
____exports.ModeRetreat = __TS__Class()
local ModeRetreat = ____exports.ModeRetreat
ModeRetreat.name = "ModeRetreat"
__TS__ClassExtends(ModeRetreat, ModeBase)
function ModeRetreat.prototype.____constructor(self, ...)
    ModeBase.prototype.____constructor(self, ...)
    self.mode = ModeEnum.RETREAT
end
function ModeRetreat.prototype.GetDesire(self, heroAI)
    if heroAI:GetHero().isAbyssBot then
        return 0
    end
    local desire = 0
    if heroAI.mode == ModeEnum.RETREAT then
        desire = desire + 0.4
    end
    local curretHealthPercentage = heroAI:GetHero():GetHealthPercent()
    if curretHealthPercentage < 60 then
        desire = desire + 0.02 * (60 - curretHealthPercentage)
    end
    local nearestTower = heroAI:FindNearestEnemyTowerInvulnerable()
    if nearestTower then
        local distanceThanTowerAttackRange = HeroUtil:GetDistanceToAttackRange(
            nearestTower,
            heroAI:GetHero()
        )
        if distanceThanTowerAttackRange <= 0 then
            desire = desire + 0.2
        end
    end
    if heroAI:GetHero():GetLevel() < heroAI.PushLevel then
        local nearestTower = heroAI:FindNearestEnemyTowerInvulnerable()
        if nearestTower then
            desire = desire + self:GetIncreaseDesireNearTower(heroAI, nearestTower)
        end
    end
    local isNear3Tower = false
    local buildings = heroAI:GetAroundEnemyBuildingsInvulnerable()
    for ____, building in ipairs(buildings) do
        if __TS__StringIncludes(
            building:GetUnitName(),
            "rax"
        ) or __TS__StringIncludes(
            building:GetUnitName(),
            "npc_dota_goodguys_tower3"
        ) then
            isNear3Tower = true
            break
        end
    end
    if isNear3Tower then
        for ____, building in ipairs(buildings) do
            if __TS__StringIncludes(
                building:GetUnitName(),
                "fort"
            ) or __TS__StringIncludes(
                building:GetUnitName(),
                "tower4"
            ) then
                desire = desire + self:GetIncreaseDesireNearTower(heroAI, building)
            end
        end
    end
    if GameRules.Option.midOnlyMode and not GameRules.Option.abyssMode then
        desire = desire * 0.75
    end
    desire = math.min(desire, 1)
    return desire
end
function ModeRetreat.prototype.GetIncreaseDesireNearTower(self, heroAI, tower)
    local desire = 0
    local distanceThanRange = HeroUtil:GetDistanceToAttackRange(
        tower,
        heroAI:GetHero()
    )
    local towerBufferRange = 300
    local distanceThanRangeWithBuffer = distanceThanRange - towerBufferRange
    if distanceThanRangeWithBuffer <= 0 then
        desire = desire + -distanceThanRangeWithBuffer / 100 * 0.1
    end
    desire = math.min(desire, 0.6)
    return desire
end
return ____exports
