local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/event-npc-spawned.lua"
__TS__SourceMapTraceBack("modules/event/event-npc-spawned.lua", {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 6,["21"] = 6,["22"] = 7,["23"] = 7,["24"] = 8,["25"] = 8,["26"] = 9,["27"] = 9,["28"] = 10,["29"] = 10,["30"] = 11,["31"] = 11,["32"] = 13,["33"] = 13,["34"] = 13,["36"] = 14,["37"] = 15,["38"] = 16,["39"] = 17,["40"] = 19,["41"] = 25,["42"] = 81,["43"] = 81,["44"] = 81,["45"] = 81,["46"] = 81,["47"] = 80,["48"] = 85,["49"] = 86,["50"] = 87,["51"] = 87,["52"] = 87,["53"] = 88,["54"] = 87,["55"] = 87,["58"] = 93,["59"] = 94,["62"] = 97,["63"] = 98,["65"] = 102,["66"] = 103,["67"] = 104,["68"] = 105,["71"] = 109,["72"] = 110,["73"] = 111,["74"] = 111,["75"] = 111,["76"] = 111,["78"] = 113,["79"] = 114,["80"] = 115,["82"] = 117,["83"] = 119,["85"] = 121,["86"] = 123,["88"] = 85,["89"] = 128,["90"] = 130,["91"] = 130,["93"] = 131,["94"] = 131,["96"] = 133,["97"] = 134,["98"] = 136,["99"] = 136,["100"] = 136,["101"] = 138,["102"] = 139,["104"] = 142,["105"] = 143,["106"] = 144,["108"] = 146,["109"] = 148,["110"] = 149,["111"] = 150,["113"] = 153,["114"] = 154,["115"] = 157,["116"] = 162,["117"] = 166,["118"] = 167,["119"] = 168,["121"] = 172,["122"] = 136,["123"] = 136,["124"] = 128,["125"] = 177,["126"] = 178,["129"] = 181,["132"] = 187,["135"] = 192,["136"] = 194,["137"] = 198,["138"] = 199,["139"] = 201,["140"] = 201,["141"] = 201,["142"] = 203,["143"] = 205,["144"] = 206,["145"] = 207,["148"] = 211,["149"] = 211,["150"] = 211,["151"] = 211,["152"] = 211,["153"] = 211,["154"] = 211,["155"] = 211,["156"] = 211,["157"] = 211,["158"] = 211,["159"] = 223,["160"] = 224,["163"] = 201,["164"] = 201,["165"] = 177,["166"] = 233,["167"] = 234,["168"] = 235,["169"] = 239,["170"] = 241,["171"] = 253,["173"] = 257,["174"] = 261,["176"] = 264,["177"] = 266,["178"] = 268,["179"] = 269,["180"] = 270,["181"] = 271,["182"] = 272,["183"] = 273,["185"] = 276,["186"] = 277,["187"] = 277,["188"] = 277,["189"] = 277,["190"] = 277,["191"] = 281,["192"] = 282,["194"] = 285,["195"] = 287,["196"] = 288,["197"] = 289,["199"] = 291,["200"] = 293,["201"] = 294,["202"] = 294,["203"] = 294,["204"] = 294,["205"] = 295,["206"] = 298,["207"] = 298,["208"] = 298,["209"] = 300,["210"] = 303,["211"] = 306,["212"] = 307,["214"] = 311,["215"] = 317,["216"] = 317,["217"] = 317,["218"] = 317,["219"] = 319,["220"] = 319,["221"] = 319,["222"] = 319,["223"] = 321,["224"] = 322,["225"] = 323,["226"] = 324,["227"] = 325,["228"] = 326,["232"] = 330,["233"] = 330,["235"] = 331,["236"] = 298,["237"] = 298,["238"] = 335,["239"] = 336,["241"] = 340,["242"] = 341,["243"] = 344,["244"] = 344,["245"] = 344,["246"] = 346,["247"] = 347,["248"] = 348,["249"] = 349,["251"] = 351,["253"] = 355,["254"] = 356,["255"] = 357,["256"] = 358,["258"] = 360,["260"] = 344,["261"] = 344,["263"] = 233,["264"] = 366,["265"] = 367,["268"] = 371,["269"] = 371,["270"] = 371,["271"] = 372,["272"] = 373,["274"] = 376,["275"] = 377,["276"] = 371,["277"] = 371,["278"] = 366,["279"] = 381,["280"] = 382,["283"] = 386,["284"] = 387,["285"] = 388,["286"] = 389,["290"] = 394,["291"] = 395,["293"] = 381,["294"] = 399,["295"] = 400,["296"] = 401,["297"] = 402,["298"] = 403,["299"] = 404,["303"] = 409,["304"] = 410,["305"] = 411,["306"] = 412,["308"] = 399,["309"] = 416,["310"] = 418,["311"] = 420,["312"] = 420,["313"] = 420,["314"] = 420,["315"] = 420,["316"] = 421,["317"] = 424,["318"] = 426,["319"] = 431,["320"] = 436,["321"] = 436,["322"] = 436,["323"] = 437,["324"] = 439,["325"] = 441,["326"] = 441,["327"] = 441,["328"] = 442,["329"] = 443,["330"] = 447,["331"] = 450,["333"] = 452,["337"] = 457,["338"] = 441,["339"] = 441,["342"] = 462,["343"] = 436,["344"] = 436,["345"] = 416,["346"] = 466,["347"] = 470,["348"] = 476,["349"] = 478,["350"] = 479,["351"] = 480,["352"] = 481,["353"] = 482,["356"] = 485,["357"] = 485,["358"] = 485,["359"] = 485,["360"] = 485,["361"] = 487,["363"] = 488,["364"] = 488,["365"] = 489,["366"] = 490,["367"] = 491,["368"] = 495,["371"] = 488,["374"] = 500,["375"] = 502,["376"] = 503,["377"] = 504,["378"] = 506,["381"] = 518,["384"] = 508,["385"] = 509,["386"] = 510,["387"] = 511,["389"] = 515,["397"] = 521,["400"] = 524,["402"] = 528,["403"] = 529,["404"] = 530,["405"] = 531,["406"] = 532,["408"] = 534,["410"] = 538,["411"] = 466,["412"] = 541,["413"] = 544,["414"] = 545,["415"] = 549,["416"] = 550,["417"] = 551,["418"] = 552,["419"] = 558,["420"] = 559,["421"] = 559,["422"] = 559,["423"] = 559,["424"] = 562,["425"] = 568,["426"] = 569,["427"] = 570,["428"] = 571,["429"] = 572,["436"] = 549,["437"] = 583,["440"] = 591,["441"] = 541,["442"] = 594,["443"] = 599,["444"] = 599,["445"] = 599,["446"] = 599,["447"] = 601,["450"] = 605,["451"] = 606,["452"] = 609,["453"] = 611,["454"] = 612,["455"] = 612,["456"] = 612,["457"] = 613,["458"] = 614,["459"] = 617,["460"] = 619,["461"] = 620,["462"] = 621,["464"] = 623,["466"] = 625,["467"] = 626,["468"] = 627,["469"] = 628,["471"] = 630,["474"] = 634,["476"] = 637,["477"] = 638,["478"] = 644,["481"] = 612,["482"] = 612,["483"] = 594,["484"] = 650,["485"] = 651,["486"] = 653,["487"] = 654,["488"] = 655,["489"] = 656,["492"] = 659,["493"] = 660,["494"] = 661,["495"] = 662,["498"] = 665,["499"] = 666,["500"] = 667,["501"] = 668,["502"] = 669,["505"] = 673,["506"] = 674,["509"] = 650,["510"] = 679,["511"] = 680,["512"] = 682,["513"] = 683,["515"] = 685,["516"] = 686,["518"] = 688,["519"] = 689,["521"] = 691,["522"] = 692,["524"] = 694,["525"] = 679,["526"] = 31,["527"] = 31,["528"] = 31,["529"] = 31,["530"] = 31,["531"] = 31,["532"] = 31,["533"] = 31,["534"] = 31,["535"] = 31,["536"] = 31,["537"] = 31,["538"] = 31,["539"] = 46,["540"] = 46,["541"] = 46,["542"] = 46,["543"] = 46,["544"] = 46,["545"] = 46,["546"] = 46,["547"] = 46,["548"] = 46,["549"] = 46,["550"] = 46,["551"] = 46,["552"] = 46,["553"] = 46,["554"] = 46,["555"] = 46,["556"] = 46,["557"] = 46,["558"] = 46,["559"] = 46,["560"] = 46,["561"] = 46,["562"] = 46,["563"] = 46,["564"] = 46,["565"] = 231});
local ____exports = {}
local ____action_2Dmove = require("ai.action.action-move")
local ActionMove = ____action_2Dmove.ActionMove
local ____player = require("api.player")
local MemberLevel = ____player.MemberLevel
local Player = ____player.Player
local ____intelect_magic_resist = require("modifiers.global.intelect_magic_resist")
local modifier_intelect_magic_resist = ____intelect_magic_resist.modifier_intelect_magic_resist
local ____GameConfig = require("modules.GameConfig")
local GameConfig = ____GameConfig.GameConfig
local ____ability_2Dreplacer = require("modules.helper.ability-replacer")
local AbilityReplacer = ____ability_2Dreplacer.AbilityReplacer
local ____bot_2Dability = require("modules.helper.bot-ability")
local BotAbility = ____bot_2Dability.BotAbility
local ____bot_2Dintellect_2Dcap = require("modules.helper.bot-intellect-cap")
local BotIntellectCap = ____bot_2Dintellect_2Dcap.BotIntellectCap
local ____modifier_2Dhelper = require("modules.helper.modifier-helper")
local ModifierHelper = ____modifier_2Dhelper.ModifierHelper
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____property_controller = require("modules.property.property_controller")
local PropertyController = ____property_controller.PropertyController
local ____newbie_2Dbuff = require("modules.event.newbie-buff")
local GetNewbieBuffModifierName = ____newbie_2Dbuff.GetNewbieBuffModifierName
____exports.EventNpcSpawned = __TS__Class()
local EventNpcSpawned = ____exports.EventNpcSpawned
EventNpcSpawned.name = "EventNpcSpawned"
function EventNpcSpawned.prototype.____constructor(self)
    self.roshanLevelBase = 1
    self.isFirstRoshan = true
    self.heroSpawnRetryCount = 0
    self.MAX_SPAWN_RETRY = 100
    self.roshanLevelupBaseAbilities = {"tidehunter_kraken_shell", "jack_surgery", "ursa_fury_swipes"}
    self.roshanLevelupExtraAbilities = {"roshan_buff", "generic_gold_bag_fountain"}
    ListenToGameEvent(
        "npc_spawned",
        function(____, keys) return self:OnNpcSpawned(keys) end,
        self
    )
