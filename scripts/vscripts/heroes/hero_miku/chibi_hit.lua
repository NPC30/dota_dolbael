chibi_hit = class({})
function chibi_hit:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local modifier = caster:FindModifierByNameAndCaster( "modifier_dragon_knight_elder_dragon_form_lua", caster )
if not modifier then
self:Hit( target, false )
local sound_cast = ""
EmitSoundOn( sound_cast, caster )
return
end
local projectile_name = "particles/units/heroes/hero_dragon_knight/dragon_knight_dragon_tail_dragonform_proj.vpcf"
local projectile_speed = self:GetSpecialValueFor( "projectile_speed" )
local info = {
Target = target,
Source = caster,
Ability = self,
iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_2,
EffectName = projectile_name,
iMoveSpeed = projectile_speed,
bDodgeable = true,
}
ProjectileManager:CreateTrackingProjectile(info)
end
function chibi_hit:Hit( target, dragonform )
local caster = self:GetCaster()
local damage = self:GetAbilityDamage()
local duration = self:GetSpecialValueFor( "stun_duration" )
local damageTable = {
victim = target,
attacker = caster,
damage = damage,
damage_type = self:GetAbilityDamageType(),
ability = self,
}
ApplyDamage(damageTable)
local duration = duration * (1 - target:GetStatusResistance())
target:AddNewModifier(
caster,
self,
"modifier_stunned",
{ duration = duration }
)
self:PlayEffects( target, dragonform )
if caster:HasModifier("modifier_miku_arcana") then
local sound_cast = "miku.strike_arcana"
EmitSoundOn( sound_cast, target )
else
local sound_cast = "miku.5_5.3d"
EmitSoundOn( sound_cast, target )
end
end
function chibi_hit:OnProjectileHit( target, location )
if not target then return end
self:Hit( target, true )
end
function chibi_hit:PlayEffects( target, dragonform )
local caster = self:GetCaster()
if caster:HasModifier("modifier_miku_arcana") then
self.particle_cast = "particles/chibi_hit_calne.vpcf"
else
self.particle_cast = "particles/chibi_hit.vpcf"
end
local vec = target:GetOrigin()-self:GetCaster():GetOrigin()
local attach = "attach_attack1"
if dragonform then
attach = "attach_attack2"
end
local effect_cast = ParticleManager:CreateParticle( self.particle_cast, PATTACH_ABSORIGIN_FOLLOW, target )
ParticleManager:SetParticleControl( effect_cast, 3, vec )
ParticleManager:SetParticleControlEnt(
effect_cast,
2,
self:GetCaster(),
PATTACH_POINT_FOLLOW,
attach,
Vector(0,0,0),
true
)
ParticleManager:SetParticleControlEnt(
effect_cast,
4,
target,
PATTACH_POINT_FOLLOW,
"attach_hitloc",
Vector(0,0,0),
true
)
ParticleManager:ReleaseParticleIndex( effect_cast )
end
