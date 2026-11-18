local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "items/ts_items/item_treasure_chest.lua"
__TS__SourceMapTraceBack("items/ts_items/item_treasure_chest.lua", {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["20"] = 11,["21"] = 12,["22"] = 13,["23"] = 5,["24"] = 4,["25"] = 3,["26"] = 4,["28"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
____exports.ItemTreasureChest = __TS__Class()
local ItemTreasureChest = ____exports.ItemTreasureChest
ItemTreasureChest.name = "ItemTreasureChest"
__TS__ClassExtends(ItemTreasureChest, BaseItem)
function ItemTreasureChest.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    if not caster then
        return
    end
    caster:EmitSound("ui.treasure_01")
    GameRules.Treasure:openNextChest(caster)
    self:SpendCharge(1)
end
ItemTreasureChest = __TS__DecorateLegacy(
    {registerAbility(nil, "item_treasure_chest")},
    ItemTreasureChest
)
____exports.ItemTreasureChest = ItemTreasureChest
return ____exports