end
function EventNpcSpawned.prototype.OnNpcSpawned(self, keys)
    if GameRules:State_Get() < DOTA_GAMERULES_STATE_PRE_GAME then
        Timers:CreateTimer(
            0.3,
            function()
                self:OnNpcSpawned(keys)
            end
        )
        return
    end
    local npc = EntIndexToHScript(keys.entindex)
    if not npc then
        return
    end
    if npc:IsRealHero() and keys.is_respawn ~= 0 and PlayerHelper:IsBotPlayer(npc) then
        GameRules.AI:ResumeAI(npc)
    end
    if npc:IsRealHero() then
        local isAbyssBot = GameRules.Option.abyssMode and PlayerHelper:IsBotPlayer(npc)
        if isAbyssBot or npc:HasModifier("modifier_fountain_invulnerability") then
            self:StartFountainInvulnerabilityCheck(npc, isAbyssBot and 0.3 or 3, isAbyssBot)
        end
    end
    if npc:IsRealHero() and GameRules.Option.abyssMode and PlayerHelper:IsBotPlayer(npc) then
        local hero = npc
        Timers:CreateTimer(
            0.3,
            function() return GameRules.AbyssMode:OnBotSpawned(hero) end
        )
    end
    if npc:IsRealHero() and keys.is_respawn == 0 then
        local hero = npc
        self:OnRealHeroSpawned(hero)
    end
    if npc:IsCreep() then
        self:OnCreepSpawned(npc)
    end
    if npc:IsCourier() and keys.is_respawn == 0 then
        ModifierHelper:applyGlobalModifier(npc, "modifier_global_courier_speed")
    end
