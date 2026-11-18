require("abilities/ability_blacklist_butterfly")
ability_trigger_on_attacked = class({})
LinkLuaModifier("modifier_trigger_on_attacked", "abilities/ability_trigger_on_attacked",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_trigger_on_attacked_cooldown",
"abilities/ability_trigger_on_attacked", LUA_MODIFIER_MOTION_NONE)
function ability_trigger_on_attacked:GetIntrinsicModifierName()
return "modifier_trigger_on_attacked"
end
function ability_trigger_on_attacked:OnUpgrade()
if not IsServer() then return end
local caster = self:GetCaster()
local modifier = caster:FindModifierByName("modifier_trigger_on_attacked")
if modifier then
modifier:RefreshKeyValues()
end
end
local CACHE_REFRESH_INTERVAL = 5
modifier_trigger_on_attacked = class({})
function modifier_trigger_on_attacked:IsHidden()
return true
end
function modifier_trigger_on_attacked:IsPermanent()
return true
end
function modifier_trigger_on_attacked:RemoveOnDeath()
return false
end
function modifier_trigger_on_attacked:IsPurgable()
return false
end
function modifier_trigger_on_attacked:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ATTACKED
}
end
function modifier_trigger_on_attacked:RefreshSkillList()
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
if ability:GetAbilityType() == 1 then
table.insert(self._cache_ultimate, ability)
else
table.insert(self._cache_basic, ability)
end
end
end
end
function modifier_trigger_on_attacked:RefreshKeyValues()
local passive_level = self:GetAbility():GetLevel()
if passive_level <= 0 then passive_level = 1 end
if passive_level == self._cached_passive_level then return end
self._cached_passive_level = passive_level
self._cached_basic_chance = self:GetAbility():GetLevelSpecialValueFor("basic_trigger_chance", passive_level - 1)
self._cached_ultimate_chance = self:GetAbility():GetLevelSpecialValueFor("ultimate_trigger_chance", passive_level - 1)
end
function modifier_trigger_on_attacked:OnCreated()
if not IsServer() then return end
self._cache_ultimate = {}
self._cache_basic = {}
self._cache_time = GameRules:GetGameTime()
self._cached_passive_level = -1
self:RefreshSkillList()
self:RefreshKeyValues()
end
function modifier_trigger_on_attacked:OnAttacked(params)
if not IsServer() then return end
local attacker = params.attacker
local parent = self:GetParent()
if params.target ~= parent then return end
if parent:IsIllusion() then return end
if attacker:IsBuilding() then return end
if parent:HasModifier("modifier_trigger_on_attacked_cooldown") then
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
if #ultimate_abilities == 0 and #basic_abilities == 0 then return end
local trigger_ultimate = RollPseudoRandomPercentage(ultimate_trigger_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, parent)
local trigger_basic = RollPseudoRandomPercentage(basic_trigger_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_2, parent)
if not trigger_ultimate and not trigger_basic then return end
local random_ability = nil
if trigger_ultimate and #ultimate_abilities > 0 then
random_ability = ultimate_abilities[RandomInt(1, #ultimate_abilities)]
elseif trigger_basic and #basic_abilities > 0 then
random_ability = basic_abilities[RandomInt(1, #basic_abilities)]
end
if not random_ability then return end
local remaining_cooldown = random_ability:GetCooldownTimeRemaining() or 0
local current_mana = parent:GetMana()
local mana_cost = random_ability:GetManaCost(random_ability:GetLevel() - 1)
local original_cast_point = random_ability:GetCastPoint()
local has_charges = random_ability:GetMaxAbilityCharges(random_ability:GetLevel()) > 0
local current_charges = 0
if has_charges then
current_charges = random_ability:GetCurrentAbilityCharges()
end
random_ability:EndCooldown()
random_ability:SetOverrideCastPoint(0)
if current_mana < mana_cost then
parent:GiveMana(mana_cost - current_mana)
end
local target = attacker
local behavior = random_ability:GetBehavior()
if type(behavior) ~= "number" then
behavior = tonumber(tostring(behavior))
end
local target_team = random_ability:GetAbilityTargetTeam()
local cast_target = target
if bit.band(target_team, DOTA_UNIT_TARGET_TEAM_FRIENDLY) ~= 0 then
cast_target = parent
elseif bit.band(target_team, DOTA_UNIT_TARGET_TEAM_ENEMY) ~= 0 then
cast_target = attacker
end
local ability_name = random_ability:GetAbilityName()
if ability_name == "invoker_sun_strike" then
cast_target = parent
end
local cast_success = false
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
parent:SetCursorCastTarget(cast_target)
cast_success = parent:CastAbilityImmediately(random_ability, parent:GetPlayerOwnerID())
parent:SetCursorCastTarget(nil)
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 or
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 then
parent:SetCursorPosition(cast_target:GetAbsOrigin())
cast_success = parent:CastAbilityImmediately(random_ability, parent:GetPlayerOwnerID())
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_NO_TARGET) ~= 0 then
cast_success = parent:CastAbilityImmediately(random_ability, parent:GetPlayerOwnerID())
end
if cast_success then
local cooldown_duration = self:GetAbility():GetSpecialValueFor("cooldown_duration")
parent:AddNewModifier(parent, self:GetAbility(), "modifier_trigger_on_attacked_cooldown",
{ duration = cooldown_duration })
end
parent:SetMana(current_mana)
random_ability:SetOverrideCastPoint(original_cast_point)
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
return nil
end, restore_delay)
EmitSoundOn("Hero_Juggernaut.BladeFury", parent)
end
modifier_trigger_on_attacked_cooldown = class({})
function modifier_trigger_on_attacked_cooldown:IsHidden()
return true
end
function modifier_trigger_on_attacked_cooldown:IsPurgable()
return false
end
function modifier_trigger_on_attacked_cooldown:RemoveOnDeath()
return false
end
