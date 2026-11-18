local ____lualib = require("lualib_bundle")
local __TS__ArraySetLength = ____lualib.__TS__ArraySetLength
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayJoin = ____lualib.__TS__ArrayJoin
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/client-api-transport.test.lua"
__TS__SourceMapTraceBack("api/client-api-transport.test.lua", {["13"] = 5,["14"] = 5,["15"] = 6,["16"] = 6,["17"] = 7,["18"] = 7,["19"] = 8,["20"] = 8,["21"] = 1,["22"] = 1,["23"] = 1,["24"] = 2,["25"] = 2,["26"] = 1,["27"] = 1,["28"] = 10,["29"] = 10,["30"] = 10,["31"] = 10,["32"] = 11,["33"] = 12,["34"] = 17,["35"] = 19,["36"] = 20,["37"] = 28,["38"] = 29,["39"] = 30,["40"] = 31,["41"] = 32,["42"] = 33,["43"] = 19,["44"] = 36,["45"] = 37,["46"] = 36,["47"] = 45,["48"] = 45,["49"] = 45,["50"] = 46,["51"] = 47,["52"] = 48,["53"] = 50,["54"] = 47,["55"] = 53,["56"] = 55,["57"] = 47,["58"] = 47,["59"] = 59,["60"] = 59,["61"] = 59,["62"] = 59,["63"] = 59,["64"] = 59,["65"] = 59,["66"] = 66,["67"] = 67,["68"] = 68,["69"] = 69,["70"] = 70,["71"] = 71,["72"] = 71,["73"] = 71,["74"] = 71,["75"] = 75,["76"] = 76,["77"] = 45,["78"] = 45,["79"] = 79,["80"] = 79,["81"] = 79,["82"] = 80,["83"] = 81,["84"] = 82,["85"] = 83,["86"] = 84,["87"] = 87,["88"] = 88,["89"] = 89,["90"] = 90,["91"] = 91,["92"] = 79,["93"] = 79,["94"] = 94,["95"] = 94,["96"] = 94,["97"] = 94,["98"] = 96,["99"] = 96,["100"] = 96,["101"] = 96,["102"] = 97,["103"] = 98,["104"] = 99,["105"] = 99,["106"] = 99,["107"] = 99,["108"] = 99,["109"] = 99,["110"] = 99,["111"] = 106,["112"] = 109,["113"] = 110,["114"] = 111,["115"] = 111,["116"] = 110,["117"] = 113,["118"] = 116,["120"] = 118,["121"] = 118,["122"] = 119,["123"] = 119,["124"] = 119,["125"] = 119,["126"] = 119,["127"] = 119,["128"] = 119,["129"] = 118,["132"] = 128,["133"] = 129,["134"] = 96,["135"] = 96,["136"] = 134,["137"] = 134,["138"] = 134,["139"] = 134,["140"] = 135,["141"] = 138,["142"] = 139,["143"] = 141,["144"] = 146,["145"] = 150,["146"] = 150,["147"] = 150,["148"] = 150,["149"] = 151,["150"] = 152,["151"] = 153,["152"] = 154,["153"] = 154,["154"] = 153,["155"] = 160,["156"] = 165,["157"] = 166,["158"] = 134,["159"] = 134,["160"] = 169,["161"] = 169,["162"] = 169,["163"] = 169,["164"] = 170,["165"] = 173,["166"] = 177,["167"] = 177,["168"] = 177,["169"] = 177,["170"] = 177,["171"] = 183,["172"] = 183,["173"] = 183,["174"] = 183,["175"] = 184,["176"] = 185,["177"] = 185,["178"] = 184,["179"] = 169,["180"] = 169,["181"] = 192,["182"] = 192,["183"] = 192,["184"] = 192,["185"] = 193,["186"] = 194,["187"] = 197,["188"] = 198,["189"] = 199,["190"] = 199,["191"] = 199,["192"] = 202,["193"] = 202,["194"] = 202,["195"] = 199,["196"] = 199,["197"] = 199,["198"] = 199,["199"] = 207,["200"] = 208,["201"] = 211,["202"] = 211,["203"] = 211,["204"] = 211,["205"] = 214,["206"] = 215,["207"] = 216,["208"] = 216,["209"] = 216,["210"] = 216,["211"] = 216,["212"] = 216,["213"] = 216,["214"] = 217,["215"] = 218,["216"] = 218,["217"] = 217,["218"] = 224,["219"] = 224,["220"] = 224,["221"] = 224,["223"] = 225,["224"] = 225,["225"] = 226,["226"] = 226,["227"] = 226,["228"] = 226,["229"] = 226,["230"] = 226,["231"] = 226,["232"] = 226,["233"] = 225,["236"] = 235,["237"] = 236,["238"] = 192,["239"] = 192,["240"] = 239,["241"] = 239,["242"] = 239,["243"] = 239,["244"] = 240,["245"] = 241,["246"] = 244,["247"] = 245,["248"] = 250,["249"] = 250,["250"] = 250,["251"] = 250,["252"] = 253,["253"] = 253,["254"] = 253,["255"] = 253,["256"] = 254,["257"] = 254,["258"] = 254,["259"] = 254,["260"] = 255,["262"] = 257,["263"] = 257,["264"] = 258,["265"] = 258,["266"] = 258,["267"] = 258,["268"] = 258,["269"] = 258,["270"] = 258,["271"] = 258,["272"] = 257,["275"] = 268,["276"] = 239,["277"] = 239,["278"] = 271,["279"] = 271,["280"] = 271,["281"] = 271,["282"] = 272,["283"] = 273,["284"] = 276,["285"] = 277,["286"] = 278,["287"] = 278,["288"] = 279,["289"] = 279,["290"] = 279,["291"] = 279,["292"] = 279,["293"] = 279,["294"] = 278,["295"] = 278,["296"] = 287,["297"] = 287,["298"] = 287,["299"] = 287,["300"] = 290,["301"] = 291,["302"] = 291,["303"] = 291,["304"] = 291,["305"] = 291,["306"] = 291,["307"] = 291,["308"] = 291,["309"] = 299,["310"] = 299,["311"] = 299,["312"] = 299,["313"] = 299,["314"] = 299,["315"] = 299,["316"] = 299,["317"] = 307,["318"] = 308,["319"] = 309,["320"] = 311,["321"] = 311,["322"] = 312,["323"] = 312,["324"] = 312,["325"] = 312,["326"] = 311,["327"] = 311,["328"] = 318,["329"] = 318,["330"] = 319,["331"] = 319,["332"] = 319,["333"] = 319,["334"] = 318,["335"] = 318,["336"] = 271,["337"] = 271,["338"] = 327,["339"] = 327,["340"] = 327,["341"] = 327,["342"] = 328,["343"] = 329,["344"] = 332,["345"] = 332,["346"] = 332,["347"] = 332,["348"] = 332,["349"] = 332,["350"] = 338,["351"] = 338,["352"] = 338,["353"] = 338,["354"] = 341,["355"] = 341,["356"] = 341,["357"] = 341,["358"] = 341,["359"] = 341,["360"] = 341,["361"] = 342,["362"] = 342,["363"] = 342,["364"] = 342,["365"] = 327,["366"] = 327,["367"] = 345,["368"] = 345,["369"] = 345,["370"] = 345,["371"] = 345,["372"] = 345,["373"] = 345,["374"] = 345,["375"] = 345,["376"] = 345,["377"] = 345,["378"] = 345,["379"] = 345,["380"] = 345,["381"] = 345,["382"] = 345,["383"] = 345,["384"] = 345,["385"] = 345,["386"] = 345,["387"] = 345,["388"] = 345,["389"] = 345,["390"] = 345,["391"] = 366,["392"] = 367,["393"] = 368,["394"] = 371,["395"] = 371,["396"] = 371,["397"] = 371,["398"] = 371,["399"] = 371,["400"] = 371,["401"] = 371,["402"] = 345,["403"] = 345,["404"] = 376,["405"] = 376,["406"] = 376,["407"] = 376,["408"] = 380,["409"] = 380,["410"] = 380,["411"] = 380,["412"] = 380,["413"] = 380,["414"] = 376,["415"] = 376,["416"] = 376,["417"] = 376,["418"] = 381,["419"] = 382,["420"] = 383,["421"] = 383,["422"] = 383,["423"] = 383,["424"] = 383,["425"] = 383,["426"] = 383,["427"] = 383,["428"] = 376,["429"] = 376,["430"] = 388,["431"] = 388,["432"] = 388,["433"] = 388,["434"] = 389,["435"] = 392,["436"] = 392,["437"] = 392,["438"] = 392,["439"] = 392,["440"] = 398,["441"] = 398,["442"] = 398,["443"] = 398,["444"] = 399,["445"] = 399,["446"] = 399,["447"] = 399,["448"] = 400,["449"] = 400,["450"] = 400,["451"] = 400,["452"] = 401,["453"] = 401,["454"] = 401,["455"] = 401,["456"] = 388,["457"] = 388,["458"] = 404,["459"] = 404,["460"] = 404,["461"] = 404,["462"] = 405,["463"] = 406,["464"] = 407,["465"] = 408,["466"] = 412,["467"] = 412,["468"] = 412,["469"] = 412,["470"] = 412,["471"] = 417,["472"] = 417,["473"] = 418,["474"] = 418,["475"] = 418,["476"] = 417,["477"] = 417,["478"] = 421,["479"] = 422,["480"] = 422,["481"] = 422,["482"] = 422,["483"] = 423,["484"] = 424,["485"] = 425,["486"] = 404,["487"] = 404,["488"] = 428,["489"] = 428,["490"] = 428,["491"] = 428,["492"] = 429,["493"] = 430,["494"] = 433,["495"] = 434,["496"] = 435,["497"] = 440,["498"] = 445,["499"] = 445,["500"] = 445,["501"] = 445,["502"] = 448,["503"] = 448,["504"] = 448,["505"] = 448,["506"] = 448,["507"] = 448,["508"] = 448,["509"] = 448,["510"] = 448,["511"] = 448,["512"] = 450,["513"] = 451,["514"] = 451,["515"] = 451,["516"] = 451,["517"] = 451,["518"] = 451,["519"] = 451,["520"] = 451,["521"] = 451,["522"] = 451,["523"] = 451,["524"] = 459,["525"] = 459,["526"] = 459,["527"] = 459,["528"] = 460,["529"] = 460,["530"] = 460,["531"] = 460,["532"] = 460,["533"] = 460,["534"] = 460,["535"] = 460,["536"] = 460,["537"] = 460,["538"] = 461,["539"] = 462,["540"] = 428,["541"] = 428,["542"] = 465,["543"] = 465,["544"] = 465,["545"] = 465,["546"] = 466,["547"] = 467,["548"] = 468,["549"] = 469,["550"] = 472,["551"] = 474,["552"] = 475,["553"] = 472,["554"] = 478,["555"] = 479,["556"] = 480,["557"] = 481,["558"] = 481,["559"] = 481,["560"] = 481,["561"] = 481,["562"] = 486,["563"] = 486,["564"] = 486,["565"] = 486,["566"] = 487,["567"] = 487,["568"] = 465,["569"] = 465,["570"] = 490,["571"] = 490,["572"] = 490,["573"] = 490,["574"] = 491,["575"] = 492,["576"] = 493,["577"] = 499,["578"] = 500,["579"] = 500,["580"] = 499,["581"] = 490,["582"] = 490,["583"] = 507,["584"] = 507,["585"] = 507,["586"] = 507,["587"] = 508,["588"] = 509,["589"] = 510,["590"] = 511,["591"] = 513,["592"] = 514,["593"] = 511,["594"] = 517,["595"] = 518,["596"] = 519,["597"] = 520,["598"] = 521,["599"] = 522,["600"] = 528,["601"] = 528,["602"] = 529,["603"] = 529,["605"] = 529,["606"] = 529,["608"] = 529,["609"] = 528,["610"] = 528,["611"] = 531,["612"] = 531,["613"] = 531,["614"] = 531,["615"] = 531,["616"] = 531,["617"] = 531,["618"] = 538,["619"] = 538,["620"] = 539,["621"] = 540,["623"] = 541,["624"] = 540,["626"] = 540,["627"] = 538,["628"] = 538,["629"] = 544,["630"] = 545,["631"] = 547,["632"] = 548,["633"] = 548,["634"] = 548,["635"] = 548,["636"] = 548,["637"] = 548,["638"] = 548,["639"] = 548,["640"] = 548,["641"] = 548,["642"] = 558,["643"] = 559,["644"] = 559,["645"] = 559,["646"] = 559,["647"] = 559,["648"] = 559,["649"] = 559,["650"] = 559,["651"] = 559,["652"] = 559,["653"] = 569,["654"] = 570,["655"] = 507,["656"] = 507,["657"] = 573,["658"] = 573,["659"] = 573,["660"] = 573,["661"] = 574,["662"] = 575,["663"] = 576,["664"] = 577,["665"] = 579,["666"] = 580,["667"] = 577,["668"] = 583,["669"] = 584,["670"] = 585,["671"] = 586,["672"] = 587,["673"] = 587,["674"] = 587,["675"] = 587,["676"] = 587,["677"] = 587,["678"] = 587,["679"] = 594,["680"] = 594,["681"] = 595,["682"] = 595,["684"] = 595,["685"] = 595,["687"] = 595,["688"] = 594,["689"] = 594,["690"] = 597,["691"] = 597,["692"] = 597,["693"] = 597,["694"] = 597,["695"] = 597,["696"] = 597,["697"] = 604,["698"] = 605,["699"] = 605,["700"] = 606,["701"] = 606,["702"] = 607,["703"] = 607,["705"] = 607,["706"] = 607,["708"] = 607,["709"] = 606,["710"] = 605,["711"] = 605,["712"] = 573,["713"] = 573,["714"] = 612,["715"] = 612,["716"] = 612,["717"] = 612,["718"] = 613,["719"] = 614,["720"] = 615,["721"] = 616,["722"] = 618,["723"] = 619,["724"] = 616,["725"] = 622,["726"] = 623,["727"] = 624,["728"] = 625,["729"] = 626,["730"] = 626,["731"] = 626,["732"] = 626,["733"] = 626,["734"] = 631,["735"] = 631,["736"] = 632,["737"] = 632,["739"] = 632,["740"] = 632,["742"] = 632,["743"] = 631,["744"] = 631,["745"] = 634,["746"] = 635,["747"] = 636,["748"] = 637,["749"] = 637,["750"] = 638,["751"] = 638,["752"] = 639,["753"] = 640,["755"] = 641,["756"] = 640,["758"] = 640,["759"] = 638,["760"] = 637,["761"] = 637,["762"] = 612,["763"] = 612,["764"] = 647,["765"] = 647,["766"] = 647,["767"] = 647,["768"] = 648,["769"] = 649,["770"] = 650,["771"] = 652,["772"] = 653,["773"] = 650,["774"] = 656,["775"] = 657,["776"] = 658,["777"] = 659,["778"] = 660,["779"] = 661,["780"] = 666,["781"] = 666,["782"] = 667,["783"] = 667,["785"] = 667,["786"] = 667,["788"] = 667,["789"] = 666,["790"] = 666,["791"] = 669,["792"] = 669,["793"] = 669,["794"] = 669,["795"] = 669,["796"] = 669,["797"] = 669,["798"] = 669,["799"] = 677,["800"] = 677,["801"] = 678,["802"] = 679,["804"] = 680,["805"] = 679,["807"] = 679,["808"] = 677,["809"] = 677,["810"] = 683,["811"] = 684,["812"] = 685,["813"] = 685,["814"] = 685,["815"] = 685,["816"] = 685,["817"] = 685,["818"] = 685,["819"] = 692,["820"] = 693,["821"] = 647,["822"] = 647,["823"] = 10,["824"] = 10});
local ____exports = {}
local ____api_2Elocal_game_auth = require("api.local_game_auth")
local LocalGameAuth = ____api_2Elocal_game_auth.LocalGameAuth
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____client_2Dapi_2Dcodec = require("api.client-api-codec")
local ClientApiCodec = ____client_2Dapi_2Dcodec.ClientApiCodec
local ____client_2Dapi_2Dtransport = require("api.client-api-transport")
local ClientApiTransport = ____client_2Dapi_2Dtransport.ClientApiTransport
jest:mock(
    "../modules/helper/player-helper",
    function() return {PlayerHelper = {
        ForEachPlayer = jest:fn(),
        IsHumanPlayerByPlayerId = jest:fn(function() return true end)
    }} end
)
describe(
    nil,
    "ClientApiTransport",
    function()
        local listeners = {}
        local sent = {}
        local currentTime = 100
        local function resetTransportState(self)
            local state = ClientApiTransport
            state.endUploads = {}
            state.relayResponses = {}
            state.relayPeers = {}
            state.primaryPlayerId = nil
            state.relayQueue = {}
            state.relayQueueBytes = 0
        end
        local function registerV2Relay(self, playerId, clientNonce)
            listeners:client_api_transport_ready(0, {PlayerID = playerId, protocolVersion = 2, clientNonce = clientNonce, sequence = 1})
        end
        beforeAll(
            nil,
            function()
                local testGlobal = _G
                testGlobal.CustomGameEventManager = {
                    RegisterListener = jest:fn(function(____, eventName, callback)
                        listeners[eventName] = callback
                    end),
                    Send_ServerToPlayer = jest:fn(function(____, player, eventName, payload)
                        sent[#sent + 1] = {player = player, eventName = eventName, payload = payload}
                    end)
                }
                testGlobal.PlayerResource = {
                    GetPlayer = jest:fn(function(____, playerId) return {id = playerId} end),
                    GetSteamAccountID = jest:fn(function() return 123 end),
                    GetConnectionState = jest:fn(function() return 2 end),
                    IsValidPlayer = jest:fn(function() return true end),
                    IsFakeClient = jest:fn(function() return false end)
                }
                testGlobal.Timers = {CreateTimer = jest:fn()}
                testGlobal.RandomInt = jest:fn(function() return 123456789 end)
                testGlobal.Time = jest:fn(function() return currentTime end)
                testGlobal.GetDedicatedServerKeyV3 = jest:fn(function() return "Invalid_NotOnDedicatedServer" end)
                testGlobal.IsInToolsMode = jest:fn(function() return false end)
                testGlobal.json = {
                    encode = function(____, value) return JSON:stringify(value) end,
                    decode = function(____, value) return {JSON:parse(value)} end
                }
                testGlobal.print = jest:fn()
                ClientApiTransport:RegisterListeners()
            end
        )
        beforeEach(
            nil,
            function()
                currentTime = 100
                resetTransportState(nil)
                __TS__ArraySetLength(sent, 0)
                jest:clearAllMocks()
                _G.GetDedicatedServerKeyV3:mockReturnValue("Invalid_NotOnDedicatedServer")
                jest:spyOn(LocalGameAuth, "GetSecret"):mockReturnValue("test-secret")
                PlayerHelper.IsHumanPlayerByPlayerId:mockImplementation(function() return true end)
                ClientApiTransport:SetRelayEnabled(false)
                listeners:client_api_transport_ready(0, {PlayerID = 0})
                __TS__ArraySetLength(sent, 0)
            end
        )
        afterAll(
            nil,
            function() return jest:restoreAllMocks() end
        )
        it(
            nil,
            "reassembles HTML title chunks from the expected player",
            function()
                local success = jest:fn()
                local failure = jest:fn()
                ClientApiTransport:FetchGameStart(
                    {{playerId = 0, steamId = 123}},
                    "456",
                    false,
                    success,
                    failure
                )
                expect(nil, Timers.CreateTimer):toHaveBeenCalledWith(expect:objectContaining({endTime = 15, useGameTime = false}))
                local request = sent[1].payload
                expect(nil, request.signature):toBe(LocalGameAuth:HmacSha256Hex(
                    "test-secret",
                    ("OMG2|start|" .. tostring(request.requestId)) .. "|123|456|0"
                ))
                local encoded = ClientApiCodec:Encode(JSON:stringify({data = {members = {}, players = {{id = "123"}}}}))
                local chunks = ClientApiCodec:Chunk(encoded, 20)
                do
                    local index = 0
                    while index < #chunks do
                        listeners:client_api_start_chunk(0, {
                            PlayerID = 0,
                            requestId = request.requestId,
                            index = index,
                            total = #chunks,
                            data = chunks[index + 1]
                        })
                        index = index + 1
                    end
                end
                expect(nil, failure)["not"]:toHaveBeenCalled()
                expect(nil, success):toHaveBeenCalledWith(expect:objectContaining({players = {expect:objectContaining({id = "123"})}}))
            end
        )
        it(
            nil,
            "chunks, signs, and acknowledges game/end through one relay player",
            function()
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback) return callback(nil, 0) end)
                local success = jest:fn()
                local failure = jest:fn()
                ClientApiTransport:SendGameEnd({matchId = "456", players = {{steamId = 123}}}, success, failure)
                expect(nil, Timers.CreateTimer):toHaveBeenCalledWith(expect:objectContaining({endTime = 30, useGameTime = false}))
                local chunks = __TS__ArrayFilter(
                    sent,
                    function(____, entry) return entry.eventName == "client_api_game_end_chunk" end
                )
                expect(nil, #chunks):toBeGreaterThan(0)
                local last = chunks[#chunks].payload
                expect(nil, last.signature):toBe(LocalGameAuth:HmacSha256Hex(
                    "test-secret",
                    (((((tostring(last.uploadId) .. "|") .. tostring(last.index)) .. "|") .. tostring(last.total)) .. "|") .. tostring(last.data)
                ))
                listeners:client_api_game_end_ack(0, {PlayerID = 0, uploadId = last.uploadId, success = 1})
                expect(nil, success):toHaveBeenCalledTimes(1)
                expect(nil, failure)["not"]:toHaveBeenCalled()
            end
        )
        it(
            nil,
            "uses the official dedicated key instead of the local secret for game/end relay",
            function()
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback) return callback(nil, 0) end)
                _G.GetDedicatedServerKeyV3:mockReturnValue("official-key")
                ClientApiTransport:SendGameEnd(
                    {matchId = "789", players = {{steamId = 123}}},
                    jest:fn(),
                    jest:fn()
                )
                local chunk = __TS__ArrayFind(
                    sent,
                    function(____, entry) return entry.eventName == "client_api_game_end_chunk" end
                ).payload
                expect(nil, chunk.signature):toBe(LocalGameAuth:HmacSha256Hex(
                    "official-key",
                    (((((tostring(chunk.uploadId) .. "|") .. tostring(chunk.index)) .. "|") .. tostring(chunk.total)) .. "|") .. tostring(chunk.data)
                ))
            end
        )
        it(
            nil,
            "relays a large allowlisted mutation in chunks and restores the upstream response",
            function()
                ClientApiTransport:SetRelayEnabled(true)
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback) return callback(nil, 0) end)
                local success = jest:fn()
                local failure = jest:fn()
                local accepted = ClientApiTransport:TrySendApiRequest({
                    method = "PUT",
                    path = "/player/123/setting",
                    body = {customModeOptionsJson = string.rep(
                        "x",
                        math.floor(8192)
                    )},
                    successFunc = success,
                    failureFunc = failure
                })
                expect(nil, accepted):toBe(true)
                expect(nil, Timers.CreateTimer):toHaveBeenCalledWith(expect:objectContaining({endTime = 45, useGameTime = false}))
                local requestChunks = __TS__ArrayFilter(
                    sent,
                    function(____, entry) return entry.eventName == "client_api_relay_request_chunk" end
                )
                expect(nil, #requestChunks):toBeGreaterThan(10)
                local first = requestChunks[1].payload
                local wholeData = __TS__ArrayJoin(
                    __TS__ArrayMap(
                        requestChunks,
                        function(____, entry) return entry.payload.data end
                    ),
                    ""
                )
                expect(nil, first.signature):toBe(LocalGameAuth:HmacSha256Hex(
                    "test-secret",
                    (("OMG2|relay|" .. tostring(first.requestId)) .. "|PUT|/player/123/setting|") .. wholeData
                ))
                local responseChunks = ClientApiCodec:Chunk(
                    ClientApiCodec:Encode("{\"saved\":true}"),
                    5
                )
                do
                    local index = 0
                    while index < #responseChunks do
                        listeners:client_api_relay_response_chunk(0, {
                            PlayerID = 0,
                            requestId = first.requestId,
                            status = 200,
                            index = index,
                            total = #responseChunks,
                            data = responseChunks[index + 1]
                        })
                        index = index + 1
                    end
                end
                expect(nil, success):toHaveBeenCalledWith("{\"saved\":true}")
                expect(nil, failure)["not"]:toHaveBeenCalled()
            end
        )
        it(
            nil,
            "accepts relay responses larger than the previous 512 chunk limit",
            function()
                ClientApiTransport:SetRelayEnabled(true)
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback) return callback(nil, 0) end)
                local success = jest:fn()
                ClientApiTransport:TrySendApiRequest({method = "GET", path = "/showcase/catalog", successFunc = success})
                local request = __TS__ArrayFind(
                    sent,
                    function(____, entry) return entry.eventName == "client_api_relay_request_chunk" end
                ).payload
                local body = string.rep(
                    "x",
                    math.floor(200000)
                )
                local responseChunks = ClientApiCodec:Chunk(
                    ClientApiCodec:Encode(body),
                    512
                )
                expect(nil, #responseChunks):toBeGreaterThan(512)
                do
                    local index = 0
                    while index < #responseChunks do
                        listeners:client_api_relay_response_chunk(0, {
                            PlayerID = 0,
                            requestId = request.requestId,
                            status = 200,
                            index = index,
                            total = #responseChunks,
                            data = responseChunks[index + 1]
                        })
                        index = index + 1
                    end
                end
                expect(nil, success):toHaveBeenCalledWith(body)
            end
        )
        it(
            nil,
            "relays upstream failures once and rejects non-allowlisted routes",
            function()
                ClientApiTransport:SetRelayEnabled(true)
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback) return callback(nil, 0) end)
                local success = jest:fn()
                local failure = jest:fn()
                expect(
                    nil,
                    ClientApiTransport:TrySendApiRequest({
                        method = "POST",
                        path = "/showcase/purchase",
                        body = {steamId = 123, itemId = "item-1"},
                        successFunc = success,
                        failureFunc = failure
                    })
                ):toBe(true)
                local request = __TS__ArrayFind(
                    sent,
                    function(____, entry) return entry.eventName == "client_api_relay_request_chunk" end
                ).payload
                local response = ClientApiCodec:Encode("insufficient points")
                listeners:client_api_relay_response_chunk(0, {
                    PlayerID = 0,
                    requestId = request.requestId,
                    status = 409,
                    index = 0,
                    total = 1,
                    data = response
                })
                listeners:client_api_relay_response_chunk(0, {
                    PlayerID = 0,
                    requestId = request.requestId,
                    status = 409,
                    index = 0,
                    total = 1,
                    data = response
                })
                expect(nil, success)["not"]:toHaveBeenCalled()
                expect(nil, failure):toHaveBeenCalledTimes(1)
                expect(nil, failure):toHaveBeenCalledWith("insufficient points")
                expect(
                    nil,
                    ClientApiTransport:TrySendApiRequest({
                        method = "POST",
                        path = "/analytics/player/language",
                        successFunc = jest:fn()
                    })
                ):toBe(false)
                expect(
                    nil,
                    ClientApiTransport:TrySendApiRequest({
                        method = "DELETE",
                        path = "/showcase/profile",
                        successFunc = jest:fn()
                    })
                ):toBe(false)
            end
        )
        it(
            nil,
            "encodes GET requests with an explicit null body",
            function()
                ClientApiTransport:SetRelayEnabled(true)
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback) return callback(nil, 0) end)
                ClientApiTransport:TrySendApiRequest({
                    method = "GET",
                    path = "/activity/tasks",
                    querys = {steamId = "123"},
                    successFunc = jest:fn()
                })
                local requestChunks = __TS__ArrayFilter(
                    sent,
                    function(____, entry) return entry.eventName == "client_api_relay_request_chunk" end
                )
                local wholeData = __TS__ArrayJoin(
                    __TS__ArrayMap(
                        requestChunks,
                        function(____, entry) return entry.payload.data end
                    ),
                    ""
                )
                expect(
                    nil,
                    ClientApiCodec:Decode(wholeData)
                ):toBe("{\"query\":{\"steamId\":\"123\"},\"body\":null}")
            end
        )
        it:each({
            {"PUT", "/player/property"},
            {"PUT", "/player/properties"},
            {"POST", "/player/property/reset"},
            {"GET", "/player/123/property-panel"},
            {"POST", "/player/123/rookie-gift/claim"},
            {"GET", "/player/123/setting"},
            {"PUT", "/player/123/setting"},
            {"GET", "/showcase/profile"},
            {"GET", "/showcase/catalog"},
            {"POST", "/showcase/purchase"},
            {"POST", "/showcase/random-box/open"},
            {"POST", "/showcase/random-box/claim"},
            {"POST", "/showcase/awakening/activate"},
            {"POST", "/showcase/awakening/lottery-pool/unlock-random"},
            {"GET", "/activity/tasks"},
            {"GET", "/player/ranking"},
            {"GET", "/activity/current"},
            {"GET", "/player/123/info"},
            {"POST", "/game/treasure/prepare"},
            {"POST", "/game/treasure/claim"}
        })(
            nil,
            "allowlists %s %s",
            function(____, method, path)
                ClientApiTransport:SetRelayEnabled(true)
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback) return callback(nil, 0) end)
                expect(
                    nil,
                    ClientApiTransport:TrySendApiRequest({
                        method = method,
                        path = path,
                        successFunc = jest:fn()
                    })
                ):toBe(true)
            end
        )
        it:each({
            {"GET", "/player/not-a-steam-id/info"},
            {"GET", "/player/123.5/setting"},
            {"GET", "/player/123/property-panel/extra"},
            {
                "POST",
                ("/player/" .. string.rep(
                    "1",
                    math.floor(21)
                )) .. "/rookie-gift/claim"
            }
        })(
            nil,
            "rejects malformed dynamic player path %s %s",
            function(____, method, path)
                ClientApiTransport:SetRelayEnabled(true)
                expect(
                    nil,
                    ClientApiTransport:TrySendApiRequest({
                        method = method,
                        path = path,
                        successFunc = jest:fn()
                    })
                ):toBe(false)
            end
        )
        it(
            nil,
            "locks later requests to client relay after a forced fallback",
            function()
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback) return callback(nil, 0) end)
                local apiParameter = {
                    method = "GET",
                    path = "/activity/current",
                    successFunc = jest:fn()
                }
                expect(
                    nil,
                    ClientApiTransport:TrySendApiRequest(apiParameter)
                ):toBe(false)
                expect(
                    nil,
                    ClientApiTransport:TrySendApiRequest(apiParameter, true)
                ):toBe(true)
                expect(
                    nil,
                    ClientApiTransport:IsRelayEnabled()
                ):toBe(true)
                expect(
                    nil,
                    ClientApiTransport:TrySendApiRequest(apiParameter)
                ):toBe(true)
            end
        )
        it(
            nil,
            "queues a read while no relay is ready and dispatches it after the lease handshake",
            function()
                resetTransportState(nil)
                __TS__ArraySetLength(sent, 0)
                ClientApiTransport:SetRelayEnabled(true)
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback) return callback(nil, 0) end)
                ClientApiTransport:TrySendApiRequest({
                    method = "GET",
                    path = "/activity/current",
                    successFunc = jest:fn()
                })
                expect(
                    nil,
                    __TS__ArrayFilter(
                        sent,
                        function(____, entry) return entry.eventName == "client_api_relay_request_chunk" end
                    )
                ):toHaveLength(0)
                registerV2Relay(nil, 0, "client-0")
                local chunks = __TS__ArrayFilter(
                    sent,
                    function(____, entry) return entry.eventName == "client_api_relay_request_chunk" end
                )
                expect(nil, #chunks):toBeGreaterThan(0)
                expect(nil, chunks[1].payload.dispatchId):toBeTruthy()
                expect(nil, chunks[1].payload.leaseId):toBeTruthy()
            end
        )
        it(
            nil,
            "dispatches ordinary relay jobs one at a time",
            function()
                ClientApiTransport:SetRelayEnabled(true)
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback) return callback(nil, 0) end)
                local firstSuccess = jest:fn()
                local secondSuccess = jest:fn()
                ClientApiTransport:TrySendApiRequest({method = "GET", path = "/activity/current", successFunc = firstSuccess})
                ClientApiTransport:TrySendApiRequest({method = "GET", path = "/activity/tasks", successFunc = secondSuccess})
                local initiallySent = __TS__ArrayFilter(
                    sent,
                    function(____, entry) return entry.eventName == "client_api_relay_request_chunk" end
                )
                expect(
                    nil,
                    __TS__New(
                        Set,
                        __TS__ArrayMap(
                            initiallySent,
                            function(____, entry) return entry.payload.requestId end
                        )
                    ).size
                ):toBe(1)
                local first = initiallySent[1].payload
                listeners:client_api_relay_response_chunk(
                    0,
                    {
                        PlayerID = 0,
                        requestId = first.requestId,
                        status = 200,
                        index = 0,
                        total = 1,
                        data = ClientApiCodec:Encode("{\"first\":true}")
                    }
                )
                local allSent = __TS__ArrayFilter(
                    sent,
                    function(____, entry) return entry.eventName == "client_api_relay_request_chunk" end
                )
                expect(
                    nil,
                    __TS__New(
                        Set,
                        __TS__ArrayMap(
                            allSent,
                            function(____, entry) return entry.payload.requestId end
                        )
                    ).size
                ):toBe(2)
                expect(nil, firstSuccess):toHaveBeenCalledTimes(1)
                expect(nil, secondSuccess)["not"]:toHaveBeenCalled()
            end
        )
        it(
            nil,
            "never selects a bot as the primary relay",
            function()
                resetTransportState(nil)
                __TS__ArraySetLength(sent, 0)
                ClientApiTransport:SetRelayEnabled(true)
                PlayerHelper.IsHumanPlayerByPlayerId:mockImplementation(function(____, playerId) return playerId == 1 end)
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback)
                    callback(nil, 0)
                    callback(nil, 1)
                end)
                registerV2Relay(nil, 0, "bot-client")
                registerV2Relay(nil, 1, "human-client")
                __TS__ArraySetLength(sent, 0)
                ClientApiTransport:TrySendApiRequest({
                    method = "GET",
                    path = "/activity/current",
                    successFunc = jest:fn()
                })
                local request = __TS__ArrayFind(
                    sent,
                    function(____, entry) return entry.eventName == "client_api_relay_request_chunk" end
                )
                local ____opt_0 = request and request.player
                expect(nil, ____opt_0 and ____opt_0.id):toBe(1)
            end
        )
        it(
            nil,
            "asks the client to repeat ready after an unknown heartbeat lease",
            function()
                resetTransportState(nil)
                __TS__ArraySetLength(sent, 0)
                listeners:client_api_transport_heartbeat(0, {PlayerID = 0, relayEpoch = 1, leaseId = "stale-lease", sequence = 1})
                expect(nil, sent):toContainEqual(expect:objectContaining({
                    eventName = "client_api_transport_ready_ack",
                    payload = expect:objectContaining({accepted = 0, leaseId = ""})
                }))
            end
        )
        it(
            nil,
            "fails over an in-flight read to a standby relay and rejects stale replies",
            function()
                resetTransportState(nil)
                __TS__ArraySetLength(sent, 0)
                ClientApiTransport:SetRelayEnabled(true)
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback)
                    callback(nil, 0)
                    callback(nil, 1)
                end)
                registerV2Relay(nil, 0, "client-0")
                registerV2Relay(nil, 1, "client-1")
                __TS__ArraySetLength(sent, 0)
                local success = jest:fn()
                local failure = jest:fn()
                ClientApiTransport:TrySendApiRequest({method = "GET", path = "/activity/current", successFunc = success, failureFunc = failure})
                local first = __TS__ArrayFind(
                    sent,
                    function(____, entry)
                        local ____temp_6 = entry.eventName == "client_api_relay_request_chunk"
                        if ____temp_6 then
                            local ____opt_4 = entry.player
                            ____temp_6 = (____opt_4 and ____opt_4.id) == 0
                        end
                        return ____temp_6
                    end
                )
                listeners:client_api_relay_failure(0, {
                    PlayerID = 0,
                    requestId = first.payload.requestId,
                    dispatchId = first.payload.dispatchId,
                    leaseId = first.payload.leaseId,
                    reason = "network_error"
                })
                local second = __TS__ArrayFind(
                    sent,
                    function(____, entry)
                        local ____temp_9 = entry.eventName == "client_api_relay_request_chunk"
                        if ____temp_9 then
                            local ____opt_7 = entry.player
                            ____temp_9 = (____opt_7 and ____opt_7.id) == 1
                        end
                        return ____temp_9 and entry.payload.requestId == first.payload.requestId
                    end
                )
                expect(nil, second):toBeDefined()
                expect(nil, second.payload.dispatchId)["not"]:toBe(first.payload.dispatchId)
                local encoded = ClientApiCodec:Encode("{\"ok\":true}")
                listeners:client_api_relay_response_chunk(0, {
                    PlayerID = 0,
                    requestId = first.payload.requestId,
                    dispatchId = first.payload.dispatchId,
                    leaseId = first.payload.leaseId,
                    status = 200,
                    index = 0,
                    total = 1,
                    data = encoded
                })
                expect(nil, success)["not"]:toHaveBeenCalled()
                listeners:client_api_relay_response_chunk(0, {
                    PlayerID = 1,
                    requestId = second.payload.requestId,
                    dispatchId = second.payload.dispatchId,
                    leaseId = second.payload.leaseId,
                    status = 200,
                    index = 0,
                    total = 1,
                    data = encoded
                })
                expect(nil, success):toHaveBeenCalledWith("{\"ok\":true}")
                expect(nil, failure)["not"]:toHaveBeenCalled()
            end
        )
        it(
            nil,
            "does not replay a dispatched mutation through another relay",
            function()
                resetTransportState(nil)
                __TS__ArraySetLength(sent, 0)
                ClientApiTransport:SetRelayEnabled(true)
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback)
                    callback(nil, 0)
                    callback(nil, 1)
                end)
                registerV2Relay(nil, 0, "client-0")
                registerV2Relay(nil, 1, "client-1")
                __TS__ArraySetLength(sent, 0)
                local failure = jest:fn()
                ClientApiTransport:TrySendApiRequest({
                    method = "POST",
                    path = "/showcase/purchase",
                    body = {steamId = 123, itemId = "item-1"},
                    successFunc = jest:fn(),
                    failureFunc = failure
                })
                local first = __TS__ArrayFind(
                    sent,
                    function(____, entry)
                        local ____temp_12 = entry.eventName == "client_api_relay_request_chunk"
                        if ____temp_12 then
                            local ____opt_10 = entry.player
                            ____temp_12 = (____opt_10 and ____opt_10.id) == 0
                        end
                        return ____temp_12
                    end
                )
                listeners:client_api_relay_failure(0, {
                    PlayerID = 0,
                    requestId = first.payload.requestId,
                    dispatchId = first.payload.dispatchId,
                    leaseId = first.payload.leaseId,
                    reason = "network_error"
                })
                expect(nil, failure):toHaveBeenCalledTimes(1)
                expect(
                    nil,
                    __TS__ArraySome(
                        sent,
                        function(____, entry)
                            local ____temp_15 = entry.eventName == "client_api_relay_request_chunk"
                            if ____temp_15 then
                                local ____opt_13 = entry.player
                                ____temp_15 = (____opt_13 and ____opt_13.id) == 1
                            end
                            return ____temp_15
                        end
                    )
                ):toBe(false)
            end
        )
        it(
            nil,
            "moves an in-flight read when the primary lease expires",
            function()
                resetTransportState(nil)
                __TS__ArraySetLength(sent, 0)
                ClientApiTransport:SetRelayEnabled(true)
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback)
                    callback(nil, 0)
                    callback(nil, 1)
                end)
                registerV2Relay(nil, 0, "client-0")
                currentTime = 110
                registerV2Relay(nil, 1, "client-1")
                __TS__ArraySetLength(sent, 0)
                ClientApiTransport:TrySendApiRequest({
                    method = "GET",
                    path = "/activity/current",
                    successFunc = jest:fn()
                })
                local first = __TS__ArrayFind(
                    sent,
                    function(____, entry)
                        local ____temp_18 = entry.eventName == "client_api_relay_request_chunk"
                        if ____temp_18 then
                            local ____opt_16 = entry.player
                            ____temp_18 = (____opt_16 and ____opt_16.id) == 0
                        end
                        return ____temp_18
                    end
                )
                currentTime = 131
                local internal = ClientApiTransport
                internal:MaintainRelayPool()
                expect(
                    nil,
                    __TS__ArraySome(
                        sent,
                        function(____, entry)
                            local ____temp_21 = entry.eventName == "client_api_relay_request_chunk"
                            if ____temp_21 then
                                local ____opt_19 = entry.player
                                ____temp_21 = (____opt_19 and ____opt_19.id) == 1
                            end
                            return ____temp_21 and entry.payload.requestId == first.payload.requestId
                        end
                    )
                ):toBe(true)
            end
        )
        it(
            nil,
            "reassigns game/end with the same upload id when the primary relay fails",
            function()
                resetTransportState(nil)
                __TS__ArraySetLength(sent, 0)
                PlayerHelper.ForEachPlayer:mockImplementation(function(____, callback)
                    callback(nil, 0)
                    callback(nil, 1)
                end)
                registerV2Relay(nil, 0, "client-0")
                registerV2Relay(nil, 1, "client-1")
                __TS__ArraySetLength(sent, 0)
                local success = jest:fn()
                local failure = jest:fn()
                ClientApiTransport:SendGameEnd({matchId = "game-end-failover", players = {{steamId = 123}}}, success, failure)
                local first = __TS__ArrayFind(
                    sent,
                    function(____, entry)
                        local ____temp_24 = entry.eventName == "client_api_game_end_chunk"
                        if ____temp_24 then
                            local ____opt_22 = entry.player
                            ____temp_24 = (____opt_22 and ____opt_22.id) == 0
                        end
                        return ____temp_24
                    end
                )
                listeners:client_api_game_end_ack(0, {
                    PlayerID = 0,
                    uploadId = first.payload.uploadId,
                    dispatchId = first.payload.dispatchId,
                    leaseId = first.payload.leaseId,
                    success = 0,
                    reason = "network_error"
                })
                local second = __TS__ArrayFind(
                    sent,
                    function(____, entry)
                        local ____temp_27 = entry.eventName == "client_api_game_end_chunk"
                        if ____temp_27 then
                            local ____opt_25 = entry.player
                            ____temp_27 = (____opt_25 and ____opt_25.id) == 1
                        end
                        return ____temp_27 and entry.payload.uploadId == first.payload.uploadId
                    end
                )
                expect(nil, second):toBeDefined()
                expect(nil, second.payload.dispatchId)["not"]:toBe(first.payload.dispatchId)
                listeners:client_api_game_end_ack(0, {
                    PlayerID = 1,
                    uploadId = second.payload.uploadId,
                    dispatchId = second.payload.dispatchId,
                    leaseId = second.payload.leaseId,
                    success = 1
                })
                expect(nil, success):toHaveBeenCalledTimes(1)
                expect(nil, failure)["not"]:toHaveBeenCalled()
            end
        )
    end
)
return ____exports
