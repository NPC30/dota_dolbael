function OnAbilityExecuted(keys)
local ability = keys.event_ability
local abilityName = ability:GetAbilityName()
local blinkItems = {
'item_blink',
'item_swift_blink',
'item_overwhelming_blink',
'item_arcane_blink',
'item_swift_blink_2',
'item_overwhelming_blink_2',
'item_arcane_blink_2',
'item_jump_jump_jump'
}
for _, blinkName in pairs(blinkItems) do
if abilityName == blinkName then
local duration = keys.duration or 1.67
local pability = keys.ability
local parent = keys.caster
pability:ApplyDataDrivenModifier(parent, parent, "modifier_invulnerable_buff2", { duration = duration })
end
end
end
