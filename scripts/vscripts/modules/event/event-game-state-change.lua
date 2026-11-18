local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArraySort = ____lualib.__TS__ArraySort
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__NumberToFixed = ____lualib.__TS__NumberToFixed
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/event-game-state-change.lua"
__TS__SourceMapTraceBack("modules/event/event-game-state-change.lua", {["17"] = 2,["18"] = 2,["19"] = 6,["20"] = 6,["21"] = 7,["22"] = 7,["23"] = 8,["24"] = 8,["25"] = 9,["26"] = 9,["27"] = 10,["28"] = 10,["29"] = 11,["30"] = 11,["31"] = 12,["32"] = 12,["33"] = 13,["34"] = 13,["35"] = 14,["36"] = 14,["37"] = 15,["38"] = 15,["39"] = 16,["40"] = 16,["41"] = 17,["42"] = 17,["43"] = 18,["44"] = 18,["45"] = 19,["46"] = 19,["47"] = 20,["48"] = 20,["49"] = 20,["51"] = 21,["52"] = 22,["53"] = 23,["54"] = 24,["55"] = 26,["56"] = 30,["57"] = 33,["58"] = 33,["59"] = 33,["60"] = 33,["61"] = 33,["62"] = 32,["63"] = 36,["64"] = 37,["65"] = 38,["66"] = 39,["67"] = 39,["68"] = 39,["69"] = 41,["70"] = 43,["71"] = 39,["72"] = 39,["73"] = 46,["74"] = 46,["75"] = 46,["76"] = 47,["77"] = 46,["78"] = 46,["79"] = 49,["80"] = 50,["81"] = 51,["82"] = 52,["83"] = 53,["84"] = 54,["85"] = 56,["86"] = 57,["87"] = 57,["88"] = 57,["89"] = 58,["90"] = 59,["91"] = 57,["92"] = 57,["94"] = 89,["95"] = 90,["97"] = 36,["98"] = 94,["99"] = 95,["100"] = 96,["101"] = 97,["102"] = 98,["103"] = 99,["104"] = 94,["105"] = 146,["106"] = 147,["109"] = 151,["110"] = 152,["111"] = 153,["112"] = 153,["113"] = 153,["114"] = 154,["115"] = 155,["117"] = 157,["118"] = 158,["120"] = 161,["121"] = 162,["122"] = 153,["123"] = 153,["124"] = 146,["125"] = 166,["126"] = 167,["127"] = 167,["128"] = 167,["129"] = 167,["130"] = 168,["131"] = 166,["132"] = 171,["133"] = 172,["134"] = 173,["137"] = 177,["138"] = 178,["141"] = 182,["142"] = 184,["143"] = 185,["146"] = 189,["147"] = 190,["149"] = 191,["150"] = 191,["151"] = 191,["152"] = 191,["153"] = 191,["154"] = 192,["156"] = 194,["157"] = 195,["159"] = 197,["160"] = 198,["161"] = 199,["163"] = 201,["164"] = 202,["165"] = 202,["166"] = 202,["167"] = 202,["168"] = 202,["169"] = 203,["170"] = 204,["174"] = 207,["175"] = 208,["177"] = 171,["178"] = 212,["179"] = 213,["180"] = 214,["181"] = 215,["184"] = 216,["187"] = 218,["188"] = 219,["191"] = 220,["194"] = 222,["195"] = 214,["196"] = 225,["197"] = 225,["198"] = 225,["199"] = 225,["200"] = 226,["201"] = 212,["202"] = 229,["203"] = 232,["204"] = 233,["205"] = 233,["206"] = 233,["207"] = 233,["208"] = 237,["209"] = 238,["211"] = 241,["212"] = 229,["213"] = 244,["214"] = 245,["215"] = 247,["216"] = 248,["217"] = 249,["218"] = 251,["219"] = 252,["220"] = 253,["222"] = 244,["223"] = 257,["224"] = 260,["225"] = 257,["226"] = 272,["227"] = 273,["228"] = 274,["229"] = 275,["231"] = 278,["232"] = 272,["233"] = 281,["234"] = 282,["235"] = 283,["236"] = 284,["238"] = 286,["239"] = 287,["241"] = 289,["242"] = 290,["244"] = 292,["245"] = 281,["246"] = 295,["247"] = 298,["248"] = 299,["249"] = 300,["250"] = 302,["252"] = 303,["253"] = 304,["254"] = 305,["256"] = 308,["257"] = 309,["258"] = 310,["259"] = 311,["264"] = 315,["265"] = 295,["266"] = 318,["267"] = 319,["268"] = 319,["269"] = 319,["270"] = 319,["271"] = 319,["272"] = 319,["273"] = 319,["274"] = 319,["275"] = 319,["276"] = 319,["277"] = 319,["278"] = 330,["279"] = 330,["280"] = 330,["281"] = 330,["282"] = 333,["283"] = 333,["284"] = 333,["285"] = 333,["286"] = 337,["287"] = 338,["288"] = 339,["290"] = 340,["291"] = 341,["293"] = 343,["295"] = 344,["296"] = 345,["298"] = 347,["299"] = 347,["300"] = 347,["301"] = 347,["302"] = 348,["303"] = 349,["305"] = 351,["306"] = 352,["307"] = 352,["308"] = 352,["309"] = 352,["316"] = 356,["317"] = 318,["318"] = 359,["319"] = 360,["320"] = 361,["321"] = 362,["323"] = 365,["324"] = 365,["325"] = 359,["326"] = 368,["327"] = 373,["328"] = 374,["330"] = 375,["331"] = 376,["333"] = 378,["334"] = 379,["335"] = 380,["340"] = 383,["341"] = 368,["342"] = 386,["343"] = 387,["344"] = 388,["345"] = 391,["346"] = 395,["347"] = 396,["348"] = 396,["349"] = 396,["350"] = 396,["352"] = 398,["353"] = 399,["354"] = 399,["355"] = 399,["356"] = 399,["358"] = 402,["359"] = 386,["360"] = 405,["361"] = 410,["362"] = 413,["363"] = 416,["364"] = 419,["365"] = 420,["366"] = 420,["367"] = 420,["368"] = 422,["370"] = 425,["371"] = 426,["372"] = 426,["373"] = 426,["374"] = 428,["376"] = 431,["377"] = 405,["378"] = 434,["379"] = 435,["380"] = 436,["381"] = 437,["384"] = 438,["387"] = 440,["388"] = 441,["391"] = 442,["392"] = 442,["393"] = 442,["394"] = 442,["395"] = 443,["397"] = 436,["398"] = 446,["399"] = 434,["400"] = 449,["401"] = 450,["402"] = 450,["403"] = 450,["404"] = 451,["405"] = 452,["407"] = 454,["408"] = 455,["410"] = 458,["411"] = 459,["412"] = 460,["413"] = 461,["415"] = 464,["416"] = 465,["417"] = 466,["418"] = 466,["419"] = 466,["420"] = 466,["421"] = 466,["423"] = 473,["424"] = 459,["425"] = 476,["426"] = 450,["427"] = 450,["428"] = 449,["429"] = 480,["430"] = 481,["431"] = 480,["432"] = 484,["433"] = 488,["434"] = 488,["435"] = 488,["436"] = 488,["437"] = 488,["438"] = 488,["439"] = 488,["440"] = 488,["441"] = 488,["442"] = 488,["443"] = 488,["444"] = 500,["446"] = 501,["447"] = 502,["449"] = 504,["450"] = 505,["452"] = 507,["453"] = 507,["454"] = 507,["455"] = 507,["456"] = 507,["457"] = 508,["459"] = 510,["463"] = 513,["464"] = 484,["465"] = 516,["466"] = 517,["467"] = 518,["469"] = 520,["470"] = 516,["471"] = 523,["472"] = 528,["473"] = 528,["474"] = 528,["475"] = 528,["476"] = 528,["477"] = 528,["478"] = 528,["479"] = 528,["480"] = 528,["481"] = 528,["482"] = 528,["483"] = 540,["484"] = 523,["485"] = 543,["486"] = 548,["487"] = 548,["488"] = 548,["489"] = 548,["490"] = 548,["491"] = 548,["492"] = 548,["493"] = 548,["494"] = 548,["495"] = 548,["496"] = 548,["497"] = 560,["498"] = 560,["499"] = 560,["500"] = 560,["501"] = 543,["502"] = 563,["503"] = 564,["504"] = 565,["505"] = 563,["506"] = 568,["507"] = 569,["508"] = 570,["509"] = 571,["511"] = 573,["512"] = 574,["514"] = 576,["515"] = 577,["517"] = 579,["518"] = 568,["519"] = 582,["520"] = 583,["521"] = 584,["522"] = 585,["523"] = 582,["524"] = 588,["525"] = 589,["526"] = 588,["527"] = 592,["528"] = 593,["529"] = 594,["530"] = 597,["531"] = 598,["532"] = 599,["535"] = 602,["536"] = 603,["537"] = 604,["539"] = 606,["540"] = 608,["541"] = 609,["542"] = 610,["543"] = 611,["546"] = 614,["547"] = 615,["548"] = 616,["549"] = 608,["550"] = 618,["551"] = 620,["552"] = 621,["553"] = 622,["554"] = 623,["555"] = 624,["558"] = 627,["559"] = 628,["560"] = 629,["561"] = 630,["563"] = 632,["565"] = 621,["566"] = 635,["567"] = 637,["568"] = 639,["569"] = 640,["570"] = 641,["573"] = 644,["574"] = 645,["575"] = 646,["576"] = 647,["578"] = 649,["581"] = 592,["582"] = 657,["583"] = 658,["584"] = 660,["585"] = 661,["586"] = 664,["587"] = 665,["588"] = 666,["589"] = 669,["590"] = 670,["593"] = 673,["594"] = 674,["595"] = 675,["596"] = 675,["597"] = 675,["598"] = 676,["599"] = 677,["600"] = 678,["601"] = 678,["602"] = 677,["603"] = 680,["604"] = 680,["606"] = 681,["607"] = 675,["608"] = 675,["609"] = 657,["610"] = 685,["611"] = 686,["612"] = 687,["613"] = 688,["616"] = 689,["617"] = 690,["620"] = 692,["621"] = 693,["622"] = 694,["623"] = 695,["624"] = 696,["625"] = 687,["626"] = 685,["627"] = 702,["628"] = 703,["629"] = 704,["630"] = 705,["633"] = 707,["634"] = 708,["637"] = 710,["638"] = 711,["639"] = 712,["640"] = 704,["641"] = 702,["642"] = 718,["643"] = 719,["644"] = 720,["647"] = 722,["648"] = 723,["649"] = 724,["652"] = 725,["655"] = 727,["656"] = 728,["657"] = 729,["658"] = 722,["659"] = 718,["660"] = 733,["661"] = 734,["662"] = 735,["663"] = 736,["665"] = 738,["666"] = 733,["667"] = 741,["668"] = 742,["671"] = 743,["672"] = 745,["673"] = 745,["674"] = 745,["675"] = 746,["676"] = 748,["677"] = 749,["678"] = 750,["679"] = 751,["681"] = 753,["682"] = 745,["683"] = 745,["684"] = 741,["685"] = 757,["686"] = 758,["687"] = 759,["688"] = 760,["689"] = 761,["690"] = 763,["691"] = 764,["694"] = 766,["695"] = 767,["696"] = 768,["697"] = 769,["698"] = 770,["699"] = 773,["702"] = 781,["703"] = 782,["704"] = 783,["705"] = 784,["706"] = 790,["707"] = 763,["708"] = 757,["709"] = 794,["711"] = 795,["714"] = 797,["718"] = 799,["722"] = 801,["726"] = 803,["730"] = 805,["734"] = 807,["737"] = 809,["740"] = 794,["741"] = 813,["742"] = 814,["743"] = 815,["744"] = 815,["746"] = 816,["747"] = 813,["748"] = 819,["749"] = 820,["752"] = 821,["753"] = 821,["754"] = 821,["755"] = 822,["756"] = 823,["757"] = 821,["758"] = 821,["759"] = 819,["760"] = 827,["761"] = 828,["764"] = 829,["767"] = 831,["768"] = 831,["769"] = 831,["770"] = 832,["771"] = 833,["774"] = 834,["777"] = 836,["778"] = 837,["781"] = 838,["782"] = 840,["783"] = 841,["786"] = 842,["787"] = 843,["788"] = 832,["789"] = 850,["790"] = 851,["792"] = 853,["793"] = 831,["794"] = 831,["795"] = 827,["796"] = 857,["797"] = 858,["798"] = 859,["799"] = 859,["800"] = 859,["801"] = 859,["802"] = 860,["803"] = 857,["804"] = 866,["805"] = 867,["806"] = 868,["807"] = 869,["808"] = 869,["809"] = 868,["810"] = 871,["811"] = 872,["813"] = 874,["814"] = 875,["815"] = 876,["816"] = 877,["817"] = 866,["818"] = 883,["819"] = 885,["820"] = 886,["821"] = 886,["822"] = 886,["823"] = 887,["824"] = 886,["825"] = 886,["826"] = 890,["827"] = 891,["828"] = 892,["829"] = 892,["830"] = 892,["831"] = 893,["832"] = 892,["833"] = 892,["835"] = 898,["836"] = 899,["837"] = 900,["839"] = 905,["840"] = 906,["841"] = 907,["843"] = 910,["844"] = 911,["845"] = 912,["847"] = 916,["848"] = 917,["849"] = 918,["850"] = 920,["852"] = 924,["853"] = 927,["854"] = 927,["855"] = 927,["856"] = 928,["857"] = 931,["858"] = 932,["859"] = 933,["860"] = 937,["861"] = 938,["862"] = 939,["864"] = 943,["865"] = 944,["866"] = 945,["869"] = 927,["870"] = 927,["871"] = 950,["872"] = 883,["873"] = 953,["874"] = 955,["875"] = 957,["876"] = 957,["877"] = 957,["878"] = 957,["879"] = 957,["880"] = 957,["881"] = 957,["882"] = 957,["883"] = 966,["884"] = 967,["887"] = 953,["888"] = 974,["889"] = 976,["890"] = 978,["891"] = 978,["892"] = 978,["893"] = 978,["894"] = 978,["895"] = 978,["896"] = 978,["897"] = 978,["898"] = 986,["899"] = 987,["900"] = 988,["901"] = 989,["904"] = 974,["905"] = 999,["906"] = 1000,["907"] = 1001,["908"] = 1002,["909"] = 1002,["910"] = 1002,["911"] = 1002,["912"] = 1002,["913"] = 1002,["914"] = 1002,["915"] = 1002,["916"] = 1002,["917"] = 1002,["918"] = 1002,["919"] = 1002,["920"] = 1014,["921"] = 1014,["922"] = 1014,["923"] = 1014,["924"] = 1014,["925"] = 1014,["926"] = 1014,["927"] = 1014,["928"] = 1014,["929"] = 1014,["930"] = 1014,["931"] = 1014,["932"] = 1026,["933"] = 1027,["934"] = 1028,["937"] = 1029,["938"] = 1030,["939"] = 1031,["940"] = 1032,["942"] = 1034,["943"] = 1035,["945"] = 1038,["948"] = 1040,["949"] = 1026,["950"] = 999,["951"] = 1044,["952"] = 1046,["953"] = 1047,["954"] = 1049,["955"] = 1052,["956"] = 1053,["957"] = 1054,["958"] = 1055,["959"] = 1058,["960"] = 1061,["961"] = 1062,["963"] = 1066,["964"] = 1067,["965"] = 1069,["966"] = 1070,["967"] = 1072,["970"] = 1044,["971"] = 1077,["972"] = 1078,["973"] = 1084,["974"] = 1085,["975"] = 1086,["976"] = 1088,["979"] = 1077,["980"] = 1093,["981"] = 1094,["982"] = 1097,["983"] = 1098,["984"] = 1099,["985"] = 1100,["986"] = 1101,["987"] = 1102,["988"] = 1103,["989"] = 1104,["990"] = 1105,["991"] = 1106,["992"] = 1107,["993"] = 1108,["994"] = 1109,["995"] = 1110,["996"] = 1111,["997"] = 1112,["998"] = 1113,["999"] = 1114,["1000"] = 1115,["1002"] = 1117,["1004"] = 1120,["1005"] = 1121,["1006"] = 1122,["1007"] = 1123,["1008"] = 1124,["1009"] = 1125,["1010"] = 1126,["1011"] = 1127,["1012"] = 1128,["1013"] = 1129,["1014"] = 1130,["1015"] = 1131,["1016"] = 1132,["1017"] = 1133,["1018"] = 1134,["1019"] = 1135,["1020"] = 1136,["1021"] = 1137,["1022"] = 1138,["1024"] = 1140,["1026"] = 1144,["1027"] = 1093,["1028"] = 1147,["1029"] = 1149,["1030"] = 1149,["1031"] = 1150,["1032"] = 1151,["1034"] = 1154,["1035"] = 1155,["1036"] = 1155,["1037"] = 1155,["1038"] = 1155,["1039"] = 1147});
local ____exports = {}
local ____fusion_2Drune_2Dmanager = require("ai.item.fusion-rune-manager")
local FusionRuneManager = ____fusion_2Drune_2Dmanager.FusionRuneManager
local ____bot_2Dpush_2Dtiming = require("ai.bot-push-timing")
local BotPushTiming = ____bot_2Dpush_2Dtiming.BotPushTiming
local ____FSA = require("ai.mode.FSA")
local FSA = ____FSA.FSA
local ____game = require("api.game")
local Game = ____game.Game
local ____player = require("api.player")
local Player = ____player.Player
local ____ranking = require("api.ranking")
local Ranking = ____ranking.Ranking
local ____fort_think = require("modifiers.global.fort_think")
local modifier_fort_think = ____fort_think.modifier_fort_think
local ____GameConfig = require("modules.GameConfig")
local GameConfig = ____GameConfig.GameConfig
local ____modifier_2Dhelper = require("modules.helper.modifier-helper")
local ModifierHelper = ____modifier_2Dhelper.ModifierHelper
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____skill_2Dtome_2Dauthorization = require("modules.lottery.skill-tome-authorization")
local SkillTomeAuthorization = ____skill_2Dtome_2Dauthorization.SkillTomeAuthorization
local ____hero_2Dban_2Dpick = require("modules.hero.hero-ban-pick")
local HeroBanPick = ____hero_2Dban_2Dpick.HeroBanPick
local ____hero_2Dpick = require("modules.hero.hero-pick")
local HeroPick = ____hero_2Dpick.HeroPick
local ____hero_2Dselectable_2Dlist = require("modules.hero.hero-selectable-list")
local SelectableHeroList = ____hero_2Dselectable_2Dlist.SelectableHeroList
local ____game_2Dend = require("modules.event.game-end.game-end")
local GameEnd = ____game_2Dend.GameEnd
____exports.EventGameStateChange = __TS__Class()
local EventGameStateChange = ____exports.EventGameStateChange
EventGameStateChange.name = "EventGameStateChange"
function EventGameStateChange.prototype.____constructor(self)
    self.rd8RestrictionNotified = {}
    self.startingGoldApplied = {}
    self.gameStartBonusGoldApplied = {}
    self.goldDebugMonitorStarted = false
    self.goldDebugLastByPlayer = {}
    self.lastPrePushLaneTeleportBotIds = {}
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:OnGameStateChanged() end,
        self
    )
