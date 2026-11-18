local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/event-entity-killed.lua"
__TS__SourceMapTraceBack("modules/event/event-entity-killed.lua", {["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 3,["19"] = 3,["20"] = 4,["21"] = 4,["22"] = 5,["23"] = 5,["24"] = 12,["25"] = 12,["26"] = 12,["28"] = 36,["29"] = 37,["30"] = 38,["31"] = 39,["32"] = 40,["33"] = 41,["34"] = 42,["35"] = 42,["36"] = 42,["37"] = 42,["38"] = 42,["39"] = 42,["40"] = 42,["41"] = 50,["42"] = 52,["43"] = 52,["44"] = 52,["45"] = 52,["46"] = 52,["47"] = 52,["48"] = 52,["49"] = 435,["50"] = 435,["51"] = 435,["52"] = 435,["53"] = 435,["54"] = 435,["55"] = 435,["56"] = 435,["57"] = 435,["58"] = 435,["59"] = 435,["60"] = 435,["61"] = 435,["62"] = 435,["63"] = 435,["64"] = 435,["65"] = 435,["66"] = 435,["67"] = 435,["68"] = 435,["69"] = 435,["70"] = 435,["71"] = 435,["72"] = 435,["73"] = 435,["74"] = 435,["75"] = 435,["76"] = 435,["77"] = 435,["78"] = 435,["79"] = 435,["80"] = 435,["81"] = 435,["82"] = 435,["83"] = 435,["84"] = 435,["85"] = 435,["86"] = 435,["87"] = 435,["88"] = 435,["89"] = 435,["90"] = 435,["91"] = 435,["92"] = 435,["93"] = 435,["94"] = 435,["95"] = 435,["96"] = 435,["97"] = 435,["98"] = 435,["99"] = 435,["100"] = 435,["101"] = 441,["102"] = 442,["103"] = 443,["104"] = 479,["105"] = 482,["106"] = 483,["107"] = 486,["108"] = 488,["109"] = 491,["110"] = 491,["111"] = 491,["112"] = 491,["113"] = 491,["114"] = 491,["115"] = 491,["116"] = 491,["117"] = 491,["118"] = 501,["119"] = 502,["120"] = 503,["121"] = 505,["122"] = 505,["123"] = 505,["124"] = 505,["125"] = 505,["126"] = 505,["127"] = 505,["128"] = 505,["129"] = 505,["130"] = 505,["131"] = 516,["132"] = 517,["133"] = 518,["134"] = 123,["135"] = 123,["136"] = 123,["137"] = 123,["138"] = 123,["139"] = 124,["140"] = 124,["141"] = 124,["142"] = 125,["143"] = 126,["144"] = 124,["145"] = 124,["146"] = 122,["147"] = 130,["148"] = 131,["149"] = 132,["150"] = 133,["153"] = 136,["154"] = 137,["156"] = 141,["157"] = 142,["160"] = 145,["161"] = 146,["163"] = 148,["164"] = 149,["165"] = 150,["166"] = 151,["168"] = 130,["169"] = 155,["170"] = 156,["171"] = 157,["172"] = 157,["173"] = 157,["174"] = 157,["175"] = 155,["176"] = 160,["177"] = 161,["178"] = 160,["179"] = 164,["180"] = 165,["181"] = 164,["182"] = 168,["183"] = 169,["186"] = 173,["187"] = 173,["188"] = 176,["189"] = 179,["190"] = 179,["191"] = 173,["192"] = 173,["193"] = 182,["194"] = 183,["196"] = 168,["197"] = 187,["198"] = 188,["201"] = 191,["204"] = 195,["205"] = 196,["206"] = 197,["207"] = 198,["210"] = 201,["213"] = 204,["216"] = 208,["217"] = 209,["220"] = 213,["221"] = 214,["222"] = 215,["223"] = 197,["224"] = 220,["225"] = 221,["227"] = 187,["228"] = 225,["229"] = 226,["230"] = 227,["231"] = 227,["232"] = 227,["233"] = 227,["234"] = 228,["235"] = 229,["236"] = 225,["237"] = 236,["238"] = 237,["239"] = 239,["240"] = 240,["241"] = 241,["244"] = 245,["245"] = 246,["246"] = 247,["247"] = 248,["249"] = 250,["250"] = 236,["251"] = 253,["252"] = 257,["255"] = 261,["256"] = 262,["257"] = 263,["258"] = 264,["261"] = 268,["262"] = 269,["265"] = 273,["266"] = 274,["267"] = 263,["268"] = 277,["269"] = 278,["271"] = 253,["272"] = 284,["273"] = 285,["276"] = 289,["277"] = 290,["278"] = 291,["281"] = 295,["282"] = 296,["283"] = 297,["286"] = 301,["287"] = 302,["290"] = 306,["291"] = 306,["292"] = 306,["293"] = 307,["294"] = 308,["297"] = 312,["298"] = 306,["299"] = 306,["300"] = 284,["301"] = 316,["302"] = 317,["304"] = 318,["305"] = 318,["307"] = 319,["308"] = 320,["309"] = 321,["311"] = 324,["314"] = 318,["317"] = 326,["318"] = 316,["319"] = 329,["320"] = 330,["321"] = 331,["322"] = 332,["325"] = 335,["328"] = 339,["329"] = 331,["330"] = 341,["331"] = 329,["332"] = 344,["333"] = 345,["334"] = 346,["336"] = 349,["337"] = 350,["338"] = 351,["341"] = 355,["342"] = 356,["345"] = 360,["346"] = 361,["348"] = 350,["349"] = 364,["350"] = 344,["351"] = 367,["352"] = 371,["355"] = 374,["358"] = 378,["359"] = 379,["362"] = 383,["363"] = 367,["364"] = 386,["365"] = 387,["366"] = 387,["367"] = 387,["368"] = 389,["371"] = 394,["372"] = 398,["375"] = 402,["376"] = 403,["379"] = 406,["380"] = 407,["381"] = 408,["383"] = 411,["384"] = 412,["386"] = 415,["387"] = 415,["388"] = 415,["389"] = 415,["390"] = 416,["391"] = 416,["392"] = 416,["393"] = 416,["394"] = 420,["395"] = 420,["396"] = 420,["397"] = 420,["398"] = 416,["399"] = 416,["400"] = 416,["401"] = 387,["402"] = 387,["403"] = 386,["404"] = 426,["405"] = 427,["406"] = 428,["407"] = 429,["408"] = 426,["409"] = 445,["410"] = 446,["411"] = 448,["412"] = 449,["413"] = 450,["414"] = 451,["415"] = 452,["416"] = 453,["417"] = 454,["419"] = 456,["421"] = 466,["422"] = 467,["424"] = 471,["425"] = 471,["426"] = 471,["427"] = 471,["428"] = 473,["429"] = 445,["430"] = 519,["431"] = 522,["432"] = 524,["433"] = 527,["434"] = 528,["435"] = 529,["436"] = 530,["437"] = 531,["438"] = 532,["439"] = 533,["440"] = 534,["441"] = 535,["442"] = 536,["443"] = 537,["445"] = 541,["446"] = 542,["447"] = 543,["448"] = 544,["449"] = 545,["451"] = 549,["452"] = 552,["453"] = 519,["454"] = 555,["455"] = 556,["456"] = 558,["457"] = 560,["458"] = 562,["459"] = 564,["460"] = 573,["461"] = 576,["462"] = 577,["464"] = 579,["465"] = 579,["466"] = 581,["467"] = 579,["470"] = 583,["471"] = 587,["472"] = 589,["473"] = 589,["474"] = 589,["475"] = 590,["478"] = 592,["479"] = 595,["480"] = 597,["482"] = 599,["483"] = 597,["485"] = 597,["486"] = 601,["487"] = 602,["488"] = 603,["489"] = 603,["494"] = 589,["495"] = 589,["499"] = 625,["500"] = 625,["501"] = 625,["502"] = 626,["503"] = 627,["504"] = 628,["505"] = 629,["506"] = 630,["509"] = 625,["510"] = 625,["511"] = 634,["512"] = 636,["513"] = 641,["514"] = 648,["515"] = 648,["516"] = 648,["517"] = 648,["518"] = 648,["520"] = 655,["521"] = 657,["522"] = 662,["523"] = 669,["524"] = 669,["525"] = 669,["526"] = 669,["527"] = 669,["530"] = 555,["531"] = 680,["532"] = 681,["533"] = 683,["534"] = 683,["535"] = 683,["536"] = 684,["537"] = 685,["538"] = 687,["539"] = 688,["540"] = 688,["541"] = 688,["542"] = 688,["543"] = 688,["544"] = 688,["545"] = 694,["547"] = 697,["548"] = 698,["549"] = 683,["550"] = 683,["551"] = 680,["552"] = 704,["553"] = 705,["554"] = 706,["555"] = 708,["557"] = 710,["558"] = 708,["560"] = 708,["561"] = 712,["564"] = 715,["565"] = 704,["566"] = 718,["567"] = 719,["569"] = 721,["570"] = 721,["572"] = 722,["573"] = 723,["574"] = 724,["576"] = 727,["577"] = 727,["578"] = 728,["579"] = 729,["581"] = 732,["582"] = 733,["586"] = 721,["589"] = 737,["590"] = 718,["591"] = 740,["592"] = 740,["593"] = 740,["595"] = 742,["596"] = 743,["597"] = 745,["599"] = 748,["601"] = 740,["602"] = 753,["603"] = 754,["604"] = 755,["605"] = 757,["606"] = 760,["607"] = 766,["608"] = 769,["609"] = 770,["610"] = 776,["611"] = 777,["612"] = 777,["613"] = 777,["614"] = 777,["615"] = 777,["616"] = 783,["617"] = 784,["618"] = 785,["619"] = 786,["620"] = 787,["621"] = 788,["622"] = 789,["623"] = 790,["624"] = 793,["625"] = 794,["626"] = 799,["627"] = 805,["629"] = 808,["630"] = 809,["631"] = 810,["632"] = 811,["633"] = 812,["634"] = 814,["635"] = 815,["636"] = 816,["637"] = 817,["640"] = 821,["641"] = 822,["642"] = 823,["643"] = 824,["646"] = 828,["647"] = 829,["648"] = 830,["649"] = 831,["652"] = 835,["653"] = 836,["654"] = 837,["655"] = 838,["658"] = 842,["659"] = 843,["660"] = 844,["661"] = 845,["664"] = 849,["665"] = 850,["666"] = 853,["667"] = 854,["668"] = 856,["670"] = 857,["671"] = 857,["673"] = 858,["674"] = 860,["675"] = 861,["677"] = 863,["678"] = 864,["679"] = 866,["684"] = 857,["688"] = 873,["689"] = 874,["690"] = 875,["691"] = 877,["692"] = 878,["693"] = 879,["694"] = 880,["695"] = 880,["696"] = 880,["697"] = 880,["698"] = 881,["699"] = 882,["702"] = 886,["704"] = 888,["705"] = 888,["707"] = 889,["708"] = 891,["709"] = 892,["711"] = 894,["712"] = 895,["713"] = 897,["714"] = 898,["715"] = 901,["716"] = 903,["717"] = 903,["718"] = 903,["719"] = 903,["720"] = 903,["721"] = 903,["722"] = 903,["727"] = 888,["731"] = 909,["732"] = 910,["733"] = 910,["734"] = 910,["735"] = 911,["736"] = 911,["737"] = 911,["738"] = 911,["739"] = 911,["740"] = 911,["741"] = 911,["742"] = 911,["743"] = 913,["744"] = 914,["746"] = 910,["747"] = 910,["748"] = 753,["749"] = 920,["751"] = 921,["752"] = 921,["753"] = 922,["754"] = 923,["756"] = 921,["759"] = 926,["760"] = 920,["761"] = 929,["762"] = 929,["763"] = 929,["765"] = 930,["768"] = 934,["769"] = 935,["770"] = 936,["772"] = 938,["773"] = 939,["774"] = 941,["777"] = 945,["778"] = 945,["779"] = 945,["780"] = 945,["781"] = 948,["782"] = 949,["783"] = 950,["784"] = 950,["785"] = 950,["786"] = 951,["787"] = 952,["789"] = 950,["790"] = 950,["792"] = 958,["793"] = 960,["795"] = 960,["796"] = 960,["797"] = 960,["798"] = 960,["799"] = 960,["801"] = 959,["802"] = 961,["803"] = 962,["804"] = 963,["805"] = 963,["806"] = 963,["807"] = 964,["808"] = 965,["810"] = 963,["811"] = 963,["814"] = 929,["815"] = 972,["816"] = 976,["817"] = 977,["819"] = 980,["820"] = 981,["821"] = 982,["822"] = 983,["823"] = 984,["825"] = 986,["826"] = 988,["827"] = 988,["828"] = 988,["829"] = 988,["830"] = 989,["831"] = 989,["832"] = 989,["833"] = 989,["834"] = 993,["835"] = 993,["836"] = 993,["837"] = 993,["838"] = 989,["839"] = 989,["840"] = 989,["841"] = 996,["842"] = 972,["843"] = 1002,["844"] = 1005,["845"] = 1005,["847"] = 1006,["848"] = 1006,["850"] = 1008,["851"] = 1010,["853"] = 1012,["854"] = 1013,["855"] = 1014,["856"] = 1015,["857"] = 1016,["858"] = 1017,["859"] = 1018,["860"] = 1018,["861"] = 1018,["862"] = 1018,["863"] = 1019,["864"] = 1019,["865"] = 1019,["866"] = 1019,["867"] = 1023,["868"] = 1023,["869"] = 1023,["870"] = 1023,["871"] = 1019,["872"] = 1019,["873"] = 1019,["875"] = 1029,["876"] = 1031,["877"] = 1031,["878"] = 1031,["879"] = 1031,["881"] = 1033,["884"] = 1036,["885"] = 1002,["886"] = 13,["887"] = 14,["888"] = 15,["889"] = 16,["890"] = 17,["891"] = 18,["892"] = 19,["893"] = 20,["894"] = 21,["895"] = 21,["896"] = 21,["897"] = 21,["898"] = 21,["899"] = 21,["900"] = 21,["901"] = 21,["902"] = 21,["903"] = 21,["904"] = 21,["905"] = 21,["906"] = 21,["907"] = 35,["908"] = 55,["909"] = 55,["910"] = 55,["911"] = 55,["912"] = 55,["913"] = 55,["914"] = 55,["915"] = 55,["916"] = 55,["917"] = 55,["918"] = 55,["919"] = 55,["920"] = 55,["921"] = 55,["922"] = 55,["923"] = 55,["924"] = 55,["925"] = 55,["926"] = 55,["927"] = 55,["928"] = 55,["929"] = 55,["930"] = 55,["931"] = 55,["932"] = 55,["933"] = 55,["934"] = 55,["935"] = 55,["936"] = 55,["937"] = 55,["938"] = 55,["939"] = 55,["940"] = 55,["941"] = 55,["942"] = 55,["943"] = 55,["944"] = 55,["945"] = 55,["946"] = 55,["947"] = 55,["948"] = 55,["949"] = 55,["950"] = 55,["951"] = 55,["952"] = 55,["953"] = 55,["954"] = 55,["955"] = 55,["956"] = 55,["957"] = 55,["958"] = 55,["959"] = 55,["960"] = 55,["961"] = 55,["962"] = 55,["963"] = 55,["964"] = 55,["965"] = 55,["966"] = 55,["967"] = 55,["968"] = 55,["969"] = 55,["970"] = 55,["971"] = 55,["972"] = 55,["973"] = 55});
local ____exports = {}
local ____neutral_2Ditem = require("ai.item.neutral-item")
local NeutralItemManager = ____neutral_2Ditem.NeutralItemManager
local ____player = require("api.player")
local Player = ____player.Player
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____ability_2Dreplace_2Ditem_2Dlimit = require("modules.lottery.ability-replace.ability-replace-item-limit")
local AbilityReplaceItemLimit = ____ability_2Dreplace_2Ditem_2Dlimit.AbilityReplaceItemLimit
local ____skill_2Dtome_2Dauthorization = require("modules.lottery.skill-tome-authorization")
local SkillTomeAuthorization = ____skill_2Dtome_2Dauthorization.SkillTomeAuthorization
____exports.EventEntityKilled = __TS__Class()
local EventEntityKilled = ____exports.EventEntityKilled
EventEntityKilled.name = "EventEntityKilled"
function EventEntityKilled.prototype.____constructor(self)
    self.heroPossessionGrantedByTeam = {}
    self.hasDroppedGuardianAngelScroll = false
    self.hasDroppedItem_zhuque = false
    self.hasDroppedItem_baihu = false
    self.hasDroppedItem_xuanwu = false
    self.hasDroppedItem_qinglong = false
    self.specialSteamIDs = {
        "436804590",
        "180074451",
        "92159660",
        "370099556",
        "116431158"
    }
    self.windyNeutralItemConfig = NeutralItemManager:GetDefaultConfig()
    self.windyNeutralTierStartTimes = {
        0,
        6 * 60,
        12 * 60,
        18 * 60,
        24 * 60
    }
    self.dotaRespawnTime = {
        4,
        6,
        8,
        10,
        12,
        14,
        16,
        18,
        20,
        22,
        23,
        25,
        26,
        27,
        28,
        30,
        31,
        32,
        33,
        34,
        35,
        36,
        37,
        38,
        39,
        40,
        41,
        42,
        43,
        44,
        45,
        46,
        47,
        48,
        49,
        50,
        51,
        52,
        53,
        54,
        55,
        56,
        57,
        58,
        59,
        60,
        61,
        62,
        63,
        64
    }
    self.respawnTimeDefault = 60
    self.respawnTimeMin = 2
    self.respawnTimeMax = 100
    self.removeGoldBagDelay = 20
    self.itemLightPartName = "item_light_part"
    self.itemDarkPartName = "item_dark_part"
    self.itemTomeOfAbilityReset = "item_tome_of_ability_reset"
    self.dropItemChanceRoshanArtifactPart = 100
    self.dropItemListDragonBall = {
        "item_dragon_ball_1",
        "item_dragon_ball_2",
        "item_dragon_ball_3",
        "item_dragon_ball_4",
        "item_dragon_ball_5",
        "item_dragon_ball_6",
        "item_dragon_ball_7"
    }
    self.dropItemChanceRoshan = 100
    self.dropItemChanceAncient = 1
    self.dropItemChanceNeutral = 0.2
    self.dropItemListFusionMaterial = {
        "item_fusion_hawkeye",
        "item_fusion_forbidden",
        "item_fusion_brutal",
        "item_fusion_beast",
        "item_fusion_life",
        "item_fusion_shadow",
        "item_fusion_magic",
        "item_fusion_agile"
    }
    self.dropItemChanceFusionRoshan = 100
    self.dropItemChanceFusionAncient = 1
    self.dropItemChanceFusionNeutral = 0.2
    ListenToGameEvent(
        "entity_killed",
        function(____, keys) return self:OnEntityKilled(keys) end,
        self
    )
    Timers:CreateTimer(
        3,
        function()
            self:checkTower4Fallback()
            return 3
        end
    )
end
function EventEntityKilled.prototype.OnEntityKilled(self, keys)
    local killedUnit = EntIndexToHScript(keys.entindex_killed)
    local attacker = EntIndexToHScript(keys.entindex_attacker)
    if not killedUnit then
        return
    end
    if killedUnit:IsRealHero() and PlayerHelper:IsBotPlayer(killedUnit) then
        GameRules.AI:PauseAI(killedUnit)
    end
    if killedUnit:GetUnitName() == "npc_windy" then
        self:onWindyKilled(killedUnit, attacker)
        return
    end
    if self:isTower4(killedUnit) then
        self:onTower4Killed(killedUnit)
    end
    if killedUnit:IsRealHero() and not killedUnit:IsReincarnating() then
        self:onHeroKilled(killedUnit, attacker)
    elseif killedUnit:IsCreep() then
        self:onCreepKilled(killedUnit, attacker)
    end
end
function EventEntityKilled.prototype.isTower4(self, unit)
    local unitName = unit:GetUnitName()
    return __TS__ArraySome(
        ____exports.EventEntityKilled.TOWER4_NAMES,
        function(____, tower4Name) return __TS__StringIncludes(unitName, tower4Name) end
    )
end
function EventEntityKilled.prototype.onTower4Killed(self, tower)
    self:grantHeroPossessionToAffectedTeam(tower:GetTeamNumber())
end
function EventEntityKilled.prototype.checkTower4Fallback(self)
    self:checkTeamTower4Fallback(DOTA_TEAM_GOODGUYS, "goodguys_tower4")
end
function EventEntityKilled.prototype.checkTeamTower4Fallback(self, team, towerNameKeyword)
    if self.heroPossessionGrantedByTeam[team] then
        return
    end
    local remainingTower4Count = #__TS__ArrayFilter(
        Entities:FindAllByClassname("npc_dota_tower"),
        function(____, tower) return tower:GetTeamNumber() == team and tower:IsAlive() and __TS__StringIncludes(
            tower:GetUnitName(),
            towerNameKeyword
        ) end
    )
    if remainingTower4Count < 2 then
        self:grantHeroPossessionToAffectedTeam(team)
    end
end
function EventEntityKilled.prototype.grantHeroPossessionToAffectedTeam(self, team)
    if team ~= DOTA_TEAM_GOODGUYS then
        return
    end
    if self.heroPossessionGrantedByTeam[team] then
        return
    end
    self.heroPossessionGrantedByTeam[team] = true
    local grantCount = 0
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        if PlayerResource:GetTeam(playerId) ~= team then
            return
        end
        if not self:ShouldGrantHeroPossession(playerId) then
            return
        end
        local hero = PlayerResource:GetSelectedHeroEntity(playerId)
        if not hero or not hero:IsRealHero() then
            return
        end
        hero:AddItemByName(____exports.EventEntityKilled.HERO_POSSESSION_ITEM)
        grantCount = grantCount + 1
        print((((("[HeroPossession] granted " .. ____exports.EventEntityKilled.HERO_POSSESSION_ITEM) .. " to player ") .. tostring(playerId)) .. ", team=") .. tostring(team))
    end)
    if grantCount > 0 then
        GameRules:SendCustomMessage("己方门牙塔已破，属性等级90级以下玩家获得英灵附身支援。", 0, 0)
    end
end
function EventEntityKilled.prototype.ShouldGrantHeroPossession(self, playerId)
    local steamId = PlayerResource:GetSteamAccountID(playerId)
    local playerData = CustomNetTables:GetTableValue(
        "player_table",
        tostring(steamId)
    )
    local totalLevel = playerData and playerData.totalLevel or 0
    return totalLevel < ____exports.EventEntityKilled.HERO_POSSESSION_MAX_PROPERTY_LEVEL
end
function EventEntityKilled.prototype.onHeroKilled(self, hero, attacker)
    self:grantHumanPlayersBotItemDeathGold(hero)
    if GameRules.AbyssMode:IsEnabled() and PlayerHelper:IsBotPlayer(hero) then
        GameRules.AbyssMode:OnBotKilled(hero)
        self:dropTreasureChestForBotBoss(hero, attacker)
        return
    end
    self:grantBotKillPlayerGold(hero, attacker)
    self:setRespawnTime(hero)
    if not GameRules.AbyssMode:IsEnabled() and PlayerHelper:IsHumanPlayer(hero) then
        GameRules.Lottery:openNextStagedLotteryForPlayer(hero:GetPlayerOwnerID())
    end
    self:dropTreasureChestForBotBoss(hero, attacker)
end
function EventEntityKilled.prototype.grantBotKillPlayerGold(self, killedHero, attacker)
    if not PlayerHelper:IsHumanPlayer(killedHero) or not PlayerHelper:IsBotPlayer(attacker) then
        return
    end
    local gold = killedHero:GetLevel() * 200 + 2000
    local grantCount = 0
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsBotPlayerByPlayerId(playerId) then
            return
        end
        local botHero = PlayerResource:GetSelectedHeroEntity(playerId)
        if not botHero or not botHero:IsRealHero() then
            return
        end
        botHero:ModifyGold(gold, true, DOTA_ModifyGold_Unspecified)
        grantCount = grantCount + 1
    end)
    if grantCount > 0 then
        print(((((("[EventEntityKilled] Bot killed player " .. killedHero:GetUnitName()) .. ", granted ") .. tostring(gold)) .. " gold to ") .. tostring(grantCount)) .. " bots")
    end
