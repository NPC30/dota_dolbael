local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/game-end/game-end-point.lua"
__TS__SourceMapTraceBack("modules/event/game-end/game-end-point.lua", {["7"] = 2,["8"] = 2,["9"] = 5,["10"] = 6,["11"] = 5,["13"] = 5,["14"] = 24,["15"] = 25,["16"] = 26,["17"] = 27,["18"] = 28,["19"] = 29,["20"] = 29,["21"] = 29,["22"] = 29,["23"] = 30,["24"] = 31,["25"] = 31,["26"] = 31,["27"] = 31,["28"] = 32,["29"] = 34,["30"] = 43,["31"] = 24,["32"] = 46,["33"] = 48,["34"] = 48,["36"] = 49,["37"] = 49,["39"] = 51,["40"] = 52,["41"] = 53,["42"] = 55,["43"] = 46,["44"] = 58,["45"] = 64,["46"] = 65,["48"] = 68,["49"] = 68,["50"] = 68,["51"] = 68,["52"] = 58,["53"] = 71,["54"] = 72,["55"] = 73,["56"] = 74,["57"] = 75,["59"] = 78,["60"] = 71,["61"] = 81,["62"] = 82,["63"] = 83,["65"] = 87,["66"] = 90,["67"] = 93,["68"] = 94,["70"] = 97,["71"] = 98,["73"] = 102,["74"] = 81,["75"] = 105,["76"] = 106,["77"] = 107,["78"] = 107,["79"] = 107,["80"] = 107,["81"] = 105,["82"] = 110,["83"] = 111,["84"] = 112,["85"] = 113,["86"] = 110,["87"] = 116,["88"] = 116,["89"] = 116,["91"] = 117,["92"] = 118,["93"] = 119,["94"] = 122,["95"] = 123,["96"] = 123,["97"] = 123,["98"] = 131,["99"] = 116,["100"] = 134,["101"] = 135,["102"] = 135,["103"] = 135,["104"] = 135,["105"] = 134,["106"] = 141,["107"] = 142,["108"] = 143,["109"] = 144,["110"] = 141,["111"] = 170,["112"] = 171,["113"] = 172,["115"] = 175,["116"] = 175,["117"] = 175,["118"] = 175,["119"] = 170,["120"] = 178,["121"] = 180,["122"] = 181,["123"] = 182,["126"] = 185,["127"] = 186,["128"] = 186,["131"] = 187,["132"] = 188,["134"] = 189,["136"] = 190,["138"] = 191,["140"] = 192,["142"] = 193,["144"] = 194,["146"] = 195,["148"] = 196,["150"] = 197,["152"] = 198,["154"] = 199,["156"] = 200,["158"] = 201,["160"] = 202,["162"] = 203,["164"] = 204,["166"] = 205,["168"] = 206,["170"] = 207,["173"] = 210,["176"] = 178,["177"] = 214,["178"] = 215,["179"] = 217,["180"] = 218,["181"] = 219,["182"] = 220,["183"] = 221,["184"] = 222,["186"] = 225,["187"] = 226,["188"] = 227,["189"] = 228,["190"] = 229,["191"] = 230,["192"] = 231,["193"] = 232,["194"] = 233,["195"] = 234,["196"] = 235,["197"] = 236,["198"] = 237,["199"] = 238,["200"] = 239,["201"] = 240,["203"] = 245,["204"] = 246,["206"] = 249,["207"] = 250,["209"] = 253,["210"] = 254,["212"] = 257,["213"] = 258,["214"] = 259,["215"] = 260,["216"] = 261,["217"] = 262,["218"] = 263,["219"] = 264,["220"] = 265,["221"] = 266,["222"] = 267,["223"] = 268,["225"] = 272,["226"] = 273,["227"] = 274,["229"] = 276,["230"] = 277,["233"] = 282,["234"] = 283,["236"] = 294,["237"] = 296,["238"] = 297,["239"] = 298,["240"] = 299,["242"] = 303,["243"] = 304,["245"] = 307,["246"] = 214,["247"] = 7,["248"] = 8,["249"] = 9,["250"] = 10,["251"] = 11,["252"] = 12,["253"] = 13,["254"] = 15,["255"] = 16,["256"] = 17,["257"] = 18,["258"] = 19,["259"] = 20,["260"] = 21,["261"] = 22,["262"] = 5,["263"] = 6});
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
____exports.GameEndPoint = __TS__Class()
local GameEndPoint = ____exports.GameEndPoint
GameEndPoint.name = "GameEndPoint"
function GameEndPoint.prototype.____constructor(self)
end
function GameEndPoint.CalculatePlayerScore(self, player)
    local heroDamage = player.damage or player.heroDamage or 0
    local killScore = math.sqrt(player.kills) * 1.5
    local deathScore = -math.sqrt(player.deaths) * 0.6
    local assistScore = math.sqrt(player.assists) * 1.5
    local damageScore = math.min(
        40,
        math.sqrt(heroDamage) / 200
    )
    local damageTakenScore = self:GetDamageTakenScore(player.damageTaken)
    local healingScore = math.min(
        40,
        math.sqrt(player.healing) / 50
    )
    local towerKillScore = math.sqrt(player.towerKills) * 3.5
    local totalScore = killScore + deathScore + assistScore + damageScore + damageTakenScore + healingScore + towerKillScore
    return math.floor(totalScore + 0.5)