end
function EventGameStateChange.prototype.OnGameStateChanged(self)
    local state = GameRules:State_Get()
    if state == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP then
        Timers:CreateTimer(
            1,
            function()
                Game:StartGame()
                self:setPlayerColor()
            end
        )
        Timers:CreateTimer(
            10,
            function()
                Ranking:LoadRankingInfo()
            end
        )
    elseif state == DOTA_GAMERULES_STATE_HERO_SELECTION then
        self:OnHeroSelection()
    elseif state == DOTA_GAMERULES_STATE_STRATEGY_TIME then
        self:OnStrategyTime()
    elseif state == DOTA_GAMERULES_STATE_PRE_GAME then
        self:OnPreGame()
        if IsInToolsMode() then
            Timers:CreateTimer(
                5,
                function()
                    self:executeDebugCommand("-ai item_qinglong_p")
                    self:executeDebugCommand("-ai item_ability_rp")
                end
            )
        end
    elseif state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        self:OnGameInProgress()
    end
end
function EventGameStateChange.prototype.OnGameInProgress(self)
    FusionRuneManager:InitializeFusion()
    GameRules.AbyssMode:Start()
    self:ScheduleRandomDraftProgressGameEnd()
    self:StartRd8LowLevelRestrictionEnforcement()
    self:StartPrePushBotLaneTeleportTimer()
