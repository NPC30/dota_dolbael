modifier_miku_dance = class({})
function modifier_miku_dance:IsHidden()
return true
end
function modifier_miku_dance:IsDebuff()
return false
end
function modifier_miku_dance:IsPurgable()
return false
end
function modifier_miku_dance:OnCreated( kv )
self.damage = self:GetAbility():GetSpecialValueFor( "dance_damage" )
self.radius = self:GetAbility():GetSpecialValueFor( "dance_radius" )
self.interval = self:GetAbility():GetSpecialValueFor( "attack_interval" )
self.damageReduction = self:GetAbility():GetSpecialValueFor( "damage_reduction" )
self.stunDuration = self:GetAbility():GetSpecialValueFor( "stun_duration" )
if IsServer() then
self.active = true
self.damageTable = {
attacker = self:GetParent(),
damage = self.damage ,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = self:GetAbility(),
}
self:StartIntervalThink( self.interval )
self:OnIntervalThink()
self:PlayEffects( self.radius )
end
end
function modifier_miku_dance:OnRefresh( kv )
self.damage = self:GetAbility():GetSpecialValueFor( "dance_damage" )
self.radius = self:GetAbility():GetSpecialValueFor( "dance_radius" )
if IsServer() then
self.damageTable.damage = self.damage
self.active = kv.start
self:SetDuration( kv.duration, true )
end
end
function modifier_miku_dance:OnDestroy( kv )
if IsServer() then
self:StopEffects()
end
end
function modifier_miku_dance:DeclareFunctions()
local funcs = {
MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
}
return funcs
end
function modifier_miku_dance:GetModifierIncomingDamage_Percentage( params )
if IsServer() then
if self.active then
return self.damageReduction
end
end
end
function modifier_miku_dance:OnIntervalThink()
if self.active==0 then return end
local caster = self:GetCaster()
local enemies = FindUnitsInRadius(
self:GetParent():GetTeamNumber(),
self:GetParent():GetOrigin(),
nil,
self.radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
0,
0,
false
)
for _,enemy in pairs(enemies) do
self.damageTable.victim = enemy
ApplyDamage( self.damageTable )
local duration = self.stunDuration * (1 - enemy:GetStatusResistance())
enemy:AddNewModifier(
caster,
self,
"modifier_stunned",
{ duration = duration }
)
caster:AddNewModifier(caster, self, "modifier_tidehunter_anchor_smash_caster", {})
caster:PerformAttack(
enemy,
true,
true,
true,
false,
true,
false,
true)
caster:RemoveModifierByName("modifier_tidehunter_anchor_smash_caster")
end
if self.effect_cast then
ParticleManager:SetParticleControl( self.effect_cast, 0, self:GetParent():GetOrigin() )
end
end
function modifier_miku_dance:PlayEffects( radius )
self.caster = self:GetCaster()
if self.caster:HasModifier("modifier_miku_arcana") then
self.particle_cast = "particles/miku_song_aura_calne.vpcf"
self.sound_cast = "miku.4_calne_"..RandomInt(1,2)
else
self.particle_cast = "particles/miku_song_aura.vpcf"
self.sound_cast = "miku.song_"..RandomInt(1,3)
end
self.effect_cast = ParticleManager:CreateParticle( self.particle_cast, PATTACH_WORLDORIGIN, nil )
ParticleManager:SetParticleControl( self.effect_cast, 0, self:GetParent():GetOrigin() )
ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( radius, radius, radius ) )
EmitSoundOn( self.sound_cast, self:GetParent() )
end
function modifier_miku_dance:StopEffects()
ParticleManager:DestroyParticle( self.effect_cast, false )
ParticleManager:ReleaseParticleIndex( self.effect_cast )
local sound_cast = ""
StopSoundOn( "miku.song_1", self:GetParent() )
StopSoundOn( "miku.song_2", self:GetParent() )
StopSoundOn( "miku.song_3", self:GetParent() )
StopSoundOn( "miku.4_calne_1", self:GetParent() )
StopSoundOn( "miku.4_calne_2", self:GetParent() )
end