end
function EventNpcSpawned.prototype.StartFountainInvulnerabilityCheck(self, unit, checkInterval, removeImmediately)
    if checkInterval == nil then
        checkInterval = 3
    end
    if removeImmediately == nil then
        removeImmediately = false
    end
    local fountainRange = 1000
    local missingModifierChecks = 0
    Timers:CreateTimer(
        0,
        function()
            if not unit or unit:IsNull() or not unit:IsAlive() then
                return nil
            end
            if not unit:HasModifier("modifier_fountain_invulnerability") then
                missingModifierChecks = missingModifierChecks + 1
                return missingModifierChecks <= 3 and checkInterval or nil
            end
            missingModifierChecks = 0
            if removeImmediately then
                unit:RemoveModifierByName("modifier_fountain_invulnerability")
                return nil
            end
            local unitPos = unit:GetAbsOrigin()
            local team = unit:GetTeam()
            local fountainPos = team == DOTA_TEAM_GOODGUYS and ActionMove.posRadiantBase or ActionMove.posDireBase
            local distanceToFountain = math.sqrt((unitPos.x - fountainPos.x) * (unitPos.x - fountainPos.x) + (unitPos.y - fountainPos.y) * (unitPos.y - fountainPos.y))
            if distanceToFountain > fountainRange then
                unit:RemoveModifierByName("modifier_fountain_invulnerability")
                return nil
            end
            return checkInterval
        end
    )
