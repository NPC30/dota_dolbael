local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/action/action-find.lua"
__TS__SourceMapTraceBack("ai/action/action-find.lua", {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 6,["14"] = 3,["15"] = 9,["16"] = 10,["17"] = 12,["18"] = 9,["19"] = 15,["20"] = 16,["21"] = 18,["22"] = 15,["23"] = 21,["24"] = 22,["25"] = 29,["26"] = 21,["27"] = 32,["28"] = 37,["29"] = 37,["31"] = 39,["32"] = 43,["33"] = 44,["35"] = 46,["36"] = 46,["37"] = 46,["38"] = 46,["39"] = 46,["40"] = 46,["41"] = 46,["42"] = 46,["43"] = 48,["44"] = 32,["45"] = 52,["46"] = 53,["47"] = 60,["48"] = 52,["49"] = 63,["50"] = 69,["51"] = 71,["52"] = 72,["54"] = 74,["55"] = 74,["56"] = 74,["57"] = 74,["58"] = 74,["59"] = 74,["60"] = 74,["61"] = 76,["62"] = 63,["63"] = 80,["64"] = 86,["65"] = 86,["67"] = 88,["68"] = 90,["69"] = 91,["71"] = 93,["72"] = 93,["73"] = 93,["74"] = 93,["75"] = 93,["76"] = 93,["77"] = 93,["78"] = 93,["79"] = 93,["80"] = 93,["81"] = 93,["82"] = 105,["83"] = 80});
local ____exports = {}
____exports.ActionFind = __TS__Class()
local ActionFind = ____exports.ActionFind
ActionFind.name = "ActionFind"
function ActionFind.prototype.____constructor(self)
end
function ActionFind.FindEnemyHeroes(self, ____self, radius)
    local enemies = self:FindEnemies(____self, radius, DOTA_UNIT_TARGET_HERO)
    return enemies
end
function ActionFind.FindEnemyCreeps(self, ____self, radius)
    local enemies = self:FindEnemies(____self, radius, DOTA_UNIT_TARGET_CREEP)
    return enemies
end
function ActionFind.FindEnemyBuildings(self, ____self, radius)
    local enemies = self:FindEnemies(____self, radius, DOTA_UNIT_TARGET_BUILDING)
    return enemies
end
function ActionFind.FindEnemyBuildingsInvulnerable(self, ____self, radius)
    local enemies = self:FindEnemies(____self, radius, DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_INVULNERABLE)
    return enemies
end
function ActionFind.FindEnemies(self, ____self, radius, typeFilter, flagFilterExtra, order)
    if order == nil then
        order = FIND_CLOSEST
    end
    local flagFilter = DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS
    if flagFilterExtra then
        flagFilter = flagFilter + flagFilterExtra
    end
    local enemies = self:Find(
        ____self,
        radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        typeFilter,
        flagFilter,
        order
    )
    return enemies
end
function ActionFind.FindTeamBuildingsInvulnerable(self, ____self, radius)
    local teams = self:FindTeams(____self, radius, DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_INVULNERABLE)
    return teams
end
function ActionFind.FindTeams(self, ____self, radius, typeFilter, flagFilterExtra)
    local flagFilter = DOTA_UNIT_TARGET_FLAG_NONE
    if flagFilterExtra then
        flagFilter = flagFilter + flagFilterExtra
    end
    local teams = self:Find(
        ____self,
        radius,
        DOTA_UNIT_TARGET_TEAM_FRIENDLY,
        typeFilter,
        flagFilter
    )
    return teams
end
function ActionFind.Find(self, ____self, radius, teamFilter, typeFilter, flagFilterExtra, order)
    if order == nil then
        order = FIND_CLOSEST
    end
    local flagFilter = DOTA_UNIT_TARGET_FLAG_NOT_ILLUSIONS
    if flagFilterExtra then
        flagFilter = flagFilter + flagFilterExtra
    end
    local enemies = FindUnitsInRadius(
        ____self:GetTeamNumber(),
        ____self:GetAbsOrigin(),
        nil,
        radius,
        teamFilter,
        typeFilter,
        flagFilter,
        order,
        false
    )
    return enemies
end
return ____exports
