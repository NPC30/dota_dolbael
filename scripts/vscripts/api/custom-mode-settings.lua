local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/custom-mode-settings.lua"
__TS__SourceMapTraceBack("api/custom-mode-settings.lua", {["6"] = 1,["7"] = 1,["8"] = 1,["9"] = 24,["10"] = 24,["11"] = 24,["13"] = 24,["14"] = 28,["15"] = 29,["16"] = 29,["17"] = 29,["18"] = 29,["19"] = 33,["20"] = 33,["21"] = 33,["22"] = 33,["23"] = 28,["24"] = 39,["25"] = 40,["26"] = 41,["27"] = 42,["28"] = 43,["31"] = 47,["32"] = 47,["33"] = 47,["34"] = 47,["35"] = 47,["36"] = 47,["37"] = 53,["38"] = 54,["39"] = 55,["40"] = 57,["41"] = 60,["42"] = 47,["43"] = 62,["44"] = 63,["45"] = 64,["46"] = 47,["47"] = 47,["48"] = 39,["49"] = 69,["50"] = 70,["51"] = 71,["52"] = 72,["55"] = 76,["56"] = 76,["57"] = 76,["58"] = 76,["59"] = 76,["60"] = 76,["61"] = 76,["62"] = 83,["63"] = 84,["64"] = 76,["65"] = 86,["66"] = 87,["67"] = 76,["68"] = 76,["69"] = 69,["70"] = 92,["71"] = 93,["72"] = 94,["76"] = 104,["79"] = 98,["80"] = 99,["81"] = 100,["83"] = 102,["89"] = 97,["92"] = 92,["93"] = 108,["96"] = 120,["99"] = 110,["100"] = 114,["101"] = 115,["102"] = 116,["104"] = 118,["110"] = 109,["113"] = 108,["114"] = 124,["115"] = 125,["116"] = 126,["119"] = 129,["120"] = 124,["121"] = 25,["122"] = 26});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
____exports.CustomModeSettings = __TS__Class()
local CustomModeSettings = ____exports.CustomModeSettings
CustomModeSettings.name = "CustomModeSettings"
function CustomModeSettings.prototype.____constructor(self)
end
function CustomModeSettings.RegisterListeners(self)
    CustomGameEventManager:RegisterListener(
        "custom_mode_settings_load",
        function(_, event) return self:Load(event) end
    )
    CustomGameEventManager:RegisterListener(
        "custom_mode_settings_save",
        function(_, event) return self:Save(event) end
    )
end
function CustomModeSettings.Load(self, event)
    local playerId = event.PlayerID
    local steamId = PlayerResource:GetSteamAccountID(playerId)
    if steamId <= 0 then
        self:SendLoaded(playerId, event.requestId, "")
        return
    end
    ApiClient:sendToBackupHost({
        method = HttpMethod.GET,
        path = ("/player/" .. tostring(steamId)) .. "/setting",
        retryTimes = 1,
        timeoutSeconds = self.REQUEST_TIMEOUT_SECONDS,
        silent = true,
        successFunc = function(____, data)
            local setting = self:DecodeSetting(data)
            local customModeOptionsJson = type(setting and setting.customModeOptionsJson) == "string" and setting.customModeOptionsJson or ""
            ApiClient:DebugLog((("[CustomModeSettings] loaded steamId=" .. tostring(steamId)) .. ", bytes=") .. tostring(#customModeOptionsJson))
            self:SendLoaded(playerId, event.requestId, customModeOptionsJson)
        end,
        failureFunc = function(____, data)
            ApiClient:DebugLog((("[CustomModeSettings] load failed steamId=" .. tostring(steamId)) .. ", data=") .. data)
            self:SendLoaded(playerId, event.requestId, "")
        end
    })
end
function CustomModeSettings.Save(self, event)
    local steamId = PlayerResource:GetSteamAccountID(event.PlayerID)
    local customModeOptionsJson = self:ValidateOptionsJson(event.customModeOptionsJson)
    if steamId <= 0 or customModeOptionsJson == nil then
        return
    end
    ApiClient:sendToBackupHost({
        method = HttpMethod.PUT,
        path = ("/player/" .. tostring(steamId)) .. "/setting",
        body = {customModeOptionsJson = customModeOptionsJson},
        retryTimes = 1,
        timeoutSeconds = self.REQUEST_TIMEOUT_SECONDS,
        silent = true,
        successFunc = function()
            ApiClient:DebugLog("[CustomModeSettings] saved steamId=" .. tostring(steamId))
        end,
        failureFunc = function(____, data)
            ApiClient:DebugLog((("[CustomModeSettings] save failed steamId=" .. tostring(steamId)) .. ", data=") .. data)
        end
    })
end
function CustomModeSettings.ValidateOptionsJson(self, value)
    if not value or #value > self.MAX_JSON_LENGTH then
        return nil
    end
    do
        local function ____catch()
            return true, nil
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            local decoded = (json.decode(value))
            if (decoded and decoded.version) ~= 1 or type(decoded.options) ~= "table" then
                return true, nil
            end
            return true, value
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch()
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function CustomModeSettings.DecodeSetting(self, data)
    do
        local function ____catch()
            return true, nil
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            local decoded = (json.decode(data))
            local response = decoded
            if (response and response.data) ~= nil then
                return true, response.data
            end
            return true, decoded
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch()
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function CustomModeSettings.SendLoaded(self, playerId, requestId, customModeOptionsJson)
    local player = PlayerResource:GetPlayer(playerId)
    if not player then
        return
    end
    CustomGameEventManager:Send_ServerToPlayer(player, "custom_mode_settings_loaded", {requestId = requestId, customModeOptionsJson = customModeOptionsJson})
end
CustomModeSettings.MAX_JSON_LENGTH = 8192
CustomModeSettings.REQUEST_TIMEOUT_SECONDS = 5
return ____exports
