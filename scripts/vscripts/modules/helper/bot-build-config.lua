local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/helper/bot-build-config.lua"
__TS__SourceMapTraceBack("modules/helper/bot-build-config.lua", {["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 5,["12"] = 8,["13"] = 11,["14"] = 12,["15"] = 13,["16"] = 14,["18"] = 17,["19"] = 17,["20"] = 17,["21"] = 18,["22"] = 19,["23"] = 3});
local ____exports = {}
local botBuildCache = __TS__New(Map)
function ____exports.GetBotBuildConfig(self, heroName)
    if botBuildCache:has(heroName) then
        return botBuildCache:get(heroName)
    end
    local heroesKV = LoadKeyValues("scripts/npc/npc_heroes_custom.txt")
    if heroesKV == nil then
        print("[BotBuildConfig] GetBotBuildConfig: Failed to load KV file")
        botBuildCache:set(heroName, nil)
        return nil
    end
    local ____opt_2 = heroesKV[heroName]
    local ____opt_0 = ____opt_2 and ____opt_2.Bot
    local buildConfig = ____opt_0 and ____opt_0.Build
    botBuildCache:set(heroName, buildConfig)
    return buildConfig
end
return ____exports
