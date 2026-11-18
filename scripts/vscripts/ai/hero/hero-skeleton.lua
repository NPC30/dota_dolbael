local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/hero/hero-skeleton.lua"
__TS__SourceMapTraceBack("ai/hero/hero-skeleton.lua", {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 6,["17"] = 8,["18"] = 6,["19"] = 8,["20"] = 9,["21"] = 11,["22"] = 12,["24"] = 14,["25"] = 9,["26"] = 8,["28"] = 6,["29"] = 7,["31"] = 8,["33"] = 8});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____action_2Dability = require("ai.action.action-ability")
local ActionAbility = ____action_2Dability.ActionAbility
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.SkeletonAIModifier = __TS__Class()
local SkeletonAIModifier = ____exports.SkeletonAIModifier
SkeletonAIModifier.name = "SkeletonAIModifier"
__TS__ClassExtends(SkeletonAIModifier, BotBaseAIModifier)
function SkeletonAIModifier.prototype.UseAbilityEnemy(self)
    if ActionAbility:CastAbilityOnFindEnemyHero(self, "skeleton_king_hellfire_blast") then
        return true
    end
    return false
end
SkeletonAIModifier = __TS__DecorateLegacy(
    {
        reloadable,
        registerModifier(nil)
    },
    SkeletonAIModifier
)
____exports.SkeletonAIModifier = SkeletonAIModifier
return ____exports
