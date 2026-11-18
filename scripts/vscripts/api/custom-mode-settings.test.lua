local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/custom-mode-settings.test.lua"
__TS__SourceMapTraceBack("api/custom-mode-settings.test.lua", {["6"] = 12,["7"] = 12,["8"] = 13,["9"] = 13,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 2,["16"] = 1,["17"] = 1,["18"] = 1,["19"] = 1,["20"] = 21,["21"] = 21,["22"] = 21,["23"] = 21,["24"] = 22,["25"] = 23,["26"] = 28,["27"] = 28,["28"] = 28,["29"] = 29,["30"] = 29,["31"] = 29,["32"] = 30,["33"] = 31,["34"] = 32,["35"] = 33,["36"] = 30,["37"] = 30,["38"] = 29,["39"] = 37,["40"] = 37,["41"] = 37,["42"] = 29,["43"] = 29,["44"] = 29,["45"] = 29,["46"] = 46,["47"] = 28,["48"] = 28,["49"] = 49,["50"] = 49,["51"] = 49,["52"] = 50,["53"] = 49,["54"] = 49,["55"] = 53,["56"] = 53,["57"] = 53,["58"] = 53,["59"] = 54,["60"] = 55,["61"] = 54,["62"] = 64,["63"] = 66,["64"] = 67,["65"] = 67,["66"] = 67,["67"] = 67,["68"] = 67,["69"] = 66,["70"] = 75,["71"] = 83,["72"] = 83,["73"] = 83,["74"] = 83,["75"] = 83,["76"] = 53,["77"] = 53,["78"] = 90,["79"] = 90,["80"] = 90,["81"] = 93,["82"] = 94,["83"] = 96,["84"] = 97,["85"] = 97,["86"] = 97,["87"] = 97,["88"] = 97,["89"] = 97,["90"] = 96,["91"] = 106,["92"] = 90,["93"] = 90,["94"] = 111,["95"] = 111,["96"] = 111,["97"] = 113,["98"] = 114,["99"] = 116,["100"] = 111,["101"] = 111,["102"] = 120,["103"] = 120,["104"] = 120,["105"] = 120,["106"] = 121,["107"] = 122,["108"] = 121,["109"] = 125,["110"] = 127,["111"] = 120,["112"] = 120,["113"] = 134,["114"] = 134,["115"] = 134,["116"] = 134,["117"] = 135,["118"] = 136,["119"] = 135,["120"] = 139,["121"] = 141,["122"] = 134,["123"] = 134,["124"] = 21,["125"] = 21});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local ____custom_2Dmode_2Dsettings = require("api.custom-mode-settings")
local CustomModeSettings = ____custom_2Dmode_2Dsettings.CustomModeSettings
jest:mock(
    "./api-client",
    function() return {
        ApiClient = {
            DebugLog = jest:fn(),
            sendToBackupHost = jest:fn()
        },
        HttpMethod = {GET = "GET", PUT = "PUT"}
    } end
)
describe(
    nil,
    "CustomModeSettings",
    function()
        local listeners = {}
        local players = {[0] = {playerId = 0}, [1] = {playerId = 1}}
        beforeAll(
            nil,
            function()
                __TS__ObjectAssign(
                    _G,
                    {
                        CustomGameEventManager = {
                            RegisterListener = jest:fn(function(____, name, listener)
                                listeners[name] = listener
                                return 1
                            end),
                            Send_ServerToPlayer = jest:fn()
                        },
                        PlayerResource = {
                            GetSteamAccountID = jest:fn(function(____, playerId) return playerId == 0 and 111 or 222 end),
                            GetPlayer = jest:fn(function(____, playerId) return players[playerId] end)
                        },
                        json = {decode = jest:fn(function(____, value) return {JSON:parse(value)} end)}
                    }
                )
                CustomModeSettings:RegisterListeners()
            end
        )
        beforeEach(
            nil,
            function()
                jest:clearAllMocks()
            end
        )
        it(
            nil,
            "loads the current player setting and returns only to that player",
            function()
                ApiClient.sendToBackupHost:mockImplementation(function(____, request)
                    request:successFunc(JSON:stringify({data = {customModeOptionsJson = "{\"version\":1,\"options\":{\"radiant_player_number\":7}}"}}))
                end)
                listeners:custom_mode_settings_load(0, {PlayerID = 1, requestId = 9})
                expect(nil, ApiClient.sendToBackupHost):toHaveBeenCalledWith(expect:objectContaining({
                    method = "GET",
                    path = "/player/222/setting",
                    retryTimes = 1,
                    timeoutSeconds = 5,
                    silent = true
                }))
                expect(nil, CustomGameEventManager.Send_ServerToPlayer):toHaveBeenCalledWith(players[1], "custom_mode_settings_loaded", {requestId = 9, customModeOptionsJson = "{\"version\":1,\"options\":{\"radiant_player_number\":7}}"})
                expect(nil, CustomGameEventManager.Send_ServerToPlayer)["not"]:toHaveBeenCalledWith(
                    players[0],
                    expect:anything(),
                    expect:anything()
                )
            end
        )
        it:each({"{\"version\":1,\"options\":{}}", "{\"version\":1,\"options\":{\"radiant_player_number\":7,\"mid_only_mode\":false}}"})(
            nil,
            "saves valid options with a partial PUT body: %s",
            function(____, customModeOptionsJson)
                listeners:custom_mode_settings_save(0, {PlayerID = 0, customModeOptionsJson = customModeOptionsJson})
                expect(nil, ApiClient.sendToBackupHost):toHaveBeenCalledWith(expect:objectContaining({
                    method = "PUT",
                    path = "/player/111/setting",
                    body = {customModeOptionsJson = customModeOptionsJson},
                    retryTimes = 1,
                    timeoutSeconds = 5,
                    silent = true
                }))
                expect(nil, ApiClient.sendToBackupHost.mock.calls[1][0].body):toEqual({customModeOptionsJson = customModeOptionsJson})
            end
        )
        it:each({"", "not-json", "{\"version\":2,\"options\":{}}", "{\"version\":1}"})(
            nil,
            "rejects an invalid custom options payload: %s",
            function(____, customModeOptionsJson)
                listeners:custom_mode_settings_save(0, {PlayerID = 0, customModeOptionsJson = customModeOptionsJson})
                expect(nil, ApiClient.sendToBackupHost)["not"]:toHaveBeenCalled()
            end
        )
        it(
            nil,
            "falls back to an empty setting when the response cannot be parsed",
            function()
                ApiClient.sendToBackupHost:mockImplementation(function(____, request)
                    request:successFunc("not-json")
                end)
                listeners:custom_mode_settings_load(0, {PlayerID = 0, requestId = 3})
                expect(nil, CustomGameEventManager.Send_ServerToPlayer):toHaveBeenCalledWith(players[0], "custom_mode_settings_loaded", {requestId = 3, customModeOptionsJson = ""})
            end
        )
        it(
            nil,
            "accepts a direct empty setting response without blocking defaults",
            function()
                ApiClient.sendToBackupHost:mockImplementation(function(____, request)
                    request:successFunc(JSON:stringify({customModeOptionsJson = ""}))
                end)
                listeners:custom_mode_settings_load(0, {PlayerID = 0, requestId = 4})
                expect(nil, CustomGameEventManager.Send_ServerToPlayer):toHaveBeenCalledWith(players[0], "custom_mode_settings_loaded", {requestId = 4, customModeOptionsJson = ""})
            end
        )
    end
)
return ____exports
