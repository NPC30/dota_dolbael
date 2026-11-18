local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Number = ____lualib.__TS__Number
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/lottery.lua"
__TS__SourceMapTraceBack("modules/lottery/lottery.lua", {["17"] = 6,["18"] = 6,["19"] = 6,["20"] = 7,["21"] = 7,["22"] = 8,["23"] = 8,["24"] = 9,["25"] = 9,["26"] = 10,["27"] = 10,["28"] = 11,["29"] = 11,["30"] = 12,["31"] = 12,["32"] = 13,["33"] = 13,["34"] = 14,["35"] = 14,["36"] = 15,["37"] = 15,["38"] = 16,["39"] = 16,["40"] = 17,["41"] = 17,["42"] = 17,["43"] = 18,["44"] = 18,["45"] = 21,["46"] = 22,["47"] = 21,["49"] = 23,["50"] = 24,["51"] = 25,["52"] = 26,["53"] = 27,["54"] = 28,["55"] = 31,["56"] = 37,["57"] = 37,["58"] = 37,["59"] = 37,["60"] = 37,["61"] = 37,["62"] = 37,["63"] = 37,["64"] = 31,["65"] = 63,["66"] = 63,["67"] = 63,["68"] = 63,["69"] = 63,["70"] = 63,["71"] = 63,["72"] = 63,["73"] = 63,["74"] = 63,["75"] = 63,["76"] = 79,["77"] = 82,["78"] = 82,["79"] = 82,["80"] = 82,["81"] = 82,["82"] = 82,["83"] = 82,["84"] = 81,["85"] = 91,["86"] = 91,["87"] = 91,["88"] = 91,["89"] = 91,["90"] = 91,["91"] = 91,["92"] = 79,["93"] = 103,["94"] = 103,["95"] = 103,["96"] = 103,["97"] = 103,["98"] = 103,["99"] = 103,["100"] = 103,["101"] = 103,["102"] = 103,["103"] = 103,["104"] = 103,["105"] = 103,["106"] = 103,["107"] = 103,["108"] = 103,["109"] = 103,["110"] = 103,["111"] = 103,["112"] = 103,["113"] = 103,["114"] = 103,["115"] = 103,["116"] = 103,["117"] = 103,["118"] = 102,["119"] = 131,["120"] = 131,["121"] = 131,["122"] = 131,["123"] = 131,["124"] = 131,["125"] = 131,["126"] = 131,["127"] = 131,["128"] = 131,["129"] = 131,["130"] = 131,["131"] = 131,["132"] = 131,["133"] = 131,["134"] = 131,["135"] = 131,["136"] = 131,["137"] = 131,["138"] = 131,["139"] = 131,["140"] = 131,["141"] = 79,["142"] = 160,["143"] = 160,["144"] = 162,["145"] = 163,["146"] = 165,["147"] = 165,["148"] = 165,["149"] = 166,["150"] = 167,["151"] = 168,["152"] = 167,["153"] = 169,["154"] = 169,["155"] = 169,["156"] = 169,["157"] = 170,["158"] = 169,["159"] = 171,["160"] = 171,["161"] = 166,["162"] = 173,["163"] = 174,["164"] = 174,["165"] = 175,["168"] = 178,["169"] = 179,["170"] = 180,["172"] = 182,["174"] = 165,["175"] = 165,["176"] = 185,["177"] = 186,["179"] = 160,["180"] = 160,["181"] = 160,["182"] = 193,["183"] = 193,["184"] = 193,["185"] = 194,["186"] = 193,["187"] = 193,["188"] = 197,["189"] = 197,["190"] = 197,["191"] = 198,["192"] = 197,["193"] = 197,["194"] = 201,["195"] = 201,["196"] = 201,["197"] = 202,["198"] = 201,["199"] = 201,["200"] = 158,["201"] = 206,["202"] = 207,["203"] = 208,["204"] = 214,["205"] = 215,["206"] = 206,["207"] = 218,["208"] = 219,["209"] = 220,["210"] = 221,["213"] = 224,["214"] = 218,["215"] = 227,["216"] = 228,["217"] = 229,["218"] = 230,["221"] = 233,["222"] = 229,["223"] = 227,["224"] = 237,["225"] = 238,["226"] = 239,["227"] = 240,["228"] = 242,["231"] = 247,["233"] = 249,["234"] = 250,["235"] = 253,["236"] = 254,["237"] = 255,["240"] = 260,["241"] = 261,["242"] = 262,["243"] = 264,["244"] = 265,["245"] = 267,["246"] = 270,["247"] = 270,["248"] = 270,["250"] = 271,["251"] = 271,["252"] = 271,["254"] = 272,["255"] = 272,["256"] = 272,["258"] = 274,["259"] = 275,["260"] = 276,["261"] = 278,["262"] = 279,["263"] = 279,["264"] = 279,["266"] = 265,["267"] = 265,["268"] = 265,["269"] = 265,["270"] = 268,["271"] = 268,["272"] = 268,["273"] = 268,["274"] = 268,["275"] = 268,["276"] = 268,["277"] = 268,["278"] = 268,["279"] = 268,["280"] = 265,["281"] = 265,["282"] = 237,["283"] = 284,["284"] = 285,["287"] = 288,["288"] = 284,["289"] = 291,["290"] = 292,["291"] = 293,["294"] = 296,["295"] = 292,["296"] = 291,["297"] = 304,["298"] = 305,["301"] = 309,["302"] = 310,["303"] = 311,["304"] = 312,["307"] = 316,["308"] = 317,["309"] = 318,["310"] = 319,["312"] = 304,["313"] = 325,["314"] = 326,["317"] = 330,["318"] = 331,["319"] = 332,["320"] = 333,["322"] = 325,["323"] = 339,["324"] = 344,["325"] = 347,["327"] = 351,["328"] = 355,["330"] = 358,["331"] = 339,["332"] = 364,["333"] = 367,["334"] = 367,["336"] = 368,["337"] = 368,["339"] = 369,["340"] = 364,["341"] = 372,["342"] = 373,["343"] = 374,["344"] = 375,["345"] = 372,["346"] = 378,["347"] = 379,["348"] = 378,["349"] = 382,["350"] = 386,["351"] = 387,["353"] = 389,["354"] = 390,["356"] = 392,["357"] = 382,["358"] = 395,["359"] = 396,["360"] = 395,["361"] = 406,["362"] = 408,["363"] = 409,["364"] = 410,["365"] = 412,["366"] = 412,["367"] = 411,["368"] = 418,["369"] = 419,["370"] = 423,["371"] = 424,["372"] = 425,["373"] = 425,["374"] = 425,["375"] = 425,["376"] = 428,["379"] = 432,["380"] = 406,["381"] = 435,["382"] = 440,["383"] = 441,["384"] = 443,["385"] = 444,["387"] = 447,["388"] = 448,["391"] = 451,["392"] = 451,["394"] = 452,["395"] = 453,["396"] = 453,["398"] = 455,["399"] = 462,["400"] = 463,["401"] = 464,["403"] = 466,["407"] = 451,["410"] = 435,["411"] = 471,["412"] = 477,["413"] = 477,["414"] = 477,["415"] = 477,["416"] = 478,["417"] = 479,["418"] = 479,["419"] = 479,["420"] = 479,["421"] = 479,["422"] = 478,["423"] = 482,["424"] = 483,["425"] = 483,["426"] = 483,["427"] = 483,["428"] = 484,["429"] = 485,["430"] = 485,["431"] = 485,["432"] = 485,["435"] = 492,["436"] = 471,["437"] = 495,["438"] = 496,["439"] = 497,["440"] = 498,["441"] = 501,["442"] = 501,["443"] = 501,["444"] = 502,["445"] = 501,["446"] = 501,["448"] = 509,["449"] = 510,["450"] = 512,["451"] = 514,["452"] = 515,["453"] = 516,["454"] = 521,["455"] = 527,["456"] = 527,["457"] = 527,["458"] = 527,["459"] = 528,["460"] = 529,["461"] = 529,["462"] = 529,["463"] = 529,["464"] = 529,["465"] = 528,["466"] = 533,["467"] = 534,["468"] = 534,["469"] = 535,["471"] = 539,["473"] = 541,["474"] = 541,["475"] = 542,["476"] = 543,["477"] = 544,["478"] = 548,["479"] = 551,["481"] = 555,["482"] = 556,["485"] = 541,["489"] = 563,["490"] = 569,["491"] = 569,["492"] = 569,["493"] = 569,["494"] = 572,["495"] = 573,["496"] = 574,["497"] = 575,["498"] = 575,["499"] = 575,["500"] = 575,["501"] = 575,["502"] = 575,["503"] = 575,["504"] = 582,["506"] = 585,["507"] = 585,["508"] = 586,["510"] = 593,["511"] = 593,["512"] = 593,["513"] = 593,["514"] = 596,["515"] = 597,["516"] = 598,["517"] = 600,["518"] = 600,["519"] = 601,["520"] = 602,["521"] = 603,["522"] = 604,["525"] = 608,["526"] = 610,["527"] = 611,["528"] = 613,["529"] = 614,["530"] = 615,["531"] = 616,["532"] = 617,["537"] = 674,["538"] = 674,["539"] = 675,["542"] = 682,["543"] = 682,["544"] = 683,["545"] = 682,["548"] = 688,["549"] = 695,["550"] = 699,["551"] = 700,["552"] = 700,["553"] = 700,["554"] = 700,["555"] = 700,["556"] = 699,["557"] = 704,["558"] = 495,["559"] = 707,["560"] = 708,["561"] = 709,["562"] = 710,["564"] = 712,["565"] = 713,["567"] = 715,["568"] = 707,["569"] = 718,["570"] = 719,["571"] = 720,["572"] = 720,["573"] = 720,["574"] = 720,["575"] = 720,["576"] = 719,["577"] = 718,["578"] = 727,["579"] = 729,["580"] = 730,["582"] = 733,["583"] = 734,["584"] = 736,["585"] = 737,["586"] = 738,["587"] = 739,["589"] = 742,["590"] = 727,["591"] = 748,["592"] = 749,["593"] = 748,["594"] = 752,["595"] = 755,["596"] = 755,["598"] = 758,["599"] = 758,["600"] = 758,["601"] = 758,["602"] = 760,["603"] = 761,["604"] = 763,["605"] = 766,["606"] = 767,["608"] = 770,["610"] = 774,["611"] = 752,["612"] = 780,["613"] = 781,["614"] = 783,["615"] = 784,["617"] = 788,["618"] = 789,["619"] = 790,["622"] = 795,["623"] = 796,["624"] = 797,["627"] = 801,["628"] = 780,["629"] = 805,["630"] = 806,["631"] = 807,["632"] = 808,["633"] = 809,["634"] = 810,["637"] = 814,["638"] = 815,["639"] = 815,["640"] = 815,["641"] = 816,["642"] = 817,["644"] = 819,["645"] = 815,["646"] = 815,["647"] = 822,["648"] = 823,["651"] = 829,["652"] = 830,["655"] = 833,["656"] = 834,["659"] = 837,["660"] = 838,["663"] = 842,["664"] = 843,["667"] = 846,["668"] = 848,["669"] = 848,["670"] = 849,["672"] = 850,["674"] = 847,["675"] = 851,["676"] = 852,["677"] = 853,["681"] = 857,["682"] = 858,["683"] = 859,["686"] = 862,["688"] = 870,["689"] = 871,["690"] = 872,["691"] = 873,["692"] = 874,["693"] = 875,["694"] = 876,["695"] = 877,["696"] = 878,["697"] = 879,["698"] = 881,["699"] = 882,["700"] = 883,["701"] = 884,["702"] = 885,["704"] = 887,["705"] = 805,["706"] = 890,["707"] = 891,["708"] = 892,["709"] = 895,["710"] = 899,["713"] = 903,["714"] = 904,["717"] = 909,["718"] = 910,["721"] = 913,["722"] = 914,["725"] = 917,["726"] = 918,["729"] = 922,["730"] = 923,["731"] = 925,["732"] = 926,["733"] = 927,["734"] = 928,["735"] = 929,["736"] = 930,["738"] = 933,["739"] = 934,["742"] = 939,["743"] = 942,["744"] = 943,["745"] = 944,["746"] = 946,["747"] = 947,["748"] = 948,["749"] = 950,["750"] = 951,["751"] = 952,["753"] = 956,["754"] = 957,["755"] = 890,["756"] = 963,["757"] = 964,["758"] = 965,["759"] = 968,["760"] = 969,["761"] = 970,["762"] = 971,["763"] = 972,["764"] = 973,["765"] = 974,["766"] = 975,["767"] = 963,["768"] = 981,["769"] = 982,["770"] = 983,["771"] = 984,["772"] = 985,["773"] = 987,["774"] = 990,["775"] = 991,["776"] = 992,["779"] = 997,["780"] = 998,["781"] = 999,["782"] = 1000,["783"] = 1001,["784"] = 1002,["785"] = 1003,["786"] = 1004,["787"] = 1005,["788"] = 1006,["789"] = 1007,["791"] = 1009,["794"] = 1013,["795"] = 1014,["798"] = 1019,["799"] = 1020,["800"] = 1021,["803"] = 1024,["804"] = 1027,["805"] = 1028,["806"] = 1029,["807"] = 1030,["808"] = 1031,["809"] = 1030,["810"] = 1034,["811"] = 1037,["812"] = 1038,["813"] = 1039,["814"] = 1040,["815"] = 1041,["816"] = 1042,["817"] = 1043,["821"] = 1047,["826"] = 1051,["827"] = 1052,["828"] = 1053,["829"] = 1056,["833"] = 1064,["834"] = 1065,["835"] = 1066,["837"] = 1068,["838"] = 1069,["839"] = 1070,["840"] = 1071,["841"] = 1072,["842"] = 1073,["843"] = 1074,["844"] = 1075,["846"] = 1077,["848"] = 1084,["849"] = 1085,["850"] = 1086,["851"] = 1087,["852"] = 1088,["856"] = 1093,["857"] = 1094,["858"] = 1095,["859"] = 1096,["860"] = 1097,["861"] = 1098,["862"] = 1099,["863"] = 1100,["864"] = 1101,["865"] = 1102,["866"] = 1103,["867"] = 1104,["868"] = 1105,["869"] = 1106,["870"] = 1107,["871"] = 1108,["872"] = 1109,["873"] = 1110,["874"] = 1111,["875"] = 1112,["876"] = 1113,["878"] = 1117,["879"] = 1120,["880"] = 1121,["881"] = 1124,["882"] = 1126,["883"] = 981,["884"] = 21,["885"] = 22,["886"] = 1134,["887"] = 1135,["888"] = 1134});
local ____exports = {}
local ____player = require("api.player")
local MemberLevel = ____player.MemberLevel
local Player = ____player.Player
local ____showcase = require("api.showcase")
local Showcase = ____showcase.Showcase
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____net_2Dtable_2Dhelper = require("modules.helper.net-table-helper")
local NetTableHelper = ____net_2Dtable_2Dhelper.NetTableHelper
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____ability_2Dreplace = require("modules.lottery.ability-replace.ability-replace")
local AbilityReplace = ____ability_2Dreplace.AbilityReplace
local ____ability_2Dreplace_2Dhelper = require("modules.lottery.ability-replace.ability-replace-helper")
local AbilityReplaceHelper = ____ability_2Dreplace_2Dhelper.AbilityReplaceHelper
local ____awakening_2Dlottery_2Ddefinitions = require("modules.lottery.awakening-lottery-definitions")
local AwakeningLotteryDefinitions = ____awakening_2Dlottery_2Ddefinitions.AwakeningLotteryDefinitions
local ____awakening_2Dlottery_2Dgrant_2Dservice = require("modules.lottery.awakening-lottery-grant-service")
local AwakeningLotteryGrantService = ____awakening_2Dlottery_2Dgrant_2Dservice.AwakeningLotteryGrantService
local ____item_2Dlottery = require("modules.lottery.item.item-lottery")
local ItemLottery = ____item_2Dlottery.ItemLottery
local ____lottery_2Dability_2Dgrant_2Dhelper = require("modules.lottery.lottery-ability-grant-helper")
local LotteryAbilityGrantHelper = ____lottery_2Dability_2Dgrant_2Dhelper.LotteryAbilityGrantHelper
local ____lottery_2Dabilities = require("modules.lottery.lottery-abilities")
local abilityTiersActive = ____lottery_2Dabilities.abilityTiersActive
local abilityTiersPassive = ____lottery_2Dabilities.abilityTiersPassive
local ____lottery_2Dhelper = require("modules.lottery.lottery-helper")
local LotteryHelper = ____lottery_2Dhelper.LotteryHelper
____exports.Lottery = __TS__Class()
local Lottery = ____exports.Lottery
Lottery.name = "Lottery"
function Lottery.prototype.____constructor(self)
    self.Item = __TS__New(ItemLottery)
    self.AbilityReplace = __TS__New(AbilityReplace)
    self.randomCountBase = 6
    self.randomCountExtra = 2
    self.stagedLotteryTimersStarted = false
    self.ABYSS_BLOCKED_LOTTERY_ABILITIES = {"enigma_black_hole"}
    self.REFRESH_TIER_CONFIGS = {{tier = 1, maxCount = 4, steamIds = {"116431158"}}, {tier = 2, maxCount = 3, steamIds = {"76561198111111111", "76561198222222222"}}, {tier = 3, maxCount = 2, steamIds = {
        "177189240",
        "436804590",
        "295351477",
        "180074451",
        "92159660",
        "370099556",
        "135764651",
        "1002784680"
    }}, {tier = 4, maxCount = 1, steamIds = {"198490822", "162341200", "883568310", "152103416"}}}
    self.dangerousAbilities = {
        doom_bringer_doom = {"modifier_doom_bringer_doom_aura_self", "modifier_doom_bringer_doom_aura"},
        pangolier_gyroshell = {"modifier_pangolier_gyroshell"},
        juggernaut_omni_slash = {"modifier_juggernaut_omnislash"},
        faceless_void_chronosphere = {"modifier_faceless_void_chronosphere", "modifier_faceless_void_chronosphere_self"},
        bane_nightmare = {"modifier_bane_nightmare"},
        shadow_shaman_shackles = {"modifier_shadow_shaman_shackles"},
        brewmaster_primal_split_lua = {"modifier_brewmaster_primal_split_lua"},
        dragon_knight_elder_dragon_form = {"modifier_dragon_knight_elder_dragon_form"},
        muerta_pierce_the_veil = {"modifier_muerta_pierce_the_veil_buff"}
    }
    self.ABILITY_POOLS = {normal = {passive = {
        {name = "artoria_instinct_lottery", level = 0},
        {name = "silencer_brain_drain2", level = 0},
        {name = "troll_warlord_fervor", level = 0},
        {name = "pantsushot", level = 0},
        {name = "visage_gravekeepers_cloak", level = 0},
        {name = "medusa_split_shot", level = 0},
        {name = "ability_trigger_item_on_attacked", level = 0}
    }, active = {
        {name = "mars_bulwark", level = 0},
        {name = "centaur_stampede", level = 0},
        {name = "earthshaker_fissure", level = 0},
        {name = "ancient_apparition_freezing_aura", level = 0},
        {name = "bounty_hunter_wind_walk", level = 0},
        {name = "centaur_double_edge", level = 0},
        {name = "undying_flesh_golem", level = 0}
    }}, allHeroRandom = {passive = {
        {name = "dazzle_good_juju", level = 5},
        {name = "earthshaker_aftershock", level = 3},
        {name = "ability_charge_damage", level = 5},
        {name = "ogre_magi_multicast_lua", level = 4},
        {name = "leshrac_defilement2", level = 4},
        {name = "ability_trigger_learned_skills", level = 4},
        {name = "ability_trigger_on_cast", level = 4},
        {name = "ability_trigger_chilie", level = 4},
        {name = "ability_trigger_on_attacked", level = 4},
        {name = "ability_trigger_on_move", level = 4},
        {name = "medusa_split_shot", level = 4},
        {name = "winter_wyvern_arctic_burn", level = 4},
        {name = "batrider_smoldering_resin2", level = 4},
        {name = "medusa_mana_shield2", level = 4},
        {name = "shredder_reactive_armor", level = 4},
        {name = "spectre_dispersion2", level = 4},
        {name = "silencer_brain_drain2", level = 4},
        {name = "tiny_insurmountable2", level = 4},
        {name = "death_burst_attack_growth", level = 0},
        {name = "death_burst_health_growth", level = 0},
        {name = "necrolyte_heartstopper_aura_datadriven", level = 0},
        {name = "death_prophet_witchcraft2", level = 0},
        {name = "axe_counter_helix", level = 0},
        {name = "riki_permanent_invisibility", level = 0},
        {name = "silencer_glaives_of_wisdom", level = 0}
    }, active = {
        {name = "faceless_void_time_zone", level = 5},
        {name = "juggernaut_omni_slash", level = 4},
        {name = "abaddon_borrowed_time", level = 5},
        {name = "alchemist_chemical_rage", level = 5},
        {name = "pudge_meat_hook", level = 1},
        {name = "gyrocopter_flak_cannon", level = 5},
        {name = "ability_trigger_on_active", level = 5},
        {name = "marci_unleash", level = 4},
        {name = "ability_mind_control", level = 4},
        {name = "tinker_rearm_lua", level = 3},
        {name = "muerta_pierce_the_veil", level = 4},
        {name = "troll_warlord_battle_trance", level = 4},
        {name = "dazzle_bad_juju", level = 3},
        {name = "beastmaster_wild_axes", level = 4},
        {name = "mars_bulwark", level = 4},
        {name = "slark_shadow_dance", level = 3},
        {name = "dark_willow_shadow_realm", level = 3},
        {name = "bloodseeker_blood_mist2", level = 4},
        {name = "antimage_counterspell", level = 3},
        {name = "winter_wyvern_winters_curse", level = 2},
        {name = "clinkz_burning_barrage2", level = 2},
        {name = "puck_dream_coil", level = 2}
    }}}
    ListenToGameEvent(
        "game_rules_state_change",
        function()
            if GameRules:State_Get() == DOTA_GAMERULES_STATE_PRE_GAME then
                Timers:CreateTimer(
                    2,
                    function()
                        local ____print_15 = print
                        local ____tostring_2 = tostring
                        local ____opt_0 = GameRules.Option
                        local ____tostring_2_result_12 = ____tostring_2(____opt_0 and ____opt_0.gameDifficulty)
                        local ____tostring_5 = tostring
                        local ____opt_3 = GameRules.Option
                        local ____tostring_5_result_13 = ____tostring_5(____opt_3 and ____opt_3.abyssMode)
                        local ____tostring_8 = tostring
                        local ____opt_6 = GameRules.Option
                        local ____tostring_8_result_14 = ____tostring_8(____opt_6 and ____opt_6.extraPassiveAbilities)
                        local ____tostring_11 = tostring
                        local ____opt_9 = GameRules.Option
                        ____print_15((((((("[Lottery][Startup] difficulty=" .. ____tostring_2_result_12) .. " abyssMode=") .. ____tostring_5_result_13) .. " extraPassive=") .. ____tostring_8_result_14) .. " sameHeroSelection=") .. ____tostring_11(____opt_9 and ____opt_9.sameHeroSelection))
                        self:initLotteryAll("abilityPassive")
                        local ____opt_16 = GameRules.Option
                        if (____opt_16 and ____opt_16.abyssMode) == true then
                            print("[Lottery][Startup] abyssMode early return after abilityPassive")
                            return
                        end
                        self:initLotteryAll("abilityActive")
                        if GameRules.Option.extraPassiveAbilities then
                            self:initLotteryAll("abilityPassive2")
                        else
                            print("[Lottery][Startup] extraPassiveAbilities disabled, skip abilityPassive2")
                        end
                    end
                )
            elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
                self:startStagedLotteryTimers()
            end
        end,
        nil
    )
    CustomGameEventManager:RegisterListener(
        "lottery_pick_ability",
        function(userId, event)
            self:pickAbility(userId, event)
        end
    )
    CustomGameEventManager:RegisterListener(
        "lottery_refresh_ability",
        function(userId, event)
            self:refreshAbility(userId, event)
        end
    )
    CustomGameEventManager:RegisterListener(
        "lottery_reset_ability",
        function(userId, event)
            self:resetAbility(userId, event)
        end
    )