end
function EventGameStateChange.prototype.StartPrePushBotLaneTeleportTimer(self)
    if GameRules.Option.abyssMode or GameRules.Option.midOnlyMode then
        return
    end
    local startTime = GameRules:GetGameTime()
    local firstTeleportDelay = GameRules.Option.randomDraftMode and 0 or 30
    Timers:CreateTimer(
        firstTeleportDelay,
        function()
            if GameRules:State_Get() ~= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
                return nil
            end
            if BotPushTiming:isAfterPhaseStart(GameRules:GetDOTATime(false, false)) then
                return nil
            end
            self:TryTeleportLowLevelBotsToWeakLane()
            return self:GetPrePushLaneTeleportInterval(startTime)
        end
    )
end
function EventGameStateChange.prototype.GetPrePushLaneTeleportInterval(self, startTime)
    local elapsed = math.max(
        GameRules:GetGameTime() - startTime,
        0
    )
    return 15 + math.floor(elapsed / 60) * 5
end
function EventGameStateChange.prototype.TryTeleportLowLevelBotsToWeakLane(self)
    local candidates = self:GetTeleportReadyDireBots()
    if #candidates == 0 then
        return
    end
    local selectedBots = self:SelectLowLevelBotsForLaneTeleport(candidates)
    if #selectedBots == 0 then
        return
    end
    self:GrantPrePushLowLevelBotIncome(selectedBots)
    local target = self:ResolveWeakLaneTeleportTarget()
    if target == nil then
        return
    end
    local teleportedBotIds = {}
    for ____, hero in ipairs(selectedBots) do
        do
            if self:HasEnemyLaneCreepNearPosition(
                hero,
                hero:GetAbsOrigin(),
                1000
            ) then
                goto __continue25
            end
            if self:IsHeroNearLaneTowers(hero, target.lane, 4000) then
                goto __continue25
            end
            local item = self:GetReadyTeleportScroll(hero)
            if item == nil then
                goto __continue25
            end
            local position = target.position:__add(RandomVector(450))
            hero:CastAbilityOnPosition(
                position,
                item,
                hero:GetPlayerOwnerID()
            )
            teleportedBotIds[#teleportedBotIds + 1] = tostring(hero:GetPlayerOwnerID())
            self:StartPostTeleportAttackWindow(hero)
        end
        ::__continue25::
    end
    if #teleportedBotIds > 0 then
        self.lastPrePushLaneTeleportBotIds = __TS__ArraySort(teleportedBotIds)
    end
end
function EventGameStateChange.prototype.GetTeleportReadyDireBots(self)
    local heroes = {}
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerResource:IsFakeClient(playerId) then
            return
        end
        if PlayerResource:GetTeam(playerId) ~= DOTA_TEAM_BADGUYS then
            return
        end
        local hero = PlayerResource:GetSelectedHeroEntity(playerId)
        if not self:IsValidTeleportCandidate(hero) then
            return
        end
        if self:GetReadyTeleportScroll(hero) == nil then
            return
        end
        heroes[#heroes + 1] = hero
    end)
    __TS__ArraySort(
        heroes,
        function(____, a, b) return a:GetLevel() - b:GetLevel() end
    )
    return heroes
end
function EventGameStateChange.prototype.SelectLowLevelBotsForLaneTeleport(self, candidates)
    local previousIds = __TS__New(Set, self.lastPrePushLaneTeleportBotIds)
    local freshCandidates = __TS__ArrayFilter(
        candidates,
        function(____, hero) return not previousIds:has(tostring(hero:GetPlayerOwnerID())) end
    )
    if #freshCandidates > 0 then
        return __TS__ArraySlice(freshCandidates, 0, 2)
    end
    return __TS__ArraySlice(candidates, 0, 2)
end
function EventGameStateChange.prototype.GrantPrePushLowLevelBotIncome(self, heroes)
    local xpMultiplier = GameRules.Option.direXpMultiplier or GameRules.Option.direGoldXpMultiplier or 1
    local goldMultiplier = GameRules.Option.direGoldXpMultiplier or 1
    local xp = math.floor(30 * xpMultiplier)
    local gold = math.floor(50 * goldMultiplier)
    for ____, hero in ipairs(heroes) do
        hero:AddExperience(xp, DOTA_ModifyXP_Unspecified, false, true)
        hero:ModifyGold(gold, true, DOTA_ModifyGold_Unspecified)
    end
end
function EventGameStateChange.prototype.IsValidTeleportCandidate(self, hero)
    return hero ~= nil and not hero:IsNull() and hero:IsRealHero() and hero:IsAlive() and not hero:IsIllusion() and not hero:HasModifier("modifier_teleporting") and hero:GetHealthPercent() > FSA.BOT_RETREAT_HP_PERCENT + 10 and not self:IsAttackingNeutralOrHero(hero)
end
function EventGameStateChange.prototype.IsAttackingNeutralOrHero(self, hero)
    local target = hero:GetAttackTarget()
    if target == nil or target:IsNull() then
        return false
    end
    return target:IsRealHero() or target:GetTeamNumber() == DOTA_TEAM_NEUTRALS
end
function EventGameStateChange.prototype.GetReadyTeleportScroll(self, hero)
    local item = hero:FindItemInInventory("item_tpscroll")
    if item == nil or item:IsNull() then
        return nil
    end
    if item:GetCooldownTimeRemaining() > 0 then
        return nil
    end
    if item:GetManaCost(-1) > hero:GetMana() then
        return nil
    end
    return item
end
function EventGameStateChange.prototype.ResolveWeakLaneTeleportTarget(self)
    local lanes = {"top", "mid", "bot"}
    local bestTarget
    local bestAllyCount = math.huge
    for ____, lane in ipairs(lanes) do
        do
            local position = self:FindLaneFightPosition(lane) or self:FindFriendlyLaneTowerPosition(lane)
            if position == nil then
                goto __continue52
            end
            local allyCount = self:CountDireBotsNearLaneTowers(lane, 4000)
            if allyCount < bestAllyCount then
                bestAllyCount = allyCount
                bestTarget = {lane = lane, position = position}
            end
        end
        ::__continue52::
    end
    return bestTarget
end
function EventGameStateChange.prototype.FindLaneFightPosition(self, lane)
    local creeps = FindUnitsInRadius(
        DOTA_TEAM_BADGUYS,
        Vector(0, 0, 0),
        nil,
        30000,
        DOTA_UNIT_TARGET_TEAM_BOTH,
        DOTA_UNIT_TARGET_CREEP,
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_ANY_ORDER,
        false
    )
    local goodCreeps = __TS__ArrayFilter(
        creeps,
        function(____, creep) return self:IsLaneCreep(creep) and creep:GetTeamNumber() == DOTA_TEAM_GOODGUYS end
    )
    local badCreeps = __TS__ArrayFilter(
        creeps,
        function(____, creep) return self:IsLaneCreep(creep) and creep:GetTeamNumber() == DOTA_TEAM_BADGUYS end
    )
    local bestPosition
    local bestDistance = math.huge
    for ____, goodCreep in ipairs(goodCreeps) do
        do
            if self:GetLaneFromPosition(goodCreep:GetAbsOrigin()) ~= lane then
                goto __continue59
            end
            for ____, badCreep in ipairs(badCreeps) do
                do
                    if self:GetLaneFromPosition(badCreep:GetAbsOrigin()) ~= lane then
                        goto __continue61
                    end
                    local distance = self:GetDistanceBetween(
                        goodCreep:GetAbsOrigin(),
                        badCreep:GetAbsOrigin()
                    )
                    if distance > 900 or distance >= bestDistance then
                        goto __continue61
                    end
                    bestDistance = distance
                    bestPosition = self:GetMidpoint(
                        goodCreep:GetAbsOrigin(),
                        badCreep:GetAbsOrigin()
                    )
                end
                ::__continue61::
            end
        end
        ::__continue59::
    end
    return bestPosition
end
function EventGameStateChange.prototype.FindFriendlyLaneTowerPosition(self, lane)
    local tower1 = self:FindLaneTower(lane, "tower1", DOTA_TEAM_BADGUYS)
    if tower1 ~= nil then
        return tower1:GetAbsOrigin()
    end
    local ____opt_0 = self:FindLaneTower(lane, "tower2", DOTA_TEAM_BADGUYS)
    return ____opt_0 and ____opt_0:GetAbsOrigin()
end
function EventGameStateChange.prototype.FindLaneTower(self, lane, tier, team)
    local towers = Entities:FindAllByClassname("npc_dota_tower")
    for ____, tower in ipairs(towers) do
        do
            if tower:IsNull() or not tower:IsAlive() or tower:GetTeamNumber() ~= team then
                goto __continue69
            end
            local name = tower:GetUnitName()
            if __TS__StringIncludes(name, tier) and __TS__StringIncludes(name, lane) then
                return tower
            end
        end
        ::__continue69::
    end
    return nil
end
function EventGameStateChange.prototype.CountDireBotsNearLaneTowers(self, lane, radius)
    local count = 0
    local direTower = self:FindLaneTower(lane, "tower1", DOTA_TEAM_BADGUYS) or self:FindLaneTower(lane, "tower2", DOTA_TEAM_BADGUYS)
    local radiantTower = self:FindLaneTower(lane, "tower1", DOTA_TEAM_GOODGUYS) or self:FindLaneTower(lane, "tower2", DOTA_TEAM_GOODGUYS)
    if direTower ~= nil then
        count = count + self:CountDireBotsNearPosition(
            direTower:GetAbsOrigin(),
            radius
        )
    end
    if radiantTower ~= nil then
        count = count + self:CountDireBotsNearPosition(
            radiantTower:GetAbsOrigin(),
            radius
        )
    end
    return count
end
function EventGameStateChange.prototype.IsHeroNearLaneTowers(self, hero, lane, radius)
    local direTower = self:FindLaneTower(lane, "tower1", DOTA_TEAM_BADGUYS) or self:FindLaneTower(lane, "tower2", DOTA_TEAM_BADGUYS)
    local radiantTower = self:FindLaneTower(lane, "tower1", DOTA_TEAM_GOODGUYS) or self:FindLaneTower(lane, "tower2", DOTA_TEAM_GOODGUYS)
    local heroPosition = hero:GetAbsOrigin()
    if direTower ~= nil and self:GetDistanceBetween(
        heroPosition,
        direTower:GetAbsOrigin()
    ) <= radius then
        return true
    end
    if radiantTower ~= nil and self:GetDistanceBetween(
        heroPosition,
        radiantTower:GetAbsOrigin()
    ) <= radius then
        return true
    end
    return false
end
function EventGameStateChange.prototype.CountDireBotsNearPosition(self, position, radius)
    local count = 0
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerResource:IsFakeClient(playerId) then
            return
        end
        if PlayerResource:GetTeam(playerId) ~= DOTA_TEAM_BADGUYS then
            return
        end
        local hero = PlayerResource:GetSelectedHeroEntity(playerId)
        if not hero or hero:IsNull() or not hero:IsAlive() then
            return
        end
        if self:GetDistanceBetween(
            hero:GetAbsOrigin(),
            position
        ) <= radius then
            count = count + 1
        end
    end)
    return count