end
function EventNpcSpawned.prototype.SetHeroSpawnPoint(self, hero)
    if GameRules.Option.abyssMode and PlayerHelper:IsBotPlayer(hero) then
        return
    end
    if PlayerHelper:IsHumanPlayer(hero) then
        return
    end
    if self.heroSpawnRetryCount >= self.MAX_SPAWN_RETRY then
        return
    end
    self.heroSpawnRetryCount = self.heroSpawnRetryCount + 1
    local posBase = hero:GetTeam() == DOTA_TEAM_GOODGUYS and ActionMove.posRadiantBase or ActionMove.posDireBase
    local pos = posBase:__add(RandomVector(250))
    hero:SetAbsOrigin(pos)
    Timers:CreateTimer(
        0.1,
        function()
            local posBase = hero:GetTeam() == DOTA_TEAM_GOODGUYS and ActionMove.posRadiantBase or ActionMove.posDireBase
            local isInBase = hero:IsPositionInRange(posBase, 1500)
            if not isInBase then
                self:SetHeroSpawnPoint(hero)
                return
            end
            local units = FindUnitsInRadius(
                hero:GetTeam(),
                hero:GetAbsOrigin(),
                nil,
                32,
                DOTA_UNIT_TARGET_TEAM_BOTH,
                DOTA_UNIT_TARGET_HERO,
                DOTA_UNIT_TARGET_FLAG_NONE,
                FIND_ANY_ORDER,
                false
            )
            if #units > 1 then
                self:SetHeroSpawnPoint(hero)
                return
            end
        end
    )
