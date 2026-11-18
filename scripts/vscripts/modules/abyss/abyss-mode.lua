local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__NumberToFixed = ____lualib.__TS__NumberToFixed
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/abyss/abyss-mode.lua"
__TS__SourceMapTraceBack("modules/abyss/abyss-mode.lua", {["17"] = 3,["18"] = 3,["19"] = 4,["20"] = 4,["21"] = 5,["22"] = 5,["23"] = 6,["24"] = 6,["25"] = 7,["26"] = 9,["27"] = 10,["28"] = 11,["29"] = 12,["30"] = 13,["31"] = 42,["32"] = 42,["33"] = 42,["35"] = 43,["36"] = 44,["37"] = 45,["38"] = 46,["39"] = 47,["40"] = 48,["41"] = 49,["42"] = 50,["43"] = 51,["44"] = 52,["45"] = 53,["46"] = 54,["47"] = 55,["48"] = 56,["49"] = 57,["50"] = 58,["51"] = 59,["52"] = 60,["53"] = 61,["54"] = 62,["55"] = 63,["56"] = 64,["57"] = 65,["58"] = 66,["59"] = 68,["60"] = 69,["61"] = 70,["62"] = 71,["63"] = 72,["64"] = 73,["65"] = 74,["66"] = 75,["67"] = 42,["68"] = 77,["69"] = 78,["70"] = 78,["71"] = 77,["72"] = 81,["73"] = 82,["74"] = 81,["75"] = 85,["76"] = 86,["77"] = 85,["78"] = 89,["79"] = 90,["80"] = 89,["81"] = 93,["82"] = 94,["83"] = 93,["84"] = 97,["85"] = 98,["88"] = 102,["89"] = 103,["92"] = 106,["93"] = 107,["94"] = 108,["95"] = 109,["96"] = 109,["97"] = 109,["98"] = 109,["99"] = 109,["100"] = 109,["101"] = 109,["102"] = 109,["103"] = 109,["104"] = 109,["105"] = 109,["106"] = 109,["107"] = 102,["108"] = 97,["109"] = 120,["110"] = 121,["113"] = 125,["114"] = 126,["115"] = 127,["116"] = 128,["118"] = 120,["119"] = 132,["120"] = 132,["121"] = 132,["123"] = 133,["126"] = 137,["127"] = 138,["128"] = 139,["129"] = 140,["130"] = 141,["131"] = 142,["132"] = 143,["133"] = 144,["134"] = 145,["135"] = 146,["136"] = 147,["137"] = 147,["138"] = 147,["139"] = 148,["140"] = 147,["141"] = 147,["143"] = 132,["144"] = 153,["145"] = 154,["148"] = 158,["149"] = 159,["150"] = 160,["153"] = 164,["156"] = 168,["157"] = 169,["158"] = 170,["159"] = 171,["160"] = 172,["161"] = 173,["162"] = 174,["165"] = 178,["166"] = 179,["167"] = 180,["168"] = 181,["169"] = 182,["170"] = 183,["171"] = 184,["172"] = 184,["173"] = 184,["174"] = 185,["177"] = 188,["178"] = 189,["179"] = 184,["180"] = 184,["181"] = 153,["182"] = 193,["183"] = 194,["186"] = 198,["187"] = 199,["188"] = 200,["189"] = 201,["190"] = 202,["192"] = 193,["193"] = 206,["194"] = 207,["197"] = 211,["200"] = 215,["201"] = 216,["204"] = 220,["205"] = 221,["206"] = 222,["207"] = 223,["208"] = 224,["209"] = 225,["211"] = 206,["212"] = 231,["213"] = 232,["214"] = 232,["216"] = 234,["217"] = 235,["219"] = 238,["220"] = 239,["221"] = 240,["222"] = 241,["223"] = 242,["224"] = 243,["225"] = 244,["227"] = 247,["228"] = 248,["229"] = 249,["230"] = 250,["231"] = 251,["232"] = 252,["233"] = 253,["235"] = 255,["236"] = 256,["237"] = 257,["238"] = 257,["239"] = 257,["240"] = 257,["241"] = 257,["242"] = 256,["243"] = 256,["244"] = 256,["245"] = 260,["246"] = 261,["247"] = 262,["248"] = 263,["249"] = 263,["250"] = 264,["252"] = 265,["254"] = 263,["255"] = 266,["256"] = 267,["257"] = 271,["258"] = 272,["259"] = 276,["260"] = 277,["261"] = 278,["262"] = 279,["263"] = 281,["264"] = 282,["265"] = 283,["266"] = 283,["267"] = 283,["268"] = 284,["269"] = 285,["272"] = 288,["273"] = 289,["276"] = 283,["277"] = 283,["278"] = 294,["279"] = 294,["280"] = 294,["281"] = 295,["282"] = 296,["285"] = 299,["286"] = 300,["287"] = 301,["288"] = 301,["289"] = 301,["290"] = 302,["293"] = 305,["294"] = 307,["295"] = 308,["296"] = 309,["297"] = 310,["299"] = 312,["300"] = 312,["301"] = 312,["302"] = 312,["303"] = 312,["304"] = 312,["305"] = 312,["308"] = 321,["309"] = 322,["310"] = 322,["311"] = 322,["312"] = 322,["313"] = 322,["314"] = 322,["315"] = 322,["316"] = 301,["317"] = 301,["318"] = 294,["319"] = 294,["320"] = 332,["321"] = 332,["322"] = 332,["323"] = 333,["326"] = 336,["327"] = 337,["328"] = 338,["329"] = 339,["330"] = 340,["331"] = 341,["333"] = 332,["334"] = 332,["335"] = 345,["336"] = 345,["337"] = 345,["338"] = 345,["339"] = 345,["340"] = 351,["341"] = 352,["343"] = 355,["344"] = 231,["345"] = 358,["346"] = 359,["347"] = 360,["350"] = 358,["351"] = 365,["352"] = 366,["355"] = 370,["356"] = 371,["357"] = 372,["358"] = 373,["359"] = 374,["360"] = 365,["361"] = 377,["362"] = 378,["363"] = 379,["364"] = 380,["366"] = 383,["367"] = 377,["368"] = 386,["369"] = 387,["372"] = 390,["373"] = 392,["374"] = 392,["375"] = 392,["376"] = 393,["379"] = 396,["380"] = 392,["381"] = 392,["382"] = 399,["383"] = 399,["384"] = 399,["385"] = 400,["388"] = 403,["389"] = 399,["390"] = 399,["391"] = 386,["392"] = 407,["393"] = 408,["394"] = 409,["397"] = 412,["398"] = 408,["399"] = 414,["400"] = 407,["401"] = 417,["402"] = 418,["403"] = 417,["404"] = 421,["405"] = 422,["406"] = 421,["407"] = 425,["408"] = 426,["409"] = 425,["410"] = 429,["411"] = 430,["412"] = 429,["413"] = 433,["414"] = 434,["415"] = 433,["416"] = 437,["417"] = 442,["418"] = 443,["419"] = 445,["420"] = 446,["421"] = 447,["422"] = 448,["423"] = 449,["424"] = 450,["425"] = 451,["427"] = 453,["428"] = 454,["429"] = 455,["430"] = 456,["431"] = 457,["432"] = 460,["433"] = 460,["434"] = 460,["435"] = 460,["436"] = 461,["437"] = 462,["438"] = 464,["439"] = 465,["441"] = 437,["442"] = 469,["443"] = 470,["444"] = 472,["445"] = 473,["446"] = 474,["447"] = 475,["448"] = 476,["451"] = 480,["454"] = 484,["455"] = 485,["456"] = 486,["457"] = 487,["459"] = 469,["460"] = 491,["461"] = 492,["462"] = 494,["463"] = 495,["466"] = 499,["467"] = 491,["468"] = 502,["469"] = 503,["470"] = 502,["471"] = 506,["473"] = 507,["474"] = 507,["475"] = 508,["476"] = 509,["479"] = 512,["480"] = 507,["484"] = 515,["485"] = 515,["486"] = 516,["487"] = 517,["488"] = 518,["490"] = 515,["493"] = 506,["494"] = 523,["495"] = 527,["496"] = 527,["497"] = 527,["498"] = 528,["499"] = 529,["500"] = 527,["501"] = 527,["502"] = 534,["503"] = 523,["504"] = 540,["505"] = 541,["507"] = 542,["508"] = 542,["509"] = 543,["510"] = 544,["511"] = 544,["512"] = 544,["513"] = 542,["516"] = 546,["517"] = 540,["518"] = 549,["519"] = 550,["522"] = 553,["525"] = 557,["526"] = 558,["527"] = 559,["528"] = 549,["529"] = 564,["530"] = 565,["531"] = 566,["532"] = 567,["533"] = 568,["534"] = 568,["537"] = 570,["538"] = 564,["539"] = 573,["540"] = 574,["541"] = 575,["542"] = 576,["543"] = 577,["544"] = 578,["545"] = 579,["546"] = 580,["547"] = 581,["549"] = 573,["550"] = 585,["551"] = 586,["552"] = 587,["553"] = 588,["554"] = 589,["555"] = 590,["556"] = 585,["557"] = 593,["558"] = 594,["559"] = 593,["560"] = 597,["561"] = 599,["564"] = 606,["567"] = 609,["568"] = 597,["569"] = 612,["570"] = 613,["571"] = 614,["572"] = 612,["573"] = 617,["574"] = 618,["575"] = 618,["576"] = 618,["577"] = 620,["580"] = 628,["581"] = 628,["582"] = 628,["583"] = 628,["584"] = 628,["585"] = 633,["586"] = 618,["587"] = 618,["588"] = 617,["589"] = 637,["590"] = 638,["593"] = 642,["594"] = 643,["595"] = 643,["596"] = 643,["597"] = 644,["598"] = 645,["600"] = 648,["601"] = 649,["602"] = 650,["603"] = 651,["604"] = 654,["606"] = 657,["607"] = 658,["608"] = 659,["609"] = 660,["612"] = 664,["613"] = 643,["614"] = 643,["615"] = 637,["616"] = 668,["617"] = 669,["620"] = 673,["621"] = 674,["622"] = 675,["623"] = 668,["624"] = 678,["625"] = 679,["626"] = 680,["627"] = 682,["628"] = 684,["631"] = 689,["632"] = 690,["633"] = 682,["634"] = 693,["635"] = 678,["636"] = 696,["637"] = 697,["640"] = 701,["641"] = 702,["642"] = 702,["643"] = 702,["644"] = 702,["645"] = 702,["646"] = 707,["647"] = 710,["648"] = 696,["649"] = 713,["650"] = 714,["651"] = 715,["654"] = 718,["655"] = 719,["656"] = 713,["657"] = 722,["658"] = 723,["659"] = 722,["660"] = 726,["661"] = 727,["662"] = 727,["663"] = 727,["664"] = 728,["665"] = 729,["666"] = 727,["667"] = 727,["668"] = 726,["669"] = 733,["670"] = 734,["671"] = 735,["672"] = 737,["673"] = 740,["675"] = 735,["676"] = 743,["677"] = 733,["678"] = 746,["679"] = 747,["680"] = 748,["681"] = 750,["682"] = 750,["683"] = 750,["684"] = 751,["685"] = 752,["688"] = 755,["689"] = 756,["690"] = 750,["691"] = 750,["692"] = 759,["693"] = 760,["694"] = 760,["695"] = 760,["696"] = 759,["697"] = 761,["698"] = 761,["699"] = 761,["700"] = 759,["701"] = 759,["702"] = 746,["703"] = 765,["704"] = 766,["705"] = 766,["706"] = 767,["707"] = 767,["708"] = 767,["709"] = 767,["710"] = 767,["711"] = 767,["712"] = 767,["713"] = 768,["714"] = 769,["715"] = 770,["716"] = 771,["717"] = 772,["721"] = 765,["722"] = 780,["723"] = 781,["724"] = 782,["727"] = 785,["728"] = 780,["729"] = 788,["730"] = 793,["731"] = 794,["732"] = 795,["733"] = 796,["736"] = 800,["737"] = 788,["738"] = 803,["739"] = 804,["740"] = 805,["743"] = 809,["744"] = 810,["745"] = 810,["746"] = 810,["747"] = 810,["748"] = 811,["749"] = 812,["750"] = 816,["751"] = 817,["752"] = 819,["753"] = 820,["754"] = 821,["755"] = 822,["757"] = 825,["758"] = 826,["760"] = 803,["761"] = 832,["762"] = 833,["763"] = 837,["764"] = 832,["765"] = 840,["766"] = 841,["767"] = 842,["769"] = 844,["770"] = 845,["771"] = 846,["772"] = 846,["773"] = 846,["775"] = 846,["777"] = 849,["778"] = 850,["779"] = 850,["780"] = 850,["782"] = 850,["783"] = 851,["784"] = 852,["785"] = 855,["786"] = 840,["787"] = 858,["788"] = 859,["789"] = 861,["790"] = 861,["791"] = 861,["792"] = 861,["793"] = 861,["794"] = 865,["795"] = 866,["796"] = 867,["797"] = 869,["798"] = 858,["799"] = 877,["800"] = 884,["803"] = 887,["804"] = 888,["805"] = 889,["806"] = 890,["807"] = 891,["808"] = 892,["809"] = 893,["810"] = 894,["811"] = 895,["812"] = 896,["813"] = 897,["814"] = 898,["815"] = 877,["816"] = 901,["817"] = 902,["818"] = 903,["819"] = 904,["820"] = 905,["821"] = 906,["822"] = 907,["823"] = 908,["824"] = 909,["825"] = 910,["826"] = 911,["827"] = 912,["828"] = 901,["829"] = 915,["830"] = 919,["831"] = 919,["832"] = 919,["833"] = 920,["834"] = 921,["837"] = 924,["838"] = 928,["839"] = 929,["841"] = 919,["842"] = 919,["843"] = 915,["844"] = 934,["845"] = 938,["848"] = 942,["850"] = 943,["851"] = 944,["852"] = 945,["854"] = 947,["855"] = 947,["856"] = 947,["857"] = 947,["858"] = 947,["859"] = 947,["860"] = 947,["865"] = 934,["866"] = 958,["867"] = 962,["868"] = 963,["869"] = 964,["870"] = 966,["871"] = 966,["872"] = 966,["873"] = 967,["874"] = 968,["877"] = 971,["878"] = 972,["879"] = 973,["880"] = 974,["881"] = 975,["882"] = 976,["883"] = 981,["884"] = 982,["885"] = 983,["887"] = 985,["888"] = 966,["889"] = 966,["890"] = 990,["891"] = 990,["892"] = 990,["893"] = 990,["894"] = 991,["895"] = 992,["896"] = 993,["897"] = 994,["898"] = 995,["899"] = 996,["900"] = 958,["901"] = 999,["902"] = 1000,["903"] = 1001,["904"] = 1001,["905"] = 1001,["906"] = 1001,["907"] = 1001,["908"] = 1001,["909"] = 1001,["910"] = 1001,["911"] = 1001,["912"] = 1001,["913"] = 1001,["914"] = 1001,["915"] = 1001,["916"] = 1001,["917"] = 1001,["918"] = 1001,["919"] = 1001,["921"] = 1000,["922"] = 999,["923"] = 1005,["924"] = 1006,["925"] = 1007,["926"] = 1008,["928"] = 1010,["929"] = 1005,["930"] = 1018,["931"] = 1019,["932"] = 1020,["933"] = 1021,["934"] = 1022,["935"] = 1023,["936"] = 1024,["937"] = 1025,["938"] = 1026,["939"] = 1028,["940"] = 1018,["941"] = 1036,["942"] = 1037,["943"] = 1038,["944"] = 1036,["945"] = 1041,["946"] = 1042,["948"] = 1043,["949"] = 1043,["951"] = 1044,["952"] = 1045,["953"] = 1046,["955"] = 1048,["958"] = 1043,["961"] = 1050,["962"] = 1041,["963"] = 1053,["964"] = 1054,["965"] = 1055,["966"] = 1056,["969"] = 1060,["970"] = 1061,["971"] = 1053,["972"] = 1064,["973"] = 1065,["974"] = 1066,["975"] = 1067,["976"] = 1068,["978"] = 1070,["979"] = 1072,["980"] = 1073,["981"] = 1074,["984"] = 1077,["985"] = 1077,["986"] = 1077,["987"] = 1077,["988"] = 1078,["989"] = 1064,["990"] = 1081,["991"] = 1082,["992"] = 1083,["993"] = 1085,["994"] = 1086,["997"] = 1089,["998"] = 1090,["999"] = 1090,["1000"] = 1090,["1001"] = 1090,["1002"] = 1091,["1005"] = 1094,["1006"] = 1095,["1007"] = 1096,["1008"] = 1097,["1010"] = 1085,["1011"] = 1101,["1012"] = 1081,["1013"] = 1104,["1014"] = 1109,["1015"] = 1109,["1016"] = 1109,["1017"] = 1109,["1018"] = 1110,["1021"] = 1114,["1022"] = 1115,["1023"] = 1116,["1024"] = 1117,["1025"] = 1119,["1026"] = 1119,["1027"] = 1119,["1028"] = 1120,["1031"] = 1124,["1032"] = 1125,["1033"] = 1126,["1034"] = 1127,["1035"] = 1128,["1037"] = 1131,["1040"] = 1135,["1041"] = 1140,["1042"] = 1119,["1043"] = 1119,["1044"] = 1104,["1045"] = 1144,["1046"] = 1145,["1047"] = 1146,["1048"] = 1147,["1049"] = 1148,["1051"] = 1150,["1052"] = 1144});
local ____exports = {}
local ____bot_2Dability = require("modules.helper.bot-ability")
local BotAbility = ____bot_2Dability.BotAbility
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____property_controller = require("modules.property.property_controller")
local PropertyController = ____property_controller.PropertyController
local ____game_2Dend = require("modules.event.game-end.game-end")
local GameEnd = ____game_2Dend.GameEnd
local ____abyss_2Drules = require("modules.abyss.abyss-rules")
local getAbyssDisplayWave = ____abyss_2Drules.getAbyssDisplayWave
local getAbyssNetWorthGrowthRate = ____abyss_2Drules.getAbyssNetWorthGrowthRate
local getAbyssWaveBotCount = ____abyss_2Drules.getAbyssWaveBotCount
local getSecondHighestValue = ____abyss_2Drules.getSecondHighestValue
local isAbyssLongPreparationDisplayWave = ____abyss_2Drules.isAbyssLongPreparationDisplayWave
____exports.AbyssMode = __TS__Class()
local AbyssMode = ____exports.AbyssMode
AbyssMode.name = "AbyssMode"
function AbyssMode.prototype.____constructor(self)
    self.baseRespawnDelay = 3
    self.respawnDelayIncrement = 16
    self.botRespawnInterval = 0.2
    self.waveTimeout = 180
    self.inactiveRespawnTime = 9999
    self.disabledBuybackCost = 99999999
    self.liquidGoldCap = 99999
    self.spawnRadius = 3000
    self.spawnTreeClearRadius = 100
    self.immediateAggroDuration = 4
    self.initialBotLevel = 1
    self.initialBotGold = 3000
    self.waveNetWorthGrowthRate = 1.08
    self.maxWave = 80
    self.maxDisplayWave = 100
    self.endConditionCheckInterval = 5
    self.maxAverageHumanDeaths = 5
    self.maxGameTime = 25 * 60
    self.enableEconomyDebug = false
    self.wave = 0
    self.completedWave = 0
    self.waveTargetNetWorth = 0
    self.nextWaveRespawnTime = 0
    self.nextWaveRespawnDelay = 0
    self.activeBotPlayerIds = {}
    self.pendingRespawnTimer = false
    self.endConditionTimerStarted = false
    self.abyssEndTriggered = false
    self.stagedLotteryTimersStarted = false
    self.nativeBotThinkingDisabled = false
    self.bossPropertyModifiers = __TS__New(Map)
    self.aggroMarkLogWaveByEntity = __TS__New(Map)
