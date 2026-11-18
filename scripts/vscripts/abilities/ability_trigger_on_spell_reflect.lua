require("abilities/ability_blacklist_butterfly")
ability_trigger_on_spell_reflect = class({})
LinkLuaModifier("modifier_trigger_on_spell_reflect", "abilities/ability_trigger_on_spell_reflect",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_trigger_on_spell_reflect_cooldown", "abilities/ability_trigger_on_spell_reflect",
LUA_MODIFIER_MOTION_NONE)
function ability_trigger_on_spell_reflect:GetIntrinsicModifierName()
return "modifier_trigger_on_spell_reflect"
end
function ability_trigger_on_spell_reflect:OnUpgrade()
if not IsServer() then return end
local caster = self:GetCaster()
local modifier = caster:FindModifierByName("modifier_trigger_on_spell_reflect")
if modifier then
modifier:RefreshKeyValues()
end
end
local CACHE_REFRESH_INTERVAL = 5
modifier_trigger_on_spell_reflect = class({})
function modifier_trigger_on_spell_reflect:IsHidden()
return true
end
function modifier_trigger_on_spell_reflect:IsPermanent()
return true
end
function modifier_trigger_on_spell_reflect:RemoveOnDeath()
return false
end
function modifier_trigger_on_spell_reflect:IsPurgable()
return false
end
function modifier_trigger_on_spell_reflect:DeclareFunctions()
return {
MODIFIER_EVENT_ON_TAKEDAMAGE
}
end
function modifier_trigger_on_spell_reflect:RefreshSkillList()
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
function modifier_trigger_on_spell_reflect:RefreshKeyValues()
local passive_level = self:GetAbility():GetLevel()
if passive_level <= 0 then passive_level = 1 end
if passive_level == self._cached_passive_level then return end
self._cached_passive_level = passive_level
self._cached_reflect_chance = self:GetAbility():GetLevelSpecialValueFor("reflect_chance", passive_level - 1)
self._cached_basic_chance = self:GetAbility():GetLevelSpecialValueFor("basic_trigger_chance", passive_level - 1)
self._cached_ultimate_chance = self:GetAbility():GetLevelSpecialValueFor("ultimate_trigger_chance", passive_level - 1)
self._cached_reflect_damage_pct = self:GetAbility():GetLevelSpecialValueFor("reflect_damage_pct", passive_level - 1)
self._cached_cooldown_duration = self:GetAbility():GetSpecialValueFor("cooldown_duration")
end
function modifier_trigger_on_spell_reflect:OnCreated()
if not IsServer() then return end
self._cache_ultimate = {}
self._cache_basic = {}
self._cache_time = GameRules:GetGameTime()
self._cached_passive_level = -1
self:RefreshSkillList()
self:RefreshKeyValues()
end
function modifier_trigger_on_spell_reflect:OnTakeDamage(params)
if not IsServer() then return end
local parent = self:GetParent()
local attacker = params.attacker
if parent:HasModifier("modifier_trigger_on_spell_reflect_cooldown") then
return
end
if attacker == parent then
return
end
if params.unit ~= parent then
return
end
if parent:IsIllusion() then
return
end
if not params.inflictor then
return
end
local ability = params.inflictor
local behavior = ability:GetBehavior()
if type(behavior) ~= "number" then
behavior = tonumber(tostring(behavior))
end
if ability:IsItem() then
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) == 0 then
return
end
else
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) == 0 then
return
end
end
local reflect_chance = self._cached_reflect_chance
local should_reflect = RollPseudoRandomPercentage(reflect_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_7, parent)
if should_reflect then
local reflect_pct = self._cached_reflect_damage_pct
local reflect_damage = params.original_damage * (reflect_pct / 100)
ApplyDamage({
victim = attacker,
attacker = parent,
damage = reflect_damage,
damage_type = params.damage_type,
damage_flags = DOTA_DAMAGE_FLAG_REFLECTION,
ability = self:GetAbility(),
})
local particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_antimage/antimage_spellshield_reflect.vpcf",
PATTACH_CUSTOMORIGIN,
nil
)
ParticleManager:SetParticleControl(particle, 0, parent:GetAbsOrigin())
ParticleManager:SetParticleControl(particle, 1, attacker:GetAbsOrigin())
ParticleManager:ReleaseParticleIndex(particle)
EmitSoundOn("Hero_Antimage.SpellShield.Reflect", parent)
local trigger_ultimate = RollPseudoRandomPercentage(self._cached_ultimate_chance,
DOTA_PSEUDO_RANDOM_CUSTOM_GAME_8, parent)
local trigger_basic = RollPseudoRandomPercentage(self._cached_basic_chance, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_9,
parent)
if not trigger_ultimate and not trigger_basic then
return
end
local cooldown_duration = self._cached_cooldown_duration
parent:AddNewModifier(parent, self:GetAbility(), "modifier_trigger_on_spell_reflect_cooldown",
{ duration = cooldown_duration })
self:TriggerRandomAbility(attacker, trigger_ultimate, trigger_basic)
end
end
function modifier_trigger_on_spell_reflect:TriggerRandomAbility(original_attacker, trigger_ultimate, trigger_basic)
local parent = self:GetParent()
local now = GameRules:GetGameTime()
if now - (self._cache_time or 0) >= CACHE_REFRESH_INTERVAL then
self:RefreshSkillList()
self._cache_time = now
end
local ultimate_abilities = self._cache_ultimate
local basic_abilities = self._cache_basic
if #ultimate_abilities == 0 and #basic_abilities == 0 then return end
local random_ability = nil
if trigger_ultimate and #ultimate_abilities > 0 then
random_ability = ultimate_abilities[RandomInt(1, #ultimate_abilities)]
elseif trigger_basic and #basic_abilities > 0 then
random_ability = basic_abilities[RandomInt(1, #basic_abilities)]
end
if not random_ability then return end
local ability_name = random_ability:GetAbilityName()
local remaining_cooldown = random_ability:GetCooldownTimeRemaining() or 0
local current_mana = parent:GetMana()
local mana_cost = random_ability:GetManaCost(random_ability:GetLevel() - 1)
local original_cast_point = random_ability:GetCastPoint()
local has_charges = random_ability:GetMaxAbilityCharges(random_ability:GetLevel()) > 0
local current_charges = 0
if has_charges then
current_charges = random_ability:GetCurrentAbilityCharges()
end
local function RestoreSkippedAbility()
parent:SetMana(current_mana)
random_ability:SetOverrideCastPoint(original_cast_point)
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
end
random_ability:EndCooldown()
random_ability:SetOverrideCastPoint(0)
if current_mana < mana_cost then
parent:GiveMana(mana_cost - current_mana)
end
local behavior = random_ability:GetBehavior()
local target_team = random_ability:GetAbilityTargetTeam()
local cast_target = nil
local target_position = nil
local is_friendly = original_attacker:GetTeamNumber() == parent:GetTeamNumber()
if bit.band(target_team, DOTA_UNIT_TARGET_TEAM_FRIENDLY) ~= 0 then
cast_target = parent
target_position = parent:GetAbsOrigin()
elseif bit.band(target_team, DOTA_UNIT_TARGET_TEAM_ENEMY) ~= 0 then
if original_attacker and not original_attacker:IsNull() and original_attacker:IsAlive() and not is_friendly then
cast_target = original_attacker
target_position = original_attacker:GetAbsOrigin()
else
local search_radius = 1200
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
RestoreSkippedAbility()
return
end
end
else
target_position = parent:GetAbsOrigin()
end
local cast_success = false
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_NO_TARGET) ~= 0 and
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) == 0 and
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) == 0 then
cast_success = parent:CastAbilityImmediately(random_ability, parent:GetPlayerOwnerID())
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
if cast_target and not cast_target:IsNull() then
parent:SetCursorCastTarget(cast_target)
cast_success = parent:CastAbilityImmediately(random_ability, -1)
parent:SetCursorCastTarget(nil)
end
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 or
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 then
if target_position then
parent:SetCursorPosition(target_position)
cast_success = parent:CastAbilityImmediately(random_ability, -1)
end
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
end
modifier_trigger_on_spell_reflect_cooldown = class({})
function modifier_trigger_on_spell_reflect_cooldown:IsHidden()
return true
end
function modifier_trigger_on_spell_reflect_cooldown:IsPurgable()
return false
end
function modifier_trigger_on_spell_reflect_cooldown:RemoveOnDeath()
return false
end
