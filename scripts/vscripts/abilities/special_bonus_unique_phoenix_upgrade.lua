LinkLuaModifier("modifier_special_bonus_unique_phoenix_upgrade",
"abilities/special_bonus_unique_phoenix_upgrade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_special_bonus_unique_phoenix_upgrade_spell_amp",
"abilities/special_bonus_unique_phoenix_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_phoenix_upgrade = class({})
function special_bonus_unique_phoenix_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_phoenix_upgrade"
end
modifier_special_bonus_unique_phoenix_upgrade = class({})
function modifier_special_bonus_unique_phoenix_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_phoenix_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_phoenix_upgrade:RemoveOnDeath() return false end
function modifier_special_bonus_unique_phoenix_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED,
MODIFIER_EVENT_ON_DEATH
}
end
local function IsValidUnit(unit)
return unit and not unit:IsNull()
end
local function CopyBuffIfPresent(caster, dummy, modifier_name)
if caster:HasModifier(modifier_name) then
dummy:AddNewModifier(caster, nil, modifier_name, { duration = -1 })
end
end
local function CopyAbilityLevel(caster, dummy, ability_name, default_level)
local source = caster:FindAbilityByName(ability_name)
local level = default_level or 1
if source and not source:IsNull() and source:GetLevel() > 0 then
level = source:GetLevel()
end
local copied = dummy:AddAbility(ability_name)
if copied then
copied:SetLevel(math.min(level, copied:GetMaxLevel()))
end
return copied
end
local function Normalize2D(vec)
vec.z = 0
if vec:Length2D() < 0.01 then
return Vector(1, 0, 0)
end
return vec:Normalized()
end
local function RotateVector2D(vec, radians)
local cos_value = math.cos(radians)
local sin_value = math.sin(radians)
return Vector(vec.x * cos_value - vec.y * sin_value, vec.x * sin_value + vec.y * cos_value, 0)
end
local function Atan2(y, x)
if math.atan2 then
return math.atan2(y, x)
end
return math.atan(y, x)
end
local function SignedAngle2D(from, to)
local a = Normalize2D(from)
local b = Normalize2D(to)
local cross = a.x * b.y - a.y * b.x
local dot = a.x * b.x + a.y * b.y
return Atan2(cross, dot)
end
local function NormalizeAngle(angle)
while angle > math.pi do
angle = angle - 2 * math.pi
end
while angle < -math.pi do
angle = angle + 2 * math.pi
end
return angle
end
local function CopySelectedItemIfPresent(caster, dummy, item_name)
local item = caster:FindItemInInventory(item_name)
if not item or item:IsNull() then return end
local copied = dummy:AddItemByName(item_name)
if copied then
copied:SetCurrentCharges(item:GetCurrentCharges())
copied:SetLevel(item:GetLevel())
end
end
local function CopySelectedPhoenixItems(caster, dummy)
CopySelectedItemIfPresent(caster, dummy, "item_time_gem")
CopySelectedItemIfPresent(caster, dummy, "item_refresh_core")
CopySelectedItemIfPresent(caster, dummy, "item_gungir_2")
CopySelectedItemIfPresent(caster, dummy, "item_forbidden_staff")
for level = 1, 20 do
CopySelectedItemIfPresent(caster, dummy, "item_forbidden_staff_lv" .. tostring(level))
end
end
local function GetSunRayFocusPoint(caster)
local forward = Normalize2D(caster:GetForwardVector())
local sun_ray = caster:FindAbilityByName("phoenix_sun_ray")
local distance = 1200
if sun_ray and not sun_ray:IsNull() then
local cast_range = sun_ray:GetCastRange(caster:GetAbsOrigin(), nil)
if cast_range and cast_range > 0 then
distance = cast_range
end
end
return caster:GetAbsOrigin() + forward * distance
end
local function FacePuppetToPoint(puppet, point)
local direction = Normalize2D(point - puppet:GetAbsOrigin())
local current = Normalize2D(puppet:GetForwardVector())
if current:Dot(direction) < 0.996 then
puppet:SetForwardVector(direction)
end
end
local function SyncPuppetRelativeFacing(caster, puppet)
if not caster._phoenix_puppet_initial_forward or not puppet._phoenix_puppet_initial_forward then return end
local now = GameRules:GetGameTime()
local cache = caster._phoenix_puppet_facing_cache
if not cache or now - cache.time >= 0.09 then
local delta_angle = SignedAngle2D(caster._phoenix_puppet_initial_forward, caster:GetForwardVector())
cache = {
time = now,
delta_angle = NormalizeAngle(delta_angle),
cos_value = math.cos(delta_angle),
sin_value = math.sin(delta_angle)
}
caster._phoenix_puppet_facing_cache = cache
end
local initial_forward = puppet._phoenix_puppet_initial_forward
local target_forward = Normalize2D(Vector(
initial_forward.x * cache.cos_value - initial_forward.y * cache.sin_value,
initial_forward.x * cache.sin_value + initial_forward.y * cache.cos_value,
0
))
puppet:SetForwardVector(target_forward)
end
local function GetFormationPositions(caster, ability, count)
local origin = caster:GetAbsOrigin()
local forward = Normalize2D(caster:GetForwardVector())
local right = RotateVector2D(forward, -math.pi / 2)
local current_time = GameRules:GetDOTATime(false, false)
local second = math.floor(current_time) % 10
local positions = {}
local focus = GetSunRayFocusPoint(caster)
if second == 1 or second == 2 then
local spacing = ability:GetSpecialValueFor("line_spacing")
if spacing <= 0 then spacing = 180 end
local start = -((count - 1) / 2)
for i = 1, count do
table.insert(positions, GetGroundPosition(origin + right * (start + i - 1) * spacing, caster))
end
elseif second == 3 or second == 4 then
local spacing = ability:GetSpecialValueFor("line_spacing")
if spacing <= 0 then spacing = 180 end
for i = 1, count do
table.insert(positions, GetGroundPosition(origin + forward * spacing * i, caster))
end
elseif second >= 5 and second <= 7 then
local radius = ability:GetSpecialValueFor("circle_radius")
if radius <= 0 then radius = 300 end
for i = 1, count do
local angle = (2 * math.pi * (i - 1)) / count
table.insert(positions, GetGroundPosition(origin + RotateVector2D(forward, angle) * radius, caster))
end
else
local radius = ability:GetSpecialValueFor("boundary_circle_radius")
if radius <= 0 then radius = 700 end
radius = radius + ((second + 2) % 3) * 300
local center = origin + forward * radius
local arc_step = 2 * math.pi / (count + 1)
local start_angle = -arc_step * (count - 1) / 2
for i = 1, count do
local angle_offset = start_angle + arc_step * (i - 1)
local direction = RotateVector2D(forward, angle_offset)
table.insert(positions, GetGroundPosition(center + direction * radius, caster))
end
focus = origin + forward * radius
end
return positions, focus
end
local function GetPhoenixPuppetCount(caster, ability)
local strength_per_puppet = ability:GetSpecialValueFor("strength_per_puppet")
if strength_per_puppet <= 0 then strength_per_puppet = 500 end
local base_count = ability:GetSpecialValueFor("base_puppet_count")
if base_count <= 0 then base_count = 1 end
local max_extra_puppets = ability:GetSpecialValueFor("max_extra_puppets")
if max_extra_puppets <= 0 then max_extra_puppets = 9 end
return math.min(base_count + math.floor((caster:GetStrength() or 0) / strength_per_puppet), max_extra_puppets)
end
local function RemovePhoenixPuppet(caster, puppet)
if IsValidUnit(caster) and caster._phoenix_supernova_puppets then
local alive = {}
for _, unit in pairs(caster._phoenix_supernova_puppets) do
if IsValidUnit(unit) and unit ~= puppet and unit:IsAlive() and not unit._phoenix_puppet_destroyed then
table.insert(alive, unit)
end
end
caster._phoenix_supernova_puppets = alive
end
if not IsValidUnit(puppet) or puppet._phoenix_puppet_destroyed then return end
puppet._phoenix_puppet_destroyed = true
puppet:Stop()
puppet:Interrupt()
puppet:AddNoDraw()
puppet:AddNewModifier(caster, nil, "modifier_kill", { duration = 0.1 })
end
local function RemoveAllPhoenixPuppets(caster)
if not IsValidUnit(caster) or not caster._phoenix_supernova_puppets then return end
local puppets = caster._phoenix_supernova_puppets
caster._phoenix_supernova_puppets = {}
caster._phoenix_puppet_sun_ray_started = false
caster._phoenix_puppet_sun_ray_stopped = true
caster._phoenix_puppet_first_sun_ray_point = nil
caster._phoenix_puppet_focus_point = nil
for _, puppet in pairs(puppets) do
RemovePhoenixPuppet(caster, puppet)
end
end
local function GetCasterSupernovaDuration(caster, fallback_ability)
local supernova = caster:FindAbilityByName("phoenix_supernova")
local duration = 0
if supernova and not supernova:IsNull() then
duration = supernova:GetSpecialValueFor("duration")
end
if duration <= 0 and fallback_ability and not fallback_ability:IsNull() then
duration = fallback_ability:GetSpecialValueFor("puppet_duration")
end
if duration <= 0 then duration = 6 end
return duration
end
local function PhoenixPuppetDebug(message)
print("[PhoenixPuppet] " .. message)
end
local function FormatVector2D(vec)
if not vec then return "nil" end
return string.format("(%.1f, %.1f)", vec.x or 0, vec.y or 0)
end
local function ClampSunRayTargetToCastRange(puppet, sun_ray, target)
local origin = puppet:GetAbsOrigin()
local offset = target - origin
offset.z = 0
local distance = offset:Length2D()
local cast_range = sun_ray:GetCastRange(origin, nil)
if cast_range <= 0 then cast_range = 1200 end
cast_range = cast_range + (puppet:GetCastRangeBonus() or 0)
local target_distance = math.max(cast_range - 300, 100)
local direction = nil
if distance < 0.01 then
direction = Normalize2D(puppet:GetForwardVector())
else
direction = offset:Normalized()
end
if math.abs(distance - target_distance) < 1 then
return target, distance, distance, cast_range, false
end
local adjusted_target = GetGroundPosition(origin + direction * target_distance, puppet)
return adjusted_target, distance, target_distance, cast_range, true
end
local function SyncPhoenixPuppet(caster, ability, puppet, sun_ray, interval)
if not IsValidUnit(caster) or not caster:IsAlive() or not IsValidUnit(puppet) or not puppet:IsAlive() then
RemovePhoenixPuppet(caster, puppet)
return nil
end
if puppet._phoenix_puppet_destroyed then return nil end
SyncPuppetRelativeFacing(caster, puppet)
if sun_ray and not sun_ray:IsNull() then
local puppet_using_sun_ray = puppet:HasModifier("modifier_phoenix_sun_ray")
or puppet:HasModifier("modifier_phoenix_sun_ray_caster")
if caster._phoenix_puppet_sun_ray_started and not puppet_using_sun_ray then
local target = caster._phoenix_puppet_first_sun_ray_point
if not target then return interval end
local original_distance = 0
local final_distance = 0
local cast_range = 0
local clamped = false
target, original_distance, final_distance, cast_range, clamped =
ClampSunRayTargetToCastRange(puppet, sun_ray, target)
sun_ray:EndCooldown()
puppet:SetMana(9999)
FacePuppetToPoint(puppet, target)
local cast_result = puppet:CastAbilityOnPosition(target, sun_ray, caster:GetPlayerOwnerID())
PhoenixPuppetDebug(string.format(
"sun_ray cast_result=%s clamped=%s original_distance=%.1f final_distance=%.1f cast_range=%.1f puppet_pos=%s target_pos=%s",
tostring(cast_result),
tostring(clamped),
original_distance,
final_distance,
cast_range,
FormatVector2D(puppet:GetAbsOrigin()),
FormatVector2D(target)
))
Timers:CreateTimer(0.1, function()
if not IsValidUnit(puppet) or puppet._phoenix_puppet_destroyed then return nil end
local has_sun_ray = puppet:HasModifier("modifier_phoenix_sun_ray")
or puppet:HasModifier("modifier_phoenix_sun_ray_caster")
PhoenixPuppetDebug(string.format(
"sun_ray post_check active=%s cooldown=%.2f mana=%.1f target_pos=%s",
tostring(has_sun_ray),
sun_ray:GetCooldownTimeRemaining(),
puppet:GetMana(),
FormatVector2D(target)
))
return nil
end)
elseif caster._phoenix_puppet_sun_ray_stopped and puppet_using_sun_ray then
local stop = puppet:FindAbilityByName("phoenix_sun_ray_stop")
if stop then
puppet:CastAbilityNoTarget(stop, caster:GetPlayerOwnerID())
else
puppet:Stop()
end
end
end
return interval
end
local function CreatePhoenixSupernovaPuppet(caster, ability, pos, focus)
local dummy = CreateUnitByName("dummy_unit_hero", pos, false, caster, caster, caster:GetTeamNumber())
if not IsValidUnit(dummy) then return end
dummy:SetOwner(caster)
dummy:SetControllableByPlayer(caster:GetPlayerID(), true)
dummy:SetMana(9999)
FacePuppetToPoint(dummy, focus)
dummy._phoenix_puppet_initial_forward = Normalize2D(dummy:GetForwardVector())
CopyBuffIfPresent(caster, dummy, "modifier_item_ultimate_scepter")
CopyBuffIfPresent(caster, dummy, "modifier_item_ultimate_scepter_consumed")
CopyBuffIfPresent(caster, dummy, "modifier_item_ultimate_scepter_2_consumed")
CopyBuffIfPresent(caster, dummy, "modifier_item_aghanims_shard")
CopySelectedPhoenixItems(caster, dummy)
dummy:AddNewModifier(caster, ability, "modifier_special_bonus_unique_phoenix_upgrade_spell_amp", {
spell_amp = caster:GetSpellAmplification(false) or 0
})
local supernova = CopyAbilityLevel(caster, dummy, "phoenix_supernova", 1)
local sun_ray = CopyAbilityLevel(caster, dummy, "phoenix_sun_ray", 1)
CopyAbilityLevel(caster, dummy, "phoenix_sun_ray_stop", 1)
CopyAbilityLevel(caster, dummy, "phoenix_sun_ray_toggle_move", 1)
CopyAbilityLevel(caster, dummy, "special_bonus_unique_phoenix_1", 1)
caster._phoenix_supernova_puppets = caster._phoenix_supernova_puppets or {}
table.insert(caster._phoenix_supernova_puppets, dummy)
Timers:CreateTimer(0.05, function()
if IsValidUnit(dummy) and IsValidUnit(supernova) then
supernova:EndCooldown()
dummy:SetMana(9999)
FacePuppetToPoint(dummy, focus)
dummy:CastAbilityNoTarget(supernova, caster:GetPlayerOwnerID())
end
return nil
end)
local interval = ability:GetSpecialValueFor("sync_interval")
if interval <= 0 then interval = 0.3 end
Timers:CreateTimer(interval, function()
return SyncPhoenixPuppet(caster, ability, dummy, sun_ray, interval)
end)
end
function modifier_special_bonus_unique_phoenix_upgrade:SpawnPuppets()
local caster = self:GetParent()
local ability = self:GetAbility()
if not IsValidUnit(caster) or not IsValidUnit(ability) then return end
local count = GetPhoenixPuppetCount(caster, ability)
local positions, focus = GetFormationPositions(caster, ability, count)
RemoveAllPhoenixPuppets(caster)
caster._phoenix_puppet_initial_forward = Normalize2D(caster:GetForwardVector())
caster._phoenix_puppet_focus_point = focus
caster._phoenix_puppet_first_sun_ray_point = nil
caster._phoenix_puppet_sun_ray_started = false
caster._phoenix_puppet_sun_ray_stopped = false
caster._phoenix_puppet_facing_cache = nil
for i = 1, count do
CreatePhoenixSupernovaPuppet(caster, ability, positions[i], focus)
end
local sequence = (caster._phoenix_puppet_sequence or 0) + 1
caster._phoenix_puppet_sequence = sequence
Timers:CreateTimer(GetCasterSupernovaDuration(caster, ability), function()
if IsValidUnit(caster) and caster._phoenix_puppet_sequence == sequence then
RemoveAllPhoenixPuppets(caster)
end
return nil
end)
end
function modifier_special_bonus_unique_phoenix_upgrade:OnAbilityExecuted(params)
if not IsServer() then return end
local caster = self:GetParent()
if params.unit ~= caster or caster:GetUnitName() ~= "npc_dota_hero_phoenix" then return end
if not params.ability or params.ability:IsNull() then return end
local ability_name = params.ability:GetAbilityName()
if ability_name == "phoenix_supernova" then
self:SpawnPuppets()
elseif ability_name == "phoenix_sun_ray" then
if not caster._phoenix_puppet_sun_ray_started then
caster._phoenix_puppet_first_sun_ray_point = params.ability:GetCursorPosition()
caster._phoenix_puppet_sun_ray_started = true
caster._phoenix_puppet_sun_ray_stopped = false
end
elseif ability_name == "phoenix_sun_ray_stop" then
caster._phoenix_puppet_sun_ray_stopped = true
end
end
function modifier_special_bonus_unique_phoenix_upgrade:OnDeath(params)
if not IsServer() then return end
local caster = self:GetParent()
if not caster._phoenix_supernova_puppets then return end
for _, puppet in pairs(caster._phoenix_supernova_puppets) do
if params.unit == puppet then
RemovePhoenixPuppet(caster, puppet)
return
end
end
end
modifier_special_bonus_unique_phoenix_upgrade_spell_amp = class({})
function modifier_special_bonus_unique_phoenix_upgrade_spell_amp:IsHidden() return true end
function modifier_special_bonus_unique_phoenix_upgrade_spell_amp:IsPurgable() return false end
function modifier_special_bonus_unique_phoenix_upgrade_spell_amp:RemoveOnDeath() return false end
function modifier_special_bonus_unique_phoenix_upgrade_spell_amp:OnCreated(kv)
self.spell_amp = (tonumber(kv.spell_amp) or 0) * 100
end
function modifier_special_bonus_unique_phoenix_upgrade_spell_amp:DeclareFunctions()
return {
MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE
}
end
function modifier_special_bonus_unique_phoenix_upgrade_spell_amp:GetModifierSpellAmplify_Percentage()
return self.spell_amp
end
