LinkLuaModifier("modifier_clockwerk_auto_chainmail", "abilities/clockwerk_auto_chainmail", LUA_MODIFIER_MOTION_NONE)
clockwerk_auto_chainmail = class({})
function clockwerk_auto_chainmail:OnToggle()
local caster = self:GetCaster()
if self:GetToggleState() then
caster:AddNewModifier(caster, self, "modifier_clockwerk_auto_chainmail", {})
else
caster:RemoveModifierByName("modifier_clockwerk_auto_chainmail")
end
end
modifier_clockwerk_auto_chainmail = class({})
function modifier_clockwerk_auto_chainmail:IsHidden() return true end
function modifier_clockwerk_auto_chainmail:IsPurgable() return false end
function modifier_clockwerk_auto_chainmail:RemoveOnDeath() return true end
function modifier_clockwerk_auto_chainmail:OnCreated()
if IsClient() then
return
end
local ability = self:GetAbility()
if not ability then
return
end
local interval = ability:GetSpecialValueFor("purchase_interval")
self:StartIntervalThink(interval)
end
function modifier_clockwerk_auto_chainmail:OnIntervalThink()
if IsClient() then return end
local caster = self:GetParent()
local ability = self:GetAbility()
if not caster or not ability then
return
end
local in_fountain = caster:HasModifier("modifier_fountain_aura_buff")
if not in_fountain then
ability:ToggleAbility()
return
end
local gold_cost = ability:GetSpecialValueFor("chainmail_cost")
local current_gold = caster:GetGold()
if current_gold < gold_cost then
ability:ToggleAbility()
return
end
local inventory_count = 0
for i = 0, 5 do
if caster:GetItemInSlot(i) then
inventory_count = inventory_count + 1
end
end
if inventory_count >= 6 then
ability:ToggleAbility()
return
end
local item = caster:AddItemByName("item_chainmail")
if item then
caster:SpendGold(gold_cost, DOTA_ModifyGold_PurchaseItem)
caster:CastAbilityOnTarget(caster, item, caster:GetPlayerID())
else
end
end
