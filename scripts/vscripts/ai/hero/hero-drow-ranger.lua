local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/hero/hero-drow-ranger.lua"
__TS__SourceMapTraceBack("ai/hero/hero-drow-ranger.lua", {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 10,["21"] = 11,["23"] = 16,["24"] = 20,["26"] = 24,["27"] = 28,["29"] = 31,["30"] = 7,["31"] = 34,["32"] = 35,["33"] = 38,["34"] = 42,["36"] = 45,["37"] = 34,["38"] = 6,["39"] = 5,["40"] = 6,["42"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____action_2Dability = require("ai.action.action-ability")
local ActionAbility = ____action_2Dability.ActionAbility
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.DrowRangerAIModifier = __TS__Class()
local DrowRangerAIModifier = ____exports.DrowRangerAIModifier
DrowRangerAIModifier.name = "DrowRangerAIModifier"
__TS__ClassExtends(DrowRangerAIModifier, BotBaseAIModifier)
function DrowRangerAIModifier.prototype.UseAbilityEnemy(self)
    local attackRange = self.hero:Script_GetAttackRange()
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "drow_ranger_wave_of_silence") then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "drow_ranger_glacier", {target = {range = attackRange + 200}}) then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "drow_ranger_multishot", {target = {range = attackRange * 1.75 - 200}}) then
        return true
    end
    return false
end
function DrowRangerAIModifier.prototype.UseAbilityCreep(self)
    local attackRange = self.hero:Script_GetAttackRange()
    if ActionAbility:CastAbilityOnFindEnemyCreep(self, "drow_ranger_multishot", {target = {range = attackRange * 1.75 - 200, count = {gte = 3}}}) then
        return true
    end
    return false
end
DrowRangerAIModifier = __TS__DecorateLegacy(
    {registerModifier(nil)},
    DrowRangerAIModifier
)
____exports.DrowRangerAIModifier = DrowRangerAIModifier
return ____exports