end
function EventEntityKilled.prototype.grantHumanPlayersBotItemDeathGold(self, killedHero)
    if not PlayerHelper:IsBotPlayer(killedHero) or killedHero:GetTeamNumber() ~= DOTA_TEAM_BADGUYS then
        return
    end
    local itemWorth = self:getHeroItemWorth(killedHero)
    local baseGold = math.floor(itemWorth * ____exports.EventEntityKilled.BOT_DEATH_ITEM_GOLD_RATE)
    if baseGold <= 0 then
        return
    end
    local rewardPlayerIds = self:getSteamHumanPlayerIds()
    local divisor = self:getBotItemDeathGoldPlayerCount(rewardPlayerIds)
    if divisor <= 1 then
        return
    end
    local gold = math.floor(baseGold / divisor * (divisor - 1))
    if gold <= 0 then
        return
    end
    __TS__ArrayForEach(
        rewardPlayerIds,
        function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero or not hero:IsRealHero() then
                return
            end
            hero:ModifyGold(gold, true, DOTA_ModifyGold_Unspecified)
        end
    )
end
function EventEntityKilled.prototype.getHeroItemWorth(self, hero)
    local itemWorth = 0
    do
        local slot = 0
        while slot <= ____exports.EventEntityKilled.INVENTORY_SLOT_MAX do
            do
                local item = hero:GetItemInSlot(slot)
                if not item or item:IsNull() then
                    goto __continue47
                end
                itemWorth = itemWorth + item:GetCost()
            end
            ::__continue47::
            slot = slot + 1
        end
    end
    return itemWorth
