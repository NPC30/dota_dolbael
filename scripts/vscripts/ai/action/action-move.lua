local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/action/action-move.lua"
__TS__SourceMapTraceBack("ai/action/action-move.lua", {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 3,["13"] = 3,["14"] = 6,["15"] = 8,["16"] = 8,["17"] = 8,["18"] = 8,["19"] = 8,["20"] = 8,["21"] = 6,["22"] = 16,["23"] = 22,["24"] = 25,["25"] = 26,["27"] = 29,["28"] = 29,["29"] = 29,["30"] = 29,["31"] = 29,["32"] = 29,["33"] = 16,["34"] = 38,["35"] = 39,["36"] = 39,["37"] = 39,["38"] = 39,["39"] = 39,["40"] = 39,["41"] = 38,["42"] = 47,["43"] = 49,["44"] = 50,["46"] = 57,["47"] = 58,["49"] = 60,["50"] = 62,["51"] = 64,["52"] = 69,["53"] = 70,["55"] = 74,["56"] = 78,["57"] = 79,["59"] = 81,["60"] = 47,["61"] = 4,["62"] = 5});
local ____exports = {}
local ____hero_2Dutil = require("ai.hero.hero-util")
local HeroUtil = ____hero_2Dutil.HeroUtil
____exports.ActionMove = __TS__Class()
local ActionMove = ____exports.ActionMove
ActionMove.name = "ActionMove"
function ActionMove.prototype.____constructor(self)
end
function ActionMove.MoveHero(self, hero, pos)
    ExecuteOrderFromTable({
        OrderType = DOTA_UNIT_ORDER_MOVE_TO_POSITION,
        UnitIndex = hero:GetEntityIndex(),
        Position = pos,
        Queue = false
    })
end
function ActionMove.MoveHeroToDirection(self, hero, direction, distance, randomRadius)
    local pos = hero:GetAbsOrigin():__add(direction:__mul(distance))
    if randomRadius then
        pos = pos:__add(RandomVector(randomRadius))
    end
    ExecuteOrderFromTable({
        OrderType = DOTA_UNIT_ORDER_MOVE_TO_POSITION,
        UnitIndex = hero:GetEntityIndex(),
        Position = pos,
        Queue = false
    })
end
function ActionMove.MoveRelative(self, hero, pos)
    ExecuteOrderFromTable({
        OrderType = DOTA_UNIT_ORDER_MOVE_TO_POSITION,
        UnitIndex = hero:GetEntityIndex(),
        Position = pos,
        Queue = false
    })
end
function ActionMove.GetAwayFromTower(self, hero, enemyTower)
    if hero:GetHealthPercent() < 0.2 then
        return false
    end
    if not enemyTower then
        return false
    end
    local towerName = enemyTower:GetUnitName()
    local pos = hero:GetTeamNumber() == DOTA_TEAM_GOODGUYS and self.posRadiantBase or self.posDireBase
    if __TS__StringIncludes(towerName, "tower3") or __TS__StringIncludes(towerName, "tower4") or __TS__StringIncludes(towerName, "fort") then
        ____exports.ActionMove:MoveRelative(hero, pos)
        return true
    end
    if HeroUtil:GetDistanceToAttackRange(enemyTower, hero) <= 300 then
        ____exports.ActionMove:MoveRelative(hero, pos)
        return true
    end
    return false
end
ActionMove.posRadiantBase = Vector(-7050, -6550, 384)
ActionMove.posDireBase = Vector(6950, 6320, 384)
return ____exports
