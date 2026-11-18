require("items/item_tome_usage_limit")
local function ShowAbilityReplaceTomeError(caster, message)
local player = caster and caster:GetPlayerOwner()
if player then
CustomGameEventManager:Send_ServerToPlayer(player, "player_tip_error", {
message = message
})
end
end
function OnAbilityReplaceTomeSpellStart(params)
print("OnSpellStart item_tome_of_ability_replace")
local playerId = params.caster:GetPlayerID()
print("playerId", playerId)
if not SkillTomeHasAuthorizedItem(params.ability) then
print("item_tome_of_ability_replace unauthorized item instance")
SkillTomeRecordUnauthorizedUse(params.ability)
ShowAbilityReplaceTomeError(params.caster, "#dota_hud_error_skill_tome_unauthorized")
return
end
local max_usage = params.ability:GetSpecialValueFor("max_usage_per_player")
if max_usage <= 0 then
max_usage = 3
end
local can_use, current_count = AbilityTomeUsageCanUseTotal(playerId, "ability_replace_tome", max_usage)
print("item_tome_of_ability_replace usage", current_count, "max", max_usage)
if not can_use then
print("item_tome_of_ability_replace max usage reached")
ShowAbilityReplaceTomeError(params.caster, "#dota_hud_error_ability_replace_tome_max_usage")
return
end
local result = InitAbilityReplace(_, playerId)
if not result then
print("InitAbilityReplace failed")
return
end
AbilityTomeUsageIncrementTotal(playerId, "ability_replace_tome")
SkillTomeRecordSuccessfulUse(params.ability)
SkillTomeConsumeAuthorizedItem(params.ability)
print("InitAbilityReplace success")
params.ability:SpendCharge(1)
end