end
function EventEntityKilled.prototype.getSteamHumanPlayerIds(self)
    local playerIds = {}
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        if PlayerResource:GetSteamAccountID(playerId) <= 0 then
            return
        end
        playerIds[#playerIds + 1] = playerId
    end)
    return playerIds
end
function EventEntityKilled.prototype.getBotItemDeathGoldPlayerCount(self, humanPlayerIds)
    if not IsInToolsMode() then
        return #humanPlayerIds
    end
    local count = 0
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if PlayerResource:GetTeam(playerId) ~= DOTA_TEAM_GOODGUYS then
            return
        end
        local hero = PlayerResource:GetSelectedHeroEntity(playerId)
        if not hero or not hero:IsRealHero() then
            return
        end
        if __TS__ArrayIncludes(humanPlayerIds, playerId) or PlayerHelper:IsBotPlayerByPlayerId(playerId) then
            count = count + 1
        end
    end)
    return count
end
function EventEntityKilled.prototype.dropTreasureChestForBotBoss(self, hero, attacker)
    if not hero.isBoss then
        return
    end
    if not PlayerHelper:IsHumanPlayer(attacker) then
        return
    end
    if GameRules.AbyssMode:IsEnabled() then
        self:dropAbyssBossRewards(hero, attacker)
        return
    end
    self:dropItem(hero, {____exports.EventEntityKilled.TREASURE_CHEST_ITEM}, 10, false)