end
function EventGameStateChange.prototype.StartPostTeleportAttackWindow(self, hero)
    Timers:CreateTimer(
        0.5,
        function()
            if not self:IsValidPostTeleportAttackHero(hero) then
                return nil
            end
            if hero:HasModifier("modifier_teleporting") then
                return 0.25
            end
            local endTime = GameRules:GetGameTime() + 5
            Timers:CreateTimer(function()
                if not self:IsValidPostTeleportAttackHero(hero) then
                    return nil
                end
                local target = self:FindSafeNearbyCreepOrNeutral(hero, 1000)
                if target ~= nil then
                    ExecuteOrderFromTable({
                        UnitIndex = hero:entindex(),
                        OrderType = DOTA_UNIT_ORDER_ATTACK_TARGET,
                        TargetIndex = target:entindex()
                    })
                end
                return GameRules:GetGameTime() < endTime and 1 or nil
            end)
            return nil
        end
    )
end
function EventGameStateChange.prototype.IsValidPostTeleportAttackHero(self, hero)
    return hero ~= nil and not hero:IsNull() and hero:IsAlive() and not hero:IsIllusion()
end
function EventGameStateChange.prototype.FindSafeNearbyCreepOrNeutral(self, hero, radius)
    local units = FindUnitsInRadius(
        hero:GetTeamNumber(),
        hero:GetAbsOrigin(),
        nil,
        radius,
        DOTA_UNIT_TARGET_TEAM_BOTH,
        DOTA_UNIT_TARGET_CREEP,
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_CLOSEST,
        false
    )
    for ____, unit in ipairs(units) do
        do
            if unit:IsNull() or not unit:IsAlive() then
                goto __continue94
            end
            if not self:IsAttackableCreepOrNeutral(hero, unit) then
                goto __continue94
            end
            if self:HasEnemyHeroNearPosition(
                hero,
                unit:GetAbsOrigin(),
                1000
            ) then
                goto __continue94
            end
            return unit
        end
        ::__continue94::
    end
    return nil
