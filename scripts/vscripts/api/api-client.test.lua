local ____lualib = require("lualib_bundle")
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__ArrayFlat = ____lualib.__TS__ArrayFlat
local __TS__ArrayJoin = ____lualib.__TS__ArrayJoin
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/api-client.test.lua"
__TS__SourceMapTraceBack("api/api-client.test.lua", {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 5,["17"] = 5,["18"] = 5,["19"] = 5,["20"] = 6,["21"] = 6,["22"] = 6,["23"] = 7,["24"] = 8,["25"] = 11,["26"] = 12,["27"] = 13,["28"] = 14,["29"] = 15,["30"] = 16,["31"] = 17,["32"] = 18,["33"] = 19,["34"] = 6,["35"] = 6,["36"] = 22,["37"] = 22,["38"] = 22,["39"] = 22,["40"] = 23,["41"] = 24,["42"] = 25,["43"] = 26,["44"] = 26,["45"] = 26,["46"] = 26,["47"] = 26,["48"] = 26,["49"] = 32,["50"] = 32,["51"] = 32,["52"] = 32,["53"] = 32,["54"] = 32,["55"] = 32,["56"] = 40,["57"] = 41,["58"] = 43,["59"] = 44,["60"] = 45,["61"] = 46,["62"] = 22,["63"] = 22,["64"] = 49,["65"] = 49,["66"] = 49,["67"] = 49,["68"] = 50,["69"] = 51,["70"] = 52,["71"] = 56,["72"] = 57,["73"] = 57,["74"] = 57,["75"] = 57,["76"] = 57,["77"] = 57,["78"] = 57,["79"] = 65,["80"] = 65,["81"] = 65,["82"] = 65,["83"] = 67,["84"] = 68,["85"] = 69,["86"] = 70,["87"] = 71,["88"] = 49,["89"] = 49,["90"] = 74,["91"] = 74,["92"] = 74,["93"] = 74,["95"] = 75,["96"] = 76,["97"] = 77,["98"] = 79,["99"] = 80,["100"] = 80,["101"] = 80,["102"] = 80,["103"] = 79,["104"] = 79,["105"] = 79,["106"] = 88,["108"] = 74,["109"] = 74,["110"] = 94,["111"] = 94,["112"] = 94,["113"] = 94,["115"] = 95,["116"] = 96,["117"] = 97,["118"] = 98,["119"] = 99,["120"] = 101,["121"] = 102,["122"] = 102,["123"] = 102,["124"] = 102,["125"] = 101,["126"] = 101,["127"] = 101,["128"] = 110,["129"] = 111,["131"] = 94,["132"] = 94,["133"] = 117,["134"] = 117,["135"] = 117,["136"] = 117,["137"] = 118,["138"] = 119,["139"] = 120,["140"] = 124,["141"] = 125,["142"] = 125,["143"] = 125,["144"] = 125,["145"] = 125,["146"] = 125,["147"] = 125,["148"] = 125,["149"] = 125,["150"] = 135,["151"] = 135,["152"] = 135,["153"] = 135,["154"] = 137,["155"] = 138,["156"] = 139,["157"] = 140,["158"] = 117,["159"] = 117,["160"] = 143,["161"] = 143,["162"] = 143,["163"] = 143,["164"] = 144,["165"] = 145,["166"] = 145,["167"] = 145,["168"] = 145,["169"] = 145,["170"] = 145,["171"] = 145,["172"] = 145,["173"] = 153,["174"] = 154,["175"] = 158,["176"] = 159,["177"] = 159,["178"] = 159,["179"] = 159,["180"] = 159,["181"] = 159,["182"] = 159,["183"] = 159,["184"] = 168,["185"] = 170,["186"] = 171,["187"] = 172,["188"] = 173,["189"] = 174,["190"] = 143,["191"] = 143,["192"] = 177,["193"] = 177,["194"] = 177,["195"] = 177,["196"] = 178,["197"] = 179,["198"] = 179,["199"] = 179,["200"] = 179,["201"] = 179,["202"] = 179,["203"] = 179,["204"] = 179,["205"] = 187,["206"] = 188,["207"] = 192,["208"] = 193,["209"] = 193,["210"] = 193,["211"] = 193,["212"] = 193,["213"] = 193,["214"] = 193,["215"] = 193,["216"] = 193,["217"] = 203,["218"] = 205,["219"] = 206,["220"] = 207,["221"] = 208,["222"] = 209,["223"] = 177,["224"] = 177,["225"] = 212,["226"] = 212,["227"] = 212,["228"] = 212,["229"] = 213,["230"] = 214,["231"] = 214,["232"] = 214,["233"] = 214,["234"] = 214,["235"] = 214,["236"] = 214,["237"] = 214,["238"] = 222,["239"] = 223,["240"] = 224,["241"] = 225,["242"] = 225,["243"] = 225,["244"] = 225,["245"] = 225,["246"] = 225,["247"] = 225,["248"] = 225,["249"] = 234,["250"] = 236,["251"] = 237,["252"] = 238,["253"] = 239,["254"] = 212,["255"] = 212,["256"] = 242,["257"] = 242,["258"] = 242,["259"] = 242,["260"] = 243,["261"] = 244,["262"] = 244,["263"] = 244,["264"] = 244,["265"] = 244,["266"] = 244,["267"] = 244,["268"] = 244,["269"] = 252,["270"] = 254,["271"] = 254,["272"] = 254,["273"] = 254,["274"] = 254,["275"] = 254,["276"] = 261,["277"] = 262,["278"] = 263,["279"] = 264,["280"] = 267,["281"] = 270,["282"] = 270,["283"] = 270,["284"] = 270,["285"] = 270,["286"] = 270,["287"] = 270,["288"] = 242,["289"] = 242,["290"] = 275,["291"] = 275,["292"] = 275,["293"] = 275,["294"] = 276,["295"] = 277,["296"] = 278,["297"] = 278,["298"] = 278,["299"] = 278,["300"] = 278,["301"] = 278,["302"] = 278,["303"] = 278,["304"] = 286,["305"] = 288,["306"] = 288,["307"] = 288,["308"] = 288,["309"] = 288,["310"] = 288,["311"] = 288,["312"] = 288,["313"] = 302,["314"] = 307,["315"] = 275,["316"] = 275,["317"] = 312,["318"] = 312,["319"] = 312,["320"] = 312,["321"] = 313,["322"] = 314,["323"] = 314,["324"] = 314,["325"] = 314,["326"] = 315,["327"] = 315,["328"] = 315,["329"] = 315,["330"] = 315,["331"] = 315,["332"] = 315,["333"] = 315,["334"] = 323,["335"] = 325,["336"] = 325,["337"] = 325,["338"] = 325,["339"] = 325,["340"] = 325,["341"] = 332,["342"] = 334,["343"] = 334,["344"] = 332,["345"] = 337,["346"] = 337,["347"] = 337,["348"] = 337,["349"] = 337,["350"] = 337,["351"] = 337,["352"] = 312,["353"] = 312,["354"] = 342,["355"] = 342,["356"] = 342,["357"] = 342,["359"] = 343,["360"] = 344,["361"] = 345,["362"] = 345,["363"] = 345,["364"] = 345,["365"] = 345,["366"] = 345,["367"] = 345,["368"] = 345,["369"] = 353,["370"] = 354,["371"] = 356,["372"] = 357,["373"] = 357,["374"] = 357,["375"] = 357,["376"] = 357,["377"] = 357,["378"] = 356,["379"] = 356,["380"] = 356,["381"] = 367,["382"] = 368,["383"] = 369,["384"] = 370,["385"] = 371,["386"] = 372,["387"] = 372,["388"] = 372,["389"] = 372,["391"] = 342,["392"] = 342,["393"] = 378,["394"] = 378,["395"] = 378,["396"] = 378,["397"] = 379,["398"] = 380,["399"] = 381,["400"] = 382,["401"] = 383,["402"] = 384,["403"] = 385,["404"] = 387,["405"] = 387,["406"] = 387,["407"] = 387,["408"] = 387,["409"] = 387,["410"] = 387,["411"] = 387,["412"] = 395,["413"] = 397,["414"] = 402,["415"] = 404,["416"] = 411,["417"] = 412,["418"] = 413,["419"] = 417,["420"] = 418,["421"] = 418,["422"] = 418,["423"] = 418,["424"] = 422,["425"] = 423,["426"] = 423,["427"] = 423,["428"] = 423,["429"] = 427,["430"] = 378,["431"] = 378,["432"] = 430,["433"] = 430,["434"] = 430,["435"] = 430,["436"] = 431,["437"] = 432,["438"] = 433,["439"] = 434,["440"] = 435,["441"] = 437,["442"] = 437,["443"] = 437,["444"] = 437,["445"] = 437,["446"] = 437,["447"] = 437,["448"] = 437,["449"] = 445,["450"] = 447,["451"] = 453,["452"] = 453,["453"] = 453,["454"] = 453,["455"] = 453,["456"] = 453,["457"] = 460,["458"] = 461,["459"] = 465,["460"] = 466,["461"] = 430,["462"] = 430,["463"] = 469,["464"] = 469,["465"] = 469,["466"] = 469,["467"] = 470,["468"] = 471,["469"] = 472,["470"] = 473,["471"] = 474,["472"] = 475,["473"] = 476,["474"] = 478,["475"] = 478,["476"] = 478,["477"] = 478,["478"] = 478,["479"] = 478,["480"] = 478,["481"] = 478,["482"] = 486,["483"] = 488,["484"] = 494,["485"] = 494,["486"] = 494,["487"] = 494,["488"] = 494,["489"] = 494,["490"] = 501,["491"] = 502,["492"] = 506,["493"] = 507,["494"] = 508,["495"] = 469,["496"] = 469,["497"] = 511,["498"] = 511,["499"] = 511,["500"] = 511,["501"] = 512,["502"] = 513,["503"] = 513,["504"] = 513,["505"] = 513,["506"] = 513,["507"] = 513,["508"] = 513,["509"] = 513,["510"] = 521,["511"] = 522,["512"] = 523,["513"] = 525,["514"] = 525,["515"] = 525,["516"] = 525,["517"] = 525,["518"] = 525,["519"] = 525,["520"] = 525,["521"] = 534,["522"] = 535,["523"] = 540,["524"] = 541,["525"] = 511,["526"] = 511,["527"] = 546,["528"] = 546,["529"] = 546,["530"] = 546,["531"] = 547,["532"] = 548,["533"] = 549,["534"] = 550,["535"] = 550,["536"] = 550,["537"] = 549,["538"] = 552,["539"] = 552,["540"] = 552,["541"] = 552,["542"] = 552,["543"] = 552,["544"] = 552,["545"] = 552,["546"] = 560,["547"] = 561,["548"] = 563,["549"] = 563,["550"] = 563,["551"] = 563,["552"] = 563,["553"] = 563,["554"] = 563,["555"] = 571,["556"] = 572,["558"] = 572,["560"] = 573,["562"] = 573,["564"] = 574,["566"] = 574,["568"] = 576,["569"] = 577,["570"] = 578,["571"] = 579,["572"] = 546,["573"] = 546,["574"] = 5,["575"] = 5,["576"] = 585,["577"] = 585,["578"] = 585,["579"] = 585,["580"] = 586,["581"] = 586,["582"] = 586,["583"] = 586,["584"] = 587,["585"] = 587,["586"] = 587,["587"] = 587,["588"] = 586,["589"] = 586,["590"] = 585,["591"] = 585});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____api_2Elocal_game_auth = require("api.local_game_auth")
local LocalGameAuth = ____api_2Elocal_game_auth.LocalGameAuth
local ____client_2Dapi_2Dtransport = require("api.client-api-transport")
local ClientApiTransport = ____client_2Dapi_2Dtransport.ClientApiTransport
describe(
    nil,
    "ApiClient",
    function()
        beforeEach(
            nil,
            function()
                local testGlobal = _G
                testGlobal.json = {encode = jest:fn(function(____, value) return JSON:stringify(value) end)}
                testGlobal.print = jest:fn()
                testGlobal.IsInToolsMode = jest:fn(function() return false end)
                testGlobal.GetDedicatedServerKeyV3 = jest:fn(function(____, _version) return "real-server-key" end)
                testGlobal.GetSystemTimeMS = jest:fn(function() return 0 end)
                testGlobal.GetSystemDate = jest:fn(function() return "07/31/26" end)
                testGlobal.GetSystemTime = jest:fn(function() return "22:48:08" end)
                testGlobal.RandomInt = jest:fn(function() return 123456789 end)
                ApiClient:SetSimulateHttpUnavailableForTools(false)
                ClientApiTransport:SetRelayEnabled(false)
            end
        )
        it(
            nil,
            "routes allowlisted backup and host-override calls through the active client relay",
            function()
                local testGlobal = _G
                testGlobal.CreateHTTPRequestScriptVM = jest:fn()
                local relay = jest:spyOn(ClientApiTransport, "TrySendApiRequest"):mockReturnValue(true)
                local settingRequest = {
                    method = HttpMethod.PUT,
                    path = "/player/123/setting",
                    body = {customModeOptionsJson = "{}"},
                    successFunc = jest:fn()
                }
                local treasureRequest = {
                    method = HttpMethod.POST,
                    hostOverride = "https://wx.renoomgai.top/api",
                    path = "/game/treasure/prepare",
                    body = {steamId = 123},
                    successFunc = jest:fn()
                }
                ApiClient:sendToBackupHost(settingRequest)
                ApiClient:sendWithRetry(treasureRequest)
                expect(nil, relay):toHaveBeenNthCalledWith(1, settingRequest)
                expect(nil, relay):toHaveBeenNthCalledWith(2, treasureRequest)
                expect(nil, testGlobal.CreateHTTPRequestScriptVM)["not"]:toHaveBeenCalled()
                relay:mockRestore()
            end
        )
        it(
            nil,
            "falls back to client relay when the engine cannot create an HTTP request",
            function()
                local testGlobal = _G
                testGlobal.CreateHTTPRequestScriptVM = jest:fn(function() return nil end)
                local relay = jest:spyOn(ClientApiTransport, "TrySendApiRequest"):mockReturnValueOnce(false):mockReturnValueOnce(true)
                local failureFunc = jest:fn()
                local apiParameter = {
                    method = HttpMethod.GET,
                    path = "/activity/current",
                    retryTimes = 1,
                    successFunc = jest:fn(),
                    failureFunc = failureFunc
                }
                expect(
                    nil,
                    function() return ApiClient:sendToBackupHost(apiParameter) end
                )["not"]:toThrow()
                expect(nil, testGlobal.CreateHTTPRequestScriptVM):toHaveBeenCalledTimes(1)
                expect(nil, relay):toHaveBeenNthCalledWith(1, apiParameter)
                expect(nil, relay):toHaveBeenNthCalledWith(2, apiParameter, true)
                expect(nil, failureFunc)["not"]:toHaveBeenCalled()
                relay:mockRestore()
            end
        )
        it(
            nil,
            "reports a missing direct HTTP request as status zero",
            function()
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    local testGlobal = _G
                    testGlobal.CreateHTTPRequestScriptVM = jest:fn(function() return nil end)
                    local callback = jest:fn()
                    __TS__Await(ApiClient:send(
                        {
                            method = HttpMethod.GET,
                            path = "/activity/current",
                            successFunc = jest:fn()
                        },
                        callback
                    ))
                    expect(nil, callback):toHaveBeenCalledWith({StatusCode = 0, Body = "http request unavailable"})
                end)
            end
        )
        it(
            nil,
            "simulates an unavailable HTTP transport in Tools Mode without calling the engine",
            function()
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    local testGlobal = _G
                    testGlobal.IsInToolsMode = jest:fn(function() return true end)
                    testGlobal.CreateHTTPRequestScriptVM = jest:fn()
                    ApiClient:SetSimulateHttpUnavailableForTools(true)
                    local callback = jest:fn()
                    __TS__Await(ApiClient:send(
                        {
                            method = HttpMethod.GET,
                            path = "/activity/current",
                            successFunc = jest:fn()
                        },
                        callback
                    ))
                    expect(nil, testGlobal.CreateHTTPRequestScriptVM)["not"]:toHaveBeenCalled()
                    expect(nil, callback):toHaveBeenCalledWith({StatusCode = 0, Body = "http request unavailable"})
                end)
            end
        )
        it(
            nil,
            "falls back treasure requests when the engine cannot create an HTTP request",
            function()
                local testGlobal = _G
                testGlobal.CreateHTTPRequestScriptVM = jest:fn(function() return nil end)
                local relay = jest:spyOn(ClientApiTransport, "TrySendApiRequest"):mockReturnValueOnce(false):mockReturnValueOnce(true)
                local failureFunc = jest:fn()
                local apiParameter = {
                    method = HttpMethod.POST,
                    hostOverride = "https://wx.renoomgai.top/api",
                    path = "/game/treasure/prepare",
                    body = {steamId = 123},
                    retryTimes = 1,
                    successFunc = jest:fn(),
                    failureFunc = failureFunc
                }
                expect(
                    nil,
                    function() return ApiClient:sendWithRetry(apiParameter) end
                )["not"]:toThrow()
                expect(nil, relay):toHaveBeenNthCalledWith(1, apiParameter)
                expect(nil, relay):toHaveBeenNthCalledWith(2, apiParameter, true)
                expect(nil, failureFunc)["not"]:toHaveBeenCalled()
                relay:mockRestore()
            end
        )
        it(
            nil,
            "falls back once to client relay after backup retries are exhausted",
            function()
                local testGlobal = _G
                local request = {
                    SetHTTPRequestGetOrPostParameter = jest:fn(),
                    SetHTTPRequestNetworkActivityTimeout = jest:fn(),
                    SetHTTPRequestAbsoluteTimeoutMS = jest:fn(),
                    SetHTTPRequestHeaderValue = jest:fn(),
                    SetHTTPRequestRawPostBody = jest:fn(),
                    Send = jest:fn(function(____, callback) return callback(nil, {StatusCode = 0, Body = "unreachable"}) end)
                }
                testGlobal.CreateHTTPRequestScriptVM = jest:fn(function() return request end)
                local relay = jest:spyOn(ClientApiTransport, "TrySendApiRequest"):mockReturnValueOnce(false):mockReturnValueOnce(true)
                local failureFunc = jest:fn()
                local apiParameter = {
                    method = HttpMethod.PUT,
                    path = "/player/123/setting",
                    body = {customModeOptionsJson = "{}"},
                    retryTimes = 1,
                    successFunc = jest:fn(),
                    failureFunc = failureFunc
                }
                ApiClient:sendToBackupHost(apiParameter)
                expect(nil, testGlobal.CreateHTTPRequestScriptVM):toHaveBeenCalledTimes(1)
                expect(nil, relay):toHaveBeenNthCalledWith(1, apiParameter)
                expect(nil, relay):toHaveBeenNthCalledWith(2, apiParameter, true)
                expect(nil, failureFunc)["not"]:toHaveBeenCalled()
                relay:mockRestore()
            end
        )
        it(
            nil,
            "falls back once to client relay after host-override retries are exhausted",
            function()
                local testGlobal = _G
                local request = {
                    SetHTTPRequestGetOrPostParameter = jest:fn(),
                    SetHTTPRequestNetworkActivityTimeout = jest:fn(),
                    SetHTTPRequestAbsoluteTimeoutMS = jest:fn(),
                    SetHTTPRequestHeaderValue = jest:fn(),
                    SetHTTPRequestRawPostBody = jest:fn(),
                    Send = jest:fn(function(____, callback) return callback(nil, {StatusCode = 0, Body = "unreachable"}) end)
                }
                testGlobal.CreateHTTPRequestScriptVM = jest:fn(function() return request end)
                local relay = jest:spyOn(ClientApiTransport, "TrySendApiRequest"):mockReturnValueOnce(false):mockReturnValueOnce(true)
                local failureFunc = jest:fn()
                local apiParameter = {
                    method = HttpMethod.POST,
                    hostOverride = "https://wx.renoomgai.top/api",
                    path = "/game/treasure/prepare",
                    body = {steamId = 123},
                    retryTimes = 1,
                    successFunc = jest:fn(),
                    failureFunc = failureFunc
                }
                ApiClient:sendWithRetry(apiParameter)
                expect(nil, testGlobal.CreateHTTPRequestScriptVM):toHaveBeenCalledTimes(1)
                expect(nil, relay):toHaveBeenNthCalledWith(1, apiParameter)
                expect(nil, relay):toHaveBeenNthCalledWith(2, apiParameter, true)
                expect(nil, failureFunc)["not"]:toHaveBeenCalled()
                relay:mockRestore()
            end
        )
        it(
            nil,
            "does not replay a mutation through client relay after an explicit HTTP failure",
            function()
                local testGlobal = _G
                local request = {
                    SetHTTPRequestGetOrPostParameter = jest:fn(),
                    SetHTTPRequestNetworkActivityTimeout = jest:fn(),
                    SetHTTPRequestAbsoluteTimeoutMS = jest:fn(),
                    SetHTTPRequestHeaderValue = jest:fn(),
                    SetHTTPRequestRawPostBody = jest:fn(),
                    Send = jest:fn(function(____, callback) return callback(nil, {StatusCode = 409, Body = "conflict"}) end)
                }
                testGlobal.CreateHTTPRequestScriptVM = jest:fn(function() return request end)
                local relay = jest:spyOn(ClientApiTransport, "TrySendApiRequest"):mockReturnValue(false)
                local failureFunc = jest:fn()
                local apiParameter = {
                    method = HttpMethod.POST,
                    path = "/showcase/purchase",
                    body = {steamId = 123, itemId = "item", quantity = 1},
                    retryTimes = 1,
                    successFunc = jest:fn(),
                    failureFunc = failureFunc
                }
                ApiClient:sendToBackupHost(apiParameter)
                expect(nil, relay):toHaveBeenCalledTimes(1)
                expect(nil, relay):toHaveBeenCalledWith(apiParameter)
                expect(nil, failureFunc):toHaveBeenCalledWith("conflict")
                relay:mockRestore()
            end
        )
        it(
            nil,
            "uses the real dedicated server key for backup host requests",
            function()
                local testGlobal = _G
                local request = {
                    SetHTTPRequestGetOrPostParameter = jest:fn(),
                    SetHTTPRequestNetworkActivityTimeout = jest:fn(),
                    SetHTTPRequestAbsoluteTimeoutMS = jest:fn(),
                    SetHTTPRequestHeaderValue = jest:fn(),
                    SetHTTPRequestRawPostBody = jest:fn(),
                    Send = jest:fn(function(____, callback) return callback(nil, {StatusCode = 200, Body = "{}"}) end)
                }
                testGlobal.CreateHTTPRequestScriptVM = jest:fn(function(____, _method, _url) return request end)
                ApiClient:sendToBackupHost({
                    method = HttpMethod.POST,
                    path = "/game/end",
                    body = {matchId = "1"},
                    successFunc = jest:fn()
                })
                expect(nil, testGlobal.GetDedicatedServerKeyV3):toHaveBeenCalledWith("v2")
                expect(nil, request.SetHTTPRequestHeaderValue):toHaveBeenCalledWith("x-api-key", "real-server-key")
                expect(nil, request.SetHTTPRequestHeaderValue)["not"]:toHaveBeenCalledWith("x-local-game", "true")
                expect(nil, testGlobal.print):toHaveBeenCalledWith(expect:stringContaining("GetDedicatedServerKeyV3('v2')=[dedicated key redacted, length=15]"))
                expect(nil, testGlobal.print):toHaveBeenCalledWith("[GameEndAPI] response: phase=final, wave=none, attempt=1/3, status=200, body={}")
                expect(
                    nil,
                    __TS__ArrayJoin(
                        __TS__ArrayFlat(testGlobal.print.mock.calls),
                        "\n"
                    )
                )["not"]:toContain("\"matchId\":\"1\"")
            end
        )
        it(
            nil,
            "prints invalid dedicated server key values for game/end diagnosis",
            function()
                local testGlobal = _G
                testGlobal.GetDedicatedServerKeyV3 = jest:fn(function() return "Invalid_NoSteamConnection" end)
                local request = {
                    SetHTTPRequestGetOrPostParameter = jest:fn(),
                    SetHTTPRequestNetworkActivityTimeout = jest:fn(),
                    SetHTTPRequestAbsoluteTimeoutMS = jest:fn(),
                    SetHTTPRequestHeaderValue = jest:fn(),
                    SetHTTPRequestRawPostBody = jest:fn(),
                    Send = jest:fn(function(____, callback) return callback(nil, {StatusCode = 401, Body = "unauthorized"}) end)
                }
                testGlobal.CreateHTTPRequestScriptVM = jest:fn(function() return request end)
                ApiClient:sendToBackupHost({
                    method = HttpMethod.POST,
                    path = "/game/end",
                    body = {matchId = "0", abyssWave = 10, isAbyssProgress = true, players = {{steamId = 0}}},
                    successFunc = jest:fn(),
                    failureFunc = jest:fn(),
                    retryTimes = 1
                })
                expect(nil, testGlobal.print):toHaveBeenCalledWith(expect:stringContaining("GetDedicatedServerKeyV3('v2')=Invalid_NoSteamConnection, localHmac=false"))
                expect(nil, testGlobal.print):toHaveBeenCalledWith("[GameEndAPI] response: phase=progress, wave=10, attempt=1/1, status=401, body=unauthorized")
            end
        )
        it(
            nil,
            "bounds game/end response bodies while preserving phase and wave",
            function()
                local testGlobal = _G
                local responseBody = string.rep(
                    "x",
                    math.floor(600)
                )
                local request = {
                    SetHTTPRequestGetOrPostParameter = jest:fn(),
                    SetHTTPRequestNetworkActivityTimeout = jest:fn(),
                    SetHTTPRequestAbsoluteTimeoutMS = jest:fn(),
                    SetHTTPRequestHeaderValue = jest:fn(),
                    SetHTTPRequestRawPostBody = jest:fn(),
                    Send = jest:fn(function(____, callback) return callback(nil, {StatusCode = 200, Body = responseBody}) end)
                }
                testGlobal.CreateHTTPRequestScriptVM = jest:fn(function() return request end)
                ApiClient:sendToBackupHost({
                    method = HttpMethod.POST,
                    path = "/game/end",
                    body = {matchId = "1", abyssWave = 25, isAbyssProgress = false},
                    successFunc = jest:fn()
                })
                expect(nil, testGlobal.print):toHaveBeenCalledWith(expect:stringContaining(("phase=final, wave=25, attempt=1/3, status=200, body=" .. string.rep(
                    "x",
                    math.floor(512)
                )) .. "...[truncated,length=600]"))
                expect(
                    nil,
                    __TS__ArrayJoin(
                        __TS__ArrayFlat(testGlobal.print.mock.calls),
                        "\n"
                    )
                )["not"]:toContain(responseBody)
            end
        )
        it(
            nil,
            "signs treasure requests with the dedicated server key",
            function()
                return __TS__AsyncAwaiter(function(____awaiter_resolve)
                    local testGlobal = _G
                    testGlobal.GetSystemTimeMS = jest:fn(function() return 1722300000123 end)
                    local request = {
                        SetHTTPRequestGetOrPostParameter = jest:fn(),
                        SetHTTPRequestNetworkActivityTimeout = jest:fn(),
                        SetHTTPRequestAbsoluteTimeoutMS = jest:fn(),
                        SetHTTPRequestHeaderValue = jest:fn(),
                        SetHTTPRequestRawPostBody = jest:fn(),
                        Send = jest:fn(function(____, callback) return callback(nil, {StatusCode = 200, Body = "{}"}) end)
                    }
                    testGlobal.CreateHTTPRequestScriptVM = jest:fn(function() return request end)
                    local body = {steamId = 123, matchId = "456", heroName = "npc_dota_hero_axe"}
                    __TS__Await(ApiClient:send(
                        {
                            method = HttpMethod.POST,
                            hostOverride = "https://wx.renoomgai.top/api",
                            path = "/game/treasure/prepare",
                            body = body,
                            successFunc = jest:fn()
                        },
                        jest:fn()
                    ))
                    local timestamp = "1722300000"
                    local nonce = "1722300000_123456789_123456789"
                    local canonical = ((timestamp .. "|") .. nonce) .. "|/api/game/treasure/prepare|123|456|npc_dota_hero_axe"
                    expect(nil, request.SetHTTPRequestHeaderValue):toHaveBeenCalledWith("x-game-timestamp", timestamp)
                    expect(nil, request.SetHTTPRequestHeaderValue):toHaveBeenCalledWith("x-game-nonce", nonce)
                    expect(nil, request.SetHTTPRequestHeaderValue):toHaveBeenCalledWith(
                        "x-game-signature",
                        LocalGameAuth:HmacSha256Hex("real-server-key", canonical)
                    )
                end)
            end
        )
        it(
            nil,
            "signs local game/end requests with HMAC and localKeyTimestamp without external preflight",
            function()
                local testGlobal = _G
                testGlobal.GetDedicatedServerKeyV3 = jest:fn(function(____, _version) return ApiClient.LOCAL_APIKEY end)
                testGlobal.GetSystemTimeMS = jest:fn(function() return 0 end)
                testGlobal.GetSystemDate = jest:fn(function() return "07/31/26" end)
                testGlobal.GetSystemTime = jest:fn(function() return "22:48:08" end)
                testGlobal.pcall = jest:fn(function() return {true, {LOCAL_GAME_API_SECRET = "test-secret"}} end)
                testGlobal.require = jest:fn()
                local gameEndRequest = {
                    SetHTTPRequestGetOrPostParameter = jest:fn(),
                    SetHTTPRequestNetworkActivityTimeout = jest:fn(),
                    SetHTTPRequestAbsoluteTimeoutMS = jest:fn(),
                    SetHTTPRequestHeaderValue = jest:fn(),
                    SetHTTPRequestRawPostBody = jest:fn(),
                    Send = jest:fn(function(____, callback) return callback(nil, {StatusCode = 200, Body = "{}"}) end)
                }
                testGlobal.CreateHTTPRequestScriptVM = jest:fn():mockReturnValue(gameEndRequest)
                local body = {matchId = "8920529326", winnerTeamId = 2, players = {{steamId = 123}, {steamId = 0}, {steamId = 456}}}
                local successFunc = jest:fn()
                ApiClient:sendToBackupHost({method = HttpMethod.POST, path = "/game/end", body = body, successFunc = successFunc})
                local payload = "8920529326|1785509288|2|123,0,456"
                expect(nil, testGlobal.CreateHTTPRequestScriptVM):toHaveBeenCalledTimes(1)
                expect(nil, testGlobal.CreateHTTPRequestScriptVM):toHaveBeenCalledWith("POST", "https://wx.renoomgai.top/api/game/end")
                expect(nil, body):toMatchObject({localKeyTimestamp = 1785509288})
                expect(nil, gameEndRequest.SetHTTPRequestHeaderValue):toHaveBeenCalledWith(
                    "x-api-key",
                    LocalGameAuth:HmacSha256Hex("test-secret", payload)
                )
                expect(nil, gameEndRequest.SetHTTPRequestHeaderValue):toHaveBeenCalledWith("x-local-game", "true")
                expect(nil, gameEndRequest.SetHTTPRequestRawPostBody):toHaveBeenCalledWith(
                    "application/json",
                    JSON:stringify(body)
                )
                expect(nil, successFunc):toHaveBeenCalledWith("{}")
            end
        )
        it(
            nil,
            "does not block local game/end on the external timestamp request when system time is available",
            function()
                local testGlobal = _G
                testGlobal.GetDedicatedServerKeyV3 = jest:fn(function(____, _version) return ApiClient.LOCAL_APIKEY end)
                testGlobal.GetSystemTimeMS = jest:fn(function() return 1722300000123 end)
                testGlobal.pcall = jest:fn(function() return {true, {LOCAL_GAME_API_SECRET = "test-secret"}} end)
                testGlobal.require = jest:fn()
                local gameEndRequest = {
                    SetHTTPRequestGetOrPostParameter = jest:fn(),
                    SetHTTPRequestNetworkActivityTimeout = jest:fn(),
                    SetHTTPRequestAbsoluteTimeoutMS = jest:fn(),
                    SetHTTPRequestHeaderValue = jest:fn(),
                    SetHTTPRequestRawPostBody = jest:fn(),
                    Send = jest:fn(function(____, callback) return callback(nil, {StatusCode = 200, Body = "{}"}) end)
                }
                testGlobal.CreateHTTPRequestScriptVM = jest:fn():mockReturnValue(gameEndRequest)
                local body = {matchId = "8920529326", winnerTeamId = 2, players = {{steamId = 123}}}
                ApiClient:sendToBackupHost({
                    method = HttpMethod.POST,
                    path = "/game/end",
                    body = body,
                    successFunc = jest:fn()
                })
                expect(nil, testGlobal.CreateHTTPRequestScriptVM):toHaveBeenCalledTimes(1)
                expect(nil, testGlobal.CreateHTTPRequestScriptVM):toHaveBeenCalledWith("POST", "https://wx.renoomgai.top/api/game/end")
                expect(nil, body):toMatchObject({localKeyTimestamp = 1722300000})
                expect(nil, gameEndRequest.SetHTTPRequestHeaderValue):toHaveBeenCalledWith("x-local-game", "true")
            end
        )
        it(
            nil,
            "still sends local game/end when system unix time is unavailable",
            function()
                local testGlobal = _G
                testGlobal.GetDedicatedServerKeyV3 = jest:fn(function(____, _version) return ApiClient.LOCAL_APIKEY end)
                testGlobal.GetSystemTimeMS = jest:fn(function() return 123456 end)
                testGlobal.GetSystemDate = jest:fn(function() return "07/31/26" end)
                testGlobal.GetSystemTime = jest:fn(function() return "22:48:08" end)
                testGlobal.pcall = jest:fn(function() return {true, {LOCAL_GAME_API_SECRET = "test-secret"}} end)
                testGlobal.require = jest:fn()
                local gameEndRequest = {
                    SetHTTPRequestGetOrPostParameter = jest:fn(),
                    SetHTTPRequestNetworkActivityTimeout = jest:fn(),
                    SetHTTPRequestAbsoluteTimeoutMS = jest:fn(),
                    SetHTTPRequestHeaderValue = jest:fn(),
                    SetHTTPRequestRawPostBody = jest:fn(),
                    Send = jest:fn(function(____, callback) return callback(nil, {StatusCode = 200, Body = "{}"}) end)
                }
                testGlobal.CreateHTTPRequestScriptVM = jest:fn():mockReturnValue(gameEndRequest)
                local body = {matchId = "8920529326", winnerTeamId = 2, players = {{steamId = 123}}}
                ApiClient:sendToBackupHost({
                    method = HttpMethod.POST,
                    path = "/game/end",
                    body = body,
                    successFunc = jest:fn()
                })
                expect(nil, testGlobal.CreateHTTPRequestScriptVM):toHaveBeenCalledTimes(1)
                expect(nil, testGlobal.CreateHTTPRequestScriptVM):toHaveBeenCalledWith("POST", "https://wx.renoomgai.top/api/game/end")
                expect(nil, body):toMatchObject({localKeyTimestamp = 1785509288})
                expect(nil, gameEndRequest.SetHTTPRequestHeaderValue):toHaveBeenCalledWith("x-local-game", "true")
                expect(nil, gameEndRequest.Send):toHaveBeenCalled()
            end
        )
        it(
            nil,
            "recreates and retries game/end when the engine rejects Send",
            function()
                local testGlobal = _G
                local request = {
                    SetHTTPRequestGetOrPostParameter = jest:fn(),
                    SetHTTPRequestNetworkActivityTimeout = jest:fn(),
                    SetHTTPRequestAbsoluteTimeoutMS = jest:fn(),
                    SetHTTPRequestHeaderValue = jest:fn(),
                    SetHTTPRequestRawPostBody = jest:fn(),
                    Send = jest:fn(function() return false end)
                }
                testGlobal.CreateHTTPRequestScriptVM = jest:fn(function() return request end)
                local failureFunc = jest:fn()
                local attemptFunc = jest:fn()
                ApiClient:sendToBackupHost({
                    method = HttpMethod.POST,
                    path = "/game/end",
                    body = {matchId = "1"},
                    successFunc = jest:fn(),
                    failureFunc = failureFunc,
                    attemptFunc = attemptFunc
                })
                expect(nil, testGlobal.CreateHTTPRequestScriptVM):toHaveBeenCalledTimes(3)
                expect(nil, attemptFunc.mock.calls):toEqual({{1, 3}, {2, 3}, {3, 3}})
                expect(nil, failureFunc):toHaveBeenCalledWith("request send rejected")
                expect(nil, testGlobal.print):toHaveBeenCalledWith("[GameEndAPI] send-rejected: phase=final, wave=none, attempt=3/3")
            end
        )
        it(
            nil,
            "recreates and retries game/end when no HTTP callback arrives",
            function()
                local testGlobal = _G
                local timers = {}
                testGlobal.Timers = {CreateTimer = jest:fn(function(____, options)
                    local ____temp_0 = #timers + 1
                    timers[____temp_0] = options
                    return ____temp_0
                end)}
                local request = {
                    SetHTTPRequestGetOrPostParameter = jest:fn(),
                    SetHTTPRequestNetworkActivityTimeout = jest:fn(),
                    SetHTTPRequestAbsoluteTimeoutMS = jest:fn(),
                    SetHTTPRequestHeaderValue = jest:fn(),
                    SetHTTPRequestRawPostBody = jest:fn(),
                    Send = jest:fn(function() return true end)
                }
                testGlobal.CreateHTTPRequestScriptVM = jest:fn(function() return request end)
                local failureFunc = jest:fn()
                ApiClient:sendToBackupHost({
                    method = HttpMethod.POST,
                    path = "/game/end",
                    body = {matchId = "1", abyssWave = 6},
                    successFunc = jest:fn(),
                    failureFunc = failureFunc
                })
                expect(nil, timers):toHaveLength(1)
                local ____opt_1 = table.remove(timers, 1)
                if ____opt_1 ~= nil then
                    ____opt_1:callback()
                end
                local ____opt_3 = table.remove(timers, 1)
                if ____opt_3 ~= nil then
                    ____opt_3:callback()
                end
                local ____opt_5 = table.remove(timers, 1)
                if ____opt_5 ~= nil then
                    ____opt_5:callback()
                end
                expect(nil, testGlobal.CreateHTTPRequestScriptVM):toHaveBeenCalledTimes(3)
                expect(nil, request.SetHTTPRequestAbsoluteTimeoutMS):toHaveBeenCalledWith(11000)
                expect(nil, failureFunc):toHaveBeenCalledWith("request callback timeout")
                expect(nil, testGlobal.print):toHaveBeenCalledWith("[GameEndAPI] timeout: phase=final, wave=6, attempt=3/3")
            end
        )
    end
)
describe(
    nil,
    "LocalGameAuth",
    function()
        it(
            nil,
            "produces lowercase HMAC SHA256 hex",
            function()
                expect(
                    nil,
                    LocalGameAuth:HmacSha256Hex("key", "The quick brown fox jumps over the lazy dog")
                ):toBe("f7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8")
            end
        )
    end
)
return ____exports