end
function EventEntityKilled.prototype.dropAbyssBossRewards(self, boss, attacker)
    __TS__ArrayForEach(
        ____exports.EventEntityKilled.ABYSS_BOSS_REWARD_ITEMS,
        function(____, itemName)
            if itemName == AbilityReplaceItemLimit.ITEM_NAME and not AbilityReplaceItemLimit:canDropFromAbyssBoss() then
                return
            end
            local dropChance = itemName == "item_tome_of_ability_replace" and ____exports.EventEntityKilled.ABYSS_BOSS_REWARD_DROP_CHANCE / 2 or ____exports.EventEntityKilled.ABYSS_BOSS_REWARD_DROP_CHANCE
            if RandomFloat(0, 100) > dropChance then
                return
            end
            local item = CreateItem(itemName, nil, nil)
            if not item then
                return
            end
            SkillTomeAuthorization:authorizeItem(item, itemName)
            if itemName == AbilityReplaceItemLimit.ITEM_NAME then
                AbilityReplaceItemLimit:markDroppedFromAbyssBoss()
            end
            if itemName == "item_skill_learning" then
                self:initializeDroppedSkillLearningBook(item, attacker)
            end
            CreateItemOnPositionSync(
                boss:GetAbsOrigin(),
                item
            )
            item:LaunchLoot(
                false,
                300,
                0.75,
                boss:GetAbsOrigin():__add(Vector(
                    RandomInt(-100, 100),
                    RandomInt(-100, 100),
                    0
                )),
                nil
            )
        end
    )
