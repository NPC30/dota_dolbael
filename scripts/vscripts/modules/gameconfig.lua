local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/GameConfig.lua"
__TS__SourceMapTraceBack("modules/GameConfig.lua", {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 13,["11"] = 15,["12"] = 16,["13"] = 18,["14"] = 19,["15"] = 20,["16"] = 21,["17"] = 22,["18"] = 23,["19"] = 25,["20"] = 26,["21"] = 27,["22"] = 28,["23"] = 29,["24"] = 31,["25"] = 33,["26"] = 34,["27"] = 39,["28"] = 41,["29"] = 42,["30"] = 43,["31"] = 45,["32"] = 46,["33"] = 47,["34"] = 48,["35"] = 49,["36"] = 50,["37"] = 51,["38"] = 52,["39"] = 53,["40"] = 54,["41"] = 55,["42"] = 57,["43"] = 58,["44"] = 59,["45"] = 60,["46"] = 61,["47"] = 71,["48"] = 72,["49"] = 73,["50"] = 82,["51"] = 83,["52"] = 84,["53"] = 86,["54"] = 87,["55"] = 88,["56"] = 89,["57"] = 90,["58"] = 91,["59"] = 92,["61"] = 12,["62"] = 96,["63"] = 98,["64"] = 98,["65"] = 98,["66"] = 98,["67"] = 98,["68"] = 98,["69"] = 98,["70"] = 98,["71"] = 98,["72"] = 98,["73"] = 98,["74"] = 98,["75"] = 98,["76"] = 98,["77"] = 98,["78"] = 98,["79"] = 98,["80"] = 98,["81"] = 98,["82"] = 98,["83"] = 98,["84"] = 98,["85"] = 98,["86"] = 98,["87"] = 98,["88"] = 98,["89"] = 98,["90"] = 98,["91"] = 98,["92"] = 98,["93"] = 98,["94"] = 98,["95"] = 131,["97"] = 132,["98"] = 132,["99"] = 133,["100"] = 132,["103"] = 135,["104"] = 136,["105"] = 137,["106"] = 138,["107"] = 139,["108"] = 96,["109"] = 2,["110"] = 3,["111"] = 4,["112"] = 6,["113"] = 7,["114"] = 8,["115"] = 9,["116"] = 10});
local ____exports = {}
____exports.GameConfig = __TS__Class()
local GameConfig = ____exports.GameConfig
GameConfig.name = "GameConfig"
function GameConfig.prototype.____constructor(self)
    SendToServerConsole("dota_max_physical_items_purchase_limit 9999")
    Convars:SetBool("dota_bot_mode", true)
    Convars:SetBool("dota_bot_disable", false)
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_GOODGUYS, 10)
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_BADGUYS, 10)
    GameRules:LockCustomGameSetupTeamAssignment(false)
    GameRules:EnableCustomGameSetupAutoLaunch(true)
    GameRules:SetCustomGameSetupAutoLaunchDelay(50)
    GameRules:SetCustomGameSetupRemainingTime(3)
    GameRules:SetHeroSelectionTime(50)
    GameRules:SetHeroSelectPenaltyTime(10)
    GameRules:SetStrategyTime(10)
    GameRules:SetShowcaseTime(0)
    GameRules:SetPreGameTime(____exports.GameConfig.PRE_GAME_TIME)
    GameRules:SetSameHeroSelectionEnabled(true)
    GameRules:SetGoldTickTime(1)
    GameRules:SetGoldPerTick(3)
    GameRules:SetUseUniversalShopMode(true)
    GameRules:SetCustomGameEndDelay(30)
    GameRules:SetFilterMoreGold(true)
    GameRules:SetTimeOfDay(0.25)
    local game = GameRules:GetGameModeEntity()
    game:SetPauseEnabled(true)
    GameRules:SetCustomGameBansPerTeam(5)
    GameRules:SetHideBlacklistedHeroes(true)
    game:SetDraftingBanningTimeOverride(10)
    game:SetDraftingHeroPickSelectTimeOverride(40)
    print("[HeroBanPick][Config] SetCustomGameBansPerTeam=5")
    print("[HeroBanPick][Config] SetHideBlacklistedHeroes=true")
    print("[HeroBanPick][Config] SetDraftingBanningTimeOverride=10")
    print("[HeroBanPick][Config] SetDraftingHeroPickSelectTimeOverride=40")
    game:SetUseDefaultDOTARuneSpawnLogic(true)
    game:SetFreeCourierModeEnabled(true)
    game:SetSelectionGoldPenaltyEnabled(true)
    game:SetLoseGoldOnDeath(false)
    game:SetCustomBuybackCostEnabled(true)
    game:SetCustomGlyphCooldown(180)
    game:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ARMOR, 0.125)
    game:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP, 25)
    game:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_ALL_DAMAGE, 0.5)
    game:SetTowerBackdoorProtectionEnabled(true)
    game:SetMaximumAttackSpeed(700)
    game:SetMinimumAttackSpeed(20)
    if IsInToolsMode() then
        print("[GameConfig] 开发者模式快速开始游戏")
        GameRules:SetCustomGameSetupAutoLaunchDelay(10)
        GameRules:SetHeroSelectionTime(25)
        GameRules:SetHeroSelectPenaltyTime(1)
        GameRules:SetStrategyTime(3)
        GameRules:SetPreGameTime(60)
    end
end
function GameConfig.SetMaxLevelXPRequire(self)
    local xpRequireMap = {
        [1] = 0,
        [2] = 230,
        [3] = 600,
        [4] = 1100,
        [5] = 1750,
        [6] = 2550,
        [7] = 3500,
        [8] = 4600,
        [9] = 5800,
        [10] = 7100,
        [11] = 8500,
        [12] = 10000,
        [13] = 11600,
        [14] = 13300,
        [15] = 15100,
        [16] = 17000,
        [17] = 19000,
        [18] = 21100,
        [19] = 23300,
        [20] = 25600,
        [21] = 28100,
        [22] = 30850,
        [23] = 33850,
        [24] = 37100,
        [25] = 40600,
        [26] = 44600,
        [27] = 49100,
        [28] = 54100,
        [29] = 59600,
        [30] = 65600
    }
    local maxLevel = GameRules.Option.maxLevel
    do
        local i = 31
        while i <= maxLevel do
            xpRequireMap[i] = xpRequireMap[i - 1] + i * 200
            i = i + 1
        end
    end
    GameRules:SetUseCustomHeroXPValues(true)
    local game = GameRules:GetGameModeEntity()
    game:SetCustomXPRequiredToReachNextLevel(xpRequireMap)
    game:SetUseCustomHeroLevels(true)
    game:SetCustomHeroMaxLevel(maxLevel)
end
GameConfig.GAME_VERSION = "v5.41c"
GameConfig.MEMBER_BUYBACK_CD = 120
GameConfig.PRE_GAME_TIME = 60
GameConfig.LOW_LEVEL_BASE_XP = 60
GameConfig.LOW_LEVEL_XP_FACTOR = 0.072
GameConfig.LEVEL_THRESHOLD = 30
GameConfig.HIGH_LEVEL_BASE_XP = 3000
GameConfig.HIGH_LEVEL_XP_FACTOR = 0.03
return ____exports
