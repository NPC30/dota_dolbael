local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__NumberIsFinite = ____lualib.__TS__NumberIsFinite
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/game-end/game-end.lua"
__TS__SourceMapTraceBack("modules/event/game-end/game-end.lua", {["12"] = 1,["13"] = 1,["14"] = 11,["15"] = 11,["16"] = 12,["17"] = 12,["18"] = 13,["19"] = 13,["20"] = 14,["21"] = 14,["22"] = 15,["23"] = 15,["24"] = 16,["25"] = 16,["26"] = 17,["27"] = 17,["28"] = 18,["29"] = 18,["30"] = 19,["31"] = 19,["32"] = 20,["33"] = 20,["34"] = 21,["35"] = 21,["36"] = 23,["37"] = 24,["38"] = 23,["40"] = 23,["41"] = 27,["42"] = 28,["45"] = 31,["46"] = 33,["47"] = 34,["48"] = 38,["49"] = 38,["50"] = 38,["51"] = 38,["52"] = 38,["53"] = 42,["54"] = 42,["55"] = 42,["56"] = 42,["57"] = 42,["58"] = 44,["59"] = 27,["60"] = 50,["61"] = 51,["62"] = 51,["65"] = 55,["66"] = 56,["67"] = 57,["68"] = 50,["69"] = 60,["70"] = 61,["71"] = 61,["74"] = 65,["75"] = 66,["76"] = 67,["77"] = 68,["78"] = 60,["79"] = 75,["80"] = 76,["81"] = 77,["82"] = 77,["83"] = 77,["84"] = 77,["85"] = 81,["86"] = 83,["87"] = 75,["88"] = 86,["89"] = 87,["90"] = 87,["91"] = 87,["94"] = 87,["96"] = 87,["97"] = 86,["98"] = 90,["99"] = 91,["100"] = 91,["101"] = 92,["103"] = 95,["104"] = 94,["105"] = 90,["106"] = 101,["107"] = 102,["108"] = 102,["109"] = 103,["111"] = 106,["112"] = 101,["113"] = 109,["114"] = 110,["115"] = 111,["117"] = 114,["118"] = 114,["119"] = 114,["120"] = 114,["121"] = 115,["122"] = 109,["123"] = 118,["124"] = 121,["125"] = 121,["127"] = 123,["128"] = 124,["129"] = 124,["130"] = 125,["131"] = 126,["132"] = 126,["133"] = 126,["134"] = 126,["135"] = 126,["136"] = 126,["137"] = 126,["138"] = 126,["139"] = 135,["140"] = 136,["141"] = 136,["142"] = 136,["143"] = 136,["144"] = 136,["145"] = 142,["146"] = 143,["147"] = 144,["148"] = 145,["149"] = 144,["150"] = 147,["151"] = 147,["152"] = 147,["153"] = 147,["154"] = 148,["155"] = 150,["156"] = 151,["157"] = 152,["160"] = 155,["161"] = 156,["164"] = 160,["166"] = 161,["167"] = 161,["168"] = 163,["169"] = 167,["170"] = 168,["173"] = 161,["176"] = 173,["177"] = 174,["178"] = 176,["179"] = 183,["180"] = 183,["181"] = 183,["182"] = 183,["183"] = 183,["184"] = 183,["185"] = 183,["186"] = 183,["187"] = 183,["188"] = 183,["189"] = 183,["190"] = 183,["191"] = 183,["192"] = 183,["193"] = 183,["194"] = 183,["195"] = 183,["196"] = 183,["197"] = 183,["198"] = 202,["199"] = 207,["200"] = 213,["201"] = 213,["202"] = 213,["203"] = 213,["204"] = 217,["205"] = 218,["206"] = 219,["207"] = 220,["208"] = 221,["209"] = 221,["210"] = 221,["211"] = 222,["212"] = 223,["213"] = 224,["214"] = 227,["215"] = 227,["216"] = 227,["217"] = 227,["218"] = 227,["219"] = 227,["220"] = 227,["221"] = 227,["222"] = 227,["223"] = 227,["224"] = 227,["225"] = 227,["226"] = 227,["227"] = 227,["228"] = 227,["229"] = 227,["230"] = 227,["231"] = 227,["232"] = 227,["233"] = 150,["234"] = 244,["235"] = 244,["236"] = 244,["237"] = 244,["238"] = 244,["239"] = 244,["240"] = 244,["241"] = 244,["242"] = 244,["243"] = 244,["244"] = 244,["245"] = 244,["246"] = 256,["247"] = 257,["248"] = 258,["250"] = 261,["251"] = 118,["252"] = 264,["253"] = 267,["254"] = 267,["256"] = 269,["257"] = 270,["258"] = 270,["259"] = 271,["260"] = 272,["261"] = 272,["262"] = 272,["263"] = 272,["264"] = 272,["265"] = 272,["266"] = 272,["267"] = 272,["268"] = 281,["269"] = 282,["270"] = 282,["271"] = 282,["272"] = 282,["273"] = 282,["274"] = 288,["275"] = 289,["276"] = 290,["277"] = 291,["278"] = 290,["279"] = 293,["280"] = 293,["281"] = 293,["282"] = 293,["283"] = 295,["284"] = 296,["285"] = 297,["288"] = 300,["289"] = 301,["292"] = 305,["294"] = 306,["295"] = 306,["296"] = 308,["297"] = 312,["298"] = 313,["301"] = 306,["304"] = 318,["305"] = 319,["306"] = 321,["307"] = 328,["308"] = 328,["309"] = 328,["310"] = 328,["311"] = 328,["312"] = 328,["313"] = 328,["314"] = 328,["315"] = 328,["316"] = 328,["317"] = 328,["318"] = 328,["319"] = 328,["320"] = 328,["321"] = 328,["322"] = 328,["323"] = 328,["324"] = 328,["325"] = 328,["326"] = 328,["327"] = 348,["328"] = 353,["329"] = 354,["330"] = 364,["331"] = 367,["332"] = 369,["333"] = 371,["334"] = 371,["335"] = 371,["336"] = 371,["337"] = 372,["338"] = 373,["340"] = 379,["343"] = 383,["344"] = 384,["346"] = 392,["347"] = 393,["348"] = 394,["349"] = 396,["350"] = 397,["351"] = 398,["352"] = 399,["353"] = 400,["354"] = 407,["355"] = 408,["356"] = 408,["357"] = 409,["358"] = 409,["359"] = 410,["360"] = 410,["361"] = 411,["362"] = 411,["363"] = 412,["364"] = 412,["365"] = 413,["366"] = 413,["367"] = 414,["368"] = 414,["369"] = 415,["370"] = 406,["371"] = 406,["372"] = 406,["373"] = 406,["374"] = 406,["375"] = 406,["376"] = 406,["377"] = 406,["378"] = 406,["379"] = 406,["380"] = 406,["381"] = 417,["382"] = 417,["383"] = 417,["384"] = 417,["385"] = 421,["386"] = 421,["387"] = 421,["388"] = 421,["389"] = 421,["390"] = 421,["391"] = 421,["392"] = 421,["393"] = 421,["394"] = 421,["395"] = 433,["396"] = 436,["397"] = 436,["398"] = 436,["399"] = 436,["400"] = 436,["401"] = 436,["402"] = 436,["403"] = 436,["404"] = 436,["405"] = 436,["406"] = 436,["407"] = 436,["408"] = 436,["409"] = 436,["410"] = 436,["411"] = 436,["412"] = 295,["413"] = 450,["414"] = 450,["415"] = 450,["416"] = 450,["417"] = 450,["418"] = 450,["419"] = 450,["420"] = 450,["421"] = 458,["422"] = 458,["423"] = 458,["424"] = 458,["425"] = 458,["426"] = 458,["427"] = 450,["428"] = 450,["429"] = 450,["430"] = 461,["431"] = 462,["432"] = 463,["434"] = 465,["435"] = 264,["436"] = 468,["437"] = 472,["438"] = 472,["440"] = 474,["441"] = 476,["443"] = 478,["444"] = 479,["445"] = 480,["446"] = 480,["447"] = 483,["448"] = 484,["449"] = 484,["450"] = 485,["451"] = 485,["452"] = 484,["453"] = 487,["454"] = 488,["455"] = 489,["456"] = 491,["457"] = 493,["458"] = 494,["459"] = 496,["460"] = 497,["461"] = 498,["462"] = 499,["463"] = 501,["464"] = 502,["465"] = 504,["467"] = 508,["469"] = 512,["470"] = 512,["471"] = 512,["472"] = 512,["473"] = 468,["474"] = 515,["475"] = 518,["476"] = 518,["478"] = 520,["479"] = 520,["480"] = 521,["482"] = 524,["483"] = 515,["484"] = 527,["485"] = 528,["486"] = 528,["488"] = 529,["489"] = 529,["491"] = 530,["492"] = 530,["494"] = 531,["495"] = 531,["497"] = 532,["498"] = 527,["499"] = 535,["500"] = 536,["501"] = 539,["502"] = 540,["503"] = 541,["504"] = 541,["505"] = 541,["506"] = 541,["507"] = 541,["508"] = 541,["509"] = 541,["511"] = 551,["512"] = 552,["513"] = 553,["514"] = 553,["515"] = 553,["516"] = 553,["517"] = 553,["518"] = 553,["519"] = 553,["521"] = 535,["522"] = 566,["523"] = 567,["524"] = 569,["525"] = 569,["526"] = 569,["527"] = 571,["530"] = 575,["531"] = 576,["532"] = 579,["533"] = 580,["535"] = 589,["536"] = 590,["538"] = 599,["539"] = 600,["541"] = 569,["542"] = 569,["543"] = 609,["544"] = 566,["545"] = 615,["546"] = 616,["547"] = 618,["548"] = 618,["549"] = 618,["550"] = 620,["553"] = 624,["554"] = 625,["557"] = 629,["559"] = 634,["560"] = 634,["561"] = 635,["562"] = 636,["563"] = 637,["564"] = 639,["565"] = 639,["566"] = 640,["567"] = 640,["568"] = 641,["569"] = 641,["570"] = 642,["571"] = 642,["572"] = 643,["573"] = 643,["574"] = 644,["575"] = 644,["578"] = 634,["581"] = 649,["582"] = 650,["583"] = 651,["585"] = 654,["586"] = 655,["587"] = 656,["589"] = 659,["590"] = 618,["591"] = 618,["592"] = 662,["593"] = 615,["594"] = 25,["595"] = 23,["596"] = 24});
local ____exports = {}
local ____analytics = require("api.analytics.analytics")
local Analytics = ____analytics.Analytics
local ____ga4 = require("api.analytics.ga4")
local GA4 = ____ga4.GA4
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local ____game = require("api.game")
local Game = ____game.Game
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____GameConfig = require("modules.GameConfig")
local GameConfig = ____GameConfig.GameConfig
local ____ability_2Dreplacer = require("modules.helper.ability-replacer")
local AbilityReplacer = ____ability_2Dreplacer.AbilityReplacer
local ____net_2Dtable_2Dhelper = require("modules.helper.net-table-helper")
local NetTableHelper = ____net_2Dtable_2Dhelper.NetTableHelper
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____treasure = require("modules.treasure.treasure")
local Treasure = ____treasure.Treasure
local ____player_2Dtip = require("modules.player-tip.player-tip")
local PlayerTip = ____player_2Dtip.PlayerTip
local ____game_2Dend_2Dpoint = require("modules.event.game-end.game-end-point")
local GameEndPoint = ____game_2Dend_2Dpoint.GameEndPoint
____exports.GameEnd = __TS__Class()
local GameEnd = ____exports.GameEnd
GameEnd.name = "GameEnd"
function GameEnd.prototype.____constructor(self)
end
function GameEnd.OnGameEnd(self, winnerTeamId)
    if self.gameEndTriggered then
        return
    end
    self.gameEndTriggered = true
    local effectiveWinnerTeamId = self:GetEffectiveWinnerTeamId(winnerTeamId)
    ApiClient:DebugLog((("[GameEnd] OnGameEnd " .. tostring(winnerTeamId)) .. ", effectiveWinnerTeamId=") .. tostring(effectiveWinnerTeamId))
    local _gameEndDto = self:BuildGameEndDto(
        effectiveWinnerTeamId,
        self:GetAbyssWave(),
        false
    )
    local gameEndDto2 = self:BuildGameEndDto2(
        effectiveWinnerTeamId,
        self:GetAbyssWave(),
        false
    )
    Game:PostEndGame2(gameEndDto2)
