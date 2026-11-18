if item_hawkeye_turret == nil then item_hawkeye_turret = class({}) end
LinkLuaModifier("modifier_item_hawkeye_turret_cooldown", "items/item_hawkeye_turret.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_hawkeye_turret", "items/item_hawkeye_turret.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_hawkeye_turret_stats", "items/item_hawkeye_turret.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_hawkeye_turret_active", "items/item_hawkeye_turret.lua", LUA_MODIFIER_MOTION_NONE)
function item_hawkeye_turret:GetIntrinsicModifierName()
return "modifier_item_hawkeye_turret"
end
function item_hawkeye_turret:OnSpellStart()
local caster = self:GetCaster()
if caster:HasModifier("modifier_item_hawkeye_turret_active") then
caster:RemoveModifierByName("modifier_item_hawkeye_turret_active")
caster:EmitSound("DOTA_Item.MoonShard.Consume")
else
caster:AddNewModifier(caster, self, "modifier_item_hawkeye_turret_active", {})
caster:EmitSound("Ability.AssassinateLoad")
end
end
if modifier_item_hawkeye_turret == nil then modifier_item_hawkeye_turret = class({}) end
function modifier_item_hawkeye_turret:IsHidden() return true end
function modifier_item_hawkeye_turret:IsPurgable() return false end
function modifier_item_hawkeye_turret:RemoveOnDeath() return false end
function modifier_item_hawkeye_turret:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_hawkeye_turret:OnCreated()
self:OnRefresh()
local ability = self:GetAbility()
if ability then
self.attack_radius = ability:GetSpecialValueFor("attack_radius") or 400
self.projectile_speed_bonus = ability:GetSpecialValueFor("projectile_speed_bonus") or 1000
self.attack_percent = ability:GetSpecialValueFor("attack_percent") or 60
self.internal_cooldown = ability:GetSpecialValueFor("internal_cooldown") or 0.05
else
self.attack_radius = 400
self.projectile_speed_bonus = 1000
self.attack_percent = 60
self.internal_cooldown = 0.05
end
if IsServer() then
if not self:GetAbility() then self:Destroy() end
end
end
function modifier_item_hawkeye_turret:OnRefresh()
self.stats_modifier_name = "modifier_item_hawkeye_turret_stats"
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_hawkeye_turret:OnDestroy()
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_hawkeye_turret:DeclareFunctions()
return {
MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
MODIFIER_PROPERTY_PROJECTILE_SPEED_BONUS,
}
end
function modifier_item_hawkeye_turret:GetModifierStatusResistanceStacking()
return self.bonus_status_resistance or 0
end
function modifier_item_hawkeye_turret:GetModifierProjectileSpeedBonus()
return self.projectile_speed_bonus or 1000
end
function modifier_item_hawkeye_turret:GetModifierProcAttack_Feedback(keys)
if not IsServer() then return end
if not keys.attacker:IsRealHero() or not keys.attacker:IsRangedAttacker() then return end
if keys.attacker:HasModifier("modifier_item_hawkeye_turret_cooldown") then return end
if keys.attacker:HasModifier("modifier_item_shotgun_cooldown") then return end
if keys.attacker:HasModifier("modifier_item_shotgun_v2_cooldown") then return end
if keys.attacker:GetTeam() == keys.target:GetTeam() then return end
if keys.target:IsBuilding() then return end
local ability = self:GetAbility()
local target_loc = keys.target:GetAbsOrigin()
local actual_damage = CalculateActualDamage(keys.damage, keys.target)
local damage = actual_damage * (self.attack_percent or 100) / 100
local enemies = FindUnitsInRadius(
keys.attacker:GetTeamNumber(),
target_loc,
nil,
self.attack_radius or 400,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
if enemy ~= keys.target then
ApplyDamage({
victim = enemy,
attacker = keys.attacker,
damage = damage,
damage_type = DAMAGE_TYPE_PURE,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION,
ability = ability,
})
end
end
keys.attacker:AddNewModifier(keys.attacker, ability, "modifier_item_hawkeye_turret_cooldown",
{ duration = self.internal_cooldown or 0.5 })
end
if modifier_item_hawkeye_turret_cooldown == nil then modifier_item_hawkeye_turret_cooldown = class({}) end
function modifier_item_hawkeye_turret_cooldown:IsDebuff() return false end
function modifier_item_hawkeye_turret_cooldown:IsHidden() return true end
function modifier_item_hawkeye_turret_cooldown:IsPurgable() return false end
function modifier_item_hawkeye_turret_cooldown:RemoveOnDeath() return true end
if modifier_item_hawkeye_turret_active == nil then modifier_item_hawkeye_turret_active = class({}) end
function modifier_item_hawkeye_turret_active:IsHidden() return false end
function modifier_item_hawkeye_turret_active:IsPurgable() return false end
function modifier_item_hawkeye_turret_active:RemoveOnDeath()
return true
end
function modifier_item_hawkeye_turret_active:OnCreated()
local parent = self:GetParent()
local ability = self:GetAbility()
if IsServer() then
self.vision_radius = parent:GetNightTimeVisionRange()
self.cone_angle = ability:GetSpecialValueFor("cone_angle") or 30
self.cone_length = self.vision_radius * (ability:GetSpecialValueFor("cone_length") or 1.5)
local parent_pos = parent:GetAbsOrigin()
local map_corners = {
Vector(-7000, 7000, 0),
Vector(7000, 7000, 0),
Vector(-7000, -7000, 0),
Vector(7000, -7000, 0)
}
local max_distance = 0
for _, corner in pairs(map_corners) do
local distance = (parent_pos - corner):Length2D()
if distance > max_distance then
max_distance = distance
end
end
print("[turret] max_distance", max_distance)
self.cone_length = math.min(self.cone_length, max_distance)
self.vision_points = {}
self.vision_interval = 600
self.moon_shard_count = (self.vision_radius - 800) / 200
local base_range = self:GetAbility():GetSpecialValueFor("active_attack_range")
local moon_bonus = self:GetAbility():GetSpecialValueFor("moon_shard_bonus")
local count = self.moon_shard_count or 0
if count <= 10 then
moon_bonus = count * moon_bonus
elseif count <= 20 then
moon_bonus = 10 * moon_bonus + (count - 10) * 60
elseif count <= 30 then
moon_bonus = 10 * moon_bonus + 10 * 60 + (count - 20) * 40
else
moon_bonus = 10 * moon_bonus + 10 * 60 + 10 * 40 +
(count - 30) * 30
end
self.total_range = base_range + moon_bonus
self:CreateConeVision()
self:StartIntervalThink(0.2)
self:SetHasCustomTransmitterData(true)
end
end
function modifier_item_hawkeye_turret_active:OnIntervalThink()
if not IsServer() then return end
self:UpdateConeVision()
end
function modifier_item_hawkeye_turret_active:CreateConeVision()
local parent = self:GetParent()
if not parent or not IsValidEntity(parent) then return end
self:ClearVision()
local forward = parent:GetForwardVector()
local parent_pos = parent:GetAbsOrigin()
local half_angle_rad = math.rad(self.cone_angle / 2)
local current_distance = 0
local overlap_ratio = 0.5
while current_distance < self.cone_length do
local vision_radius = current_distance * math.tan(half_angle_rad)
local min_interval = 200
local dynamic_interval = math.max(vision_radius * 2 * overlap_ratio, min_interval)
local vision_pos = parent_pos + forward * current_distance
local fow_viewer = AddFOWViewer(
parent:GetTeamNumber(),
vision_pos,
vision_radius,
0.4,
false
)
table.insert(self.vision_points, fow_viewer)
current_distance = current_distance + dynamic_interval
end
local final_vision_radius = self.cone_length * math.tan(half_angle_rad)
local final_vision_pos = parent_pos + forward * self.cone_length
local final_fow_viewer = AddFOWViewer(
parent:GetTeamNumber(),
final_vision_pos,
final_vision_radius,
0.4,
false
)
table.insert(self.vision_points, final_fow_viewer)
end
function modifier_item_hawkeye_turret_active:UpdateConeVision()
self:CreateConeVision()
end
function modifier_item_hawkeye_turret_active:ClearVision()
if self.vision_points then
for _, viewer in pairs(self.vision_points) do
if viewer then
RemoveFOWViewer(self:GetParent():GetTeamNumber(), viewer)
end
end
self.vision_points = {}
end
end
function modifier_item_hawkeye_turret_active:OnDestroy()
if not IsServer() then return end
self:ClearVision()
self:GetParent():SetForceAttackTarget(nil)
if self.particle then
ParticleManager:DestroyParticle(self.particle, false)
ParticleManager:ReleaseParticleIndex(self.particle)
end
end
function modifier_item_hawkeye_turret_active:DeclareFunctions()
return {
MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
MODIFIER_PROPERTY_TURN_RATE_PERCENTAGE,
}
end
function modifier_item_hawkeye_turret_active:CheckState()
return {
[MODIFIER_STATE_ROOTED] = true,
[MODIFIER_STATE_FLYING] = true,
}
end
function modifier_item_hawkeye_turret_active:GetModifierTurnRate_Percentage()
return -100
end
function modifier_item_hawkeye_turret_active:GetTexture()
return "yingyanpaotai"
end
function modifier_item_hawkeye_turret_active:GetModifierMoveSpeed_Absolute()
return 0
end
function modifier_item_hawkeye_turret_active:GetModifierPhysicalArmorBonus()
return self:GetAbility():GetSpecialValueFor("active_armor")
end
function modifier_item_hawkeye_turret_active:OnRefresh(params)
if not IsServer() then return end
if self.fow_viewer then
RemoveFOWViewer(self:GetParent():GetTeamNumber(), self.fow_viewer)
self.fow_viewer = nil
end
self:CreateVision()
end
function modifier_item_hawkeye_turret_active:CreateVision()
local parent = self:GetParent()
local ability = self:GetAbility()
if not parent or not IsValidEntity(parent) or not ability then return end
self.vision_radius = parent:GetNightTimeVisionRange()
self.moon_shard_count = (self.vision_radius - 800) / 200
self.fow_viewer = AddFOWViewer(
parent:GetTeamNumber(),
parent:GetAbsOrigin(),
self.vision_radius,
self:GetRemainingTime(),
false
)
end
function modifier_item_hawkeye_turret_active:AddCustomTransmitterData()
return {
total_range = self.total_range
}
end
function modifier_item_hawkeye_turret_active:HandleCustomTransmitterData(data)
self.total_range = data.total_range
end
function modifier_item_hawkeye_turret_active:GetModifierAttackRangeBonus()
return self.total_range
end
function modifier_item_hawkeye_turret_active:GetModifierProvidesFOWVision()
return 1
end
function modifier_item_hawkeye_turret_active:GetEffectName()
return "particles/econ/events/ti10/phase_boots_ti10.vpcf"
end
function modifier_item_hawkeye_turret_active:GetEffectAttachType()
return PATTACH_ABSORIGIN_FOLLOW
end
if modifier_item_hawkeye_turret_stats == nil then modifier_item_hawkeye_turret_stats = class({}) end
function modifier_item_hawkeye_turret_stats:IsHidden() return true end
function modifier_item_hawkeye_turret_stats:IsPurgable() return false end
function modifier_item_hawkeye_turret_stats:RemoveOnDeath() return false end
function modifier_item_hawkeye_turret_stats:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_hawkeye_turret_active:GetPriority()
return MODIFIER_PRIORITY_LOW
end
