require("abilities/ability_blacklist_butterfly")
local TALISMAN_EXCLUDED_ABILITIES = {
["life_stealer_infest"] = true,
}
item_skill_talisman = class({})
LinkLuaModifier("modifier_skill_talisman_tracker", "items/item_skill_talisman.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_skill_talisman_display", "items/item_skill_talisman.lua", LUA_MODIFIER_MOTION_NONE)
function item_skill_talisman:GetIntrinsicModifierName()
return "modifier_skill_talisman_tracker"
end
function item_skill_talisman:GetStoredAbility()
return self.stored_ability_data
end
function item_skill_talisman:SetStoredAbility(data)
self.stored_ability_data = data
end
function item_skill_talisman:OnSpellStart()
local caster = self:GetCaster()
local cursor_pos = self:GetCursorPosition()
local player_id = caster:GetPlayerOwnerID()
local tracker = caster:FindModifierByName("modifier_skill_talisman_tracker")
local stored_ability = self:GetStoredAbility()
if not tracker then
return
end
if not tracker.temp_ability then
return
end
if not stored_ability then
return
end
local item_consumed = false
for item_slot = DOTA_ITEM_SLOT_1, DOTA_STASH_SLOT_6 do
local item = caster:GetItemInSlot(item_slot)
if item and item:GetName() == "item_skill_talisman" then
local charges = item:GetCurrentCharges()
if charges > 0 then
item:SetCurrentCharges(charges - 1)
item_consumed = true
if charges - 1 <= 0 then
item:RemoveSelf()
end
break
end
end
end
if not item_consumed then
return
end
self.is_casting_stored_ability = true
local temp_ability = tracker.temp_ability
local current_mana = caster:GetMana()
local mana_cost = temp_ability:GetManaCost(temp_ability:GetLevel() - 1)
local original_cast_point = temp_ability:GetCastPoint()
local remaining_cooldown = temp_ability:GetCooldownTimeRemaining() or 0
local original_level = temp_ability:GetLevel()
local has_charges = temp_ability:GetMaxAbilityCharges(temp_ability:GetLevel()) > 0
local current_charges = 0
if has_charges then
current_charges = temp_ability:GetCurrentAbilityCharges()
end
temp_ability:SetLevel(stored_ability.ability_level or 1)
temp_ability:EndCooldown()
temp_ability:SetOverrideCastPoint(0)
if current_mana < mana_cost then
caster:GiveMana(mana_cost - current_mana)
end
local behavior = temp_ability:GetBehavior()
local cast_success = false
local ability_name = temp_ability:GetAbilityName()
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
local target_team = temp_ability:GetAbilityTargetTeam()
local target_type = temp_ability:GetAbilityTargetType()
local target_flags = temp_ability:GetAbilityTargetFlags()
local cast_range = temp_ability:GetCastRange(cursor_pos, nil)
local units = FindUnitsInRadius(
caster:GetTeamNumber(),
cursor_pos,
nil,
cast_range,
target_team,
target_type,
target_flags,
FIND_CLOSEST,
false
)
if #units > 0 then
caster:SetCursorCastTarget(units[1])
cast_success = caster:CastAbilityImmediately(temp_ability, player_id)
caster:SetCursorCastTarget(nil)
end
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 or
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 then
caster:SetCursorPosition(cursor_pos)
cast_success = caster:CastAbilityImmediately(temp_ability, player_id)
else
cast_success = caster:CastAbilityImmediately(temp_ability, player_id)
end
caster:SetMana(current_mana)
temp_ability:SetOverrideCastPoint(original_cast_point)
if not tracker.should_remove_ability then
temp_ability:SetLevel(original_level)
end
local restore_delay = FrameTime()
if ability_name == "juggernaut_omni_slash" or ability_name == "enigma_black_hole" then
restore_delay = 4.0
end
temp_ability:SetContextThink("restore_cooldown_" .. temp_ability:GetEntityIndex(), function()
if not temp_ability or temp_ability:IsNull() then
return nil
end
if has_charges then
if temp_ability:IsItem() then
temp_ability:SetCurrentCharges(current_charges)
else
temp_ability:SetCurrentAbilityCharges(current_charges)
end
else
if remaining_cooldown and remaining_cooldown > 0 then
temp_ability:EndCooldown()
temp_ability:StartCooldown(remaining_cooldown)
else
temp_ability:EndCooldown()
end
end
return nil
end, restore_delay)
Timers:CreateTimer(0.03, function()
self.is_casting_stored_ability = false
end)
end
function item_skill_talisman:GetAbilitySpecialValue(key)
if key == "stored_ability" then
local stored_ability = self:GetStoredAbility()
if stored_ability and stored_ability.ability_name then
return stored_ability.ability_name
end
return "无"
end
return 0
end
function item_skill_talisman:OnOwnerChanged(params)
if IsServer() then
local old_owner = params.old_owner
local new_owner = params.new_owner
if old_owner and new_owner then
local old_talisman = old_owner:FindItemInInventory("item_skill_talisman")
if old_talisman then
local stored_data = old_talisman:GetStoredAbility()
if stored_data then
local new_talisman = new_owner:FindItemInInventory("item_skill_talisman")
if new_talisman then
new_talisman:SetStoredAbility(stored_data)
old_owner:RemoveModifierByName("modifier_skill_talisman_display")
new_owner:AddNewModifier(new_owner, self, "modifier_skill_talisman_display", {
ability_name = stored_data.ability_name
})
end
end
end
self:SetLevel(self:GetLevel())
end
end
end
modifier_skill_talisman_tracker = class({})
function modifier_skill_talisman_tracker:IsHidden()
return false
end
function modifier_skill_talisman_tracker:IsPurgable()
return false
end
function modifier_skill_talisman_tracker:RemoveOnDeath()
return false
end
function modifier_skill_talisman_tracker:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED
}
end
function modifier_skill_talisman_tracker:OnCreated()
if IsServer() then
local caster = self:GetCaster()
local talisman_item = caster:FindItemInInventory("item_skill_talisman")
if talisman_item then
local stored_data = talisman_item:GetStoredAbility()
if stored_data and stored_data.ability_name then
local existing_ability = caster:FindAbilityByName(stored_data.ability_name)
if not existing_ability then
self.temp_ability = caster:AddAbility(stored_data.ability_name)
self.temp_ability:SetLevel(stored_data.ability_level or 1)
self.temp_ability:SetStolen(true)
self.temp_ability:SetHidden(true)
self.should_remove_ability = true
self.ability_source = "talisman_added"
else
self.temp_ability = existing_ability
local is_talisman_ability = self:CheckIfAbilityAddedByTalisman(existing_ability)
self.should_remove_ability = is_talisman_ability
self.ability_source = is_talisman_ability and "talisman_added" or "original"
end
if self.temp_ability then
else
end
caster:AddNewModifier(caster, self:GetAbility(), "modifier_skill_talisman_display", {
ability_name = stored_data.ability_name
})
else
end
else
end
end
end
function modifier_skill_talisman_tracker:CheckIfAbilityAddedByTalisman(ability)
if not ability then return false end
if ability:IsStolen() and ability:IsHidden() then
return true
end
local caster = self:GetCaster()
local abilities = {}
for i = 0, caster:GetAbilityCount() - 1 do
local ab = caster:GetAbilityByIndex(i)
if ab and ab:GetAbilityName() == ability:GetAbilityName() then
table.insert(abilities, ab)
end
end
if #abilities > 1 then
return abilities[#abilities] == ability
end
return false
end
function modifier_skill_talisman_tracker:OnDestroy()
if IsServer() then
local caster = self:GetCaster()
caster:RemoveModifierByName("modifier_skill_talisman_display")
if self.should_remove_ability and self.temp_ability and not caster:IsNull() then
local ability_name = self.temp_ability:GetAbilityName()
local long_duration_abilities = {
doom_bringer_doom = true,
dragon_knight_dragon_form = true,
terrorblade_metamorphosis = true,
muerta_pierce_the_veil = true,
}
local remove_delay = 5.0
if long_duration_abilities[ability_name] then
remove_delay = 30.0
end
Timers:CreateTimer(remove_delay, function()
if not caster:IsNull() then
local current_tracker = caster:FindModifierByName("modifier_skill_talisman_tracker")
if current_tracker and current_tracker.temp_ability then
local current_ability_name = current_tracker.temp_ability:GetAbilityName()
if current_ability_name == ability_name then
return
end
end
local ability_to_remove = caster:FindAbilityByName(ability_name)
if ability_to_remove then
caster:RemoveAbility(ability_name)
end
end
end)
else
end
end
end
function modifier_skill_talisman_tracker:OnAbilityExecuted(params)
if not IsServer() then return end
local caster = self:GetCaster()
if params.unit ~= caster then return end
local ability = params.ability
if not ability or ability:IsItem() then return end
local ability_name = ability:GetAbilityName()
if ability_name == "item_skill_talisman" then return end
local talisman_item = caster:FindItemInInventory("item_skill_talisman")
if talisman_item and talisman_item.is_casting_stored_ability then
return
end
local player_id = caster:GetPlayerOwnerID()
local existing_stored_ability = talisman_item:GetStoredAbility()
if existing_stored_ability and existing_stored_ability.ability_name then
CustomGameEventManager:Send_ServerToPlayer(
PlayerResource:GetPlayer(player_id),
"talisman_already_has_ability",
{
existing_ability = existing_stored_ability.ability_name,
new_ability = ability_name
}
)
return
end
if TALISMAN_EXCLUDED_ABILITIES[ability_name] then
CustomGameEventManager:Send_ServerToPlayer(
PlayerResource:GetPlayer(player_id),
"talisman_cannot_store_EXCLUDED_ABILITIES_ALLBUTTER",
{ ability_name = ability_name }
)
return
end
if EXCLUDED_ABILITIES_ALLBUTTER[ability_name] then
CustomGameEventManager:Send_ServerToPlayer(
PlayerResource:GetPlayer(player_id),
"talisman_cannot_store_EXCLUDED_ABILITIES_ALLBUTTER",
{ ability_name = ability_name }
)
return
end
local behavior = ability:GetBehavior()
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_CHANNELLED) ~= 0 then
CustomGameEventManager:Send_ServerToPlayer(
PlayerResource:GetPlayer(player_id),
"talisman_cannot_store_channelled",
{ ability_name = ability_name }
)
return
end
local behavior = ability:GetBehavior()
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_CHANNELLED) ~= 0 then
CustomGameEventManager:Send_ServerToPlayer(
PlayerResource:GetPlayer(player_id),
"talisman_cannot_store_channelled",
{ ability_name = ability_name }
)
return
end
local stored_data = {
ability_name = ability_name,
ability_level = ability:GetLevel(),
behavior = behavior
}
local talisman_item = caster:FindItemInInventory("item_skill_talisman")
if talisman_item then
talisman_item:SetStoredAbility(stored_data)
self:UpdateTrackerAbility(stored_data)
end
caster:AddNewModifier(caster, self:GetAbility(), "modifier_skill_talisman_display", {
ability_name = ability_name
})
end
function modifier_skill_talisman_tracker:UpdateTrackerAbility(stored_data)
if not stored_data or not stored_data.ability_name then return end
local caster = self:GetCaster()
if self.temp_ability and self.should_remove_ability and not caster:IsNull() then
caster:RemoveAbility(self.temp_ability:GetAbilityName())
end
local existing_ability = caster:FindAbilityByName(stored_data.ability_name)
if not existing_ability then
self.temp_ability = caster:AddAbility(stored_data.ability_name)
self.temp_ability:SetLevel(stored_data.ability_level or 1)
self.temp_ability:SetHidden(true)
self.temp_ability:SetStolen(true)
self.should_remove_ability = true
else
self.temp_ability = existing_ability
self.should_remove_ability = false
end
caster:RemoveModifierByName("modifier_skill_talisman_display")
caster:AddNewModifier(caster, self:GetAbility(), "modifier_skill_talisman_display", {
ability_name = stored_data.ability_name
})
end
modifier_skill_talisman_display = class({})
function modifier_skill_talisman_display:IsHidden()
return false
end
function modifier_skill_talisman_display:IsPurgable()
return false
end
function modifier_skill_talisman_display:RemoveOnDeath()
return false
end
function modifier_skill_talisman_display:OnCreated(params)
if IsServer() then
self.ability_name = params.ability_name
self:SetHasCustomTransmitterData(true)
end
end
function modifier_skill_talisman_display:AddCustomTransmitterData()
return {
ability_name = self.ability_name
}
end
function modifier_skill_talisman_display:HandleCustomTransmitterData(data)
self.ability_name = data.ability_name
end
function modifier_skill_talisman_display:GetTexture()
return self.ability_name or "item_ultimate_scepter"
end