end
function EventGameStateChange.prototype.IsAttackableCreepOrNeutral(self, hero, unit)
    if unit:GetTeamNumber() == hero:GetTeamNumber() then
        return false
    end
    return self:IsLaneCreep(unit) or unit:GetTeamNumber() == DOTA_TEAM_NEUTRALS
end
function EventGameStateChange.prototype.HasEnemyHeroNearPosition(self, hero, position, radius)
    local enemies = FindUnitsInRadius(
        hero:GetTeamNumber(),
        position,
        nil,
        radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        DOTA_UNIT_TARGET_HERO,
        DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS,
        FIND_ANY_ORDER,
        false
    )
    return #enemies > 0
end
function EventGameStateChange.prototype.HasEnemyLaneCreepNearPosition(self, hero, position, radius)
    local creeps = FindUnitsInRadius(
        hero:GetTeamNumber(),
        position,
        nil,
        radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        DOTA_UNIT_TARGET_CREEP,
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_ANY_ORDER,
        false
    )
    return __TS__ArraySome(
        creeps,
        function(____, creep) return self:IsLaneCreep(creep) end
    )
end
function EventGameStateChange.prototype.IsLaneCreep(self, unit)
    local name = unit:GetUnitName()
    return __TS__StringIncludes(name, "creep_goodguys") or __TS__StringIncludes(name, "creep_badguys")
