local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/player-language.lua"
__TS__SourceMapTraceBack("api/player-language.lua", {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 4,["12"] = 5,["15"] = 8,["16"] = 4,["17"] = 11,["18"] = 12,["19"] = 13,["20"] = 11,["21"] = 2});
local ____exports = {}
____exports.PlayerLanguage = __TS__Class()
local PlayerLanguage = ____exports.PlayerLanguage
PlayerLanguage.name = "PlayerLanguage"
function PlayerLanguage.prototype.____constructor(self)
end
function PlayerLanguage.SetPlayerLanguage(self, steamId, language)
    if not steamId or steamId <= 0 or not language then
        return
    end
    ____exports.PlayerLanguage.playerLanguages[tostring(steamId)] = language
end
function PlayerLanguage.GetApiLang(self, steamId)
    local language = ____exports.PlayerLanguage.playerLanguages[tostring(steamId)] or ""
    return ((string.find(language, "english", nil, true) or 0) - 1 ~= -1 or language == "en") and "en" or "zh"
end
PlayerLanguage.playerLanguages = {}
return ____exports
