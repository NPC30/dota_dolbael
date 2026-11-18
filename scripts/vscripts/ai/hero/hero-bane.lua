local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.BaneAIModifier = __TS__Class()
local BaneAIModifier = ____exports.BaneAIModifier
BaneAIModifier.name = "BaneAIModifier"
__TS__ClassExtends(BaneAIModifier, BotBaseAIModifier)
function BaneAIModifier.prototype.____constructor(self, ...)
BotBaseAIModifier.prototype.____constructor(self, ...)
self.useNewBuildSystem = true
end
BaneAIModifier = __TS__DecorateLegacy(
{registerModifier(nil, "ai/hero/hero-bane")},
BaneAIModifier
)
____exports.BaneAIModifier = BaneAIModifier
return ____exports
