require("abilities/ability_trigger_item_common")
ability_trigger_item_on_cast = class({})
LinkLuaModifier("modifier_trigger_item_on_cast", "abilities/ability_trigger_item_on_cast", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_trigger_item_cooldown", "abilities/ability_trigger_item_common", LUA_MODIFIER_MOTION_NONE)
function ability_trigger_item_on_cast:GetIntrinsicModifierName()
return "modifier_trigger_item_on_cast"
end
function ability_trigger_item_on_cast:OnUpgrade()
if not IsServer() then return end
local modifier = self:GetCaster():FindModifierByName("modifier_trigger_item_on_cast")
if modifier then
ButterflyItemTrigger.RefreshKeyValues(modifier)
ButterflyItemTrigger.RefreshItemList(modifier)
end
end
modifier_trigger_item_on_cast = class({})
function modifier_trigger_item_on_cast:IsHidden() return true end
function modifier_trigger_item_on_cast:IsPermanent() return true end
function modifier_trigger_item_on_cast:RemoveOnDeath() return false end
function modifier_trigger_item_on_cast:IsPurgable() return false end
function modifier_trigger_item_on_cast:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED
}
end
function modifier_trigger_item_on_cast:OnCreated()
ButterflyItemTrigger.OnCreated(self)
end
function modifier_trigger_item_on_cast:OnAbilityExecuted(params)
if not IsServer() then return end
local parent = self:GetParent()
local caster = params.unit
local ability = params.ability
if caster ~= parent then return end
if not ability or ability:IsNull() then return end
if ability:IsItem() then return end
if ability:IsPassive() or ability:IsHidden() then return end
if IsAbilityExcludedForButterflyOnCast and IsAbilityExcludedForButterflyOnCast(ability:GetAbilityName()) then return end
if ability.butterfly_triggered or ability.butterfly_item_triggered then return end
if parent:IsChanneling() then return end
local source = params.target
local source_position = ButterflyItemTrigger.GetExecutedAbilityPosition(ability)
Timers:CreateTimer(FrameTime(), function()
if not self or self:IsNull() then return nil end
if not parent or parent:IsNull() or not parent:IsAlive() then return nil end
ButterflyItemTrigger.TryTriggerItem(self, source, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_3, "offensive", source_position)
return nil
end)
end