end
function GameEndPoint.CalculateAbyssPlayerScore(self, player, abyssWave, isSoloGame)
    if abyssWave == nil then
        abyssWave = 0
    end
    if isSoloGame == nil then
        isSoloGame = false
    end
    local waveScore = self:GetAbyssWaveScore(abyssWave)
    local performanceScore = self:GetAbyssPerformanceScore(player, isSoloGame)
    local deathScore = -math.sqrt(player.deaths) * self.ABYSS_DEATH_SCORE_SCALE
    return waveScore + performanceScore + deathScore
end
function GameEndPoint.GetDiminishingScore(self, score, fullValueLimit, maxScore, excessScale)
    if score <= fullValueLimit then
        return score
    end
    return math.min(
        maxScore,
        fullValueLimit + math.sqrt(score - fullValueLimit) * excessScale
    )
end
function GameEndPoint.GetDamageTakenScore(self, damageTaken)
    local rawScore = math.sqrt(damageTaken) / 100
    local fullValueLimit = math.sqrt(5000000) / 100
    if rawScore <= fullValueLimit then
        return rawScore
    end
    return math.min(40, fullValueLimit + (rawScore - fullValueLimit) * 0.5)
end
function GameEndPoint.GetParticipationRateMultiplier(self, player, teamKills)
    if teamKills <= 0 then
        return 1
    end
    local totalEngagements = player.kills + player.assists
    local participationRate = totalEngagements / teamKills
    if participationRate < 0.05 then
        return 0
    end
    if participationRate < 0.1 then
        return 0.5
    end
    return 1
end
function GameEndPoint.GetAbyssActivityTimeMultiplier(self, player)
    local activityCount = player.kills + player.deaths
    return math.min(
        1,
        math.max(0, activityCount) / 3
    )
end
function GameEndPoint.GetGameTimePoints(self, gameTime)
    local min = gameTime / 60
    local points = math.sqrt(min) * 3
    return math.floor(points + 0.5)
end
function GameEndPoint.GetAbyssGameTimePoints(self, gameTime, isSoloGame)
    if isSoloGame == nil then
        isSoloGame = false
    end
    local maxScore = isSoloGame and self.ABYSS_SOLO_TIME_MAX_SCORE or self.ABYSS_TIME_MAX_SCORE
    local clampedGameTime = math.max(0, gameTime)
    local baseScore = math.min(clampedGameTime, self.ABYSS_TIME_FULL_SECONDS) / self.ABYSS_TIME_FULL_SECONDS * maxScore
    local bonusScore = math.max(
        0,
        math.min(clampedGameTime, self.ABYSS_TIME_BONUS_FULL_SECONDS) - self.ABYSS_TIME_FULL_SECONDS
    ) / (self.ABYSS_TIME_BONUS_FULL_SECONDS - self.ABYSS_TIME_FULL_SECONDS) * maxScore
    return baseScore + bonusScore
