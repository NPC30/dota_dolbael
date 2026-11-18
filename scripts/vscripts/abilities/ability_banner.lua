ability_banner = class({})
function ability_banner:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
local target_point = GetGroundPosition(self:GetCursorPosition(), nil)
local player_id = caster:GetPlayerOwnerID()
local dummy = CreateUnitByName("dummy_unit_hero", target_point, false, nil, nil, self:GetCaster():GetTeamNumber())
if not dummy or dummy:IsNull() then
return
end
dummy:SetOwner(caster)
dummy:SetControllableByPlayer(caster:GetPlayerID(), true)
local item = dummy:AddItemByName("item_roshans_banner")
if not item then
dummy:RemoveSelf()
return
end
dummy:SetCursorPosition(target_point)
local result = dummy:CastAbilityImmediately(item, -1)
Timers:CreateTimer(185, function()
if dummy and not dummy:IsNull() then
dummy:RemoveSelf()
end
end)
caster:EmitSound("Item.RoshanBanner.Activate")
Timers:CreateTimer(0.3, function()
caster:RemoveAbility(self:GetAbilityName())
end)
end
