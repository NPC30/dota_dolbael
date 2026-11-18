local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/hero/hero-luna.lua"
__TS__SourceMapTraceBack("ai/hero/hero-luna.lua", {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 10,["20"] = 15,["22"] = 17,["23"] = 7,["24"] = 6,["25"] = 5,["26"] = 6,["28"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____action_2Dability = require("ai.action.action-ability")
local ActionAbility = ____action_2Dability.ActionAbility
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.LunaAIModifier = __TS__Class()
local LunaAIModifier = ____exports.LunaAIModifier
LunaAIModifier.name = "LunaAIModifier"
__TS__ClassExtends(LunaAIModifier, BotBaseAIModifier)
function LunaAIModifier.prototype.UseAbilityEnemy(self)
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "luna_lunar_orbit", {target = {range = 200}, self = {unitCondition = {healthPercent = {lte = 95}}}}) then
        return true
    end
    return false
end
LunaAIModifier = __TS__DecorateLegacy(
    {registerModifier(nil)},
    LunaAIModifier
)
____exports.LunaAIModifier = LunaAIModifier
return ____exports
