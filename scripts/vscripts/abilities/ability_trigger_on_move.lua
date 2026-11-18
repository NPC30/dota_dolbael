require("abilities/ability_blacklist_butterfly")
ability_trigger_on_move = class({})
LinkLuaModifier("modifier_trigger_on_move", "abilities/ability_trigger_on_move", LUA_MODIFIER_MOTION_NONE)
function ability_trigger_on_move:GetIntrinsicModifierName()
return "modifier_trigger_on_move"
end
function ability_trigger_on_move:OnUpgrade()
if not IsServer() then return end
local caster = self:GetCaster()
local modifier = caster:FindModifierByName("modifier_trigger_on_move")
if modifier then
modifier:RefreshKeyValues()
end
end
local CACHE_REFRESH_INTERVAL = 5
modifier_trigger_on_move = class({})
function modifier_trigger_on_move:IsHidden()
return true
end
function modifier_trigger_on_move:IsPermanent()
return true
end
function modifier_trigger_on_move:RemoveOnDeath()
return false
end
function modifier_trigger_on_move:IsPurgable()
return false
end
function modifier_trigger_on_move:RefreshSkillList()
local parent = self:GetParent()
self._cache_ultimate = {}
self._cache_basic = {}
local self_ability = self:GetAbility()
for i = 0, parent:GetAbilityCount() - 1 do
local ability = parent:GetAbilityByIndex(i)
if ability and ability:GetLevel() > 0
and not ability:IsPassive()
and not ability:IsHidden()
and ability ~= self_ability
and not ability:IsItem()
and not EXCLUDED_ABILITIES_ALLBUTTER[ability:GetAbilityName()] then
if ability:GetAbilityType() == ABILITY_TYPE_ULTIMATE then
table.insert(self._cache_ultimate, ability)
else
table.insert(self._cache_basic, ability)
end
end
end
end
function modifier_trigger_on_move:RefreshKeyValues()
local passive_level = self:GetAbility():GetLevel()
if passive_level <= 0 then passive_level = 1 end
if passive_level == self._cached_passive_level then return end
self._cached_passive_level = passive_level
self._cached_basic_chance = self:GetAbility():GetLevelSpecialValueFor("basic_trigger_chance", passive_level - 1)
self._cached_ultimate_chance = self:GetAbility():GetLevelSpecialValueFor("ultimate_trigger_chance", passive_level - 1)
end
function modifier_trigger_on_move:OnCreated()
if not IsServer() then return end
self.last_position = self:GetParent():GetAbsOrigin()
self.check_interval = self:GetAbility():GetSpecialValueFor("check_interval") or 0.5
self.base_distance = 100
self._cache_ultimate = {}
self._cache_basic = {}
self._cache_time = GameRules:GetGameTime()
self._cached_passive_level = -1
self:RefreshSkillList()
self:RefreshKeyValues()
self:StartIntervalThink(self.check_interval)
end
function modifier_trigger_on_move:OnIntervalThink()
if not IsServer() then return end
local parent = self:GetParent()
if not parent or parent:IsNull() or not parent:IsAlive() then return end
if parent:IsIllusion() then return end
local current_position = parent:GetAbsOrigin()
local distance = (current_position - self.last_position):Length2D()
self.last_position = current_position
if distance < 10 then return end
local distance_multiplier = distance / self.base_distance
self:TriggerRandomAbility(distance_multiplier)
end
function modifier_trigger_on_move:TriggerRandomAbility(distance_multiplier)
local parent = self:GetParent()
local basic_trigger_chance = self._cached_basic_chance
local ultimate_trigger_chance = self._cached_ultimate_chance
local adjusted_basic_chance = math.min(basic_trigger_chance * distance_multiplier, 100)
local adjusted_ultimate_chance = math.min(ultimate_trigger_chance * distance_multiplier, 100)
local now = GameRules:GetGameTime()
if now - (self._cache_time or 0) >= CACHE_REFRESH_INTERVAL then
self:RefreshSkillList()
self._cache_time = now
end
local ultimate_abilities = self._cache_ultimate
local basic_abilities = self._cache_basic
if #ultimate_abilities == 0 and #basic_abilities == 0 then return end
local trigger_ultimate = RollPseudoRandomPercentage(adjusted_ultimate_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_5,
parent)
local trigger_basic = RollPseudoRandomPercentage(adjusted_basic_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_6, parent)
if not trigger_ultimate and not trigger_basic then return end
local random_ability = nil
if trigger_ultimate and #ultimate_abilities > 0 then
random_ability = ultimate_abilities[RandomInt(1, #ultimate_abilities)]
elseif trigger_basic and #basic_abilities > 0 then
random_ability = basic_abilities[RandomInt(1, #basic_abilities)]
end
if not random_ability then return end
if parent:IsChanneling() then
return
end
local ability_name = random_ability:GetAbilityName()
local remaining_cooldown = random_ability:GetCooldownTimeRemaining() or 0
local current_mana = parent:GetMana()
local mana_cost = random_ability:GetManaCost(random_ability:GetLevel() - 1)
local original_cast_point = random_ability:GetCastPoint()
local has_charges = random_ability:GetMaxAbilityCharges(random_ability:GetLevel()) > 0
local current_charges = 0
if has_charges then
current_charges = random_ability:GetCurrentAbilityCharges()
else
end
random_ability:EndCooldown()
random_ability:SetOverrideCastPoint(0)
if current_mana < mana_cost then
parent:GiveMana(mana_cost - current_mana)
end
local behavior = random_ability:GetBehavior()
if type(behavior) ~= "number" then
behavior = tonumber(tostring(behavior))
end
local target_team = random_ability:GetAbilityTargetTeam()
local cast_target = nil
local target_position = nil
if ability_name == "invoker_sun_strike" then
cast_target = parent
end
local cast_success = false
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_NO_TARGET) ~= 0 and
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) == 0 and
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) == 0 then
cast_success = parent:CastAbilityImmediately(random_ability, parent:GetPlayerOwnerID())
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
if bit.band(target_team, DOTA_UNIT_TARGET_TEAM_FRIENDLY) ~= 0 then
cast_target = parent
target_position = parent:GetAbsOrigin()
else
local cast_range = random_ability:GetCastRange(parent:GetAbsOrigin(), nil)
if cast_range <= 300 then cast_range = 300 end
if cast_range >= 2000 then cast_range = 2000 end
local search_radius = cast_range
local enemies = FindUnitsInRadius(
parent:GetTeamNumber(),
parent:GetAbsOrigin(),
nil,
search_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS,
FIND_CLOSEST,
false
)
if #enemies > 0 then
cast_target = enemies[1]
target_position = cast_target:GetAbsOrigin()
else
random_ability:EndCooldown()
random_ability:StartCooldown(remaining_cooldown)
return
end
end
if cast_target and not cast_target:IsNull() then
parent:SetCursorCastTarget(cast_target)
cast_success = parent:CastAbilityImmediately(random_ability, parent:GetPlayerOwnerID())
parent:SetCursorCastTarget(nil)
elseif target_position and bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 then
parent:SetCursorPosition(target_position)
cast_success = parent:CastAbilityImmediately(random_ability, parent:GetPlayerOwnerID())
end
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 or
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 then
local cast_range = random_ability:GetCastRange(parent:GetAbsOrigin(), nil)
if cast_range <= 300 then cast_range = 300 end
if cast_range >= 2000 then cast_range = 2000 end
local search_radius = cast_range
local enemies = FindUnitsInRadius(
parent:GetTeamNumber(),
parent:GetAbsOrigin(),
nil,
search_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS,
FIND_CLOSEST,
false
)
if #enemies > 0 then
cast_target = enemies[1]
target_position = cast_target:GetAbsOrigin()
else
local forward = parent:GetForwardVector()
target_position = parent:GetAbsOrigin() + forward * cast_range
end
if target_position then
parent:SetCursorPosition(target_position)
cast_success = parent:CastAbilityImmediately(random_ability, parent:GetPlayerOwnerID())
else
parent:SetCursorCastTarget(cast_target)
cast_success = parent:CastAbilityImmediately(random_ability, parent:GetPlayerOwnerID())
parent:SetCursorCastTarget(nil)
end
else
parent:SetCursorCastTarget(cast_target)
parent:SetCursorPosition(target_position)
cast_success = parent:CastAbilityImmediately(random_ability, parent:GetPlayerOwnerID())
parent:SetCursorCastTarget(nil)
end
local mana_before_restore = parent:GetMana()
parent:SetMana(current_mana)
local mana_after_restore = parent:GetMana()
random_ability:SetOverrideCastPoint(original_cast_point)
local restore_delay = 0.05
if ability_name == "juggernaut_omni_slash" then
restore_delay = 4.0
end
random_ability:SetContextThink("restore_cooldown_" .. random_ability:GetEntityIndex(), function()
if not random_ability or random_ability:IsNull() then
return nil
end
if has_charges then
if random_ability:IsItem() then
random_ability:SetCurrentCharges(current_charges)
else
random_ability:SetCurrentAbilityCharges(current_charges)
end
else
if remaining_cooldown and remaining_cooldown > 0 then
random_ability:EndCooldown()
random_ability:StartCooldown(remaining_cooldown)
local actual_cd = random_ability:GetCooldownTimeRemaining()
else
random_ability:EndCooldown()
end
end
return nil
end, restore_delay)
end
