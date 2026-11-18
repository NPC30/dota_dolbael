local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/hero/hero-viper.lua"
__TS__SourceMapTraceBack("ai/hero/hero-viper.lua", {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 10,["20"] = 14,["22"] = 18,["23"] = 22,["25"] = 26,["26"] = 30,["28"] = 32,["29"] = 7,["30"] = 35,["31"] = 38,["32"] = 42,["34"] = 45,["35"] = 35,["36"] = 6,["37"] = 5,["38"] = 6,["40"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____action_2Dability = require("ai.action.action-ability")
local ActionAbility = ____action_2Dability.ActionAbility
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.ViperAIModifier = __TS__Class()
local ViperAIModifier = ____exports.ViperAIModifier
ViperAIModifier.name = "ViperAIModifier"
__TS__ClassExtends(ViperAIModifier, BotBaseAIModifier)
function ViperAIModifier.prototype.UseAbilityEnemy(self)
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "viper_nethertoxin", {target = {unitCondition = {noModifier = "modifier_viper_nethertoxin"}}}) then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "viper_viper_strike", {target = {unitCondition = {noModifier = "modifier_viper_viper_strike"}}}) then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "viper_nose_dive", {self = {unitCondition = {healthPercent = {gte = 50}, hasScepter = true}}}) then
        return true
    end
    return false
end
function ViperAIModifier.prototype.UseAbilityCreep(self)
    if ActionAbility:CastAbilityOnFindEnemyCreep(self, "viper_nethertoxin", {target = {unitCondition = {noModifier = "modifier_viper_nethertoxin"}}}) then
        return true
    end
    return false
end
ViperAIModifier = __TS__DecorateLegacy(
    {registerModifier(nil)},
    ViperAIModifier
)
____exports.ViperAIModifier = ViperAIModifier
return ____exports
