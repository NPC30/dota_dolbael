modifier_defection = class({})
function modifier_defection:IsHidden()
return false
end
function modifier_defection:IsPurgable()
return false
end
function modifier_defection:IsPurgeException()
return false
end
function modifier_defection:RemoveOnDeath()
return false
end
function modifier_defection:IsDebuff()
return false
end
function modifier_defection:OnCreated(params)
if not IsServer() then return end
local parent = self:GetParent()
local playerID = parent:GetPlayerOwnerID()
_G.DefectionOriginalTeam = _G.DefectionOriginalTeam or {}
self.originalTeam = _G.DefectionOriginalTeam[playerID] or parent:GetTeam()
self.killCount = 0
local currentTeam = parent:GetTeam()
if currentTeam == DOTA_TEAM_GOODGUYS then
self:SetStackCount(1)
elseif currentTeam == DOTA_TEAM_BADGUYS then
self:SetStackCount(2)
elseif currentTeam == DOTA_TEAM_NEUTRALS then
self:SetStackCount(3)
end
self.visionRadius = 1800
AddFOWViewer(self.originalTeam, parent:GetAbsOrigin(), self.visionRadius, 0.1, false)
self:StartIntervalThink(0.1)
self:UpdateParticleEffect(currentTeam)
self:CreateGroundEffect(currentTeam)
end
function modifier_defection:CreateGroundEffect(team)
if self.ground_particle then
ParticleManager:DestroyParticle(self.ground_particle, false)
ParticleManager:ReleaseParticleIndex(self.ground_particle)
end
local ground_particle_name
local radius = 200
if team == DOTA_TEAM_GOODGUYS then
return
end
if team == DOTA_TEAM_BADGUYS then
ground_particle_name = "particles/yukari_twin_train_explosion.vpcf"
elseif team == DOTA_TEAM_NEUTRALS then
ground_particle_name = "particles/items3_fx/blink_overwhelming_burst.vpcf"
end
if ground_particle_name then
self.ground_particle = ParticleManager:CreateParticle(ground_particle_name, PATTACH_ABSORIGIN_FOLLOW,
self:GetParent())
ParticleManager:SetParticleControl(self.ground_particle, 0, self:GetParent():GetAbsOrigin())
ParticleManager:SetParticleControl(self.ground_particle, 1, Vector(radius, radius, radius))
self:AddParticle(self.ground_particle, false, false, -1, false, false)
end
end
function modifier_defection:UpdateParticleEffect(team)
if self.particle then
ParticleManager:DestroyParticle(self.particle, false)
ParticleManager:ReleaseParticleIndex(self.particle)
self.particle = nil
end
if self.particle_overhead then
ParticleManager:DestroyParticle(self.particle_overhead, false)
ParticleManager:ReleaseParticleIndex(self.particle_overhead)
self.particle_overhead = nil
end
if team == DOTA_TEAM_GOODGUYS then
return
end
local particle_name
local particle_overhead_name
if team == DOTA_TEAM_BADGUYS then
particle_name = "particles/units/heroes/hero_bane/bane_nightmare.vpcf"
particle_overhead_name = "particles/units/heroes/hero_templar_assassin/templar_assassin_refraction.vpcf"
elseif team == DOTA_TEAM_NEUTRALS then
particle_overhead_name = "particles/units/heroes/hero_templar_assassin/templar_assassin_refraction.vpcf"
end
if particle_name then
self.particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
self:AddParticle(self.particle, false, false, -1, false, false)
end
if particle_overhead_name then
self.particle_overhead = ParticleManager:CreateParticle(particle_overhead_name, PATTACH_OVERHEAD_FOLLOW,
self:GetParent())
ParticleManager:SetParticleControlEnt(
self.particle_overhead,
0,
self:GetParent(),
PATTACH_POINT_FOLLOW,
"attach_hitloc",
self:GetParent():GetOrigin(),
true
)
self:AddParticle(self.particle_overhead, false, false, -1, false, false)
end
end
function modifier_defection:OnIntervalThink()
if not IsServer() then return end
local parent = self:GetParent()
AddFOWViewer(self.originalTeam, parent:GetAbsOrigin(), self.visionRadius, 0.2, false)
end
function modifier_defection:DeclareFunctions()
return {
MODIFIER_EVENT_ON_HERO_KILLED,
MODIFIER_EVENT_ON_ATTACK_START,
MODIFIER_PROPERTY_DISABLE_TELEPORT,
MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
}
end
function modifier_defection:GetDisableTeleport()
if self:GetParent():GetTeam() == DOTA_TEAM_NEUTRALS then
return 1
end
return 0
end
function modifier_defection:GetModifierIncomingDamage_Percentage()
if not IsServer() then return 0 end
local parent = self:GetParent()
if parent:GetTeam() == DOTA_TEAM_NEUTRALS then
return -20
end
return 0
end
function modifier_defection:OnAttackStart(params)
if not IsServer() then return end
if params.attacker ~= self:GetParent() then return end
local target = params.target
if target and target:IsRealHero() then
local attackerPlayerID = self:GetParent():GetPlayerOwnerID()
_G.DefectionKillCount = _G.DefectionKillCount or {}
local killCount = _G.DefectionKillCount[attackerPlayerID] or 0
if killCount > 2 then
return
end
if target:GetTeam() == self.originalTeam and IsHumanPlayer(target:GetPlayerOwnerID()) then
self:GetParent():Stop()
return false
end
end
end
function modifier_defection:OnHeroKilled(params)
if not IsServer() then return end
local attacker = params.attacker
local target = params.target
if attacker ~= self:GetParent() then return end
if target and target:IsRealHero() then
local attackerPlayerID = attacker:GetPlayerOwnerID()
if target:GetTeam() == self.originalTeam then
_G.DefectionKillCount = _G.DefectionKillCount or {}
_G.DefectionKillCount[attackerPlayerID] = (_G.DefectionKillCount[attackerPlayerID] or 0) + 1
local killCount = _G.DefectionKillCount[attackerPlayerID]
end
end
end
function modifier_defection:CheckState()
local state = {
[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
}
return state
end
function modifier_defection:GetEffectAttachType()
return PATTACH_OVERHEAD_FOLLOW
end
function modifier_defection:GetTexture()
return "defection"
end
function modifier_defection:OnTooltip()
return self:GetStackCount()
end
