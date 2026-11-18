modifier_yukari_tp_2 = class({})
function modifier_yukari_tp_2:IsHidden()
return false
end
function modifier_yukari_tp_2:IsDebuff()
return self:GetCaster():GetTeamNumber()~=self:GetParent():GetTeamNumber()
end
function modifier_yukari_tp_2:IsStunDebuff()
return true
end
function modifier_yukari_tp_2:IsPurgable()
return true
end
function modifier_yukari_tp_2:RemoveOnDeath()
return false
end
function modifier_yukari_tp_2:OnCreated( kv )
local damage = self:GetAbility():GetSpecialValueFor( "damage_x" )
self.radius = 75
if not IsServer() then return end
self.damageTable = {
attacker = self:GetCaster(),
damage = damage,
damage_type = self:GetAbility():GetAbilityDamageType(),
ability = self:GetAbility(),
}
if not IsServer() then return end
local enemies = FindUnitsInRadius(
self:GetCaster():GetTeamNumber(),
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
SendOverheadEventMessage(
nil,
OVERHEAD_ALERT_BONUS_SPELL_DAMAGE,
self:GetParent(),
self.damageTable.damage,
nil
)
end
self:GetParent():AddNoDraw()
end
