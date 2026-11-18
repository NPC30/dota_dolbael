local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/action/cached-find.lua"
__TS__SourceMapTraceBack("ai/action/cached-find.lua", {["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 26,["16"] = 26,["17"] = 26,["19"] = 26,["20"] = 44,["21"] = 45,["22"] = 46,["23"] = 47,["24"] = 48,["25"] = 49,["26"] = 50,["27"] = 51,["28"] = 52,["29"] = 53,["30"] = 54,["31"] = 55,["33"] = 44,["34"] = 59,["35"] = 64,["36"] = 67,["37"] = 68,["38"] = 69,["39"] = 70,["40"] = 71,["41"] = 72,["42"] = 73,["44"] = 75,["45"] = 76,["47"] = 78,["48"] = 79,["50"] = 82,["51"] = 85,["52"] = 86,["53"] = 90,["54"] = 91,["55"] = 59,["56"] = 94,["57"] = 99,["58"] = 100,["59"] = 101,["60"] = 102,["62"] = 105,["63"] = 106,["64"] = 107,["65"] = 107,["66"] = 107,["68"] = 108,["69"] = 110,["70"] = 115,["71"] = 116,["73"] = 119,["74"] = 120,["75"] = 121,["77"] = 124,["78"] = 124,["79"] = 124,["80"] = 124,["81"] = 124,["82"] = 124,["83"] = 124,["84"] = 124,["88"] = 134,["89"] = 134,["90"] = 134,["91"] = 134,["92"] = 94,["93"] = 137,["94"] = 142,["95"] = 142,["96"] = 142,["97"] = 142,["98"] = 142,["99"] = 142,["100"] = 142,["101"] = 137,["102"] = 147,["103"] = 152,["104"] = 153,["105"] = 154,["106"] = 155,["107"] = 155,["108"] = 155,["109"] = 155,["111"] = 158,["112"] = 159,["113"] = 159,["114"] = 159,["115"] = 159,["116"] = 159,["117"] = 159,["118"] = 159,["119"] = 159,["120"] = 159,["121"] = 159,["123"] = 147,["124"] = 169,["125"] = 170,["126"] = 169,["127"] = 173,["128"] = 178,["129"] = 178,["130"] = 178,["131"] = 178,["132"] = 178,["133"] = 178,["134"] = 178,["135"] = 173,["136"] = 181,["137"] = 186,["138"] = 187,["139"] = 188,["140"] = 189,["141"] = 190,["142"] = 191,["143"] = 191,["144"] = 191,["145"] = 191,["146"] = 192,["148"] = 195,["149"] = 195,["150"] = 195,["151"] = 195,["152"] = 198,["153"] = 202,["154"] = 181,["155"] = 205,["156"] = 210,["157"] = 211,["158"] = 212,["159"] = 213,["160"] = 214,["161"] = 215,["162"] = 215,["163"] = 215,["164"] = 215,["165"] = 216,["167"] = 219,["168"] = 219,["169"] = 219,["170"] = 219,["171"] = 222,["172"] = 226,["173"] = 205,["174"] = 229,["175"] = 234,["176"] = 234,["177"] = 234,["178"] = 234,["179"] = 234,["180"] = 234,["181"] = 234,["182"] = 229,["183"] = 243,["184"] = 248,["185"] = 251,["186"] = 252,["187"] = 253,["188"] = 254,["189"] = 255,["190"] = 255,["191"] = 255,["192"] = 255,["194"] = 258,["195"] = 258,["196"] = 262,["197"] = 263,["198"] = 263,["199"] = 263,["200"] = 258,["201"] = 258,["202"] = 265,["203"] = 269,["204"] = 269,["205"] = 269,["206"] = 269,["207"] = 243,["208"] = 272,["209"] = 277,["210"] = 278,["211"] = 279,["212"] = 280,["213"] = 281,["214"] = 282,["215"] = 282,["216"] = 282,["217"] = 282,["218"] = 283,["220"] = 286,["221"] = 286,["222"] = 286,["223"] = 286,["224"] = 289,["225"] = 293,["226"] = 272,["227"] = 296,["228"] = 302,["229"] = 302,["230"] = 302,["231"] = 302,["232"] = 302,["233"] = 302,["234"] = 303,["235"] = 304,["236"] = 305,["237"] = 306,["238"] = 307,["239"] = 307,["240"] = 307,["241"] = 307,["242"] = 310,["244"] = 313,["245"] = 313,["246"] = 313,["247"] = 313,["248"] = 313,["249"] = 313,["250"] = 313,["251"] = 313,["252"] = 313,["253"] = 313,["254"] = 313,["255"] = 313,["256"] = 313,["257"] = 313,["258"] = 324,["259"] = 328,["260"] = 296,["261"] = 331,["262"] = 338,["263"] = 345,["264"] = 346,["265"] = 347,["266"] = 348,["267"] = 349,["268"] = 349,["269"] = 349,["270"] = 349,["272"] = 352,["273"] = 355,["274"] = 355,["275"] = 361,["276"] = 362,["277"] = 362,["278"] = 362,["279"] = 355,["280"] = 355,["281"] = 364,["282"] = 368,["283"] = 368,["284"] = 368,["285"] = 368,["286"] = 331,["287"] = 371,["288"] = 372,["289"] = 373,["290"] = 374,["293"] = 377,["294"] = 378,["297"] = 381,["298"] = 373,["299"] = 383,["300"] = 371,["301"] = 386,["302"] = 387,["305"] = 390,["306"] = 392,["307"] = 393,["308"] = 394,["309"] = 395,["310"] = 396,["311"] = 397,["312"] = 398,["313"] = 399,["314"] = 400,["315"] = 400,["316"] = 400,["317"] = 401,["318"] = 401,["319"] = 401,["320"] = 402,["321"] = 403,["324"] = 406,["325"] = 407,["328"] = 386,["329"] = 412,["330"] = 413,["331"] = 413,["332"] = 413,["333"] = 414,["334"] = 415,["336"] = 417,["337"] = 417,["338"] = 417,["339"] = 417,["342"] = 412,["343"] = 422,["344"] = 426,["345"] = 427,["346"] = 427,["347"] = 427,["348"] = 427,["349"] = 430,["350"] = 431,["351"] = 432,["354"] = 422,["355"] = 437,["356"] = 438,["357"] = 439,["358"] = 440,["359"] = 441,["360"] = 442,["361"] = 443,["362"] = 444,["366"] = 448,["367"] = 437,["368"] = 451,["369"] = 452,["370"] = 452,["375"] = 452,["376"] = 451,["377"] = 455,["378"] = 456,["379"] = 455,["380"] = 459,["381"] = 464,["382"] = 459,["383"] = 475,["384"] = 480,["385"] = 475,["386"] = 489,["387"] = 495,["388"] = 489,["389"] = 504,["390"] = 505,["391"] = 505,["392"] = 505,["393"] = 505,["394"] = 505,["395"] = 505,["396"] = 504,["397"] = 508,["398"] = 514,["399"] = 515,["400"] = 516,["401"] = 517,["402"] = 508,["403"] = 27,["404"] = 28,["405"] = 29,["406"] = 30,["407"] = 31,["408"] = 32,["409"] = 33,["410"] = 34,["411"] = 35,["412"] = 36,["413"] = 37,["414"] = 38,["415"] = 39});
local ____exports = {}
local ____action_2Dfind = require("ai.action.action-find")
local ActionFind = ____action_2Dfind.ActionFind
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
____exports.CachedFind = __TS__Class()
local CachedFind = ____exports.CachedFind
CachedFind.name = "CachedFind"
function CachedFind.prototype.____constructor(self)
end
function CachedFind.InvalidateUnit(self, unit)
    local entityIndex = unit:GetEntityIndex()
    self:RemoveUnitFromCacheMap(self.enemyHeroes, entityIndex)
    self:RemoveUnitFromCacheMap(self.enemyBuildings, entityIndex)
    self:RemoveUnitFromCacheMap(self.enemyBuildingsInvulnerable, entityIndex)
    self:RemoveUnitFromCacheMap(self.enemyCreeps, entityIndex)
    self:RemoveUnitFromCacheMap(self.teamHeroes, entityIndex)
    self:RemoveUnitFromCacheMap(self.teamBuildingsInvulnerable, entityIndex)
    self:RemoveUnitFromCacheMap(self.teamCreeps, entityIndex)
    self:RemoveUnitFromCacheMap(self.teamCreepsNear, entityIndex)
    for ____, teamCache in __TS__Iterator(self.recentEnemyHeroPositions:values()) do
        teamCache:delete(entityIndex)
    end
end
function CachedFind.FindEnemyHeroes(self, ____self, radius, refreshInterval)
    local key = self.UseDirectHeroSearch and (tostring(____self:GetTeamNumber()) .. ":enemyHeroDirect:") .. tostring(math.floor(radius)) or self:GetRadiusKey(____self, "enemyHero", radius)
    local now = GameRules:GetGameTime()
    self:PruneExpiredCaches(now)
    local cached = self.enemyHeroes:get(key)
    if cached ~= nil and now < cached.nextRefreshTime then
        local result
        if self.UseDirectHeroSearch then
            result = self:FilterAndSortEnemyUnits(____self, cached.units, radius)
        else
            cached.units = self:FilterAndSortEnemyUnits(____self, cached.units, radius)
            result = cached.units
        end
        self:UpdateRecentEnemyHeroPositions(____self, result, now)
        return result
    end
    local units = self.UseDirectHeroSearch and self:FindEnemyHeroesByPlayerId(____self) or ActionFind:FindEnemyHeroes(____self, radius)
    local result = self:FilterAndSortEnemyUnits(____self, units, radius)
    self.enemyHeroes:set(key, {nextRefreshTime = now + refreshInterval, units = self.UseDirectHeroSearch and units or result})
    self:UpdateRecentEnemyHeroPositions(____self, result, now)
    return result
end
function CachedFind.FindRecentEnemyHeroPositions(self, ____self, radius, maxAgeSeconds)
    local now = GameRules:GetGameTime()
    local cache = self.recentEnemyHeroPositions:get(____self:GetTeamNumber())
    if cache == nil then
        return {}
    end
    local selfPosition = ____self:GetAbsOrigin()
    local result = {}
    for ____, ____value in __TS__Iterator(cache) do
        local entityIndex = ____value[1]
        local entry = ____value[2]
        do
            local age = now - entry.lastSeenTime
            if age > maxAgeSeconds or entry.unit:IsNull() or not entry.unit:IsAlive() or entry.unit:GetTeamNumber() == ____self:GetTeamNumber() then
                cache:delete(entityIndex)
                goto __continue12
            end
            local distance = entry.position:__sub(selfPosition):Length2D()
            if distance > radius then
                goto __continue12
            end
            result[#result + 1] = {
                entityIndex = entry.entityIndex,
                unitName = entry.unitName,
                position = entry.position,
                lastSeenTime = entry.lastSeenTime,
                age = age,
                distance = distance
            }
        end
        ::__continue12::
    end
    return __TS__ArraySort(
        result,
        function(____, a, b) return a.distance - b.distance end
    )
end
function CachedFind.FilterAndSortEnemyUnits(self, ____self, units, radius)
    return __TS__ArraySort(
        __TS__ArrayFilter(
            units,
            function(____, unit) return self:IsValidCachedEnemyUnit(____self, unit, radius) end
        ),
        function(____, a, b) return ____self:GetRangeToUnit(a) - ____self:GetRangeToUnit(b) end
    )
end
function CachedFind.UpdateRecentEnemyHeroPositions(self, ____self, units, now)
    local teamCache = self.recentEnemyHeroPositions:get(____self:GetTeamNumber())
    if teamCache == nil then
        teamCache = __TS__New(Map)
        self.recentEnemyHeroPositions:set(
            ____self:GetTeamNumber(),
            teamCache
        )
    end
    for ____, unit in ipairs(units) do
        teamCache:set(
            unit:GetEntityIndex(),
            {
                entityIndex = unit:GetEntityIndex(),
                unit = unit,
                unitName = unit:GetUnitName(),
                position = self:CloneVector(unit:GetAbsOrigin()),
                lastSeenTime = now
            }
        )
    end
end
function CachedFind.CloneVector(self, position)
    return Vector(position.x, position.y, position.z)
end
function CachedFind.FindEnemyBuildings(self, ____self, radius, refreshInterval)
    return self:FindCachedEnemyBuildings(
        self.enemyBuildings,
        ____self,
        radius,
        refreshInterval,
        false
    )
end
function CachedFind.FindEnemyCreeps(self, ____self, radius, refreshInterval)
    local key = self:GetRadiusKey(____self, "enemyCreep", radius)
    local now = GameRules:GetGameTime()
    self:PruneExpiredCaches(now)
    local cached = self.enemyCreeps:get(key)
    if cached ~= nil and now < cached.nextRefreshTime then
        cached.units = __TS__ArrayFilter(
            cached.units,
            function(____, unit) return self:IsValidCachedEnemyUnit(____self, unit, radius) end
        )
        return cached.units
    end
    local units = __TS__ArrayFilter(
        ActionFind:FindEnemyCreeps(____self, radius),
        function(____, unit) return self:IsValidCachedEnemyUnit(____self, unit, radius) end
    )
    self.enemyCreeps:set(key, {nextRefreshTime = now + refreshInterval, units = units})
    return units
end
function CachedFind.FindTeamHeroes(self, ____self, radius, refreshInterval)
    local key = self:GetRadiusKey(____self, "teamHero", radius)
    local now = GameRules:GetGameTime()
    self:PruneExpiredCaches(now)
    local cached = self.teamHeroes:get(key)
    if cached ~= nil and now < cached.nextRefreshTime then
        cached.units = __TS__ArrayFilter(
            cached.units,
            function(____, unit) return self:IsValidCachedTeamUnit(____self, unit, radius) end
        )
        return cached.units
    end
    local units = __TS__ArrayFilter(
        ActionFind:FindTeams(____self, radius, 1),
        function(____, unit) return self:IsValidCachedTeamUnit(____self, unit, radius) end
    )
    self.teamHeroes:set(key, {nextRefreshTime = now + refreshInterval, units = units})
    return units
end
function CachedFind.FindEnemyBuildingsInvulnerable(self, ____self, radius, refreshInterval)
    return self:FindCachedEnemyBuildings(
        self.enemyBuildingsInvulnerable,
        ____self,
        radius,
        refreshInterval,
        true
    )
end
function CachedFind.FindTeamBuildingsInvulnerable(self, ____self, radius, refreshInterval)
    local key = self.UseDirectBuildingSearch and tostring(____self:GetTeamNumber()) .. ":teamBuildingDirectInvulnerable" or self:GetRadiusKey(____self, "teamBuildingInvulnerable", radius)
    local now = GameRules:GetGameTime()
    self:PruneExpiredCaches(now)
    local cached = self.teamBuildingsInvulnerable:get(key)
    if cached ~= nil and now < cached.nextRefreshTime then
        return __TS__ArrayFilter(
            cached.units,
            function(____, unit) return self:IsValidCachedTeamUnit(____self, unit, radius) end
        )
    end
    local units = __TS__ArrayFilter(
        self.UseDirectBuildingSearch and self:FindBuildingsByClassname(____self:GetTeamNumber()) or ActionFind:FindTeamBuildingsInvulnerable(____self, radius),
        function(____, unit) return self:IsValidCachedTeamUnit(
            ____self,
            unit,
            self:GetBuildingDirectSearchRadius()
        ) end
    )
    self.teamBuildingsInvulnerable:set(key, {nextRefreshTime = now + refreshInterval, units = units})
    return __TS__ArrayFilter(
        units,
        function(____, unit) return self:IsValidCachedTeamUnit(____self, unit, radius) end
    )
end
function CachedFind.FindTeamCreeps(self, ____self, radius, refreshInterval)
    local key = self:GetRadiusKey(____self, "teamCreep", radius)
    local now = GameRules:GetGameTime()
    self:PruneExpiredCaches(now)
    local cached = self.teamCreeps:get(key)
    if cached ~= nil and now < cached.nextRefreshTime then
        cached.units = __TS__ArrayFilter(
            cached.units,
            function(____, unit) return self:IsValidCachedTeamUnit(____self, unit, radius) end
        )
        return cached.units
    end
    local units = __TS__ArrayFilter(
        ActionFind:FindTeams(____self, radius, 2),
        function(____, unit) return self:IsValidCachedTeamUnit(____self, unit, radius) end
    )
    self.teamCreeps:set(key, {nextRefreshTime = now + refreshInterval, units = units})
    return units
end
function CachedFind.FindTeamCreepsNear(self, ____self, origin, radius, refreshInterval)
    local key = self:GetOriginKey(
        ____self:GetTeamNumber(),
        origin,
        "teamCreepNear",
        radius
    )
    local now = GameRules:GetGameTime()
    self:PruneExpiredCaches(now)
    local cached = self.teamCreepsNear:get(key)
    if cached ~= nil and now < cached.nextRefreshTime then
        cached.units = __TS__ArrayFilter(
            cached.units,
            function(____, unit) return self:IsValidCachedTeamUnitNear(____self, unit, origin, radius) end
        )
        return cached.units
    end
    local units = __TS__ArrayFilter(
        FindUnitsInRadius(
            ____self:GetTeamNumber(),
            origin,
            nil,
            radius,
            1,
            2,
            0,
            0,
            false
        ),
        function(____, unit) return self:IsValidCachedTeamUnitNear(____self, unit, origin, radius) end
    )
    self.teamCreepsNear:set(key, {nextRefreshTime = now + refreshInterval, units = units})
    return units
end
function CachedFind.FindCachedEnemyBuildings(self, cache, ____self, radius, refreshInterval, includeInvulnerable)
    local key = self.UseDirectBuildingSearch and (tostring(____self:GetTeamNumber()) .. ":") .. (includeInvulnerable and "enemyBuildingDirectInvulnerable" or "enemyBuildingDirect") or self:GetRadiusKey(____self, includeInvulnerable and "enemyBuildingInvulnerable" or "enemyBuilding", radius)
    local now = GameRules:GetGameTime()
    self:PruneExpiredCaches(now)
    local cached = cache:get(key)
    if cached ~= nil and now < cached.nextRefreshTime then
        return __TS__ArrayFilter(
            cached.units,
            function(____, unit) return self:IsValidCachedEnemyUnit(____self, unit, radius) end
        )
    end
    local directUnits = self.UseDirectBuildingSearch and self:FindBuildingsByClassname(self:GetEnemyTeam(____self:GetTeamNumber())) or nil
    local units = __TS__ArrayFilter(
        directUnits ~= nil and directUnits or (includeInvulnerable and ActionFind:FindEnemyBuildingsInvulnerable(____self, radius) or ActionFind:FindEnemyBuildings(____self, radius)),
        function(____, unit) return self:IsValidCachedEnemyUnit(
            ____self,
            unit,
            self:GetBuildingDirectSearchRadius()
        ) end
    )
    cache:set(key, {nextRefreshTime = now + refreshInterval, units = units})
    return __TS__ArrayFilter(
        units,
        function(____, unit) return self:IsValidCachedEnemyUnit(____self, unit, radius) end
    )
end
function CachedFind.FindEnemyHeroesByPlayerId(self, ____self)
    local result = {}
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if PlayerResource:GetTeam(playerId) == ____self:GetTeamNumber() then
            return
        end
        local hero = PlayerResource:GetSelectedHeroEntity(playerId)
        if hero == nil or hero:IsNull() or not hero:IsRealHero() then
            return
        end
        result[#result + 1] = hero
    end)
    return result
end
function CachedFind.PruneExpiredCaches(self, now)
    if now < self.nextCachePruneTime then
        return
    end
    self.nextCachePruneTime = now + self.cachePruneInterval
    self:PruneCacheMap(self.enemyHeroes, now)
    self:PruneCacheMap(self.enemyBuildings, now)
    self:PruneCacheMap(self.enemyBuildingsInvulnerable, now)
    self:PruneCacheMap(self.enemyCreeps, now)
    self:PruneCacheMap(self.teamHeroes, now)
    self:PruneCacheMap(self.teamBuildingsInvulnerable, now)
    self:PruneCacheMap(self.teamCreeps, now)
    self:PruneCacheMap(self.teamCreepsNear, now)
    for ____, ____value in __TS__Iterator(self.recentEnemyHeroPositions) do
        local team = ____value[1]
        local teamCache = ____value[2]
        for ____, ____value in __TS__Iterator(teamCache) do
            local entityIndex = ____value[1]
            local entry = ____value[2]
            if entry.unit:IsNull() or not entry.unit:IsAlive() then
                teamCache:delete(entityIndex)
            end
        end
        if teamCache.size == 0 then
            self.recentEnemyHeroPositions:delete(team)
        end
    end
end
function CachedFind.PruneCacheMap(self, cache, now)
    for ____, ____value in __TS__Iterator(cache) do
        local key = ____value[1]
        local cached = ____value[2]
        if now >= cached.nextRefreshTime then
            cache:delete(key)
        else
            cached.units = __TS__ArrayFilter(
                cached.units,
                function(____, unit) return not unit:IsNull() and unit:IsAlive() end
            )
        end
    end
end
function CachedFind.RemoveUnitFromCacheMap(self, cache, entityIndex)
    for ____, cached in __TS__Iterator(cache:values()) do
        local filtered = __TS__ArrayFilter(
            cached.units,
            function(____, unit) return not unit:IsNull() and unit:GetEntityIndex() ~= entityIndex end
        )
        if #filtered ~= #cached.units then
            cached.units = filtered
            cached.nextRefreshTime = 0
        end
    end
end
function CachedFind.FindBuildingsByClassname(self, team)
    local result = {}
    local classnames = {"npc_dota_tower", "npc_dota_barracks", "npc_dota_fort"}
    for ____, classname in ipairs(classnames) do
        local entities = Entities:FindAllByClassname(classname)
        for ____, entity in ipairs(entities) do
            if entity:GetTeamNumber() == team then
                result[#result + 1] = entity
            end
        end
    end
    return result
end
function CachedFind.GetEnemyTeam(self, team)
    local ____temp_0
    if team == DOTA_TEAM_GOODGUYS then
        ____temp_0 = DOTA_TEAM_BADGUYS
    else
        ____temp_0 = DOTA_TEAM_GOODGUYS
    end
    return ____temp_0
end
function CachedFind.GetBuildingDirectSearchRadius(self)
    return 30000
end
function CachedFind.IsValidCachedEnemyUnit(self, ____self, unit, radius)
    return unit ~= nil and not unit:IsNull() and unit:IsAlive() and unit:GetTeamNumber() ~= ____self:GetTeamNumber() and ____self:GetRangeToUnit(unit) <= radius and not unit:IsInvisible() and ____self:CanEntityBeSeenByMyTeam(unit)
end
function CachedFind.IsValidCachedTeamUnit(self, ____self, unit, radius)
    return unit ~= nil and not unit:IsNull() and unit:IsAlive() and unit:GetTeamNumber() == ____self:GetTeamNumber() and ____self:GetRangeToUnit(unit) <= radius
end
function CachedFind.IsValidCachedTeamUnitNear(self, ____self, unit, origin, radius)
    return unit ~= nil and not unit:IsNull() and unit:IsAlive() and unit:GetTeamNumber() == ____self:GetTeamNumber() and unit:GetAbsOrigin():__sub(origin):Length2D() <= radius
end
function CachedFind.GetRadiusKey(self, ____self, ____type, radius)
    return self:GetOriginKey(
        ____self:GetTeamNumber(),
        ____self:GetAbsOrigin(),
        ____type,
        radius
    )
end
function CachedFind.GetOriginKey(self, team, origin, ____type, radius)
    local bucketSize = math.max(1000, radius / 2)
    local bucketX = math.floor(origin.x / bucketSize)
    local bucketY = math.floor(origin.y / bucketSize)
    return (((((((tostring(team) .. ":") .. ____type) .. ":") .. tostring(math.floor(radius))) .. ":") .. tostring(bucketX)) .. ":") .. tostring(bucketY)
end
CachedFind.UseDirectHeroSearch = true
CachedFind.UseDirectBuildingSearch = true
CachedFind.cachePruneInterval = 5
CachedFind.nextCachePruneTime = 0
CachedFind.enemyHeroes = __TS__New(Map)
CachedFind.enemyBuildings = __TS__New(Map)
CachedFind.enemyBuildingsInvulnerable = __TS__New(Map)
CachedFind.enemyCreeps = __TS__New(Map)
CachedFind.teamHeroes = __TS__New(Map)
CachedFind.teamBuildingsInvulnerable = __TS__New(Map)
CachedFind.teamCreeps = __TS__New(Map)
CachedFind.teamCreepsNear = __TS__New(Map)
CachedFind.recentEnemyHeroPositions = __TS__New(Map)
return ____exports