end
function GameEnd.PostAbyssProgressGameEnd(self, abyssWave)
    local ____opt_0 = GameRules.Option
    if not (____opt_0 and ____opt_0.abyssMode) or abyssWave <= 0 or abyssWave % 5 ~= 0 then
        return
    end
    local gameEndDto2 = self:BuildGameEndDto2(DOTA_TEAM_GOODGUYS, abyssWave, true)
    Game:PostEndGame2(gameEndDto2, false)
    ApiClient:DebugLog("[GameEnd] Post abyss progress game/end, wave=" .. tostring(abyssWave))
end
function GameEnd.PostRandomDraftProgressGameEnd(self)
    local ____opt_2 = GameRules.Option
    if not (____opt_2 and ____opt_2.randomDraftMode) then
        return
    end
    local gameEndDto2 = self:BuildGameEndDto2(DOTA_TEAM_GOODGUYS, nil, false)
    gameEndDto2.isRandomDraftProgress = true
    Game:PostEndGame2(gameEndDto2, false)
    ApiClient:DebugLog("[GameEnd] Post random draft 8-minute progress game/end")
end
function GameEnd.GetSettlementGold(self, playerId)
    local totalEarnedGold = PlayerResource:GetTotalEarnedGold(playerId)
    local virtualGoldData = CustomNetTables:GetTableValue(
        "player_virtual_gold",
        tostring(playerId)
    )
    local transferredBackTotal = virtualGoldData and virtualGoldData.transferred_back_total or 0
    return math.max(0, totalEarnedGold - transferredBackTotal)
