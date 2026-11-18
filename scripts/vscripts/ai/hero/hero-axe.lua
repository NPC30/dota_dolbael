local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.AxeAIModifier = __TS__Class()
local AxeAIModifier = ____exports.AxeAIModifier
AxeAIModifier.name = "AxeAIModifier"
__TS__ClassExtends(AxeAIModifier, BotBaseAIModifier)
function AxeAIModifier.prototype.____constructor(self, ...)
BotBaseAIModifier.prototype.____constructor(self, ...)
self.useNewBuildSystem = true
end
AxeAIModifier = __TS__DecorateLegacy(
{registerModifier(nil, "ai/hero/hero-axe")},
AxeAIModifier
)
____exports.AxeAIModifier = AxeAIModifier
return ____exports
