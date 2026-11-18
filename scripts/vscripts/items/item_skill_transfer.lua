item_skill_transfer = class({})
function item_skill_transfer:OnSpellStart()
if not IsServer() then
return
end
local caster = self:GetCaster()
local target = self:GetCursorTarget()
if not caster or caster:IsNull() or not target or target:IsNull() then
return
end
local playerId = caster:GetPlayerOwnerID()
if playerId == nil or playerId < 0 then
return
end
if InitSkillTransfer == nil then
print("[SkillTransfer] InitSkillTransfer is nil")
return
end
print("[SkillTransfer] OnSpellStart playerId", playerId, "target", target:GetUnitName())
local ok = InitSkillTransfer(_, playerId, target:entindex(), self:entindex())
if not ok then
local player = caster:GetPlayerOwner()
if player then
CustomGameEventManager:Send_ServerToPlayer(player, "display_custom_error", {
message = "#skill_transfer_no_ability"
})
end
end
end