end
function EventEntityKilled.prototype.initializeDroppedSkillLearningBook(self, item, attacker)
    local skillLearningItem = item
    local randomAbility = skillLearningItem:GetRandomLotteryAbility(attacker)
    skillLearningItem:SetStoredAbility({ability_name = randomAbility.name, ability_level = randomAbility.level or 1})
end
function EventEntityKilled.prototype.setRespawnTime(self, hero)
    hero:SetTimeUntilRespawn(self.respawnTimeDefault)
    local level = hero:GetLevel()
    local respawnTimeRate = GameRules.Option.respawnTimePercentage / 100
    print("[options]", respawnTimeRate)
    local respawnTime = 0
    local levelIndex = level - 1
    if levelIndex < #self.dotaRespawnTime then
        respawnTime = math.ceil(self.dotaRespawnTime[levelIndex + 1] * respawnTimeRate)
    else
        respawnTime = math.ceil((level / 4 + 52) * respawnTimeRate)
    end
    if Player:IsMemberStatic(PlayerResource:GetSteamAccountID(hero:GetPlayerOwnerID())) then
        respawnTime = respawnTime - 5
    end
    respawnTime = math.max(
        self.respawnTimeMin,
        math.min(self.respawnTimeMax, respawnTime)
    )
    hero:SetTimeUntilRespawn(respawnTime)
end
function EventEntityKilled.prototype.calculateDropChance(self, baseChance)
    local difficulty = GameRules.Option.direGoldXpMultiplier or 1
    local playerCount = Player:GetPlayerCount()
    local difficultyMultiplier = 1
    if difficulty >= 60 then
        difficultyMultiplier = 3
    elseif difficulty >= 40 then
        difficultyMultiplier = 2.5
    elseif difficulty >= 20 then
        difficultyMultiplier = 2
    elseif difficulty >= 12 then
        difficultyMultiplier = 1.5
    elseif difficulty >= 1 then
        difficultyMultiplier = 1
    end
    local playerMultiplier = 1
    if playerCount >= 6 then
        playerMultiplier = 1.5
    elseif playerCount >= 3 then
        playerMultiplier = 1.2
    end
    local finalChance = baseChance * difficultyMultiplier * playerMultiplier
    return math.min(finalChance, 100)
