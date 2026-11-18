LinkLuaModifier("modifier_special_bonus_unique_kez_upgrade",
"abilities/special_bonus_unique_kez_upgrade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_special_bonus_unique_kez_upgrade_dash",
"abilities/special_bonus_unique_kez_upgrade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_special_bonus_unique_kez_upgrade_falcon_rush",
"abilities/special_bonus_unique_kez_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_kez_upgrade = class({})
local KEZ_UPGRADE_DEBUG = false
local KEZ_RAPTOR_DIRECTION_ANGLES = { -45, 90, -135, 90, -45 }
local KEZ_RAPTOR_RETURN_DELAY = 0.35
local function KezUpgradeDebug(parent, message)
if not KEZ_UPGRADE_DEBUG then return end
local name = "nil"
if parent and not parent:IsNull() then
name = parent:GetUnitName()
end
print("[KezUpgrade][" .. name .. "] " .. message)
end
local function AddKezCastSpeedSource(sources, source)
if not sources then return end
table.insert(sources, source)
end
local KEZ_CAST_SPEED_MODIFIERS = {
modifier_item_yasha_and_kaya = true,
modifier_item_yasha_and_kaya_1 = true,
modifier_item_time_gem = true,
}
local function ApplyKezCastTimeReduction(cast_time_multiplier, value)
value = math.max(0, math.min(100, value or 0))
return cast_time_multiplier * (100 - value) / 100
end
local function GetKezCastTimeMultiplier(parent, sources)
local cast_time_multiplier = 1
local total_cast_speed_pct = 0
local handled_abilities = {}
for _, modifier in pairs(parent:FindAllModifiers() or {}) do
local modifier_name = modifier:GetName()
local modifier_ability = modifier:GetAbility()
local handled_cast_speed_modifier = false
if modifier_ability and not modifier_ability:IsNull() then
handled_abilities[modifier_ability:entindex()] = true
if KEZ_CAST_SPEED_MODIFIERS[modifier_name] then
local value = modifier_ability:GetSpecialValueFor("cast_speed_pct") or 0
total_cast_speed_pct = total_cast_speed_pct + value
cast_time_multiplier = ApplyKezCastTimeReduction(cast_time_multiplier, value)
AddKezCastSpeedSource(sources, modifier_name .. ":ability=" .. modifier_ability:GetName() .. ":cast_speed_pct=" .. tostring(value))
handled_cast_speed_modifier = true
end
end
if not handled_cast_speed_modifier and modifier.GetModifierPercentageCasttime then
local value = modifier:GetModifierPercentageCasttime() or 0
total_cast_speed_pct = total_cast_speed_pct + value
cast_time_multiplier = ApplyKezCastTimeReduction(cast_time_multiplier, value)
AddKezCastSpeedSource(sources, modifier_name .. ":GetModifierPercentageCasttime=" .. tostring(value))
elseif not handled_cast_speed_modifier and modifier._GetModifierPercentageCasttime then
local value = modifier:_GetModifierPercentageCasttime() or 0
total_cast_speed_pct = total_cast_speed_pct + value
cast_time_multiplier = ApplyKezCastTimeReduction(cast_time_multiplier, value)
AddKezCastSpeedSource(sources, modifier_name .. ":_GetModifierPercentageCasttime=" .. tostring(value))
end
end
for slot = 0, 16 do
local item = parent:GetItemInSlot(slot)
if item and not item:IsNull() and not handled_abilities[item:entindex()] then
local value = item:GetSpecialValueFor("cast_speed_pct") or 0
total_cast_speed_pct = total_cast_speed_pct + value
cast_time_multiplier = ApplyKezCastTimeReduction(cast_time_multiplier, value)
AddKezCastSpeedSource(sources, item:GetName() .. ":slot" .. tostring(slot) .. ":cast_speed_pct=" .. tostring(value))
end
end
return math.max(0.01, cast_time_multiplier), total_cast_speed_pct
end
local function GetAdjustedKezCastPoint(parent, cast_point)
local sources = {}
local cast_time_multiplier, cast_speed_pct = GetKezCastTimeMultiplier(parent, sources)
return cast_point * cast_time_multiplier, cast_speed_pct, cast_time_multiplier, table.concat(sources, "|")
end
function special_bonus_unique_kez_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_kez_upgrade"
end
modifier_special_bonus_unique_kez_upgrade = class({})
function modifier_special_bonus_unique_kez_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_kez_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_kez_upgrade:RemoveOnDeath() return false end
function modifier_special_bonus_unique_kez_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_START,
MODIFIER_EVENT_ON_ABILITY_EXECUTED
}
end
function modifier_special_bonus_unique_kez_upgrade:StartRaptorDash(parent, ability, raptor_ability)
local raptor_cast_point = raptor_ability and raptor_ability:GetCastPoint() or 0
local cast_speed_pct = 0
local cast_time_multiplier = 1
local cast_speed_sources = ""
local forward_duration = raptor_cast_point
if forward_duration > 0 then
forward_duration, cast_speed_pct, cast_time_multiplier, cast_speed_sources = GetAdjustedKezCastPoint(parent, forward_duration)
end
if forward_duration <= 0 then
forward_duration = ability:GetSpecialValueFor("forward_duration")
if forward_duration <= 0 then
forward_duration = 1.0
end
end
local forward_duration_extra = ability:GetSpecialValueFor("forward_duration_extra")
if forward_duration_extra < 0 then
forward_duration_extra = 0
end
forward_duration = forward_duration + forward_duration_extra
local strike_interval = raptor_ability and raptor_ability:GetSpecialValueFor("strike_interval") or 0.25
if strike_interval <= 0 then
strike_interval = 0.25
end
local strikes = raptor_ability and raptor_ability:GetSpecialValueFor("strikes") or 4
if strikes <= 0 then
strikes = 4
end
local duration = forward_duration + strike_interval * strikes + KEZ_RAPTOR_RETURN_DELAY
local delay = ability:GetSpecialValueFor("dash_start_delay")
if delay < 0 then
delay = 0
end
KezUpgradeDebug(parent, "raptor start delay=" .. tostring(delay) ..
" forward_duration=" .. tostring(forward_duration) ..
" raptor_cast_point=" .. tostring(raptor_cast_point) ..
" cast_speed_pct=" .. tostring(cast_speed_pct) ..
" cast_time_multiplier=" .. tostring(cast_time_multiplier) ..
" cast_speed_sources=" .. tostring(cast_speed_sources) ..
" forward_duration_extra=" .. tostring(forward_duration_extra) ..
" adjusted_forward_duration=" .. tostring(forward_duration) ..
" strike_interval=" .. tostring(strike_interval) ..
" strikes=" .. tostring(strikes) ..
" duration=" .. tostring(duration))
local function add_dash()
if not parent or parent:IsNull() or not parent:IsAlive() then
KezUpgradeDebug(parent, "dash skipped: parent invalid/dead")
return nil
end
if not ability or ability:IsNull() then
KezUpgradeDebug(parent, "dash skipped: upgrade ability invalid")
return nil
end
if not ability:GetAutoCastState() then
KezUpgradeDebug(parent, "dash skipped: autocast off")
return nil
end
if parent:HasModifier("modifier_special_bonus_unique_kez_upgrade_dash") then
KezUpgradeDebug(parent, "dash skipped: already active")
return nil
end
KezUpgradeDebug(parent, "dash modifier add")
parent:AddNewModifier(parent, ability, "modifier_special_bonus_unique_kez_upgrade_dash", {
duration = duration,
forward_duration = forward_duration,
strike_interval = strike_interval,
strikes = strikes
})
return nil
end
if delay <= 0 then
return add_dash()
end
Timers:CreateTimer(delay, add_dash)
end
function modifier_special_bonus_unique_kez_upgrade:OnAbilityStart(params)
if not IsServer() then return end
local parent = self:GetParent()
if params.unit ~= parent then return end
local ability = self:GetAbility()
if not ability or ability:IsNull() then return end
local event_ability = params.ability
if not event_ability or event_ability:IsNull() then return end
local ability_name = event_ability:GetAbilityName()
if ability_name == "kez_raptor_dance" then
self:StartRaptorDash(parent, ability, event_ability)
end
end
function modifier_special_bonus_unique_kez_upgrade:OnAbilityExecuted(params)
if not IsServer() then return end
local parent = self:GetParent()
if params.unit ~= parent then return end
local ability = self:GetAbility()
if not ability or ability:IsNull() then return end
local event_ability = params.ability
if not event_ability or event_ability:IsNull() then return end
local ability_name = event_ability:GetAbilityName()
if ability_name == "kez_falcon_rush" then
local duration = event_ability:GetSpecialValueFor("duration")
if duration <= 0 then
duration = 4
end
local attack_range_bonus = duration * ability:GetSpecialValueFor("attack_range_per_second")
KezUpgradeDebug(parent, "falcon rush modifier add duration=" .. tostring(duration) ..
" attack_range_bonus=" .. tostring(attack_range_bonus))
parent:AddNewModifier(parent, ability, "modifier_special_bonus_unique_kez_upgrade_falcon_rush", {
duration = duration,
attack_range_bonus = attack_range_bonus
})
end
end
modifier_special_bonus_unique_kez_upgrade_dash = class({})
function modifier_special_bonus_unique_kez_upgrade_dash:IsHidden() return false end
function modifier_special_bonus_unique_kez_upgrade_dash:IsPurgable() return false end
function modifier_special_bonus_unique_kez_upgrade_dash:OnCreated(kv)
if not IsServer() then return end
local ability = self:GetAbility()
self.strike_speed_multiplier = ability and ability:GetSpecialValueFor("strike_speed_multiplier") or 3
if self.strike_speed_multiplier <= 0 then
self.strike_speed_multiplier = 3
end
self.forward_speed = ability and ability:GetSpecialValueFor("forward_speed") or 1500
if self.forward_speed <= 0 then
self.forward_speed = 1500
end
self.forward_duration = tonumber(kv.forward_duration) or 1.0
self.strike_interval = tonumber(kv.strike_interval) or 0.25
self.strikes = math.floor(tonumber(kv.strikes) or 4)
self.elapsed_total = 0
self.strike_elapsed = 0
self.strike_index = 0
self.return_elapsed = 0
self.return_started = false
self.elapsed_since_log = 0
local start_position = self:GetParent():GetAbsOrigin()
self.start_position = Vector(start_position.x, start_position.y, start_position.z)
self.has_returned = false
self.base_direction = self:GetParent():GetForwardVector():Normalized()
if self.base_direction:Length2D() < 0.01 then
self.base_direction = Vector(1, 0, 0)
end
self.direction = self.base_direction
self:StartIntervalThink(FrameTime())
KezUpgradeDebug(self:GetParent(), "dash created strike_speed_multiplier=" .. tostring(self.strike_speed_multiplier) ..
" forward_speed=" .. tostring(self.forward_speed) ..
" forward_duration=" .. tostring(self.forward_duration) ..
" strike_interval=" .. tostring(self.strike_interval) ..
" strikes=" .. tostring(self.strikes) ..
" duration=" .. tostring(self:GetRemainingTime()))
KezUpgradeDebug(self:GetParent(), "dash interval motion start")
end
function modifier_special_bonus_unique_kez_upgrade_dash:OnDestroy()
if not IsServer() then return end
KezUpgradeDebug(self:GetParent(), "dash destroy remaining=" .. tostring(self:GetRemainingTime()))
self:StartIntervalThink(-1)
local parent = self:GetParent()
if parent and not parent:IsNull() and parent:IsAlive() and self.start_position and not self.has_returned then
local return_pos = GetGroundPosition(self.start_position, parent)
parent:SetAbsOrigin(return_pos)
FindClearSpaceForUnit(parent, return_pos, false)
KezUpgradeDebug(parent, "dash returned to start on destroy")
return
end
if parent and not parent:IsNull() then
FindClearSpaceForUnit(parent, parent:GetAbsOrigin(), false)
end
end
function modifier_special_bonus_unique_kez_upgrade_dash:SetStrikeDirection(me)
local pattern_index = (self.strike_index % #KEZ_RAPTOR_DIRECTION_ANGLES) + 1
local angle = KEZ_RAPTOR_DIRECTION_ANGLES[pattern_index]
self.direction = RotatePosition(Vector(0, 0, 0), QAngle(0, angle, 0), self.base_direction):Normalized()
me:SetForwardVector(self.direction)
KezUpgradeDebug(me, "dash strike=" .. tostring(self.strike_index + 1) .. " angle=" .. tostring(angle))
end
function modifier_special_bonus_unique_kez_upgrade_dash:OnIntervalThink()
if not IsServer() then return end
local me = self:GetParent()
if not me or me:IsNull() or not me:IsAlive() then
self:Destroy()
return
end
local dt = FrameTime()
self.elapsed_total = self.elapsed_total + dt
local move_speed = self.forward_speed
if self.elapsed_total > self.forward_duration then
if self.strike_index >= self.strikes then
if not self.return_started then
self.return_started = true
self.return_elapsed = 0
KezUpgradeDebug(me, "dash return delay start")
end
self.return_elapsed = self.return_elapsed + dt
if self.return_elapsed >= KEZ_RAPTOR_RETURN_DELAY then
local return_pos = GetGroundPosition(self.start_position, me)
me:SetAbsOrigin(return_pos)
FindClearSpaceForUnit(me, return_pos, false)
self.has_returned = true
KezUpgradeDebug(me, "dash returned to start")
self:Destroy()
end
return
end
if self.strike_elapsed <= 0 then
self:SetStrikeDirection(me)
end
move_speed = me:GetIdealSpeed() * self.strike_speed_multiplier
self.strike_elapsed = self.strike_elapsed + dt
if self.strike_elapsed >= self.strike_interval then
self.strike_elapsed = 0
self.strike_index = self.strike_index + 1
end
end
local pos = me:GetAbsOrigin()
local new_pos = pos + self.direction * move_speed * dt
me:SetAbsOrigin(GetGroundPosition(new_pos, me))
self.elapsed_since_log = self.elapsed_since_log + dt
if self.elapsed_since_log >= 0.3 then
self.elapsed_since_log = 0
KezUpgradeDebug(me, "dash moving dt=" .. tostring(dt) ..
" elapsed=" .. tostring(self.elapsed_total) ..
" strike_index=" .. tostring(self.strike_index) ..
" remaining=" .. tostring(self:GetRemainingTime()))
end
end
function modifier_special_bonus_unique_kez_upgrade_dash:CheckState()
return {
[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
[MODIFIER_STATE_NO_UNIT_COLLISION] = true
}
end
modifier_special_bonus_unique_kez_upgrade_falcon_rush = class({})
function modifier_special_bonus_unique_kez_upgrade_falcon_rush:IsHidden() return false end
function modifier_special_bonus_unique_kez_upgrade_falcon_rush:IsPurgable() return true end
function modifier_special_bonus_unique_kez_upgrade_falcon_rush:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_special_bonus_unique_kez_upgrade_falcon_rush:OnCreated(kv)
self:OnRefresh(kv)
end
function modifier_special_bonus_unique_kez_upgrade_falcon_rush:OnRefresh(kv)
self.attack_range_bonus = tonumber(kv and kv.attack_range_bonus) or self.attack_range_bonus or 0
KezUpgradeDebug(self:GetParent(), "falcon rush refresh attack_range_bonus=" .. tostring(self.attack_range_bonus) ..
" duration_remaining=" .. tostring(self:GetRemainingTime()))
end
function modifier_special_bonus_unique_kez_upgrade_falcon_rush:DeclareFunctions()
return {
MODIFIER_PROPERTY_ATTACK_RANGE_BONUS
}
end
function modifier_special_bonus_unique_kez_upgrade_falcon_rush:GetPriority()
return MODIFIER_PRIORITY_HIGH
end
function modifier_special_bonus_unique_kez_upgrade_falcon_rush:GetModifierAttackRangeBonus()
return self.attack_range_bonus or 0
end
