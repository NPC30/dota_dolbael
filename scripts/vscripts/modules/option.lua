local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/option.lua"
__TS__SourceMapTraceBack("modules/option.lua", {["10"] = 1,["11"] = 1,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 6,["17"] = 6,["18"] = 6,["20"] = 7,["21"] = 8,["22"] = 9,["23"] = 10,["24"] = 11,["25"] = 12,["26"] = 14,["27"] = 15,["28"] = 16,["29"] = 17,["30"] = 18,["31"] = 19,["32"] = 20,["33"] = 21,["34"] = 22,["35"] = 23,["36"] = 24,["37"] = 25,["38"] = 27,["39"] = 29,["40"] = 31,["41"] = 34,["42"] = 34,["43"] = 34,["44"] = 34,["45"] = 34,["46"] = 34,["47"] = 34,["48"] = 35,["49"] = 35,["50"] = 35,["51"] = 35,["52"] = 35,["53"] = 35,["54"] = 35,["55"] = 36,["56"] = 39,["57"] = 39,["58"] = 39,["59"] = 40,["60"] = 39,["61"] = 39,["62"] = 44,["63"] = 44,["64"] = 44,["65"] = 45,["66"] = 44,["67"] = 44,["68"] = 47,["69"] = 47,["70"] = 47,["71"] = 48,["72"] = 47,["73"] = 47,["74"] = 51,["75"] = 51,["76"] = 51,["77"] = 51,["78"] = 51,["79"] = 38,["80"] = 54,["81"] = 55,["82"] = 58,["83"] = 59,["84"] = 60,["87"] = 54,["88"] = 65,["89"] = 67,["90"] = 71,["91"] = 72,["92"] = 74,["93"] = 75,["94"] = 76,["95"] = 76,["96"] = 76,["97"] = 76,["98"] = 76,["100"] = 81,["101"] = 84,["102"] = 87,["103"] = 88,["104"] = 88,["105"] = 88,["106"] = 89,["107"] = 88,["108"] = 88,["110"] = 92,["111"] = 92,["112"] = 92,["113"] = 93,["114"] = 92,["115"] = 92,["117"] = 65,["118"] = 97,["119"] = 98,["120"] = 100,["121"] = 101,["122"] = 102,["124"] = 106,["125"] = 108,["126"] = 113,["127"] = 114,["128"] = 115,["129"] = 115,["130"] = 115,["131"] = 115,["132"] = 115,["134"] = 122,["135"] = 122,["136"] = 122,["137"] = 122,["138"] = 122,["139"] = 128,["140"] = 128,["142"] = 129,["144"] = 97,["145"] = 132,["146"] = 133,["147"] = 134,["148"] = 135,["149"] = 136,["150"] = 137,["151"] = 138,["152"] = 139,["153"] = 140,["154"] = 141,["155"] = 142,["156"] = 143,["157"] = 144,["158"] = 145,["159"] = 146,["161"] = 148,["162"] = 149,["164"] = 152,["165"] = 153,["167"] = 155,["168"] = 156,["169"] = 157,["170"] = 158,["171"] = 159,["172"] = 160,["173"] = 161,["174"] = 162,["175"] = 163,["176"] = 164,["177"] = 165,["178"] = 166,["179"] = 167,["180"] = 168,["181"] = 169,["182"] = 170,["183"] = 171,["184"] = 172,["185"] = 173,["186"] = 174,["187"] = 175,["188"] = 176,["190"] = 178,["192"] = 180,["193"] = 181,["194"] = 182,["195"] = 183,["196"] = 184,["198"] = 186,["199"] = 187,["200"] = 188,["201"] = 189,["202"] = 190,["203"] = 191,["204"] = 192,["205"] = 194,["206"] = 195,["207"] = 196,["209"] = 198,["210"] = 199,["212"] = 201,["213"] = 202,["214"] = 204,["215"] = 205,["217"] = 132,["218"] = 209,["219"] = 210,["220"] = 209,["221"] = 213,["222"] = 214,["225"] = 218,["226"] = 219,["227"] = 220,["228"] = 221,["229"] = 222,["230"] = 223,["231"] = 224,["232"] = 225,["233"] = 226,["234"] = 227,["235"] = 228,["236"] = 229,["237"] = 213,["238"] = 232,["239"] = 233,["240"] = 234,["241"] = 235,["242"] = 236,["243"] = 237,["244"] = 238,["245"] = 239,["246"] = 240,["247"] = 241,["248"] = 242,["249"] = 243,["250"] = 244,["251"] = 245,["252"] = 246,["253"] = 247,["254"] = 248,["255"] = 232,["256"] = 251,["257"] = 256,["258"] = 257,["259"] = 258,["260"] = 259,["262"] = 262,["263"] = 263,["264"] = 264,["265"] = 265,["266"] = 266,["267"] = 267,["268"] = 251,["269"] = 270,["270"] = 271,["271"] = 270,["272"] = 274,["273"] = 278,["274"] = 280,["275"] = 284,["276"] = 284,["277"] = 284,["278"] = 284,["279"] = 284,["280"] = 284,["281"] = 284,["282"] = 284,["283"] = 284,["284"] = 283,["285"] = 285,["286"] = 285,["287"] = 285,["288"] = 285,["289"] = 285,["290"] = 285,["291"] = 285,["292"] = 285,["293"] = 285,["294"] = 283,["295"] = 286,["296"] = 286,["297"] = 286,["298"] = 286,["299"] = 286,["300"] = 286,["301"] = 286,["302"] = 286,["303"] = 286,["304"] = 283,["305"] = 287,["306"] = 287,["307"] = 287,["308"] = 287,["309"] = 287,["310"] = 287,["311"] = 287,["312"] = 287,["313"] = 287,["314"] = 283,["315"] = 288,["316"] = 288,["317"] = 288,["318"] = 288,["319"] = 288,["320"] = 288,["321"] = 288,["322"] = 288,["323"] = 288,["324"] = 283,["325"] = 289,["326"] = 289,["327"] = 289,["328"] = 289,["329"] = 289,["330"] = 289,["331"] = 289,["332"] = 289,["333"] = 289,["334"] = 283,["335"] = 290,["336"] = 290,["337"] = 290,["338"] = 290,["339"] = 290,["340"] = 290,["341"] = 290,["342"] = 290,["343"] = 290,["344"] = 283,["345"] = 291,["346"] = 291,["347"] = 291,["348"] = 291,["349"] = 291,["350"] = 291,["351"] = 291,["352"] = 291,["353"] = 291,["354"] = 283,["355"] = 292,["356"] = 292,["357"] = 292,["358"] = 292,["359"] = 292,["360"] = 292,["361"] = 292,["362"] = 292,["363"] = 292,["364"] = 283,["365"] = 293,["366"] = 293,["367"] = 293,["368"] = 293,["369"] = 293,["370"] = 293,["371"] = 293,["372"] = 293,["373"] = 293,["374"] = 283,["375"] = 283,["376"] = 295,["377"] = 296,["378"] = 296,["379"] = 296,["380"] = 296,["381"] = 296,["382"] = 296,["383"] = 296,["384"] = 296,["385"] = 296,["386"] = 296,["387"] = 296,["389"] = 298,["390"] = 299,["391"] = 300,["393"] = 302,["394"] = 302,["395"] = 302,["396"] = 302,["397"] = 302,["398"] = 302,["399"] = 302,["401"] = 305,["402"] = 306,["404"] = 308,["405"] = 309,["407"] = 311,["408"] = 274,["409"] = 314,["410"] = 323,["411"] = 323,["413"] = 325,["414"] = 325,["415"] = 325,["416"] = 325,["417"] = 325,["418"] = 325,["419"] = 325,["420"] = 325,["421"] = 325,["422"] = 325,["423"] = 325,["424"] = 325,["425"] = 325,["426"] = 325,["427"] = 325,["428"] = 325,["429"] = 325,["430"] = 325,["431"] = 325,["432"] = 325,["433"] = 314,["434"] = 347,["435"] = 348,["436"] = 348,["437"] = 348,["438"] = 348,["439"] = 348,["440"] = 352,["441"] = 347,["442"] = 355,["443"] = 356,["444"] = 357,["445"] = 358,["446"] = 359,["447"] = 360,["448"] = 361,["449"] = 361,["450"] = 361,["451"] = 361,["452"] = 365,["453"] = 366,["454"] = 367,["457"] = 359,["458"] = 371,["459"] = 373,["461"] = 375,["462"] = 377,["464"] = 379,["465"] = 380,["466"] = 381,["467"] = 382,["468"] = 383,["470"] = 355,["471"] = 387,["472"] = 389,["473"] = 390,["474"] = 391,["475"] = 392,["476"] = 393,["477"] = 394,["478"] = 395,["480"] = 387,["481"] = 399,["482"] = 400,["483"] = 400,["484"] = 400,["485"] = 400,["486"] = 401,["487"] = 401,["488"] = 401,["489"] = 400,["490"] = 400,["491"] = 399,["492"] = 409,["493"] = 410,["494"] = 409});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local ____game_2Dend_2Dpoint = require("modules.event.game-end.game-end-point")
local GameEndPoint = ____game_2Dend_2Dpoint.GameEndPoint
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
____exports.Option = __TS__Class()
local Option = ____exports.Option
Option.name = "Option"
function Option.prototype.____constructor(self)
    self.radiantGoldXpMultiplier = 1
    self.direGoldXpMultiplier = 1
    self.direXpMultiplier = 1
    self.radiantPlayerNumber = 10
    self.direPlayerNumber = 10
    self.towerPower = 100
    self.startingGoldPlayer = 1000
    self.startingGoldBot = 1000
    self.respawnTimePercentage = 100
    self.maxLevel = 50
    self.fixedAbility = "none"
    self.sameHeroSelection = false
    self.enablePlayerAttribute = true
    self.extraPassiveAbilities = true
    self.midOnlyMode = false
    self.abyssMode = false
    self.abyssStrictLimits = true
    self.randomDraftMode = false
    self.gameDifficulty = 0
    self.multiplierStage = 0
    self.MID_ONLY_BOT_STARTING_GOLD_BONUS = 3000
    self.MULTIPLIER_MODE_21 = {
        20,
        25,
        30,
        35,
        40
    }
    self.MULTIPLIER_MODE_41 = {
        20,
        40,
        60,
        80,
        100
    }
    self.STAGE_INTERVAL = 180
    CustomGameEventManager:RegisterListener(
        "game_options_change",
        function(_, keys)
            return self:OnGameOptionChange(keys)
        end
    )
    CustomGameEventManager:RegisterListener(
        "choose_difficulty",
        function(_, keys)
            return self:OnChooseDifficulty(keys)
        end
    )
    CustomGameEventManager:RegisterListener(
        "vote_end",
        function(_, _key)
            return self:CalculateDifficulty(true)
        end
    )
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:onGameStateChange() end,
        self
    )
