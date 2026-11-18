local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/showcase.test.lua"
__TS__SourceMapTraceBack("api/showcase.test.lua", {["10"] = 21,["11"] = 21,["12"] = 22,["13"] = 22,["14"] = 1,["15"] = 1,["16"] = 1,["17"] = 2,["18"] = 2,["19"] = 2,["20"] = 1,["21"] = 1,["22"] = 1,["23"] = 1,["24"] = 8,["25"] = 8,["26"] = 8,["27"] = 8,["28"] = 11,["29"] = 11,["30"] = 11,["31"] = 11,["32"] = 14,["33"] = 14,["34"] = 14,["35"] = 14,["36"] = 17,["37"] = 17,["38"] = 17,["39"] = 17,["40"] = 24,["41"] = 24,["42"] = 24,["43"] = 24,["44"] = 25,["45"] = 26,["46"] = 27,["47"] = 28,["48"] = 30,["49"] = 30,["50"] = 30,["51"] = 31,["52"] = 32,["53"] = 38,["54"] = 32,["55"] = 42,["56"] = 43,["57"] = 44,["58"] = 44,["59"] = 44,["61"] = 44,["62"] = 44,["64"] = 44,["65"] = 42,["66"] = 46,["67"] = 47,["68"] = 48,["69"] = 42,["70"] = 42,["71"] = 51,["72"] = 51,["73"] = 51,["74"] = 51,["75"] = 55,["76"] = 56,["77"] = 57,["78"] = 58,["79"] = 59,["80"] = 30,["81"] = 30,["82"] = 62,["83"] = 62,["84"] = 62,["85"] = 63,["86"] = 64,["87"] = 65,["88"] = 66,["89"] = 67,["90"] = 67,["92"] = 62,["93"] = 62,["94"] = 70,["95"] = 70,["96"] = 70,["97"] = 70,["98"] = 71,["99"] = 72,["100"] = 73,["101"] = 73,["102"] = 73,["103"] = 73,["104"] = 74,["105"] = 74,["106"] = 74,["107"] = 74,["108"] = 77,["109"] = 77,["110"] = 77,["111"] = 77,["112"] = 80,["113"] = 81,["114"] = 82,["115"] = 83,["117"] = 89,["118"] = 94,["119"] = 97,["120"] = 97,["121"] = 97,["122"] = 97,["123"] = 97,["124"] = 97,["125"] = 97,["126"] = 94,["127"] = 100,["128"] = 112,["129"] = 116,["130"] = 117,["131"] = 117,["132"] = 117,["133"] = 117,["134"] = 117,["135"] = 116,["136"] = 127,["137"] = 128,["138"] = 128,["139"] = 128,["140"] = 128,["141"] = 128,["142"] = 128,["143"] = 127,["144"] = 70,["145"] = 70,["146"] = 139,["147"] = 139,["148"] = 139,["149"] = 139,["150"] = 140,["151"] = 151,["152"] = 155,["153"] = 156,["154"] = 157,["155"] = 169,["156"] = 178,["157"] = 179,["158"] = 180,["159"] = 181,["160"] = 182,["161"] = 139,["162"] = 139,["163"] = 185,["164"] = 185,["165"] = 185,["166"] = 185,["167"] = 186,["168"] = 192,["169"] = 193,["170"] = 209,["171"] = 209,["172"] = 209,["173"] = 209,["174"] = 213,["175"] = 213,["176"] = 212,["177"] = 185,["178"] = 185,["179"] = 218,["180"] = 218,["181"] = 218,["182"] = 218,["183"] = 219,["184"] = 220,["185"] = 221,["186"] = 223,["187"] = 224,["188"] = 225,["189"] = 225,["190"] = 225,["191"] = 225,["192"] = 227,["193"] = 228,["194"] = 229,["195"] = 230,["196"] = 231,["197"] = 233,["198"] = 234,["199"] = 234,["200"] = 234,["201"] = 234,["202"] = 235,["203"] = 218,["204"] = 218,["205"] = 238,["206"] = 238,["207"] = 238,["208"] = 238,["209"] = 239,["210"] = 240,["211"] = 241,["212"] = 243,["213"] = 250,["214"] = 251,["215"] = 251,["216"] = 251,["217"] = 251,["218"] = 252,["219"] = 252,["220"] = 252,["221"] = 252,["222"] = 256,["223"] = 238,["224"] = 238,["225"] = 261,["226"] = 261,["227"] = 261,["228"] = 261,["229"] = 262,["230"] = 263,["231"] = 263,["232"] = 263,["233"] = 263,["234"] = 264,["235"] = 266,["236"] = 273,["237"] = 273,["238"] = 273,["239"] = 273,["240"] = 261,["241"] = 261,["242"] = 278,["243"] = 278,["244"] = 278,["245"] = 282,["246"] = 283,["247"] = 284,["248"] = 285,["249"] = 278,["250"] = 278,["251"] = 288,["252"] = 288,["253"] = 288,["254"] = 288,["255"] = 289,["256"] = 290,["257"] = 292,["258"] = 298,["259"] = 307,["260"] = 308,["261"] = 309,["262"] = 288,["263"] = 288,["264"] = 24,["265"] = 24});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local ____showcase = require("api.showcase")
local Showcase = ____showcase.Showcase
jest:mock(
    "./api-client",
    function() return {
        ApiClient = {
            sendToBackupHost = jest:fn(),
            DebugLog = jest:fn()
        },
        HttpMethod = {GET = "GET", POST = "POST", PUT = "PUT"}
    } end
)
jest:mock(
    "./player-language",
    function() return {PlayerLanguage = {GetApiLang = jest:fn(function() return "zh" end)}} end
)
jest:mock(
    "../modules/helper/player-helper",
    function() return {PlayerHelper = {ForEachPlayer = jest:fn()}} end
)
jest:mock(
    "../modules/helper/hero-name-helper",
    function() return {HeroNameHelper = {IsSameBackendHero = jest:fn(function() return false end)}} end
)
jest:mock(
    "../modules/treasure/treasure",
    function() return {Treasure = {ApplyAwakeningImmediately = jest:fn()}} end
)
describe(
    nil,
    "Showcase compact game API responses",
    function()
        local listeners = {}
        local tables = {}
        local currentTime = 12.5
        local lagNetTableReads = false
        beforeAll(
            nil,
            function()
                local testGlobal = _G
                testGlobal.CustomGameEventManager = {RegisterListener = jest:fn(function(____, eventName, callback)
                    listeners[eventName] = callback
                end)}
                testGlobal.CustomNetTables = {
                    GetTableValue = jest:fn(function(____, ____table, key)
                        local ____lagNetTableReads_2
                        if lagNetTableReads then
                            ____lagNetTableReads_2 = nil
                        else
                            local ____opt_0 = tables[____table]
                            ____lagNetTableReads_2 = ____opt_0 and ____opt_0[key]
                        end
                        return ____lagNetTableReads_2
                    end),
                    SetTableValue = jest:fn(function(____, ____table, key, value)
                        tables[____table] = tables[____table] or ({})
                        tables[____table][key] = value
                    end)
                }
                testGlobal.PlayerResource = {
                    GetSteamAccountID = jest:fn(function() return 123 end),
                    GetSelectedHeroEntity = jest:fn(function() return nil end)
                }
                testGlobal.GameRules = {Script_GetMatchID = jest:fn(function() return 456 end)}
                testGlobal.Time = jest:fn(function() return currentTime end)
                testGlobal.Timers = {CreateTimer = jest:fn()}
                testGlobal.json = {decode = function(____, value) return {JSON:parse(value)} end}
                __TS__New(Showcase)
            end
        )
        beforeEach(
            nil,
            function()
                jest:clearAllMocks()
                currentTime = 12.5
                lagNetTableReads = false
                Showcase.tableCache = {}
                for ____, key in ipairs(__TS__ObjectKeys(tables)) do
                    __TS__Delete(tables, key)
                end
            end
        )
        it(
            nil,
            "requests and decodes the compact v2 profile and catalog projections",
            function()
                Showcase:RefreshShowcase(123)
                Showcase:RefreshShowcase(123)
                local requests = __TS__ArrayMap(
                    ApiClient.sendToBackupHost.mock.calls,
                    function(____, call) return call[0] end
                )
                local profileRequests = __TS__ArrayFilter(
                    requests,
                    function(____, request) return request.path == "/showcase/profile" end
                )
                local catalogRequests = __TS__ArrayFilter(
                    requests,
                    function(____, request) return request.path == "/showcase/catalog" end
                )
                expect(nil, profileRequests):toHaveLength(2)
                expect(nil, catalogRequests):toHaveLength(1)
                for ____, request in ipairs(profileRequests) do
                    expect(nil, request):toEqual(expect:objectContaining({querys = expect:objectContaining({compact = "game-v2"})}))
                end
                expect(nil, catalogRequests[1]):toEqual(expect:objectContaining({querys = expect:objectContaining({compact = "game-v2"})}))
                profileRequests[1]:successFunc(JSON:stringify({code = 200, data = {
                    p = 99,
                    b = 2,
                    bp = 8000,
                    o = {"test"},
                    a = {"test"},
                    c = {},
                    lp = {"test"}
                }}))
                catalogRequests[1]:successFunc(JSON:stringify({code = 200, data = {v = "test", p = 8000, i = {{"test", "axe"}}, l = {{"test", "break_speed_limit", "passive"}}}}))
                local result = tables.showcase_table["123"]
                expect(nil, result.profile):toEqual(expect:objectContaining({
                    points = 99,
                    inventory = {random_box_awakening = 2},
                    ownedAwakenings = {"ability:test"},
                    lotteryPoolAwakenings = {"ability:test"},
                    awakeningActivation = {["ability:test"] = expect:objectContaining({active = true, canActivate = false})}
                }))
                expect(nil, result.catalog):toEqual({expect:objectContaining({
                    id = "ability:test",
                    heroId = "npc_dota_hero_axe",
                    price = 8000,
                    lotteryPoolEligible = true,
                    lotteryDisplayAbility = "break_speed_limit",
                    lotteryAbilityType = "passive"
                })})
            end
        )
        it(
            nil,
            "requests compact box data and merges its partial profile into cached profile",
            function()
                tables.showcase_table = {["123"] = {profile = {points = 100, inventory = {random_box_awakening = 2, item_kept = 7}, ownedAwakenings = {"ability:kept"}, awakeningActivation = {["ability:kept"] = {active = true}}}}}
                listeners:showcase_random_box_open(0, {PlayerID = 0, collectionId = "showcase-awakenings"})
                local request = ApiClient.sendToBackupHost.mock.calls[1][0]
                expect(nil, request.body):toEqual(expect:objectContaining({compact = true}))
                request:successFunc(JSON:stringify({code = 200, data = {openId = "box-1", collectionId = "showcase-awakenings", options = {{id = "ability:new"}}, profile = {points = 90, inventory = {random_box_awakening = 1}}}}))
                local result = tables.showcase_table["123"]
                expect(nil, result.profile.points):toBe(90)
                expect(nil, result.profile.inventory):toEqual({random_box_awakening = 1, item_kept = 7})
                expect(nil, result.profile.ownedAwakenings):toEqual({"ability:kept"})
                expect(nil, result.profile.awakeningActivation["ability:kept"]):toEqual({active = true})
                expect(nil, result.randomBox.openId):toBe("box-1")
            end
        )
        it(
            nil,
            "continues to decode full legacy profile and catalog responses",
            function()
                local decoder = Showcase
                local profile = {points = 12, ownedAwakenings = {"ability:legacy"}}
                local catalog = {collections = {{id = "showcase-awakenings", contentType = "ability", items = {{id = "ability:legacy", name = "legacy", heroId = "npc_dota_hero_axe", contentType = "ability"}}}}}
                expect(
                    nil,
                    decoder:DecodeProfileResponse(JSON:stringify({code = 200, data = profile}))
                ):toEqual(profile)
                local ____opt_5 = decoder:DecodeCatalogResponse(JSON:stringify({code = 200, data = catalog})).collections
                local ____opt_3 = ____opt_5 and ____opt_5[1].items
                expect(nil, ____opt_3 and ____opt_3[1]):toEqual(expect:objectContaining({id = "ability:legacy", heroId = "npc_dota_hero_axe"}))
            end
        )
        it(
            nil,
            "only marks the lottery pool loaded after success and throttles failed retries",
            function()
                local failedCallback = jest:fn()
                Showcase:EnsureLotteryPoolLoaded(789, failedCallback)
                local failedRequest = ApiClient.sendToBackupHost.mock.calls[1][0]
                failedRequest:failureFunc("transport failed")
                expect(nil, failedCallback):toHaveBeenCalledWith(false)
                expect(
                    nil,
                    Showcase:IsLotteryPoolLoaded(789)
                ):toBe(false)
                local requestCount = #ApiClient.sendToBackupHost.mock.calls
                local throttledCallback = jest:fn()
                Showcase:EnsureLotteryPoolLoaded(789, throttledCallback)
                expect(nil, throttledCallback):toHaveBeenCalledWith(false)
                expect(nil, ApiClient.sendToBackupHost):toHaveBeenCalledTimes(requestCount)
                currentTime = 50
                Showcase:EnsureLotteryPoolLoaded(
                    789,
                    jest:fn()
                )
                expect(nil, ApiClient.sendToBackupHost):toHaveBeenCalledTimes(requestCount + 1)
            end
        )
        it(
            nil,
            "logs and exposes lottery-pool awakenings after profile load",
            function()
                local loadedCallback = jest:fn()
                Showcase:EnsureLotteryPoolLoaded(790, loadedCallback)
                local request = ApiClient.sendToBackupHost.mock.calls[1][0]
                request:successFunc(JSON:stringify({code = 200, data = {p = 100, lp = {"juggernaut_blade_fury_custom", "imba_batrider_flaming_lasso_enhanced"}}}))
                expect(nil, loadedCallback):toHaveBeenCalledWith(true)
                expect(
                    nil,
                    Showcase:IsLotteryPoolLoaded(790)
                ):toBe(true)
                expect(
                    nil,
                    Showcase:GetLotteryPoolAwakenings(790)
                ):toEqual({"ability:juggernaut_blade_fury_custom", "ability:imba_batrider_flaming_lasso_enhanced"})
                expect(nil, ApiClient.DebugLog):toHaveBeenCalledWith(expect:stringContaining("lotteryPoolAwakenings=ability:juggernaut_blade_fury_custom"))
            end
        )
        it(
            nil,
            "keeps profile data in the server cache when net-table reads lag behind writes",
            function()
                lagNetTableReads = true
                Showcase:EnsureLotteryPoolLoaded(
                    791,
                    jest:fn()
                )
                local request = ApiClient.sendToBackupHost.mock.calls[1][0]
                request:successFunc(JSON:stringify({code = 200, data = {p = 100, lp = {"juggernaut_blade_fury_custom"}}}))
                expect(
                    nil,
                    Showcase:GetLotteryPoolAwakenings(791)
                ):toEqual({"ability:juggernaut_blade_fury_custom"})
            end
        )
        it:each({{"showcase_purchase", {PlayerID = 0, itemId = "ability:test"}}, {"showcase_random_box_claim", {PlayerID = 0, openId = "box-1", selectedItemId = "ability:test"}}, {"showcase_awakening_activate", {PlayerID = 0, itemId = "ability:test"}}})(
            nil,
            "requests compact mutation response for %s",
            function(____, eventName, event)
                listeners[eventName](listeners, 0, event)
                local request = ApiClient.sendToBackupHost.mock.calls[1][0]
                expect(nil, request.body):toEqual(expect:objectContaining({compact = true}))
            end
        )
        it(
            nil,
            "uses a stable request id and compact game-v2 profile for lottery-pool unlock",
            function()
                listeners:showcase_awakening_lottery_pool_unlock(0, {PlayerID = 0})
                local request = ApiClient.sendToBackupHost.mock.calls[1][0]
                expect(nil, request.body):toEqual(expect:objectContaining({compact = "game-v2", requestId = "awakening-pool-123-456-12500"}))
                request:successFunc(JSON:stringify({code = 200, data = {unlockedItemId = "ability:test", profile = {p = 7000, o = {"test"}, lp = {"test"}}}}))
                local result = tables.showcase_table["123"]
                expect(nil, result.profile.points):toBe(7000)
                expect(nil, result.profile.lotteryPoolAwakenings):toEqual({"ability:test"})
            end
        )
    end
)
return ____exports
