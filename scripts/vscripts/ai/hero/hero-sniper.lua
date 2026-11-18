local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/hero/hero-sniper.lua"
__TS__SourceMapTraceBack("ai/hero/hero-sniper.lua", {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["19"] = 6,["20"] = 7,["21"] = 5,["22"] = 9,["23"] = 20,["24"] = 22,["26"] = 24,["27"] = 9,["28"] = 27,["29"] = 30,["30"] = 35,["32"] = 38,["33"] = 27,["34"] = 6,["35"] = 5,["36"] = 6,["38"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____action_2Dability = require("ai.action.action-ability")
local ActionAbility = ____action_2Dability.ActionAbility
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.SniperAIModifier = __TS__Class()
local SniperAIModifier = ____exports.SniperAIModifier
SniperAIModifier.name = "SniperAIModifier"
__TS__ClassExtends(SniperAIModifier, BotBaseAIModifier)
function SniperAIModifier.prototype.____constructor(self, ...)
    BotBaseAIModifier.prototype.____constructor(self, ...)
    self.FindHeroRadius = 3000
end
function SniperAIModifier.prototype.UseAbilityEnemy(self)
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "sniper_take_aim", {target = {range = 1000}}) then
        return true
    end
    return false
end
function SniperAIModifier.prototype.UseAbilityCreep(self)
    if ActionAbility:CastAbilityOnFindEnemyCreep(self, "sniper_shrapnel", {target = {unitCondition = {noModifier = "modifier_sniper_shrapnel_slow"}}, ability = {charges = {gte = 3}}}) then
        return true
    end
    return false
end
SniperAIModifier = __TS__DecorateLegacy(
    {registerModifier(nil)},
    SniperAIModifier
)
____exports.SniperAIModifier = SniperAIModifier
return ____exports
