miku_hadouken = class({})
function miku_hadouken:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local point = self:GetCursorPosition() + (caster:GetForwardVector() * 1)
if target then
point = target:GetOrigin()
end
if caster:HasModifier("modifier_chibi_monster") then
self.projectile_name = "particles/miku_hadouken_calne.vpcf"
self.sound_cast = "miku.1_calne.3d"
else
self.projectile_name = "particles/miku_hadouken.vpcf"
self.sound_cast = "miku.1.3d"
end
local projectile_distance = self:GetSpecialValueFor( "dragon_slave_distance" )
local projectile_speed = self:GetSpecialValueFor( "dragon_slave_speed" )
local projectile_start_radius = self:GetSpecialValueFor( "dragon_slave_width_initial" )
local projectile_end_radius = self:GetSpecialValueFor( "dragon_slave_width_end" )
local direction = point-caster:GetOrigin()
direction.z = 0
local projectile_direction = direction:Normalized()
local info = {
Source = caster,
Ability = self,
vSpawnOrigin = caster:GetAbsOrigin(),
bDeleteOnHit = false,
iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
EffectName = self.projectile_name,
fDistance = projectile_distance,
fStartRadius = projectile_start_radius,
fEndRadius = projectile_end_radius,
vVelocity = projectile_direction * projectile_speed,
fExpireTime = GameRules:GetGameTime() + 1.5,
bProvidesVision = false,
}
ProjectileManager:CreateLinearProjectile(info)
EmitSoundOn( self.sound_cast, self:GetCaster() )
end
function miku_hadouken:OnProjectileHitHandle( target, location, projectile )
if not target then return end
local damage = self:GetSpecialValueFor("damage")
local caster = self:GetCaster()
if caster:HasModifier("modifier_chibi_monster") then
damage = self:GetSpecialValueFor("damage_calne")
end
local damageTable = {
victim = target,
attacker = caster,
damage = damage,
damage_type = self:GetAbilityDamageType(),
ability = self,
}
ApplyDamage( damageTable )
if caster:HasModifier("modifier_item_aghanims_shard") then
local duration = self:GetSpecialValueFor("shard_stun") * (1 - target:GetStatusResistance())
target:AddNewModifier( caster, self, "modifier_stunned", {Duration = duration} )
end
local direction = ProjectileManager:GetLinearProjectileVelocity( projectile )
direction.z = 0
direction = direction:Normalized()
self:PlayEffects( target, direction )
end
function miku_hadouken:PlayEffects( target, direction )
local particle_cast = "particles/units/heroes/hero_lina/lina_spell_dragon_slave_impact.vpcf"
local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, target )
ParticleManager:SetParticleControlForward( effect_cast, 1, direction )
ParticleManager:ReleaseParticleIndex( effect_cast )
end
