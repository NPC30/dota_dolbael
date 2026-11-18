require("abilities/ability_trigger_item_common")
ability_trigger_item_on_attack = class({})
LinkLuaModifier("modifier_trigger_item_on_attack", "abilities/ability_trigger_item_on_attack", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_trigger_item_cooldown", "abilities/ability_trigger_item_common", LUA_MODIFIER_MOTION_NONE)
function ability_trigger_item_on_attack:GetIntrinsicModifierName()
return "modifier_trigger_item_on_attack"
end
function ability_trigger_item_on_attack:OnUpgrade()
if not IsServer() then return end
local modifier = self:GetCaster():FindModifierByName("modifier_trigger_item_on_attack")
if modifier then
ButterflyItemTrigger.RefreshKeyValues(modifier)
ButterflyItemTrigger.RefreshItemList(modifier)
end
end
modifier_trigger_item_on_attack = class({})
function modifier_trigger_item_on_attack:IsHidden() return true end
function modifier_trigger_item_on_attack:IsPermanent() return true end
function modifier_trigger_item_on_attack:RemoveOnDeath() return false end
function modifier_trigger_item_on_attack:IsPurgable() return false end
function modifier_trigger_item_on_attack:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ATTACK_LANDED
}
end
function modifier_trigger_item_on_attack:OnCreated()
ButterflyItemTrigger.OnCreated(self)
end
function modifier_trigger_item_on_attack:OnAttackLanded(params)
if not IsServer() then return end
local parent = self:GetParent()
if params.attacker ~= parent then return end
if not params.target or params.target:IsNull() or not params.target:IsAlive() then return end
if params.target:IsBuilding() then return end
ButterflyItemTrigger.TryTriggerItem(self, params.target, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, "attack_offensive")
end