end
function EventGameStateChange.prototype.GetLaneFromPosition(self, position)
    local diff = math.abs(math.abs(position.x) - math.abs(position.y))
    if diff < 1500 then
        return "mid"
    end
    if position.x > 0 and position.y < 0 then
        return "bot"
    end
    if position.x < 0 and position.y > 0 then
        return "top"
    end
    return "unknown"
end
function EventGameStateChange.prototype.GetDistanceBetween(self, a, b)
    local dx = a.x - b.x
    local dy = a.y - b.y
    return math.sqrt(dx * dx + dy * dy)
end
function EventGameStateChange.prototype.GetMidpoint(self, a, b)
    return Vector((a.x + b.x) / 2, (a.y + b.y) / 2, (a.z + b.z) / 2)
end
function EventGameStateChange.prototype.executeDebugCommand(self, command)
    print("[AutoDebug] Executing: " .. command)
    if command == "-g" then
        local hero = PlayerResource:GetSelectedHeroEntity(0)
        if not hero then
            print("[AutoDebug] Hero not found for player " .. 0)
            return
        end
        hero:ModifyGold(60000, false, DOTA_ModifyGold_Unspecified)
        hero:AddExperience(60000, DOTA_ModifyXP_Unspecified, false, true)
        print("[AutoDebug] Added gold and XP to " .. hero:GetUnitName())
    end
    if command == "-gall" then
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                print("[AutoDebug] Hero not found for player " .. tostring(playerId))
                return
            end
            hero:ModifyGold(60000, false, DOTA_ModifyGold_Unspecified)
            hero:AddExperience(60000, DOTA_ModifyXP_Unspecified, false, true)
            print("[AutoDebug] Added gold and XP to " .. hero:GetUnitName())
        end)
    elseif __TS__StringStartsWith(command, "-additemall") then
        local itemName = __TS__StringSplit(command, " ")[2]
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                print("[AutoDebug] Hero not found for player " .. tostring(playerId))
                return
            end
            local item = hero:AddItemByName(itemName)
            if item ~= nil then
                SkillTomeAuthorization:authorizeItem(item, itemName)
                print((("[AutoDebug] Added " .. itemName) .. " to ") .. hero:GetUnitName())
            else
                print((("[AutoDebug] Failed to add " .. itemName) .. " to ") .. hero:GetUnitName())
            end
        end)
    elseif __TS__StringStartsWith(command, "-ai") then
        local itemName = __TS__StringSplit(command, " ")[2]
        local hero = PlayerResource:GetSelectedHeroEntity(0)
        if not hero then
            print("[AutoDebug] Hero not found for player " .. 0)
            return
        end
        local item = hero:AddItemByName(itemName)
        if item ~= nil then
            SkillTomeAuthorization:authorizeItem(item, itemName)
            print((("[AutoDebug] Added " .. itemName) .. " to ") .. hero:GetUnitName())
        else
            print((("[AutoDebug] Failed to add " .. itemName) .. " to ") .. hero:GetUnitName())
        end
    end
