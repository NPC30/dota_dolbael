local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____ga4 = require("api.analytics.ga4.ga4")
local GA4 = ____ga4.GA4
____exports.GA4PlayerLanguageTracker = __TS__Class()
local GA4PlayerLanguageTracker = ____exports.GA4PlayerLanguageTracker
GA4PlayerLanguageTracker.name = "GA4PlayerLanguageTracker"
function GA4PlayerLanguageTracker.prototype.____constructor(self)
CustomGameEventManager:RegisterListener(
"player_language",
function(_userId, event)
____exports.GA4PlayerLanguageTracker:OnPlayerLanguage(event)
end
)
end
function GA4PlayerLanguageTracker.GetLanguage(self, steamId)
return self.languageBySteamId:get(steamId)
end
function GA4PlayerLanguageTracker.OnPlayerLanguage(self, event)
local playerId = event.PlayerID
local language = event.language
local steamId = PlayerResource:GetSteamAccountID(playerId)
self.languageBySteamId:set(steamId, language)
local ga4Event = GA4:BuildEvent("player_language", steamId, {steam_id = steamId, language = language})
GA4:SendEvent(steamId, ga4Event, {language = {value = language}})
end
GA4PlayerLanguageTracker.languageBySteamId = __TS__New(Map)
GA4PlayerLanguageTracker = __TS__DecorateLegacy({reloadable}, GA4PlayerLanguageTracker)
____exports.GA4PlayerLanguageTracker = GA4PlayerLanguageTracker
return ____exports
