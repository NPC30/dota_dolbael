abaddon_phantom_charge = class({})
function abaddon_phantom_charge:OnSpellStart()
EmitSoundOn( "Hero_Abaddon.Curse.Proc", self:GetCaster() )
self:GetCaster():AddNewModifier(self:GetCaster(),self,"modifier_abaddon_phantom_charge",{duration=4}):SetStackCount(1)
local illusion = CreateIllusions(
self:GetCaster(),
self:GetCaster(),
{
outgoing_damage = -50,
incoming_damage = 100,
duration = 4,
},
2,
0,
false,
false
)
local angle = 30
local distance = 800
local dir = {
{RotatePosition(Vector(0,0,0),QAngle(0,angle,0),self:GetCaster():GetForwardVector()),RotatePosition(Vector(0,0,0),QAngle(0,-angle,0),self:GetCaster():GetForwardVector())},
{RotatePosition(Vector(0,0,0),QAngle(0,angle,0),self:GetCaster():GetForwardVector()),RotatePosition(Vector(0,0,0),QAngle(0,angle*2,0),self:GetCaster():GetForwardVector())},
{RotatePosition(Vector(0,0,0),QAngle(0,-angle,0),self:GetCaster():GetForwardVector()),RotatePosition(Vector(0,0,0),QAngle(0,-angle*2,0),self:GetCaster():GetForwardVector())}
}
local dir2 = dir[RandomInt(1,3)]
illusion[1]:AddNewModifier(self:GetCaster(),self,"modifier_abaddon_phantom_charge",{duration=4})
local table1 = {UnitIndex=illusion[1]:GetEntityIndex(),OrderType=DOTA_UNIT_ORDER_MOVE_TO_POSITION,Position=self:GetCaster():GetOrigin()+dir2[1]*distance,Queue=true}
ExecuteOrderFromTable(table1)
illusion[2]:AddNewModifier(self:GetCaster(),self,"modifier_abaddon_phantom_charge",{duration=4})
local table2 = {UnitIndex=illusion[2]:GetEntityIndex(),OrderType=DOTA_UNIT_ORDER_MOVE_TO_POSITION,Position=self:GetCaster():GetOrigin()+dir2[2]*distance,Queue=true}
ExecuteOrderFromTable(table2)
end
modifier_abaddon_phantom_charge = class({})
LinkLuaModifier("modifier_abaddon_phantom_charge", "abilities/abaddon_phantom_charge", LUA_MODIFIER_MOTION_NONE)
function modifier_abaddon_phantom_charge:DeclareFunctions()
local funcs =
{
MODIFIER_EVENT_ON_ATTACK_LANDED,
MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
}
return funcs
end
function modifier_abaddon_phantom_charge:CheckState()
local state = {
[MODIFIER_STATE_UNSLOWABLE] = true,
[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
}
return state
end
function modifier_abaddon_phantom_charge:GetModifierMoveSpeedBonus_Percentage()
return self:GetRemainingTime()/4*self:GetAbility():GetSpecialValueFor("movespeed")
end
function modifier_abaddon_phantom_charge:GetEffectName()
return "particles/units/heroes/hero_abaddon/abaddon_curse_frostmourne_debuff.vpcf"
end
function modifier_abaddon_phantom_charge:OnAttackLanded(keys)
if keys.attacker == self:GetParent() and self:GetStackCount()>0 and self:GetParent():IsRealHero() then
local ability = self:GetAbility()
keys.target:AddNewModifier(self:GetParent(),ability,"modifier_silence",{duration=ability:GetSpecialValueFor("silence_duration")})
self:SetStackCount(0)
local damage = ability:GetSpecialValueFor("damage") + self:GetParent():GetAverageTrueAttackDamage(nil)*ability:GetSpecialValueFor("ad")
local damageInfo =
{
victim = keys.target,
attacker = self:GetParent(),
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = self:GetAbility(),
}
ApplyDamage( damageInfo )
end
end
function modifier_abaddon_phantom_charge:GetModifierAttackSpeedBonus_Constant()
return 400*self:GetStackCount()
end
