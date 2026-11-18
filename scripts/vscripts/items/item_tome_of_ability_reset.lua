require("items/item_tome_usage_limit")
local function ShowAbilityResetTomeError(caster, message)
local player = caster and caster:GetPlayerOwner()
if player then
CustomGameEventManager:Send_ServerToPlayer(player, "player_tip_error", {
message = message
})
end
end
function OnAbilityResetTomeSpellStart(params)
print("OnSpellStart item_tome_of_ability_reset")
local playerId = params.caster:GetPlayerID()
print("playerId", playerId)
if not SkillTomeHasAuthorizedItem(params.ability) then
print("item_tome_of_ability_reset unauthorized item instance")
SkillTomeRecordUnauthorizedUse(params.ability)
ShowAbilityResetTomeError(params.caster, "#dota_hud_error_skill_tome_unauthorized")
return
end
local max_usage = params.ability:GetSpecialValueFor("max_usage_per_window")
if max_usage <= 0 then
max_usage = 6
end
local window_seconds = params.ability:GetSpecialValueFor("usage_window_seconds")
if window_seconds <= 0 then
window_seconds = 1500
end
local can_use, current_count, _, window_index = AbilityTomeUsageCanUseWindow(
playerId,
"ability_reset_tome",
max_usage,
window_seconds
)
print("item_tome_of_ability_reset usage", current_count, "max", max_usage, "window", window_index)
if not can_use then
print("item_tome_of_ability_reset max usage reached in current window")
ShowAbilityResetTomeError(params.caster, "#dota_hud_error_ability_reset_tome_max_usage")
return
end
local result = InitAbilityReset(_, playerId)
if not result then
print("InitAbilityReset failed")
return
end
AbilityTomeUsageIncrementWindow(playerId, "ability_reset_tome", window_seconds)
SkillTomeRecordSuccessfulUse(params.ability)
SkillTomeConsumeAuthorizedItem(params.ability)
print("InitAbilityReset success")
params.ability:SpendCharge(1)
end