end
function GameEnd.GetEffectiveWinnerTeamId(self, winnerTeamId)
    local ____GameRules_Option_abyssMode_8
    local ____opt_6 = GameRules.Option
    if ____opt_6 and ____opt_6.abyssMode then
        ____GameRules_Option_abyssMode_8 = DOTA_TEAM_GOODGUYS
    else
        ____GameRules_Option_abyssMode_8 = winnerTeamId
    end
    return ____GameRules_Option_abyssMode_8
end
function GameEnd.GetAbyssWave(self)
    local ____opt_9 = GameRules.Option
    if not (____opt_9 and ____opt_9.abyssMode) then
        return nil
    end
    local ____opt_11 = GameRules.AbyssMode
    return ____opt_11 and ____opt_11:GetCompletedWave() or _G.AbyssModeCompletedWave or 0
end
function GameEnd.GetReportedDifficulty(self, difficulty, isAbyssProgress)
    local ____opt_13 = GameRules.Option
    if ____opt_13 and ____opt_13.abyssMode and not GameRules.Option.abyssStrictLimits and not isAbyssProgress then
        return 0
    end
    return difficulty
end
function GameEnd.GetReportedPlayerName(self, playerId, steamAccountID)
    if steamAccountID <= 0 then
        return ""
    end
    local playerData = CustomNetTables:GetTableValue(
        "player_table",
        tostring(steamAccountID)
    )
    return playerData and playerData.playerName or PlayerResource:GetPlayerName(playerId) or ""
