LinkLuaModifier("modifier_special_bonus_unique_hoodwink_upgrade",
"abilities/special_bonus_unique_hoodwink_upgrade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_hoodwink_sharpshooter_awaken_monitor",
"abilities/special_bonus_unique_hoodwink_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_hoodwink_upgrade = class({})
function special_bonus_unique_hoodwink_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_hoodwink_upgrade"
end
modifier_special_bonus_unique_hoodwink_upgrade = class({})
function modifier_special_bonus_unique_hoodwink_upgrade:IsHidden()
return true
end
function modifier_special_bonus_unique_hoodwink_upgrade:IsDebuff()
return false
end
function modifier_special_bonus_unique_hoodwink_upgrade:IsPurgable()
return false
end
function modifier_special_bonus_unique_hoodwink_upgrade:RemoveOnDeath()
return false
end
function modifier_special_bonus_unique_hoodwink_upgrade:OnCreated()
if not IsServer() then return end
self.parent = self:GetParent()
self.ability = self:GetAbility()
self:GetAbilityValues()
end
function modifier_special_bonus_unique_hoodwink_upgrade:OnRefresh()
if not IsServer() then return end
self.ability = self:GetAbility()
self:GetAbilityValues()
end
function modifier_special_bonus_unique_hoodwink_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_START,
MODIFIER_EVENT_ON_ABILITY_EXECUTED,
}
end
function modifier_special_bonus_unique_hoodwink_upgrade:GetAbilityValues()
local ab = self.ability or self:GetAbility()
if not ab then
self.min_kill_chance_pct = 30
self.max_kill_chance_pct = 100
self.min_bonus_max_hp_pct = 5
self.max_bonus_max_hp_pct = 15
self.full_charge_time = 3
self.full_distance_pct = 80
self.fixed_cast_range = 3000
self.charge_timeout = 5
self.isolation_radius = 600
self.waist_deviation_deg = 45
return
end
self.min_kill_chance_pct = ab:GetSpecialValueFor("min_kill_chance_pct")
if not self.min_kill_chance_pct or self.min_kill_chance_pct < 0 then self.min_kill_chance_pct = 30 end
self.max_kill_chance_pct = ab:GetSpecialValueFor("max_kill_chance_pct")
if not self.max_kill_chance_pct or self.max_kill_chance_pct <= self.min_kill_chance_pct then self.max_kill_chance_pct = 100 end
self.min_bonus_max_hp_pct = ab:GetSpecialValueFor("min_bonus_max_hp_pct")
if not self.min_bonus_max_hp_pct or self.min_bonus_max_hp_pct < 0 then self.min_bonus_max_hp_pct = 5 end
self.max_bonus_max_hp_pct = ab:GetSpecialValueFor("max_bonus_max_hp_pct")
if not self.max_bonus_max_hp_pct or self.max_bonus_max_hp_pct < self.min_bonus_max_hp_pct then self.max_bonus_max_hp_pct = 15 end
self.full_charge_time = ab:GetSpecialValueFor("full_charge_time")
if not self.full_charge_time or self.full_charge_time <= 0 then self.full_charge_time = 3 end
self.full_distance_pct = ab:GetSpecialValueFor("full_distance_pct")
if not self.full_distance_pct or self.full_distance_pct <= 0 then self.full_distance_pct = 80 end
self.fixed_cast_range = ab:GetSpecialValueFor("fixed_cast_range")
if not self.fixed_cast_range or self.fixed_cast_range <= 0 then self.fixed_cast_range = 3000 end
self.charge_timeout = ab:GetSpecialValueFor("charge_timeout")
if not self.charge_timeout or self.charge_timeout <= 0 then self.charge_timeout = 5 end
self.isolation_radius = ab:GetSpecialValueFor("isolation_radius")
if not self.isolation_radius or self.isolation_radius <= 0 then self.isolation_radius = 600 end
self.waist_deviation_deg = ab:GetSpecialValueFor("waist_deviation_deg")
if not self.waist_deviation_deg or self.waist_deviation_deg <= 0 then self.waist_deviation_deg = 45 end
end
local function Clamp01(value)
if value <= 0 then return 0 end
if value >= 1 then return 1 end
return value
end
local function Lerp(a, b, t)
return a + (b - a) * t
end
local function Distance2D(a, b)
local delta = a - b
delta.z = 0
return delta:Length2D()
end
local function Normalize2D(vector)
local v = Vector(vector.x, vector.y, 0)
local length = v:Length2D()
if length <= 0.001 then return Vector(0, 0, 0) end
return v / length
end
function modifier_special_bonus_unique_hoodwink_upgrade:StartSharpshooterCharge(parent, sharpshooter)
self.sharpshooter_release_time = nil
local sequence = (self.sharpshooter_sequence or 0) + 1
self.sharpshooter_sequence = sequence
self.sharpshooter_charge = {
start_time = GameRules:GetGameTime(),
start_pos = Vector(parent:GetAbsOrigin().x, parent:GetAbsOrigin().y, parent:GetAbsOrigin().z),
cast_range = self.fixed_cast_range or 3000,
sequence = sequence,
}
Timers:CreateTimer(self.charge_timeout or 5, function()
local current_parent = self.parent or self:GetParent()
if not current_parent or current_parent:IsNull() or not current_parent:IsAlive() then return nil end
if self.sharpshooter_sequence ~= sequence or self.sharpshooter_release_time then return nil end
self:StartSharpshooterMonitor(current_parent, GameRules:GetGameTime())
return nil
end)
end
function modifier_special_bonus_unique_hoodwink_upgrade:OnAbilityStart(params)
if not IsServer() then return end
local parent = self.parent or self:GetParent()
if not parent or parent:IsNull() or not parent:IsAlive() then return end
if params.unit ~= parent then return end
local ab = params.ability
if not ab or ab:IsNull() then return end
if ab:GetAbilityName() ~= "hoodwink_sharpshooter" then return end
self:StartSharpshooterCharge(parent, ab)
end
function modifier_special_bonus_unique_hoodwink_upgrade:OnAbilityExecuted(params)
if not IsServer() then return end
local parent = self.parent or self:GetParent()
if not parent or parent:IsNull() or not parent:IsAlive() then return end
if params.unit ~= parent then return end
local ab = params.ability
if not ab or ab:IsNull() then return end
local ability_name = ab:GetAbilityName()
if ability_name == "hoodwink_sharpshooter" then
if not self.sharpshooter_charge then
self:StartSharpshooterCharge(parent, ab)
end
return
end
if ability_name ~= "hoodwink_sharpshooter_release" then return end
self:StartSharpshooterMonitor(parent, GameRules:GetGameTime())
end
function modifier_special_bonus_unique_hoodwink_upgrade:StartSharpshooterMonitor(parent, release_time)
local ability = self.ability or self:GetAbility()
if not ability or ability:IsNull() or ability:GetLevel() < 1 then return end
self.sharpshooter_release_time = release_time
local charge = self.sharpshooter_charge or {}
local monitor_duration = ability:GetSpecialValueFor("monitor_duration")
if not monitor_duration or monitor_duration <= 0 then monitor_duration = 2 end
parent:AddNewModifier(parent, ability, "modifier_hoodwink_sharpshooter_awaken_monitor", {
duration = monitor_duration,
start_time = charge.start_time or release_time,
start_x = charge.start_pos and charge.start_pos.x or parent:GetAbsOrigin().x,
start_y = charge.start_pos and charge.start_pos.y or parent:GetAbsOrigin().y,
start_z = charge.start_pos and charge.start_pos.z or parent:GetAbsOrigin().z,
release_time = release_time,
cast_range = charge.cast_range or 0,
})
end
modifier_hoodwink_sharpshooter_awaken_monitor = class({})
function modifier_hoodwink_sharpshooter_awaken_monitor:IsHidden()
return true
end
function modifier_hoodwink_sharpshooter_awaken_monitor:IsDebuff()
return false
end
function modifier_hoodwink_sharpshooter_awaken_monitor:IsPurgable()
return false
end
function modifier_hoodwink_sharpshooter_awaken_monitor:OnCreated(kv)
if not IsServer() then return end
self.parent = self:GetParent()
self.ability = self:GetAbility()
self.start_time = tonumber(kv.start_time) or GameRules:GetGameTime()
self.release_time = tonumber(kv.release_time) or GameRules:GetGameTime()
self.start_pos = Vector(tonumber(kv.start_x) or self.parent:GetAbsOrigin().x,
tonumber(kv.start_y) or self.parent:GetAbsOrigin().y,
tonumber(kv.start_z) or self.parent:GetAbsOrigin().z)
self.cast_range = tonumber(kv.cast_range) or 0
self:GetAbilityValues()
end
function modifier_hoodwink_sharpshooter_awaken_monitor:OnRefresh(kv)
if not IsServer() then return end
self:OnCreated(kv)
end
function modifier_hoodwink_sharpshooter_awaken_monitor:DeclareFunctions()
return {
MODIFIER_EVENT_ON_TAKEDAMAGE,
}
end
function modifier_hoodwink_sharpshooter_awaken_monitor:GetAbilityValues()
local ab = self.ability or self:GetAbility()
if not ab then
self.min_kill_chance_pct = 30
self.max_kill_chance_pct = 100
self.min_bonus_max_hp_pct = 5
self.max_bonus_max_hp_pct = 15
self.full_charge_time = 3
self.full_distance_pct = 80
self.fixed_cast_range = 3000
self.charge_timeout = 5
self.isolation_radius = 600
self.waist_deviation_deg = 45
return
end
self.min_kill_chance_pct = ab:GetSpecialValueFor("min_kill_chance_pct")
if not self.min_kill_chance_pct or self.min_kill_chance_pct < 0 then self.min_kill_chance_pct = 30 end
self.max_kill_chance_pct = ab:GetSpecialValueFor("max_kill_chance_pct")
if not self.max_kill_chance_pct or self.max_kill_chance_pct <= self.min_kill_chance_pct then self.max_kill_chance_pct = 100 end
self.min_bonus_max_hp_pct = ab:GetSpecialValueFor("min_bonus_max_hp_pct")
if not self.min_bonus_max_hp_pct or self.min_bonus_max_hp_pct < 0 then self.min_bonus_max_hp_pct = 5 end
self.max_bonus_max_hp_pct = ab:GetSpecialValueFor("max_bonus_max_hp_pct")
if not self.max_bonus_max_hp_pct or self.max_bonus_max_hp_pct < self.min_bonus_max_hp_pct then self.max_bonus_max_hp_pct = 15 end
self.full_charge_time = ab:GetSpecialValueFor("full_charge_time")
if not self.full_charge_time or self.full_charge_time <= 0 then self.full_charge_time = 3 end
self.full_distance_pct = ab:GetSpecialValueFor("full_distance_pct")
if not self.full_distance_pct or self.full_distance_pct <= 0 then self.full_distance_pct = 80 end
self.fixed_cast_range = ab:GetSpecialValueFor("fixed_cast_range")
if not self.fixed_cast_range or self.fixed_cast_range <= 0 then self.fixed_cast_range = 3000 end
self.charge_timeout = ab:GetSpecialValueFor("charge_timeout")
if not self.charge_timeout or self.charge_timeout <= 0 then self.charge_timeout = 5 end
self.isolation_radius = ab:GetSpecialValueFor("isolation_radius")
if not self.isolation_radius or self.isolation_radius <= 0 then self.isolation_radius = 600 end
self.waist_deviation_deg = ab:GetSpecialValueFor("waist_deviation_deg")
if not self.waist_deviation_deg or self.waist_deviation_deg <= 0 then self.waist_deviation_deg = 45 end
end
function modifier_hoodwink_sharpshooter_awaken_monitor:GetSharpshooterScaling(victim)
local parent = self.parent or self:GetParent()
local elapsed = (self.release_time or GameRules:GetGameTime()) - (self.start_time or GameRules:GetGameTime())
elapsed = math.min(math.max(elapsed, 0), self.charge_timeout or 5)
local start_pos = self.start_pos or parent:GetAbsOrigin()
local distance = Distance2D(start_pos, victim:GetAbsOrigin())
local cast_range = self.cast_range or 0
if cast_range <= 0 then cast_range = self.fixed_cast_range or 3000 end
local full_distance = cast_range * ((self.full_distance_pct or 80) / 100)
if full_distance <= 0 then full_distance = cast_range end
local distance_factor = Clamp01(distance / full_distance)
local charge_factor = Clamp01(elapsed / (self.full_charge_time or 3))
local factor = Clamp01((distance_factor + charge_factor) / 2)
local kill_chance = Lerp(self.min_kill_chance_pct or 30, self.max_kill_chance_pct or 100, factor)
local pure_pct = Lerp(self.min_bonus_max_hp_pct or 5, self.max_bonus_max_hp_pct or 15, factor)
return kill_chance, pure_pct, elapsed, distance, cast_range, factor
end
function modifier_hoodwink_sharpshooter_awaken_monitor:IsTargetIsolated(victim)
local radius = self.isolation_radius or 600
local allies = FindUnitsInRadius(
victim:GetTeamNumber(),
victim:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_FRIENDLY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
FIND_ANY_ORDER,
false
)
local count = 0
for _, ally in pairs(allies) do
if ally and not ally:IsNull() and ally:IsAlive() and not ally:IsIllusion() then
count = count + 1
if count > 1 then return false end
end
end
return true
end
function modifier_hoodwink_sharpshooter_awaken_monitor:IsWaistShot(victim)
local start_pos = self.start_pos or (self.parent and self.parent:GetAbsOrigin()) or victim:GetAbsOrigin()
local shot_from_target = Normalize2D(start_pos - victim:GetAbsOrigin())
if shot_from_target:Length2D() <= 0.001 then return false end
local target_forward = Normalize2D(victim:GetForwardVector())
if target_forward:Length2D() <= 0.001 then return false end
local side_tolerance = math.sin(math.rad(self.waist_deviation_deg or 45))
return math.abs(target_forward:Dot(shot_from_target)) <= side_tolerance
end
function modifier_hoodwink_sharpshooter_awaken_monitor:OnTakeDamage(params)
if not IsServer() then return end
local parent = self.parent or self:GetParent()
if not parent or parent:IsNull() then return end
if params.attacker ~= parent then return end
local inflictor = params.inflictor
if not inflictor or inflictor:IsNull() then return end
local iname = inflictor:GetAbilityName()
if iname ~= "hoodwink_sharpshooter" and iname ~= "hoodwink_sharpshooter_release" then return end
local victim = params.unit
if not victim or victim:IsNull() or not victim:IsAlive() then return end
if victim:GetTeamNumber() == parent:GetTeamNumber() then return end
if not victim:IsHero() or victim:IsIllusion() then return end
local ability = self.ability or self:GetAbility()
if not ability or ability:IsNull() then return end
local kill_chance, pure_pct, elapsed, distance, cast_range, factor = self:GetSharpshooterScaling(victim)
local is_waist_shot = self:IsWaistShot(victim)
local is_isolated = self:IsTargetIsolated(victim)
print(string.format(
"[HoodwinkAwaken] hit victim=%s elapsed=%.2f distance=%.1f cast_range=%.1f factor=%.3f kill_chance=%.1f pure_pct=%.1f waist=%s isolated=%s",
victim:GetUnitName(),
elapsed,
distance,
cast_range,
factor,
kill_chance,
pure_pct,
tostring(is_waist_shot),
tostring(is_isolated)
))
local max_hp = victim:GetMaxHealth()
if max_hp > 0 then
local bonus = max_hp * (pure_pct / 100)
if bonus > 0 then
ApplyDamage({
victim = victim,
attacker = parent,
damage = bonus,
damage_type = DAMAGE_TYPE_PURE,
ability = ability,
})
end
end
if is_waist_shot and is_isolated and victim:IsAlive() and RandomFloat(0, 100) <= kill_chance then
victim:Kill(ability, parent)
end
end
