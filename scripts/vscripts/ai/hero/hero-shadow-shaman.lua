local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/hero/hero-shadow-shaman.lua"
__TS__SourceMapTraceBack("ai/hero/hero-shadow-shaman.lua", {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 9,["20"] = 10,["22"] = 14,["23"] = 15,["25"] = 19,["26"] = 20,["28"] = 25,["29"] = 29,["31"] = 32,["32"] = 7,["33"] = 35,["34"] = 38,["35"] = 42,["37"] = 44,["38"] = 35,["39"] = 6,["40"] = 5,["41"] = 6,["43"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____action_2Dability = require("ai.action.action-ability")
local ActionAbility = ____action_2Dability.ActionAbility
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.ShadowShamanAIModifier = __TS__Class()
local ShadowShamanAIModifier = ____exports.ShadowShamanAIModifier
ShadowShamanAIModifier.name = "ShadowShamanAIModifier"
__TS__ClassExtends(ShadowShamanAIModifier, BotBaseAIModifier)
function ShadowShamanAIModifier.prototype.UseAbilityEnemy(self)
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "shadow_shaman_voodoo") then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "shadow_shaman_ether_shock") then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "shadow_shaman_shackles") then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "shadow_shaman_mass_serpent_ward", {target = {count = {gte = 2}}}) then
        return true
    end
    return false
end
function ShadowShamanAIModifier.prototype.UseAbilityCreep(self)
    if ActionAbility:CastAbilityOnFindEnemyCreep(self, "shadow_shaman_ether_shock", {ability = {level = {gte = 3}}}) then
        return true
    end
    return false
end
ShadowShamanAIModifier = __TS__DecorateLegacy(
    {registerModifier(nil)},
    ShadowShamanAIModifier
)
____exports.ShadowShamanAIModifier = ShadowShamanAIModifier
return ____exports
