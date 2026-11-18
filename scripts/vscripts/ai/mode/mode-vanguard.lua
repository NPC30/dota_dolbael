local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/mode/mode-vanguard.lua"
__TS__SourceMapTraceBack("ai/mode/mode-vanguard.lua", {["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 5,["14"] = 5,["15"] = 5,["16"] = 5,["18"] = 5,["19"] = 6,["20"] = 5,["21"] = 8,["22"] = 9,["23"] = 12,["24"] = 13,["25"] = 13,["26"] = 13,["27"] = 13,["28"] = 13,["29"] = 13,["30"] = 13,["31"] = 13,["32"] = 13,["33"] = 13,["34"] = 13,["35"] = 13,["36"] = 26,["37"] = 27,["39"] = 31,["40"] = 32,["42"] = 36,["43"] = 39,["44"] = 40,["45"] = 41,["47"] = 45,["48"] = 46,["50"] = 50,["51"] = 51,["52"] = 52,["53"] = 53,["54"] = 54,["57"] = 58,["58"] = 58,["59"] = 58,["60"] = 58,["61"] = 8});
local ____exports = {}
local ____mode_2Dbase = require("ai.mode.mode-base")
local ModeBase = ____mode_2Dbase.ModeBase
local ____mode_2Denum = require("ai.mode.mode-enum")
local ModeEnum = ____mode_2Denum.ModeEnum
____exports.ModeVanguard = __TS__Class()
local ModeVanguard = ____exports.ModeVanguard
ModeVanguard.name = "ModeVanguard"
__TS__ClassExtends(ModeVanguard, ModeBase)
function ModeVanguard.prototype.____constructor(self, ...)
    ModeBase.prototype.____constructor(self, ...)
    self.mode = ModeEnum.VANGUARD
end
function ModeVanguard.prototype.GetDesire(self, heroAI)
    local desire = 0
    local heroName = heroAI:GetHero():GetUnitName()
    local vanguardHeroes = {
        "npc_dota_hero_axe",
        "npc_dota_hero_chaos_knight",
        "npc_dota_hero_earthshaker",
        "npc_dota_hero_kunkka",
        "npc_dota_hero_pudge",
        "npc_dota_hero_sand_king",
        "npc_dota_hero_sven",
        "npc_dota_hero_tiny",
        "npc_dota_hero_skeleton_king",
        "npc_dota_hero_omniknight"
    }
    if not __TS__ArrayIncludes(vanguardHeroes, heroName) then
        return 0
    end
    if heroAI.mode ~= ModeEnum.PUSH then
        return 0
    end
    desire = desire + 0.3
    local nearbyAllies = heroAI:FindNearbyAllies(2000)
    if #nearbyAllies >= 2 then
        desire = desire + 0.4
    end
    if heroAI:GetHero():GetHealthPercent() > 60 then
        desire = desire + 0.3
    end
    local nearestTower = heroAI:FindNearestEnemyTowerInvulnerable()
    if nearestTower then
        local towerName = nearestTower:GetUnitName()
        if __TS__StringIncludes(towerName, "tower3") or __TS__StringIncludes(towerName, "tower4") then
            desire = desire + 0.3
        end
    end
    return math.max(
        0,
        math.min(desire, 0.85)
    )
end
return ____exports