end
function EventEntityKilled.prototype.onCreepKilled(self, creep, attacker)
    local creepName = creep:GetName()
    if creepName == "npc_dota_roshan" then
        self:OrderHighestLevelBotToPickupDroppedAegis()
        if PlayerHelper:IsGoodTeamUnit(attacker) then
            self.dropItemListDragonBall = self:dropItem(creep, self.dropItemListDragonBall, self.dropItemChanceRoshan, true)
            self:dropItem(creep, {"item_skill_learning"}, 60, false)
            local maxDropCount = math.floor(Player:GetPlayerCount() / 4)
            local dropCount = RandomInt(1, maxDropCount)
            do
                local i = 0
                while i < dropCount do
                    self:dropItem(creep, self.dropItemListFusionMaterial, self.dropItemChanceFusionRoshan)
                    i = i + 1
                end
            end
            local attackerSteamID = attacker and attacker:IsRealHero() and tostring(PlayerResource:GetSteamAccountID(attacker:GetPlayerOwnerID())) or nil
            if attackerSteamID and attackerSteamID ~= "335880293" then
                Timers:CreateTimer(
                    0.1,
                    function()
                        if not attacker or not attacker:IsHero() then
                            return
                        end
                        local itemDrops = Entities:FindAllByClassname("dota_item_drop")
                        for ____, item in ipairs(itemDrops) do
                            local ____temp_4 = item and not item:IsNull()
                            if ____temp_4 then
                                local ____opt_2 = item:GetContainedItem()
                                ____temp_4 = (____opt_2 and ____opt_2:GetName()) == "item_roshans_banner"
                            end
                            if ____temp_4 then
                                item:RemoveSelf()
                                local ability = attacker:AddAbility("ability_banner")
                                if ability ~= nil then
                                    ability:SetLevel(1)
                                end
                                break
                            end
                        end
                    end
                )
            end
        else
        end
        Timers:CreateTimer(
            self.removeGoldBagDelay,
            function()
                local goldBags = Entities:FindAllByClassname("dota_item_drop")
                for ____, goldBag in ipairs(goldBags) do
                    local itemName = goldBag:GetContainedItem():GetName()
                    if itemName == "item_bag_of_gold" then
                        goldBag:RemoveSelf()
                    end
                end
            end
        )
    elseif creep:IsAncient() then
        if PlayerHelper:IsHumanPlayer(attacker) then
            self.dropItemListDragonBall = self:dropItem(creep, self.dropItemListDragonBall, self.dropItemChanceAncient, true)
            self:dropItem(
                creep,
                self.dropItemListFusionMaterial,
                self:calculateDropChance(self.dropItemChanceFusionAncient)
            )
        end
    elseif creep:IsNeutralUnitType() then
        if PlayerHelper:IsHumanPlayer(attacker) then
            self.dropItemListDragonBall = self:dropItem(creep, self.dropItemListDragonBall, self.dropItemChanceNeutral, true)
            self:dropItem(
                creep,
                self.dropItemListFusionMaterial,
                self:calculateDropChance(self.dropItemChanceFusionNeutral)
            )
        end
    end
end
function EventEntityKilled.prototype.OrderHighestLevelBotToPickupDroppedAegis(self)
    local retryCount = 0
    Timers:CreateTimer(
        ____exports.EventEntityKilled.BOT_AEGIS_PICKUP_RETRY_INTERVAL,
        function()
            local aegisDrop = self:FindDroppedAegis()
            local bot = self:FindHighestLevelBotHero()
            if aegisDrop and bot then
                ExecuteOrderFromTable({
                    UnitIndex = bot:entindex(),
                    OrderType = DOTA_UNIT_ORDER_PICKUP_ITEM,
                    TargetIndex = aegisDrop:entindex(),
                    Queue = false
                })
                return nil
            end
            retryCount = retryCount + 1
            return retryCount < ____exports.EventEntityKilled.BOT_AEGIS_PICKUP_RETRY_COUNT and ____exports.EventEntityKilled.BOT_AEGIS_PICKUP_RETRY_INTERVAL or nil
        end
    )
end
function EventEntityKilled.prototype.FindDroppedAegis(self)
    local itemDrops = Entities:FindAllByClassname("dota_item_drop")
    for ____, itemDrop in ipairs(itemDrops) do
        local ____temp_9 = itemDrop and not itemDrop:IsNull()
        if ____temp_9 then
            local ____opt_7 = itemDrop:GetContainedItem()
            ____temp_9 = (____opt_7 and ____opt_7:GetName()) == "item_aegis"
        end
        if ____temp_9 then
            return itemDrop
        end
    end
    return nil
end
function EventEntityKilled.prototype.FindHighestLevelBotHero(self)
    local selectedHero
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local playerId = i
                if not PlayerHelper:IsBotPlayerByPlayerId(playerId) then
                    goto __continue110
                end
                local ____opt_10 = PlayerResource:GetPlayer(playerId)
                local hero = ____opt_10 and ____opt_10:GetAssignedHero()
                if not hero or hero:IsNull() or not hero:IsAlive() or hero:IsIllusion() then
                    goto __continue110
                end
                if not selectedHero or hero:GetLevel() > selectedHero:GetLevel() then
                    selectedHero = hero
                end
            end
            ::__continue110::
            i = i + 1
        end
    end
    return selectedHero
end
function EventEntityKilled.prototype.dropParts(self, creep, chance)
    if chance == nil then
        chance = 1
    end
    local isDaytime = GameRules:IsDaytime()
    if isDaytime then
        self:dropItem(creep, {self.itemLightPartName}, chance)
    else
        self:dropItem(creep, {self.itemDarkPartName}, chance)
    end
