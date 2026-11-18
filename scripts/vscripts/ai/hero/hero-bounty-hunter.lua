local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local registerModifier = ____dota_ts_adapter.registerModifier
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
____exports.BountyHunterAIModifier = __TS__Class()
local BountyHunterAIModifier = ____exports.BountyHunterAIModifier
BountyHunterAIModifier.name = "BountyHunterAIModifier"
__TS__ClassExtends(BountyHunterAIModifier, BotBaseAIModifier)
function BountyHunterAIModifier.prototype.____constructor(self, ...)
BotBaseAIModifier.prototype.____constructor(self, ...)
self.useNewBuildSystem = true
end
BountyHunterAIModifier = __TS__DecorateLegacy(
{registerModifier(nil, "ai/hero/hero-bounty-hunter")},
BountyHunterAIModifier
)
____exports.BountyHunterAIModifier = BountyHunterAIModifier
return ____exports
