local ____exports = {}
local ____neutral_2Ditem = require("ai.item.neutral-item")
local NeutralItemManager = ____neutral_2Ditem.NeutralItemManager
global.GameRules = {
Option = {direGoldXpMultiplier = 1},
GetDOTATime = jest:fn():mockReturnValue(0)
}
describe(
nil,
"NeutralItemManager.GetNeutralItemTier",
function()
it(
nil,
"returns correct tier for a tier-1 active item",
function()
expect(
nil,
NeutralItemManager:GetNeutralItemTier("item_arcane_ring", 1)
):toBe(1)
end
)
it(
nil,
"returns correct tier for a tier-5 active item",
function()
expect(
nil,
NeutralItemManager:GetNeutralItemTier("item_desolator_2", 1)
):toBe(5)
end
)
it(
nil,
"returns correct tier for enhancement with level matching tier",
function()
expect(
nil,
NeutralItemManager:GetNeutralItemTier("item_enhancement_brawny", 1)
):toBe(1)
expect(
nil,
NeutralItemManager:GetNeutralItemTier("item_enhancement_brawny", 2)
):toBe(2)
expect(
nil,
NeutralItemManager:GetNeutralItemTier("item_enhancement_brawny", 3)
):toBe(3)
expect(
nil,
NeutralItemManager:GetNeutralItemTier("item_enhancement_brawny", 4)
):toBe(4)
end
)
it(
nil,
"returns undefined for unknown item name",
function()
expect(
nil,
NeutralItemManager:GetNeutralItemTier("item_nonexistent", 1)
):toBeUndefined()
end
)
it(
nil,
"returns undefined when name matches but level does not",
function()
expect(
nil,
NeutralItemManager:GetNeutralItemTier("item_arcane_ring", 2)
):toBeUndefined()
end
)
it(
nil,
"returns undefined for item name that exists but wrong level",
function()
expect(
nil,
NeutralItemManager:GetNeutralItemTier("item_enhancement_brawny", 5)
):toBeUndefined()
end
)
end
)
return ____exports