end
function EventEntityKilled.prototype.onWindyKilled(self, unit, attacker)
    local respawnTime = 60
    local unitName = unit:GetUnitName()
    local team = unit:GetTeam()
    local attackerSteamID = attacker and attacker:IsRealHero() and tostring(PlayerResource:GetSteamAccountID(attacker:GetPlayerOwnerID())) or nil
    local isSpecialUser = attackerSteamID and __TS__ArrayIncludes(self.specialSteamIDs, attackerSteamID)
    local zhuqueDropChance = isSpecialUser and 20 or 10
    local baihuDropChance = isSpecialUser and 20 or 6
    local windyDropChance = self.dropItemChanceFusionAncient * 2
    self:dropItem(
        unit,
        self.dropItemListFusionMaterial,
        self:calculateDropChance(windyDropChance)
    )
    self:dropItem(unit, {"item_rune_transmuter_random"}, 8, false)
    self:dropItem(unit, {"item_rune_transmuter_advanced"}, 5, false)
    self:dropItem(unit, {"item_skill_talisman"}, baihuDropChance / 2, false)
    self:dropItem(unit, {"item_skill_learning"}, 3, false)
    self:dropItem(unit, {"item_skill_transfer"}, 5, false)
    self:dropItem(unit, {"item_collector"}, 5, false)
    self:dropItem(unit, {"item_tome_of_ability_reset"}, 2, false)
    self:dropItem(unit, {"item_tome_of_ability_replace"}, 3, false)
    local gameTime = GameRules:GetDOTATime(false, false)
    local killerInAbilityReplacerSupport = attacker ~= nil and attacker:IsRealHero() and ____exports.EventEntityKilled.ABILITY_REPLACER_SUPPORTED_HERO_NAMES:has(attacker:GetUnitName())
    if gameTime >= 300 and gameTime <= 600 and GameRules.Option.direGoldXpMultiplier >= 12 and GameRules.Option.direGoldXpMultiplier <= 20 and killerInAbilityReplacerSupport then
        self:dropItem(unit, {"item_ability_rp"}, 3, false)
    end
    self:dropItem(unit, {"item_madstone_bundle"}, 100, false)
    self:dropItem(unit, {____exports.EventEntityKilled.TREASURE_CHEST_ITEM}, 5, false)
    self:dropItem(unit, {"item_madstone_bundle"}, 10 + gameTime / 8, false)
    self:dropItem(unit, {"item_madstone_bundle"}, 5 + gameTime / 16, false)
    self:dropItem(unit, {"item_madstone_bundle"}, 0 + gameTime / 24, false)
    if not self.hasDroppedGuardianAngelScroll then
        if RandomFloat(0, 100) <= 8 then
            self:dropItem(unit, {"item_scroll_guardian_angel"}, 100, true)
            self.hasDroppedGuardianAngelScroll = true
        end
    end
    if not self.hasDroppedItem_xuanwu then
        if RandomFloat(0, 100) <= 15 then
            self:dropItem(unit, {"item_xuanwu"}, 100, true)
            self.hasDroppedItem_xuanwu = true
        end
    end
    if not self.hasDroppedItem_zhuque then
        if RandomFloat(0, 100) <= zhuqueDropChance then
            self:dropItem(unit, {"item_zhuque"}, 100, true)
            self.hasDroppedItem_zhuque = true
        end
    end
    if not self.hasDroppedItem_baihu then
        if RandomFloat(0, 100) <= baihuDropChance then
            self:dropItem(unit, {"item_baihu"}, 100, true)
            self.hasDroppedItem_baihu = true
        end
    end
    if not self.hasDroppedItem_qinglong then
        if RandomFloat(0, 100) <= 10 then
            self:dropItem(unit, {"item_qinglong"}, 100, true)
            self.hasDroppedItem_qinglong = true
        end
    end
    local goldmultiplier = GameRules.Option.direGoldXpMultiplier or 2
    local baseChance = 20
    local expBookDropChance = baseChance * (1 + math.max(0, goldmultiplier - 10) / 90)
    if RandomFloat(0, 100) <= expBookDropChance then
        GameRules:SendCustomMessage("<font color='#FFD700'> 五保户们，领低保经验咯</font>", 0, 0)
        do
            local playerId = 0
            while playerId < DOTA_MAX_TEAM_PLAYERS do
                do
                    if PlayerResource:IsValidPlayerID(playerId) then
                        if PlayerResource:GetTeam(playerId) ~= DOTA_TEAM_GOODGUYS then
                            goto __continue130
                        end
                        local hero = PlayerResource:GetSelectedHeroEntity(playerId)
                        if hero then
                            hero:AddItemByName("item_tome_of_knowledge")
                        end
                    end
                end
                ::__continue130::
                playerId = playerId + 1
            end
        end
    end
    local goldBagDropChance = baseChance * (1 + math.max(0, goldmultiplier - 10) / 90)
    if RandomFloat(0, 100) <= goldBagDropChance then
        local dropCount = 1
        local secondBagChance = math.min((goldmultiplier - 2) / 98 * 100, 100)
        if RandomFloat(0, 100) <= secondBagChance then
            dropCount = 2
            local thirdBagChance = math.min(
                math.max(0, (goldmultiplier - 30) / 70 * 100),
                100
            )
            if RandomFloat(0, 100) <= thirdBagChance then
                dropCount = 3
            end
        end
        GameRules:SendCustomMessage("<font color='#FFD700'> 五保户们，领低保金咯</font>", 0, 0)
        do
            local playerId = 0
            while playerId < DOTA_MAX_TEAM_PLAYERS do
                do
                    if PlayerResource:IsValidPlayerID(playerId) then
                        if PlayerResource:GetTeam(playerId) ~= DOTA_TEAM_GOODGUYS then
                            goto __continue137
                        end
                        local hero = PlayerResource:GetSelectedHeroEntity(playerId)
                        if hero then
                            local goldPerBag = 1000
                            local totalGold = goldPerBag * dropCount
                            hero:ModifyGold(totalGold, false, DOTA_ModifyGold_NeutralKill)
                            SendOverheadEventMessage(
                                nil,
                                OVERHEAD_ALERT_GOLD,
                                hero,
                                totalGold,
                                nil
                            )
                        end
                    end
                end
                ::__continue137::
                playerId = playerId + 1
            end
        end
    end
    local Position = Vector(-5820, -6580, 384)
    Timers:CreateTimer(
        respawnTime,
        function()
            local newUnit = CreateUnitByName(
                unitName,
                Position,
                true,
                nil,
                nil,
                team
            )
            if newUnit ~= nil then
                newUnit:AddNewModifier(newUnit, nil, "modifier_rooted", {})
            end
        end
    )
end
function EventEntityKilled.prototype.getWindyNeutralTierByGameTime(self, gameTime)
    do
        local i = #self.windyNeutralTierStartTimes - 1
        while i >= 0 do
            if gameTime >= self.windyNeutralTierStartTimes[i + 1] then
                return i + 1
            end
            i = i - 1
        end
    end
    return 1
end
function EventEntityKilled.prototype.dropWindyNeutralItemAndEnhancement(self, unit, dropChance)
    if dropChance == nil then
        dropChance = 100
    end
    if RandomFloat(0, 100) > dropChance then
        return
    end
    local gameTime = GameRules:GetDOTATime(false, false)
    if GameRules.Option.midOnlyMode then
        gameTime = gameTime * 1.3
    end
    local tier = self:getWindyNeutralTierByGameTime(gameTime)
    local tierConfig = self.windyNeutralItemConfig[tier]
    if not tierConfig then
        return
    end
    local neutralItems = __TS__ArrayMap(
        tierConfig.items,
        function(____, item) return item.name end
    )
    local neutralDrop = self:dropTrackedItem(unit, neutralItems)
    if neutralDrop then
        Timers:CreateTimer(
            20,
            function()
                if neutralDrop and not neutralDrop:IsNull() then
                    neutralDrop:RemoveSelf()
                end
            end
        )
    end
    if tier == 5 then
        local ____opt_12 = self.windyNeutralItemConfig[5]
        if ____opt_12 ~= nil then
            local ____opt_13 = self.windyNeutralItemConfig[5]
            ____opt_12 = __TS__ArrayMap(
                ____opt_13 and ____opt_13.enhancements,
                function(____, item) return item.name end
            )
        end
        local tier5Enhancements = ____opt_12 or ({})
        local enhancementDrop = self:dropTrackedItem(unit, tier5Enhancements)
        if enhancementDrop then
            Timers:CreateTimer(
                20,
                function()
                    if enhancementDrop and not enhancementDrop:IsNull() then
                        enhancementDrop:RemoveSelf()
                    end
                end
            )
        end
    end