end
function Option.prototype.onGameStateChange(self)
    local state = GameRules:State_Get()
    if state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        if self.direGoldXpMultiplier == 21 or self.direGoldXpMultiplier == 41 then
            self:startDynamicMultiplier()
        end
    end
end
function Option.prototype.startDynamicMultiplier(self)
    local stages = self.direGoldXpMultiplier == 21 and self.MULTIPLIER_MODE_21 or self.MULTIPLIER_MODE_41
    self.multiplierStage = 0
    self.direGoldXpMultiplier = stages[1]
    local currentOptions = CustomNetTables:GetTableValue("game_options", "game_options")
    if currentOptions ~= nil then
        CustomNetTables:SetTableValue(
            "game_options",
            "game_options",
            __TS__ObjectAssign({}, currentOptions, {multiplier_dire = self.direGoldXpMultiplier})
        )
    end
    print("[DynamicMultiplier] 启动模式: " .. (self.direGoldXpMultiplier == 10 and (#stages == 7 and "21" or "41") or "unknown"))
    print(("[DynamicMultiplier] 初始倍率: " .. tostring(self.direGoldXpMultiplier)) .. "x")
    if self.midOnlyMode == true then
        self.dynamicMultiplierTimer = Timers:CreateTimer(
            self.STAGE_INTERVAL / 2,
            function()
                return self:updateDynamicMultiplier(stages)
            end
        )
    else
        self.dynamicMultiplierTimer = Timers:CreateTimer(
            self.STAGE_INTERVAL,
            function()
                return self:updateDynamicMultiplier(stages)
            end
        )
    end
end
function Option.prototype.updateDynamicMultiplier(self, stages)
    self.multiplierStage = self.multiplierStage + 1
    if self.multiplierStage >= #stages then
        print(("[DynamicMultiplier] 已达到最大倍率: " .. tostring(self.direGoldXpMultiplier)) .. "x")
        return nil
    end
    self.direGoldXpMultiplier = stages[self.multiplierStage + 1]
    print(((((("[DynamicMultiplier] 倍率提升至: " .. tostring(self.direGoldXpMultiplier)) .. "x (阶段 ") .. tostring(self.multiplierStage + 1)) .. "/") .. tostring(#stages)) .. ")")
    local currentOptions = CustomNetTables:GetTableValue("game_options", "game_options")
    if currentOptions ~= nil then
        CustomNetTables:SetTableValue(
            "game_options",
            "game_options",
            __TS__ObjectAssign({}, currentOptions, {multiplier_dire = self.direGoldXpMultiplier})
        )
    end
    GameRules:SendCustomMessage(
        ("<font color='#FF6B6B'>警告!</font> Bot 金钱/经验倍率提升至 <font color='#FFD700'>" .. tostring(self.direGoldXpMultiplier)) .. "x</font>",
        0,
        0
    )
    if self.midOnlyMode == true then
        return self.STAGE_INTERVAL / 2
    else
        return self.STAGE_INTERVAL
    end
end
function Option.prototype.OnGameOptionChange(self, keys)
    if self.gameDifficulty == 99 then
        keys.multiplier_radiant = 1.5
        keys.multiplier_dire = 12
        keys.player_number_dire = 10
        keys.tower_power_pct = 700
        keys.respawn_time_pct = 50
        keys.starting_gold_player = 7000
        keys.starting_gold_bot = 5000
        keys.max_level = 200
        keys.fixed_ability = "none"
        keys.same_hero_selection = 0
        keys.enable_player_attribute = 1
        keys.abyss_mode = 1
        keys.mid_only_mode = 1
    end
    if self.gameDifficulty == 8 or self.gameDifficulty == 9 then
        self:ApplyRandomDraftPreset(keys)
    end
    if keys.multiplier_dire >= 100 and keys.respawn_time_pct <= 50 then
        keys.respawn_time_pct = 50
    end
    print("[options]", keys.multiplier_dire, keys.respawn_time_pct)
    self.radiantGoldXpMultiplier = keys.multiplier_radiant
    self.direGoldXpMultiplier = keys.multiplier_dire
    self.direXpMultiplier = keys.multiplier_dire_xp or keys.multiplier_dire
    self.radiantPlayerNumber = keys.player_number_radiant
    self.direPlayerNumber = keys.player_number_dire
    self.towerPower = keys.tower_power_pct
    self.startingGoldPlayer = keys.starting_gold_player
    self.startingGoldBot = keys.starting_gold_bot
    self.respawnTimePercentage = keys.respawn_time_pct
    self.maxLevel = keys.max_level
    self.fixedAbility = keys.fixed_ability
    self.sameHeroSelection = self:IsEnabledOption(keys.same_hero_selection)
    self.enablePlayerAttribute = self:IsEnabledOption(keys.enable_player_attribute)
    self.abyssMode = self:IsEnabledOption(keys.abyss_mode)
    self.abyssStrictLimits = self:IsEnabledOption(keys.abyss_strict_limits)
    self.randomDraftMode = self:IsRandomDraftDifficulty(self.gameDifficulty)
    if self.gameDifficulty == 9 then
        self.direGoldXpMultiplier = 20
        self.direXpMultiplier = 20
        keys.multiplier_dire = 20
        keys.multiplier_dire_xp = 20
    else
        keys.multiplier_dire_xp = self.direXpMultiplier
    end
    self.extraPassiveAbilities = true
    self.midOnlyMode = self:IsEnabledOption(keys.mid_only_mode)
    if self.midOnlyMode and not self.abyssMode then
        self.startingGoldBot = self.startingGoldBot + self.MID_ONLY_BOT_STARTING_GOLD_BONUS
        keys.starting_gold_bot = self.startingGoldBot
    end
    keys.extra_passive_abilities = 1
    keys.same_hero_selection = self.sameHeroSelection and 1 or 0
    keys.enable_player_attribute = self.enablePlayerAttribute and 1 or 0
    keys.abyss_mode = self.abyssMode and 1 or 0
    keys.mid_only_mode = self.midOnlyMode and 1 or 0
    keys.abyss_strict_limits = self.abyssStrictLimits and 1 or 0
    self:SyncLegacyAIGameModeOptions()
    if self.sameHeroSelection then
        GameRules:SetHeroSelectionTime(2)
        GameRules:SetHeroSelectPenaltyTime(0)
    else
        GameRules:SetHeroSelectionTime(50)
        GameRules:SetHeroSelectPenaltyTime(10)
    end
    CustomNetTables:SetTableValue("game_options", "game_options", keys)
    self:PublishPointMultiplier()
    if self.direGoldXpMultiplier == 21 or self.direGoldXpMultiplier == 41 then
        print(("[Option] 检测到动态倍率模式: " .. tostring(self.direGoldXpMultiplier)) .. "x")
    end
end
function Option.prototype.IsEnabledOption(self, value)
    return value == 1 or value == true
end
function Option.prototype.SyncLegacyAIGameModeOptions(self)
    if AIGameMode == nil then
        return
    end
    AIGameMode.iDesiredRadiant = self.radiantPlayerNumber
    AIGameMode.iDesiredDire = self.direPlayerNumber
    AIGameMode.fPlayerGoldXpMultiplier = self.radiantGoldXpMultiplier
    AIGameMode.fBotGoldXpMultiplier = self.direGoldXpMultiplier
    AIGameMode.iRespawnTimePercentage = self.respawnTimePercentage
    AIGameMode.iMaxLevel = self.maxLevel
    AIGameMode.iTowerPower = self.towerPower
    AIGameMode.iStartingGoldPlayer = self.startingGoldPlayer
    AIGameMode.iStartingGoldBot = self.startingGoldBot
    AIGameMode.bSameHeroSelection = self.sameHeroSelection and 1 or 0
    AIGameMode.bMidOnlyMode = self.midOnlyMode and 1 or 0
    AIGameMode.bAbyssMode = self.abyssMode and 1 or 0
end
function Option.prototype.ApplyRandomDraftPreset(self, keys)
    local midOnlyMode = self:IsEnabledOption(keys.mid_only_mode)
    keys.multiplier_radiant = 1.5
    keys.multiplier_dire = self.gameDifficulty == 9 and 20 or 15
    keys.multiplier_dire_xp = self.gameDifficulty == 9 and 20 or 15
    keys.player_number_dire = 10
    keys.tower_power_pct = 500
    keys.respawn_time_pct = 50
    keys.starting_gold_player = 3000
    keys.starting_gold_bot = 7000
    keys.max_level = 135
    keys.fixed_ability = "none"
    keys.same_hero_selection = 0
    keys.enable_player_attribute = 1
    keys.abyss_mode = 0
    keys.abyss_strict_limits = 1
    keys.mid_only_mode = midOnlyMode and 1 or 0
end
function Option.prototype.ApplyStandalonePreset(self, mapName, difficulty, overrides)
    local preset = self:GetStandalonePreset(difficulty, overrides)
    if preset == nil then
        print((("[Option] standalone preset rejected: map=" .. mapName) .. ", difficulty=") .. tostring(difficulty))
        return false
    end
    self.gameDifficulty = difficulty
    self.randomDraftMode = self:IsRandomDraftDifficulty(difficulty)
    CustomNetTables:SetTableValue("game_difficulty", "all", {difficulty = difficulty})
    self:OnGameOptionChange(preset)
    print((("[Option] standalone preset applied: map=" .. mapName) .. ", difficulty=N") .. tostring(difficulty))
    return true
end
function Option.prototype.ApplyStandaloneAbyssPreset(self)
    self:ApplyStandalonePreset("abyss", 99)
end
function Option.prototype.GetStandalonePreset(self, difficulty, overrides)
    local preset
    local presets = {
        [1] = {
            2,
            100,
            5000,
            1000,
            100,
            50,
            false,
            false
        },
        [2] = {
            3,
            150,
            3000,
            1000,
            100,
            50,
            false,
            false
        },
        [3] = {
            4,
            200,
            3000,
            3000,
            100,
            50,
            false,
            false
        },
        [4] = {
            5,
            250,
            3000,
            3000,
            100,
            50,
            false,
            false
        },
        [5] = {
            7,
            300,
            3000,
            3000,
            100,
            50,
            false,
            false
        },
        [6] = {
            10,
            400,
            3000,
            5000,
            100,
            50,
            false,
            false
        },
        [7] = {
            15,
            500,
            3000,
            5000,
            50,
            135,
            false,
            false
        },
        [8] = {
            15,
            500,
            3000,
            7000,
            50,
            135,
            false,
            false
        },
        [9] = {
            20,
            500,
            3000,
            7000,
            50,
            135,
            false,
            false
        },
        [99] = {
            12,
            700,
            7000,
            5000,
            50,
            200,
            true,
            true
        }
    }
    if difficulty == 0 then
        preset = self:CreateStandalonePreset(
            20,
            500,
            5000,
            3000,
            50,
            200,
            true,
            false,
            false
        )
    else
        local values = presets[difficulty]
        if values == nil then
            return nil
        end
        local ____self_CreateStandalonePreset_1 = self.CreateStandalonePreset
        local ____array_0 = __TS__SparseArrayNew(unpack(values))
        __TS__SparseArrayPush(____array_0, true)
        preset = ____self_CreateStandalonePreset_1(
            self,
            __TS__SparseArraySpread(____array_0)
        )
    end
    if (overrides and overrides.midOnlyMode) ~= nil then
        preset.mid_only_mode = overrides.midOnlyMode and 1 or 0
    end
    if (overrides and overrides.abyssStrictLimits) ~= nil then
        preset.abyss_strict_limits = overrides.abyssStrictLimits and 1 or 0
    end
    return preset
end
function Option.prototype.CreateStandalonePreset(self, direMultiplier, towerPower, startingGoldPlayer, startingGoldBot, respawnTimePercentage, maxLevel, midOnlyMode, abyssMode, abyssStrictLimits)
    if abyssStrictLimits == nil then
        abyssStrictLimits = true
    end
    return {
        PlayerID = -1,
        multiplier_radiant = 1.5,
        multiplier_dire = direMultiplier,
        multiplier_dire_xp = direMultiplier,
        player_number_radiant = 1,
        player_number_dire = 10,
        tower_power_pct = towerPower,
        respawn_time_pct = respawnTimePercentage,
        starting_gold_player = startingGoldPlayer,
        starting_gold_bot = startingGoldBot,
        max_level = maxLevel,
        fixed_ability = "none",
        same_hero_selection = 0,
        enable_player_attribute = 1,
        extra_passive_abilities = 1,
        mid_only_mode = midOnlyMode and 1 or 0,
        abyss_mode = abyssMode and 1 or 0,
        abyss_strict_limits = abyssStrictLimits and 1 or 0
    }
end
function Option.prototype.OnChooseDifficulty(self, keys)
    CustomNetTables:SetTableValue(
        "difficulty_choice",
        tostring(keys.PlayerID),
        {difficulty = keys.difficulty}
    )
    self:CalculateDifficulty(false)
end
function Option.prototype.CalculateDifficulty(self, force)
    local playerCount = PlayerHelper:GetHumamPlayerCount()
    local playerChosen = 0
    local averageDifficulty = 0
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if PlayerResource:GetConnectionState(playerId) ~= DOTA_CONNECTION_STATE_UNKNOWN then
            local difficultyChosen = CustomNetTables:GetTableValue(
                "difficulty_choice",
                tostring(playerId)
            )
            if difficultyChosen ~= nil then
                playerChosen = playerChosen + 1
                averageDifficulty = averageDifficulty + difficultyChosen.difficulty
            end
        end
    end)
    if playerChosen == 0 then
        averageDifficulty = 1
    else
        averageDifficulty = averageDifficulty / playerChosen
        averageDifficulty = math.floor(averageDifficulty + 0.5)
    end
    if force or playerChosen >= playerCount then
        CustomNetTables:SetTableValue("game_difficulty", "all", {difficulty = averageDifficulty})
        self.gameDifficulty = averageDifficulty
        self.randomDraftMode = self:IsRandomDraftDifficulty(self.gameDifficulty)
        self:PublishPointMultiplier()
    end
end
function Option.prototype.SetDefaultDifficulty(self)
    local difficultyState = CustomNetTables:GetTableValue("game_difficulty", "all")
    if difficultyState == nil then
        print("[Option] SetDefaultDifficulty")
        self.gameDifficulty = 1
        CustomNetTables:SetTableValue("game_difficulty", "all", {difficulty = self.gameDifficulty})
        self.randomDraftMode = false
        self:PublishPointMultiplier()
    end
end
function Option.prototype.PublishPointMultiplier(self)
    CustomNetTables:SetTableValue(
        "game_options",
        "point_multiplier",
        {point_multiplier = GameEndPoint:GetDifficultyMultiplier(
            self.gameDifficulty,
            ApiClient:IsLocalhost(),
            self
        )}
    )
end
function Option.prototype.IsRandomDraftDifficulty(self, difficulty)
    return difficulty == 8 or difficulty == 9
end
return ____exports
