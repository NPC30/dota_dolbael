pudge_meat_hook_lua_upgrade = class({})
modifier_meat_hook_lua = class({})
modifier_meat_hook_followthrough_lua = class({})
LinkLuaModifier("modifier_meat_hook_followthrough_lua", "abilities/pudge_meat_hook_lua_upgrade.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_meat_hook_lua", "abilities/pudge_meat_hook_lua_upgrade.lua", LUA_MODIFIER_MOTION_HORIZONTAL)
function modifier_meat_hook_lua:IsDebuff()
return true
end
function modifier_meat_hook_lua:IsStunDebuff()
return true
end
function modifier_meat_hook_lua:RemoveOnDeath()
return false
end
function modifier_meat_hook_lua:OnCreated(kv)
if IsServer() then
self.bMotionApplied = false
self.vStartPos = self:GetParent():GetOrigin()
self.flTotalDistance = 0
self.flDistanceToDamagePct = self:GetAbility():GetSpecialValueFor("distance_to_damage") or 0
if kv and kv.distance_damage_multiplier then
self.flDistanceToDamagePct = self.flDistanceToDamagePct * kv.distance_damage_multiplier
end
if kv and kv.damage_share then
self.flDistanceToDamagePct = self.flDistanceToDamagePct / math.max(kv.damage_share, 1)
end
self:StartIntervalThink(0.1)
if self:ApplyHorizontalMotionController() == false then
self:Destroy()
else
self.bMotionApplied = true
end
end
end
function modifier_meat_hook_lua:OnIntervalThink()
if IsServer() then
if self:GetAbility().hVictim ~= nil and self.flDistanceToDamagePct > 0 then
if self:GetCaster() ~= nil and self:GetParent() ~= nil then
if self:GetCaster():GetTeamNumber() == self:GetParent():GetTeamNumber() then
return
end
end
local vCurrentPos = self:GetParent():GetOrigin()
local flDistance = (vCurrentPos - self.vStartPos):Length2D()
local flNewDistance = flDistance - self.flTotalDistance
if flNewDistance > 0 then
local flDamagePct = (flNewDistance / 100) * self.flDistanceToDamagePct
local dragDamage = flDamagePct
if dragDamage > 0 then
local damage = {
victim = self:GetParent(),
attacker = self:GetCaster(),
damage = dragDamage,
damage_type = DAMAGE_TYPE_PURE,
ability = self:GetAbility()
}
local actualDamage = ApplyDamage(damage)
SendOverheadEventMessage(nil, OVERHEAD_ALERT_DAMAGE, self:GetParent(), math.floor(actualDamage), nil)
end
self.flTotalDistance = flDistance
end
end
end
end
function modifier_meat_hook_lua:DeclareFunctions()
local funcs = {
MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
}
return funcs
end
function modifier_meat_hook_lua:GetOverrideAnimation(params)
return ACT_DOTA_FLAIL
end
function modifier_meat_hook_lua:CheckState()
if IsServer() then
if self:GetCaster() ~= nil and self:GetParent() ~= nil then
if self:GetCaster():GetTeamNumber() ~= self:GetParent():GetTeamNumber() and (not self:GetParent():IsMagicImmune()) then
local state = {
[MODIFIER_STATE_STUNNED] = true,
}
return state
end
end
end
local state = {}
return state
end
function modifier_meat_hook_lua:UpdateHorizontalMotion(me, dt)
if IsServer() then
if self:GetAbility().hVictim ~= nil then
me:SetOrigin(self:GetAbility().vProjectileLocation)
local vToCaster = self:GetAbility().vStartPosition - self:GetCaster():GetOrigin()
local flDist = vToCaster:Length2D()
if self:GetAbility().bChainAttached == false and flDist > 128.0 then
self:GetAbility().bChainAttached = true
ParticleManager:SetParticleControlEnt(self:GetAbility().nChainParticleFXIndex, 0, self:GetCaster(),
PATTACH_CUSTOMORIGIN, "attach_hitloc", self:GetCaster():GetOrigin(), true)
ParticleManager:SetParticleControlEnt(self:GetAbility().nChainParticleFXIndex, 0,
self:GetAbility().vStartPosition + self:GetAbility().vHookOffset)
end
end
end
end
function modifier_meat_hook_lua:OnHorizontalMotionInterrupted()
if IsServer() then
if self:GetAbility().hVictim ~= nil then
ParticleManager:SetParticleControlEnt(self:GetAbility().nChainParticleFXIndex, 1, self:GetCaster(),
PATTACH_POINT_FOLLOW, "attach_weapon_chain_rt",
self:GetCaster():GetAbsOrigin() + self:GetAbility().vHookOffset, true)
self:Destroy()
end
end
end
function modifier_meat_hook_followthrough_lua:IsHidden()
return true
end
function modifier_meat_hook_followthrough_lua:IsPurgable()
return false
end
function modifier_meat_hook_followthrough_lua:CheckState()
local state = {
[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
}
return state
end
function pudge_meat_hook_lua_upgrade:OnAbilityPhaseStart()
self:GetCaster():StartGesture(ACT_DOTA_OVERRIDE_ABILITY_1)
return true
end
function pudge_meat_hook_lua_upgrade:OnAbilityPhaseInterrupted()
self:GetCaster():RemoveGesture(ACT_DOTA_OVERRIDE_ABILITY_1)
end
function pudge_meat_hook_lua_upgrade:GetCastRange()
local base_distance = self:GetSpecialValueFor("hook_base_distance")
local distance_per_strength = self:GetSpecialValueFor("hook_distance_per_strength")
local strength = self:GetCaster():GetStrength()
return base_distance + math.min(distance_per_strength * strength, 12000)
end
function pudge_meat_hook_lua_upgrade:OnSpellStart()
local caster = self:GetCaster()
if self:GetAutoCastState() then
self.bIgnoreAllies = true
else
self.bIgnoreAllies = false
end
self.bChainAttached = false
if self.hVictims ~= nil then
for _, victim in pairs(self.hVictims) do
if victim and not victim:IsNull() then
victim:InterruptMotionControllers(true)
end
end
elseif self.hVictim ~= nil then
self.hVictim:InterruptMotionControllers(true)
end
local base_distance = self:GetSpecialValueFor("hook_base_distance")
local distance_per_strength = self:GetSpecialValueFor("hook_distance_per_strength")
local strength = caster:GetStrength()
self.hook_damage = self:GetSpecialValueFor("hook_damage")
self.hook_speed = self:GetSpecialValueFor("hook_speed")
self.hook_width = self:GetSpecialValueFor("hook_width")
self.hook_damage_multiplier = 1
self.distance_damage_multiplier = 1
self.bSlowHook = caster:HasModifier("modifier_pudge_rot")
self.bSplitHook = caster:HasModifier("modifier_pudge_flesh_heap_block")
if self.bSlowHook then
local slow_speed_divisor = self:GetSpecialValueFor("slow_hook_speed_divisor")
if not slow_speed_divisor or slow_speed_divisor <= 0 then slow_speed_divisor = 3 end
self.hook_speed = self.hook_speed / slow_speed_divisor
self.hook_damage_multiplier = self:GetSpecialValueFor("slow_hook_damage_multiplier")
if not self.hook_damage_multiplier or self.hook_damage_multiplier <= 0 then self.hook_damage_multiplier = 3 end
self.distance_damage_multiplier = self:GetSpecialValueFor("slow_hook_distance_damage_multiplier")
if not self.distance_damage_multiplier or self.distance_damage_multiplier <= 0 then self.distance_damage_multiplier = self.hook_damage_multiplier end
end
self.hook_distance = base_distance + math.min(distance_per_strength * strength, 12000)
self.hook_followthrough_constant = self:GetSpecialValueFor("hook_followthrough_constant")
self.vision_radius = self:GetSpecialValueFor("vision_radius")
self.vision_duration = self:GetSpecialValueFor("vision_duration")
if caster and caster:IsHero() then
local hHook = caster:GetTogglableWearable(DOTA_LOADOUT_TYPE_WEAPON)
if hHook ~= nil then
hHook:AddEffects(EF_NODRAW)
end
end
self.vStartPosition = caster:GetOrigin()
self.vProjectileLocation = self.vStartPosition
local vDirection = self:GetCursorPosition() - self.vStartPosition
vDirection.z = 0.0
local vDirection = (vDirection:Normalized()) * self.hook_distance
self.vTargetPosition = self.vStartPosition + vDirection
local flFollowthroughDuration = (self.hook_distance / self.hook_speed * self.hook_followthrough_constant)
caster:AddNewModifier(caster, self, "modifier_meat_hook_followthrough_lua",
{ duration = flFollowthroughDuration })
self.vHookOffset = Vector(0, 0, 96)
local vHookTarget = self.vTargetPosition + self.vHookOffset
local vKillswitch = Vector(((self.hook_distance / self.hook_speed) * 2), 0, 0)
self.nChainParticleFXIndex = ParticleManager:CreateParticle("particles/units/heroes/hero_pudge/pudge_meathook.vpcf",
PATTACH_CUSTOMORIGIN, nil)
ParticleManager:SetParticleAlwaysSimulate(self.nChainParticleFXIndex)
ParticleManager:SetParticleControlEnt(self.nChainParticleFXIndex, 0, caster, PATTACH_POINT_FOLLOW,
"attach_weapon_chain_rt", caster:GetOrigin() + self.vHookOffset, true)
ParticleManager:SetParticleControl(self.nChainParticleFXIndex, 1, vHookTarget)
ParticleManager:SetParticleControl(self.nChainParticleFXIndex, 2,
Vector(self.hook_speed, self.hook_distance, self.hook_width))
ParticleManager:SetParticleControl(self.nChainParticleFXIndex, 3, vKillswitch)
ParticleManager:SetParticleControl(self.nChainParticleFXIndex, 4, Vector(1, 0, 0))
ParticleManager:SetParticleControl(self.nChainParticleFXIndex, 5, Vector(0, 0, 0))
ParticleManager:SetParticleControlEnt(self.nChainParticleFXIndex, 7, caster, PATTACH_CUSTOMORIGIN, nil,
caster:GetOrigin(), true)
EmitSoundOn("Hero_Pudge.AttackHookExtend", caster)
local targetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY
if not self.bIgnoreAllies then
targetTeam = DOTA_UNIT_TARGET_TEAM_BOTH
print("[DEBUG] Projectile set to target BOTH teams")
else
print("[DEBUG] Projectile set to target ENEMY only")
end
local info = {
Ability = self,
vSpawnOrigin = caster:GetOrigin(),
vVelocity = vDirection:Normalized() * self.hook_speed,
fDistance = self.hook_distance,
fStartRadius = self.hook_width,
fEndRadius = self.hook_width,
Source = caster,
iUnitTargetTeam = targetTeam,
iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_NOT_ANCIENTS +
DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
}
ProjectileManager:CreateLinearProjectile(info)
self.bRetracting = false
self.hVictim = nil
self.hVictims = {}
self.bDiedInHook = false
end
function pudge_meat_hook_lua_upgrade:GetSplitHookExtraTargets(primary)
local caster = self:GetCaster()
if not self.bSplitHook or not primary or primary:IsNull() or not caster or caster:IsNull() then return {} end
local flesh_stacks = caster:GetModifierStackCount("modifier_pudge_innate_graft_flesh", caster) or 0
if flesh_stacks <= 0 then
flesh_stacks = caster:GetModifierStackCount("modifier_pudge_innate_graft_flesh2", caster) or 0
end
local base_radius = self:GetSpecialValueFor("split_hook_base_radius")
if not base_radius or base_radius < 0 then base_radius = 100 end
local radius_per_stack = self:GetSpecialValueFor("split_hook_radius_per_stack")
if not radius_per_stack or radius_per_stack <= 0 then radius_per_stack = 1 end
local extra_target_count = self:GetSpecialValueFor("split_hook_extra_target_count")
if not extra_target_count or extra_target_count <= 0 then extra_target_count = 1 end
local radius = base_radius + flesh_stacks * radius_per_stack
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
primary:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_NOT_ANCIENTS,
FIND_CLOSEST,
false
)
local extra_targets = {}
for _, enemy in pairs(enemies) do
if enemy ~= primary and enemy ~= caster then
table.insert(extra_targets, enemy)
if #extra_targets >= extra_target_count then
break
end
end
end
return extra_targets
end
function pudge_meat_hook_lua_upgrade:DealHookDamage(target, damage)
if not target or target:IsNull() or target:GetTeamNumber() == self:GetCaster():GetTeamNumber() then return end
local damage_table = {
victim = target,
attacker = self:GetCaster(),
damage = damage,
damage_type = DAMAGE_TYPE_PURE,
ability = self
}
ApplyDamage(damage_table)
if not target:IsAlive() then
self.bDiedInHook = true
end
if not target:IsMagicImmune() then
target:Interrupt()
end
end
function pudge_meat_hook_lua_upgrade:OnProjectileHit(hTarget, vLocation)
if hTarget == self:GetCaster() then return false end
if hTarget ~= nil and hTarget:GetUnitName() == "witch_doctor_death_ward_datadriven" then return false end
if self.bIgnoreAllies and hTarget ~= nil and hTarget:GetTeamNumber() == self:GetCaster():GetTeamNumber() then
return false
end
if self.bRetracting == false then
if hTarget ~= nil and (not (hTarget:IsCreep() or hTarget:IsConsideredHero())) then
Msg("Target was invalid")
return false
end
if hTarget ~= nil and hTarget:GetName() == "npc_dota_creep_siege" then
return false
end
local bTargetPulled = false
if hTarget ~= nil then
EmitSoundOn("Hero_Pudge.AttackHookImpact", hTarget)
local caster = self:GetCaster()
local headshot = hTarget:GetTeamNumber() ~= caster:GetTeamNumber() and hTarget:HasModifier("modifier_meat_hook_lua")
local targets = {hTarget}
local extra_targets = self:GetSplitHookExtraTargets(hTarget)
for _, extra_target in pairs(extra_targets) do
table.insert(targets, extra_target)
end
local damage_share = #targets
local hook_damage = self.hook_damage * self.hook_damage_multiplier / damage_share
for _, target in pairs(targets) do
local hook_modifier = target:AddNewModifier(caster, self, "modifier_meat_hook_lua", {
distance_damage_multiplier = self.distance_damage_multiplier,
damage_share = damage_share
})
if hook_modifier and (not hook_modifier:IsNull()) and hook_modifier.bMotionApplied ~= false then
table.insert(self.hVictims, target)
end
if target == hTarget and headshot then
target:Kill(self, caster)
self.bDiedInHook = true
else
self:DealHookDamage(target, hook_damage)
end
local nFXIndex = ParticleManager:CreateParticle(
"particles/units/heroes/hero_pudge/pudge_meathook_impact.vpcf", PATTACH_CUSTOMORIGIN, target)
ParticleManager:SetParticleControlEnt(nFXIndex, 0, target, PATTACH_POINT_FOLLOW, "attach_hitloc",
caster:GetOrigin(), true)
ParticleManager:ReleaseParticleIndex(nFXIndex)
end
AddFOWViewer(self:GetCaster():GetTeamNumber(), hTarget:GetOrigin(), self.vision_radius, self.vision_duration,
false)
self.hVictim = hTarget
bTargetPulled = true
end
local vHookPos = self.vTargetPosition
local flPad = self:GetCaster():GetPaddedCollisionRadius()
if hTarget ~= nil then
vHookPos = hTarget:GetOrigin()
flPad = flPad + hTarget:GetPaddedCollisionRadius()
end
local vVelocity = self.vStartPosition - vHookPos
vVelocity.z = 0.0
local flDistance = vVelocity:Length2D() - flPad
vVelocity = vVelocity:Normalized() * self.hook_speed
local info = {
Ability = self,
vSpawnOrigin = vHookPos,
vVelocity = vVelocity,
fDistance = flDistance,
Source = self:GetCaster(),
}
ProjectileManager:CreateLinearProjectile(info)
self.vProjectileLocation = vHookPos
if hTarget ~= nil and (not hTarget:IsInvisible()) and bTargetPulled then
ParticleManager:SetParticleControlEnt(self.nChainParticleFXIndex, 1, hTarget, PATTACH_POINT_FOLLOW,
"attach_hitloc", hTarget:GetOrigin() + self.vHookOffset, true)
ParticleManager:SetParticleControl(self.nChainParticleFXIndex, 4, Vector(0, 0, 0))
ParticleManager:SetParticleControl(self.nChainParticleFXIndex, 5, Vector(1, 0, 0))
else
ParticleManager:SetParticleControlEnt(self.nChainParticleFXIndex, 1, self:GetCaster(), PATTACH_POINT_FOLLOW,
"attach_weapon_chain_rt", self:GetCaster():GetOrigin() + self.vHookOffset, true);
end
EmitSoundOn("Hero_Pudge.AttackHookRetract", hTarget)
if self:GetCaster():IsAlive() then
self:GetCaster():RemoveGesture(ACT_DOTA_OVERRIDE_ABILITY_1);
self:GetCaster():StartGesture(ACT_DOTA_CHANNEL_ABILITY_1);
end
self.bRetracting = true
else
if self:GetCaster() and self:GetCaster():IsHero() then
local hHook = self:GetCaster():GetTogglableWearable(DOTA_LOADOUT_TYPE_WEAPON)
if hHook ~= nil then
hHook:RemoveEffects(EF_NODRAW)
end
end
if self.hVictim ~= nil then
local vFinalHookPos = vLocation
local victims = self.hVictims or {self.hVictim}
for _, victim in pairs(victims) do
if victim and not victim:IsNull() then
victim:InterruptMotionControllers(true)
victim:RemoveModifierByName("modifier_meat_hook_lua")
local vVictimPosCheck = victim:GetOrigin() - vFinalHookPos
local flPad = self:GetCaster():GetPaddedCollisionRadius() + victim:GetPaddedCollisionRadius()
if vVictimPosCheck:Length2D() > flPad then
FindClearSpaceForUnit(victim, self.vStartPosition, false)
end
end
end
end
self.hVictim = nil
self.hVictims = {}
ParticleManager:DestroyParticle(self.nChainParticleFXIndex, true)
EmitSoundOn("Hero_Pudge.AttachHookRetractStop", self:GetCaster())
end
return true
end
function pudge_meat_hook_lua_upgrade:OnProjectileThink(vLocation)
self.vProjectileLocation = vLocation
end
function pudge_meat_hook_lua_upgrade:OnOwnerDied()
self:GetCaster():RemoveGesture(ACT_DOTA_OVERRIDE_ABILITY_1);
self:GetCaster():RemoveGesture(ACT_DOTA_CHANNEL_ABILITY_1);
end

