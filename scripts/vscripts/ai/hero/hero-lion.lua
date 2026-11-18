local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/hero/hero-lion.lua"
__TS__SourceMapTraceBack("ai/hero/hero-lion.lua", {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 9,["20"] = 10,["22"] = 13,["23"] = 14,["25"] = 19,["26"] = 23,["28"] = 27,["29"] = 28,["31"] = 30,["32"] = 7,["33"] = 33,["34"] = 36,["35"] = 40,["37"] = 43,["38"] = 33,["39"] = 6,["40"] = 5,["41"] = 6,["43"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____action_2Dability = require("ai.action.action-ability")
local ActionAbility = ____action_2Dability.ActionAbility
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.LionAIModifier = __TS__Class()
local LionAIModifier = ____exports.LionAIModifier
LionAIModifier.name = "LionAIModifier"
__TS__ClassExtends(LionAIModifier, BotBaseAIModifier)
function LionAIModifier.prototype.UseAbilityEnemy(self)
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "lion_voodoo") then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "lion_impale") then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "lion_finger_of_death", {target = {unitCondition = {healthPercent = {lte = 95}}}}) then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "lion_mana_drain") then
        return true
    end
    return false
end
function LionAIModifier.prototype.UseAbilityCreep(self)
    if ActionAbility:CastAbilityOnFindEnemyCreep(self, "lion_impale", {ability = {level = {gte = 4}}}) then
        return true
    end
    return false
end
LionAIModifier = __TS__DecorateLegacy(
    {registerModifier(nil)},
    LionAIModifier
)
____exports.LionAIModifier = LionAIModifier
return ____exports
