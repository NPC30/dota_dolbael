require("abilities/ability_blacklist_butterfly")
ability_trigger_on_cast = class({})
LinkLuaModifier("modifier_trigger_on_cast", "abilities/ability_trigger_on_cast", LUA_MODIFIER_MOTION_NONE)
local EXCLUDED_IN_ABILITIES = {
["winter_wyvern_arctic_burn"] = true,
["medusa_split_shot"] = true,
["drow_ranger_frost_arrows"] = true,
["clinkz_searing_arrows"] = true,
["obsidian_destroyer_arcane_orb"] = true,
["enchantress_impetus"] = true,
["huskar_burning_spear"] = true,
["jakiro_liquid_fire"] = true,
["rubick_null_field"] = true,
["jakiro_liquid_frost"] = true,
["silencer_glaives_of_wisdom"] = true,
["viper_poison_attack"] = true,
["witch_doctor_voodoo_restoration"] = true,
["bloodseeker_blood_mist2"] = true,
["brewmaster_drunken_boxing"] = true,
["morphling_morph_str"] = true,
["kez_switch_weapons"] = true,
["ancient_apparition_chilling_touch"] = true,
["morphling_morph_agi"] = true,
["invoker_invoke"] = true,
["invoker_quas"] = true,
["invoker_wex"] = true,
["invoker_exort"] = true,
["zuus_lightning_hands"] = true,
["warlock_fatal_bonds"] = true,
["mars_bulwark"] = true,
["troll_warlord_switch_stance"] = true,
["muerta_gunslinger"] = true,
}
function ability_trigger_on_cast:GetIntrinsicModifierName()
return "modifier_trigger_on_cast"
end
function ability_trigger_on_cast:OnUpgrade()
if not IsServer() then return end
local caster = self:GetCaster()
local modifier = caster:FindModifierByName("modifier_trigger_on_cast")
if modifier then
modifier:RefreshKeyValues()
end
end
local CACHE_REFRESH_INTERVAL = 5
modifier_trigger_on_cast = class({})
function modifier_trigger_on_cast:IsHidden()
return true
end
function modifier_trigger_on_cast:IsPermanent()
return true
end
function modifier_trigger_on_cast:RemoveOnDeath()
return false
end
function modifier_trigger_on_cast:IsPurgable()
return false
end
function modifier_trigger_on_cast:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED
}
end
function modifier_trigger_on_cast:RefreshSkillList()
local parent = self:GetParent()
self._cache_ultimate = {}
self._cache_basic = {}
local self_ability = self:GetAbility()
for i = 0, parent:GetAbilityCount() - 1 do
local ability = parent:GetAbilityByIndex(i)
if ability and ability:GetLevel() > 0
and not ability:IsPassive()
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
function modifier_trigger_on_cast:RefreshKeyValues()
local passive_level = self:GetAbility():GetLevel()
if passive_level <= 0 then passive_level = 1 end
if passive_level == self._cached_passive_level then return end
self._cached_passive_level = passive_level
self._cached_basic_chance = self:GetAbility():GetLevelSpecialValueFor("basic_trigger_chance", passive_level - 1)
self._cached_ultimate_chance = self:GetAbility():GetLevelSpecialValueFor("ultimate_trigger_chance", passive_level - 1)
end
function modifier_trigger_on_cast:OnCreated()
if not IsServer() then return end
self._cache_ultimate = {}
self._cache_basic = {}
self._cache_time = GameRules:GetGameTime()
self._cached_passive_level = -1
self:RefreshSkillList()
self:RefreshKeyValues()
end
function modifier_trigger_on_cast:OnAbilityExecuted(params)
if not IsServer() then return end
local caster = params.unit
local parent = self:GetParent()
local executed_ability = params.ability
if caster ~= parent then return end
if parent:IsIllusion() then return end
if self.global_cooldown then return end
if executed_ability.multicast and executed_ability.multicast > 1 then
return
elseif executed_ability.upgrade_triggered and executed_ability.upgrade_triggered > 1 then
return
end
if caster:IsChanneling() then
return
end
if executed_ability:IsItem() then return end
if executed_ability:IsPassive() then return end
if executed_ability:IsHidden() then return end
if (IsAbilityExcludedForButterflyOnCast and IsAbilityExcludedForButterflyOnCast(executed_ability:GetAbilityName()))
or EXCLUDED_IN_ABILITIES[executed_ability:GetAbilityName()] then
return
end
self.global_cooldown = true
Timers:CreateTimer(0.5, function()
self.global_cooldown = nil
end)
local behavior = executed_ability:GetBehavior()
if type(behavior) ~= "number" then
behavior = tonumber(tostring(behavior))
end
local is_channeled = bit.band(behavior, DOTA_ABILITY_BEHAVIOR_CHANNELLED) ~= 0
local delay = 0.2
if is_channeled then
delay = executed_ability:GetChannelTime() + 0.2
end
Timers:CreateTimer(delay, function()
self:TriggerRandomAbility(params)
end)
end
function modifier_trigger_on_cast:TriggerRandomAbility(params)
local caster = params.unit
local parent = self:GetParent()
local executed_ability = params.ability
if executed_ability then
executed_ability.butterfly_triggered = true
end
if not self.trigger_depth then
self.trigger_depth = 0
end
if self.trigger_depth >= 8 then
return
end
local basic_trigger_chance = self._cached_basic_chance
local ultimate_trigger_chance = self._cached_ultimate_chance
local now = GameRules:GetGameTime()
if now - (self._cache_time or 0) >= CACHE_REFRESH_INTERVAL then
self:RefreshSkillList()
self._cache_time = now
end
local ultimate_abilities = self._cache_ultimate
local basic_abilities = self._cache_basic
if #ultimate_abilities == 0 and #basic_abilities == 0 then
self.trigger_depth = self.trigger_depth - 1
return
end
local trigger_ultimate = RollPseudoRandomPercentage(ultimate_trigger_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_3, parent)
local trigger_basic = RollPseudoRandomPercentage(basic_trigger_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_4, parent)
if not trigger_ultimate and not trigger_basic then return end
self.trigger_depth = self.trigger_depth + 1
local random_ability = nil
if trigger_ultimate and #ultimate_abilities > 0 then
random_ability = ultimate_abilities[RandomInt(1, #ultimate_abilities)]
elseif trigger_basic and #basic_abilities > 0 then
random_ability = basic_abilities[RandomInt(1, #basic_abilities)]
end
if not random_ability then
self.trigger_depth = self.trigger_depth - 1
return
end
local remaining_cooldown = random_ability:GetCooldownTimeRemaining() or 0
local has_charges = random_ability:GetMaxAbilityCharges(random_ability:GetLevel()) > 0
local current_charges = 0
local was_ready = (remaining_cooldown <= 0)
if has_charges then
current_charges = random_ability:GetCurrentAbilityCharges()
end
local original_target = params.target
local original_position = nil
if params.ability then
local ability_behavior = params.ability:GetBehavior()
if type(ability_behavior) ~= "number" then
ability_behavior = tonumber(tostring(ability_behavior))
end
if bit.band(ability_behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 or
bit.band(ability_behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 then
original_position = params.ability:GetCursorPosition()
end
end
if not original_position or original_position == Vector(0, 0, 0) then
local player_id = caster:GetPlayerOwnerID()
if player_id and player_id >= 0 then
if original_target and not original_target:IsNull() then
original_position = original_target:GetAbsOrigin()
else
local cast_range = random_ability:GetCastRange(caster:GetAbsOrigin(), nil)
if cast_range <= 0 then
cast_range = 600
end
local forward = caster:GetForwardVector()
original_position = caster:GetAbsOrigin() + forward * cast_range
end
else
original_position = caster:GetAbsOrigin()
end
end
Timers:CreateTimer(0.5, function()
if not caster or caster:IsNull() then
self.trigger_depth = self.trigger_depth - 1
return
end
if not random_ability or random_ability:IsNull() then
self.trigger_depth = self.trigger_depth - 1
return
end
if random_ability then
random_ability.butterfly_triggered = true
end
local cast_point = random_ability:GetCastPoint()
random_ability:SetOverrideCastPoint(0)
random_ability:EndCooldown()
if caster:IsStunned() or caster:IsSilenced() then
self.trigger_depth = self.trigger_depth - 1
random_ability:EndCooldown()
random_ability:StartCooldown(remaining_cooldown)
return
end
local behavior = random_ability:GetBehavior()
if type(behavior) ~= "number" then
behavior = tonumber(tostring(behavior))
end
local target_team = random_ability:GetAbilityTargetTeam()
local cast_target = nil
local target_position = nil
if bit.band(target_team, DOTA_UNIT_TARGET_TEAM_FRIENDLY) ~= 0 then
cast_target = caster
target_position = caster:GetAbsOrigin()
elseif bit.band(target_team, DOTA_UNIT_TARGET_TEAM_ENEMY) ~= 0 then
if original_target and not original_target:IsNull() and original_target:IsAlive()
and original_target:GetTeamNumber() ~= caster:GetTeamNumber() then
cast_target = original_target
target_position = original_target:GetAbsOrigin()
else
local search_radius = 1200
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
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
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 or
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 then
target_position = original_position or caster:GetAbsOrigin()
else
if ability_name == "invoker_sun_strike" then
else
self.trigger_depth = self.trigger_depth - 1
random_ability:EndCooldown()
random_ability:StartCooldown(remaining_cooldown)
return
end
end
end
elseif bit.band(target_team, DOTA_UNIT_TARGET_TEAM_BOTH) ~= 0 then
if original_target and not original_target:IsNull() and original_target:IsAlive() then
cast_target = original_target
target_position = original_target:GetAbsOrigin()
else
cast_target = nil
target_position = original_position
end
else
target_position = original_position or caster:GetAbsOrigin()
end
local cast_success = false
local ability_name = random_ability:GetAbilityName()
if ability_name == "invoker_sun_strike" then
target_position = nil
cast_target = caster
end
if caster:IsChanneling() then
self.trigger_depth = self.trigger_depth - 1
return
end
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_NO_TARGET) ~= 0 and
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) == 0 and
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) == 0 then
cast_success = caster:CastAbilityImmediately(random_ability, caster:GetPlayerOwnerID())
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
if cast_target and not cast_target:IsNull() then
caster:SetCursorCastTarget(cast_target)
cast_success = caster:CastAbilityImmediately(random_ability, caster:GetPlayerOwnerID())
caster:SetCursorCastTarget(nil)
elseif target_position and bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 then
caster:SetCursorPosition(target_position)
cast_success = caster:CastAbilityImmediately(random_ability, caster:GetPlayerOwnerID())
end
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 or
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 then
if target_position then
caster:SetCursorPosition(target_position)
cast_success = caster:CastAbilityImmediately(random_ability, caster:GetPlayerOwnerID())
else
caster:SetCursorCastTarget(cast_target)
cast_success = caster:CastAbilityImmediately(random_ability, caster:GetPlayerOwnerID())
caster:SetCursorCastTarget(nil)
end
end
if cast_success then
caster:GiveMana(random_ability:GetManaCost(random_ability:GetLevel() - 1))
end
random_ability:SetOverrideCastPoint(cast_point)
local restore_delay = FrameTime()
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
else
random_ability:EndCooldown()
end
end
if random_ability then
random_ability.butterfly_triggered = nil
end
self.trigger_depth = self.trigger_depth - 1
return nil
end, restore_delay)
end)
Timers:CreateTimer(0.5, function()
if executed_ability then
executed_ability.butterfly_triggered = nil
end
end)
end