end
function AbyssMode.prototype.IsEnabled(self)
    local ____opt_0 = GameRules.Option
    return (____opt_0 and ____opt_0.abyssMode) == true
end
function AbyssMode.prototype.GetCurrentWave(self)
    return getAbyssDisplayWave(nil, self.wave)
end
function AbyssMode.prototype.GetCompletedWave(self)
    return getAbyssDisplayWave(nil, self.completedWave)
end
function AbyssMode.prototype.GetNextWaveRespawnTime(self)
    return self.nextWaveRespawnTime
end
function AbyssMode.prototype.GetNextWaveRespawnDelay(self)
    return self.nextWaveRespawnDelay
end
function AbyssMode.prototype.SyncStatusForAllPlayers(self)
    if not self:IsEnabled() then
        return
    end
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        local steamId = tostring(PlayerResource:GetSteamAccountID(playerId))
        local existing = CustomNetTables:GetTableValue("abyss_status", steamId)
        local hero = PlayerResource:GetSelectedHeroEntity(playerId)
        CustomNetTables:SetTableValue(
            "abyss_status",
            steamId,
            {
                enabled = 1,
                currentWave = self:GetCurrentWave(),
                personalBestWave = existing and existing.personalBestWave or 0,
                nextWaveRespawnTime = self.nextWaveRespawnTime,
                nextWaveRespawnDelay = self.nextWaveRespawnDelay,
                heroName = existing and existing.heroName or hero and hero:GetUnitName() or ""
            }
        )
    end)
