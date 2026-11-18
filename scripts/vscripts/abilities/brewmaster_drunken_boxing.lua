brewmaster_drunken_boxing = class({})
function brewmaster_drunken_boxing:OnSpellStart()
EmitSoundOn( "Hero_Brewmaster.Brawler.Cast", self:GetCaster() )
self:GetCaster():AddNewModifier(self:GetCaster(),self,"modifier_brewmaster_drunken_move",{duration=5})
end
function brewmaster_drunken_boxing:GetIntrinsicModifierName()
return "modifier_brewmaster_drunken_boxing"
end
modifier_brewmaster_drunken_move = class({})
LinkLuaModifier("modifier_brewmaster_drunken_move", "abilities/brewmaster_drunken_boxing", LUA_MODIFIER_MOTION_NONE)
function modifier_brewmaster_drunken_move:GetEffectName()
return "particles/units/heroes/hero_brewmaster/brewmaster_cinder_brew_debuff.vpcf"
end
function modifier_brewmaster_drunken_move:DeclareFunctions()
local funcs =
{
MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
}
return funcs
end
function modifier_brewmaster_drunken_move:GetModifierMoveSpeedBonus_Percentage()
return 30
end
function modifier_brewmaster_drunken_move:OnCreated(keys)
if not IsServer() then return end
self.cycle = 1
self.time = 0
self.dir = true
self.interval = 0.03
self:StartIntervalThink(self.interval)
end
function modifier_brewmaster_drunken_move:OnDestroy(keys)
if not IsServer() then return end
FindClearSpaceForUnit(self:GetParent(),self:GetParent():GetOrigin(),false)
end
function modifier_brewmaster_drunken_move:OnIntervalThink()
self.time = self.time + self.interval
if self.time>self.cycle then
self.time = 0
self.dir = not self.dir
self.cycle = RandomFloat(0.5,1.5)
end
local pos
local caster = self:GetCaster()
local move_speed = self:GetCaster():GetMoveSpeedModifier(self:GetCaster():GetBaseMoveSpeed(),false)
if self.dir then
pos = caster:GetOrigin()+self:GetCaster():GetLeftVector()*400*self.interval
else
pos = caster:GetOrigin()-self:GetCaster():GetLeftVector()*400*self.interval
end
self:GetCaster():SetOrigin(pos)
end
modifier_brewmaster_drunken_boxing = class({})
LinkLuaModifier("modifier_brewmaster_drunken_boxing", "abilities/brewmaster_drunken_boxing", LUA_MODIFIER_MOTION_NONE)
function modifier_brewmaster_drunken_boxing:IsHidden()return true end
function modifier_brewmaster_drunken_boxing:DeclareFunctions()
local funcs =
{
MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE,
MODIFIER_EVENT_ON_ATTACK_LANDED,
MODIFIER_PROPERTY_EVASION_CONSTANT,
}
return funcs
end
function modifier_brewmaster_drunken_boxing:GetModifierEvasion_Constant()
return 100
end
function modifier_brewmaster_drunken_boxing:GetModifierPreAttack_CriticalStrike()
local number = self:GetAbility():GetSpecialValueFor("miss")
if self:GetCaster():HasModifier("modifier_brewmaster_drunken_move") then
number = number*3
end
if RandomInt(1, 100) <= number then
self.is_critical = true
return self:GetAbility():GetSpecialValueFor("damage")
else
self.is_critical = false
end
end
function modifier_brewmaster_drunken_boxing:OnAttackLanded(keys)
if not IsServer() then return end
if keys.attacker == self:GetParent() and self.is_critical then
EmitSoundOn("Hero_Brewmaster.Brawler.Crit", keys.target)
end
end