end
function Lottery.prototype.getMaxRefreshCount(self, steamAccountID, isMember)
    local backendExtraCount = Player:GetLotteryRefreshExtraCount(__TS__Number(steamAccountID))
    local extraCount = backendExtraCount ~= nil and backendExtraCount or self:getLocalExtraRefreshCount(steamAccountID)
    local baseCount = isMember and 1 or 0
    return baseCount + extraCount
end
function Lottery.prototype.getLocalExtraRefreshCount(self, steamAccountID)
    for ____, config in ipairs(self.REFRESH_TIER_CONFIGS) do
        if __TS__ArrayIncludes(config.steamIds, steamAccountID) then
            return config.maxCount
        end
    end
    return 0
end
function Lottery.prototype.initLotteryAll(self, abilityType)
    print("initLotteryAll " .. (abilityType or "all"))
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        self:initLottery(playerId, abilityType)
    end)
end
function Lottery.prototype.initLottery(self, playerId, abilityType)
    if abilityType ~= nil then
        local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
        local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
        if self:isLotteryPicked(abilityType, lotteryStatus) or self:isLotterySlotOpen(abilityType, steamAccountID) then
            return
        end
        self:randomAbilityForPlayer(playerId, abilityType)
    else
        self:randomAbilityForPlayer(playerId, "abilityActive")
        self:randomAbilityForPlayer(playerId, "abilityPassive")
        local extraPassiveAbilities = GameRules.Option.extraPassiveAbilities
        if extraPassiveAbilities then
            self:randomAbilityForPlayer(playerId, "abilityPassive2")
        end
    end
    local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
    local member = NetTableHelper:GetMember(steamAccountID)
    local maxRefreshCount = self:getMaxRefreshCount(steamAccountID, member.enable)
    local existingStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
    local ____CustomNetTables_SetTableValue_27 = CustomNetTables.SetTableValue
    local ____tostring_result_26 = tostring(PlayerResource:GetSteamAccountID(playerId))
    local ____existingStatus_isActiveAbilityRefreshed_18 = existingStatus.isActiveAbilityRefreshed
    if ____existingStatus_isActiveAbilityRefreshed_18 == nil then
        ____existingStatus_isActiveAbilityRefreshed_18 = false
    end
    local ____existingStatus_isPassiveAbilityRefreshed_19 = existingStatus.isPassiveAbilityRefreshed
    if ____existingStatus_isPassiveAbilityRefreshed_19 == nil then
        ____existingStatus_isPassiveAbilityRefreshed_19 = false
    end
    local ____existingStatus_isPassiveAbilityRefreshed2_20 = existingStatus.isPassiveAbilityRefreshed2
    if ____existingStatus_isPassiveAbilityRefreshed2_20 == nil then
        ____existingStatus_isPassiveAbilityRefreshed2_20 = false
    end
    local ____temp_22 = existingStatus.activeAbilityRefreshCount or 0
    local ____temp_23 = existingStatus.passiveAbilityRefreshCount or 0
    local ____temp_24 = existingStatus.passiveAbilityRefreshCount2 or 0
    local ____temp_25 = existingStatus.abilityResettableCount or 0
    local ____existingStatus_showAbilityResetButton_21 = existingStatus.showAbilityResetButton
    if ____existingStatus_showAbilityResetButton_21 == nil then
        ____existingStatus_showAbilityResetButton_21 = false
    end
    ____CustomNetTables_SetTableValue_27(
        CustomNetTables,
        "lottery_status",
        ____tostring_result_26,
        __TS__ObjectAssign({}, existingStatus, {
            isActiveAbilityRefreshed = ____existingStatus_isActiveAbilityRefreshed_18,
            isPassiveAbilityRefreshed = ____existingStatus_isPassiveAbilityRefreshed_19,
            isPassiveAbilityRefreshed2 = ____existingStatus_isPassiveAbilityRefreshed2_20,
            activeAbilityRefreshCount = ____temp_22,
            passiveAbilityRefreshCount = ____temp_23,
            passiveAbilityRefreshCount2 = ____temp_24,
            maxRefreshCount = maxRefreshCount,
            abilityResettableCount = ____temp_25,
            showAbilityResetButton = ____existingStatus_showAbilityResetButton_21
        })
    )
