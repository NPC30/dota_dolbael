local ____exports = {}
local ____ability_2Dcast = require("ai.ability.ability-cast")
local ApplyAbilityAction = ____ability_2Dcast.ApplyAbilityAction
local function fakeAbility(self, state)
return {
GetName = function() return "fake_ability" end,
GetToggleState = function()
local ____state_toggle_0 = state.toggle
if ____state_toggle_0 == nil then
____state_toggle_0 = false
end
return ____state_toggle_0
end,
GetAutoCastState = function()
local ____state_autoCast_1 = state.autoCast
if ____state_autoCast_1 == nil then
____state_autoCast_1 = false
end
return ____state_autoCast_1
end,
ToggleAbility = function()
state.toggle = not state.toggle
end,
ToggleAutoCast = function()
state.autoCast = not state.autoCast
end
}
end
beforeAll(
nil,
function()
_G.print = function()
end
end
)
describe(
nil,
"ApplyAbilityAction",
function()
it(
nil,
"toggleOn switches an off ability on, returns true once",
function()
local state = {toggle = false}
local ability = fakeAbility(nil, state)
expect(
nil,
ApplyAbilityAction(nil, ability, {toggleOn = true})
):toBe(true)
expect(nil, state.toggle):toBe(true)
expect(
nil,
ApplyAbilityAction(nil, ability, {toggleOn = true})
):toBe(false)
end
)
it(
nil,
"toggleOff switches an on ability off, returns true once",
function()
local state = {toggle = true}
local ability = fakeAbility(nil, state)
expect(
nil,
ApplyAbilityAction(nil, ability, {toggleOff = true})
):toBe(true)
expect(nil, state.toggle):toBe(false)
expect(
nil,
ApplyAbilityAction(nil, ability, {toggleOff = true})
):toBe(false)
end
)
it(
nil,
"autoCastOn enables autocast, returns true once",
function()
local state = {autoCast = false}
local ability = fakeAbility(nil, state)
expect(
nil,
ApplyAbilityAction(nil, ability, {autoCastOn = true})
):toBe(true)
expect(nil, state.autoCast):toBe(true)
expect(
nil,
ApplyAbilityAction(nil, ability, {autoCastOn = true})
):toBe(false)
end
)
it(
nil,
"returns false when no action flag is set",
function()
local ability = fakeAbility(nil, {})
expect(
nil,
ApplyAbilityAction(nil, ability, {})
):toBe(false)
end
)
end
)
return ____exports
