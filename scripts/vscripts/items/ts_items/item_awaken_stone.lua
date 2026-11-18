local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____awaken_2Dreplacer = require("modules.awaken.awaken-replacer")
local applyAwakenByHero = ____awaken_2Dreplacer.applyAwakenByHero
local canAwaken = ____awaken_2Dreplacer.canAwaken
local isAwakened = ____awaken_2Dreplacer.isAwakened
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
____exports.ItemAwakenStone = __TS__Class()
local ItemAwakenStone = ____exports.ItemAwakenStone
ItemAwakenStone.name = "ItemAwakenStone"
__TS__ClassExtends(ItemAwakenStone, BaseItem)
function ItemAwakenStone.prototype.castErrorKey(self)
local caster = self:GetCaster()
if caster == nil or not caster:IsHero() then
return ""
end
local hero = caster
if not canAwaken(nil, hero) then
return "#dota_hud_error_awaken_stone_unsupported"
end
if isAwakened(nil, hero) then
return "#dota_hud_error_awaken_stone_awakened"
end
return ""
end
function ItemAwakenStone.prototype.CastFilterResult(self)
local ____temp_0
if self:castErrorKey() ~= "" then
____temp_0 = UF_FAIL_CUSTOM
else
____temp_0 = UF_SUCCESS
end
return ____temp_0
end
function ItemAwakenStone.prototype.GetCustomCastError(self)
return self:castErrorKey()
end
function ItemAwakenStone.prototype.OnSpellStart(self)
local caster = self:GetCaster()
if not caster or not caster:IsHero() then
return
end
local success = applyAwakenByHero(nil, caster)
if success then
UTIL_Remove(self)
end
end
ItemAwakenStone = __TS__DecorateLegacy(
{registerAbility(nil, "item_awaken_stone")},
ItemAwakenStone
)
____exports.ItemAwakenStone = ItemAwakenStone
return ____exports
