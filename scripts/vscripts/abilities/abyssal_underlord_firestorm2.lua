abyssal_underlord_firestorm2 = class({})
function abyssal_underlord_firestorm2:GetIntrinsicModifierName()
return "modifier_abyssal_underlord_firestorm2"
end
function abyssal_underlord_firestorm2:Precache(context)
PrecacheResource( "particle", "particles/units/heroes/heroes_underlord/abyssal_underlord_firestorm_wave.vpcf", context )
end
modifier_abyssal_underlord_firestorm2 = class({})
LinkLuaModifier("modifier_abyssal_underlord_firestorm2", "abilities/abyssal_underlord_firestorm2", LUA_MODIFIER_MOTION_NONE)
function modifier_abyssal_underlord_firestorm2:IsPurgable()return false end
function modifier_abyssal_underlord_firestorm2:DeclareFunctions()
local funcs =
{
MODIFIER_EVENT_ON_ATTACK_LANDED,
}
return funcs
end
function modifier_abyssal_underlord_firestorm2:OnAttackLanded(keys)
if IsServer() and keys.attacker == self:GetParent()then
self:IncrementStackCount()
if self:GetStackCount()>=self:GetAbility():GetSpecialValueFor("hit_count") then
self:SetStackCount(0)
EmitSoundOn( "Hero_AbyssalUnderlord.Firestorm", keys.target )
local Particle = ParticleManager:CreateParticle("particles/units/heroes/heroes_underlord/abyssal_underlord_firestorm_wave.vpcf",8,nil)
ParticleManager:SetParticleControl( Particle,0, keys.target:GetOrigin() )
ParticleManager:SetParticleControl( Particle,4, Vector(400,0,0 ) )
local caster = self:GetParent()
local units = FindUnitsInRadius(caster:GetTeamNumber(),keys.target:GetOrigin(),nil,self:GetAbility():GetSpecialValueFor("radius"),DOTA_UNIT_TARGET_TEAM_ENEMY,DOTA_UNIT_TARGET_BASIC+1,48,FIND_ANY_ORDER,false)
for k,v in pairs(units)do
local damage = self:GetAbility():GetSpecialValueFor("base_damage") + v:GetMaxHealth()*self:GetAbility():GetSpecialValueFor("max_damage")*0.01
local damageInfo ={victim = v,attacker = caster,damage = damage,damage_type = DAMAGE_TYPE_MAGICAL,ability = self:GetAbility()}
ApplyDamage( damageInfo )
end
end
end
end