end
function GameEndPoint.GetAbyssWaveScore(self, abyssWave)
    return math.min(
        self.ABYSS_WAVE_MAX_SCORE,
        math.max(0, abyssWave) / self.ABYSS_WAVE_FULL_VALUE * self.ABYSS_WAVE_MAX_SCORE
    )
end
function GameEndPoint.GetAbyssPerformanceScore(self, player, isSoloGame)
    local heroDamage = player.damage or player.heroDamage or 0
    local engagementCount = player.kills + player.assists
    return self:GetCappedSqrtScore(heroDamage, self.ABYSS_DAMAGE_FULL_VALUE, self.ABYSS_DAMAGE_MAX_SCORE) + self:GetCappedSqrtScore(player.damageTaken, self.ABYSS_DAMAGE_TAKEN_FULL_VALUE, self.ABYSS_DAMAGE_TAKEN_MAX_SCORE) + (isSoloGame and 0 or self:GetCappedSqrtScore(player.healing, self.ABYSS_HEALING_FULL_VALUE, self.ABYSS_HEALING_MAX_SCORE)) + self:GetCappedSqrtScore(engagementCount, self.ABYSS_ENGAGEMENT_FULL_VALUE, self.ABYSS_ENGAGEMENT_MAX_SCORE)
end
function GameEndPoint.GetCappedSqrtScore(self, value, fullValue, maxScore)
    if value <= 0 or fullValue <= 0 or maxScore <= 0 then
        return 0
    end
    return math.min(
        maxScore,
        math.sqrt(value / fullValue) * maxScore
    )
end
function GameEndPoint.GetDifficultyMultiplier(self, difficulty, isLocalhost, option)
    if not IsInToolsMode() then
        if GameRules:IsCheatMode() then
            return 0
        end
    end
    local midminus = 0
    if option.midOnlyMode then
        midminus = 0.1
    end
    repeat
        local ____switch24 = difficulty
        local ____cond24 = ____switch24 == 1
        if ____cond24 then
            return 1.2 - midminus
        end
        ____cond24 = ____cond24 or ____switch24 == 2
        if ____cond24 then
            return 1.4 - midminus
        end
        ____cond24 = ____cond24 or ____switch24 == 3
        if ____cond24 then
            return 1.6 - midminus
        end
        ____cond24 = ____cond24 or ____switch24 == 4
        if ____cond24 then
            return 1.9 - midminus
        end
        ____cond24 = ____cond24 or ____switch24 == 5
        if ____cond24 then
            return 2.1 - midminus
        end
        ____cond24 = ____cond24 or ____switch24 == 6
        if ____cond24 then
            return 2.3 - midminus
        end
        ____cond24 = ____cond24 or ____switch24 == 7
        if ____cond24 then
            return 2.4 - midminus
        end
        ____cond24 = ____cond24 or ____switch24 == 8
        if ____cond24 then
            return 2.6 - midminus
        end
        ____cond24 = ____cond24 or ____switch24 == 9
        if ____cond24 then
            return 2.7 - midminus
        end
        ____cond24 = ____cond24 or ____switch24 == 99
        if ____cond24 then
            return 2.3 - midminus
        end
        do
            return self:GetCustomModeMultiplier(option)
        end
    until true
