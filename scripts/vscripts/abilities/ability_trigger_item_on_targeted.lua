require("abilities/ability_trigger_item_common")
ability_trigger_item_on_targeted = class({})
LinkLuaModifier("modifier_trigger_item_on_targeted", "abilities/ability_trigger_item_on_targeted", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_trigger_item_cooldown", "abilities/ability_trigger_item_common", LUA_MODIFIER_MOTION_NONE)
function ability_trigger_item_on_targeted:GetIntrinsicModifierName()
return "modifier_trigger_item_on_targeted"
end
function ability_trigger_item_on_targeted:OnUpgrade()
if not IsServer() then return end
local modifier = self:GetCaster():FindModifierByName("modifier_trigger_item_on_targeted")
if modifier then
ButterflyItemTrigger.RefreshKeyValues(modifier)
ButterflyItemTrigger.RefreshItemList(modifier)
end
end
modifier_trigger_item_on_targeted = class({})
function modifier_trigger_item_on_targeted:IsHidden() return true end
function modifier_trigger_item_on_targeted:IsPermanent() return true end
function modifier_trigger_item_on_targeted:RemoveOnDeath() return false end
function modifier_trigger_item_on_targeted:IsPurgable() return false end
function modifier_trigger_item_on_targeted:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED
}
end
function modifier_trigger_item_on_targeted:OnCreated()
ButterflyItemTrigger.OnCreated(self)
end
function modifier_trigger_item_on_targeted:OnAbilityExecuted(params)
if not IsServer() then return end
local parent = self:GetParent()
local caster = params.unit
local ability = params.ability
if params.target ~= parent then return end
if caster == parent then return end
if not caster or caster:IsNull() or not caster:IsAlive() then return end
if caster:GetTeamNumber() == parent:GetTeamNumber() then return end
if not ability or ability:IsNull() then return end
if ability.butterfly_triggered or ability.butterfly_item_triggered then return end
ButterflyItemTrigger.TryTriggerItem(self, caster, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_4, "defensive")
end
