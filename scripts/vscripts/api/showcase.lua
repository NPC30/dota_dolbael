local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__ArraySort = ____lualib.__TS__ArraySort
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/showcase.lua"
__TS__SourceMapTraceBack("api/showcase.lua", {["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 3,["19"] = 3,["20"] = 4,["21"] = 4,["22"] = 5,["23"] = 5,["24"] = 6,["25"] = 6,["26"] = 153,["27"] = 153,["28"] = 153,["30"] = 178,["31"] = 178,["32"] = 178,["33"] = 178,["34"] = 181,["35"] = 181,["36"] = 181,["37"] = 181,["38"] = 185,["39"] = 185,["40"] = 185,["41"] = 185,["42"] = 189,["43"] = 189,["44"] = 189,["45"] = 189,["46"] = 193,["47"] = 193,["48"] = 193,["49"] = 193,["50"] = 197,["51"] = 197,["52"] = 197,["53"] = 197,["54"] = 177,["55"] = 203,["56"] = 204,["59"] = 207,["60"] = 208,["61"] = 203,["62"] = 211,["63"] = 212,["66"] = 215,["67"] = 211,["68"] = 218,["69"] = 219,["70"] = 218,["71"] = 222,["72"] = 223,["73"] = 223,["74"] = 223,["75"] = 222,["76"] = 226,["77"] = 230,["78"] = 231,["81"] = 235,["82"] = 236,["83"] = 237,["84"] = 238,["87"] = 241,["88"] = 242,["89"] = 243,["90"] = 244,["93"] = 246,["94"] = 247,["95"] = 248,["96"] = 248,["97"] = 248,["98"] = 249,["99"] = 250,["100"] = 251,["102"] = 248,["103"] = 248,["104"] = 226,["105"] = 256,["106"] = 257,["107"] = 258,["108"] = 259,["109"] = 260,["111"] = 262,["113"] = 264,["114"] = 265,["115"] = 266,["116"] = 267,["117"] = 267,["119"] = 256,["120"] = 270,["121"] = 271,["122"] = 272,["125"] = 275,["126"] = 270,["127"] = 278,["128"] = 279,["129"] = 279,["130"] = 279,["131"] = 279,["132"] = 279,["133"] = 279,["134"] = 279,["135"] = 279,["136"] = 279,["137"] = 279,["138"] = 279,["139"] = 284,["140"] = 285,["141"] = 286,["143"] = 288,["145"] = 278,["146"] = 292,["148"] = 293,["149"] = 293,["150"] = 293,["151"] = 294,["152"] = 297,["153"] = 297,["154"] = 297,["155"] = 300,["156"] = 300,["157"] = 300,["158"] = 300,["159"] = 297,["160"] = 297,["161"] = 297,["162"] = 297,["163"] = 308,["164"] = 309,["165"] = 310,["166"] = 311,["167"] = 314,["168"] = 319,["169"] = 297,["170"] = 321,["171"] = 322,["172"] = 325,["173"] = 325,["174"] = 325,["175"] = 325,["176"] = 325,["177"] = 325,["178"] = 325,["179"] = 329,["180"] = 297,["181"] = 297,["182"] = 292,["183"] = 334,["184"] = 335,["187"] = 338,["188"] = 339,["189"] = 339,["190"] = 339,["191"] = 342,["192"] = 342,["193"] = 342,["194"] = 342,["195"] = 339,["196"] = 339,["197"] = 339,["198"] = 339,["199"] = 350,["200"] = 351,["201"] = 352,["202"] = 353,["203"] = 354,["204"] = 339,["205"] = 356,["206"] = 357,["207"] = 358,["208"] = 359,["209"] = 359,["210"] = 359,["211"] = 359,["212"] = 359,["213"] = 359,["214"] = 359,["215"] = 339,["216"] = 339,["217"] = 334,["218"] = 367,["219"] = 368,["220"] = 369,["223"] = 372,["224"] = 372,["225"] = 372,["226"] = 372,["227"] = 372,["228"] = 372,["229"] = 372,["230"] = 376,["231"] = 376,["232"] = 376,["233"] = 379,["234"] = 379,["235"] = 379,["236"] = 379,["237"] = 379,["238"] = 379,["239"] = 376,["240"] = 376,["241"] = 376,["242"] = 376,["243"] = 389,["244"] = 390,["245"] = 390,["246"] = 390,["247"] = 390,["248"] = 394,["249"] = 395,["250"] = 401,["251"] = 402,["252"] = 376,["253"] = 404,["254"] = 405,["255"] = 408,["256"] = 408,["257"] = 408,["258"] = 408,["259"] = 408,["260"] = 408,["261"] = 408,["262"] = 376,["263"] = 376,["264"] = 367,["265"] = 416,["266"] = 417,["267"] = 418,["270"] = 421,["271"] = 422,["272"] = 422,["273"] = 422,["274"] = 422,["275"] = 422,["276"] = 422,["277"] = 422,["278"] = 426,["279"] = 426,["280"] = 426,["281"] = 429,["282"] = 429,["283"] = 429,["284"] = 429,["285"] = 429,["286"] = 426,["287"] = 426,["288"] = 426,["289"] = 426,["290"] = 438,["291"] = 439,["292"] = 440,["293"] = 440,["294"] = 440,["295"] = 440,["296"] = 444,["297"] = 444,["298"] = 444,["299"] = 444,["300"] = 446,["301"] = 446,["302"] = 446,["303"] = 446,["304"] = 444,["305"] = 444,["306"] = 444,["307"] = 444,["308"] = 444,["309"] = 426,["310"] = 455,["311"] = 456,["312"] = 457,["313"] = 457,["314"] = 457,["315"] = 457,["316"] = 457,["317"] = 457,["318"] = 457,["319"] = 426,["320"] = 426,["321"] = 416,["322"] = 465,["323"] = 466,["324"] = 467,["327"] = 470,["328"] = 470,["329"] = 470,["330"] = 470,["331"] = 470,["332"] = 470,["333"] = 470,["334"] = 474,["335"] = 474,["336"] = 474,["337"] = 477,["338"] = 477,["339"] = 477,["340"] = 477,["341"] = 477,["342"] = 477,["343"] = 474,["344"] = 474,["345"] = 474,["346"] = 474,["347"] = 487,["348"] = 488,["349"] = 489,["350"] = 490,["351"] = 491,["352"] = 492,["353"] = 498,["354"] = 499,["355"] = 474,["356"] = 501,["357"] = 502,["358"] = 503,["359"] = 503,["360"] = 503,["361"] = 503,["362"] = 503,["363"] = 503,["364"] = 503,["365"] = 474,["366"] = 474,["367"] = 465,["368"] = 511,["369"] = 512,["370"] = 513,["373"] = 516,["374"] = 516,["375"] = 516,["376"] = 516,["377"] = 516,["378"] = 516,["379"] = 516,["380"] = 520,["381"] = 520,["382"] = 520,["383"] = 523,["384"] = 523,["385"] = 523,["386"] = 523,["387"] = 523,["388"] = 520,["389"] = 520,["390"] = 520,["391"] = 520,["392"] = 532,["393"] = 533,["394"] = 533,["395"] = 533,["396"] = 533,["397"] = 537,["398"] = 538,["399"] = 543,["400"] = 544,["401"] = 520,["402"] = 546,["403"] = 547,["404"] = 550,["405"] = 550,["406"] = 550,["407"] = 550,["408"] = 550,["409"] = 550,["410"] = 550,["411"] = 520,["412"] = 520,["413"] = 511,["414"] = 558,["415"] = 559,["416"] = 560,["419"] = 562,["420"] = 562,["421"] = 562,["422"] = 562,["423"] = 562,["424"] = 562,["425"] = 562,["426"] = 566,["427"] = 569,["428"] = 569,["429"] = 569,["430"] = 572,["431"] = 572,["432"] = 572,["433"] = 572,["434"] = 572,["435"] = 569,["436"] = 569,["437"] = 569,["438"] = 569,["439"] = 581,["440"] = 582,["441"] = 583,["442"] = 583,["443"] = 583,["444"] = 583,["445"] = 587,["446"] = 587,["447"] = 588,["449"] = 589,["451"] = 587,["452"] = 590,["453"] = 591,["454"] = 598,["455"] = 599,["456"] = 569,["457"] = 601,["458"] = 602,["459"] = 605,["460"] = 605,["461"] = 605,["462"] = 605,["463"] = 605,["464"] = 605,["465"] = 605,["466"] = 569,["467"] = 569,["468"] = 558,["469"] = 613,["470"] = 614,["471"] = 615,["472"] = 613,["473"] = 618,["474"] = 619,["475"] = 620,["476"] = 618,["477"] = 623,["478"] = 626,["479"] = 627,["480"] = 628,["482"] = 631,["483"] = 632,["484"] = 633,["485"] = 633,["487"] = 634,["488"] = 634,["490"] = 636,["491"] = 637,["492"] = 638,["493"] = 639,["494"] = 640,["495"] = 641,["496"] = 642,["497"] = 643,["499"] = 650,["500"] = 650,["501"] = 650,["502"] = 650,["503"] = 650,["504"] = 655,["505"] = 655,["506"] = 655,["507"] = 650,["508"] = 650,["509"] = 650,["510"] = 650,["511"] = 623,["512"] = 661,["513"] = 662,["514"] = 665,["515"] = 666,["516"] = 667,["518"] = 670,["519"] = 671,["520"] = 675,["521"] = 676,["524"] = 681,["525"] = 681,["526"] = 682,["527"] = 683,["528"] = 684,["529"] = 685,["530"] = 686,["531"] = 689,["532"] = 690,["533"] = 691,["534"] = 692,["535"] = 692,["536"] = 692,["538"] = 692,["540"] = 687,["541"] = 687,["542"] = 687,["543"] = 687,["544"] = 687,["545"] = 687,["546"] = 687,["547"] = 687,["548"] = 687,["549"] = 687,["550"] = 687,["551"] = 687,["552"] = 687,["553"] = 681,["556"] = 701,["557"] = 661,["558"] = 712,["559"] = 713,["560"] = 712,["561"] = 716,["562"] = 720,["563"] = 720,["564"] = 721,["565"] = 722,["567"] = 724,["568"] = 724,["569"] = 724,["570"] = 724,["571"] = 724,["572"] = 724,["573"] = 724,["574"] = 724,["575"] = 724,["576"] = 724,["577"] = 716,["578"] = 739,["579"] = 742,["580"] = 743,["581"] = 744,["583"] = 746,["584"] = 749,["586"] = 751,["587"] = 752,["589"] = 753,["590"] = 754,["592"] = 756,["599"] = 759,["600"] = 759,["601"] = 759,["602"] = 759,["603"] = 760,["604"] = 739,["605"] = 763,["606"] = 764,["607"] = 764,["608"] = 764,["610"] = 764,["612"] = 764,["613"] = 766,["614"] = 767,["615"] = 768,["616"] = 769,["617"] = 771,["618"] = 772,["619"] = 773,["620"] = 774,["621"] = 775,["622"] = 776,["623"] = 776,["624"] = 776,["626"] = 765,["627"] = 765,["628"] = 765,["629"] = 765,["630"] = 765,["631"] = 765,["632"] = 765,["633"] = 765,["634"] = 765,["635"] = 765,["636"] = 765,["637"] = 765,["638"] = 765,["639"] = 765,["640"] = 763,["641"] = 782,["642"] = 783,["643"] = 784,["644"] = 785,["645"] = 785,["646"] = 785,["647"] = 785,["648"] = 785,["649"] = 785,["650"] = 785,["651"] = 785,["652"] = 785,["653"] = 785,["655"] = 796,["656"] = 782,["657"] = 799,["658"] = 804,["661"] = 808,["662"] = 809,["665"] = 812,["666"] = 813,["669"] = 817,["670"] = 818,["671"] = 819,["672"] = 820,["675"] = 824,["676"] = 829,["679"] = 833,["680"] = 834,["681"] = 799,["682"] = 839,["683"] = 840,["684"] = 841,["685"] = 842,["686"] = 843,["688"] = 841,["689"] = 846,["690"] = 839,["691"] = 849,["692"] = 850,["693"] = 852,["694"] = 856,["697"] = 859,["698"] = 849,["699"] = 862,["700"] = 866,["701"] = 867,["702"] = 868,["704"] = 870,["705"] = 871,["706"] = 872,["708"] = 874,["709"] = 875,["710"] = 876,["711"] = 878,["712"] = 881,["715"] = 884,["716"] = 862,["717"] = 887,["718"] = 888,["719"] = 889,["721"] = 891,["722"] = 891,["723"] = 891,["724"] = 891,["725"] = 891,["726"] = 887,["727"] = 894,["728"] = 895,["729"] = 895,["730"] = 895,["731"] = 896,["732"] = 897,["733"] = 898,["735"] = 900,["736"] = 895,["737"] = 895,["738"] = 894,["739"] = 904,["740"] = 905,["741"] = 906,["742"] = 907,["743"] = 907,["745"] = 909,["746"] = 912,["747"] = 912,["749"] = 913,["750"] = 904,["751"] = 916,["752"] = 917,["753"] = 917,["754"] = 917,["755"] = 917,["756"] = 917,["757"] = 917,["758"] = 917,["759"] = 917,["760"] = 916,["761"] = 923,["762"] = 924,["763"] = 925,["764"] = 926,["765"] = 923,["766"] = 929,["767"] = 930,["768"] = 929,["769"] = 154,["770"] = 155,["771"] = 156,["772"] = 157,["773"] = 158,["774"] = 159,["775"] = 161,["776"] = 163,["777"] = 165,["778"] = 167,["779"] = 168,["780"] = 169,["781"] = 171,["782"] = 172,["783"] = 173,["784"] = 174,["785"] = 175});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____player_2Dlanguage = require("api.player-language")
local PlayerLanguage = ____player_2Dlanguage.PlayerLanguage
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____hero_2Dname_2Dhelper = require("modules.helper.hero-name-helper")
local HeroNameHelper = ____hero_2Dname_2Dhelper.HeroNameHelper
local ____treasure = require("modules.treasure.treasure")
local Treasure = ____treasure.Treasure
local ____awakening_2Dlottery_2Ddefinitions = require("modules.lottery.awakening-lottery-definitions")
local AwakeningLotteryDefinitions = ____awakening_2Dlottery_2Ddefinitions.AwakeningLotteryDefinitions
____exports.Showcase = __TS__Class()
local Showcase = ____exports.Showcase
Showcase.name = "Showcase"
function Showcase.prototype.____constructor(self)
    CustomGameEventManager:RegisterListener(
        "showcase_refresh",
        function(_, event) return ____exports.Showcase:OnRefresh(event) end
    )
    CustomGameEventManager:RegisterListener(
        "showcase_purchase",
        function(_, event) return ____exports.Showcase:OnPurchase(event) end
    )
    CustomGameEventManager:RegisterListener(
        "showcase_random_box_open",
        function(_, event) return ____exports.Showcase:OnRandomBoxOpen(event) end
    )
    CustomGameEventManager:RegisterListener(
        "showcase_random_box_claim",
        function(_, event) return ____exports.Showcase:OnRandomBoxClaim(event) end
    )
    CustomGameEventManager:RegisterListener(
        "showcase_awakening_activate",
        function(_, event) return ____exports.Showcase:OnAwakeningActivate(event) end
    )
    CustomGameEventManager:RegisterListener(
        "showcase_awakening_lottery_pool_unlock",
        function(_, event) return ____exports.Showcase:OnLotteryPoolUnlock(event) end
    )
end
function Showcase.LoadShowcaseOnce(self, steamId)
    if not steamId or steamId <= 0 or ____exports.Showcase.requestedSteamIds:has(steamId) then
        return
    end
    ____exports.Showcase.requestedSteamIds:add(steamId)
    ____exports.Showcase:LoadShowcase(steamId)
end
function Showcase.RefreshShowcase(self, steamId)
    if not steamId or steamId <= 0 then
        return
    end
    ____exports.Showcase:LoadShowcase(steamId)
end
function Showcase.IsLotteryPoolLoaded(self, steamId)
    return not steamId or steamId <= 0 or ____exports.Showcase.lotteryPoolLoadedSteamIds:has(steamId)
end
function Showcase.GetLotteryPoolAwakenings(self, steamId)
    local ____opt_2 = ____exports.Showcase:GetCurrentTable(steamId)
    local ____opt_0 = ____opt_2 and ____opt_2.profile
    return ____opt_0 and ____opt_0.lotteryPoolAwakenings or ({})
end
function Showcase.EnsureLotteryPoolLoaded(self, steamId, callback)
    if not steamId or steamId <= 0 or ____exports.Showcase:IsLotteryPoolLoaded(steamId) then
        callback(nil, true)
        return
    end
    local key = tostring(steamId)
    local retryAfter = ____exports.Showcase.lotteryPoolRetryAfter[key] or 0
    if retryAfter > Time() then
        callback(nil, false)
        return
    end
    local waiters = ____exports.Showcase.lotteryPoolWaiters[key] or ({})
    waiters[#waiters + 1] = callback
    ____exports.Showcase.lotteryPoolWaiters[key] = waiters
    if ____exports.Showcase.lotteryPoolLoadingSteamIds:has(steamId) then
        return
    end
    ____exports.Showcase.lotteryPoolLoadingSteamIds:add(steamId)
    ____exports.Showcase:LoadProfile(steamId)
    Timers:CreateTimer(
        12,
        function()
            if not ____exports.Showcase:IsLotteryPoolLoaded(steamId) then
                ApiClient:DebugLog("[Showcase] lottery pool load timed out steamId=" .. tostring(steamId))
                ____exports.Showcase:ResolveLotteryPoolLoad(steamId, false)
            end
        end
    )
end
function Showcase.ResolveLotteryPoolLoad(self, steamId, loaded)
    local key = tostring(steamId)
    if loaded then
        ____exports.Showcase.lotteryPoolLoadedSteamIds:add(steamId)
        ____exports.Showcase.lotteryPoolRetryAfter[key] = nil
    else
        ____exports.Showcase.lotteryPoolRetryAfter[key] = Time() + ____exports.Showcase.LOTTERY_POOL_RETRY_COOLDOWN
    end
    ____exports.Showcase.lotteryPoolLoadingSteamIds:delete(steamId)
    local waiters = ____exports.Showcase.lotteryPoolWaiters[key] or ({})
    ____exports.Showcase.lotteryPoolWaiters[key] = nil
    for ____, waiter in ipairs(waiters) do
        waiter(nil, loaded)
    end
end
function Showcase.OnRefresh(self, event)
    local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
    if not steamId or steamId <= 0 then
        return
    end
    ____exports.Showcase:LoadShowcase(steamId)
end
function Showcase.LoadShowcase(self, steamId)
    ____exports.Showcase:SaveShowcase(
        steamId,
        __TS__ObjectAssign(
            {},
            ____exports.Showcase:GetCurrentTable(steamId) or ({}),
            {
                loading = true,
                message = ____exports.Showcase:Text(steamId, "觉醒加载中...", "Loading awakenings...")
            }
        )
    )
    ____exports.Showcase:LoadProfile(steamId)
    if ____exports.Showcase.catalogCache then
        ____exports.Showcase:MergeShowcase(steamId, {catalog = ____exports.Showcase.catalogCache})
    else
        ____exports.Showcase:LoadCatalog(steamId)
    end
end
function Showcase.LoadProfile(self, steamId)
    local ____exports_Showcase_4, ____profileLoadGeneration_5 = ____exports.Showcase, "profileLoadGeneration"
    local ____exports_Showcase_profileLoadGeneration_6 = ____exports_Showcase_4[____profileLoadGeneration_5] + 1
    ____exports_Showcase_4[____profileLoadGeneration_5] = ____exports_Showcase_profileLoadGeneration_6
    local generation = ____exports_Showcase_profileLoadGeneration_6
    ApiClient:DebugLog((((("[Showcase] profile request start generation=" .. tostring(generation)) .. ", time=") .. tostring(Time())) .. ", steamId=") .. tostring(steamId))
    ApiClient:sendToBackupHost({
        method = HttpMethod.GET,
        path = ____exports.Showcase.PROFILE_URL,
        querys = {
            steamId = tostring(steamId),
            lang = PlayerLanguage:GetApiLang(steamId),
            compact = "game-v2"
        },
        retryTimes = 1,
        timeoutSeconds = 8,
        silent = true,
        successFunc = function(____, data)
            local profile = ____exports.Showcase:DecodeProfileResponse(data)
            local lotteryPoolAwakenings = profile.lotteryPoolAwakenings or ({})
            ApiClient:DebugLog((((((("[Showcase] profile loaded generation=" .. tostring(generation)) .. ", time=") .. tostring(Time())) .. ", steamId=") .. tostring(steamId)) .. ", lotteryPoolAwakenings=") .. (#lotteryPoolAwakenings > 0 and table.concat(lotteryPoolAwakenings, ",") or "none"))
            ____exports.Showcase:MergeShowcase(steamId, {profile = profile, loading = false, message = ""})
            ____exports.Showcase:ResolveLotteryPoolLoad(steamId, true)
        end,
        failureFunc = function(____, data)
            ApiClient:DebugLog((((((("[Showcase] profile failed generation=" .. tostring(generation)) .. ", time=") .. tostring(Time())) .. ", steamId=") .. tostring(steamId)) .. ", data=") .. data)
            ____exports.Showcase:MergeShowcase(
                steamId,
                {
                    loading = false,
                    message = ____exports.Showcase:Text(steamId, "觉醒资料加载失败", "Failed to load awakening profile")
                }
            )
            ____exports.Showcase:ResolveLotteryPoolLoad(steamId, false)
        end
    })
end
function Showcase.LoadCatalog(self, steamId)
    if ____exports.Showcase.catalogLoading then
        return
    end
    ____exports.Showcase.catalogLoading = true
    ApiClient:sendToBackupHost({
        method = HttpMethod.GET,
        path = ____exports.Showcase.CATALOG_URL,
        querys = {
            steamId = tostring(steamId),
            lang = PlayerLanguage:GetApiLang(steamId),
            compact = "game-v2"
        },
        retryTimes = 1,
        timeoutSeconds = 8,
        silent = true,
        successFunc = function(____, data)
            ____exports.Showcase.catalogLoading = false
            local catalog = ____exports.Showcase:DecodeCatalogResponse(data)
            ____exports.Showcase.catalogCache = ____exports.Showcase:ExtractAwakeningCatalog(catalog)
            ____exports.Showcase:MergeShowcase(steamId, {catalog = ____exports.Showcase.catalogCache})
        end,
        failureFunc = function(____, data)
            ____exports.Showcase.catalogLoading = false
            ApiClient:DebugLog((("[Showcase] catalog failed steamId=" .. tostring(steamId)) .. ", data=") .. data)
            ____exports.Showcase:MergeShowcase(
                steamId,
                {
                    catalog = {},
                    message = ____exports.Showcase:Text(steamId, "觉醒目录加载失败", "Failed to load awakening catalog")
                }
            )
        end
    })
end
function Showcase.OnPurchase(self, event)
    local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
    if not steamId or steamId <= 0 or not event.itemId then
        return
    end
    ____exports.Showcase:MergeShowcase(
        steamId,
        {
            loading = true,
            message = ____exports.Showcase:Text(steamId, "兑换中...", "Redeeming...")
        }
    )
    ApiClient:sendToBackupHost({
        method = HttpMethod.POST,
        path = ____exports.Showcase.PURCHASE_URL,
        body = {
            steamId = steamId,
            itemId = event.itemId,
            quantity = 1,
            lang = PlayerLanguage:GetApiLang(steamId),
            compact = true
        },
        retryTimes = 1,
        timeoutSeconds = 8,
        silent = true,
        successFunc = function(____, data)
            local profile = ____exports.Showcase:MergeProfile(
                steamId,
                ____exports.Showcase:DecodeResponse(data)
            )
            local message = ____exports.Showcase:Text(steamId, "兑换成功", "Redeemed")
            ____exports.Showcase:MergeShowcase(steamId, {profile = profile, loading = false, message = message, randomBox = {}})
            ____exports.Showcase:TryApplyAwakeningForCurrentHero(steamId, event.itemId, profile)
            ____exports.Showcase:ClearMessageSoon(steamId, message)
        end,
        failureFunc = function(____, data)
            ApiClient:DebugLog((((("[Showcase] purchase failed steamId=" .. tostring(steamId)) .. ", itemId=") .. tostring(event.itemId)) .. ", data=") .. data)
            ____exports.Showcase:MergeShowcase(
                steamId,
                {
                    loading = false,
                    message = ____exports.Showcase:Text(steamId, "兑换失败", "Redeem failed")
                }
            )
        end
    })
end
function Showcase.OnRandomBoxOpen(self, event)
    local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
    if not steamId or steamId <= 0 then
        return
    end
    local collectionId = event.collectionId or ____exports.Showcase.AWAKENING_COLLECTION_ID
    ____exports.Showcase:MergeShowcase(
        steamId,
        {
            loading = true,
            message = ____exports.Showcase:Text(steamId, "开箱中...", "Opening box...")
        }
    )
    ApiClient:sendToBackupHost({
        method = HttpMethod.POST,
        path = ____exports.Showcase.RANDOM_BOX_OPEN_URL,
        body = {
            steamId = steamId,
            collectionId = collectionId,
            lang = PlayerLanguage:GetApiLang(steamId),
            compact = true
        },
        retryTimes = 1,
        timeoutSeconds = 8,
        silent = true,
        successFunc = function(____, data)
            local result = ____exports.Showcase:DecodeResponse(data)
            local profile = ____exports.Showcase:MergeProfile(
                steamId,
                result.profile and ____exports.Showcase:NormalizeProfile(result.profile) or nil
            )
            ____exports.Showcase:MergeShowcase(
                steamId,
                {
                    profile = profile,
                    randomBox = {
                        openId = result.openId,
                        collectionId = result.collectionId or collectionId,
                        options = ____exports.Showcase:NormalizeOptions(result.options)
                    },
                    loading = false,
                    message = ____exports.Showcase:Text(steamId, "请选择一个觉醒", "Choose one awakening")
                }
            )
        end,
        failureFunc = function(____, data)
            ApiClient:DebugLog((("[Showcase] random box open failed steamId=" .. tostring(steamId)) .. ", data=") .. data)
            ____exports.Showcase:MergeShowcase(
                steamId,
                {
                    loading = false,
                    message = ____exports.Showcase:Text(steamId, "开箱失败", "Open failed")
                }
            )
        end
    })
end
function Showcase.OnRandomBoxClaim(self, event)
    local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
    if not steamId or steamId <= 0 or not event.openId or not event.selectedItemId then
        return
    end
    ____exports.Showcase:MergeShowcase(
        steamId,
        {
            loading = true,
            message = ____exports.Showcase:Text(steamId, "领取中...", "Claiming...")
        }
    )
    ApiClient:sendToBackupHost({
        method = HttpMethod.POST,
        path = ____exports.Showcase.RANDOM_BOX_CLAIM_URL,
        body = {
            steamId = steamId,
            openId = event.openId,
            selectedItemId = event.selectedItemId,
            lang = PlayerLanguage:GetApiLang(steamId),
            compact = true
        },
        retryTimes = 1,
        timeoutSeconds = 8,
        silent = true,
        successFunc = function(____, data)
            local result = ____exports.Showcase:DecodeResponse(data)
            local selectedItemId = result.selectedItemId or event.selectedItemId or result.rewardCode
            local profile = ____exports.Showcase:MergeProfile(steamId, result.profile)
            local message = ____exports.Showcase:Text(steamId, "领取成功", "Claimed")
            ____exports.Showcase:MergeShowcase(steamId, {profile = profile, randomBox = {}, loading = false, message = message})
            ____exports.Showcase:TryApplyAwakeningForCurrentHero(steamId, selectedItemId, profile)
            ____exports.Showcase:ClearMessageSoon(steamId, message)
        end,
        failureFunc = function(____, data)
            ApiClient:DebugLog((("[Showcase] random box claim failed steamId=" .. tostring(steamId)) .. ", data=") .. data)
            ____exports.Showcase:MergeShowcase(
                steamId,
                {
                    loading = false,
                    message = ____exports.Showcase:Text(steamId, "领取失败", "Claim failed")
                }
            )
        end
    })
end
function Showcase.OnAwakeningActivate(self, event)
    local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
    if not steamId or steamId <= 0 or not event.itemId then
        return
    end
    ____exports.Showcase:MergeShowcase(
        steamId,
        {
            loading = true,
            message = ____exports.Showcase:Text(steamId, "切换中...", "Switching...")
        }
    )
    ApiClient:sendToBackupHost({
        method = HttpMethod.POST,
        path = ____exports.Showcase.AWAKENING_ACTIVATE_URL,
        body = {
            steamId = steamId,
            itemId = event.itemId,
            lang = PlayerLanguage:GetApiLang(steamId),
            compact = true
        },
        retryTimes = 1,
        timeoutSeconds = 8,
        silent = true,
        successFunc = function(____, data)
            local profile = ____exports.Showcase:MergeProfile(
                steamId,
                ____exports.Showcase:DecodeResponse(data)
            )
            local message = ____exports.Showcase:Text(steamId, "已切换", "Switched")
            ____exports.Showcase:MergeShowcase(steamId, {profile = profile, loading = false, message = message})
            ____exports.Showcase:TryApplyAwakeningForCurrentHero(steamId, event.itemId, profile)
            ____exports.Showcase:ClearMessageSoon(steamId, message)
        end,
        failureFunc = function(____, data)
            ApiClient:DebugLog((((("[Showcase] activate failed steamId=" .. tostring(steamId)) .. ", itemId=") .. tostring(event.itemId)) .. ", data=") .. data)
            ____exports.Showcase:MergeShowcase(
                steamId,
                {
                    loading = false,
                    message = ____exports.Showcase:Text(steamId, "切换失败", "Switch failed")
                }
            )
        end
    })
end
function Showcase.OnLotteryPoolUnlock(self, event)
    local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
    if not steamId or steamId <= 0 then
        return
    end
    ____exports.Showcase:MergeShowcase(
        steamId,
        {
            loading = true,
            message = ____exports.Showcase:Text(steamId, "正在随机加入技能池...", "Adding a random awakening...")
        }
    )
    local requestId = (((("awakening-pool-" .. tostring(steamId)) .. "-") .. tostring(GameRules:Script_GetMatchID())) .. "-") .. tostring(math.floor(Time() * 1000))
    ApiClient:sendToBackupHost({
        method = HttpMethod.POST,
        path = ____exports.Showcase.AWAKENING_LOTTERY_POOL_UNLOCK_URL,
        body = {
            steamId = steamId,
            lang = PlayerLanguage:GetApiLang(steamId),
            compact = "game-v2",
            requestId = requestId
        },
        retryTimes = 1,
        timeoutSeconds = 8,
        silent = true,
        successFunc = function(____, data)
            local result = ____exports.Showcase:DecodeResponse(data)
            local profile = ____exports.Showcase:MergeProfile(
                steamId,
                result.profile and ____exports.Showcase:NormalizeProfile(result.profile) or nil
            )
            local ____result_unlockedItemId_7
            if result.unlockedItemId then
                ____result_unlockedItemId_7 = ____exports.Showcase:FindCatalogItem(result.unlockedItemId)
            else
                ____result_unlockedItemId_7 = nil
            end
            local unlockedItem = ____result_unlockedItemId_7
            local unlockedName = unlockedItem and unlockedItem.titleText or unlockedItem and unlockedItem.name or ""
            local message = ____exports.Showcase:Text(steamId, unlockedName ~= "" and "已进入技能池：" .. unlockedName or "觉醒已进入技能池", unlockedName ~= "" and "Added to ability pool: " .. unlockedName or "Awakening added to ability pool")
            ____exports.Showcase:MergeShowcase(steamId, {profile = profile, loading = false, message = message})
            ____exports.Showcase:ClearMessageSoon(steamId, message)
        end,
        failureFunc = function(____, data)
            ApiClient:DebugLog((("[Showcase] lottery pool unlock failed steamId=" .. tostring(steamId)) .. ", data=") .. data)
            ____exports.Showcase:MergeShowcase(
                steamId,
                {
                    loading = false,
                    message = ____exports.Showcase:Text(steamId, "随机加入技能池失败", "Random pool unlock failed")
                }
            )
        end
    })
end
function Showcase.DecodeResponse(self, data)
    local decoded = (json.decode(data))
    return decoded.data or decoded
end
function Showcase.DecodeProfileResponse(self, data)
    local profile = ____exports.Showcase:DecodeResponse(data)
    return ____exports.Showcase:NormalizeProfile(profile)
end
function Showcase.NormalizeProfile(self, profile)
    local compact = profile
    if compact.o == nil and compact.p == nil then
        return profile
    end
    local active = {}
    local canActivate = {}
    for ____, name in ipairs(compact.a or ({})) do
        active[____exports.Showcase:ToAwakeningId(name)] = true
    end
    for ____, name in ipairs(compact.c or ({})) do
        canActivate[____exports.Showcase:ToAwakeningId(name)] = true
    end
    local ownedAwakenings = {}
    local catalogCounts = {}
    local awakeningActivation = {}
    for ____, name in ipairs(compact.o or ({})) do
        local itemId = ____exports.Showcase:ToAwakeningId(name)
        ownedAwakenings[#ownedAwakenings + 1] = itemId
        catalogCounts[itemId] = 1
        awakeningActivation[itemId] = {rewardCode = itemId, active = active[itemId] == true, canActivate = canActivate[itemId] == true}
    end
    return {
        points = compact.p or 0,
        inventory = {random_box_awakening = compact.b or 0},
        catalogCounts = catalogCounts,
        ownedAwakenings = ownedAwakenings,
        lotteryPoolAwakenings = __TS__ArrayMap(
            compact.lp or ({}),
            function(____, name) return ____exports.Showcase:ToAwakeningId(name) end
        ),
        awakeningActivation = awakeningActivation,
        randomBoxPrices = {["showcase-awakenings"] = compact.bp or 0}
    }
end
function Showcase.DecodeCatalogResponse(self, data)
    local catalog = ____exports.Showcase:DecodeResponse(data)
    local compact = catalog
    if compact.i == nil then
        return catalog
    end
    local items = {}
    local lotteryItems = {}
    for ____, row in ipairs(compact.l or ({})) do
        lotteryItems[____exports.Showcase:ToAwakeningId(row[1])] = {displayAbility = row[2], abilityType = row[3]}
    end
    do
        local index = 0
        while index < #compact.i do
            local row = compact.i[index + 1]
            local name = row[1]
            local heroName = row[2]
            local itemId = ____exports.Showcase:ToAwakeningId(name)
            local lotteryItem = lotteryItems[itemId]
            local ____name_17 = name
            local ____temp_18 = __TS__StringStartsWith(heroName, "npc_dota_hero_") and heroName or "npc_dota_hero_" .. heroName
            local ____TS__StringReplace_result_19 = __TS__StringReplace(heroName, "npc_dota_hero_", "")
            local ____temp_12
            if row[3] == nil then
                ____temp_12 = compact.p
            else
                ____temp_12 = row[3]
            end
            items[#items + 1] = {
                id = itemId,
                name = ____name_17,
                heroId = ____temp_18,
                heroName = ____TS__StringReplace_result_19,
                price = ____temp_12,
                sort = index,
                contentType = "ability",
                classification = "awaken",
                lotteryPoolEligible = lotteryItem ~= nil,
                lotteryDisplayAbility = lotteryItem and lotteryItem.displayAbility,
                lotteryAbilityType = lotteryItem and lotteryItem.abilityType
            }
            index = index + 1
        end
    end
    return {collections = {{id = ____exports.Showcase.AWAKENING_COLLECTION_ID, contentType = "ability", items = items}}}
end
function Showcase.ToAwakeningId(self, name)
    return __TS__StringStartsWith(name, "ability:") and name or "ability:" .. name
end
function Showcase.MergeProfile(self, steamId, patch)
    local ____opt_20 = ____exports.Showcase:GetCurrentTable(steamId)
    local current = ____opt_20 and ____opt_20.profile
    if not patch then
        return current
    end
    return __TS__ObjectAssign(
        {},
        current or ({}),
        patch,
        {
            inventory = patch.inventory and __TS__ObjectAssign({}, current and current.inventory or ({}), patch.inventory) or current and current.inventory,
            catalogCounts = patch.catalogCounts and __TS__ObjectAssign({}, current and current.catalogCounts or ({}), patch.catalogCounts) or current and current.catalogCounts,
            awakeningActivation = patch.awakeningActivation and __TS__ObjectAssign({}, current and current.awakeningActivation or ({}), patch.awakeningActivation) or current and current.awakeningActivation
        }
    )
end
function Showcase.ExtractAwakeningCatalog(self, catalog)
    local result = {}
    local collections = catalog and catalog.collections or ({})
    for ____, collection in ipairs(collections) do
        do
            if collection.id ~= ____exports.Showcase.AWAKENING_COLLECTION_ID and collection.contentType ~= "ability" then
                goto __continue78
            end
            local items = collection.items or ({})
            for ____, item in ipairs(items) do
                do
                    if not item or item.contentType ~= "ability" then
                        goto __continue80
                    end
                    result[#result + 1] = ____exports.Showcase:TrimCatalogItem(item)
                end
                ::__continue80::
            end
        end
        ::__continue78::
    end
    __TS__ArraySort(
        result,
        function(____, a, b) return (a.sort or 0) - (b.sort or 0) end
    )
    return result
end
function Showcase.TrimCatalogItem(self, item)
    local ____item_id_36
    if item.id then
        ____item_id_36 = AwakeningLotteryDefinitions:GetByItemId(item.id)
    else
        ____item_id_36 = nil
    end
    local localDefinition = ____item_id_36
    local ____item_id_42 = item.id
    local ____item_name_43 = item.name
    local ____item_heroId_44 = item.heroId
    local ____item_heroName_45 = item.heroName
    local ____temp_46 = item.price or item.purchasePrice or item.pricePoints or item.tokenPrice or item.costPoints
    local ____item_sort_47 = item.sort
    local ____item_contentType_48 = item.contentType
    local ____item_classification_49 = item.classification
    local ____item_titleText_50 = item.titleText
    local ____item_lotteryPoolEligible_37 = item.lotteryPoolEligible
    if ____item_lotteryPoolEligible_37 == nil then
        ____item_lotteryPoolEligible_37 = localDefinition ~= nil
    end
    return {
        id = ____item_id_42,
        name = ____item_name_43,
        heroId = ____item_heroId_44,
        heroName = ____item_heroName_45,
        price = ____temp_46,
        sort = ____item_sort_47,
        contentType = ____item_contentType_48,
        classification = ____item_classification_49,
        titleText = ____item_titleText_50,
        lotteryPoolEligible = ____item_lotteryPoolEligible_37,
        lotteryDisplayAbility = item.lotteryDisplayAbility or localDefinition and localDefinition.displayAbility,
        lotteryAbilityType = item.lotteryAbilityType or localDefinition and localDefinition.abilityType
    }
end
function Showcase.NormalizeOptions(self, options)
    local result = {}
    for ____, option in ipairs(options or ({})) do
        result[#result + 1] = {
            id = option.id or option.itemId or option.rewardCode,
            itemId = option.itemId or option.id,
            rewardCode = option.rewardCode,
            name = option.name,
            heroId = option.heroId,
            heroName = option.heroName,
            price = option.price,
            titleText = option.titleText
        }
    end
    return result
end
function Showcase.TryApplyAwakeningForCurrentHero(self, steamId, itemId, profile)
    if not itemId then
        return
    end
    local playerId = ____exports.Showcase:FindPlayerIdBySteamId(steamId)
    if playerId == nil then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero then
        return
    end
    local catalogItem = ____exports.Showcase:FindCatalogItem(itemId)
    local activation = ____exports.Showcase:FindActivation(profile, itemId)
    local heroId = catalogItem and catalogItem.heroId or activation and activation.heroId
    if not HeroNameHelper:IsSameBackendHero(hero, heroId) then
        return
    end
    local abilityName = catalogItem and catalogItem.name or ____exports.Showcase:GetAbilityNameFromCode(catalogItem and catalogItem.id) or ____exports.Showcase:GetAbilityNameFromCode(activation and activation.rewardCode) or ____exports.Showcase:GetAbilityNameFromCode(itemId)
    if not abilityName then
        return
    end
    Treasure:ApplyAwakeningImmediately(playerId, hero, abilityName)
    ApiClient:DebugLog((((("[Showcase] applied current hero awakening immediately steamId=" .. tostring(steamId)) .. ", hero=") .. HeroNameHelper:GetBackendHeroName(hero)) .. ", ability=") .. abilityName)
end
function Showcase.FindPlayerIdBySteamId(self, steamId)
    local result
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if PlayerResource:GetSteamAccountID(playerId) == steamId then
            result = playerId
        end
    end)
    return result
end
function Showcase.FindCatalogItem(self, itemId)
    for ____, item in ipairs(____exports.Showcase.catalogCache or ({})) do
        if item.id == itemId or item.name == itemId or ____exports.Showcase:GetAbilityNameFromCode(item.id) == ____exports.Showcase:GetAbilityNameFromCode(itemId) then
            return item
        end
    end
    return nil
end
function Showcase.FindActivation(self, profile, itemId)
    local activation = profile and profile.awakeningActivation
    if not activation then
        return nil
    end
    local direct = activation[itemId] or activation[____exports.Showcase:GetAbilityNameFromCode(itemId)]
    if direct ~= nil then
        return direct
    end
    local abilityName = ____exports.Showcase:GetAbilityNameFromCode(itemId)
    for key in pairs(activation) do
        local item = activation[key]
        if ____exports.Showcase:GetAbilityNameFromCode(key) == abilityName or ____exports.Showcase:GetAbilityNameFromCode(item and item.rewardCode) == abilityName then
            return item
        end
    end
    return nil
end
function Showcase.GetAbilityNameFromCode(self, code)
    if not code then
        return ""
    end
    return __TS__StringReplace(
        __TS__StringReplace(code, "ability:", ""),
        "item:",
        ""
    )
end
function Showcase.ClearMessageSoon(self, steamId, message)
    Timers:CreateTimer(
        2.5,
        function()
            local current = ____exports.Showcase:GetCurrentTable(steamId)
            if (current and current.message) == message then
                ____exports.Showcase:MergeShowcase(steamId, {message = ""})
            end
            return nil
        end
    )
end
function Showcase.GetCurrentTable(self, steamId)
    local key = tostring(steamId)
    local cached = ____exports.Showcase.tableCache[key]
    if cached then
        return cached
    end
    local current = CustomNetTables:GetTableValue("showcase_table", key)
    if current then
        ____exports.Showcase.tableCache[key] = current
    end
    return current
end
function Showcase.MergeShowcase(self, steamId, patch)
    ____exports.Showcase:SaveShowcase(
        steamId,
        __TS__ObjectAssign(
            {},
            ____exports.Showcase:GetCurrentTable(steamId) or ({}),
            patch
        )
    )
end
function Showcase.SaveShowcase(self, steamId, data)
    local key = tostring(steamId)
    ____exports.Showcase.tableCache[key] = data
    CustomNetTables:SetTableValue("showcase_table", key, data)
end
function Showcase.Text(self, steamId, zh, en)
    return PlayerLanguage:GetApiLang(steamId) == "en" and en or zh
end
Showcase.PROFILE_URL = "/showcase/profile"
Showcase.CATALOG_URL = "/showcase/catalog"
Showcase.PURCHASE_URL = "/showcase/purchase"
Showcase.RANDOM_BOX_OPEN_URL = "/showcase/random-box/open"
Showcase.RANDOM_BOX_CLAIM_URL = "/showcase/random-box/claim"
Showcase.AWAKENING_ACTIVATE_URL = "/showcase/awakening/activate"
Showcase.AWAKENING_LOTTERY_POOL_UNLOCK_URL = "/showcase/awakening/lottery-pool/unlock-random"
Showcase.AWAKENING_COLLECTION_ID = "showcase-awakenings"
Showcase.requestedSteamIds = __TS__New(Set)
Showcase.catalogLoading = false
Showcase.lotteryPoolLoadedSteamIds = __TS__New(Set)
Showcase.lotteryPoolLoadingSteamIds = __TS__New(Set)
Showcase.lotteryPoolWaiters = {}
Showcase.lotteryPoolRetryAfter = {}
Showcase.LOTTERY_POOL_RETRY_COOLDOWN = 30
Showcase.tableCache = {}
Showcase.profileLoadGeneration = 0
return ____exports
