local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.AbaddonAIModifier = __TS__Class()
local AbaddonAIModifier = ____exports.AbaddonAIModifier
AbaddonAIModifier.name = "AbaddonAIModifier"
__TS__ClassExtends(AbaddonAIModifier, BotBaseAIModifier)
function AbaddonAIModifier.prototype.____constructor(self, ...)
BotBaseAIModifier.prototype.____constructor(self, ...)
self.useNewBuildSystem = true
end
AbaddonAIModifier = __TS__DecorateLegacy(
{registerModifier(nil, "ai/hero/hero-abaddon")},
AbaddonAIModifier
)
____exports.AbaddonAIModifier = AbaddonAIModifier
return ____exports
