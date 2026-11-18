local ____exports = {}
local ____ability_2Dregistry = require("ai.ability.ability-registry")
local AbilityRegistry = ____ability_2Dregistry.AbilityRegistry
describe(
nil,
"AbilityRegistry",
function()
beforeEach(
nil,
function()
AbilityRegistry:_clear()
end
)
it(
nil,
"returns undefined for unknown ability",
function()
expect(
nil,
AbilityRegistry:get("not_registered")
):toBeUndefined()
end
)
it(
nil,
"registers and retrieves a single spec",
function()
local spec = {abilityName = "lion_finger_of_death", targetSide = "enemyHero"}
AbilityRegistry:register(spec)
expect(
nil,
AbilityRegistry:get("lion_finger_of_death")
):toEqual({spec})
end
)
it(
nil,
"preserves registration order for multiple specs on same ability",
function()
local specA = {abilityName = "medusa_split_shot", targetSide = "enemyHero", condition = {target = {count = {gte = 1}}}}
local specB = {abilityName = "medusa_split_shot", targetSide = "enemyCreep", condition = {target = {count = {gte = 3}}}}
AbilityRegistry:register(specA)
AbilityRegistry:register(specB)
local result = AbilityRegistry:get("medusa_split_shot")
expect(nil, result):toEqual({specA, specB})
end
)
it(
nil,
"registerAll appends specs in order",
function()
local specs = {{abilityName = "ability_a", targetSide = "self"}, {abilityName = "ability_b", targetSide = "enemyHero"}}
AbilityRegistry:registerAll(specs)
expect(
nil,
AbilityRegistry:get("ability_a")
):toEqual({specs[1]})
expect(
nil,
AbilityRegistry:get("ability_b")
):toEqual({specs[2]})
end
)
end
)
return ____exports
