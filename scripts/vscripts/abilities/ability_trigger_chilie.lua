require("abilities/ability_blacklist_butterfly")
ability_trigger_chilie = class({})
LinkLuaModifier("modifier_ability_trigger_chilie", "abilities/ability_trigger_chilie", LUA_MODIFIER_MOTION_NONE)
local CACHE_REFRESH_INTERVAL = 5
local CHILIE_EXCLUDED_ABILITIES = {
["item_forbidden_staff"] = true,
["item_forbidden_blade"] = true,
["item_one_sword"] = true,
}
local CHILIE_ENEMY_ONLY_TARGET_ABILITIES = {
["doom_bringer_doom"] = true,
}
function ability_trigger_chilie:GetIntrinsicModifierName()
return "modifier_ability_trigger_chilie"
end
function ability_trigger_chilie:Precache(context)
PrecacheResource("particle", "particles/econ/items/ogre_magi/ogre_magi_jackpot/ogre_magi_jackpot_multicast.vpcf",
context)
end
function ability_trigger_chilie:OnUpgrade()
if not IsServer() then return end
local caster = self:GetCaster()
local modifier = caster:FindModifierByName("modifier_ability_trigger_chilie")
if modifier then
modifier:RefreshKeyValues()
end
end
modifier_ability_trigger_chilie = class({})
function modifier_ability_trigger_chilie:IsHidden() return true end
function modifier_ability_trigger_chilie:IsPermanent() return true end
function modifier_ability_trigger_chilie:RemoveOnDeath() return false end
function modifier_ability_trigger_chilie:IsPurgable() return false end
function modifier_ability_trigger_chilie:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED
}
end
function modifier_ability_trigger_chilie:OnCreated()
if not IsServer() then return end
self._cached_level = -1
self._cache_time = GameRules:GetGameTime()
self:RefreshKeyValues()
end
function modifier_ability_trigger_chilie:RefreshKeyValues()
local ability = self:GetAbility()
local level = ability:GetLevel()
if level <= 0 then level = 1 end
if level == self._cached_level then return end
self._cached_level = level
self._cached_delay = ability:GetSpecialValueFor("multicast_delay")
self._cached_search_radius = ability:GetSpecialValueFor("search_radius")
self._cached_multicast_2 = ability:GetLevelSpecialValueFor("multicast_2_times", level - 1)
self._cached_multicast_3 = ability:GetLevelSpecialValueFor("multicast_3_times", level - 1)
self._cached_multicast_4 = ability:GetLevelSpecialValueFor("multicast_4_times", level - 1)
self._cached_multicast_5 = ability:GetLevelSpecialValueFor("multicast_5_times", level - 1)
end
function modifier_ability_trigger_chilie:IsSupportedAbility(ability)
if not ability or ability:IsNull() then return false end
if ability == self:GetAbility() then return false end
if ability:IsPassive() then return false end
if not ability:IsItem() and ability:IsHidden() then return false end
local ability_name = ability:GetAbilityName()
if CHILIE_EXCLUDED_ABILITIES[ability_name] then return false end
if EXCLUDED_ABILITIES_ALLBUTTER[ability_name] then return false end
if ability.upgrade_triggered then return false end
local behavior = ability:GetBehavior()
if type(behavior) ~= "number" then
behavior = tonumber(tostring(behavior))
end
if not behavior then return false end
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_CHANNELLED) ~= 0 then return false end
return bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0
or bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0
or bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0
end
function modifier_ability_trigger_chilie:GetCastCount()
local random_int = RandomInt(1, 100)
local chance_5 = self._cached_multicast_5 or 0
local chance_4 = chance_5 + (self._cached_multicast_4 or 0)
local chance_3 = chance_4 + (self._cached_multicast_3 or 0)
local chance_2 = chance_3 + (self._cached_multicast_2 or 0)
if random_int <= chance_5 then
return 5
elseif random_int <= chance_4 then
return 4
elseif random_int <= chance_3 then
return 3
elseif random_int <= chance_2 then
return 2
end
return 1
end
function modifier_ability_trigger_chilie:ShowMulticastFx(cast_count)
local parent = self:GetParent()
if cast_count <= 1 then return end
if cast_count == 2 then
EmitSoundOn("Hero_OgreMagi.Fireblast.x1", parent)
elseif cast_count == 3 then
EmitSoundOn("Hero_OgreMagi.Fireblast.x2", parent)
else
EmitSoundOn("Hero_OgreMagi.Fireblast.x3", parent)
end
local particle = ParticleManager:CreateParticle(
"particles/econ/items/ogre_magi/ogre_magi_jackpot/ogre_magi_jackpot_multicast.vpcf",
PATTACH_OVERHEAD_FOLLOW,
parent
)
ParticleManager:SetParticleControl(particle, 1, Vector(cast_count, 1, 1))
ParticleManager:ReleaseParticleIndex(particle)
end
function modifier_ability_trigger_chilie:GetOrigin(params, ability, caster)
local target = params.target
if target and not target:IsNull() then
return target:GetAbsOrigin()
end
local position = ability:GetCursorPosition()
if position and position ~= Vector(0, 0, 0) then
return position
end
return caster:GetAbsOrigin()
end
function modifier_ability_trigger_chilie:GetTargetTeam(ability)
if CHILIE_ENEMY_ONLY_TARGET_ABILITIES[ability:GetAbilityName()] then
return DOTA_UNIT_TARGET_TEAM_ENEMY
end
return ability:GetAbilityTargetTeam()
end
function modifier_ability_trigger_chilie:IsTargetAllowed(ability, caster, target, target_team)
if not target or target:IsNull() or not target:IsAlive() then return false end
if CHILIE_ENEMY_ONLY_TARGET_ABILITIES[ability:GetAbilityName()]
and target:GetTeamNumber() == caster:GetTeamNumber() then
return false
end
if bit.band(target_team, DOTA_UNIT_TARGET_TEAM_ENEMY) ~= 0
and target:GetTeamNumber() ~= caster:GetTeamNumber() then
return true
end
if bit.band(target_team, DOTA_UNIT_TARGET_TEAM_FRIENDLY) ~= 0
and target:GetTeamNumber() == caster:GetTeamNumber() then
return true
end
return false
end
function modifier_ability_trigger_chilie:FindTarget(ability, caster, origin)
local radius = self._cached_search_radius or 1200
local cast_range = ability:GetCastRange(caster:GetAbsOrigin(), nil) or 0
if cast_range > radius then
radius = cast_range
end
local target_team = self:GetTargetTeam(ability)
local target_type = ability:GetAbilityTargetType()
local target_flags = ability:GetAbilityTargetFlags() + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS
local units = FindUnitsInRadius(
caster:GetTeamNumber(),
origin,
nil,
radius,
target_team,
target_type,
target_flags,
FIND_ANY_ORDER,
false
)
if #units <= 0 and origin ~= caster:GetAbsOrigin() then
units = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
radius,
target_team,
target_type,
target_flags,
FIND_ANY_ORDER,
false
)
end
if #units <= 0 then return nil end
return units[RandomInt(1, #units)]
end
function modifier_ability_trigger_chilie:OnAbilityExecuted(params)
if not IsServer() then return end
local caster = params.unit
local parent = self:GetParent()
local ability = params.ability
if caster ~= parent then return end
if parent:IsIllusion() then return end
if parent:IsChanneling() then return end
if not self:IsSupportedAbility(ability) then return end
local now = GameRules:GetGameTime()
if now - (self._cache_time or 0) >= CACHE_REFRESH_INTERVAL then
self:RefreshKeyValues()
self._cache_time = now
end
local cast_count = self:GetCastCount()
if cast_count <= 1 then return end
self:ShowMulticastFx(cast_count)
self:StartDelayedCasts(params, cast_count)
end
function modifier_ability_trigger_chilie:StartDelayedCasts(params, cast_count)
local caster = self:GetParent()
local ability = params.ability
local behavior = ability:GetBehavior()
if type(behavior) ~= "number" then
behavior = tonumber(tostring(behavior))
end
local origin = self:GetOrigin(params, ability, caster)
local remaining_cooldown = ability:GetCooldownTimeRemaining() or 0
local current_mana = caster:GetMana()
local fallback_target = params.target
local original_cast_point = ability:GetCastPoint()
local has_charges = ability:GetMaxAbilityCharges(ability:GetLevel()) > 0
local current_charges = 0
if has_charges then
if ability:IsItem() then
current_charges = ability:GetCurrentCharges()
else
current_charges = ability:GetCurrentAbilityCharges()
end
end
ability.chilie_allow_lina_upgrade_once = true
ability.chilie_trigger_active = true
ability.upgrade_triggered = cast_count
ability:SetOverrideCastPoint(0)
local casts_done = 1
local delay = self._cached_delay or 0.1
ability:SetContextThink("think_ability_trigger_chilie_" .. ability:GetEntityIndex(), function()
ability.chilie_allow_lina_upgrade_once = nil
if not caster or caster:IsNull() or not caster:IsAlive() then
self:RestoreAbilityState(ability, caster, remaining_cooldown, current_mana, original_cast_point, has_charges,
current_charges)
return nil
end
if not ability or ability:IsNull() or caster:IsChanneling() then
self:RestoreAbilityState(ability, caster, remaining_cooldown, current_mana, original_cast_point, has_charges,
current_charges)
return nil
end
remaining_cooldown = ability:GetCooldownTimeRemaining() or 0
current_mana = caster:GetMana()
if has_charges then
if ability:IsItem() then
current_charges = ability:GetCurrentCharges()
else
current_charges = ability:GetCurrentAbilityCharges()
end
end
while casts_done < cast_count do
casts_done = casts_done + 1
local mana_cost = ability:GetManaCost(ability:GetLevel() - 1)
if caster:GetMana() < mana_cost then
caster:GiveMana(mana_cost - caster:GetMana())
end
local target = self:FindTarget(ability, caster, origin)
local cast_attempted = false
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
local target_team = self:GetTargetTeam(ability)
if not self:IsTargetAllowed(ability, caster, target, target_team)
and self:IsTargetAllowed(ability, caster, fallback_target, target_team) then
target = fallback_target
end
if self:IsTargetAllowed(ability, caster, target, target_team) then
ability:EndCooldown()
caster:SetCursorCastTarget(target)
caster:CastAbilityImmediately(ability, caster:GetPlayerOwnerID())
caster:SetCursorCastTarget(nil)
cast_attempted = true
fallback_target = target
origin = target:GetAbsOrigin()
end
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 or bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 then
local cast_position = origin
if target and not target:IsNull() and target:IsAlive() then
cast_position = target:GetAbsOrigin()
origin = cast_position
end
caster:SetCursorPosition(cast_position)
ability:EndCooldown()
caster:CastAbilityImmediately(ability, caster:GetPlayerOwnerID())
cast_attempted = true
end
caster:SetMana(current_mana)
if not cast_attempted then break end
end
self:RestoreAbilityState(ability, caster, remaining_cooldown, current_mana, original_cast_point, has_charges,
current_charges)
return nil
end, delay)
end
function modifier_ability_trigger_chilie:RestoreAbilityState(ability, caster, remaining_cooldown, current_mana,
original_cast_point, has_charges, current_charges)
if not ability or ability:IsNull() then return end
if caster and not caster:IsNull() then
caster:SetMana(current_mana)
end
ability:SetOverrideCastPoint(original_cast_point)
if has_charges then
if ability:IsItem() then
ability:SetCurrentCharges(current_charges)
else
ability:SetCurrentAbilityCharges(current_charges)
end
end
if remaining_cooldown and remaining_cooldown > 0 then
ability:EndCooldown()
ability:StartCooldown(remaining_cooldown)
else
ability:EndCooldown()
end
ability.upgrade_triggered = nil
ability.chilie_allow_lina_upgrade_once = nil
ability.chilie_trigger_active = nil
end
