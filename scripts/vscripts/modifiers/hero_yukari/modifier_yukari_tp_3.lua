modifier_yukari_tp_3 = class({})
function modifier_yukari_tp_3:IsHidden()
return false
end
function modifier_yukari_tp_3:IsDebuff()
return self:GetCaster():GetTeamNumber() ~= self:GetParent():GetTeamNumber()
end
function modifier_yukari_tp_3:IsStunDebuff()
return true
end
function modifier_yukari_tp_3:IsPurgable()
return true
end
function modifier_yukari_tp_3:RemoveOnDeath()
return false
end
function modifier_yukari_tp_3:OnCreated(kv)
if not IsServer() then
return
end
local damage = self:GetAbility():GetSpecialValueFor("damage")
self.radius = self:GetAbility():GetSpecialValueFor("radius")
self.damageTable = {
attacker = self:GetCaster(),
damage = damage,
damage_type = self:GetAbility():GetAbilityDamageType(),
ability = self:GetAbility(),
}
self:GetParent():AddNoDraw()
self:PlayEffects()
end
function modifier_yukari_tp_3:OnRefresh(kv)
local damage = self:GetAbility():GetSpecialValueFor("damage")
self.radius = self:GetAbility():GetSpecialValueFor("radius")
if not IsServer() then
return
end
self.damageTable.damage = damage
end
function modifier_yukari_tp_3:OnRemoved()
end
function modifier_yukari_tp_3:OnDestroy()
if not IsServer() then
return
end
local targetUnit = self:GetParent()
targetUnit:SetOrigin(self.teleportLoc)
FindClearSpaceForUnit(targetUnit, self.teleportLoc, true)
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
for _, enemy in pairs(enemies) do
self.damageTable.victim = enemy
ApplyDamage(self.damageTable)
SendOverheadEventMessage(
nil,
OVERHEAD_ALERT_BONUS_SPELL_DAMAGE,
self:GetParent(),
self.damageTable.damage,
nil
)
end
self:GetParent():RemoveNoDraw()
local sound_loop = "ability_yukari_op"
StopSoundOn(sound_loop, self:GetCaster())
local sound_cast = "ability_yukari_op"
EmitSoundOnLocationWithCaster(self:GetParent():GetOrigin(), sound_cast, self:GetCaster())
local caster = self:GetCaster()
local knockback = { should_stun = 1,
knockback_duration = 0.5,
duration = 0.5,
knockback_distance = 0,
knockback_height = 300,
center_x = caster:GetAbsOrigin().x,
center_y = caster:GetAbsOrigin().y,
center_z = caster:GetAbsOrigin().z }
self:GetParent():AddNewModifier(caster, self, "modifier_knockback", knockback)
self:PlayEffects2()
end
function modifier_yukari_tp_3:CheckState()
local state = {
[MODIFIER_STATE_OUT_OF_GAME] = true,
[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
[MODIFIER_STATE_INVULNERABLE] = true,
[MODIFIER_STATE_STUNNED] = false,
}
return state
end
function modifier_yukari_tp_3:PlayEffects()
local particle_cast1 = "particles/yukari_portal.vpcf"
local particle_cast2 = ""
local sound_loop = "ability_yukari_op"
local effect_cast1 = ParticleManager:CreateParticle(particle_cast1, PATTACH_WORLDORIGIN, nil)
ParticleManager:SetParticleControl(effect_cast1, 0, self:GetParent():GetOrigin())
local effect_cast2 = ParticleManager:CreateParticleForTeam(particle_cast2, PATTACH_WORLDORIGIN, nil, self:GetCaster():GetTeamNumber())
ParticleManager:SetParticleControl(effect_cast2, 0, self:GetParent():GetOrigin())
self:AddParticle(
effect_cast1,
false,
false,
-1,
false,
false
)
self:AddParticle(
effect_cast2,
false,
false,
-1,
false,
false
)
EmitSoundOnLocationWithCaster(self:GetParent():GetOrigin(), sound_loop, self:GetCaster())
end
function modifier_yukari_tp_3:PlayEffects2()
local particle_cast1 = "particles/yukari_portal_out.vpcf"
local particle_cast2 = ""
local sound_loop = "yukari.portal_out"
local effect_cast1 = ParticleManager:CreateParticle(particle_cast1, PATTACH_WORLDORIGIN, nil)
ParticleManager:SetParticleControl(effect_cast1, 0, self:GetParent():GetOrigin())
local effect_cast2 = ParticleManager:CreateParticleForTeam(particle_cast2, PATTACH_WORLDORIGIN, nil, self:GetCaster():GetTeamNumber())
ParticleManager:SetParticleControl(effect_cast2, 0, self:GetParent():GetOrigin())
self:AddParticle(
effect_cast1,
false,
false,
-1,
false,
false
)
self:AddParticle(
effect_cast2,
false,
false,
-1,
false,
false
)
EmitSoundOnLocationWithCaster(self:GetParent():GetOrigin(), sound_loop, self:GetCaster())
end
