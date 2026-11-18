local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/helper/modifier-helper.lua"
__TS__SourceMapTraceBack("modules/helper/modifier-helper.lua", {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 25,["12"] = 26,["15"] = 29,["18"] = 32,["19"] = 33,["20"] = 35,["21"] = 35,["22"] = 35,["23"] = 37,["26"] = 41,["28"] = 42,["29"] = 42,["30"] = 43,["31"] = 44,["32"] = 45,["34"] = 42,["37"] = 49,["38"] = 50,["39"] = 52,["41"] = 53,["42"] = 53,["43"] = 54,["44"] = 53,["48"] = 63,["50"] = 65,["51"] = 65,["52"] = 66,["53"] = 65,["57"] = 35,["58"] = 35,["59"] = 25,["60"] = 78,["61"] = 83,["62"] = 78,["63"] = 96,["64"] = 97,["65"] = 98,["66"] = 96,["67"] = 106,["68"] = 107,["69"] = 106,["70"] = 118,["71"] = 119,["72"] = 119,["73"] = 119,["74"] = 119,["75"] = 119,["76"] = 119,["77"] = 119,["78"] = 118,["79"] = 138,["80"] = 143,["81"] = 143,["83"] = 145,["84"] = 146,["87"] = 149,["88"] = 150,["89"] = 138,["90"] = 2,["91"] = 8,["92"] = 14,["93"] = 164,["94"] = 165,["95"] = 164,["96"] = 168});
local ____exports = {}
____exports.ModifierHelper = __TS__Class()
local ModifierHelper = ____exports.ModifierHelper
ModifierHelper.name = "ModifierHelper"
function ModifierHelper.prototype.____constructor(self)
end
function ModifierHelper.refreshItemDataDrivenModifier(self, item, modifierName)
    if not item then
        return
    end
    if item.IsNull and item:IsNull() then
        return
    end
    local caster = item:GetCaster()
    local itemName = item:GetName()
    Timers:CreateTimer(
        0.1,
        function()
            if not caster or caster:IsNull() then
                return
            end
            local itemCount = 0
            do
                local i = 0
                while i < 6 do
                    local itemInSlot = caster:GetItemInSlot(i)
                    if itemInSlot and itemInSlot:GetName() == itemName then
                        itemCount = itemCount + 1
                    end
                    i = i + 1
                end
            end
            local modifiers = caster:FindAllModifiersByName(modifierName)
            local modifierCount = #modifiers
            if itemCount > modifierCount then
                do
                    local i = 0
                    while i < itemCount - modifierCount do
                        self.GLOBAL_APPLY_MODIFIERS_ITEM:ApplyDataDrivenModifier(caster, caster, modifierName, {})
                        i = i + 1
                    end
                end
            end
            if itemCount < modifierCount then
                do
                    local i = 0
                    while i < modifierCount - itemCount do
                        modifiers[i + 1]:Destroy()
                        i = i + 1
                    end
                end
            end
        end
    )
end
function ModifierHelper.applyItemDataDrivenModifier(self, target, modifierName, modifierTable)
    self.GLOBAL_APPLY_MODIFIERS_ITEM:ApplyDataDrivenModifier(target, target, modifierName, modifierTable)
end
function ModifierHelper.refreshGlobalModifier(self, unit, modifierName)
    unit:RemoveModifierByName(modifierName)
    self:applyGlobalModifier(unit, modifierName)
end
function ModifierHelper.applyGlobalModifier(self, unit, modifierName)
    self:applyDataDrivenModifier(unit, self.ITEM_GLOBAL_MODIFIERS, modifierName, {duration = -1})
end
function ModifierHelper.applyTowerModifier(self, unit, modifierName, level)
    self:applyDataDrivenModifier(
        unit,
        self.ITEM_TOWER_MODIFIER,
        modifierName,
        {duration = -1},
        level
    )
end
function ModifierHelper.applyDataDrivenModifier(self, unit, dataDrivenItem, modifierName, modifierTable, level)
    if level == nil then
        level = 1
    end
    if not dataDrivenItem then
        Warning("[ModifierHelper] dataDrivenItem is nil for modifier: " .. modifierName)
        return
    end
    dataDrivenItem:SetLevel(level)
    dataDrivenItem:ApplyDataDrivenModifier(unit, unit, modifierName, modifierTable)
end
ModifierHelper.GLOBAL_APPLY_MODIFIERS_ITEM = CreateItem("item_apply_modifiers", nil, nil)
ModifierHelper.ITEM_GLOBAL_MODIFIERS = CreateItem("item_global_modifiers", nil, nil)
ModifierHelper.ITEM_TOWER_MODIFIER = CreateItem("item_tower_modifiers", nil, nil)
_G.RefreshItemDataDrivenModifier = function(____, item, modifierName)
    ____exports.ModifierHelper:refreshItemDataDrivenModifier(item, modifierName)
end
_G.ApplyItemDataDrivenModifier = function(____, target, modifierName, modifierTable) return ____exports.ModifierHelper:applyItemDataDrivenModifier(target, modifierName, modifierTable) end
return ____exports
