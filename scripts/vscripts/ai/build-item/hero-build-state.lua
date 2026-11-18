local ____lualib = require("lualib_bundle")
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local ____exports = {}
local FillUserConfigItems, FillPrerequisiteItems, FillTemplateItems
local ____hero_2Dbuild_2Dconfig_2Dtemplate = require("ai.build-item.hero-build-config-template")
local getTemplateConsumablesByTier = ____hero_2Dbuild_2Dconfig_2Dtemplate.getTemplateConsumablesByTier
local getTemplateItemsByTier = ____hero_2Dbuild_2Dconfig_2Dtemplate.getTemplateItemsByTier
local ____item_2Dtier_2Dconfig = require("ai.build-item.item-tier-config")
local getItemConfig = ____item_2Dtier_2Dconfig.getItemConfig
local GetItemPrerequisites = ____item_2Dtier_2Dconfig.GetItemPrerequisites
local ItemTier = ____item_2Dtier_2Dconfig.ItemTier
function FillUserConfigItems(self, config, resolvedItems, _consumables)
if not config.targetItemsByTier then
return
end
for tierStr in pairs(config.targetItemsByTier) do
local tier = __TS__ParseInt(tierStr)
local items = config.targetItemsByTier[tier]
if items ~= nil then
local regularItems = {}
for ____, itemName in ipairs(items) do
if #regularItems < 6 then
regularItems[#regularItems + 1] = itemName
end
end
resolvedItems[tier] = regularItems
end
end
end
function FillPrerequisiteItems(self, resolvedItems)
do
local tier = ItemTier.T5
while tier >= ItemTier.T1 do
local tierItems = resolvedItems[tier]
for ____, itemName in ipairs(tierItems) do
local prerequisites = GetItemPrerequisites(nil, itemName)
for ____, prereq in ipairs(prerequisites) do
do
local prereqConfig = getItemConfig(nil, prereq)
if not prereqConfig then
goto __continue14
end
local prereqTier = prereqConfig.tier
if prereqTier < tier then
if not __TS__ArrayIncludes(resolvedItems[prereqTier], prereq) then
if #resolvedItems[prereqTier] < 6 then
local ____resolvedItems_prereqTier_0 = resolvedItems[prereqTier]
____resolvedItems_prereqTier_0[#____resolvedItems_prereqTier_0 + 1] = prereq
end
end
end
end
::__continue14::
end
end
tier = tier - 1
end
end
end
function FillTemplateItems(self, config, resolvedItems, consumables)
if config.template == nil then
return
end
do
local tier = ItemTier.T1
while tier <= ItemTier.T5 do
if #resolvedItems[tier] < 6 then
local templateItems = getTemplateItemsByTier(nil, config.template, tier)
for ____, templateItem in ipairs(templateItems) do
if not __TS__ArrayIncludes(resolvedItems[tier], templateItem) then
local ____resolvedItems_tier_1 = resolvedItems[tier]
____resolvedItems_tier_1[#____resolvedItems_tier_1 + 1] = templateItem
end
if #resolvedItems[tier] >= 6 then
break
end
end
end
local templateConsumables = getTemplateConsumablesByTier(nil, config.template, tier)
for ____, consumable in ipairs(templateConsumables) do
local ____consumables_tier_2 = consumables[tier]
____consumables_tier_2[#____consumables_tier_2 + 1] = consumable
end
tier = tier + 1
end
end
end
function ____exports.InitializeHeroBuild(self, hero, config)
local resolvedItems = {
[ItemTier.T1] = {},
[ItemTier.T2] = {},
[ItemTier.T3] = {},
[ItemTier.T4] = {},
[ItemTier.T5] = {}
}
local consumables = {
[ItemTier.T1] = {},
[ItemTier.T2] = {},
[ItemTier.T3] = {},
[ItemTier.T4] = {},
[ItemTier.T5] = {}
}
FillUserConfigItems(nil, config, resolvedItems, consumables)
FillTemplateItems(nil, config, resolvedItems, consumables)
FillPrerequisiteItems(nil, resolvedItems)
print(((((((((((("[AI] InitializeHeroBuild " .. hero:GetUnitName()) .. " 初始化出装:\n") .. (" T1: " .. table.concat(resolvedItems[ItemTier.T1], ", ")) .. "\n") .. (" T2: " .. table.concat(resolvedItems[ItemTier.T2], ", ")) .. "\n") .. (" T3: " .. table.concat(resolvedItems[ItemTier.T3], ", ")) .. "\n") .. (" T4: " .. table.concat(resolvedItems[ItemTier.T4], ", ")) .. "\n") .. (" T5: " .. table.concat(resolvedItems[ItemTier.T5], ", ")) .. "\n") .. (" 消耗品 T1: " .. table.concat(consumables[ItemTier.T1], ", ")) .. "\n") .. (" 消耗品 T2: " .. table.concat(consumables[ItemTier.T2], ", ")) .. "\n") .. (" 消耗品 T3: " .. table.concat(consumables[ItemTier.T3], ", ")) .. "\n") .. (" 消耗品 T4: " .. table.concat(consumables[ItemTier.T4], ", ")) .. "\n") .. " 消耗品 T5: " .. table.concat(consumables[ItemTier.T5], ", "))
return {currentTier = ItemTier.T1, resolvedItems = resolvedItems, consumables = consumables}
end
return ____exports
