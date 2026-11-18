require("abilities/ability_blacklist_butterfly")
LinkLuaModifier("modifier_ability_trigger_on_active", "abilities/ability_trigger_on_active.lua", LUA_MODIFIER_MOTION_NONE)
ability_trigger_on_active = class({})
local ZIYAO_CHANNEL_HELPER_ABILITY = "ability_trigger_on_active_channel_helper"
function ability_trigger_on_active:GetAOERadius()
return self:GetSpecialValueFor("search_radius")
end
function ability_trigger_on_active:EnsureChannelHelper()
if not IsServer() then return end
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
local helper = caster:FindAbilityByName(ZIYAO_CHANNEL_HELPER_ABILITY)
if not helper then
helper = caster:AddAbility(ZIYAO_CHANNEL_HELPER_ABILITY)
end
if helper then
helper:SetLevel(1)
helper:SetHidden(true)
end
end
function ability_trigger_on_active:OnUpgrade()
self:EnsureChannelHelper()
end
function ability_trigger_on_active:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
local point = self:GetCursorPosition()
local duration = self:GetChannelTime()
if duration <= 0 then
duration = self:GetSpecialValueFor("duration")
end
caster:AddNewModifier(caster, self, "modifier_ability_trigger_on_active", {
duration = duration,
target_x = point.x,
target_y = point.y,
target_z = point.z
})
EmitSoundOn("goku.3", caster)
EmitSoundOn("Hero_OgreMagi.Fireblast.x3", caster)
EmitSoundOn("Hero_Silencer.Curse.Cast", caster)
end
function ability_trigger_on_active:OnChannelFinish()
if not IsServer() then return end
self:GetCaster():RemoveModifierByName("modifier_ability_trigger_on_active")
end
modifier_ability_trigger_on_active = class({})
function modifier_ability_trigger_on_active:IsHidden() return false end
function modifier_ability_trigger_on_active:IsPurgable() return false end
function modifier_ability_trigger_on_active:RemoveOnDeath() return true end
function modifier_ability_trigger_on_active:CheckState()
return {
[MODIFIER_STATE_ROOTED] = true,
[MODIFIER_STATE_COMMAND_RESTRICTED] = false,
}
end
function modifier_ability_trigger_on_active:OnCreated(params)
if not IsServer() then return end
self.caster = self:GetCaster()
self.ability = self:GetAbility()
self.target_point = Vector(params.target_x, params.target_y, params.target_z)
self.auto_cast_interval = self.ability:GetSpecialValueFor("auto_cast_interval")
self.no_support_abilities = EXCLUDED_ABILITIES_ALLBUTTER
self.no_support_abilities[self.ability:GetName()] = true
self.no_support_items = EXCLUDED_ITEMS or {}
self.no_support_substrings = {
"mango",
"faerie_fire",
"item_ward",
"item_tango",
"tome",
"blink",
"black_king_bar",
"item_manta",
}
self:RefreshSupportList()
self:StartIntervalThink(self.auto_cast_interval)
end
function modifier_ability_trigger_on_active:RefreshSupportList()
self._cache_abilities = {}
self._cache_items = {}
for i = 0, self.caster:GetAbilityCount() - 1 do
local ability = self.caster:GetAbilityByIndex(i)
if ability and self:PassesStaticFilter(ability) then
table.insert(self._cache_abilities, ability)
end
end
for i = 0, 8 do
local item = self.caster:GetItemInSlot(i)
if item and self:PassesStaticFilter(item) then
table.insert(self._cache_items, item)
end
end
end
function modifier_ability_trigger_on_active:PassesStaticFilter(ability)
local ability_name = ability:GetName()
if not ability or ability:IsHidden() or ability:IsPassive() then
return false
end
if not ability:IsItem() and ability:GetLevel() <= 0 then
return false
end
local behavior = ability:GetBehavior()
if type(behavior) ~= "number" then behavior = tonumber(tostring(behavior)) end
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_CHANNELLED) == DOTA_ABILITY_BEHAVIOR_CHANNELLED then
return false
end
if ability_name == "nevermore_requiem" then return false end
if self.no_support_abilities[ability_name] then return false end
if ability:IsItem() then
if self.no_support_items[ability_name] then return false end
if ability_name == "item_hand_of_midas" or ability_name == "item_hand_of_group" then return false end
local target_team = ability:GetAbilityTargetTeam()
if bit.band(target_team, DOTA_UNIT_TARGET_TEAM_FRIENDLY) ~= 0 and
bit.band(target_team, DOTA_UNIT_TARGET_TEAM_ENEMY) == 0 then
return false
end
local b = ability:GetBehavior()
if type(b) ~= "number" then b = tonumber(tostring(b)) end
local is_unit = bit.band(b, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) == DOTA_ABILITY_BEHAVIOR_UNIT_TARGET
local is_point = bit.band(b, DOTA_ABILITY_BEHAVIOR_POINT) == DOTA_ABILITY_BEHAVIOR_POINT
local is_aoe = bit.band(b, DOTA_ABILITY_BEHAVIOR_AOE) == DOTA_ABILITY_BEHAVIOR_AOE
if not (is_unit or (is_point and is_aoe)) then return false end
end
for _, sub in ipairs(self.no_support_substrings) do
if string.find(ability_name, sub) then return false end
end
return true
end
function modifier_ability_trigger_on_active:OnDestroy()
if not IsServer() then return end
end
function modifier_ability_trigger_on_active:OnIntervalThink()
if not IsServer() then return end
if not self.caster:IsAlive() or not self.caster:IsChanneling() then
self:Destroy()
return
end
self:AutoCastAbilities()
end
function modifier_ability_trigger_on_active:AutoCastAbilities()
local abilities = self._cache_abilities or {}
local items = self._cache_items or {}
for _, ability in ipairs(abilities) do
if ability and not ability:IsNull() and ability:GetAbilityType() == ABILITY_TYPE_ULTIMATE and self:CanCastNow(ability) then
self:TryCastAbility(ability)
end
end
for _, ability in ipairs(abilities) do
if ability and not ability:IsNull() and ability:GetAbilityType() ~= ABILITY_TYPE_ULTIMATE and self:CanCastNow(ability) then
self:TryCastAbility(ability)
end
end
for _, item in ipairs(items) do
if item and not item:IsNull() and self:CanCastNow(item) then
self:TryCastAbility(item)
end
end
end
function modifier_ability_trigger_on_active:CanCastNow(ability)
return ability:IsFullyCastable() and self.caster:GetMana() >= ability:GetManaCost(-1)
end
function modifier_ability_trigger_on_active:CastEtherealBladeOnEnemy(ability)
local ability_name = ability:GetName()
local search_range = self.ability:GetSpecialValueFor("search_radius")
local heroes = FindUnitsInRadius(
self.caster:GetTeamNumber(),
self.target_point,
nil,
search_range,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS,
FIND_CLOSEST,
false
)
if #heroes > 0 then
local target = heroes[1]
ability:EndCooldown()
self.caster:SetCursorCastTarget(target)
local cast_success = self.caster:CastAbilityImmediately(ability, self.caster:GetPlayerOwnerID())
self.caster:SetCursorCastTarget(nil)
if cast_success then
self.caster:GiveMana(ability:GetManaCost(ability:GetLevel() - 1))
end
return cast_success
else
return false
end
end
function modifier_ability_trigger_on_active:TryCastAbility(ability)
local behavior = ability:GetBehavior()
local ability_name = ability:GetName()
local cast_target = nil
local target_position = nil
if ability_name == "item_wind_waker" or ability_name == "invoker_sun_strike" then
ability:EndCooldown()
self.caster:SetCursorCastTarget(self.caster)
local cast_success = self.caster:CastAbilityImmediately(ability, self.caster:GetPlayerOwnerID())
self.caster:SetCursorCastTarget(nil)
return
end
if ability_name == "abyssal_underlord_firestorm" then
return self:CastFirestormOnPoint(ability)
end
if ability_name == "luna_eclipse" then
return self:CastLunaEclipseOnPoint(ability)
end
ability:EndCooldown()
if type(behavior) ~= "number" then
behavior = tonumber(tostring(behavior))
end
local cast_success = false
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
local target_team = ability:GetAbilityTargetTeam()
local target_type = ability:GetAbilityTargetType()
local search_range = self.ability:GetSpecialValueFor("search_radius")
if bit.band(target_team, DOTA_UNIT_TARGET_TEAM_ENEMY) ~= 0 then
local enemies = FindUnitsInRadius(
self.caster:GetTeamNumber(),
self.target_point,
nil,
search_range,
DOTA_UNIT_TARGET_TEAM_ENEMY,
target_type,
DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS,
FIND_CLOSEST,
false
)
if #enemies > 0 then
cast_target = enemies[1]
else
return
end
end
if cast_target then
self.caster:SetCursorCastTarget(cast_target)
cast_success = self.caster:CastAbilityImmediately(ability, self.caster:GetPlayerOwnerID())
self.caster:SetCursorCastTarget(nil)
else
return
end
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 or
bit.band(behavior, DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 then
local target_team = ability:GetAbilityTargetTeam()
local search_range = self.ability:GetSpecialValueFor("search_radius")
target_position = self.target_point
self.caster:SetCursorPosition(target_position)
cast_success = self.caster:CastAbilityImmediately(ability, self.caster:GetPlayerOwnerID())
elseif bit.band(behavior, DOTA_ABILITY_BEHAVIOR_NO_TARGET) ~= 0 then
cast_success = self.caster:CastAbilityImmediately(ability, self.caster:GetPlayerOwnerID())
end
if cast_success then
self.caster:GiveMana(ability:GetManaCost(ability:GetLevel() - 1))
end
end
function modifier_ability_trigger_on_active:CastFirestormOnPoint(ability)
local search_range = self.ability:GetSpecialValueFor("search_radius")
local target_position = self.target_point
local enemies = FindUnitsInRadius(
self.caster:GetTeamNumber(),
self.target_point,
nil,
search_range,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS,
FIND_CLOSEST,
false
)
if #enemies > 0 then
target_position = enemies[1]:GetAbsOrigin()
else
target_position = self.target_point
end
ability:EndCooldown()
self.caster:SetCursorPosition(target_position)
local cast_success = self.caster:CastAbilityImmediately(ability, self.caster:GetPlayerOwnerID())
return cast_success
end
function modifier_ability_trigger_on_active:CastLunaEclipseOnPoint(ability)
local search_range = self.ability:GetSpecialValueFor("search_radius")
local target_position = self.target_point
local enemies = FindUnitsInRadius(
self.caster:GetTeamNumber(),
self.target_point,
nil,
search_range,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS,
FIND_CLOSEST,
false
)
if #enemies > 0 then
target_position = enemies[1]:GetAbsOrigin()
else
target_position = self.target_point
end
ability:EndCooldown()
local cast_success = self.caster:CastAbilityOnPosition(target_position, ability, self.caster:GetPlayerOwnerID())
return cast_success
end
function modifier_ability_trigger_on_active:DeclareFunctions()
return {
MODIFIER_PROPERTY_COOLDOWN_PERCENTAGE,
MODIFIER_PROPERTY_CASTTIME_PERCENTAGE,
MODIFIER_PROPERTY_CAST_RANGE_BONUS_STACKING,
}
end
function modifier_ability_trigger_on_active:GetModifierCastRangeBonusStacking()
if not self.ability then return 0 end
return self.ability:GetSpecialValueFor("bonus_cast_range")
end
function modifier_ability_trigger_on_active:GetModifierPercentageCooldown()
if not self.ability then return 0 end
return self.ability:GetSpecialValueFor("cd_reduction_pct")
end
function modifier_ability_trigger_on_active:GetModifierPercentageCasttime()
if not self.ability then return 0 end
return self.ability:GetSpecialValueFor("cast_time_reduction_pct")
end
function modifier_ability_trigger_on_active:GetEffectName()
return "particles/units/heroes/hero_invoker/invoker_wex_instance.vpcf"
end
function modifier_ability_trigger_on_active:GetEffectAttachType()
return PATTACH_ABSORIGIN_FOLLOW
end