end
function Lottery.prototype.startStagedLotteryTimers(self)
    if self.stagedLotteryTimersStarted then
        return
    end
    self.stagedLotteryTimersStarted = true
end
function Lottery.prototype.sendLotteryReminder(self, message)
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        GameRules:SendCustomMessage("<font color='#FFD700'>[技能抽奖]</font> " .. message, playerId, 0)
    end)
end
function Lottery.prototype.openNextStagedLotteryForPlayer(self, playerId)
    if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
        return
    end
    local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
    local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
    local nextType = self:getNextClosedLotteryType(steamAccountID, lotteryStatus)
    if nextType == nil then
        return
    end
    self:initLottery(playerId, nextType)
    local player = PlayerResource:GetPlayer(playerId)
    if player then
        CustomGameEventManager:Send_ServerToPlayer(player, "lottery_force_expand", {type = nextType})
    end
end
function Lottery.prototype.openLotteryForPlayer(self, playerId, abilityType)
    if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
        return
    end
    self:initLottery(playerId, abilityType)
    local player = PlayerResource:GetPlayer(playerId)
    if player then
        CustomGameEventManager:Send_ServerToPlayer(player, "lottery_force_expand", {type = abilityType})
    end
end
function Lottery.prototype.getNextClosedLotteryType(self, steamAccountID, lotteryStatus)
    if not self:isLotteryPicked("abilityActive", lotteryStatus) and not self:isLotterySlotOpen("abilityActive", steamAccountID) then
        return "abilityActive"
    end
    if GameRules.Option.extraPassiveAbilities and not self:isLotteryPicked("abilityPassive2", lotteryStatus) and not self:isLotterySlotOpen("abilityPassive2", steamAccountID) then
        return "abilityPassive2"
    end
    return nil