end
function AbyssMode.prototype.Start(self)
    if not self:IsEnabled() or self.abyssEndTriggered then
        return
    end
    self:DisableNativeBotThinking()
    self:ScheduleEndConditionCheck()
    if self.wave > 0 then
        self:ScheduleWaveTimeout(self.wave)
    end
end
function AbyssMode.prototype.Initialize(self, scheduleTimeout)
    if scheduleTimeout == nil then
        scheduleTimeout = GameRules:State_Get() >= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS
    end
    if not self:IsEnabled() or self.wave > 0 or self.abyssEndTriggered then
        return
    end
    self.activeBotPlayerIds = {}
    self.pendingRespawnTimer = false
    self.completedWave = 0
    _G.AbyssModeCompletedWave = 0
    self.waveTargetNetWorth = 0
    self.nextWaveRespawnTime = 0
    self.nextWaveRespawnDelay = 0
    self:DisableNativeBotThinking()
    self:StartStagedLotteryTimers()
    if not self:StartNextWave(scheduleTimeout) then
        Timers:CreateTimer(
            0.2,
            function()
                self:Initialize(scheduleTimeout)
            end
        )
    end
end
function AbyssMode.prototype.OnBotKilled(self, hero)
    if not self:IsEnabled() or self.abyssEndTriggered or not PlayerHelper:IsBotPlayer(hero) then
        return
    end
    hero:SetTimeUntilRespawn(self.inactiveRespawnTime)
    self:DisableBotBuyback(hero)
    if not self:IsActiveWaveBot(hero:GetPlayerID()) then
        return
    end
    if self.pendingRespawnTimer or not self:AreAllActiveBotsDead() then
        return
    end
    self:CompleteCurrentWave()
    if self.completedWave >= self.maxWave then
        self.pendingRespawnTimer = false
        self.nextWaveRespawnTime = 0
        self.nextWaveRespawnDelay = 0
        self:SyncStatusForAllPlayers()
        self:EndAbyssMode(("深渊已完成 " .. tostring(self.maxDisplayWave)) .. " 层")
        return
    end
    self.pendingRespawnTimer = true
    local wave = self.wave
    local respawnDelay = self:GetBotRespawnDelay(self.completedWave)
    self.nextWaveRespawnTime = GameRules:GetDOTATime(false, false) + respawnDelay
    self.nextWaveRespawnDelay = respawnDelay
    self:SyncStatusForAllPlayers()
    Timers:CreateTimer(
        respawnDelay,
        function()
            if self.abyssEndTriggered or wave ~= self.wave then
                return
            end
            self.pendingRespawnTimer = false
            self:StartNextWave()
        end
    )
