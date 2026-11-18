LinkLuaModifier("modifier_special_bonus_unique_magnataur_upgrade", "abilities/special_bonus_unique_magnataur_upgrade.lua",
LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_magnataur_upgrade = class({})
function special_bonus_unique_magnataur_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_magnataur_upgrade"
end
modifier_special_bonus_unique_magnataur_upgrade = class({})
function modifier_special_bonus_unique_magnataur_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_magnataur_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_magnataur_upgrade:IsDebuff() return false end
function modifier_special_bonus_unique_magnataur_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED,
}
end
function modifier_special_bonus_unique_magnataur_upgrade:OnAbilityExecuted(keys)
if not IsServer() then return end
local parent = self:GetParent()
if keys.unit ~= parent then return end
local ability = keys.ability
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
local duration = self:GetAbility():GetSpecialValueFor("invulnerability_duration") or 0.5
ApplyItemDataDrivenModifier(_, parent, "modifier_invulnerable_buff", { duration = duration })
break
end
end
end