end
function EventEntityKilled.prototype.dropTrackedItem(self, creep, dropItemList)
    if #dropItemList == 0 then
        return nil
    end
    local itemIndex = RandomInt(0, #dropItemList - 1)
    local itemName = dropItemList[itemIndex + 1]
    local item = CreateItem(itemName, nil, nil)
    if not item then
        return nil
    end
    SkillTomeAuthorization:authorizeItem(item, itemName)
    local drop = CreateItemOnPositionSync(
        creep:GetAbsOrigin(),
        item
    )
    item:LaunchLoot(
        false,
        300,
        0.75,
        creep:GetAbsOrigin():__add(Vector(
            RandomInt(-100, 100),
            RandomInt(-100, 100),
            0
        )),
        nil
    )
    return drop
end
function EventEntityKilled.prototype.dropItem(self, creep, dropItemList, dropChance, dropOnce)
    if dropChance == nil then
        dropChance = 100
    end
    if dropOnce == nil then
        dropOnce = false
    end
    if #dropItemList == 0 then
        return dropItemList
    end
    if RandomFloat(0, 100) <= dropChance then
        local itemIndex = RandomInt(0, #dropItemList - 1)
        local itemName = dropItemList[itemIndex + 1]
        local item = CreateItem(itemName, nil, nil)
        if item then
            SkillTomeAuthorization:authorizeItem(item, itemName)
            CreateItemOnPositionSync(
                creep:GetAbsOrigin(),
                item
            )
            item:LaunchLoot(
                false,
                300,
                0.75,
                creep:GetAbsOrigin():__add(Vector(
                    RandomInt(-100, 100),
                    RandomInt(-100, 100),
                    0
                )),
                nil
            )
        end
        if dropOnce then
            return __TS__ArrayFilter(
                dropItemList,
                function(____, v, i) return i ~= itemIndex end
            )
        else
            return dropItemList
        end
    end
    return dropItemList
end
EventEntityKilled.HERO_POSSESSION_ITEM = "item_hero_possession"
EventEntityKilled.TREASURE_CHEST_ITEM = "item_treasure_chest"
EventEntityKilled.HERO_POSSESSION_MAX_PROPERTY_LEVEL = 90
EventEntityKilled.BOT_DEATH_ITEM_GOLD_RATE = 0.016
EventEntityKilled.BOT_AEGIS_PICKUP_RETRY_INTERVAL = 0.25
EventEntityKilled.BOT_AEGIS_PICKUP_RETRY_COUNT = 12
EventEntityKilled.INVENTORY_SLOT_MAX = 17
EventEntityKilled.ABYSS_BOSS_REWARD_DROP_CHANCE = 100 / 10
EventEntityKilled.ABYSS_BOSS_REWARD_ITEMS = {
    "item_skill_learning",
    "item_treasure_chest",
    "item_tome_of_ability_reset",
    "item_tome_of_ability_replace",
    "item_fusion_brutal",
    "item_fusion_agile",
    "item_fusion_magic",
    "item_qinglong",
    "item_baihu",
    "item_zhuque",
    "item_xuanwu"
}
EventEntityKilled.TOWER4_NAMES = {"goodguys_tower4", "badguys_tower4"}
EventEntityKilled.ABILITY_REPLACER_SUPPORTED_HERO_NAMES = __TS__New(Set, {
    "npc_dota_hero_sniper",
    "npc_dota_hero_ogre_magi",
    "npc_dota_hero_mirana",
    "npc_dota_hero_axe",
    "npc_dota_hero_phantom_assassin",
    "npc_dota_hero_spectre",
    "npc_dota_hero_skeleton_king",
    "npc_dota_hero_undying",
    "npc_dota_hero_juggernaut",
    "npc_dota_hero_rattletrap",
    "npc_dota_hero_arc_warden",
    "npc_dota_hero_slark",
    "npc_dota_hero_spirit_breaker",
    "npc_dota_hero_dawnbreaker",
    "npc_dota_hero_nevermore",
    "npc_dota_hero_magnataur",
    "npc_dota_hero_monkey_king",
    "npc_dota_hero_necrolyte",
    "npc_dota_hero_primal_beast",
    "npc_dota_hero_ember_spirit",
    "npc_dota_hero_tiny",
    "npc_dota_hero_nyx_assassin",
    "npc_dota_hero_tusk",
    "npc_dota_hero_templar_assassin",
    "npc_dota_hero_vengefulspirit",
    "npc_dota_hero_batrider",
    "npc_dota_hero_alchemist",
    "npc_dota_hero_weaver",
    "npc_dota_hero_ringmaster",
    "npc_dota_hero_naga_siren",
    "npc_dota_hero_grimstroke",
    "npc_dota_hero_techies",
    "npc_dota_hero_bounty_hunter",
    "npc_dota_hero_witch_doctor",
    "npc_dota_hero_pugna",
    "npc_dota_hero_warlock",
    "npc_dota_hero_zuus",
    "npc_dota_hero_lycan",
    "npc_dota_hero_luna",
    "npc_dota_hero_legion_commander",
    "npc_dota_hero_crystal_maiden",
    "npc_dota_hero_enigma",
    "npc_dota_hero_omniknight",
    "npc_dota_hero_oracle",
    "npc_dota_hero_lina",
    "npc_dota_hero_snapfire",
    "npc_dota_hero_lion",
    "npc_dota_hero_enchantress",
    "npc_dota_hero_bane",
    "npc_dota_hero_rubick",
    "npc_dota_hero_antimage",
    "npc_dota_hero_drow_ranger",
    "npc_dota_hero_life_stealer",
    "npc_dota_hero_muerta",
    "npc_dota_hero_skywrath_mage",
    "npc_dota_hero_dark_willow",
    "npc_dota_hero_faceless_void",
    "npc_dota_hero_storm_spirit",
    "npc_dota_hero_riki",
    "npc_dota_hero_keeper_of_the_light",
    "npc_dota_hero_kunkka",
    "npc_dota_hero_sven",
    "npc_dota_hero_huskar",
    "npc_dota_hero_hoodwink"
})
return ____exports