end
function AbyssMode.prototype.OnBotBuyback(self, hero)
    if not self:IsEnabled() or self.abyssEndTriggered or not PlayerHelper:IsBotPlayer(hero) then
        return
    end
    self:DisableBotBuyback(hero)
    hero:SetTimeUntilRespawn(self.inactiveRespawnTime)
    if hero:IsAlive() then
        hero:ForceKill(false)
        hero:SetTimeUntilRespawn(self.inactiveRespawnTime)
    end
end
function AbyssMode.prototype.OnBotSpawned(self, hero)
    if not self:IsEnabled() or self.abyssEndTriggered or not PlayerHelper:IsBotPlayer(hero) then
        return
    end
    if self.wave == 0 then
        return
    end
    if not self:IsActiveWaveBot(hero:GetPlayerID()) then
        self:DisableInactiveBot(hero)
        return
    end
    self:EnsureCurrentWaveBoss(hero)
    self:MoveActiveBotToAbyssSpawnIfNeeded(hero)
    local botThink = _G.BotThink
    if botThink then
        botThink:ThinkPurchase(hero)
        botThink:ThinkConsumeItem(hero)
    end
end
function AbyssMode.prototype.StartNextWave(self, scheduleTimeout)
    if scheduleTimeout == nil then
        scheduleTimeout = GameRules:State_Get() >= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS
    end
    if self.abyssEndTriggered then
        return false
    end
    self:ScheduleEndConditionCheck()
    self.pendingRespawnTimer = false
    self.nextWaveRespawnTime = 0
    self.nextWaveRespawnDelay = 0
    local bots = self:GetDireBotPlayerIds()
    if #bots == 0 then
        return false
    end
    local previousActiveBotPlayerIds = {unpack(self.activeBotPlayerIds)}
    self.wave = self.wave + 1
    local displayWave = getAbyssDisplayWave(nil, self.wave)
    local previousDisplayWave = getAbyssDisplayWave(nil, self.wave - 1)
    if self.wave > self.maxWave then
        self:EndAbyssMode(("深渊波次超过 " .. tostring(self.maxDisplayWave)) .. " 层")
        return true
    end
    self:HandleCompletedWaveRewards(previousDisplayWave)
    local activeCount = math.min(
        getAbyssWaveBotCount(
            nil,
            self.wave,
            PlayerHelper:GetHumamPlayerCount(),
            #bots
        ),
        #bots
    )
    local isBossWave = displayWave % 5 == 0
    self.activeBotPlayerIds = __TS__ArraySlice(bots, 0, activeCount)
    local waveProcessOrder = self:ShufflePlayerIds(self.activeBotPlayerIds)
    local ____isBossWave_8
    if isBossWave then
        ____isBossWave_8 = self:GetBossWavePlayerId(waveProcessOrder, previousActiveBotPlayerIds)
    else
        ____isBossWave_8 = nil
    end
    local bossPlayerId = ____isBossWave_8
    self.currentBossPlayerId = bossPlayerId
    local snapshotBase = self.wave == 1 and ({level = self.initialBotLevel, gold = self.initialBotGold}) or self:GetDireBotSecondHighestSnapshot(bots)
    local economyDebug = self:BuildWaveEconomyDebug(snapshotBase.gold)
    local snapshot = __TS__ObjectAssign({}, snapshotBase, {gold = economyDebug.targetNetWorth})
    _G.AbyssModeEnabled = true
    _G.AbyssModeWave = displayWave
    _G.AbyssModeTargetNetWorth = snapshot.gold
    self:SyncStatusForAllPlayers()
    local wave = self.wave
    local activeBotOrder = 0
    __TS__ArrayForEach(
        bots,
        function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            if not self:IsActiveWaveBot(playerId) then
                self:DisableInactiveBot(hero)
                return
            end
        end
    )
    __TS__ArrayForEach(
        waveProcessOrder,
        function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            local delay = activeBotOrder * self.botRespawnInterval
            activeBotOrder = activeBotOrder + 1
            Timers:CreateTimer(
                delay,
                function()
                    if self.abyssEndTriggered or wave ~= self.wave then
                        return
                    end
                    local action = __TS__ArrayIncludes(previousActiveBotPlayerIds, playerId) and hero:IsAlive() and "continue" or "spawn"
                    if __TS__ArrayIncludes(previousActiveBotPlayerIds, playerId) and hero:IsAlive() then
                        self:GrantContinuingBotGold(hero, snapshot, playerId == bossPlayerId)
                        if playerId == bossPlayerId then
                            self:EnsureCurrentWaveBoss(hero)
                        end
                        self:SetEconomyDebugSample(
                            economyDebug,
                            hero,
                            playerId == bossPlayerId,
                            hero:GetLevel(),
                            action
                        )
                        return
                    end
                    self:PrepareWaveBot(hero, snapshot, playerId == bossPlayerId)
                    self:SetEconomyDebugSample(
                        economyDebug,
                        hero,
                        playerId == bossPlayerId,
                        self:GetTargetWaveBotLevel(snapshot, playerId == bossPlayerId),
                        action
                    )
                end
            )
        end
    )
    Timers:CreateTimer(
        math.max(0, activeBotOrder - 1) * self.botRespawnInterval + 0.01,
        function()
            if self.abyssEndTriggered or wave ~= self.wave then
                return
            end
            self:ReconcileActiveBotWealth(economyDebug, bossPlayerId)
            if self.enableEconomyDebug then
                self:ClearEconomyDebugSample(economyDebug)
                self:FillFallbackEconomyDebugSample(economyDebug, bossPlayerId)
                self:SetEconomyDebugActiveSummary(economyDebug, bossPlayerId)
                self:PrintWaveEconomyDebug(economyDebug)
            end
        end
    )
    GameRules:SendCustomMessage(
        ((((("<font color='#66CCFF'>深渊第 " .. tostring(displayWave)) .. " 层：") .. tostring(activeCount)) .. " 个 Bot 将在中路附近复活") .. (isBossWave and "，最后一个为 Boss" or "")) .. "。</font>",
        0,
        0
    )
    if scheduleTimeout then
        self:ScheduleWaveTimeout(self.wave)
    end
    return true
end
function AbyssMode.prototype.HandleCompletedWaveRewards(self, completedDisplayWave)
    if completedDisplayWave == 0 then
        self:OpenAbyssLotteryForAll("abilityPassive", "深渊开局：请选择一个被动技能。")
        return
    end
end
function AbyssMode.prototype.CompleteCurrentWave(self)
    if self.wave <= self.completedWave then
        return
    end
    self.completedWave = self.wave
    local completedDisplayWave = self:GetCompletedWave()
    _G.AbyssModeCompletedWave = completedDisplayWave
    self:SyncStatusForAllPlayers()
    GameEnd:PostAbyssProgressGameEnd(completedDisplayWave)
end
function AbyssMode.prototype.GetBotRespawnDelay(self, completedWave)
    local completedDisplayWave = getAbyssDisplayWave(nil, completedWave)
    if isAbyssLongPreparationDisplayWave(nil, completedDisplayWave) then
        return self.baseRespawnDelay + self.respawnDelayIncrement
    end
    return self.baseRespawnDelay