end
function GameEnd.BuildGameEndDto(self, winnerTeamId, abyssWave, isAbyssProgress)
    if isAbyssProgress == nil then
        isAbyssProgress = false
    end
    local gameOptionsData = CustomNetTables:GetTableValue("game_options", "game_options")
    local ____opt_17 = CustomNetTables:GetTableValue("game_difficulty", "all")
    local difficulty = ____opt_17 and ____opt_17.difficulty or 0
    local reportedDifficulty = self:GetReportedDifficulty(difficulty, isAbyssProgress)
    local gameOptions = {
        multiplierRadiant = gameOptionsData.multiplier_radiant,
        multiplierDire = gameOptionsData.multiplier_dire,
        multiplierDireXp = gameOptionsData.multiplier_dire_xp,
        playerNumberRadiant = gameOptionsData.player_number_radiant,
        playerNumberDire = gameOptionsData.player_number_dire,
        towerPowerPct = gameOptionsData.tower_power_pct
    }
    local gameTime = GameRules:GetDOTATime(false, true)
    local difficultyMultiplier = GameEndPoint:GetDifficultyMultiplier(
        reportedDifficulty,
        ApiClient:IsLocalhost(),
        GameRules.Option
    )
    local players = {}
    local allSteamIds = {}
    PlayerHelper:ForEachPlayer(function(____, playerId)
        allSteamIds[#allSteamIds + 1] = PlayerResource:GetSteamAccountID(playerId)
    end)
    local realPlayerCount = #__TS__ArrayFilter(
        allSteamIds,
        function(____, id) return id > 0 end
    )
    local isTeamGame = realPlayerCount >= 2
    PlayerHelper:ForEachPlayer(function(____, playerId)
        local player = PlayerResource:GetPlayer(playerId)
        if not player then
            return
        end
        local hero = player:GetAssignedHero()
        if not hero then
            return
        end
        local damageTaken = 0
        do
            local victimID = 0
            while victimID < DOTA_MAX_TEAM_PLAYERS do
                if PlayerResource:IsValidPlayerID(victimID) and PlayerResource:IsValidPlayer(victimID) and PlayerResource:GetSelectedHeroEntity(victimID) then
                    if PlayerResource:GetTeam(victimID) ~= PlayerResource:GetTeam(playerId) then
                        damageTaken = damageTaken + PlayerResource:GetDamageDoneToHero(victimID, playerId)
                    end
                end
                victimID = victimID + 1
            end
        end
        local MAX_DAMAGE_VALUE = 99999999
        local rawHealing = PlayerResource:GetHealing(playerId)
        local safeHealing = __TS__NumberIsFinite(rawHealing) and rawHealing >= 0 and rawHealing <= MAX_DAMAGE_VALUE and rawHealing or (rawHealing < 0 and MAX_DAMAGE_VALUE or rawHealing)
        local playerDto = {
            heroName = PlayerResource:GetSelectedHeroName(playerId),
            steamId = PlayerResource:GetSteamAccountID(playerId),
            playerId = playerId,
            teamId = PlayerResource:GetTeam(playerId),
            isDisconnected = PlayerResource:GetConnectionState(playerId) ~= DOTA_CONNECTION_STATE_CONNECTED,
            level = PlayerResource:GetLevel(playerId),
            totalGoldEarned = self:GetSettlementGold(playerId),
            kills = PlayerResource:GetKills(playerId),
            deaths = PlayerResource:GetDeaths(playerId),
            assists = PlayerResource:GetAssists(playerId),
            heroDamage = PlayerResource:GetRawPlayerDamage(playerId),
            damageTaken = damageTaken,
            healing = safeHealing,
            lastHits = PlayerResource:GetLastHits(playerId),
            towerKills = PlayerResource:GetTowerKills(playerId),
            score = 0,
            battlePoints = 0
        }
        playerDto.score = self:CalculateSettlementPlayerScore(playerDto, abyssWave, realPlayerCount <= 1)
        local rawBattlePoints = self:CalculatePlayerBattlePoints(playerDto, difficultyMultiplier, winnerTeamId, realPlayerCount <= 1)
        local playerInfo = CustomNetTables:GetTableValue(
            "player_table",
            tostring(playerDto.steamId)
        )
        local conductPoint = playerInfo and playerInfo.conductPoint or 100
        local conductMultiplier = self:GetConductMultiplier(conductPoint, isTeamGame)
        local tipBonusPoints = PlayerTip:GetReceivedBonus(playerId)
        local finalBattlePoints = math.max(
            0,
            math.floor(rawBattlePoints * conductMultiplier + 0.5)
        ) + tipBonusPoints
        local pointModifier = finalBattlePoints - rawBattlePoints
        playerDto.battlePoints = finalBattlePoints
        players[#players + 1] = playerDto
        CustomNetTables:SetTableValue(
            "player_stats",
            tostring(playerId),
            {
                steamId = tostring(playerDto.steamId),
                heroDamage = playerDto.heroDamage,
                damage = playerDto.damage or playerDto.heroDamage or 0,
                damagereceived = damageTaken,
                healing = playerDto.healing,
                points = playerDto.battlePoints,
                pointModifier = pointModifier,
                tipBonusPoints = tipBonusPoints,
                conductPoint = conductPoint,
                str = hero:GetStrength(),
                agi = hero:GetAgility(),
                int = hero:GetIntellect(false),
                towerKills = playerDto.towerKills
            }
        )
    end)
    local gameEndDto = {
        isWin = winnerTeamId == DOTA_TEAM_GOODGUYS,
        matchId = tostring(GameRules:Script_GetMatchID()),
        version = GameConfig.GAME_VERSION,
        difficulty = reportedDifficulty,
        steamId = 0,
        gameOptions = gameOptions,
        winnerTeamId = winnerTeamId,
        gameTimeMsec = math.floor(gameTime * 1000 + 0.5),
        countryCode = GA4.countryCode,
        players = players
    }
    if abyssWave ~= nil then
        gameEndDto.abyssWave = abyssWave
        gameEndDto.isAbyssProgress = isAbyssProgress
    end
    return gameEndDto
end
function GameEnd.BuildGameEndDto2(self, winnerTeamId, abyssWave, isAbyssProgress)
    if isAbyssProgress == nil then
        isAbyssProgress = false
    end
    local gameOptionsData = CustomNetTables:GetTableValue("game_options", "game_options")
    local ____opt_21 = CustomNetTables:GetTableValue("game_difficulty", "all")
    local difficulty = ____opt_21 and ____opt_21.difficulty or 0
    local reportedDifficulty = self:GetReportedDifficulty(difficulty, isAbyssProgress)
    local gameOptions = {
        multiplierRadiant = gameOptionsData.multiplier_radiant,
        multiplierDire = gameOptionsData.multiplier_dire,
        multiplierDireXp = gameOptionsData.multiplier_dire_xp,
        playerNumberRadiant = gameOptionsData.player_number_radiant,
        playerNumberDire = gameOptionsData.player_number_dire,
        towerPowerPct = gameOptionsData.tower_power_pct
    }
    local gameTime = GameRules:GetDOTATime(false, true)
    local difficultyMultiplier = GameEndPoint:GetDifficultyMultiplier(
        reportedDifficulty,
        ApiClient:IsLocalhost(),
        GameRules.Option
    )
    local players = {}
    local allSteamIds = {}
    PlayerHelper:ForEachPlayer(function(____, playerId)
        allSteamIds[#allSteamIds + 1] = PlayerResource:GetSteamAccountID(playerId)
    end)
    local realPlayerCount = #__TS__ArrayFilter(
        allSteamIds,
        function(____, id) return id > 0 end
    )
    PlayerHelper:ForEachPlayer(function(____, playerId)
        local player = PlayerResource:GetPlayer(playerId)
        if not player then
            return
        end
        local hero = player:GetAssignedHero()
        if not hero then
            return
        end
        local damageTaken = 0
        do
            local victimID = 0
            while victimID < DOTA_MAX_TEAM_PLAYERS do
                if PlayerResource:IsValidPlayerID(victimID) and PlayerResource:IsValidPlayer(victimID) and PlayerResource:GetSelectedHeroEntity(victimID) then
                    if PlayerResource:GetTeam(victimID) ~= PlayerResource:GetTeam(playerId) then
                        damageTaken = damageTaken + PlayerResource:GetDamageDoneToHero(victimID, playerId)
                    end
                end
                victimID = victimID + 1
            end
        end
        local MAX_DAMAGE_VALUE = 99999999
        local rawHealing = PlayerResource:GetHealing(playerId)
        local safeHealing = __TS__NumberIsFinite(rawHealing) and rawHealing >= 0 and rawHealing <= MAX_DAMAGE_VALUE and rawHealing or (rawHealing < 0 and MAX_DAMAGE_VALUE or rawHealing)
        local baseplayerDto = {
            heroName = PlayerResource:GetSelectedHeroName(playerId),
            steamId = PlayerResource:GetSteamAccountID(playerId),
            playerId = playerId,
            teamId = PlayerResource:GetTeam(playerId),
            isDisconnected = PlayerResource:GetConnectionState(playerId) ~= DOTA_CONNECTION_STATE_CONNECTED,
            level = PlayerResource:GetLevel(playerId),
            gold = self:GetSettlementGold(playerId),
            kills = PlayerResource:GetKills(playerId),
            deaths = PlayerResource:GetDeaths(playerId),
            assists = PlayerResource:GetAssists(playerId),
            damage = PlayerResource:GetRawPlayerDamage(playerId),
            damageTaken = damageTaken,
            healing = safeHealing,
            lastHits = PlayerResource:GetLastHits(playerId),
            towerKills = PlayerResource:GetTowerKills(playerId),
            score = 0,
            battlePoints = 0,
            facetId = hero:GetHeroFacetID()
        }
        baseplayerDto.score = self:CalculateSettlementPlayerScore(baseplayerDto, abyssWave, realPlayerCount <= 1)
        local tipBonusPoints = PlayerTip:GetReceivedBonus(playerId)
        baseplayerDto.battlePoints = self:CalculatePlayerBattlePoints(baseplayerDto, difficultyMultiplier, winnerTeamId, realPlayerCount <= 1) + tipBonusPoints
        local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
        local abilityNames
        if PlayerResource:GetSteamAccountID(playerId) == 0 then
            local botAbilities = CustomNetTables:GetTableValue(
                "bot_abilities",
                tostring(playerId)
            )
            if botAbilities ~= nil then
                abilityNames = {botAbilities.AbilityName or "", botAbilities.AbilityName1 or "", botAbilities.AbilityName2 or ""}
            else
                abilityNames = {"", "", ""}
            end
        else
            local LotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
            abilityNames = {LotteryStatus.activeAbilityName or "", LotteryStatus.passiveAbilityName or "", LotteryStatus.passiveAbilityName2 or ""}
        end
        local strModifier = hero:FindModifierByName("modifier_str_tome")
        local agiModifier = hero:FindModifierByName("modifier_agi_tome")
        local intModifier = hero:FindModifierByName("modifier_int_tome")
        local str_book = strModifier and strModifier:GetStackCount() or 0
        local agi_book = agiModifier and agiModifier:GetStackCount() or 0
        local int_book = intModifier and intModifier:GetStackCount() or 0
        local luoshu_book = hero:HasModifier("modifier_luoshu_tome") and 1 or 0
        local isAwakened = (Treasure:IsPlayerAwakened(playerId, hero) or AbilityReplacer:HasAwakeningAbility(hero)) and 1 or 0
        local ____temp_39 = PlayerResource:GetSteamAccountID(playerId)
        local ____opt_23 = hero:GetItemInSlot(0)
        local ____temp_40 = ____opt_23 and ____opt_23:GetAbilityName()
        local ____opt_25 = hero:GetItemInSlot(1)
        local ____temp_41 = ____opt_25 and ____opt_25:GetAbilityName()
        local ____opt_27 = hero:GetItemInSlot(2)
        local ____temp_42 = ____opt_27 and ____opt_27:GetAbilityName()
        local ____opt_29 = hero:GetItemInSlot(3)
        local ____temp_43 = ____opt_29 and ____opt_29:GetAbilityName()
        local ____opt_31 = hero:GetItemInSlot(4)
        local ____temp_44 = ____opt_31 and ____opt_31:GetAbilityName()
        local ____opt_33 = hero:GetItemInSlot(5)
        local ____temp_45 = ____opt_33 and ____opt_33:GetAbilityName()
        local ____opt_35 = hero:GetItemInSlot(16)
        local ____temp_46 = ____opt_35 and ____opt_35:GetAbilityName()
        local ____opt_37 = hero:GetItemInSlot(17)
        local itemBuild = {
            steamId = ____temp_39,
            slot1 = ____temp_40,
            slot2 = ____temp_41,
            slot3 = ____temp_42,
            slot4 = ____temp_43,
            slot5 = ____temp_44,
            slot6 = ____temp_45,
            neutralActiveSlot = ____temp_46,
            neutralPassiveSlot = ____opt_37 and ____opt_37:GetAbilityName()
        }
        local playerName = self:GetReportedPlayerName(
            playerId,
            PlayerResource:GetSteamAccountID(playerId)
        )
        local playerDto = __TS__ObjectAssign({}, baseplayerDto, {
            playerName = playerName,
            abilityNames = abilityNames,
            itemBuild = itemBuild,
            str_book = str_book,
            agi_book = agi_book,
            int_book = int_book,
            luoshu_book = luoshu_book,
            isAwakened = isAwakened
        })
        players[#players + 1] = playerDto
        CustomNetTables:SetTableValue(
            "player_stats",
            tostring(playerId),
            {
                steamId = tostring(playerDto.steamId),
                damage = playerDto.damage or 0,
                damagereceived = damageTaken,
                healing = playerDto.healing,
                points = playerDto.battlePoints,
                tipBonusPoints = tipBonusPoints,
                str = hero:GetStrength(),
                agi = hero:GetAgility(),
                int = hero:GetIntellect(false),
                towerKills = playerDto.towerKills
            }
        )
    end)
    local gameEndDto = {
        matchId = tostring(GameRules:Script_GetMatchID()),
        version = GameConfig.GAME_VERSION,
        difficulty = reportedDifficulty,
        steamId = 0,
        gameOptions = gameOptions,
        winnerTeamId = winnerTeamId,
        gameTimeMsec = math.floor(gameTime * 1000 + 0.5),
        playerSteamIds = __TS__ArrayFilter(
            __TS__ArrayMap(
                players,
                function(____, p) return p.steamId end
            ),
            function(____, id) return id ~= 0 end
        ),
        players = players
    }
    if abyssWave ~= nil then
        gameEndDto.abyssWave = abyssWave
        gameEndDto.isAbyssProgress = isAbyssProgress
    end
    return gameEndDto
end
function GameEnd.CalculatePlayerBattlePoints(self, player, difficultyMultiplier, winnerTeamId, isSoloGame)
    if isSoloGame == nil then
        isSoloGame = false
    end
    if player.steamId == 0 then
        return 0
    end
    local teamKills = PlayerResource:GetTeamKills(player.teamId)
    local participationMultiplier = GameEndPoint:GetParticipationRateMultiplier(player, teamKills)
    local ____opt_47 = GameRules.Option
    local activityMultiplier = ____opt_47 and ____opt_47.abyssMode and GameEndPoint:GetAbyssActivityTimeMultiplier(player) or 1
    local timeMultiplier = participationMultiplier * activityMultiplier
    local ____opt_49 = GameRules.Option
    local baseGameTimePoints = ____opt_49 and ____opt_49.abyssMode and GameEndPoint:GetAbyssGameTimePoints(
        GameRules:GetGameTime(),
        isSoloGame
    ) or GameEndPoint:GetGameTimePoints(GameRules:GetGameTime())
    local gameTimePoints = baseGameTimePoints * timeMultiplier
    local basePoints = player.score + gameTimePoints
    local points = basePoints * difficultyMultiplier
    local winMultiplier = player.teamId == winnerTeamId and 1 or 0.5
    local finalPoints = points * winMultiplier
    ApiClient:DebugLog("[DEBUG] Points before penalty: " .. tostring(finalPoints))
    local gameTime = GameRules:GetGameTime()
    local gameTimeMinutes = gameTime / 60
    local isWinner = player.teamId == winnerTeamId
    if GameRules.Option and GameRules.Option.midOnlyMode and gameTimeMinutes < 12 and isWinner then
        local penaltyMultiplier = 0.2 + (gameTimeMinutes - 1) * 0.07
        finalPoints = finalPoints * math.max(0, penaltyMultiplier)
        ApiClient:DebugLog(((("[DEBUG] Points after penalty: " .. tostring(finalPoints)) .. " (reduced by ") .. tostring(math.max(0, penaltyMultiplier))) .. ")")
    else
        ApiClient:DebugLog("[DEBUG] No time penalty applied")
    end
    return math.max(
        0,
        math.floor(finalPoints + 0.5)
    )
end
function GameEnd.CalculateSettlementPlayerScore(self, player, abyssWave, isSoloGame)
    if isSoloGame == nil then
        isSoloGame = false
    end
    local ____opt_51 = GameRules.Option
    if ____opt_51 and ____opt_51.abyssMode then
        return GameEndPoint:CalculateAbyssPlayerScore(player, abyssWave or 0, isSoloGame)
    end
    return GameEndPoint:CalculatePlayerScore(player)
end
function GameEnd.GetConductMultiplier(self, conductPoint, isTeamGame)
    if not isTeamGame then
        return 1
    end
    if conductPoint >= 110 then
        return 1.1
    end
    if conductPoint >= 80 then
        return 1
    end
    if conductPoint >= 60 then
        return 0.8
    end
    return 0.5
end
function GameEnd.SendAnalyticsEvent(self, gameEndDto)
    local isWin = gameEndDto.winnerTeamId == DOTA_TEAM_GOODGUYS
    local picks = self:CollectAbilityPicks(gameEndDto.players)
    if #picks > 0 then
        Analytics:SendGameEndPickAbilitiesEvent({
            matchId = gameEndDto.matchId,
            version = gameEndDto.version,
            difficulty = gameEndDto.difficulty,
            picks = picks,
            isWin = isWin
        })
    end
    local items = self:CollectItemBuilds(gameEndDto.players)
    if #items > 0 then
        Analytics:SendGameEndItemBuildsEvent({
            matchId = gameEndDto.matchId,
            version = gameEndDto.version,
            difficulty = gameEndDto.difficulty,
            items = items,
            isWin = isWin
        })
    end
end
function GameEnd.CollectAbilityPicks(self, players)
    local picks = {}
    __TS__ArrayForEach(
        players,
        function(____, player)
            if player.steamId <= 0 then
                return
            end
            local steamAccountID = tostring(player.steamId)
            local LotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
            if LotteryStatus.activeAbilityName then
                picks[#picks + 1] = {steamId = player.steamId, name = LotteryStatus.activeAbilityName, type = "abilityActive", level = LotteryStatus.activeAbilityLevel or 0}
            end
            if LotteryStatus.passiveAbilityName then
                picks[#picks + 1] = {steamId = player.steamId, name = LotteryStatus.passiveAbilityName, type = "abilityPassive", level = LotteryStatus.passiveAbilityLevel or 0}
            end
            if GameRules.Option.extraPassiveAbilities and LotteryStatus.passiveAbilityName2 then
                picks[#picks + 1] = {steamId = player.steamId, name = LotteryStatus.passiveAbilityName2, type = "abilityPassive", level = LotteryStatus.passiveAbilityLevel2 or 0}
            end
        end
    )
    return picks
end
function GameEnd.CollectItemBuilds(self, players)
    local items = {}
    __TS__ArrayForEach(
        players,
        function(____, player)
            if player.steamId <= 0 then
                return
            end
            local hero = PlayerResource:GetSelectedHeroEntity(player.playerId)
            if not hero then
                return
            end
            local itemBuild = {steamId = player.steamId}
            do
                local i = 0
                while i < 6 do
                    local item = hero:GetItemInSlot(i)
                    if item then
                        local itemName = item:GetAbilityName()
                        if i == 0 then
                            itemBuild.slot1 = itemName
                        elseif i == 1 then
                            itemBuild.slot2 = itemName
                        elseif i == 2 then
                            itemBuild.slot3 = itemName
                        elseif i == 3 then
                            itemBuild.slot4 = itemName
                        elseif i == 4 then
                            itemBuild.slot5 = itemName
                        elseif i == 5 then
                            itemBuild.slot6 = itemName
                        end
                    end
                    i = i + 1
                end
            end
            local neutralActiveItem = hero:GetItemInSlot(DOTA_ITEM_NEUTRAL_ACTIVE_SLOT)
            if neutralActiveItem then
                itemBuild.neutralActiveSlot = neutralActiveItem:GetAbilityName()
            end
            local neutralPassiveItem = hero:GetItemInSlot(DOTA_ITEM_NEUTRAL_PASSIVE_SLOT)
            if neutralPassiveItem then
                itemBuild.neutralPassiveSlot = neutralPassiveItem:GetAbilityName()
            end
            items[#items + 1] = itemBuild
        end
    )
    return items
end
GameEnd.gameEndTriggered = false
GameEnd = __TS__DecorateLegacy({reloadable}, GameEnd)
____exports.GameEnd = GameEnd
return ____exports
