LinkLuaModifier("modifier_death_burst_health_growth", "abilities/death_burst_health_growth", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_death_burst_health_rage", "abilities/death_burst_health_growth", LUA_MODIFIER_MOTION_NONE)
death_burst_health_growth = class({})
function death_burst_health_growth:GetIntrinsicModifierName()
return "modifier_death_burst_health_growth"
end
modifier_death_burst_health_growth = class({})
function modifier_death_burst_health_growth:IsHidden()
return false
end
function modifier_death_burst_health_growth:IsPurgable()
return false
end
function modifier_death_burst_health_growth:GetTexture()
return "SkeletonKing"
end
function modifier_death_burst_health_growth:DeclareFunctions()
return {
MODIFIER_EVENT_ON_DEATH,
MODIFIER_PROPERTY_HEALTH_BONUS
}
end
function modifier_death_burst_health_growth:OnCreated()
if not IsServer() then return end
self.permanent_health = 0
end
function modifier_death_burst_health_growth:OnDeath(params)
local should_add_rage = false
if params.unit == self:GetParent() then
local caster = self:GetParent()
local ability = self:GetAbility()
self:PlayDeathExplosion(caster)
local inner_radius = ability:GetSpecialValueFor("inner_radius")
local outer_radius = ability:GetSpecialValueFor("outer_radius")
local inner_damage_pct = ability:GetSpecialValueFor("inner_damage_pct")
local outer_damage_pct = ability:GetSpecialValueFor("outer_damage_pct")
local caster_attack_damage = caster:GetAverageTrueAttackDamage(nil)
local inner_damage = caster_attack_damage * inner_damage_pct / 100
local outer_damage = caster_attack_damage * outer_damage_pct / 100
local health_bonus_per_death = ability:GetSpecialValueFor("health_bonus_per_death") or 0
local health_bonus_per_kill = ability:GetSpecialValueFor("health_bonus_per_kill") or 0
local health_burst_kill = ability:GetSpecialValueFor("health_burst_kill") - health_bonus_per_kill
local total_bonus = health_bonus_per_death
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
outer_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
local killed_enemies = {}
local processed_enemies = {}
for _, enemy in pairs(enemies) do
local enemy_index = enemy:entindex()
if processed_enemies[enemy_index] then
else
processed_enemies[enemy_index] = true
local distance = (enemy:GetAbsOrigin() - caster:GetAbsOrigin()):Length2D()
local damage_to_apply = outer_damage
if distance <= inner_radius then
damage_to_apply = inner_damage
end
local damage_table = {
victim = enemy,
attacker = caster,
damage = damage_to_apply,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = ability
}
local pre_health = enemy:GetHealth()
ApplyDamage(damage_table)
if enemy:IsAlive() == false and pre_health > 0 then
table.insert(killed_enemies, enemy)
total_bonus = total_bonus + health_burst_kill
end
end
end
local old_permanent = self.permanent_health or 0
self.permanent_health = old_permanent + total_bonus
should_add_rage = true
self:UpdateTotalHealth()
elseif params.attacker == self:GetParent() then
local ability = self:GetAbility()
local health_bonus = 0
if not params.unit:IsRealHero() then
health_bonus = ability:GetSpecialValueFor("health_bonus_per_kill_unit") or 0
else
health_bonus = ability:GetSpecialValueFor("health_bonus_per_kill") or 0
should_add_rage = true
end
local old_permanent = self.permanent_health or 0
self.permanent_health = old_permanent + health_bonus
self:UpdateTotalHealth()
else
local parent = self:GetParent()
if params.unit and params.unit:IsRealHero() and not params.unit:IsReincarnating() then
local ability = self:GetAbility()
local assist_radius = ability:GetSpecialValueFor("assist_radius") or 900
local dist = (parent:GetAbsOrigin() - params.unit:GetAbsOrigin()):Length2D()
if dist <= assist_radius then
local half_bonus = math.floor((ability:GetSpecialValueFor("health_bonus_per_kill") or 0) / 2)
if half_bonus > 0 then
local old_permanent = self.permanent_health or 0
self.permanent_health = old_permanent + half_bonus
self:UpdateTotalHealth()
end
end
end
end
if should_add_rage then
self:AddRageStackAndRefreshDuration()
should_add_rage = false
end
end
function modifier_death_burst_health_growth:AddRageStackAndRefreshDuration()
local caster = self:GetParent()
local rage_modifier = caster:FindModifierByName("modifier_death_burst_health_rage")
local ability = self:GetAbility()
local max_stacks = ability:GetSpecialValueFor("rage_max_stacks") or 20
local duration = ability:GetSpecialValueFor("rage_duration") or 13.0
if not rage_modifier then
caster:AddNewModifier(caster, ability, "modifier_death_burst_health_rage", { duration = duration })
rage_modifier = caster:FindModifierByName("modifier_death_burst_health_rage")
end
if rage_modifier then
local current_stacks = rage_modifier:GetStackCount()
if current_stacks < max_stacks then
rage_modifier:IncrementStackCount()
rage_modifier:ForceRefresh()
end
rage_modifier:ForceRefresh()
self:UpdateTotalHealth()
end
end
function modifier_death_burst_health_growth:UpdateTotalHealth()
local permanent_health = self.permanent_health or 0
local caster = self:GetParent()
local rage_modifier = caster:FindModifierByName("modifier_death_burst_health_rage")
local ability = self:GetAbility()
local multiplier_per_stack = ability:GetSpecialValueFor("rage_multiplier") or 1.2
local total_health = permanent_health
if rage_modifier and rage_modifier:GetStackCount() > 0 then
local rage_stacks = rage_modifier:GetStackCount()
local multiplier = 1.0
for i = 1, rage_stacks do
multiplier = multiplier * multiplier_per_stack
end
total_health = permanent_health * multiplier
end
self:SetStackCount(total_health)
end
function modifier_death_burst_health_growth:GetModifierHealthBonus()
return self:GetStackCount()
end
function modifier_death_burst_health_growth:PlayDeathExplosion(caster)
local death_pos = caster:GetAbsOrigin()
local ability = self:GetAbility()
local effect_radius = ability:GetSpecialValueFor("outer_radius")
local particle = ParticleManager:CreateParticle(
"particles/neutral_fx/roshan_slam.vpcf",
PATTACH_WORLDORIGIN,
nil
)
ParticleManager:SetParticleControl(particle, 0, death_pos)
ParticleManager:SetParticleControl(particle, 1, Vector(effect_radius, effect_radius, effect_radius))
ParticleManager:ReleaseParticleIndex(particle)
EmitSoundOnLocationWithCaster(death_pos, "Hero_Techies.RemoteMine.Detonate", caster)
end
modifier_death_burst_health_rage = class({})
function modifier_death_burst_health_rage:IsHidden()
return false
end
function modifier_death_burst_health_rage:IsPurgable()
return false
end
function modifier_death_burst_health_rage:GetTexture()
return "SkeletonKing"
end
function modifier_death_burst_health_rage:RemoveOnDeath() return false end
function modifier_death_burst_health_rage:OnCreated(kv)
if not IsServer() then return end
local ability = self:GetAbility()
local duration = ability:GetSpecialValueFor("rage_duration") or 13.0
self:SetDuration(duration, true)
end
function modifier_death_burst_health_rage:OnRefresh(kv)
if not IsServer() then return end
local ability = self:GetAbility()
local duration = ability:GetSpecialValueFor("rage_duration") or 13.0
self:SetDuration(duration, true)
end
function modifier_death_burst_health_rage:OnDestroy()
if not IsServer() then return end
local caster = self:GetParent()
local health_modifier = caster:FindModifierByName("modifier_death_burst_health_growth")
if health_modifier then
health_modifier:UpdateTotalHealth()
end
end
function modifier_death_burst_health_rage:DeclareFunctions()
return {
MODIFIER_PROPERTY_MODEL_SCALE,
}
end
function modifier_death_burst_health_rage:GetModifierModelScale()
local rage_stacks = self:GetStackCount()
local scale = 30 + (rage_stacks * 20)
return scale
end