end
function GameEndPoint.GetCustomModeMultiplier(self, option)
    local multiplier = 1
    if option.radiantGoldXpMultiplier >= 5 then
        multiplier = multiplier * 0.2
    elseif option.radiantGoldXpMultiplier >= 2 then
        multiplier = multiplier * 0.5
    elseif option.radiantGoldXpMultiplier < 1.3 then
        multiplier = multiplier * 1.1
    end
    if option.direGoldXpMultiplier >= 100 then
        multiplier = multiplier * 2.4
    elseif option.direGoldXpMultiplier >= 40 then
        multiplier = multiplier * 2.4
    elseif option.direGoldXpMultiplier >= 20 then
        multiplier = multiplier * 2.4
    elseif option.direGoldXpMultiplier >= 15 then
        multiplier = multiplier * 2.3
    elseif option.direGoldXpMultiplier == 12 then
        multiplier = multiplier * 2
    elseif option.direGoldXpMultiplier == 10 then
        multiplier = multiplier * 1.9
    elseif option.direGoldXpMultiplier >= 5 then
        multiplier = multiplier * 1.5
    elseif option.direGoldXpMultiplier >= 2 then
        multiplier = multiplier * 1.2
    end
    if not option.enablePlayerAttribute then
        multiplier = multiplier + 0.2
    end
    if option.sameHeroSelection then
        multiplier = multiplier + 0.2
    end
    if option.midOnlyMode then
        multiplier = multiplier - 0.1
    end
    if option.towerPower <= 100 then
        multiplier = multiplier - 0.3
    elseif option.towerPower <= 200 then
        multiplier = multiplier - 0.3
    elseif option.towerPower <= 250 then
        multiplier = multiplier - 0.2
    elseif option.towerPower <= 300 then
        multiplier = multiplier - 0.2
    elseif option.towerPower >= 600 then
        multiplier = multiplier - 0.1
    elseif option.towerPower >= 700 then
        multiplier = multiplier - 0.2
    end
    if multiplier > 1.5 then
        if option.startingGoldPlayer >= 5000 then
            multiplier = multiplier - 0.1
        end
        if option.startingGoldBot <= 1000 then
            multiplier = multiplier - 0.1
        end
    end
    if option.fixedAbility ~= "none" then
        multiplier = multiplier - 0.1
    end
    multiplier = multiplier * (option.direPlayerNumber / 10)
    if option.respawnTimePercentage <= 10 then
        multiplier = multiplier * 0.7
    elseif option.respawnTimePercentage <= 50 then
        multiplier = multiplier * 1
    end
    if multiplier < 0 then
        multiplier = 0
    end
    return math.floor(multiplier * 10 + 0.5) / 10
end
GameEndPoint.ABYSS_WAVE_FULL_VALUE = 100
GameEndPoint.ABYSS_WAVE_MAX_SCORE = 25
GameEndPoint.ABYSS_TIME_FULL_SECONDS = 25 * 60
GameEndPoint.ABYSS_TIME_BONUS_FULL_SECONDS = 50 * 60
GameEndPoint.ABYSS_TIME_MAX_SCORE = 25
GameEndPoint.ABYSS_SOLO_TIME_MAX_SCORE = 33
GameEndPoint.ABYSS_DEATH_SCORE_SCALE = 1.5
GameEndPoint.ABYSS_DAMAGE_FULL_VALUE = 50000000
GameEndPoint.ABYSS_DAMAGE_MAX_SCORE = 16
GameEndPoint.ABYSS_DAMAGE_TAKEN_FULL_VALUE = 30000000
GameEndPoint.ABYSS_DAMAGE_TAKEN_MAX_SCORE = 12
GameEndPoint.ABYSS_HEALING_FULL_VALUE = 3000000
GameEndPoint.ABYSS_HEALING_MAX_SCORE = 8
GameEndPoint.ABYSS_ENGAGEMENT_FULL_VALUE = 1000
GameEndPoint.ABYSS_ENGAGEMENT_MAX_SCORE = 14
GameEndPoint = __TS__DecorateLegacy({reloadable}, GameEndPoint)
____exports.GameEndPoint = GameEndPoint
return ____exports
