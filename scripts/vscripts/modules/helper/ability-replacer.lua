local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/helper/ability-replacer.lua"
__TS__SourceMapTraceBack("modules/helper/ability-replacer.lua", {["11"] = 19,["12"] = 29,["13"] = 39,["14"] = 41,["15"] = 41,["16"] = 41,["17"] = 41,["18"] = 41,["19"] = 41,["20"] = 39,["21"] = 49,["22"] = 49,["23"] = 49,["24"] = 49,["25"] = 49,["26"] = 49,["27"] = 39,["28"] = 57,["29"] = 57,["30"] = 57,["31"] = 57,["32"] = 57,["33"] = 57,["34"] = 39,["35"] = 39,["36"] = 72,["37"] = 72,["38"] = 72,["39"] = 72,["40"] = 72,["41"] = 72,["42"] = 39,["43"] = 80,["44"] = 80,["45"] = 80,["46"] = 80,["47"] = 80,["48"] = 80,["49"] = 39,["50"] = 39,["51"] = 95,["52"] = 95,["53"] = 95,["54"] = 95,["55"] = 95,["56"] = 95,["57"] = 39,["58"] = 103,["59"] = 103,["60"] = 103,["61"] = 103,["62"] = 103,["63"] = 103,["64"] = 39,["65"] = 111,["66"] = 111,["67"] = 111,["68"] = 111,["69"] = 111,["70"] = 111,["71"] = 39,["72"] = 119,["73"] = 119,["74"] = 119,["75"] = 119,["76"] = 119,["77"] = 119,["78"] = 39,["79"] = 126,["80"] = 126,["81"] = 126,["82"] = 126,["83"] = 126,["84"] = 126,["85"] = 126,["86"] = 39,["87"] = 135,["88"] = 135,["89"] = 135,["90"] = 135,["91"] = 135,["92"] = 135,["93"] = 39,["94"] = 143,["95"] = 143,["96"] = 143,["97"] = 143,["98"] = 143,["99"] = 143,["100"] = 39,["101"] = 39,["102"] = 39,["103"] = 39,["104"] = 39,["105"] = 39,["106"] = 39,["107"] = 39,["108"] = 200,["109"] = 200,["110"] = 200,["111"] = 200,["112"] = 200,["113"] = 200,["114"] = 39,["115"] = 39,["116"] = 215,["117"] = 215,["118"] = 215,["119"] = 215,["120"] = 215,["121"] = 215,["122"] = 39,["123"] = 39,["124"] = 39,["125"] = 39,["126"] = 39,["127"] = 39,["128"] = 39,["129"] = 39,["130"] = 272,["131"] = 272,["132"] = 272,["133"] = 272,["134"] = 272,["135"] = 272,["136"] = 39,["137"] = 39,["138"] = 39,["139"] = 39,["140"] = 301,["141"] = 301,["142"] = 301,["143"] = 301,["144"] = 301,["145"] = 301,["146"] = 39,["147"] = 308,["148"] = 308,["149"] = 308,["150"] = 308,["151"] = 308,["152"] = 308,["153"] = 308,["154"] = 39,["155"] = 39,["156"] = 324,["157"] = 324,["158"] = 324,["159"] = 324,["160"] = 324,["161"] = 324,["162"] = 39,["163"] = 332,["164"] = 332,["165"] = 332,["166"] = 332,["167"] = 332,["168"] = 332,["169"] = 39,["170"] = 39,["171"] = 39,["172"] = 39,["173"] = 361,["174"] = 361,["175"] = 361,["176"] = 361,["177"] = 361,["178"] = 361,["179"] = 39,["180"] = 39,["181"] = 39,["182"] = 39,["183"] = 39,["184"] = 397,["185"] = 397,["186"] = 397,["187"] = 397,["188"] = 397,["189"] = 397,["190"] = 39,["191"] = 405,["192"] = 405,["193"] = 405,["194"] = 405,["195"] = 405,["196"] = 405,["197"] = 39,["198"] = 39,["199"] = 39,["200"] = 39,["201"] = 39,["202"] = 441,["203"] = 441,["204"] = 441,["205"] = 441,["206"] = 441,["207"] = 441,["208"] = 39,["209"] = 449,["210"] = 449,["211"] = 449,["212"] = 449,["213"] = 449,["214"] = 449,["215"] = 39,["216"] = 457,["217"] = 457,["218"] = 457,["219"] = 457,["220"] = 457,["221"] = 457,["222"] = 39,["223"] = 39,["224"] = 39,["225"] = 39,["226"] = 486,["227"] = 486,["228"] = 486,["229"] = 486,["230"] = 486,["231"] = 486,["232"] = 486,["233"] = 39,["234"] = 39,["235"] = 39,["236"] = 39,["237"] = 516,["238"] = 516,["239"] = 516,["240"] = 516,["241"] = 516,["242"] = 516,["243"] = 39,["244"] = 39,["245"] = 531,["246"] = 531,["247"] = 531,["248"] = 531,["249"] = 531,["250"] = 531,["251"] = 39,["252"] = 539,["253"] = 539,["254"] = 539,["255"] = 539,["256"] = 539,["257"] = 539,["258"] = 39,["259"] = 39,["260"] = 554,["261"] = 554,["262"] = 554,["263"] = 554,["264"] = 554,["265"] = 554,["266"] = 554,["267"] = 39,["268"] = 39,["269"] = 39,["270"] = 577,["271"] = 577,["272"] = 577,["273"] = 577,["274"] = 577,["275"] = 577,["276"] = 577,["277"] = 39,["278"] = 586,["279"] = 586,["280"] = 586,["281"] = 586,["282"] = 586,["283"] = 586,["284"] = 586,["285"] = 39,["286"] = 39,["287"] = 39,["288"] = 39,["289"] = 39,["290"] = 39,["291"] = 630,["292"] = 630,["293"] = 630,["294"] = 630,["295"] = 630,["296"] = 630,["297"] = 630,["298"] = 39,["299"] = 39,["300"] = 39,["301"] = 39,["302"] = 660,["303"] = 660,["304"] = 660,["305"] = 660,["306"] = 660,["307"] = 660,["308"] = 39,["309"] = 39,["310"] = 39,["311"] = 676,["312"] = 676,["313"] = 676,["315"] = 676,["316"] = 677,["317"] = 678,["318"] = 678,["319"] = 678,["320"] = 678,["321"] = 677,["322"] = 689,["323"] = 690,["324"] = 692,["325"] = 693,["326"] = 693,["327"] = 693,["328"] = 694,["329"] = 696,["330"] = 697,["332"] = 699,["334"] = 693,["335"] = 693,["337"] = 705,["338"] = 705,["339"] = 705,["340"] = 707,["343"] = 712,["346"] = 717,["349"] = 722,["350"] = 723,["351"] = 723,["352"] = 723,["353"] = 724,["354"] = 723,["355"] = 723,["356"] = 705,["357"] = 705,["358"] = 689,["359"] = 732,["360"] = 737,["361"] = 738,["362"] = 738,["363"] = 738,["364"] = 740,["367"] = 745,["368"] = 746,["369"] = 747,["370"] = 748,["371"] = 749,["372"] = 749,["373"] = 749,["374"] = 749,["375"] = 750,["378"] = 755,["379"] = 756,["380"] = 757,["381"] = 758,["382"] = 759,["386"] = 765,["387"] = 768,["388"] = 769,["389"] = 770,["390"] = 771,["391"] = 772,["392"] = 773,["395"] = 779,["396"] = 783,["397"] = 784,["398"] = 785,["399"] = 786,["400"] = 787,["401"] = 788,["402"] = 789,["403"] = 790,["404"] = 791,["405"] = 792,["407"] = 796,["408"] = 797,["409"] = 798,["414"] = 805,["415"] = 806,["416"] = 807,["417"] = 808,["418"] = 809,["419"] = 810,["420"] = 811,["421"] = 812,["422"] = 813,["423"] = 814,["425"] = 816,["426"] = 817,["429"] = 820,["430"] = 821,["431"] = 821,["432"] = 821,["433"] = 822,["436"] = 825,["437"] = 826,["438"] = 827,["439"] = 828,["440"] = 829,["441"] = 830,["443"] = 821,["444"] = 821,["446"] = 836,["447"] = 837,["448"] = 838,["449"] = 839,["450"] = 840,["452"] = 844,["454"] = 849,["455"] = 850,["456"] = 851,["457"] = 852,["458"] = 853,["461"] = 732,["462"] = 861,["463"] = 861,["464"] = 861,["466"] = 862,["467"] = 862,["468"] = 862,["469"] = 863,["470"] = 864,["471"] = 865,["472"] = 866,["474"] = 862,["475"] = 862,["476"] = 861,["477"] = 871,["478"] = 874,["479"] = 874,["481"] = 876,["482"] = 876,["483"] = 876,["484"] = 876,["485"] = 881,["486"] = 882,["487"] = 882,["488"] = 882,["489"] = 883,["490"] = 884,["491"] = 884,["492"] = 884,["493"] = 885,["494"] = 884,["495"] = 884,["496"] = 882,["497"] = 882,["500"] = 891,["501"] = 892,["502"] = 893,["503"] = 893,["504"] = 893,["505"] = 893,["508"] = 897,["509"] = 897,["510"] = 897,["511"] = 898,["512"] = 899,["513"] = 900,["514"] = 901,["516"] = 897,["517"] = 897,["518"] = 871});
local ____exports = {}
local SPECIAL_ABILITY_STEAM_IDS = {"43680459909"}
local EXTENDED_STEAM_IDS = {"43680459909"}
local ABILITY_REPLACEMENTS = {
    {
        heroName = "npc_dota_hero_sniper",
        targetAbility = "sniper_assassinate",
        newAbility = "sniper_assassinate_upgrade",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_ogre_magi",
        targetAbility = "ogre_magi_dumb_luck",
        newAbility = "special_bonus_unique_ogre_magi_upgrade",
        newLevel = 1,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_mirana",
        targetSlot = 4,
        newAbility = "mirana_starfall2",
        newLevel = 1,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_rattletrap", newAbility = "clockwerk_auto_chainmail", newLevel = 0, requiredSteamIds = EXTENDED_STEAM_IDS},
    {
        heroName = "npc_dota_hero_axe",
        targetSlot = 3,
        newAbility = "axe_auto_culling_blade",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_phantom_assassin",
        targetAbility = "phantom_assassin_phantom_strike",
        newAbility = "special_bonus_unique_phantom_assassin_upgrade",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_nyx_assassin", newAbility = "special_bonus_unique_nyx_assassin_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_spectre",
        targetAbility = "spectre_haunt",
        newAbility = "spectre_desolate_curse",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_skeleton_king",
        targetSlot = 4,
        newAbility = "death_burst_attack_growth",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_undying",
        targetAbility = "undying_tombstone",
        newAbility = "dark_seer_normal_punch3",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_pudge",
        targetAbility = "pudge_meat_hook",
        newAbility = "pudge_meat_hook_lua",
        newLevel = 0,
        dontApplyIfHasAbilities = {"pudge_meat_hook_lua_upgrade"}
    },
    {
        heroName = "npc_dota_hero_pudge",
        targetAbility = "pudge_meat_hook_lua",
        newAbility = "pudge_meat_hook_lua_upgrade",
        newLevel = 0,
        removeAbilities = {"pudge_meat_hook"},
        requiredSteamIds = {}
    },
    {
        heroName = "npc_dota_hero_juggernaut",
        targetAbility = "juggernaut_blade_fury",
        newAbility = "juggernaut_blade_fury_custom",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_arc_warden",
        targetSlot = 4,
        newAbility = "arc_warden_scepter2_fixed",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_slark", newAbility = "break_speed_limit", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_spirit_breaker", newAbility = "spirit_breaker_charge_invulnerability", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_dawnbreaker", newAbility = "special_bonus_unique_dawnbreaker_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_nevermore", newAbility = "special_bonus_unique_nevermore_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_pangolier", newAbility = "special_bonus_unique_pangolier_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_magnataur", newAbility = "special_bonus_unique_magnataur_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_monkey_king", newAbility = "special_bonus_unique_monkey_king_boundless_strike_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_necrolyte",
        targetAbility = "necrolyte_heartstopper_aura",
        newAbility = "necrolyte_heartstopper_aura_datadriven",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_faceless_void", newAbility = "special_bonus_unique_faceless_void_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_primal_beast",
        targetAbility = "primal_beast_onslaught",
        newAbility = "special_bonus_unique_primal_upgrade",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_ember_spirit", newAbility = "special_bonus_unique_ember_spirit_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_chaos_knight", newAbility = "special_bonus_unique_chaos_knight_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_centaur", newAbility = "special_bonus_unique_centaur_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_tiny", newAbility = "special_bonus_unique_tiny_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_tusk", newAbility = "special_bonus_unique_tusk_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_templar_assassin", newAbility = "special_bonus_unique_templar_assassin_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_vengefulspirit", newAbility = "special_bonus_unique_vengefulspirit_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_batrider",
        targetAbility = "batrider_flaming_lasso",
        newAbility = "imba_batrider_flaming_lasso_enhanced",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_alchemist", newAbility = "special_bonus_unique_alchemist_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_weaver", newAbility = "special_bonus_unique_weaver_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_ringmaster", newAbility = "special_bonus_unique_ring_master_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_naga_siren",
        targetAbility = "naga_siren_mirror_image",
        newAbility = "special_bonus_unique_naga_siren_upgrade",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_naga_siren",
        targetAbility = "naga_siren_song_of_the_siren",
        newAbility = "special_bonus_unique_naga_siren_song_of_the_siren_upgrade",
        triggerAbility = "special_bonus_unique_naga_siren_upgrade",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_grimstroke", newAbility = "special_bonus_unique_grimstroke_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_techies",
        targetAbility = "techies_land_mines",
        newAbility = "techies_land_mines2",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_bounty_hunter",
        targetSlot = 4,
        newAbility = "rob_equipment",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_witch_doctor", newAbility = "special_bonus_unique_witch_doctor_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_pugna", newAbility = "special_bonus_unique_pugna_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_warlock", newAbility = "special_bonus_unique_warlock_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_warlock",
        targetAbility = "warlock_rain_of_chaos",
        newAbility = "special_bonus_unique_warlock_upgrade_transform",
        newLevel = 0,
        requiredSteamIds = {}
    },
    {heroName = "npc_dota_hero_zuus", newAbility = "special_bonus_unique_zuus_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_lycan", newAbility = "special_bonus_unique_lycan_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_luna", newAbility = "special_bonus_unique_luna_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_legion_commander", newAbility = "special_bonus_unique_legion_commander_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_crystal_maiden",
        targetSlot = 4,
        newAbility = "create_mirror_dummy",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_enigma",
        targetSlot = 4,
        newAbility = "special_bonus_unique_enigma_upgrade",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_omniknight", newAbility = "special_bonus_unique_omniknight_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_oracle", newAbility = "special_bonus_unique_oracle_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_lina", newAbility = "special_bonus_unique_lina_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_snapfire", newAbility = "special_bonus_unique_snapfire_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_lion",
        targetSlot = 4,
        newAbility = "special_bonus_unique_lion_upgrade",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_enchantress",
        targetSlot = 4,
        newAbility = "special_bonus_unique_enchantress_upgrade",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_bane",
        targetSlot = 4,
        newAbility = "special_bonus_unique_bane_upgrade",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_rubick", newAbility = "special_bonus_unique_rubick_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_drow_ranger", newAbility = "medusa_split_shot2", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_antimage", newAbility = "special_bonus_unique_antimage_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_antimage",
        targetAbility = "antimage_mana_break",
        newAbility = "antimage_mana_break2",
        triggerAbility = "special_bonus_unique_antimage_upgrade",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_life_stealer", newAbility = "special_bonus_unique_life_stealer_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_earthshaker", newAbility = "special_bonus_unique_earthshaker_upgrade", newLevel = 1, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_kez", newAbility = "special_bonus_unique_kez_upgrade", newLevel = 1, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_windrunner",
        targetAbility = "windrunner_focusfire_cancel",
        newAbility = "special_bonus_unique_windranger_upgrade",
        newLevel = 1,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_shadow_shaman", newAbility = "special_bonus_unique_shadow_shaman_upgrade", newLevel = 1, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_jakiro",
        targetAbility = "jakiro_double_trouble",
        newAbility = "special_bonus_unique_jakiro_upgrade",
        newLevel = 5,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_skywrath_mage",
        targetSlot = 4,
        newAbility = "skywrath_mage_mystic_flare_unit",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_winter_wyvern", newAbility = "special_bonus_unique_winter_wyvern_upgrade", newLevel = 1, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_tinker",
        targetAbility = "tinker_deploy_turrets",
        newAbility = "special_bonus_unique_tinker_upgrade",
        newLevel = 0,
        preserveLevel = true,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_phoenix", newAbility = "special_bonus_unique_phoenix_upgrade", newLevel = 1, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_leshrac", newAbility = "special_bonus_unique_leshrac_upgrade", newLevel = 1, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_abyss_sword",
        targetAbility = "abyss_sword_hidden_sharp",
        newAbility = "abyss_sword_hidden_sharp_upgrade",
        newLevel = 0,
        preserveLevel = true,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {
        heroName = "npc_dota_hero_visage",
        targetAbility = "abyss_sword_hidden_sharp",
        newAbility = "abyss_sword_hidden_sharp_upgrade",
        newLevel = 0,
        preserveLevel = true,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_muerta", newAbility = "special_bonus_unique_muerta_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_riki", newAbility = "special_bonus_unique_riki_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_dark_willow", newAbility = "special_bonus_unique_dark_willow_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_hoodwink", newAbility = "special_bonus_unique_hoodwink_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_kunkka", newAbility = "special_bonus_unique_kunkka_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_huskar",
        targetAbility = "huskar_blood_magic",
        newAbility = "special_bonus_unique_huskar_upgrade",
        newLevel = 0,
        readdTargetAbility = true,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_sven", newAbility = "special_bonus_unique_sven_upgrade", newLevel = 1, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_keeper_of_the_light", newAbility = "special_bonus_unique_keeper_of_the_light_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {heroName = "npc_dota_hero_storm_spirit", newAbility = "special_bonus_unique_storm_spirit_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS},
    {
        heroName = "npc_dota_hero_storm_spirit",
        targetAbility = "storm_spirit_overload",
        newAbility = "storm_spirit_overload2",
        newLevel = 0,
        requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS
    },
    {heroName = "npc_dota_hero_troll_warlord", newAbility = "special_bonus_unique_troll_warlord_upgrade", newLevel = 0, requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS}
}
____exports.AbilityReplacer = __TS__Class()
local AbilityReplacer = ____exports.AbilityReplacer
AbilityReplacer.name = "AbilityReplacer"
function AbilityReplacer.prototype.____constructor(self)
end
function AbilityReplacer.HasAwakeningAbility(self, hero)
    return __TS__ArraySome(
        ABILITY_REPLACEMENTS,
        function(____, replacement) return replacement.heroName == hero:GetName() and hero:HasAbility(replacement.newAbility) end
    )
end
function AbilityReplacer.applyReplacements(self, hero, steamAccountId)
    local steamIdStr = tostring(steamAccountId)
    if __TS__ArrayIncludes(SPECIAL_ABILITY_STEAM_IDS, steamIdStr) then
        Timers:CreateTimer(
            0.5,
            function()
                local item = hero:AddItemByName("item_ability_rp")
                if item ~= nil then
                    print("[AbilityReplacer] Added item_ability_rp to " .. hero:GetName())
                else
                    print("[AbilityReplacer] WARNING: Failed to add item_ability_rp to " .. hero:GetName())
                end
            end
        )
    end
    __TS__ArrayForEach(
        ABILITY_REPLACEMENTS,
        function(____, replacement)
            if hero:GetName() ~= replacement.heroName then
                return
            end
            if replacement.requiredSteamIds and not __TS__ArrayIncludes(replacement.requiredSteamIds, steamIdStr) then
                return
            end
            if replacement.dontApplySteamIds and __TS__ArrayIncludes(replacement.dontApplySteamIds, steamIdStr) then
                return
            end
            local delay = replacement.delay or 0.5
            Timers:CreateTimer(
                delay,
                function()
                    self:executeReplacement(hero, replacement)
                end
            )
        end
    )
end
function AbilityReplacer.executeReplacement(self, hero, replacement)
    if replacement.dontApplyIfHasAbilities and __TS__ArraySome(
        replacement.dontApplyIfHasAbilities,
        function(____, abilityName) return hero:HasAbility(abilityName) end
    ) then
        print(((("[AbilityReplacer] Skipped " .. replacement.newAbility) .. " on ") .. hero:GetName()) .. " because a higher-priority ability is present")
        return
    end
    if not replacement.targetAbility and replacement.targetSlot == nil then
        local existing = hero:FindAbilityByName(replacement.newAbility)
        if existing ~= nil then
            local level = replacement.newLevel or 0
            existing:SetLevel(math.max(
                existing:GetLevel(),
                level
            ))
            print((((("[AbilityReplacer] Leveled existing " .. replacement.newAbility) .. " to at least ") .. tostring(level)) .. " on ") .. hero:GetName())
            return
        end
        local newAbility = hero:AddAbility(replacement.newAbility)
        if newAbility ~= nil then
            local level = replacement.newLevel or 0
            newAbility:SetLevel(level)
            print((((("[AbilityReplacer] Added " .. replacement.newAbility) .. " (level ") .. tostring(level)) .. ") to ") .. hero:GetName())
        end
        return
    end
    local targetAbilityName
    if replacement.targetAbility then
        targetAbilityName = replacement.targetAbility
    elseif replacement.targetSlot ~= nil then
        local ability = hero:GetAbilityByIndex(replacement.targetSlot)
        if ability then
            targetAbilityName = ability:GetName()
        end
    end
    if replacement.targetSlot ~= nil and targetAbilityName and targetAbilityName ~= "generic_hidden" then
        local oldAbility = hero:FindAbilityByName(targetAbilityName)
        if oldAbility ~= nil then
            local savedLevel = oldAbility:GetLevel()
            hero:RemoveAbility(targetAbilityName)
            hero:SetAbilityPoints(hero:GetAbilityPoints() + savedLevel)
            local newAbility = hero:AddAbility(replacement.newAbility)
            if newAbility ~= nil then
                local level = replacement.newLevel or 0
                newAbility:SetLevel(level)
                print((((("[AbilityReplacer] Inserted " .. replacement.newAbility) .. " at slot ") .. tostring(replacement.targetSlot)) .. ", re-added ") .. targetAbilityName)
            end
            local reAdded = hero:AddAbility(targetAbilityName)
            if reAdded ~= nil then
                reAdded:SetLevel(savedLevel)
            end
        end
        return
    end
    local oldLevel = 0
    local removedTargetAbility = false
    if targetAbilityName then
        local oldAbility = hero:FindAbilityByName(targetAbilityName)
        if oldAbility ~= nil then
            oldLevel = oldAbility:GetLevel()
            hero:RemoveAbility(targetAbilityName)
            removedTargetAbility = true
            hero:SetAbilityPoints(hero:GetAbilityPoints() + oldLevel)
            print((("[AbilityReplacer] Removed " .. targetAbilityName) .. " from ") .. hero:GetName())
        end
        if replacement.preserveLevel then
            replacement = __TS__ObjectAssign({}, replacement, {newLevel = oldLevel})
        end
    end
    if replacement.removeAbilities then
        __TS__ArrayForEach(
            replacement.removeAbilities,
            function(____, abilityName)
                if abilityName == replacement.newAbility or abilityName == targetAbilityName then
                    return
                end
                local ability = hero:FindAbilityByName(abilityName)
                if ability ~= nil then
                    local removedLevel = ability:GetLevel()
                    hero:RemoveAbility(abilityName)
                    hero:SetAbilityPoints(hero:GetAbilityPoints() + removedLevel)
                    print((("[AbilityReplacer] Removed extra " .. abilityName) .. " from ") .. hero:GetName())
                end
            end
        )
    end
    local newAbility = hero:AddAbility(replacement.newAbility)
    if newAbility ~= nil then
        local level = replacement.newLevel or 0
        newAbility:SetLevel(level)
        print((((("[AbilityReplacer] Added " .. replacement.newAbility) .. " (level ") .. tostring(level)) .. ") to ") .. hero:GetName())
    else
        print((("[AbilityReplacer] WARNING: Failed to add " .. replacement.newAbility) .. " to ") .. hero:GetName())
    end
    if replacement.readdTargetAbility and targetAbilityName and removedTargetAbility then
        local reAdded = hero:AddAbility(targetAbilityName)
        if reAdded ~= nil then
            reAdded:SetLevel(oldLevel)
            print((((("[AbilityReplacer] Re-added " .. targetAbilityName) .. " (level ") .. tostring(oldLevel)) .. ") to ") .. hero:GetName())
        end
    end
end
function AbilityReplacer.addAbility(self, hero, abilityName, level)
    if level == nil then
        level = 0
    end
    Timers:CreateTimer(
        0.5,
        function()
            local ability = hero:AddAbility(abilityName)
            if ability ~= nil then
                ability:SetLevel(level)
                print((((("[AbilityReplacer] Added " .. abilityName) .. " (level ") .. tostring(level)) .. ") to ") .. hero:GetName())
            end
        end
    )
end
function AbilityReplacer.applySpecificAwakening(self, hero, newAbility, level)
    if level == nil then
        level = 0
    end
    local replacements = __TS__ArrayFilter(
        ABILITY_REPLACEMENTS,
        function(____, item) return item.heroName == hero:GetName() and (item.newAbility == newAbility or item.triggerAbility == newAbility) end
    )
    if #replacements > 0 then
        __TS__ArrayForEach(
            replacements,
            function(____, replacement)
                local delay = replacement.delay or 0.5
                Timers:CreateTimer(
                    delay,
                    function()
                        self:executeReplacement(hero, replacement)
                    end
                )
            end
        )
        return
    end
    local existing = hero:FindAbilityByName(newAbility)
    if existing ~= nil then
        existing:SetLevel(math.max(
            existing:GetLevel(),
            level
        ))
        return
    end
    Timers:CreateTimer(
        0.5,
        function()
            local ability = hero:AddAbility(newAbility)
            if ability ~= nil then
                ability:SetLevel(level)
                print((("[AbilityReplacer] Added fallback awakening " .. newAbility) .. " to ") .. hero:GetName())
            end
        end
    )
end
return ____exports
