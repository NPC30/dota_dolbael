local ____lualib = require("lualib_bundle")
local __TS__Number = ____lualib.__TS__Number
local __TS__NumberIsNaN = ____lualib.__TS__NumberIsNaN
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/standalone/standalone-server.test.lua"
__TS__SourceMapTraceBack("modules/standalone/standalone-server.test.lua", {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 19,["18"] = 20,["19"] = 21,["20"] = 22,["21"] = 23,["22"] = 24,["23"] = 25,["24"] = 26,["25"] = 27,["26"] = 28,["27"] = 29,["28"] = 30,["29"] = 4,["30"] = 4,["31"] = 33,["32"] = 34,["33"] = 35,["34"] = 36,["35"] = 37,["36"] = 38,["37"] = 39,["38"] = 40,["39"] = 41,["40"] = 42,["41"] = 44,["42"] = 42,["43"] = 48,["44"] = 48,["45"] = 48,["46"] = 48,["48"] = 48,["49"] = 48,["50"] = 49,["51"] = 50,["52"] = 51,["53"] = 52,["54"] = 52,["55"] = 52,["57"] = 52,["59"] = 52,["60"] = 50,["61"] = 54,["62"] = 55,["63"] = 56,["64"] = 57,["65"] = 63,["66"] = 64,["67"] = 65,["68"] = 73,["69"] = 65,["70"] = 77,["71"] = 77,["72"] = 77,["73"] = 77,["74"] = 77,["75"] = 77,["76"] = 77,["77"] = 77,["78"] = 85,["79"] = 85,["80"] = 85,["81"] = 85,["82"] = 85,["83"] = 85,["84"] = 85,["85"] = 97,["86"] = 97,["87"] = 97,["88"] = 97,["89"] = 97,["90"] = 97,["91"] = 97,["92"] = 104,["93"] = 105,["94"] = 97,["95"] = 97,["96"] = 97,["97"] = 97,["98"] = 33,["99"] = 112,["100"] = 112,["101"] = 112,["102"] = 112,["103"] = 113,["104"] = 115,["105"] = 117,["106"] = 112,["107"] = 112,["108"] = 122,["109"] = 122,["110"] = 122,["111"] = 122,["112"] = 122,["113"] = 122,["114"] = 122,["115"] = 122,["116"] = 122,["117"] = 122,["118"] = 122,["119"] = 122,["120"] = 122,["121"] = 122,["122"] = 122,["123"] = 134,["124"] = 135,["125"] = 136,["126"] = 138,["128"] = 138,["129"] = 138,["130"] = 138,["131"] = 138,["132"] = 138,["133"] = 138,["135"] = 143,["136"] = 143,["137"] = 143,["138"] = 143,["139"] = 143,["140"] = 145,["141"] = 146,["142"] = 147,["143"] = 122,["144"] = 122,["145"] = 152,["146"] = 152,["147"] = 152,["148"] = 152,["149"] = 153,["150"] = 154,["151"] = 156,["153"] = 156,["155"] = 157,["157"] = 157,["159"] = 159,["160"] = 160,["161"] = 152,["162"] = 152,["163"] = 165,["164"] = 166,["165"] = 166,["166"] = 166,["167"] = 166,["168"] = 166,["169"] = 166,["170"] = 165,["171"] = 167,["172"] = 167,["173"] = 167,["174"] = 167,["175"] = 167,["176"] = 167,["177"] = 165,["178"] = 168,["179"] = 168,["180"] = 168,["181"] = 168,["182"] = 168,["183"] = 168,["184"] = 165,["185"] = 169,["186"] = 169,["187"] = 169,["188"] = 169,["189"] = 169,["190"] = 169,["191"] = 165,["192"] = 170,["193"] = 170,["194"] = 170,["195"] = 170,["196"] = 170,["197"] = 170,["198"] = 165,["199"] = 171,["200"] = 171,["201"] = 171,["202"] = 171,["203"] = 171,["204"] = 171,["205"] = 165,["206"] = 172,["207"] = 172,["208"] = 172,["209"] = 172,["210"] = 172,["211"] = 172,["212"] = 165,["213"] = 173,["214"] = 173,["215"] = 173,["216"] = 173,["217"] = 173,["218"] = 173,["219"] = 165,["220"] = 165,["221"] = 165,["222"] = 165,["223"] = 176,["224"] = 177,["225"] = 178,["226"] = 180,["228"] = 180,["229"] = 180,["230"] = 180,["231"] = 180,["232"] = 180,["233"] = 180,["234"] = 180,["236"] = 186,["237"] = 186,["238"] = 186,["239"] = 186,["240"] = 186,["241"] = 188,["242"] = 192,["243"] = 193,["244"] = 165,["245"] = 165,["246"] = 199,["247"] = 199,["248"] = 199,["249"] = 199,["250"] = 200,["251"] = 201,["252"] = 202,["253"] = 204,["254"] = 204,["255"] = 204,["256"] = 204,["257"] = 204,["258"] = 204,["259"] = 204,["260"] = 204,["262"] = 205,["263"] = 205,["264"] = 205,["265"] = 205,["266"] = 205,["267"] = 206,["268"] = 207,["269"] = 207,["270"] = 207,["271"] = 207,["272"] = 207,["274"] = 209,["275"] = 209,["276"] = 210,["277"] = 210,["278"] = 210,["279"] = 210,["280"] = 210,["281"] = 209,["284"] = 212,["285"] = 214,["286"] = 214,["287"] = 214,["288"] = 214,["289"] = 214,["290"] = 215,["291"] = 216,["292"] = 217,["293"] = 220,["294"] = 224,["295"] = 224,["296"] = 224,["297"] = 224,["298"] = 224,["299"] = 224,["300"] = 224,["301"] = 224,["303"] = 225,["304"] = 226,["305"] = 226,["306"] = 226,["307"] = 226,["308"] = 226,["309"] = 227,["310"] = 227,["311"] = 227,["312"] = 227,["313"] = 227,["314"] = 228,["315"] = 229,["316"] = 232,["317"] = 199,["318"] = 199,["319"] = 237,["320"] = 237,["321"] = 237,["322"] = 240,["323"] = 241,["324"] = 242,["325"] = 244,["327"] = 244,["328"] = 244,["329"] = 244,["330"] = 244,["331"] = 244,["332"] = 244,["334"] = 245,["335"] = 245,["336"] = 245,["337"] = 245,["338"] = 245,["339"] = 246,["340"] = 247,["341"] = 249,["342"] = 250,["343"] = 250,["344"] = 250,["345"] = 250,["346"] = 250,["347"] = 251,["348"] = 252,["349"] = 237,["350"] = 237,["351"] = 255,["352"] = 255,["353"] = 255,["354"] = 255,["355"] = 256,["356"] = 257,["357"] = 258,["359"] = 258,["360"] = 258,["361"] = 258,["362"] = 258,["363"] = 258,["364"] = 258,["365"] = 258,["367"] = 265,["369"] = 265,["371"] = 266,["372"] = 269,["373"] = 270,["375"] = 270,["377"] = 272,["378"] = 255,["379"] = 255,["380"] = 277,["381"] = 277,["382"] = 277,["383"] = 277,["384"] = 277,["385"] = 277,["386"] = 277,["387"] = 277,["388"] = 277,["389"] = 277,["390"] = 277,["391"] = 277,["392"] = 277,["393"] = 277,["394"] = 288,["395"] = 289,["396"] = 290,["397"] = 292,["399"] = 292,["400"] = 292,["401"] = 292,["402"] = 292,["403"] = 292,["404"] = 292,["405"] = 292,["407"] = 299,["408"] = 300,["409"] = 301,["410"] = 277,["411"] = 277,["412"] = 304,["413"] = 304,["414"] = 304,["415"] = 304,["416"] = 305,["417"] = 306,["418"] = 307,["419"] = 309,["420"] = 309,["422"] = 310,["423"] = 310,["424"] = 310,["425"] = 310,["426"] = 310,["427"] = 310,["428"] = 310,["429"] = 310,["431"] = 311,["432"] = 311,["433"] = 311,["434"] = 311,["435"] = 311,["436"] = 311,["437"] = 311,["438"] = 311,["439"] = 311,["441"] = 313,["442"] = 304,["443"] = 304,["444"] = 316,["445"] = 316,["446"] = 316,["447"] = 316,["448"] = 317,["449"] = 318,["450"] = 320,["451"] = 321,["452"] = 322,["453"] = 323,["454"] = 316,["455"] = 316,["456"] = 326,["457"] = 326,["458"] = 326,["459"] = 326,["460"] = 327,["461"] = 328,["462"] = 329,["464"] = 329,["465"] = 329,["466"] = 329,["467"] = 329,["468"] = 329,["469"] = 329,["470"] = 329,["472"] = 336,["473"] = 336,["474"] = 336,["475"] = 336,["476"] = 336,["477"] = 337,["478"] = 338,["479"] = 326,["480"] = 326,["481"] = 3,["482"] = 3});
local ____exports = {}
local ____standalone_2Dserver = require("modules.standalone.standalone-server")
local StandaloneServer = ____standalone_2Dserver.StandaloneServer
describe(
    nil,
    "StandaloneServer",
    function()
        beforeEach(
            nil,
            function()
                local state = StandaloneServer
                state.initialized = false
                state.authorized = false
                state.completed = false
                state.presetApplied = false
                state.finishRequested = false
                state.transitionPollCount = 0
                state.setupObservedPoll = nil
                state.lastTransitionState = nil
                state.selectedMap = nil
                state.selectedHumanSummary = nil
                state.selectedSelection = nil
                state.selectedProtocol = nil
            end
        )
        local function setupRuntime(self, options)
            local testGlobal = _G
            local commandCallback
            local thinkCallback
            local gameState = 0
            local applyPreset = jest:fn(function() return true end)
            local resetToCustomGameSetup = jest:fn()
            local enableCustomGameSetupAutoLaunch = jest:fn()
            local finishCustomGameSetup = jest:fn()
            local setContextThink = jest:fn(function(____, _name, callback, _delay)
                thinkCallback = callback
            end)
            testGlobal.IsDedicatedServer = jest:fn(function()
                local ____temp_2 = options and options.dedicated
                if ____temp_2 == nil then
                    ____temp_2 = true
                end
                return ____temp_2
            end)
            testGlobal.GetMapName = jest:fn(function() return options and options.mapName or "abyss" end)
            testGlobal.tonumber = jest:fn(function(____, value)
                local numberValue = __TS__Number(value)
                local ____Number_isNaN_result_5
                if __TS__NumberIsNaN(numberValue) then
                    ____Number_isNaN_result_5 = nil
                else
                    ____Number_isNaN_result_5 = numberValue
                end
                return ____Number_isNaN_result_5
            end)
            testGlobal.math = {floor = function(____, value) return value == 0.5 and 0 or value end}
            testGlobal.print = jest:fn()
            testGlobal.ConVarFlags = {NONE = 0}
            testGlobal.GameState = {INIT = 0, WAIT_FOR_PLAYERS_TO_LOAD = 1, CUSTOM_GAME_SETUP = 2, HERO_SELECTION = 4}
            testGlobal.ConnectionState = {CONNECTED = 2}
            testGlobal.DOTA_MAX_TEAM_PLAYERS = 2
            testGlobal.Convars = {RegisterCommand = jest:fn(function(____, _name, callback, _help, _flags)
                commandCallback = callback
            end)}
            testGlobal.GameRules = {
                State_Get = jest:fn(function() return gameState end),
                GetGameModeEntity = jest:fn(function() return {SetContextThink = setContextThink} end),
                ResetToCustomGameSetup = resetToCustomGameSetup,
                EnableCustomGameSetupAutoLaunch = enableCustomGameSetupAutoLaunch,
                FinishCustomGameSetup = finishCustomGameSetup,
                Option = {ApplyStandalonePreset = applyPreset, abyssMode = false}
            }
            testGlobal.PlayerResource = {
                IsValidPlayerID = jest:fn(function(____, playerId) return playerId == 0 end),
                IsValidPlayer = jest:fn(function(____, playerId) return playerId == 0 end),
                IsFakeClient = jest:fn(function() return false end),
                GetConnectionState = jest:fn(function() return (options and options.connected) == false and -1 or testGlobal.ConnectionState.CONNECTED end),
                GetSteamAccountID = jest:fn(function() return 123456 end)
            }
            return {
                testGlobal = testGlobal,
                applyPreset = applyPreset,
                resetToCustomGameSetup = resetToCustomGameSetup,
                enableCustomGameSetupAutoLaunch = enableCustomGameSetupAutoLaunch,
                finishCustomGameSetup = finishCustomGameSetup,
                setContextThink = setContextThink,
                setGameState = function(____, state)
                    gameState = state
                end,
                getCommandCallback = function() return commandCallback end,
                getThinkCallback = function() return thinkCallback end
            }
        end
        it(
            nil,
            "emits exact v3 command-ready marker on supported maps",
            function()
                local runtime = setupRuntime(nil, {mapName = "rd"})
                StandaloneServer:Initialize()
                expect(nil, runtime.testGlobal.print):toHaveBeenCalledWith("[StandaloneServer] command-ready: command=windy_standalone_start, protocol=v3, map=rd")
            end
        )
        it:each({
            {"dota", 1},
            {"dota", 2},
            {"dota", 3},
            {"dota", 4},
            {"dota", 5},
            {"dota", 6},
            {"n6", 6},
            {"n7", 7},
            {"rd", 8},
            {"rd", 9},
            {"abyss", 99}
        })(
            nil,
            "keeps v2 preset compatibility for map=%s difficulty=N%i",
            function(____, mapName, difficulty)
                local runtime = setupRuntime(nil, {mapName = mapName})
                StandaloneServer:Initialize()
                local ____opt_8 = runtime:getCommandCallback()
                if ____opt_8 ~= nil then
                    ____opt_8(
                        nil,
                        StandaloneServer.COMMAND,
                        StandaloneServer.PROTOCOL_V2,
                        tostring(difficulty)
                    )
                end
                local ____opt_10 = runtime:getThinkCallback()
                expect(
                    nil,
                    ____opt_10 and ____opt_10(nil)
                ):toBe(0.1)
                expect(nil, runtime.applyPreset):toHaveBeenCalledWith(mapName, difficulty)
                expect(nil, runtime.resetToCustomGameSetup):toHaveBeenCalledTimes(1)
                expect(nil, runtime.testGlobal.print):toHaveBeenCalledWith(((("[StandaloneServer] ready: map=" .. mapName) .. ", difficulty=N") .. tostring(difficulty)) .. ", humanCount=1, steamIdCount=1, zeroSteamIdCount=0")
            end
        )
        it(
            nil,
            "keeps v1 abyss N99 compatibility",
            function()
                local runtime = setupRuntime(nil, {mapName = "abyss"})
                StandaloneServer:Initialize()
                local ____opt_12 = runtime:getCommandCallback()
                if ____opt_12 ~= nil then
                    ____opt_12(nil, StandaloneServer.COMMAND, StandaloneServer.PROTOCOL_V1)
                end
                local ____opt_14 = runtime:getThinkCallback()
                if ____opt_14 ~= nil then
                    ____opt_14(nil)
                end
                expect(nil, runtime.applyPreset):toHaveBeenCalledWith("abyss", 99)
                expect(nil, runtime.testGlobal.print):toHaveBeenCalledWith("[StandaloneServer] ready: map=abyss, preset=N99, humanCount=1, steamIdCount=1, zeroSteamIdCount=0")
            end
        )
        it:each({
            {
                "n7",
                "n7",
                7,
                false,
                true
            },
            {
                "n7",
                "n7-mid",
                7,
                true,
                true
            },
            {
                "rd",
                "rd",
                8,
                false,
                true
            },
            {
                "rd",
                "rd",
                9,
                false,
                true
            },
            {
                "rd",
                "rd-mid",
                8,
                true,
                true
            },
            {
                "rd",
                "rd-mid",
                9,
                true,
                true
            },
            {
                "abyss",
                "abyss",
                99,
                true,
                true
            },
            {
                "abyss",
                "abyss-noncompetitive",
                99,
                true,
                false
            }
        })(
            nil,
            "accepts v3 map=%s variant=%s difficulty=N%i",
            function(____, mapName, variant, difficulty, midOnlyMode, abyssStrictLimits)
                local runtime = setupRuntime(nil, {mapName = mapName})
                StandaloneServer:Initialize()
                local ____opt_16 = runtime:getCommandCallback()
                if ____opt_16 ~= nil then
                    ____opt_16(
                        nil,
                        StandaloneServer.COMMAND,
                        StandaloneServer.PROTOCOL_V3,
                        variant,
                        tostring(difficulty)
                    )
                end
                local ____opt_18 = runtime:getThinkCallback()
                expect(
                    nil,
                    ____opt_18 and ____opt_18(nil)
                ):toBe(0.1)
                expect(nil, runtime.applyPreset):toHaveBeenCalledWith(mapName, difficulty, {midOnlyMode = midOnlyMode, abyssStrictLimits = abyssStrictLimits})
                expect(nil, runtime.resetToCustomGameSetup):toHaveBeenCalledTimes(1)
                expect(nil, runtime.testGlobal.print):toHaveBeenCalledWith((((("[StandaloneServer] command-accepted: map=" .. mapName) .. ", protocol=v3, variant=") .. variant) .. ", difficulty=N") .. tostring(difficulty))
            end
        )
        it(
            nil,
            "keeps setup visible for five seconds before one Finish call and final v3 ready",
            function()
                local runtime = setupRuntime(nil, {mapName = "n7"})
                StandaloneServer:Initialize()
                local command = runtime:getCommandCallback()
                if command ~= nil then
                    command(
                        nil,
                        StandaloneServer.COMMAND,
                        StandaloneServer.PROTOCOL_V3,
                        "n7-mid",
                        "7"
                    )
                end
                local ____opt_22 = runtime:getThinkCallback()
                expect(
                    nil,
                    ____opt_22 and ____opt_22(nil)
                ):toBe(0.1)
                runtime:setGameState(2)
                local ____opt_24 = runtime:getThinkCallback()
                expect(
                    nil,
                    ____opt_24 and ____opt_24(nil)
                ):toBe(0.1)
                do
                    local poll = 0
                    while poll < 49 do
                        local ____opt_26 = runtime:getThinkCallback()
                        expect(
                            nil,
                            ____opt_26 and ____opt_26(nil)
                        ):toBe(0.1)
                        poll = poll + 1
                    end
                end
                expect(nil, runtime.finishCustomGameSetup)["not"]:toHaveBeenCalled()
                local ____opt_28 = runtime:getThinkCallback()
                expect(
                    nil,
                    ____opt_28 and ____opt_28(nil)
                ):toBe(0.1)
                expect(nil, runtime.enableCustomGameSetupAutoLaunch):toHaveBeenCalledWith(false)
                expect(nil, runtime.finishCustomGameSetup):toHaveBeenCalledTimes(1)
                expect(nil, runtime.applyPreset.mock.invocationCallOrder[1]):toBeLessThan(runtime.resetToCustomGameSetup.mock.invocationCallOrder[1])
                expect(nil, runtime.resetToCustomGameSetup.mock.invocationCallOrder[1]):toBeLessThan(runtime.finishCustomGameSetup.mock.invocationCallOrder[1])
                if command ~= nil then
                    command(
                        nil,
                        StandaloneServer.COMMAND,
                        StandaloneServer.PROTOCOL_V3,
                        "n7-mid",
                        "7"
                    )
                end
                runtime:setGameState(4)
                local ____opt_32 = runtime:getThinkCallback()
                expect(
                    nil,
                    ____opt_32 and ____opt_32(nil)
                ):toBeUndefined()
                local ____opt_34 = runtime:getThinkCallback()
                expect(
                    nil,
                    ____opt_34 and ____opt_34(nil)
                ):toBeUndefined()
                expect(nil, runtime.finishCustomGameSetup):toHaveBeenCalledTimes(1)
                expect(nil, runtime.testGlobal.print):toHaveBeenCalledWith("[StandaloneServer] setup-timing: phase=finish, elapsedSeconds=5")
                expect(nil, runtime.testGlobal.print):toHaveBeenCalledWith("[StandaloneServer] ready: map=n7, variant=n7-mid, difficulty=N7, humanCount=1, steamIdCount=1, zeroSteamIdCount=0, setup=auto")
            end
        )
        it:each({{StandaloneServer.PROTOCOL_V2, {"0"}}, {StandaloneServer.PROTOCOL_V3, {"custom", "0"}}})(
            nil,
            "keeps custom manual under %s without preset or Finish",
            function(____, protocol, args)
                local runtime = setupRuntime(nil, {mapName = "custom"})
                StandaloneServer:Initialize()
                local ____opt_36 = runtime:getCommandCallback()
                if ____opt_36 ~= nil then
                    ____opt_36(
                        nil,
                        StandaloneServer.COMMAND,
                        protocol,
                        unpack(args)
                    )
                end
                local ____opt_38 = runtime:getThinkCallback()
                expect(
                    nil,
                    ____opt_38 and ____opt_38(nil)
                ):toBe(0.1)
                expect(nil, runtime.applyPreset)["not"]:toHaveBeenCalled()
                expect(nil, runtime.resetToCustomGameSetup):toHaveBeenCalledTimes(1)
                runtime:setGameState(2)
                local ____opt_40 = runtime:getThinkCallback()
                expect(
                    nil,
                    ____opt_40 and ____opt_40(nil)
                ):toBeUndefined()
                expect(nil, runtime.enableCustomGameSetupAutoLaunch)["not"]:toHaveBeenCalled()
                expect(nil, runtime.finishCustomGameSetup)["not"]:toHaveBeenCalled()
            end
        )
        it(
            nil,
            "emits final v3 manual ready only after custom setup is observed",
            function()
                local runtime = setupRuntime(nil, {mapName = "custom"})
                StandaloneServer:Initialize()
                local ____opt_42 = runtime:getCommandCallback()
                if ____opt_42 ~= nil then
                    ____opt_42(
                        nil,
                        StandaloneServer.COMMAND,
                        StandaloneServer.PROTOCOL_V3,
                        "custom",
                        "0"
                    )
                end
                local ____opt_44 = runtime:getThinkCallback()
                if ____opt_44 ~= nil then
                    ____opt_44(nil)
                end
                expect(nil, runtime.testGlobal.print)["not"]:toHaveBeenCalledWith(expect:stringContaining("setup=manual"))
                runtime:setGameState(2)
                local ____opt_46 = runtime:getThinkCallback()
                if ____opt_46 ~= nil then
                    ____opt_46(nil)
                end
                expect(nil, runtime.testGlobal.print):toHaveBeenCalledWith("[StandaloneServer] ready: map=custom, variant=custom, difficulty=N0, humanCount=1, steamIdCount=1, zeroSteamIdCount=0, setup=manual")
            end
        )
        it:each({
            {"n7", "n7", "8"},
            {"n7", "rd", "7"},
            {"rd", "rd", "7"},
            {"rd", "rd-mid", "10"},
            {"abyss", "abyss", "8"},
            {"abyss", "abyss-noncompetitive", "9"},
            {"custom", "custom", "1"},
            {"dota", "n7", "7"},
            {"rd", "rd", "8.5"},
            {"rd", "rd", "not-a-number"}
        })(
            nil,
            "rejects v3 mismatch map=%s variant=%s difficulty=%s",
            function(____, mapName, variant, difficulty)
                local runtime = setupRuntime(nil, {mapName = mapName})
                StandaloneServer:Initialize()
                local ____opt_48 = runtime:getCommandCallback()
                if ____opt_48 ~= nil then
                    ____opt_48(
                        nil,
                        StandaloneServer.COMMAND,
                        StandaloneServer.PROTOCOL_V3,
                        variant,
                        difficulty
                    )
                end
                expect(nil, runtime.setContextThink)["not"]:toHaveBeenCalled()
                expect(nil, runtime.applyPreset)["not"]:toHaveBeenCalled()
                expect(nil, runtime.resetToCustomGameSetup)["not"]:toHaveBeenCalled()
            end
        )
        it(
            nil,
            "rejects missing or extra protocol arguments",
            function()
                local runtime = setupRuntime(nil, {mapName = "rd"})
                StandaloneServer:Initialize()
                local command = runtime:getCommandCallback()
                if command ~= nil then
                    command(nil, StandaloneServer.COMMAND, StandaloneServer.PROTOCOL_V3, "rd")
                end
                if command ~= nil then
                    command(
                        nil,
                        StandaloneServer.COMMAND,
                        StandaloneServer.PROTOCOL_V2,
                        "8",
                        "extra"
                    )
                end
                if command ~= nil then
                    command(
                        nil,
                        StandaloneServer.COMMAND,
                        StandaloneServer.PROTOCOL_V3,
                        "rd",
                        "8",
                        "extra"
                    )
                end
                expect(nil, runtime.setContextThink)["not"]:toHaveBeenCalled()
            end
        )
        it(
            nil,
            "does not change a dedicated Workshop lobby without standalone authorization",
            function()
                local runtime = setupRuntime(nil, {mapName = "n7"})
                StandaloneServer:Initialize()
                expect(nil, runtime.setContextThink)["not"]:toHaveBeenCalled()
                expect(nil, runtime.applyPreset)["not"]:toHaveBeenCalled()
                expect(nil, runtime.resetToCustomGameSetup)["not"]:toHaveBeenCalled()
                expect(nil, runtime.finishCustomGameSetup)["not"]:toHaveBeenCalled()
            end
        )
        it(
            nil,
            "keeps waiting while no human is connected",
            function()
                local runtime = setupRuntime(nil, {connected = false, mapName = "n7"})
                StandaloneServer:Initialize()
                local ____opt_56 = runtime:getCommandCallback()
                if ____opt_56 ~= nil then
                    ____opt_56(
                        nil,
                        StandaloneServer.COMMAND,
                        StandaloneServer.PROTOCOL_V3,
                        "n7",
                        "7"
                    )
                end
                local ____opt_58 = runtime:getThinkCallback()
                expect(
                    nil,
                    ____opt_58 and ____opt_58(nil)
                ):toBe(0.25)
                expect(nil, runtime.applyPreset)["not"]:toHaveBeenCalled()
                expect(nil, runtime.resetToCustomGameSetup)["not"]:toHaveBeenCalled()
            end
        )
    end
)
return ____exports