end
function EventNpcSpawned.prototype.OnRealHeroSpawned(self, hero)
    self:SetHeroSpawnPoint(hero)
    self:ApplyRandomDraftStartingSetup(hero)
    if GameRules.Option.midOnlyMode and not GameRules.Option.abyssMode then
        hero:AddExperience(1300, DOTA_ModifyXP_Unspecified, false, false)
        hero:ModifyGold(2000, true, DOTA_ModifyGold_Unspecified)
    end
    if hero:GetAttackCapability() == DOTA_UNIT_CAP_MELEE_ATTACK or hero:GetName() == "npc_dota_hero_troll_warlord" or hero:GetName() == "npc_dota_hero_lone_druid" then
        ModifierHelper:applyGlobalModifier(hero, "modifier_global_melee_resistance")
    end
    hero:AddNewModifier(hero, nil, modifier_intelect_magic_resist.name, {})
    if PlayerHelper:IsHumanPlayer(hero) then
        local steamAccountId = PlayerResource:GetSteamAccountID(hero:GetPlayerOwnerID())
        local memberLevel = Player:GetMemberLevel(steamAccountId)
        if memberLevel == MemberLevel.NORMAL then
            ModifierHelper:applyGlobalModifier(hero, "modifier_global_member_normal")
        elseif memberLevel == MemberLevel.PREMIUM then
            ModifierHelper:applyGlobalModifier(hero, "modifier_global_member_premium")
        end
        local playerSeasonLevel = Player:GetSeasonLevel(steamAccountId)
        local newbieBuffModifierName = GetNewbieBuffModifierName(
            nil,
            playerSeasonLevel,
            Player:GetRebirthCount(steamAccountId)
        )
        if newbieBuffModifierName ~= nil then
            ModifierHelper:applyGlobalModifier(hero, newbieBuffModifierName)
        end
        Player:SetPlayerProperty(hero)
        AbilityReplacer:applyReplacements(hero, steamAccountId)
        GameRules.Treasure:PrepareAndApplyInitialAwakening(hero)
        self:GrantStartingGoldConsumableConverter(hero)
    end
    if PlayerHelper:IsBotPlayer(hero) then
        BotIntellectCap:Update(hero)
        Timers:CreateTimer(
            0.2,
            function() return BotIntellectCap:Update(hero) end
        )
        BotIntellectCap:StartPeriodicUpdate(5)
        Timers:CreateTimer(
            1,
            function()
                hero:SetBotDifficulty(4)
                GameRules.AI:EnableAI(hero)
                if GameRules.Option.midOnlyMode and not GameRules.Option.abyssMode then
                    hero:ModifyGold(3500, true, DOTA_ModifyGold_Unspecified)
                end
                if not GameRules.Option.abyssMode and not ____exports.EventNpcSpawned.bossSelected and hero:GetTeam() == DOTA_TEAM_BADGUYS and GameRules.Option.direGoldXpMultiplier >= 10 then
                    local isSupport = __TS__ArrayIncludes(
                        ____exports.EventNpcSpawned.supportHeroBlacklist,
                        hero:GetUnitName()
                    )
                    local isCandidate = __TS__ArrayIncludes(
                        ____exports.EventNpcSpawned.bossCandidateWhitelist,
                        hero:GetUnitName()
                    )
                    if not isSupport and isCandidate then
                        ____exports.EventNpcSpawned.bossSelected = true
                        self:MakeBotBoss(hero)
                        if GameRules.Option.midOnlyMode and not GameRules.Option.abyssMode then
                            hero:AddExperience(1300, DOTA_ModifyXP_Unspecified, false, false)
                            hero:ModifyGold(3500, true, DOTA_ModifyGold_Unspecified)
                        end
                    end
                end
                if not hero.isBoss then
                    BotAbility:AddBotAbility(hero, 0)
                end
                GameRules.AbyssMode:OnBotSpawned(hero)
            end
        )
        local moveTime = 40
        hero:AddNewModifier(hero, nil, "modifier_rooted", {duration = GameConfig.PRE_GAME_TIME - moveTime})
    end
    if hero:GetName() == "npc_dota_hero_death_prophet" then
        print("[EventNpcSpawned] Attempting to replace death_prophet_carrion_swarm")
        Timers:CreateTimer(
            0.5,
            function()
                local oldAbility = hero:FindAbilityByName("death_prophet_carrion_swarm")
                if oldAbility ~= nil then
                    hero:RemoveAbility("death_prophet_carrion_swarm")
                    print("[EventNpcSpawned] Successfully removed death_prophet_carrion_swarm")
                else
                    print("[EventNpcSpawned] WARNING: death_prophet_carrion_swarm not found!")
                end
                local newAbility = hero:AddAbility("lina_dragon_slave")
                if newAbility ~= nil then
                    newAbility:SetLevel(0)
                    print("[EventNpcSpawned] Successfully added lina_dragon_slave")
                else
                    print("[EventNpcSpawned] WARNING: Failed to add lina_dragon_slave!")
                end
            end
        )
    end