end
function EventGameStateChange.prototype.OnHeroSelection(self)
    GameRules.Option:SetDefaultDifficulty()
    self:ApplyHumanStartingGold()
    print((((((("[HeroBanPick][State] HERO_SELECTION difficulty=" .. tostring(GameRules.Option.gameDifficulty)) .. " rdMode=") .. tostring(GameRules.Option.randomDraftMode)) .. " nativeBanPhase=") .. tostring(GameRules:IsInBanPhase())) .. " nativeBanned=") .. tostring(#GameRules:GetBannedHeroes()))
    if GameRules.Option.randomDraftMode then
        local remainingHeroCount = 3 + PlayerHelper:GetHumamPlayerCount()
        print((((("[HeroBanPick][RandomDraftStart] humans=" .. tostring(PlayerHelper:GetHumamPlayerCount())) .. " remaining=") .. tostring(remainingHeroCount)) .. " pool=") .. tostring(#SelectableHeroList))
        HeroBanPick:ApplyRandomDraftBan(SelectableHeroList, remainingHeroCount)
        HeroBanPick:StartSelectionEnforcement(SelectableHeroList)
        return
    end
    HeroBanPick:StartVotePhase(5, 8, SelectableHeroList)
    local heroBanPickLogTicks = 0
    Timers:CreateTimer(
        1,
        function()
            heroBanPickLogTicks = heroBanPickLogTicks + 1
            print((((("[HeroBanPick][StateTick] time=" .. tostring(GameRules:GetGameTime())) .. " IsInBanPhase=") .. tostring(GameRules:IsInBanPhase())) .. " nativeBanned=") .. table.concat(
                GameRules:GetBannedHeroes(),
                ","
            ))
            if heroBanPickLogTicks >= 12 then
                return nil
            end
            return 1
        end
    )
end
function EventGameStateChange.prototype.ApplyHumanStartingGold(self)
    local startGold = self:GetConfiguredHumanStartingGold()
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        local key = tostring(playerId)
        if self.startingGoldApplied[key] then
            return
        end
        local currentGold = PlayerResource:GetGold(playerId)
        PlayerResource:SetGold(playerId, startGold, true)
        PlayerResource:SetGold(playerId, 0, false)
        self.startingGoldApplied[key] = true
        print((((("[StartingGold][HeroSelection] human playerId=" .. tostring(playerId)) .. " currentGold=") .. tostring(currentGold)) .. " targetGold=") .. tostring(startGold))
    end)
end
function EventGameStateChange.prototype.CapHumanStartingGold(self)
    local startGold = self:GetConfiguredHumanStartingGold()
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        local currentGold = PlayerResource:GetGold(playerId)
        if currentGold <= startGold then
            return
        end
        PlayerResource:SetGold(playerId, startGold, true)
        PlayerResource:SetGold(playerId, 0, false)
        print((((("[StartingGold][StrategyCap] human playerId=" .. tostring(playerId)) .. " currentGold=") .. tostring(currentGold)) .. " targetGold=") .. tostring(startGold))
    end)
end
function EventGameStateChange.prototype.ApplyGameStartBonusGold(self)
    local bonusGold = self:GetSoloStartingGoldBonus()
    if bonusGold <= 0 then
        return
    end
    PlayerHelper:ForEachPlayer(function(____, playerId)
        local key = tostring(playerId)
        if self.gameStartBonusGoldApplied[key] then
            return
        end
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        PlayerResource:ModifyGold(playerId, bonusGold, true, DOTA_ModifyGold_Unspecified)
        self.gameStartBonusGoldApplied[key] = true
        print((("[StartingGold][SoloBonus] human playerId=" .. tostring(playerId)) .. " bonusGold=") .. tostring(bonusGold))
    end)
end
function EventGameStateChange.prototype.GetSoloStartingGoldBonus(self)
    local difficulty = GameRules.Option.gameDifficulty
    if difficulty >= 1 and difficulty <= 9 and PlayerHelper:GetHumamPlayerCount() == 1 then
        return 1500
    end
    return 0
end
function EventGameStateChange.prototype.StartGoldDebugMonitor(self)
    if self.goldDebugMonitorStarted then
        return
    end
    self.goldDebugMonitorStarted = true
    Timers:CreateTimer(
        0,
        function()
            self:PrintGoldDebugChanges()
            local state = GameRules:State_Get()
            local dotaTime = GameRules:GetDOTATime(false, false)
            if state >= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS and dotaTime > 90 then
                return nil
            end
            return 0.3
        end
    )
end
function EventGameStateChange.prototype.PrintGoldDebugChanges(self)
    local state = GameRules:State_Get()
    local stateName = self:GetGameStateName(state)
    local gameTime = GameRules:GetGameTime()
    local dotaTime = GameRules:GetDOTATime(false, false)
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        local gold = PlayerResource:GetGold(playerId)
        local reliable = PlayerResource:GetReliableGold(playerId)
        local unreliable = PlayerResource:GetUnreliableGold(playerId)
        local key = tostring(playerId)
        local last = self.goldDebugLastByPlayer[key]
        if last ~= nil and last.gold == gold and last.reliable == reliable and last.unreliable == unreliable then
            return
        end
        local deltaGold = last == nil and 0 or gold - last.gold
        local deltaReliable = last == nil and 0 or reliable - last.reliable
        local deltaUnreliable = last == nil and 0 or unreliable - last.unreliable
        print((((((((((((((((((("[GoldDebug] state=" .. stateName) .. " gameTime=") .. __TS__NumberToFixed(gameTime, 1)) .. " dotaTime=") .. __TS__NumberToFixed(dotaTime, 1)) .. " playerId=") .. tostring(playerId)) .. " gold=") .. tostring(gold)) .. " reliable=") .. tostring(reliable)) .. " unreliable=") .. tostring(unreliable)) .. " delta=") .. tostring(deltaGold)) .. "/") .. tostring(deltaReliable)) .. "/") .. tostring(deltaUnreliable))
        self.goldDebugLastByPlayer[key] = {gold = gold, reliable = reliable, unreliable = unreliable}
    end)
end
function EventGameStateChange.prototype.GetGameStateName(self, state)
    repeat
        local ____switch154 = state
        local ____cond154 = ____switch154 == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP
        if ____cond154 then
            return "CUSTOM_GAME_SETUP"
        end
        ____cond154 = ____cond154 or ____switch154 == DOTA_GAMERULES_STATE_HERO_SELECTION
        if ____cond154 then
            return "HERO_SELECTION"
        end
        ____cond154 = ____cond154 or ____switch154 == DOTA_GAMERULES_STATE_STRATEGY_TIME
        if ____cond154 then
            return "STRATEGY_TIME"
        end
        ____cond154 = ____cond154 or ____switch154 == DOTA_GAMERULES_STATE_PRE_GAME
        if ____cond154 then
            return "PRE_GAME"
        end
        ____cond154 = ____cond154 or ____switch154 == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS
        if ____cond154 then
            return "GAME_IN_PROGRESS"
        end
        ____cond154 = ____cond154 or ____switch154 == DOTA_GAMERULES_STATE_POST_GAME
        if ____cond154 then
            return "POST_GAME"
        end
        do
            return tostring(state)
        end
    until true
end
function EventGameStateChange.prototype.GetConfiguredHumanStartingGold(self)
    local legacyGold = AIGameMode and AIGameMode.iStartingGoldPlayer or 0
    if legacyGold > 0 and legacyGold ~= 600 then
        return legacyGold
    end
    return GameRules.Option.startingGoldPlayer
end
function EventGameStateChange.prototype.ScheduleRandomDraftProgressGameEnd(self)
    if not GameRules.Option.randomDraftMode then
        return
    end
    Timers:CreateTimer(
        480,
        function()
            GameEnd:PostRandomDraftProgressGameEnd()
            return nil
        end
    )
end
function EventGameStateChange.prototype.StartRd8LowLevelRestrictionEnforcement(self)
    if GameRules.Option.gameDifficulty ~= 9 then
        return
    end
    if PlayerHelper:GetHumamPlayerCount() ~= 1 then
        return
    end
    Timers:CreateTimer(
        0.1,
        function()
            PlayerHelper:ForEachPlayer(function(____, playerId)
                if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
                    return
                end
                if not self:ShouldRestrictRd8Player(playerId) then
                    return
                end
                local hero = PlayerResource:GetSelectedHeroEntity(playerId)
                if not hero then
                    return
                end
                hero:AddNewModifier(hero, nil, "modifier_rd8_low_level_rooted", {})
                local key = tostring(playerId)
                if self.rd8RestrictionNotified[key] then
                    return
                end
                self.rd8RestrictionNotified[key] = true
                GameRules:SendCustomMessage("<font color='#FF6B6B'>[RD8限制]</font> 单人挑战需要属性等级达到72级。当前属性等级不足，已永久禁锢。组队游玩不受限制。", playerId, 0)
            end)
            if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
                return 3
            end
            return nil
        end
    )
end
function EventGameStateChange.prototype.ShouldRestrictRd8Player(self, playerId)
    local steamId = PlayerResource:GetSteamAccountID(playerId)
    local playerInfo = __TS__ArrayFind(
        Player.playerList,
        function(____, player) return player.id == tostring(steamId) end
    )
    return (playerInfo and playerInfo.totalLevel or 0) < 72
end
function EventGameStateChange.prototype.OnStrategyTime(self)
    GameConfig:SetMaxLevelXPRequire()
    print((("[HeroBanPick][State] STRATEGY_TIME IsInBanPhase=" .. tostring(GameRules:IsInBanPhase())) .. " nativeBanned=") .. table.concat(
        GameRules:GetBannedHeroes(),
        ","
    ))
    if not GameRules.Option.randomDraftMode then
        HeroBanPick:FinalizeBans()
    end
    HeroBanPick:ValidateHumanHeroSelections(SelectableHeroList)
    HeroPick:PickHumanHeroes()
    self:CapHumanStartingGold()
    HeroPick:PickBotHeroes()
end
function EventGameStateChange.prototype.OnPreGame(self)
    print("[EventGameStateChange] OnPreGame")
    Timers:CreateTimer(
        5,
        function()
            self:ApplyGameStartBonusGold()
        end
    )
    if GameRules.Option.abyssMode then
        local botReleaseDelay = math.max(GameConfig.PRE_GAME_TIME - 40, 1)
        Timers:CreateTimer(
            botReleaseDelay,
            function()
                GameRules.AbyssMode:Initialize()
            end
        )
    end
    local towers = Entities:FindAllByClassname("npc_dota_tower")
    for ____, tower in ipairs(towers) do
        self:addModifierToTowers(tower)
    end
    local barracks = Entities:FindAllByClassname("npc_dota_barracks")
    for ____, barrack in ipairs(barracks) do
        self:addModifierToTowers(barrack)
    end
    local healer = Entities:FindAllByClassname("npc_dota_healer")
    for ____, heal in ipairs(healer) do
        self:addModifierToTowers(heal)
    end
    local bases = Entities:FindAllByClassname("npc_dota_fort")
    for ____, base in ipairs(bases) do
        self:addModifierToTowers(base)
        base:AddNewModifier(base, nil, modifier_fort_think.name, {})
    end
    self:SpawnFountainGuard()
    Timers:CreateTimer(
        1,
        function()
            local fountains = Entities:FindAllByClassname("ent_dota_fountain")
            for ____, fountain in ipairs(fountains) do
                local towerPower = GameRules.Option.towerPower
                local towerLevel = self:getTowerLevel(towerPower)
                local furySwipes = fountain:FindAbilityByName("tower_ursa_fury_swipes")
                if furySwipes ~= nil then
                    furySwipes:SetLevel(towerLevel)
                end
                local manaBreak = fountain:FindAbilityByName("tower_antimage_mana_break")
                if manaBreak ~= nil then
                    manaBreak:SetLevel(towerLevel)
                end
            end
        end
    )
    self:setPlayerColor()
end
function EventGameStateChange.prototype.SpawnFountainGuard(self)
    local fountainPosition = Vector(-5820, -6580, 384)
    local guard = CreateUnitByName(
        "npc_windy",
        fountainPosition,
        true,
        nil,
        nil,
        DOTA_TEAM_BADGUYS
    )
    if guard ~= nil and guard ~= nil then
        guard:AddNewModifier(guard, nil, "modifier_rooted", {})
    else
    end
end
function EventGameStateChange.prototype.SpawnFountainGuardDire(self)
    local fountainPosition = Vector(5820, 6580, 384)
    local guard = CreateUnitByName(
        "npc_windy",
        fountainPosition,
        true,
        nil,
        nil,
        DOTA_TEAM_BADGUYS
    )
    local radius = 500
    GridNav:DestroyTreesAroundPoint(fountainPosition, radius, true)
    if guard ~= nil and guard ~= nil then
        guard:AddNewModifier(guard, nil, "modifier_rooted", {})
    else
    end
end
function EventGameStateChange.prototype.setPlayerColor(self)
    local radiantPlayerIndex = 0
    local direPlayerIndex = 0
    local radiantColors = {
        {51, 117, 255},
        {102, 255, 191},
        {191, 0, 191},
        {243, 240, 11},
        {255, 107, 0},
        {135, 206, 250},
        {255, 127, 80},
        {255, 0, 255},
        {0, 255, 0},
        {255, 215, 0}
    }
    local direColors = {
        {254, 134, 194},
        {161, 180, 71},
        {101, 217, 247},
        {0, 131, 33},
        {164, 105, 0},
        {220, 20, 60},
        {0, 128, 128},
        {0, 0, 139},
        {245, 245, 220},
        {139, 0, 0}
    }
    PlayerHelper:ForEachPlayer(function(____, playerId)
        local player = PlayerResource:GetPlayer(playerId)
        if not player then
            return
        end
        local color
        if player:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
            color = radiantColors[radiantPlayerIndex + 1]
            radiantPlayerIndex = radiantPlayerIndex + 1
        else
            color = direColors[direPlayerIndex + 1]
            direPlayerIndex = direPlayerIndex + 1
        end
        if not color then
            return
        end
        PlayerResource:SetCustomPlayerColor(playerId, color[1], color[2], color[3])
    end)
end
function EventGameStateChange.prototype.addModifierToTowers(self, building)
    local towerPower = GameRules.Option.towerPower
    local towerLevel = self:getTowerLevel(towerPower)
    ModifierHelper:applyTowerModifier(building, "modifier_tower_power", towerLevel)
    local newHealth = math.floor(towerPower / 100 * building:GetMaxHealth())
    building:SetMaxHealth(newHealth)
    building:SetBaseMaxHealth(newHealth)
    building:SetHealth(newHealth)
    local buildingName = building:GetUnitName()
    if __TS__StringIncludes(buildingName, "tower3") or __TS__StringIncludes(buildingName, "tower4") then
        self:addTowerAbilities(building, towerLevel)
    end
    if __TS__StringIncludes(buildingName, "fort") then
        self:addTowerAbilities(building, towerLevel)
        local manaBreak = building:AddAbility("tower_antimage_mana_break")
        if manaBreak ~= nil then
            manaBreak:SetLevel(towerLevel)
        end
    end
end
function EventGameStateChange.prototype.addTowerAbilities(self, building, level)
    local abilities = {"tower_ursa_fury_swipes", "tower_shredder_reactive_armor", "tower_troll_warlord_fervor"}
    for ____, abilityName in ipairs(abilities) do
        local ability = building:AddAbility(abilityName)
        if ability ~= nil then
            ability:SetLevel(level)
        end
    end
end
function EventGameStateChange.prototype.getTowerLevel(self, percent)
    local xpMultiplier = GameRules.Option.direGoldXpMultiplier
    local maxLevelByXp = 1
    if GameRules.Option.abyssMode then
        maxLevelByXp = 10
    elseif xpMultiplier >= 100 then
        maxLevelByXp = 10
    elseif xpMultiplier >= 40 then
        maxLevelByXp = 9
    elseif xpMultiplier >= 15 then
        maxLevelByXp = 8
    elseif xpMultiplier >= 10 then
        maxLevelByXp = 7
    elseif xpMultiplier >= 7 then
        maxLevelByXp = 5
    elseif xpMultiplier >= 5 then
        maxLevelByXp = 4
    elseif xpMultiplier >= 4 then
        maxLevelByXp = 3
    elseif xpMultiplier >= 3 then
        maxLevelByXp = 2
    else
        maxLevelByXp = 1
    end
    local levelByPercent = 1
    if percent <= 100 then
        levelByPercent = 1
    elseif percent <= 150 then
        levelByPercent = 2
    elseif percent <= 200 then
        levelByPercent = 3
    elseif percent <= 250 then
        levelByPercent = 4
    elseif percent <= 300 then
        levelByPercent = 5
    elseif percent <= 350 then
        levelByPercent = 6
    elseif percent <= 400 then
        levelByPercent = 7
    elseif percent <= 500 then
        levelByPercent = 8
    elseif percent <= 600 then
        levelByPercent = 9
    else
        levelByPercent = 10
    end
    return math.min(levelByPercent, maxLevelByXp)
end
function EventGameStateChange.prototype.getTowerAbilityLevel(self)
    local ____opt_6 = CustomNetTables:GetTableValue("game_difficulty", "all")
    local gameDifficulty = ____opt_6 and ____opt_6.difficulty or 0
    if gameDifficulty > 0 then
        return gameDifficulty
    end
    local towerPower = GameRules.Option.towerPower
    return math.min(
        self:getTowerLevel(towerPower),
        6
    )
end
return ____exports
