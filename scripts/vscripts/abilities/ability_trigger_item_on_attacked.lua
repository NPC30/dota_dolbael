require("abilities/ability_trigger_item_common")
ability_trigger_item_on_attacked = class({})
LinkLuaModifier("modifier_trigger_item_on_attacked", "abilities/ability_trigger_item_on_attacked", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_trigger_item_cooldown", "abilities/ability_trigger_item_common", LUA_MODIFIER_MOTION_NONE)
function ability_trigger_item_on_attacked:GetIntrinsicModifierName()
return "modifier_trigger_item_on_attacked"
end
function ability_trigger_item_on_attacked:OnUpgrade()
if not IsServer() then return end
local modifier = self:GetCaster():FindModifierByName("modifier_trigger_item_on_attacked")
if modifier then
ButterflyItemTrigger.RefreshKeyValues(modifier)
ButterflyItemTrigger.RefreshItemList(modifier)
end
end
modifier_trigger_item_on_attacked = class({})
function modifier_trigger_item_on_attacked:IsHidden() return true end
function modifier_trigger_item_on_attacked:IsPermanent() return true end
function modifier_trigger_item_on_attacked:RemoveOnDeath() return false end
function modifier_trigger_item_on_attacked:IsPurgable() return false end
function modifier_trigger_item_on_attacked:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ATTACKED,
MODIFIER_EVENT_ON_ABILITY_EXECUTED
}
end
function modifier_trigger_item_on_attacked:OnCreated()
ButterflyItemTrigger.OnCreated(self)
end
function modifier_trigger_item_on_attacked:OnAttacked(params)
if not IsServer() then return end
local parent = self:GetParent()
if params.target ~= parent then return end
if not params.attacker or params.attacker:IsNull() or not params.attacker:IsAlive() then return end
if params.attacker:IsBuilding() then return end
ButterflyItemTrigger.TryTriggerItem(self, params.attacker, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_2, "defensive")
end
function modifier_trigger_item_on_attacked:OnAbilityExecuted(params)
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