end
function Lottery.prototype.getAbilityTableName(self, abilityType)
    if abilityType == "abilityActive" then
        return "lottery_active_abilities"
    end
    if abilityType == "abilityPassive" then
        return "lottery_passive_abilities"
    end
    return "lottery_passive_abilities_2"
end
function Lottery.prototype.getLotteryCandidates(self, abilityType, steamAccountID)
    local abilityTable = self:getAbilityTableName(abilityType)
    local lotteryAbilitiesRaw = CustomNetTables:GetTableValue(abilityTable, steamAccountID)
    return lotteryAbilitiesRaw ~= nil and __TS__ObjectValues(lotteryAbilitiesRaw) or ({})
end
function Lottery.prototype.isLotterySlotOpen(self, abilityType, steamAccountID)
    return #self:getLotteryCandidates(abilityType, steamAccountID) > 0
end
function Lottery.prototype.isLotteryPicked(self, abilityType, lotteryStatus)
    if abilityType == "abilityActive" then
        return lotteryStatus.activeAbilityName ~= nil
    end
    if abilityType == "abilityPassive" then
        return lotteryStatus.passiveAbilityName ~= nil
    end
    return lotteryStatus.passiveAbilityName2 ~= nil
end
function Lottery.prototype.isAbilityItemType(self, abilityType)
    return abilityType == "abilityActive" or abilityType == "abilityPassive" or abilityType == "abilityPassive2"