end
function EventNpcSpawned.prototype.GrantStartingGoldConsumableConverter(self, hero)
    if not hero or hero:IsNull() or not hero:IsRealHero() or hero:IsIllusion() then
        return
    end
    Timers:CreateTimer(
        13 * 60,
        function()
            if not hero or hero:IsNull() or not hero:IsRealHero() or hero:IsIllusion() then
                return nil
            end
            Player:UnlockGoldConsumableConverter(hero)
            return nil
        end
    )
end
function EventNpcSpawned.prototype.ApplyRandomDraftStartingSetup(self, hero)
    if not GameRules.Option.randomDraftMode or GameRules.Option.midOnlyMode then
        return
    end
    while hero:GetLevel() < 2 do
        local previousLevel = hero:GetLevel()
        hero:HeroLevelUp(false)
        if hero:GetLevel() <= previousLevel then
            break
        end
    end
    if PlayerHelper:IsBotPlayer(hero) then
        hero:ModifyGold(2000, true, DOTA_ModifyGold_Unspecified)
    end
end
function EventNpcSpawned.prototype.ApplyTemporaryBotPushTestSetup(self, hero)
    local targetLevel = 20
    while hero:GetLevel() < targetLevel do
        local previousLevel = hero:GetLevel()
        hero:HeroLevelUp(false)
        if hero:GetLevel() <= previousLevel then
            break
        end
    end
    local playerId = hero:GetPlayerOwnerID()
    if PlayerResource:IsValidPlayerID(playerId) then
        PlayerResource:SetGold(playerId, 30000, true)
        PlayerResource:SetGold(playerId, 0, false)
    end
end
function EventNpcSpawned.prototype.MakeBotBoss(self, hero)
    hero.isBoss = true
    local heroName = string.gsub(
        hero:GetUnitName(),
        "npc_dota_hero_",
        ""
    )
    local localizedName = "#" .. heroName
    local goldBossName = ("<font color='#FFD700'>" .. localizedName) .. "</font>"
    GameRules:SendCustomMessage(("<font color='#FF0000'>⚠️ 随机BotBoss: " .. goldBossName) .. "。BotBoss拥有双倍经验金钱倍率，并有更高的进攻性，但击杀boss也会得到成倍的经验和金钱！</font>", 1, 0)
    GameRules:SendCustomMessage(("<font color='#FF0000'>⚠️ Random BotBoss: " .. goldBossName) .. "。BotBoss features double experience and money multipliers, with higher aggressiveness, yet defeating the boss will also grant you multiplied experience and money!</font>", 1, 0)
    Timers:CreateTimer(
        3,
        function()
            local highestPropertyPlayer = self:FindHighestPropertyPlayer()
            if not highestPropertyPlayer then
                Timers:CreateTimer(
                    5,
                    function()
                        local retryPlayer = self:FindHighestPropertyPlayer()
                        if not retryPlayer then
                            if hero:GetName() == "npc_dota_hero_bristleback" or hero:GetName() == "npc_dota_hero_dragon_knight" then
                                hero:SetModelScale(1.3)
                            else
                                hero:SetModelScale(2)
                            end
                            return
                        end
                        self:ApplyBossProperties(hero, retryPlayer)
                    end
                )
                return
            end
            self:ApplyBossProperties(hero, highestPropertyPlayer)
        end
    )
