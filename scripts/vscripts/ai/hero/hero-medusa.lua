local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/hero/hero-medusa.lua"
__TS__SourceMapTraceBack("ai/hero/hero-medusa.lua", {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 6,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 9,["20"] = 10,["22"] = 14,["23"] = 15,["25"] = 20,["26"] = 24,["28"] = 29,["29"] = 34,["31"] = 38,["32"] = 44,["34"] = 47,["35"] = 7,["36"] = 50,["37"] = 53,["38"] = 57,["40"] = 62,["41"] = 66,["43"] = 71,["44"] = 76,["46"] = 80,["47"] = 86,["49"] = 89,["50"] = 50,["51"] = 6,["52"] = 5,["53"] = 6,["55"] = 6});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____action_2Dability = require("ai.action.action-ability")
local ActionAbility = ____action_2Dability.ActionAbility
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.MedusaAIModifier = __TS__Class()
local MedusaAIModifier = ____exports.MedusaAIModifier
MedusaAIModifier.name = "MedusaAIModifier"
__TS__ClassExtends(MedusaAIModifier, BotBaseAIModifier)
function MedusaAIModifier.prototype.UseAbilityEnemy(self)
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "medusa_mystic_snake") then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "medusa_gorgon_grasp") then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "medusa_stone_gaze", {target = {count = {gte = 2}}}) then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "medusa_split_shot", {target = {count = {gte = 2}, range = 900}, action = {toggleOn = true}}) then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "medusa_split_shot", {target = {count = {lte = 1}, range = 900}, ability = {level = {lte = 3}}, action = {toggleOff = true}}) then
        return true
    end
    return false
end
function MedusaAIModifier.prototype.UseAbilityCreep(self)
    if ActionAbility:CastAbilityOnFindEnemyCreep(self, "medusa_mystic_snake", {target = {count = {gte = 2}}}) then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyCreep(self, "medusa_gorgon_grasp", {target = {count = {gte = 2}}}) then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyCreep(self, "medusa_split_shot", {target = {count = {gte = 2}, range = 900}, action = {toggleOn = true}}) then
        return true
    end
    if ActionAbility:CastAbilityOnFindEnemyCreep(self, "medusa_split_shot", {target = {count = {lte = 1}, range = 900}, ability = {level = {lte = 3}}, action = {toggleOff = true}}) then
        return true
    end
    return false
end
MedusaAIModifier = __TS__DecorateLegacy(
    {registerModifier(nil)},
    MedusaAIModifier
)
____exports.MedusaAIModifier = MedusaAIModifier
return ____exports
