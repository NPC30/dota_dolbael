require("abilities/ability_blacklist_butterfly")
ButterflyItemTrigger = ButterflyItemTrigger or {}
local ITEM_SLOT_MIN = 0
local ITEM_SLOT_MAX = 2
local CACHE_REFRESH_INTERVAL = 5
EXCLUDED_TRIGGER_ITEMS_BUTTERFLY = EXCLUDED_TRIGGER_ITEMS_BUTTERFLY or {
["item_refresher"] = true,
["item_refresh_core"] = true,
["item_time_gem"] = true,
["item_force_staff_3"] = true,
["item_force_staff_2"] = true,
["item_force_staff"] = true,
["item_hurricane_pike_2"] = true,
["item_hurricane_pike"] = true,
["item_hawkeye_turret"] = true,
["item_wind_waker"] = true,
["item_switchable_crit_blade"] = true,
["item_magic_crit_blade"] = true,
["item_hand_of_group"] = true,
["item_hand_of_midas"] = true,
["item_tome_of_ability_reset"] = true,
["item_tome_of_ability_replace"] = true,
["item_treasure_chest"] = true,
}
ALLOWED_SHARED_BLACKLIST_ITEMS_BUTTERFLY = ALLOWED_SHARED_BLACKLIST_ITEMS_BUTTERFLY or {
["item_beast_shield"] = true,
["item_flight_bar"] = true,
["item_black_king_bar"] = true,
["item_black_king_bar_2"] = true,
}
ATTACK_OFFENSIVE_ALLOWED_MIXED_TARGET_ITEMS_BUTTERFLY = ATTACK_OFFENSIVE_ALLOWED_MIXED_TARGET_ITEMS_BUTTERFLY or {
["item_hurricane_pike_2"] = true,
}
local NO_SUPPORT_SUBSTRINGS = {
"ward",
"mango",
"tango",
"tpscroll",
}
function ButterflyItemTrigger.GetBehaviorValue(item)
local behavior = item:GetBehavior()
if type(behavior) ~= "number" then
behavior = tonumber(tostring(behavior))
end
return behavior
end
function ButterflyItemTrigger.GetTargetTeamValue(item)
local target_team = item:GetAbilityTargetTeam()
if type(target_team) ~= "number" then
target_team = tonumber(tostring(target_team))
end
return target_team
end
function ButterflyItemTrigger.IsSelfOrFriendlyTargetItem(item)
local behavior = ButterflyItemTrigger.GetBehaviorValue(item)
if not behavior then return false end
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) == 0 then return false end
local target_team = ButterflyItemTrigger.GetTargetTeamValue(item)
if not target_team then return false end
return bit.band(target_team, DOTA_UNIT_TARGET_TEAM_FRIENDLY) ~= 0
end
function ButterflyItemTrigger.IsAttackOffensiveAllowedMixedTargetItem(item_name, trigger_type)
return trigger_type == "attack_offensive"
and ATTACK_OFFENSIVE_ALLOWED_MIXED_TARGET_ITEMS_BUTTERFLY
and ATTACK_OFFENSIVE_ALLOWED_MIXED_TARGET_ITEMS_BUTTERFLY[item_name] == true
end
function ButterflyItemTrigger.IsValidPosition(position)
return position and position ~= Vector(0, 0, 0)
end
function ButterflyItemTrigger.GetExecutedAbilityPosition(ability)
if not ability or ability:IsNull() then return nil end
local behavior = ButterflyItemTrigger.GetBehaviorValue(ability)
if not behavior then return nil end
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 or
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 then
local position = ability:GetCursorPosition()
if ButterflyItemTrigger.IsValidPosition(position) then
return position
end
end
return nil
end
function ButterflyItemTrigger.RefreshKeyValues(modifier)
local ability = modifier:GetAbility()
if not ability then return end
local level = ability:GetLevel()
if level <= 0 then level = 1 end
if level == modifier._cached_item_trigger_level then return end
modifier._cached_item_trigger_level = level
modifier._cached_trigger_chance = ability:GetLevelSpecialValueFor("trigger_chance", level - 1)
modifier._cached_cooldown_duration = ability:GetLevelSpecialValueFor("cooldown_duration", level - 1)
end
function ButterflyItemTrigger.IsAllowedItem(item, trigger_type)
if not item or item:IsNull() then return false end
if item:IsPassive() then return false end
if item:IsHidden() then return false end
local item_name = item:GetAbilityName()
if not item_name or item_name == "" then return false end
if EXCLUDED_ITEMS and EXCLUDED_ITEMS[item_name] then
if not ALLOWED_SHARED_BLACKLIST_ITEMS_BUTTERFLY or not ALLOWED_SHARED_BLACKLIST_ITEMS_BUTTERFLY[item_name] then
return false
end
end
if EXCLUDED_TRIGGER_ITEMS_BUTTERFLY and EXCLUDED_TRIGGER_ITEMS_BUTTERFLY[item_name]
and not ButterflyItemTrigger.IsAttackOffensiveAllowedMixedTargetItem(item_name, trigger_type) then
return false
end
if trigger_type == "attack_offensive"
and ButterflyItemTrigger.IsSelfOrFriendlyTargetItem(item)
and not ButterflyItemTrigger.IsAttackOffensiveAllowedMixedTargetItem(item_name, trigger_type) then
return false
end
if item.butterfly_item_triggered then return false end
for _, text in pairs(NO_SUPPORT_SUBSTRINGS) do
if string.find(item_name, text, 1, true) then
return false
end
end
local behavior = ButterflyItemTrigger.GetBehaviorValue(item)
if not behavior then return false end
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_PASSIVE) ~= 0 then return false end
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_TOGGLE) ~= 0 then return false end
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_HIDDEN) ~= 0 then return false end
return bit.band(behavior, DOTA_ABILITY_BEHAVIOR_NO_TARGET) ~= 0
or bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0
or bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0
or bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0
end
function ButterflyItemTrigger.RefreshItemList(modifier)
local parent = modifier:GetParent()
modifier._cache_items = {}
if not parent or parent:IsNull() then return end
for slot = ITEM_SLOT_MIN, ITEM_SLOT_MAX do
local item = parent:GetItemInSlot(slot)
if ButterflyItemTrigger.IsAllowedItem(item, modifier._item_trigger_type) then
table.insert(modifier._cache_items, item)
end
end
modifier._cache_item_time = GameRules:GetGameTime()
end
function ButterflyItemTrigger.OnCreated(modifier)
if not IsServer() then return end
modifier._cache_items = {}
modifier._cache_item_time = 0
modifier._cached_item_trigger_level = -1
modifier._item_triggering = false
ButterflyItemTrigger.RefreshKeyValues(modifier)
ButterflyItemTrigger.RefreshItemList(modifier)
end
function ButterflyItemTrigger.GetItemList(modifier)
local now = GameRules:GetGameTime()
if not modifier._cache_items or now - (modifier._cache_item_time or 0) >= CACHE_REFRESH_INTERVAL then
ButterflyItemTrigger.RefreshItemList(modifier)
end
return modifier._cache_items or {}
end
function ButterflyItemTrigger.RestoreItemState(parent, item, original_mana, original_cooldown, original_charges, original_cast_point)
if item and not item:IsNull() then
item:EndCooldown()
if original_cooldown and original_cooldown > 0 then
item:StartCooldown(original_cooldown)
end
if original_charges ~= nil and item.SetCurrentAbilityCharges then
item:SetCurrentAbilityCharges(original_charges)
end
if original_cast_point ~= nil and item.SetOverrideCastPoint then
item:SetOverrideCastPoint(original_cast_point)
end
item.butterfly_item_triggered = nil
end
if parent and not parent:IsNull() and original_mana ~= nil then
parent:SetMana(original_mana)
end
end
function ButterflyItemTrigger.ClearTriggeringState(modifier)
if modifier and not modifier:IsNull() then
modifier._item_triggering = false
end
end
function ButterflyItemTrigger.FindEnemyTarget(parent, source_position, item)
if not parent or parent:IsNull() or not item or item:IsNull() then return nil end
local search_origin = source_position
if not ButterflyItemTrigger.IsValidPosition(search_origin) then
search_origin = parent:GetAbsOrigin()
end
local search_range = item:GetCastRange(parent:GetAbsOrigin(), nil)
if not search_range or search_range <= 0 then
search_range = 1200
end
local target_type = item:GetAbilityTargetType()
if type(target_type) ~= "number" then
target_type = tonumber(tostring(target_type))
end
if not target_type or target_type == 0 then
target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end
local enemies = FindUnitsInRadius(
parent:GetTeamNumber(),
search_origin,
nil,
search_range,
DOTA_UNIT_TARGET_TEAM_ENEMY,
target_type,
DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS,
FIND_CLOSEST,
false
)
if #enemies > 0 then
return enemies[1]
end
return nil
end
function ButterflyItemTrigger.GetFallbackPosition(parent, source, item, source_position)
if source and not source:IsNull() and source:IsAlive() then
return source:GetAbsOrigin()
end
if ButterflyItemTrigger.IsValidPosition(source_position) then
return source_position
end
local cast_range = item:GetCastRange(parent:GetAbsOrigin(), nil)
if not cast_range or cast_range <= 0 then
cast_range = 600
end
return parent:GetAbsOrigin() + parent:GetForwardVector() * cast_range
end
function ButterflyItemTrigger.SelectTarget(parent, source, item, source_position, trigger_type)
local behavior = item:GetBehavior()
if type(behavior) ~= "number" then
behavior = tonumber(tostring(behavior))
end
local item_name = item:GetAbilityName()
local target_team = item:GetAbilityTargetTeam()
local cast_target = nil
local target_position = nil
target_position = ButterflyItemTrigger.GetFallbackPosition(parent, source, item, source_position)
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
if ButterflyItemTrigger.IsAttackOffensiveAllowedMixedTargetItem(item_name, trigger_type)
and source and not source:IsNull() and source:IsAlive()
and source:GetTeamNumber() ~= parent:GetTeamNumber() then
cast_target = source
target_position = source:GetAbsOrigin()
elseif bit.band(target_team, DOTA_UNIT_TARGET_TEAM_FRIENDLY) ~= 0 then
cast_target = parent
target_position = parent:GetAbsOrigin()
elseif bit.band(target_team, DOTA_UNIT_TARGET_TEAM_ENEMY) ~= 0 then
if source and not source:IsNull() and source:IsAlive() and source:GetTeamNumber() ~= parent:GetTeamNumber() then
cast_target = source
target_position = source:GetAbsOrigin()
else
cast_target = ButterflyItemTrigger.FindEnemyTarget(parent, source_position, item)
if cast_target then
target_position = cast_target:GetAbsOrigin()
else
return nil, nil
end
end
else
if source and not source:IsNull() and source:IsAlive() then
cast_target = source
else
cast_target = ButterflyItemTrigger.FindEnemyTarget(parent, source_position, item) or parent
target_position = cast_target:GetAbsOrigin()
end
end
end
return cast_target, target_position
end
function ButterflyItemTrigger.CastItem(parent, item, source, source_position, trigger_type)
if not parent or parent:IsNull() or not item or item:IsNull() then return false end
local original_mana = parent:GetMana()
local original_cooldown = item:GetCooldownTimeRemaining() or 0
local original_cast_point = item:GetCastPoint()
local original_charges = nil
local level = item:GetLevel()
if level <= 0 then level = 1 end
if item.GetMaxAbilityCharges and item:GetMaxAbilityCharges(level) > 0 and item.GetCurrentAbilityCharges then
original_charges = item:GetCurrentAbilityCharges()
end
local ok, result = pcall(function()
item.butterfly_item_triggered = true
item:EndCooldown()
item:SetOverrideCastPoint(0)
local mana_cost = item:GetManaCost(level - 1)
if parent:GetMana() < mana_cost then
parent:GiveMana(mana_cost - parent:GetMana())
end
local behavior = item:GetBehavior()
if type(behavior) ~= "number" then
behavior = tonumber(tostring(behavior))
end
local cast_target, target_position = ButterflyItemTrigger.SelectTarget(parent, source, item, source_position, trigger_type)
local success = false
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_NO_TARGET) ~= 0 then
success = parent:CastAbilityNoTarget(item, parent:GetPlayerOwnerID())
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
if not cast_target or cast_target:IsNull() then
ButterflyItemTrigger.RestoreItemState(parent, item, original_mana, original_cooldown, original_charges, original_cast_point)
return false
end
parent:SetCursorCastTarget(cast_target)
success = item:CastAbility()
parent:SetCursorCastTarget(nil)
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 or bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 then
parent:SetCursorPosition(target_position or parent:GetAbsOrigin())
success = item:CastAbility()
end
Timers:CreateTimer(0.03, function()
ButterflyItemTrigger.RestoreItemState(parent, item, original_mana, original_cooldown, original_charges, original_cast_point)
return nil
end)
return success
end)
if not ok then
print("[ButterflyItemTrigger] CastItem failed: " .. tostring(result))
ButterflyItemTrigger.RestoreItemState(parent, item, original_mana, original_cooldown, original_charges, original_cast_point)
parent:SetCursorCastTarget(nil)
return false
end
return result
end
function ButterflyItemTrigger.TryTriggerItem(modifier, source, randomSeed, trigger_type, source_position)
if not IsServer() then return end
local parent = modifier:GetParent()
if not parent or parent:IsNull() or not parent:IsAlive() then return end
if parent:IsIllusion() then return end
if modifier._item_triggering then return end
if parent:HasModifier("modifier_trigger_item_cooldown") then return end
modifier._item_trigger_type = trigger_type
ButterflyItemTrigger.RefreshKeyValues(modifier)
local chance = modifier._cached_trigger_chance or 0
if chance <= 0 then return end
if not RollPseudoRandomPercentage(chance, randomSeed or DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, parent) then return end
local items = ButterflyItemTrigger.GetItemList(modifier)
if #items == 0 then return end
local item = items[RandomInt(1, #items)]
if not ButterflyItemTrigger.IsAllowedItem(item, trigger_type) then
ButterflyItemTrigger.RefreshItemList(modifier)
items = modifier._cache_items or {}
if #items == 0 then return end
item = items[RandomInt(1, #items)]
end
if not ButterflyItemTrigger.IsAllowedItem(item, trigger_type) then return end
modifier._item_triggering = true
local cooldown_duration = modifier._cached_cooldown_duration or 0.3
if cooldown_duration > 0 then
parent:AddNewModifier(parent, modifier:GetAbility(), "modifier_trigger_item_cooldown", { duration = cooldown_duration })
end
local ok, err = pcall(function()
ButterflyItemTrigger.CastItem(parent, item, source, source_position, trigger_type)
end)
if not ok then
print("[ButterflyItemTrigger] TryTriggerItem failed: " .. tostring(err))
end
Timers:CreateTimer(0.1, function()
ButterflyItemTrigger.ClearTriggeringState(modifier)
return nil
end)
end
modifier_trigger_item_cooldown = class({})
function modifier_trigger_item_cooldown:IsHidden() return true end
function modifier_trigger_item_cooldown:IsPurgable() return false end
function modifier_trigger_item_cooldown:RemoveOnDeath() return false end