end
function EventNpcSpawned.prototype.ApplyBossProperties(self, hero, playerInfo)
    local multiplier = GameRules.Option.direGoldXpMultiplier
    hero:SetModelScale(2)
    if not hero:HasAbility("boss_death_power") then
        local bossDeathPower = hero:AddAbility("boss_death_power")
        if bossDeathPower ~= nil then
            bossDeathPower:SetLevel(0)
            print("[BotAbility] Added boss_death_power to " .. hero:GetUnitName())
        end
    end
    self:CopyPlayerPropertiesToBot(
        hero,
        playerInfo.steamId,
        math.min(multiplier * 1.2, 100)
    )
    local radiantPlayerCount = 0
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            if PlayerResource:IsValidPlayer(i) then
                local player = PlayerResource:GetPlayer(i)
                if player and PlayerResource:GetTeam(i) == DOTA_TEAM_GOODGUYS then
                    radiantPlayerCount = radiantPlayerCount + 1
                end
            end
            i = i + 1
        end
    end
    print("[BotAbility] Radiant player count: " .. tostring(radiantPlayerCount))
    if radiantPlayerCount >= 4 then
        local bingoAbilityName = "botboss_bingo"
        local existingBingo = hero:FindAbilityByName(bingoAbilityName)
        if existingBingo == nil then
            do
                local function ____catch(____error)
                    print((("[BotAbility] ERROR adding " .. bingoAbilityName) .. ": ") .. tostring(____error))
                end
                local ____try, ____hasReturned = pcall(function()
                    local bingoAbility = hero:AddAbility(bingoAbilityName)
                    if bingoAbility ~= nil then
                        bingoAbility:SetLevel(1)
                        print(((("[BotAbility] Added " .. bingoAbilityName) .. " to ") .. hero:GetUnitName()) .. " (Radiant players >= 4)")
                    else
                        print(("[BotAbility] Failed to add " .. bingoAbilityName) .. " (AddAbility returned undefined)")
                    end
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        else
            print(("[BotAbility] Hero already has " .. bingoAbilityName) .. ", skipping")
        end
    else
        print("[BotAbility] Radiant players < 4, skipping botboss_bingo")
    end
    local extraAbilityCount = 0
    if multiplier >= 40 then
        extraAbilityCount = 2
    elseif multiplier >= 15 then
        extraAbilityCount = 1
    else
        extraAbilityCount = 0
    end
    BotAbility:AddBotAbility(hero, extraAbilityCount)
end
function EventNpcSpawned.prototype.FindHighestPropertyPlayer(self)
    local highestLevel = 0
    local result
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            local steamId = PlayerResource:GetSteamAccountID(playerId)
            if hero and hero:IsRealHero() and not hero:IsIllusion() then
                local playerData = CustomNetTables:GetTableValue(
                    "player_table",
                    tostring(steamId)
                )
                if playerData ~= nil and playerData ~= nil then
                    if playerData.totalLevel ~= nil and playerData.totalLevel > 0 then
                        local totalLevel = playerData.totalLevel
                        if totalLevel > highestLevel then
                            highestLevel = totalLevel
                            result = {hero = hero, steamId = steamId, totalLevel = totalLevel}
                        end
                    end
                else
                end
            end
        end
    end)
    if result then
    else
    end
    return result
