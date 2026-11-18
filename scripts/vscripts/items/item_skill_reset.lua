item_skill_reset = class({})
function item_skill_reset:OnSpellStart()
if not IsServer() then
return
end
local caster = self:GetCaster()
if not caster or caster:IsNull() then
return
end
local playerId = caster:GetPlayerOwnerID()
if playerId == nil or playerId < 0 then
return
end
if InitSkillReset == nil then
print("[SkillReset] InitSkillReset is nil")
return
end
print("[SkillReset] OnSpellStart playerId", playerId, "itemEntIndex", self:entindex())
local ok = InitSkillReset(_, playerId, self:entindex())
if not ok then
local player = caster:GetPlayerOwner()
if player then
CustomGameEventManager:Send_ServerToPlayer(player, "display_custom_error", {
message = "#skill_reset_no_ability"
})
end
end
end