end
function AbyssMode.prototype.StartStagedLotteryTimers(self)
    if self.stagedLotteryTimersStarted then
        return
    end
    self.stagedLotteryTimersStarted = true
    Timers:CreateTimer(
        3 * 60,
        function()
            if not self:IsEnabled() or self.abyssEndTriggered then
                return
            end
            self:OpenAbyssLotteryForAll("abilityActive", "深渊 3 分钟：请选择一个主动技能。")
        end
    )
    Timers:CreateTimer(
        6 * 60,
        function()
            if not self:IsEnabled() or self.abyssEndTriggered then
                return
            end
            self:OpenAbyssLotteryForAll("abilityPassive2", "深渊 6 分钟：请选择最后一个被动技能。")
        end
    )
end
function AbyssMode.prototype.OpenAbyssLotteryForAll(self, abilityType, message)
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        GameRules.Lottery:openLotteryForPlayer(playerId, abilityType)
    end)
    GameRules:SendCustomMessage(("<font color='#FFD700'>" .. message) .. "</font>", 0, 0)
end
function AbyssMode.prototype.GetBossLevelMultiplier(self)
    return self.wave == 5 and 1 or 2
end
function AbyssMode.prototype.GetBossGoldMultiplier(self)
    return self.wave == 5 and 1.5 or 2
end
function AbyssMode.prototype.GetTargetWaveBotLevel(self, snapshot, isBoss)
    return math.ceil(snapshot.level * (isBoss and self:GetBossLevelMultiplier() or 1))
end
function AbyssMode.prototype.GetTargetWaveBotGold(self, snapshot, isBoss)
    return math.ceil(snapshot.gold * (isBoss and self:GetBossGoldMultiplier() or 1))
end
function AbyssMode.prototype.GetTargetWaveNetWorth(self, targetNetWorth, isBoss)
    return math.ceil(targetNetWorth * (isBoss and self:GetBossGoldMultiplier() or 1))
end
function AbyssMode.prototype.PrepareWaveBot(self, hero, snapshot, isBoss)
    local targetLevel = self:GetTargetWaveBotLevel(snapshot, isBoss)
    local targetGold = self:GetTargetWaveBotGold(snapshot, isBoss)
    self:ClearBossState(hero)
    self:DisableBotBuyback(hero)
    hero.isAbyssBot = true
    hero.isBoss = isBoss
    hero:SetTimeUntilRespawn(1)
    if not hero:IsAlive() then
        hero:RespawnHero(false, false)
    end
    self:SetHeroLevel(hero, targetLevel)
    self:SetHeroGold(hero, targetGold)
    self:RemoveAbyssBotInnateAbilities(hero)
    self:RemoveBotTeleportScrolls(hero)
    self:MoveToAbyssSpawn(hero)
    Timers:CreateTimer(
        0.3,
        function() return self:MoveActiveBotToAbyssSpawnIfNeeded(hero) end
    )
    hero:SetBotDifficulty(4)
    GameRules.AI:EnableAI(hero)
    if isBoss then
        self:ApplyBossState(hero)
    end
end
function AbyssMode.prototype.RemoveAbyssBotInnateAbilities(self, hero)
    BotAbility:ReplaceBotPassiveAbility(hero, "centaur_return", "axe_counter_helix")
    if hero:GetUnitName() == "npc_dota_hero_shadow_shaman" then
        local innateAbilityName1 = "shadow_shaman_fowl_play"
        if hero:HasAbility(innateAbilityName1) then
            hero:RemoveAbility(innateAbilityName1)
            print((("[AbyssMode] Removed innate ability " .. innateAbilityName1) .. " from ") .. hero:GetUnitName())
        end
    end
    if hero:GetUnitName() ~= "npc_dota_hero_skeleton_king" then
        return
    end
    local innateAbilityName = "skeleton_king_vampiric_spirit"
    if hero:HasAbility(innateAbilityName) then
        hero:RemoveAbility(innateAbilityName)
        print((("[AbyssMode] Removed innate ability " .. innateAbilityName) .. " from ") .. hero:GetUnitName())
    end
end
function AbyssMode.prototype.MarkImmediateAggroWindow(self, hero)
    hero.abyssImmediateAggroEndTime = GameRules:GetDOTATime(false, false) + self.immediateAggroDuration
    local entityIndex = hero:GetEntityIndex()
    if self.aggroMarkLogWaveByEntity:get(entityIndex) == self.wave then
        return
    end
    self.aggroMarkLogWaveByEntity:set(entityIndex, self.wave)
end
function AbyssMode.prototype.FormatVector(self, position)
    return (((tostring(math.floor(position.x)) .. ",") .. tostring(math.floor(position.y))) .. ",") .. tostring(math.floor(position.z))
end
function AbyssMode.prototype.RemoveBotTeleportScrolls(self, hero)
    do
        local i = 0
        while i < 6 do
            local item = hero:FindItemInInventory("item_tpscroll")
            if not item or item:IsNull() then
                break
            end
            UTIL_RemoveImmediate(item)
            i = i + 1
        end
    end
    do
        local slot = 0
        while slot <= 17 do
            local item = hero:GetItemInSlot(slot)
            if item and not item:IsNull() and item:GetAbilityName() == "item_tpscroll" then
                UTIL_RemoveImmediate(item)
            end
            slot = slot + 1
        end
    end