end
function Lottery.prototype.getExcludedAbilityNames(self, abilityType, steamAccountID)
    local abilityTable = self:getAbilityTableName(abilityType)
    local lotteryAbilitiesRaw = CustomNetTables:GetTableValue(abilityTable, steamAccountID)
    local executedNames = lotteryAbilitiesRaw ~= nil and __TS__ArrayMap(
        __TS__ObjectValues(lotteryAbilitiesRaw),
        function(____, item) return AwakeningLotteryDefinitions:GetPoolName(item) end
    ) or ({})
    if abilityType == "abilityPassive" or abilityType == "abilityPassive2" then
        local otherTable = abilityType == "abilityPassive" and "lottery_passive_abilities_2" or "lottery_passive_abilities"
        local otherAbilitiesRaw = CustomNetTables:GetTableValue(otherTable, steamAccountID)
        if otherAbilitiesRaw ~= nil then
            local otherNames = __TS__ArrayMap(
                __TS__ObjectValues(otherAbilitiesRaw),
                function(____, item) return AwakeningLotteryDefinitions:GetPoolName(item) end
            )
            __TS__ArrayPushArray(executedNames, otherNames)
        end
    end
    return executedNames
end
function Lottery.prototype.replaceBlockedLotteryResults(self, lotteryResults, abilityTiers, blockedAbilities)
    local blockedLookup = {}
    local usedLookup = {}
    for ____, abilityName in ipairs(blockedAbilities) do
        blockedLookup[abilityName] = true
    end
    for ____, result in ipairs(lotteryResults) do
        usedLookup[result.name] = true
    end
    do
        local i = #lotteryResults - 1
        while i >= 0 do
            do
                local result = lotteryResults[i + 1]
                if not blockedLookup[result.name] then
                    goto __continue60
                end
                local replacement = self:findReplacementLotteryAbility(abilityTiers, result.level, blockedLookup, usedLookup)
                if replacement then
                    lotteryResults[i + 1] = replacement
                    usedLookup[replacement.name] = true
                else
                    __TS__ArraySplice(lotteryResults, i, 1)
                end
            end
            ::__continue60::
            i = i - 1
        end
    end
