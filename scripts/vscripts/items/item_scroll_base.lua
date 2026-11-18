item_scroll_base = class({})
function item_scroll_base:CastScrollAbility(ability_name, ability_level)
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local cursor_pos = self:GetCursorPosition()
local player_id = caster:GetPlayerOwnerID()
local charges = self:GetCurrentCharges()
if charges > 0 then
self:SetCurrentCharges(charges - 1)
if charges - 1 <= 0 then
self:RemoveSelf()
end
end
local ability = caster:AddAbility(ability_name)
ability:SetLevel(ability_level or 1)
ability:EndCooldown()
local mana_cost = ability:GetManaCost(-1)
if caster:GetMana() < mana_cost then
caster:GiveMana(mana_cost)
end
local behavior = ability:GetBehavior()
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
caster:CastAbilityOnTarget(target, ability, player_id)
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 or bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 then
caster:CastAbilityOnPosition(cursor_pos, ability, player_id)
else
caster:CastAbilityNoTarget(ability, player_id)
end
Timers:CreateTimer(0.5, function()
if caster and not caster:IsNull() then
caster:RemoveAbility(ability_name)
end
end)
end