end
function AbyssMode.prototype.GetBossWavePlayerId(self, waveProcessOrder, previousActiveBotPlayerIds)
    local spawningBotPlayerIds = __TS__ArrayFilter(
        waveProcessOrder,
        function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            return hero ~= nil and not (__TS__ArrayIncludes(previousActiveBotPlayerIds, playerId) and hero:IsAlive())
        end
    )
    return spawningBotPlayerIds[#spawningBotPlayerIds] or waveProcessOrder[#waveProcessOrder]
end
function AbyssMode.prototype.ShufflePlayerIds(self, playerIds)
    local result = {unpack(playerIds)}
    do
        local i = #result - 1
        while i > 0 do
            local j = RandomInt(0, i)
            local ____temp_9 = {result[j + 1], result[i + 1]}
            result[i + 1] = ____temp_9[1]
            result[j + 1] = ____temp_9[2]
            i = i - 1
        end
    end
    return result
end
function AbyssMode.prototype.EnsureCurrentWaveBoss(self, hero)
    if self.currentBossPlayerId == nil or hero:GetPlayerID() ~= self.currentBossPlayerId then
        return
    end
    if hero.isBoss and hero:HasAbility("boss_death_power") then
        return
    end
    hero.isBoss = true
    self:ApplyBossState(hero)
    print((((("[AbyssMode] Ensured boss state on spawn: wave=" .. tostring(self.wave)) .. ", playerId=") .. tostring(hero:GetPlayerID())) .. ", hero=") .. hero:GetUnitName())
end
function AbyssMode.prototype.ApplyBossState(self, hero)
    self:ApplyBossProperties(hero)
    if not hero:HasAbility("boss_death_power") then
        local ability = hero:AddAbility("boss_death_power")
        if ability ~= nil then
            ability:SetLevel(0)
        end
    end
    BotAbility:AddExtraBossAbilities(hero, 2)
end
function AbyssMode.prototype.DisableInactiveBot(self, hero)
    self:ClearBossState(hero)
    self:DisableBotBuyback(hero)
    hero.isAbyssBot = false
    hero.isBoss = false
    hero:SetTimeUntilRespawn(self.inactiveRespawnTime)
    if hero:IsAlive() then
        hero:ForceKill(false)
        hero:SetTimeUntilRespawn(self.inactiveRespawnTime)
    end
end
function AbyssMode.prototype.MoveToAbyssSpawn(self, hero)
    local position = Vector(0, 0, 0):__add(RandomVector(RandomFloat(0, self.spawnRadius)))
    self:ClearTreesAroundAbyssSpawn(position)
    hero:SetRespawnPosition(position)
    FindClearSpaceForUnit(hero, position, true)
    self:ClearTreesAroundAbyssSpawn(hero:GetAbsOrigin())
end
function AbyssMode.prototype.ClearTreesAroundAbyssSpawn(self, position)
    GridNav:DestroyTreesAroundPoint(position, self.spawnTreeClearRadius, true)
end
function AbyssMode.prototype.MoveActiveBotToAbyssSpawnIfNeeded(self, hero)
    if not self:IsEnabled() or not PlayerHelper:IsBotPlayer(hero) or not self:IsActiveWaveBot(hero:GetPlayerID()) or not hero:IsAlive() then
        return
    end
    if not self:IsNearDireFountain(hero) then
        return
    end
    self:MoveToAbyssSpawn(hero)
end
function AbyssMode.prototype.IsNearDireFountain(self, hero)
    local direFountain = Vector(5820, 6580, 384)
    return hero:GetAbsOrigin():__sub(direFountain):Length2D() <= 1800
end
function AbyssMode.prototype.ScheduleWaveTimeout(self, wave)
    Timers:CreateTimer(
        self.waveTimeout,
        function()
            if not self:IsEnabled() or self.abyssEndTriggered or wave ~= self.wave or self:AreAllActiveBotsDead() then
                return
            end
            GameRules:SendCustomMessage(
                ("<font color='#66CCFF'>深渊第 " .. tostring(self:GetCurrentWave())) .. " 层已持续 3 分钟，强制刷新下一层。</font>",
                0,
                0
            )
            self:StartNextWave()
        end
    )
end
function AbyssMode.prototype.ScheduleEndConditionCheck(self)
    if self.endConditionTimerStarted or GameRules:State_Get() < DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        return
    end
    self.endConditionTimerStarted = true
    Timers:CreateTimer(
        self.endConditionCheckInterval,
        function()
            if not self:IsEnabled() or self.abyssEndTriggered then
                return nil
            end
            if GameRules.Option.abyssStrictLimits then
                local averageDeaths = self:GetAverageHumanPlayerDeaths()
                if averageDeaths > self.maxAverageHumanDeaths then
                    self:EndAbyssMode(((("玩家人均死亡 " .. __TS__NumberToFixed(averageDeaths, 1)) .. " 次，超过 ") .. tostring(self.maxAverageHumanDeaths)) .. " 次")
                    return nil
                end
                local gameTime = GameRules:GetDOTATime(false, false)
                if gameTime >= self.maxGameTime then
                    self:EndAbyssMode(("游戏时间达到 " .. tostring(self.maxGameTime / 60)) .. " 分钟")
                    return nil
                end
            end
            return self.endConditionCheckInterval
        end
    )
end
function AbyssMode.prototype.DisableNativeBotThinking(self)
    if self.nativeBotThinkingDisabled then
        return
    end
    GameRules:GetGameModeEntity():SetBotThinkingEnabled(false)
    self.nativeBotThinkingDisabled = true
    print("[AbyssMode] Disabled native bot thinking for abyss mode")
end
function AbyssMode.prototype.GetAverageHumanPlayerDeaths(self)
    local humanPlayerCount = 0
    local totalDeaths = 0
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) or PlayerResource:GetTeam(playerId) ~= DOTA_TEAM_GOODGUYS then
            return
        end
        humanPlayerCount = humanPlayerCount + 1
        totalDeaths = totalDeaths + PlayerResource:GetDeaths(playerId)
    end)
    return humanPlayerCount > 0 and totalDeaths / humanPlayerCount or 0
end
function AbyssMode.prototype.EndAbyssMode(self, reason)
    if self.abyssEndTriggered then
        return
    end
    self.abyssEndTriggered = true
    GameRules:SendCustomMessage(
        ((("<font color='#66CCFF'>深渊模式结束：已通过第 " .. tostring(self:GetCompletedWave())) .. " 层，") .. reason) .. "。按胜利结算。</font>",
        0,
        0
    )
    print((((((((("[AbyssMode] End abyss mode: wave=" .. tostring(self.wave)) .. ", displayWave=") .. tostring(self:GetCurrentWave())) .. ", completedWave=") .. tostring(self.completedWave)) .. ", completedDisplayWave=") .. tostring(self:GetCompletedWave())) .. ", reason=") .. reason)
    GameEnd:OnGameEnd(DOTA_TEAM_GOODGUYS)
end
function AbyssMode.prototype.DisableBotBuyback(self, hero)
    local playerId = hero:GetPlayerID()
    if playerId < 0 then
        return
    end
    hero:SetBuybackCooldownTime(self.inactiveRespawnTime)
    PlayerResource:SetCustomBuybackCost(playerId, self.disabledBuybackCost)
end
function AbyssMode.prototype.IsActiveWaveBot(self, playerId)
    return __TS__ArrayIncludes(self.activeBotPlayerIds, playerId)
end
function AbyssMode.prototype.AreAllActiveBotsDead(self)
    return __TS__ArrayEvery(
        self.activeBotPlayerIds,
        function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            return not hero or not hero:IsAlive()
        end
    )
end
function AbyssMode.prototype.GetDireBotPlayerIds(self)
    local result = {}
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if PlayerHelper:IsBotPlayerByPlayerId(playerId) and PlayerResource:GetTeam(playerId) == DOTA_TEAM_BADGUYS then
            result[#result + 1] = playerId
        end
    end)
    return result