end
function EventNpcSpawned.prototype.CopyPlayerPropertiesToBot(self, bot, playerSteamId, multiplier)
    local playerData = CustomNetTables:GetTableValue(
        "player_table",
        tostring(playerSteamId)
    )
    if not playerData or not playerData.properties then
        return
    end
    local discountRate = math.min(multiplier / 40, 1)
    local properties = playerData.properties
    local booleanProperties = {"property_ignore_movespeed_limit", "property_cannot_miss"}
    local booleanProperties2 = {"property_flying"}
    __TS__ArrayForEach(
        __TS__ObjectValues(properties),
        function(____, property)
            if property.level > 0 then
                local discountedLevel
                if __TS__ArrayIncludes(booleanProperties, property.name) then
                    if multiplier >= 15 then
                        local threshold = 8
                        discountedLevel = property.level >= threshold and 1 or 0
                    else
                        discountedLevel = 0
                    end
                elseif __TS__ArrayIncludes(booleanProperties2, property.name) then
                    if multiplier >= 20 then
                        local threshold = 8
                        discountedLevel = property.level >= threshold and 1 or 0
                    else
                        discountedLevel = 0
                    end
                else
                    discountedLevel = math.floor(property.level * discountRate)
                end
                if discountedLevel > 0 then
                    local discountedProperty = {steamId = property.steamId, name = property.name, level = discountedLevel}
                    PropertyController:LevelupHeroProperty(bot, discountedProperty)
                end
            end
        end
    )
end
function EventNpcSpawned.prototype.OnCreepSpawned(self, creep)
    local creepName = creep:GetName()
    if creepName == "npc_dota_roshan" then
        if self.isFirstRoshan then
            creep:Kill(nil, creep)
            self.isFirstRoshan = false
            return
        end
        for ____, abilityName in ipairs(self.roshanLevelupBaseAbilities) do
            local ability = creep:FindAbilityByName(abilityName)
            if ability then
                ability:SetLevel(self.roshanLevelBase)
            end
        end
        for ____, abilityName in ipairs(self.roshanLevelupExtraAbilities) do
            local ability = creep:FindAbilityByName(abilityName)
            local level = self:getExtraRoshanLevel()
            if ability then
                ability:SetLevel(level)
            end
        end
        if self.roshanLevelBase < 5 - 1 then
            self.roshanLevelBase = self.roshanLevelBase + 1
        end
    end
end
function EventNpcSpawned.prototype.getExtraRoshanLevel(self)
    local extra = 0
    if Player:GetPlayerCount() >= 2 then
        extra = extra + 1
    end
    if Player:GetPlayerCount() >= 4 then
        extra = extra + 1
    end
    if Player:GetPlayerCount() >= 6 then
        extra = extra + 1
    end
    if Player:GetPlayerCount() >= 8 then
        extra = extra + 1
    end
    return self.roshanLevelBase + extra
end
EventNpcSpawned.supportHeroBlacklist = {
    "npc_dota_hero_crystal_maiden",
    "npc_dota_hero_dazzle",
    "npc_dota_hero_omniknight",
    "npc_dota_hero_warlock",
    "npc_dota_hero_witch_doctor",
    "npc_dota_hero_shadow_shaman",
    "npc_dota_hero_oracle",
    "npc_dota_hero_jakiro",
    "npc_dota_hero_bane",
    "npc_dota_hero_lich",
    "npc_dota_hero_lion"
}
EventNpcSpawned.bossCandidateWhitelist = {
    "npc_dota_hero_axe",
    "npc_dota_hero_bristleback",
    "npc_dota_hero_chaos_knight",
    "npc_dota_hero_dragon_knight",
    "npc_dota_hero_pudge",
    "npc_dota_hero_omniknight",
    "npc_dota_hero_sven",
    "npc_dota_hero_tiny",
    "npc_dota_hero_skeleton_king",
    "npc_dota_hero_abaddon",
    "npc_dota_hero_juggernaut",
    "npc_dota_hero_phantom_assassin",
    "npc_dota_hero_luna",
    "npc_dota_hero_medusa",
    "npc_dota_hero_spectre",
    "npc_dota_hero_kunkka",
    "npc_dota_hero_death_prophet",
    "npc_dota_hero_necrolyte",
    "npc_dota_hero_tinker",
    "npc_dota_hero_bloodseeker",
    "npc_dota_hero_bounty_hunter",
    "npc_dota_hero_riki",
    "npc_dota_hero_viper",
    "npc_dota_hero_windrunner"
}
EventNpcSpawned.bossSelected = false
return ____exports
