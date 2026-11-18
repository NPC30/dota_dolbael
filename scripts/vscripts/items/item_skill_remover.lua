LinkLuaModifier("modifier_skill_remover_tracker", "items/item_skill_remover.lua", LUA_MODIFIER_MOTION_NONE)
item_skill_remover = class({})
local REMOVED_ABILITY_MODIFIER_CLEANUP = {
dark_seer_normal_punch2 = { "modifier_dark_seer_normal_punch2" },
medusa_split_shot = { "modifier_medusa_split_shot" },
muerta_gunslinger = { "modifier_muerta_gunslinger" },
dark_seer_normal_punch3 = { "modifier_dark_seer_normal_punch3" },
weaver_geminate_attack = { "modifier_weaver_geminate_attack" },
tusk_walrus_punch = { "modifier_tusk_walrus_punch" },
}
local function CleanupRemovedAbilityModifiers(hero, ability_name)
local modifier_names = REMOVED_ABILITY_MODIFIER_CLEANUP[ability_name]
if not modifier_names then return end
for _, modifier_name in ipairs(modifier_names) do
if hero:HasModifier(modifier_name) then
hero:RemoveModifierByName(modifier_name)
end
end
end
function item_skill_remover:GetIntrinsicModifierName()
return "modifier_skill_remover_tracker"
end
function item_skill_remover:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
local last_ability = caster.last_used_ability_name
if not last_ability then
local player = caster:GetPlayerOwner()
if player then
CustomGameEventManager:Send_ServerToPlayer(player, "display_custom_error", {
message = "#skill_remover_no_ability"
})
end
return
end
if not caster:HasAbility(last_ability) then
caster.last_used_ability_name = nil
return
end
CleanupRemovedAbilityModifiers(caster, last_ability)
caster:RemoveAbility(last_ability)
CleanupRemovedAbilityModifiers(caster, last_ability)
caster.last_used_ability_name = nil
local player = caster:GetPlayerOwner()
if player then
CustomGameEventManager:Send_ServerToPlayer(player, "skill_removed", {
ability_name = last_ability
})
end
self:SpendCharge(1)
if self:GetCurrentCharges() == 0 then
self:RemoveSelf()
end
end
modifier_skill_remover_tracker = class({})
function modifier_skill_remover_tracker:IsHidden()
return true
end
function modifier_skill_remover_tracker:IsPurgable()
return false
end
function modifier_skill_remover_tracker:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED
}
end
function modifier_skill_remover_tracker:OnAbilityExecuted(params)
if not IsServer() then return end
local caster = self:GetCaster()
if params.unit ~= caster then return end
local ability = params.ability
if not ability or ability:IsItem() then return end
local ability_name = ability:GetAbilityName()
caster.last_used_ability_name = ability_name
local player = caster:GetPlayerOwner()
if player then
CustomGameEventManager:Send_ServerToPlayer(player, "skill_remover_ready", {
ability_name = ability_name
})
end
end