end
function AbyssMode.prototype.GetDireBotSecondHighestSnapshot(self, botPlayerIds)
    local levels = {}
    local netWorths = {}
    __TS__ArrayForEach(
        botPlayerIds,
        function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            levels[#levels + 1] = hero:GetLevel()
            netWorths[#netWorths + 1] = self:GetBotTotalWealth(hero)
        end
    )
    return {
        level = math.max(
            self.initialBotLevel,
            getSecondHighestValue(nil, levels, self.initialBotLevel)
        ),
        gold = math.max(
            self.initialBotGold,
            getSecondHighestValue(nil, netWorths, self.initialBotGold)
        )
    }
end
function AbyssMode.prototype.SetHeroLevel(self, hero, targetLevel)
    local ____opt_12 = GameRules.Option
    local maxLevel = ____opt_12 and ____opt_12.maxLevel or 50
    local level = math.max(
        self.initialBotLevel,
        math.min(
            maxLevel,
            math.floor(targetLevel)
        )
    )
    while hero:GetLevel() < level do
        local previousLevel = hero:GetLevel()
        hero:HeroLevelUp(false)
        if hero:GetLevel() <= previousLevel then
            print((((((("[AbyssMode] Stop leveling " .. hero:GetUnitName()) .. ": currentLevel=") .. tostring(hero:GetLevel())) .. ", targetLevel=") .. tostring(level)) .. ", requestedLevel=") .. tostring(targetLevel))
            break
        end
    end
end
function AbyssMode.prototype.SetHeroGold(self, hero, targetGold)
    local playerId = hero:GetPlayerID()
    if playerId < 0 then
        return
    end
    self:SetHeroTargetWealth(hero, targetGold)
end
function AbyssMode.prototype.GrantContinuingBotGold(self, hero, snapshot, isBoss)
    local targetWealth = self:GetTargetWaveBotGold(snapshot, isBoss)
    local currentGold = self:GetBotTotalWealth(hero)
    local playerId = hero:GetPlayerID()
    if playerId < 0 or targetWealth <= currentGold then
        return
    end
    self:SetHeroTargetWealth(hero, targetWealth)
end
function AbyssMode.prototype.SetHeroTargetWealth(self, hero, targetWealth)
    local playerId = hero:GetPlayerID()
    if playerId < 0 then
        return
    end
    local nonLiquidWealth = self:GetHeroItemWorth(hero) + self:GetHeroConsumedTomeWorth(hero)
    local targetLiquidAndNewTomes = math.max(
        0,
        math.floor(targetWealth - nonLiquidWealth)
    )
    local tomePairCost = self:GetAbyssTomePairCost()
    local tomePairCount = targetLiquidAndNewTomes > self.liquidGoldCap and math.ceil((targetLiquidAndNewTomes - self.liquidGoldCap) / tomePairCost) or 0
    local targetLiquidGold = math.max(0, targetLiquidAndNewTomes - tomePairCount * tomePairCost)
    local consumedPairCount = self:ConsumeOverflowTomePairs(hero, tomePairCount)
    PlayerResource:SetGold(playerId, 0, true)
    PlayerResource:SetGold(playerId, 0, false)
    if targetLiquidGold > 0 then
        hero:ModifyGold(targetLiquidGold, true, DOTA_ModifyGold_Unspecified)
    end
    if consumedPairCount < tomePairCount or targetLiquidGold > self.liquidGoldCap then
        print((((((((((("[AbyssMode] Target wealth split warning: hero=" .. hero:GetUnitName()) .. ", targetWealth=") .. tostring(targetWealth)) .. ", nonLiquidWealth=") .. tostring(nonLiquidWealth)) .. ", requestedPairs=") .. tostring(tomePairCount)) .. ", consumedPairs=") .. tostring(consumedPairCount)) .. ", targetLiquidGold=") .. tostring(targetLiquidGold))
    end
end
function AbyssMode.prototype.GetAbyssTomePairCost(self)
    local pairCost = GetItemCost("item_tome_of_strength") * 4 + GetItemCost("item_tome_of_agility") + GetItemCost("item_tome_of_intelligence")
    return pairCost > 0 and pairCost or 119994
end
function AbyssMode.prototype.ConsumeOverflowTomePairs(self, hero, tomePairCount)
    if tomePairCount <= 0 or not _G.AbyssModeConsumeOverflowTomes then
        return 0
    end
    local consumeOverflowTomes = _G.AbyssModeConsumeOverflowTomes
    if not self.enableEconomyDebug then
        local ____consumeOverflowTomes_result_14 = consumeOverflowTomes(nil, hero, tomePairCount)
        if ____consumeOverflowTomes_result_14 == nil then
            ____consumeOverflowTomes_result_14 = 0
        end
        return ____consumeOverflowTomes_result_14
    end
    local beforeTomeWorth = self:GetHeroConsumedTomeWorth(hero)
    local ____consumeOverflowTomes_result_15 = consumeOverflowTomes(nil, hero, tomePairCount)
    if ____consumeOverflowTomes_result_15 == nil then
        ____consumeOverflowTomes_result_15 = 0
    end
    local consumedPairCount = ____consumeOverflowTomes_result_15
    local afterTomeWorth = self:GetHeroConsumedTomeWorth(hero)
    print((((((((("[AbyssMode] Overflow tome conversion: hero=" .. hero:GetUnitName()) .. ", requestedPairs=") .. tostring(tomePairCount)) .. ", consumedPairs=") .. tostring(consumedPairCount)) .. ", tomeWorthBefore=") .. tostring(beforeTomeWorth)) .. ", tomeWorthAfter=") .. tostring(afterTomeWorth))
    return consumedPairCount
end
function AbyssMode.prototype.BuildWaveEconomyDebug(self, candidateNetWorth)
    local previousTargetNetWorth = self.waveTargetNetWorth > 0 and self.waveTargetNetWorth or self.initialBotGold
    local growthRate = getAbyssNetWorthGrowthRate(
        nil,
        self.waveNetWorthGrowthRate,
        getAbyssDisplayWave(nil, self.wave)
    )
    local grownTargetNetWorth = math.ceil(previousTargetNetWorth * growthRate)
    local targetNetWorth = math.max(candidateNetWorth, grownTargetNetWorth, self.initialBotGold)
    self.waveTargetNetWorth = targetNetWorth
    return {previousTargetNetWorth = previousTargetNetWorth, secondHighestBotNetWorth = candidateNetWorth, grownTargetNetWorth = grownTargetNetWorth, targetNetWorth = targetNetWorth}
end
function AbyssMode.prototype.SetEconomyDebugSample(self, ____debug, hero, isBoss, targetLevel, action)
    if ____debug.samplePlayerId ~= nil then
        return
    end
    local playerId = hero:GetPlayerID()
    ____debug.samplePlayerId = playerId
    ____debug.sampleHeroName = hero:GetUnitName()
    ____debug.sampleAction = action
    ____debug.sampleIsBoss = isBoss
    ____debug.sampleTargetLevel = targetLevel
    ____debug.sampleActualLevel = hero:GetLevel()
    ____debug.sampleItemWorth = self:GetHeroItemWorth(hero)
    ____debug.sampleTomeWorth = self:GetHeroConsumedTomeWorth(hero)
    ____debug.sampleTotalWealth = self:GetBotTotalWealth(hero)
    ____debug.sampleReliableGold = playerId >= 0 and PlayerResource:GetReliableGold(playerId) or 0
    ____debug.sampleUnreliableGold = playerId >= 0 and PlayerResource:GetUnreliableGold(playerId) or 0
end
function AbyssMode.prototype.ClearEconomyDebugSample(self, ____debug)
    ____debug.samplePlayerId = nil
    ____debug.sampleHeroName = nil
    ____debug.sampleAction = nil
    ____debug.sampleIsBoss = nil
    ____debug.sampleTargetLevel = nil
    ____debug.sampleActualLevel = nil
    ____debug.sampleItemWorth = nil
    ____debug.sampleTomeWorth = nil
    ____debug.sampleTotalWealth = nil
    ____debug.sampleReliableGold = nil
    ____debug.sampleUnreliableGold = nil
end
function AbyssMode.prototype.ReconcileActiveBotWealth(self, ____debug, bossPlayerId)
    __TS__ArrayForEach(
        self.activeBotPlayerIds,
        function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            local targetWealth = self:GetTargetWaveNetWorth(____debug.targetNetWorth, playerId == bossPlayerId)
            if self:GetBotTotalWealth(hero) < targetWealth then
                self:SetHeroTargetWealth(hero, targetWealth)
            end
        end
    )
end
function AbyssMode.prototype.FillFallbackEconomyDebugSample(self, ____debug, bossPlayerId)
    if ____debug.samplePlayerId ~= nil then
        return
    end
    for ____, playerId in ipairs(self.activeBotPlayerIds) do
        do
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                goto __continue158
            end
            self:SetEconomyDebugSample(
                ____debug,
                hero,
                playerId == bossPlayerId,
                hero:GetLevel(),
                hero:IsAlive() and "continue" or "spawn"
            )
            return
        end
        ::__continue158::
    end
end
function AbyssMode.prototype.SetEconomyDebugActiveSummary(self, ____debug, bossPlayerId)
    local netWorths = {}
    local parts = {}
    local underTargetCount = 0
    __TS__ArrayForEach(
        self.activeBotPlayerIds,
        function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            local itemWorth = self:GetHeroItemWorth(hero)
            local tomeWorth = self:GetHeroConsumedTomeWorth(hero)
            local reliableGold = PlayerResource:GetReliableGold(playerId)
            local unreliableGold = PlayerResource:GetUnreliableGold(playerId)
            local totalWealth = itemWorth + tomeWorth + reliableGold + unreliableGold
            local targetNetWorth = self:GetTargetWaveNetWorth(____debug.targetNetWorth, playerId == bossPlayerId)
            netWorths[#netWorths + 1] = totalWealth
            if totalWealth < targetNetWorth then
                underTargetCount = underTargetCount + 1
            end
            parts[#parts + 1] = ((((((((((tostring(playerId) .. ":") .. tostring(totalWealth)) .. "(") .. tostring(itemWorth)) .. "+") .. tostring(tomeWorth)) .. "+") .. tostring(reliableGold)) .. "+") .. tostring(unreliableGold)) .. ")"
        end
    )
    local sortedNetWorths = __TS__ArraySort(
        {unpack(netWorths)},
        function(____, a, b) return a - b end
    )
    ____debug.activeBotCount = #netWorths
    ____debug.activeBotWealths = table.concat(parts, "|")
    ____debug.activeMinNetWorth = sortedNetWorths[1] or 0
    ____debug.activeSecondHighestNetWorth = getSecondHighestValue(nil, netWorths, 0)
    ____debug.activeMaxNetWorth = sortedNetWorths[#sortedNetWorths] or 0
    ____debug.activeUnderTargetCount = underTargetCount
end
function AbyssMode.prototype.PrintWaveEconomyDebug(self, ____debug)
    local ____print_31 = print
    local ____self_wave_17 = self.wave
    local ____debug_previousTargetNetWorth_18 = ____debug.previousTargetNetWorth
    local ____debug_secondHighestBotNetWorth_19 = ____debug.secondHighestBotNetWorth
    local ____debug_grownTargetNetWorth_20 = ____debug.grownTargetNetWorth
    local ____debug_targetNetWorth_21 = ____debug.targetNetWorth
    local ____temp_22 = ____debug.activeBotCount or 0
    local ____temp_23 = ____debug.activeMinNetWorth or 0
    local ____temp_24 = ____debug.activeSecondHighestNetWorth or 0
    local ____temp_25 = ____debug.activeMaxNetWorth or 0
    local ____temp_26 = ____debug.activeUnderTargetCount or 0
    local ____temp_27 = ____debug.activeBotWealths or "none"
    local ____temp_28 = ____debug.sampleAction or "none"
    local ____temp_29 = ____debug.samplePlayerId or -1
    local ____temp_30 = ____debug.sampleHeroName or "none"
    local ____debug_sampleIsBoss_16 = ____debug.sampleIsBoss
    if ____debug_sampleIsBoss_16 == nil then
        ____debug_sampleIsBoss_16 = false
    end
    ____print_31((((((((((((((((((((((((((((((((((((((((((("[AbyssMode] Wave " .. tostring(____self_wave_17)) .. " economy: previousTargetNetWorth=") .. tostring(____debug_previousTargetNetWorth_18)) .. ", secondHighestBotNetWorth=") .. tostring(____debug_secondHighestBotNetWorth_19)) .. ", grownTargetNetWorth=") .. tostring(____debug_grownTargetNetWorth_20)) .. ", targetNetWorth=") .. tostring(____debug_targetNetWorth_21)) .. ", activeBotCount=") .. tostring(____temp_22)) .. ", activeMinNetWorth=") .. tostring(____temp_23)) .. ", activeSecondHighestNetWorth=") .. tostring(____temp_24)) .. ", activeMaxNetWorth=") .. tostring(____temp_25)) .. ", activeUnderTargetCount=") .. tostring(____temp_26)) .. ", activeBotWealths=") .. ____temp_27) .. ", sampleAction=") .. ____temp_28) .. ", samplePlayerId=") .. tostring(____temp_29)) .. ", sampleHero=") .. ____temp_30) .. ", sampleBoss=") .. tostring(____debug_sampleIsBoss_16)) .. ", sampleTargetLevel=") .. tostring(____debug.sampleTargetLevel or 0)) .. ", sampleActualLevel=") .. tostring(____debug.sampleActualLevel or 0)) .. ", sampleItemWorth=") .. tostring(____debug.sampleItemWorth or 0)) .. ", sampleTomeWorth=") .. tostring(____debug.sampleTomeWorth or 0)) .. ", sampleTotalWealth=") .. tostring(____debug.sampleTotalWealth or 0)) .. ", sampleReliableGold=") .. tostring(____debug.sampleReliableGold or 0)) .. ", sampleUnreliableGold=") .. tostring(____debug.sampleUnreliableGold or 0))
end
function AbyssMode.prototype.GetBotTotalWealth(self, hero)
    local playerId = hero:GetPlayerID()
    if playerId < 0 then
        return self:GetHeroItemWorth(hero) + self:GetHeroConsumedTomeWorth(hero)
    end
    return self:GetHeroItemWorth(hero) + self:GetHeroConsumedTomeWorth(hero) + PlayerResource:GetReliableGold(playerId) + PlayerResource:GetUnreliableGold(playerId)
end
function AbyssMode.prototype.GetHeroConsumedTomeWorth(self, hero)
    local strengthTomeCost = GetItemCost("item_tome_of_strength")
    local agilityTomeCost = GetItemCost("item_tome_of_agility")
    local intellectTomeCost = GetItemCost("item_tome_of_intelligence")
    local luoshuTomeCost = GetItemCost("item_tome_of_luoshu")
    local strengthStack = self:GetModifierStackCount(hero, "modifier_str_tome")
    local agilityStack = self:GetModifierStackCount(hero, "modifier_agi_tome")
    local intellectStack = self:GetModifierStackCount(hero, "modifier_int_tome")
    local luoshuCount = hero:HasModifier("modifier_luoshu_tome") and 1 or 0
    return luoshuCount * luoshuTomeCost + strengthStack * strengthTomeCost + agilityStack * agilityTomeCost + intellectStack * intellectTomeCost
end
function AbyssMode.prototype.GetModifierStackCount(self, hero, modifierName)
    local modifier = hero:FindModifierByName(modifierName)
    return modifier and modifier:GetStackCount() or 0
end
function AbyssMode.prototype.GetHeroItemWorth(self, hero)
    local itemWorth = 0
    do
        local slot = 0
        while slot <= 17 do
            do
                local item = hero:GetItemInSlot(slot)
                if not item or item:IsNull() then
                    goto __continue172
                end
                itemWorth = itemWorth + item:GetCost()
            end
            ::__continue172::
            slot = slot + 1
        end
    end
    return itemWorth
end
function AbyssMode.prototype.ApplyBossProperties(self, hero)
    local player = self:FindHighestPropertyPlayer()
    if not player then
        hero:SetModelScale(2)
        return
    end
    hero:SetModelScale(2)
    self:CopyPlayerPropertiesToBot(hero, player.steamId, 100)
end
function AbyssMode.prototype.ClearBossState(self, hero)
    hero.isBoss = false
    hero:SetModelScale(1)
    if hero:HasAbility("boss_death_power") then
        hero:RemoveAbility("boss_death_power")
    end
    BotAbility:ClearExtraBossAbilities(hero)
    local heroIndex = hero:GetEntityIndex()
    local propertyNames = self.bossPropertyModifiers:get(heroIndex)
    if not propertyNames then
        return
    end
    __TS__ArrayForEach(
        propertyNames,
        function(____, propertyName) return hero:RemoveModifierByName(propertyName) end
    )
    self.bossPropertyModifiers:delete(heroIndex)
end
function AbyssMode.prototype.FindHighestPropertyPlayer(self)
    local highestLevel = 0
    local result
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        local steamId = PlayerResource:GetSteamAccountID(playerId)
        local playerData = CustomNetTables:GetTableValue(
            "player_table",
            tostring(steamId)
        )
        if not playerData or playerData.totalLevel == nil or playerData.totalLevel <= 0 then
            return
        end
        local totalLevel = playerData.totalLevel
        if totalLevel > highestLevel then
            highestLevel = totalLevel
            result = {steamId = steamId, totalLevel = totalLevel}
        end
    end)
    return result
end
function AbyssMode.prototype.CopyPlayerPropertiesToBot(self, bot, playerSteamId, multiplier)
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
    local flyingProperties = {"property_flying"}
    __TS__ArrayForEach(
        __TS__ObjectValues(properties),
        function(____, property)
            if property.level <= 0 then
                return
            end
            local discountedLevel = math.floor(property.level * discountRate)
            if __TS__ArrayIncludes(booleanProperties, property.name) then
                discountedLevel = property.level >= 8 and 1 or 0
            elseif __TS__ArrayIncludes(flyingProperties, property.name) then
                discountedLevel = property.level >= 8 and 1 or 0
            end
            if discountedLevel <= 0 then
                return
            end
            PropertyController:LevelupHeroProperty(bot, {steamId = property.steamId, name = property.name, level = discountedLevel})
            self:RecordBossPropertyModifier(bot, property.name)
        end
    )
end
function AbyssMode.prototype.RecordBossPropertyModifier(self, hero, propertyName)
    local heroIndex = hero:GetEntityIndex()
    local existing = self.bossPropertyModifiers:get(heroIndex) or ({})
    if not __TS__ArrayIncludes(existing, propertyName) then
        existing[#existing + 1] = propertyName
    end
    self.bossPropertyModifiers:set(heroIndex, existing)
end
return ____exports