end
function Lottery.prototype.findReplacementLotteryAbility(self, abilityTiers, preferredLevel, blockedLookup, usedLookup)
    local preferredTier = __TS__ArrayFind(
        abilityTiers,
        function(____, tier) return tier.level == preferredLevel end
    )
    local tiers = preferredTier and ({
        preferredTier,
        unpack(__TS__ArrayFilter(
            abilityTiers,
            function(____, tier) return tier ~= preferredTier end
        ))
    }) or abilityTiers
    for ____, tier in ipairs(tiers) do
        local candidates = __TS__ArrayFilter(
            tier.names,
            function(____, name) return not blockedLookup[name] and not usedLookup[name] end
        )
        if #candidates > 0 then
            return {
                name = candidates[RandomInt(0, #candidates - 1) + 1],
                level = tier.level
            }
        end
    end
    return nil
end
function Lottery.prototype.randomAbilityForPlayer(self, playerId, abilityType)
    local steamAccountId = PlayerResource:GetSteamAccountID(playerId)
    if not Showcase:IsLotteryPoolLoaded(steamAccountId) then
        print((((("[Lottery][AwakeningPool] background-load player=" .. tostring(playerId)) .. " steam=") .. tostring(steamAccountId)) .. " type=") .. abilityType)
        Showcase:EnsureLotteryPoolLoaded(
            steamAccountId,
            function(____, loaded)
                print((((("[Lottery][AwakeningPool] background-load-result player=" .. tostring(playerId)) .. " steam=") .. tostring(steamAccountId)) .. " loaded=") .. (loaded and "yes" or "no"))
            end
        )
    end
    local abilityTable = self:getAbilityTableName(abilityType)
    local baseAbilityTiers = abilityType == "abilityActive" and abilityTiersActive or abilityTiersPassive
    local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    local unlockedAwakenings = Showcase:GetLotteryPoolAwakenings(__TS__Number(steamAccountID))
    local eligibleAwakenings = AwakeningLotteryDefinitions:GetEligibleDefinitions(unlockedAwakenings, abilityType, hero)
    local abilityTiers = AwakeningLotteryDefinitions:BuildPersonalTiers(baseAbilityTiers, unlockedAwakenings, abilityType, hero)
    local tier2 = __TS__ArrayFind(
        abilityTiers,
        function(____, tier) return tier.level == 2 end
    )
    print((((((((((((((("[Lottery][AwakeningPool] player=" .. tostring(playerId)) .. " steam=") .. steamAccountID) .. " type=") .. abilityType) .. " hero=") .. (hero and hero:GetUnitName() or "none")) .. " unlocked=") .. (#unlockedAwakenings > 0 and table.concat(unlockedAwakenings, ",") or "none")) .. " eligible=") .. (#eligibleAwakenings > 0 and table.concat(
        __TS__ArrayMap(
            eligibleAwakenings,
            function(____, definition) return definition.itemId end
        ),
        ","
    ) or "none")) .. " tier2Total=") .. tostring(tier2 and #tier2.names or 0)) .. " tier2Awakenings=") .. tostring(#eligibleAwakenings))
    local executedNames = self:getExcludedAbilityNames(abilityType, steamAccountID)
    local ____opt_32 = GameRules.Option
    if (____opt_32 and ____opt_32.abyssMode) == true then
        __TS__ArrayPushArray(executedNames, self.ABYSS_BLOCKED_LOTTERY_ABILITIES)
    end
    if hero then
        do
            local i = 0
            while i < hero:GetAbilityCount() do
                local ability = hero:GetAbilityByIndex(i)
                if ability then
                    local abilityName = ability:GetAbilityName()
                    if abilityName == "rubick_might_and_magus2" or abilityName == "rubick_might_and_magus" then
                        executedNames[#executedNames + 1] = "razor_dynamo2"
                    end
                    if abilityName == "razor_dynamo2" or abilityName == "razor_dynamo" then
                        executedNames[#executedNames + 1] = "rubick_might_and_magus2"
                    end
                end
                i = i + 1
            end
        end
    end
    local abilityLotteryResults = LotteryHelper:getRandomAbilities(abilityTiers, self.randomCountBase, hero, executedNames)
    local baseRolls = __TS__ArrayMap(
        abilityLotteryResults,
        function(____, candidate) return __TS__ObjectAssign({}, candidate) end
    )
    local member = NetTableHelper:GetMember(steamAccountID)
    local premiumRolls = {}
    if member.enable and member.level >= MemberLevel.PREMIUM then
        premiumRolls = LotteryHelper:getRandomAbilities(
            abilityTiers,
            self.randomCountExtra,
            hero,
            executedNames,
            true
        )
        __TS__ArrayPushArray(abilityLotteryResults, premiumRolls)
    end
    local ____opt_34 = GameRules.Option
    if (____opt_34 and ____opt_34.abyssMode) == true then
        self:replaceBlockedLotteryResults(abilityLotteryResults, abilityTiers, self.ABYSS_BLOCKED_LOTTERY_ABILITIES)
    end
    local beforeFixedPool = __TS__ArrayMap(
        abilityLotteryResults,
        function(____, candidate) return __TS__ObjectAssign({}, candidate) end
    )
    if #abilityLotteryResults > 0 then
        local specifiedAbilityInfo = self:getSpecifiedAbilityByFixedAbility()
        if specifiedAbilityInfo then
            local specifiedAbility = specifiedAbilityInfo.ability
            local isActive = specifiedAbilityInfo.isActive
            if isActive and abilityType == "abilityActive" then
                abilityLotteryResults[1] = specifiedAbility
            elseif not isActive and abilityType == "abilityPassive" then
                abilityLotteryResults[1] = specifiedAbility
            end
        else
            local abilityPool = self:getAbilityPool(abilityType)
            if abilityPool ~= nil then
                local selectedAbility = self:selectUniqueAbility(abilityPool, abilityLotteryResults)
                if selectedAbility ~= nil then
                    abilityLotteryResults[1] = selectedAbility
                    local mode = self:isAllHeroRandomMode() and "AllHeroRandom" or "Normal"
                    local ____type = abilityType == "abilityActive" and "active" or "passive"
                    print((((("[Lottery] " .. mode) .. " mode - Replaced ") .. ____type) .. " ability with: ") .. selectedAbility.name)
                end
            end
        end
    end
    local ____opt_36 = GameRules.Option
    if (____opt_36 and ____opt_36.abyssMode) == true then
        self:replaceBlockedLotteryResults(abilityLotteryResults, abilityTiers, self.ABYSS_BLOCKED_LOTTERY_ABILITIES)
    end
    do
        local index = 0
        while index < #abilityLotteryResults do
            abilityLotteryResults[index + 1] = AwakeningLotteryDefinitions:ResolveCandidate(abilityLotteryResults[index + 1])
            index = index + 1
        end
    end
    local overwrittenFirst = #beforeFixedPool > 0 and #abilityLotteryResults > 0 and AwakeningLotteryDefinitions:ResolveCandidate(beforeFixedPool[1]).name ~= abilityLotteryResults[1].name and (self:formatLotteryCandidate(beforeFixedPool[1]) .. "->") .. self:formatLotteryCandidate(abilityLotteryResults[1]) or "none"
    print((((((((((((((((("[Lottery][AwakeningRoll] player=" .. tostring(playerId)) .. " steam=") .. steamAccountID) .. " type=") .. abilityType) .. " premium=") .. (member.enable and member.level >= MemberLevel.PREMIUM and "yes" or "no")) .. " base=") .. self:formatLotteryCandidates(baseRolls)) .. " extra=") .. self:formatLotteryCandidates(premiumRolls)) .. " beforeFixed=") .. self:formatLotteryCandidates(beforeFixedPool)) .. " final=") .. self:formatLotteryCandidates(abilityLotteryResults)) .. " overwrittenFirst=") .. overwrittenFirst)
    print((((((((("[Lottery][Candidates] player=" .. tostring(playerId)) .. " type=") .. abilityType) .. " table=") .. abilityTable) .. " count=") .. tostring(#abilityLotteryResults)) .. " names=") .. table.concat(
        __TS__ArrayMap(
            abilityLotteryResults,
            function(____, item) return item.name end
        ),
        ","
    ))
    CustomNetTables:SetTableValue(abilityTable, steamAccountID, abilityLotteryResults)
end
function Lottery.prototype.formatLotteryCandidate(self, candidate)
    local awakening = AwakeningLotteryDefinitions:GetByToken(candidate.name)
    if awakening then
        return (("T" .. tostring(candidate.level)) .. ":awakening:") .. awakening.itemId
    end
    if candidate.source == "awakening" and candidate.entryId then
        return (("T" .. tostring(candidate.level)) .. ":awakening:") .. candidate.entryId
    end
    return (("T" .. tostring(candidate.level)) .. ":") .. candidate.name
end
function Lottery.prototype.formatLotteryCandidates(self, candidates)
    return #candidates > 0 and table.concat(
        __TS__ArrayMap(
            candidates,
            function(____, candidate) return self:formatLotteryCandidate(candidate) end
        ),
        "|"
    ) or "none"
end
function Lottery.prototype.getAbilityPool(self, abilityType)
    if abilityType == "abilityPassive2" then
        return nil
    end
    local isAllHeroRandom = self:isAllHeroRandomMode()
    local mode = isAllHeroRandom and "allHeroRandom" or "normal"
    if abilityType == "abilityActive" then
        return self.ABILITY_POOLS[mode].active
    elseif abilityType == "abilityPassive" then
        return self.ABILITY_POOLS[mode].passive
    end
    return nil
end
function Lottery.prototype.isAllHeroRandomMode(self)
    return GameRules.Option.sameHeroSelection == true
end
function Lottery.prototype.selectUniqueAbility(self, abilityPool, existingAbilities, maxAttempts)
    if maxAttempts == nil then
        maxAttempts = 10
    end
    local existingNames = __TS__ArrayMap(
        existingAbilities,
        function(____, ability) return ability.name end
    )
    local attempts = 0
    while attempts < maxAttempts do
        local randomAbility = abilityPool[RandomInt(0, #abilityPool - 1) + 1]
        if not __TS__ArrayIncludes(existingNames, randomAbility.name) then
            return randomAbility
        end
        attempts = attempts + 1
    end
    return abilityPool[RandomInt(0, #abilityPool - 1) + 1]
end
function Lottery.prototype.getSpecifiedAbilityByFixedAbility(self)
    local fixedAbility = GameRules.Option.fixedAbility
    if fixedAbility == "none" then
        return nil
    end
    for ____, tier in ipairs(abilityTiersPassive) do
        if __TS__ArrayIncludes(tier.names, fixedAbility) then
            return {ability = {name = fixedAbility, level = tier.level}, isActive = false}
        end
    end
    for ____, tier in ipairs(abilityTiersActive) do
        if __TS__ArrayIncludes(tier.names, fixedAbility) then
            return {ability = {name = fixedAbility, level = tier.level}, isActive = true}
        end
    end
    return nil
end
function Lottery.prototype.pickAbility(self, userId, event)
    local steamAccountID = tostring(PlayerResource:GetSteamAccountID(event.PlayerID))
    local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
    local abilityType = event.type
    if not self:isAbilityItemType(abilityType) then
        print("选择技能类型错误")
        return
    end
    local lotteryCandidates = self:getLotteryCandidates(abilityType, steamAccountID)
    local pickedCandidate = __TS__ArrayFind(
        lotteryCandidates,
        function(____, ability)
            if ability.source == "awakening" then
                return event.source == "awakening" and event.entryId == ability.entryId
            end
            return ability.name == event.name and not event.entryId
        end
    )
    if not pickedCandidate then
        print((("[Lottery] pick denied, slot not open or candidate invalid: " .. abilityType) .. ", ") .. event.name)
        return
    end
    if abilityType == "abilityActive" and lotteryStatus.activeAbilityName then
        print("已经抽取过主动技能")
        return
    end
    if abilityType == "abilityPassive" and lotteryStatus.passiveAbilityName then
        print("已经抽取过被动技能")
        return
    end
    if abilityType == "abilityPassive2" and lotteryStatus.passiveAbilityName2 then
        print("已经抽取过第二个被动技能")
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(event.PlayerID)
    if not hero then
        return
    end
    local pickedAbilityName = pickedCandidate.name
    local ____temp_38
    if pickedCandidate.source == "awakening" then
        ____temp_38 = AwakeningLotteryGrantService:Grant(hero, pickedCandidate, event.PlayerID)
    else
        ____temp_38 = nil
    end
    local bundleState = ____temp_38
    if pickedCandidate.source == "awakening" then
        if not bundleState then
            print("[Lottery] failed to grant awakening bundle: " .. pickedAbilityName)
            return
        end
    else
        local newAbility = hero:AddAbility(pickedAbilityName)
        if not newAbility then
            print("[Lottery] failed to add ability: " .. pickedAbilityName)
            return
        end
        LotteryAbilityGrantHelper:ApplyGrantSideEffects(hero, pickedAbilityName, newAbility, event.PlayerID)
    end
    if abilityType == "abilityActive" then
        lotteryStatus.activeAbilityName = pickedCandidate.name
        lotteryStatus.activeAbilityLevel = pickedCandidate.level
        lotteryStatus.activeAbilityBundle = bundleState
        lotteryStatus.activeHotkeyAbilityName = bundleState and bundleState.hotkeyAbilityName
    elseif abilityType == "abilityPassive" then
        lotteryStatus.passiveAbilityName = pickedCandidate.name
        lotteryStatus.passiveAbilityLevel = pickedCandidate.level
        lotteryStatus.passiveAbilityBundle = bundleState
        lotteryStatus.passiveHotkeyAbilityName = bundleState and bundleState.hotkeyAbilityName
    elseif abilityType == "abilityPassive2" then
        lotteryStatus.passiveAbilityName2 = pickedCandidate.name
        lotteryStatus.passiveAbilityLevel2 = pickedCandidate.level
        lotteryStatus.passiveAbilityBundle2 = bundleState
        lotteryStatus.passiveHotkeyAbilityName2 = bundleState and bundleState.hotkeyAbilityName
    end
    CustomNetTables:SetTableValue("lottery_status", steamAccountID, lotteryStatus)
end
function Lottery.prototype.refreshAbility(self, userId, event)
    local steamAccountID = tostring(PlayerResource:GetSteamAccountID(event.PlayerID))
    local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
    if event.type ~= "abilityActive" and event.type ~= "abilityPassive" and event.type ~= "abilityPassive2" then
        print("刷新技能类型错误")
        return
    end
    if not self:isLotterySlotOpen(event.type, steamAccountID) then
        print("[Lottery] refresh denied, slot not open: " .. event.type)
        return
    end
    if event.type == "abilityActive" and lotteryStatus.activeAbilityName then
        print("已经抽取过主动技能")
        return
    end
    if event.type == "abilityPassive" and lotteryStatus.passiveAbilityName then
        print("已经抽取过被动技能")
        return
    end
    if event.type == "abilityPassive2" and lotteryStatus.passiveAbilityName2 then
        print("已经抽取过第二个被动技能")
        return
    end
    local maxRefreshCount = lotteryStatus.maxRefreshCount or 0
    local currentRefreshCount = 0
    if event.type == "abilityActive" then
        currentRefreshCount = lotteryStatus.activeAbilityRefreshCount or 0
    elseif event.type == "abilityPassive" then
        currentRefreshCount = lotteryStatus.passiveAbilityRefreshCount or 0
    elseif event.type == "abilityPassive2" then
        currentRefreshCount = lotteryStatus.passiveAbilityRefreshCount2 or 0
    end
    if currentRefreshCount >= maxRefreshCount then
        print((("已达到最大刷新次数: " .. tostring(currentRefreshCount)) .. "/") .. tostring(maxRefreshCount))
        return
    end
    self:randomAbilityForPlayer(event.PlayerID, event.type)
    if event.type == "abilityActive" then
        lotteryStatus.activeAbilityRefreshCount = currentRefreshCount + 1
        lotteryStatus.isActiveAbilityRefreshed = lotteryStatus.activeAbilityRefreshCount >= maxRefreshCount
    elseif event.type == "abilityPassive" then
        lotteryStatus.passiveAbilityRefreshCount = currentRefreshCount + 1
        lotteryStatus.isPassiveAbilityRefreshed = lotteryStatus.passiveAbilityRefreshCount >= maxRefreshCount
    elseif event.type == "abilityPassive2" then
        lotteryStatus.passiveAbilityRefreshCount2 = currentRefreshCount + 1
        lotteryStatus.isPassiveAbilityRefreshed2 = lotteryStatus.passiveAbilityRefreshCount2 >= maxRefreshCount
    end
    CustomNetTables:SetTableValue("lottery_status", steamAccountID, lotteryStatus)
    print((((("[Lottery] 刷新成功: " .. event.type) .. ", 次数: ") .. tostring(currentRefreshCount + 1)) .. "/") .. tostring(maxRefreshCount))
end
function Lottery.prototype.InitAbilityReset(self, playerId)
    local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
    local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
    local currentCount = lotteryStatus.abilityResettableCount or 0
    print("[Lottery] InitAbilityReset currentCount", currentCount)
    lotteryStatus.abilityResettableCount = currentCount + 1
    lotteryStatus.showAbilityResetButton = true
    print("[Lottery] InitAbilityReset", lotteryStatus)
    print("[Lottery] InitAbilityReset count", lotteryStatus.abilityResettableCount)
    CustomNetTables:SetTableValue("lottery_status", steamAccountID, lotteryStatus)
    return true
end
function Lottery.prototype.resetAbility(self, userId, event)
    local playerId = event.PlayerID
    local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
    local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
    local abilityType = event.type
    print("[Lottery] resetAbilityRow called for type: " .. abilityType)
    local resetCount = lotteryStatus.abilityResettableCount or 0
    if resetCount <= 0 then
        print("[Lottery] No ability reset count available")
        return
    end
    local pickedAbilityName
    local pickedBundle
    if abilityType == "abilityActive" then
        pickedAbilityName = lotteryStatus.activeAbilityName
        pickedBundle = lotteryStatus.activeAbilityBundle
    elseif abilityType == "abilityPassive" then
        pickedAbilityName = lotteryStatus.passiveAbilityName
        pickedBundle = lotteryStatus.passiveAbilityBundle
    elseif abilityType == "abilityPassive2" then
        pickedAbilityName = lotteryStatus.passiveAbilityName2
        pickedBundle = lotteryStatus.passiveAbilityBundle2
    else
        print("[Lottery] Ability type error")
        return
    end
    if not pickedAbilityName then
        print("[Lottery] No ability picked for this row")
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero then
        print("[Lottery] Hero not found")
        return
    end
    print("[Lottery] ability name", pickedAbilityName)
    local dangerousModifiers = self.dangerousAbilities[pickedAbilityName]
    if dangerousModifiers and #dangerousModifiers > 0 then
        local allPlayers = {}
        PlayerHelper:ForEachPlayer(function(____, pid)
            allPlayers[#allPlayers + 1] = pid
        end)
        local hasActiveModifier = false
        for ____, checkPlayerId in ipairs(allPlayers) do
            local playerHero = PlayerResource:GetSelectedHeroEntity(checkPlayerId)
            if playerHero then
                for ____, modifier in ipairs(dangerousModifiers) do
                    if playerHero:HasModifier(modifier) then
                        hasActiveModifier = true
                        print((("[Lottery] Found active modifier " .. modifier) .. " on player ") .. tostring(checkPlayerId))
                        break
                    end
                end
                if hasActiveModifier then
                    break
                end
            end
        end
        print("[Lottery] dangerous, check result", hasActiveModifier)
        if hasActiveModifier then
            print(("[Lottery] Cannot remove ability " .. pickedAbilityName) .. " - modifier still active")
            GameRules:SendCustomMessage("<font color='#FF0000'>⚠️ 技能使用中无法重置，稍后再试;This ability is being used, please try remove later</font>", 1, 0)
            return
        end
    end
    if pickedBundle then
        AwakeningLotteryGrantService:Cleanup(hero, pickedBundle, playerId)
        print("[Lottery] Removed awakening bundle: " .. pickedBundle.entryId)
    else
        local oldAbility = hero:FindAbilityByName(pickedAbilityName)
        if oldAbility then
            local abilityPoints = oldAbility:GetLevel()
            AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, pickedAbilityName)
            hero:RemoveAbility(pickedAbilityName)
            AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, pickedAbilityName)
            if abilityPoints > 0 then
                hero:SetAbilityPoints(hero:GetAbilityPoints() + abilityPoints)
            end
            print((("[Lottery] Removed ability: " .. pickedAbilityName) .. ", add ability points: ") .. tostring(abilityPoints))
        end
        if pickedAbilityName == "death_prophet_witchcraft2" then
            local witchcraftAbility = hero:FindAbilityByName("death_prophet_witchcraft")
            if witchcraftAbility then
                hero:RemoveAbility("death_prophet_witchcraft")
                print("[Lottery] Also removed death_prophet_witchcraft")
            end
        end
    end
    if abilityType == "abilityActive" then
        lotteryStatus.activeAbilityName = nil
        lotteryStatus.activeAbilityLevel = nil
        lotteryStatus.activeHotkeyAbilityName = nil
        lotteryStatus.activeAbilityBundle = nil
        lotteryStatus.isActiveAbilityRefreshed = false
        lotteryStatus.activeAbilityRefreshCount = 0
    elseif abilityType == "abilityPassive" then
        lotteryStatus.passiveAbilityName = nil
        lotteryStatus.passiveAbilityLevel = nil
        lotteryStatus.passiveHotkeyAbilityName = nil
        lotteryStatus.passiveAbilityBundle = nil
        lotteryStatus.isPassiveAbilityRefreshed = false
        lotteryStatus.passiveAbilityRefreshCount = 0
    elseif abilityType == "abilityPassive2" then
        lotteryStatus.passiveAbilityName2 = nil
        lotteryStatus.passiveAbilityLevel2 = nil
        lotteryStatus.passiveHotkeyAbilityName2 = nil
        lotteryStatus.passiveAbilityBundle2 = nil
        lotteryStatus.isPassiveAbilityRefreshed2 = false
        lotteryStatus.passiveAbilityRefreshCount2 = 0
    end
    self:randomAbilityForPlayer(playerId, abilityType)
    lotteryStatus.abilityResettableCount = resetCount - 1
    print("[Lottery] Ability reset count decreased to: " .. tostring(lotteryStatus.abilityResettableCount))
    CustomNetTables:SetTableValue("lottery_status", steamAccountID, lotteryStatus)
    print("[Lottery] resetAbilityRow completed")
end
Lottery = __TS__DecorateLegacy({reloadable}, Lottery)
____exports.Lottery = Lottery
_G.InitAbilityReset = function(____, playerId)
    return GameRules.Lottery:InitAbilityReset(playerId)
end
return ____exports
