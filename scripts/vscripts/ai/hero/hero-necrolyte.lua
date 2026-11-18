local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/hero/hero-necrolyte.lua"
__TS__SourceMapTraceBack("ai/hero/hero-necrolyte.lua", {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 10,["20"] = 16,["22"] = 21,["23"] = 29,["25"] = 32,["26"] = 7,["27"] = 35,["28"] = 38,["29"] = 44,["31"] = 47,["32"] = 35,["33"] = 50,["34"] = 52,["35"] = 50,["36"] = 6,["37"] = 5,["38"] = 6,["40"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____action_2Dability = require("ai.action.action-ability")
local ActionAbility = ____action_2Dability.ActionAbility
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.NecrolyteAIModifier = __TS__Class()
local NecrolyteAIModifier = ____exports.NecrolyteAIModifier
NecrolyteAIModifier.name = "NecrolyteAIModifier"
__TS__ClassExtends(NecrolyteAIModifier, BotBaseAIModifier)
function NecrolyteAIModifier.prototype.UseAbilityEnemy(self)
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "necrolyte_death_pulse", {target = {range = 500}}) then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "necrolyte_death_seeker", {self = {unitCondition = {healthPercent = {gte = 50}}}}) then
        return true
    end
    return false
end
function NecrolyteAIModifier.prototype.UseAbilityCreep(self)
    if ActionAbility:CastAbilityOnFindEnemyCreep(self, "necrolyte_death_pulse", {target = {range = 500}}) then
        return true
    end
    return false
end
function NecrolyteAIModifier.prototype.UseAbilitySelf(self)
    return false
end
NecrolyteAIModifier = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_necrolyte_ai")},
    NecrolyteAIModifier
)
____exports.NecrolyteAIModifier = NecrolyteAIModifier
return ____exports
