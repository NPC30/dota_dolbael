yukari_twin_trains = class({})
LinkLuaModifier("modifier_train_1", "heroes/hero_yukari/yukari_twin_trains", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_train_2", "heroes/hero_yukari/yukari_twin_trains", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_train_exclusion", "heroes/hero_yukari/yukari_twin_trains", LUA_MODIFIER_MOTION_NONE)
local function TrainDamage(ability, target, projectile)
if not target then return end
if target:HasModifier("modifier_train_exclusion") then
return
end
local collision_damage = ability:GetSpecialValueFor("collision_damage")
local damageTable = {
victim = target,
attacker = ability:GetCaster(),
damage = collision_damage,
damage_type = ability:GetAbilityDamageType(),
ability = ability,
}
ApplyDamage(damageTable)
target:AddNewModifier(
ability:GetCaster(),
ability,
"modifier_stunned",
{ duration = ability:GetSpecialValueFor("stun_time") }
)
target:AddNewModifier(
ability:GetCaster(),
ability,
"modifier_train_exclusion",
{ duration = ability:GetSpecialValueFor("stun_time") }
)
local direction = ProjectileManager:GetLinearProjectileVelocity(projectile)
direction.z = 0
direction = direction:Normalized()
end
function yukari_twin_trains:OnSpellStart()
local caster = self:GetCaster()
if caster:HasModifier("modifier_train_1") then
self.point2 = self:GetCursorPosition()
local projectile_name = "particles/yukari_twin_train.vpcf"
local distance = (self.point2 - self.point):Length2D()
local projectile_distance = distance * 0.6
local projectile_speed = self:GetSpecialValueFor("projectile_speed")
local projectile_start_radius = self:GetSpecialValueFor("dragon_slave_width_initial")
local projectile_end_radius = self:GetSpecialValueFor("dragon_slave_width_end")
local delay = projectile_distance / projectile_speed + 0.2
local direction = self.point2 - self.point
self.point3 = (self.point + self.point2) * 0.5
direction.z = 0
local projectile_direction = direction:Normalized()
local info = {
Source = caster,
Ability = self,
vSpawnOrigin = self.point,
bProvidesVision = true,
iVisionRadius = 650,
iVisionTeamNumber = caster:GetTeamNumber(),
bDeleteOnHit = false,
iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
EffectName = projectile_name,
fDistance = projectile_distance,
fStartRadius = projectile_start_radius,
fEndRadius = projectile_end_radius,
vVelocity = projectile_direction * projectile_speed,
}
ProjectileManager:CreateLinearProjectile(info)
local direction2 = self.point - self.point2
direction2.z = 0
local projectile_direction2 = direction2:Normalized()
local info2 = {
Source = caster,
Ability = self,
vSpawnOrigin = self.point2,
bProvidesVision = true,
iVisionRadius = 650,
iVisionTeamNumber = caster:GetTeamNumber(),
bDeleteOnHit = false,
iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
EffectName = projectile_name,
fDistance = projectile_distance,
fStartRadius = projectile_start_radius,
fEndRadius = projectile_end_radius,
vVelocity = projectile_direction2 * projectile_speed,
}
ProjectileManager:CreateLinearProjectile(info2)
EmitSoundOn("yukari.twin_trains", caster)
local explosion_damage = self:GetSpecialValueFor("explosion_damage")
local radius = self:GetSpecialValueFor("explosion_radius")
Timers:CreateTimer(delay, function()
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
self.point3,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
0,
false
)
local damageTable = {
attacker = caster,
damage = explosion_damage,
damage_type = self:GetAbilityDamageType(),
ability = self,
damage_flags = DOTA_DAMAGE_FLAG_NONE,
}
for _, enemy in pairs(enemies) do
damageTable.victim = enemy
ApplyDamage(damageTable)
end
self:PlayEffects(radius)
end)
self:PlayEffects2(radius)
caster:RemoveModifierByName("modifier_train_1")
EmitSoundOn("ability_yukari_twin2", caster)
EmitSoundOn("ability_yukari_twin1", caster)
else
self.point = self:GetCursorPosition()
caster:AddNewModifier(caster, self, "modifier_train_1", { duration = 4 })
self:EndCooldown()
local radius = 350
self:PlayEffects1(radius)
self.sound_cast = "ability_yukari_01"
EmitSoundOn(self.sound_cast, self:GetCaster())
end
end
function yukari_twin_trains:PlayEffects(radius)
local particle_cast = "particles/yukari_twin_train_explosion.vpcf"
local effect_cast = ParticleManager:CreateParticle(particle_cast, PATTACH_WORLDORIGIN, self:GetCaster())
ParticleManager:SetParticleControl(effect_cast, 0, self.point3)
ParticleManager:SetParticleControl(effect_cast, 1, Vector(radius, radius, radius))
ParticleManager:ReleaseParticleIndex(effect_cast)
EmitSoundOn("yukari.trains_explosion", self:GetCaster())
end
function yukari_twin_trains:PlayEffects1(radius)
local particle_cast = "particles/yukari_portal228.vpcf"
self.sound_cast = "ability_yukari_01"
EmitSoundOn(self.sound_cast, self:GetCaster())
local effect_cast = ParticleManager:CreateParticle(particle_cast, PATTACH_WORLDORIGIN, self:GetCaster())
ParticleManager:SetParticleControl(effect_cast, 0, self.point)
ParticleManager:SetParticleControl(effect_cast, 1, Vector(radius, radius, radius))
ParticleManager:ReleaseParticleIndex(effect_cast)
end
function yukari_twin_trains:PlayEffects2(radius)
local particle_cast = "particles/yukari_portal228.vpcf"
self.sound_cast = "ability_yukari_01"
EmitSoundOn(self.sound_cast, self:GetCaster())
local effect_cast = ParticleManager:CreateParticle(particle_cast, PATTACH_WORLDORIGIN, self:GetCaster())
ParticleManager:SetParticleControl(effect_cast, 0, self.point2)
ParticleManager:SetParticleControl(effect_cast, 1, Vector(radius, radius, radius))
ParticleManager:ReleaseParticleIndex(effect_cast)
end
function yukari_twin_trains:OnProjectileHitHandle(target, location, projectile)
TrainDamage(self, target, projectile)
end
modifier_train_1 = class({})
function modifier_train_1:OnDestroy(kv)
if not IsServer() then return end
local ability = self:GetParent():FindAbilityByName("yukari_twin_trains")
ability:StartCooldown(ability:GetCooldown(-1) * self:GetParent():GetCooldownReduction())
end
modifier_train_2 = class({})
function modifier_train_2:OnCreated(kv)
local caster = self:GetParent()
local projectile_name = "particles/yukari_train.vpcf"
local projectile_distance = 3000
local projectile_speed = self:GetAbility():GetSpecialValueFor("projectile_speed")
local projectile_start_radius = 350
local projectile_end_radius = 350
local point = kv.place
local direction = point - self:GetParent():GetOrigin()
direction.z = 0
local projectile_direction = direction:Normalized()
local info = {
Source = caster,
Ability = self,
vSpawnOrigin = self:GetParent():GetAbsOrigin(),
bDeleteOnHit = false,
iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
EffectName = projectile_name,
fDistance = projectile_distance,
fStartRadius = projectile_start_radius,
fEndRadius = projectile_end_radius,
vVelocity = projectile_direction * projectile_speed,
bProvidesVision = true,
iVisionRadius = 650,
iVisionTeamNumber = caster:GetTeamNumber(),
}
ProjectileManager:CreateLinearProjectile(info)
local radius = self:GetAbility():GetSpecialValueFor("explosion_radius")
local debuffDuration = 1
self:PlayEffects1(caster, radius, debuffDuration)
self.sound_cast = "ability_yukari_01"
EmitSoundOn(self.sound_cast, self:GetCaster())
end
function modifier_train_2:OnProjectileHitHandle(target, location, projectile)
TrainDamage(self, target, projectile)
end
function modifier_train_2:PlayEffects1(caster, radius, duration)
local particle_cast = "particles/yukari_portal3.vpcf"
local sound_cast = ""
local effect_cast = ParticleManager:CreateParticle(particle_cast, PATTACH_ABSORIGIN_FOLLOW, caster)
ParticleManager:ReleaseParticleIndex(effect_cast)
end
modifier_train_exclusion = class({})
