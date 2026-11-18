LinkLuaModifier("modifier_sniper_assassinate_target", "heroes/hero_sniper/sniper_assassinate_upgrade",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_assassinate_caster_crit", "heroes/hero_sniper/sniper_assassinate_upgrade",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_sniper_assassinate_upgrade_auto", "heroes/hero_sniper/sniper_assassinate_upgrade",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_sniper_assassinate_upgrade_auto_cooldown", "heroes/hero_sniper/sniper_assassinate_upgrade",
LUA_MODIFIER_MOTION_NONE)
sniper_assassinate_upgrade = class({})
function sniper_assassinate_upgrade:GetIntrinsicModifierName()
return "modifier_sniper_assassinate_upgrade_auto"
end
function sniper_assassinate_upgrade:GetAOERadius()
return self:GetSpecialValueFor("scepter_radius")
end
function sniper_assassinate_upgrade:OnUpgrade()
local caster = self:GetCaster()
local keen_scope = caster:FindAbilityByName("sniper_keen_scope")
if keen_scope then
keen_scope:SetLevel(self:GetLevel())
end
end
function sniper_assassinate_upgrade:OnSpellStart()
local caster = self:GetCaster()
local target_point = self:GetCursorPosition()
local radius = self:GetSpecialValueFor("scepter_radius")
local targets = FindUnitsInRadius(
caster:GetTeamNumber(),
target_point,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_INVULNERABLE +
DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS,
FIND_ANY_ORDER,
false
)
if #targets == 0 then
return
end
self.tTargets = targets
EmitSoundOn("Ability.Assassinate", caster)
local projectile_speed = self:GetSpecialValueFor("projectile_speed") or 3000
local first_target = targets[1]
local distance = (first_target:GetAbsOrigin() - caster:GetAbsOrigin()):Length2D()
local travel_time = (distance / projectile_speed) or 0.6
caster:AddNewModifier(caster, self, "modifier_assassinate_caster_crit", {})
for _, target in pairs(self.tTargets) do
caster:PerformAttack(target, true, true, true, false, true, false, true)
end
caster:RemoveModifierByName("modifier_assassinate_caster_crit")
end
function sniper_assassinate_upgrade:FireAssassinateProjectiles()
local caster = self:GetCaster()
local attack_particle = caster:GetRangedProjectileName()
if not attack_particle or attack_particle == "" then
attack_particle = "particles/units/heroes/hero_sniper/sniper_base_attack.vpcf"
end
for _, target in pairs(self.tTargets) do
caster:EmitSound("Hero_Sniper.AssassinateProjectile")
ProjectileManager:CreateTrackingProjectile({
Target = target,
Source = caster,
Ability = self,
EffectName = attack_particle,
iMoveSpeed = self:GetSpecialValueFor("projectile_speed"),
vSourceLoc = caster:GetAbsOrigin(),
bDrawsOnMinimap = false,
bDodgeable = true,
bIsAttack = true,
bVisibleToEnemies = true,
bReplaceExisting = false,
flExpireTime = GameRules:GetGameTime() + 10,
bProvidesVision = false,
})
target:AddNewModifier(caster, self, "modifier_sniper_assassinate_target", { Duration = 0.6 })
end
end
modifier_sniper_assassinate_upgrade_auto = class({})
function modifier_sniper_assassinate_upgrade_auto:IsHidden() return true end
function modifier_sniper_assassinate_upgrade_auto:IsPurgable() return false end
function modifier_sniper_assassinate_upgrade_auto:RemoveOnDeath() return false end
function modifier_sniper_assassinate_upgrade_auto:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ATTACK_LANDED
}
end
function modifier_sniper_assassinate_upgrade_auto:OnAttackLanded(keys)
local parent = self:GetParent()
if keys.attacker ~= parent then
return
end
local ability = self:GetAbility()
if not parent:IsRealHero() then
return
end
if not keys.target:IsRealHero() then
return
end
if parent:PassivesDisabled() then
return
end
if keys.inflictor and keys.inflictor:GetAbilityName() == "sniper_assassinate_upgrade" then
return
end
local crit_chance = 10
if self:GetAbility() then
crit_chance = self:GetAbility():GetSpecialValueFor("trigger_chance")
end
local roll = RandomFloat(0, 100)
if roll <= crit_chance then
if parent:HasModifier("modifier_sniper_assassinate_upgrade_auto_cooldown") then
return
end
ability:EndCooldown()
local target_point = keys.target:GetAbsOrigin()
parent:SetCursorPosition(target_point)
cast_success = parent:CastAbilityImmediately(ability, parent:GetPlayerOwnerID())
parent:AddNewModifier(parent, ability, "modifier_sniper_assassinate_upgrade_auto_cooldown", { duration = 0.3 })
end
end
modifier_sniper_assassinate_upgrade_auto_cooldown = class({})
function modifier_sniper_assassinate_upgrade_auto_cooldown:IsHidden() return true end
function modifier_sniper_assassinate_upgrade_auto_cooldown:IsPurgable() return false end
function modifier_sniper_assassinate_upgrade_auto_cooldown:RemoveOnDeath() return false end
modifier_sniper_assassinate_target = class({})
function modifier_sniper_assassinate_target:IsPurgable() return false end
function modifier_sniper_assassinate_target:DeclareFunctions() return { MODIFIER_EVENT_ON_DEATH } end
function modifier_sniper_assassinate_target:OnDeath(keys)
local hParent = self:GetParent()
if keys.target ~= hParent then return end
local hAbility = self:GetAbility()
if hAbility and hAbility.tTargets then
for i, v in ipairs(hAbility.tTargets) do
if v == hParent then
table.remove(hAbility.tTargets, i)
break
end
end
end
end
function modifier_sniper_assassinate_target:CheckState()
return {
[MODIFIER_STATE_INVISIBLE] = false,
[MODIFIER_STATE_PROVIDES_VISION] = true
}
end
function modifier_sniper_assassinate_target:OnCreated()
self.iParticle = ParticleManager:CreateParticleForTeam(
"particles/econ/items/sniper/sniper_charlie/sniper_crosshair_charlie.vpcf",
PATTACH_OVERHEAD_FOLLOW,
self:GetParent(),
self:GetCaster():GetTeamNumber()
)
end
function modifier_sniper_assassinate_target:OnDestroy()
ParticleManager:DestroyParticle(self.iParticle, true)
ParticleManager:ReleaseParticleIndex(self.iParticle)
end
modifier_assassinate_caster_crit = class({})
function modifier_assassinate_caster_crit:DeclareFunctions() return { MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE } end
function modifier_assassinate_caster_crit:GetModifierPreAttack_CriticalStrike()
return self:GetAbility():GetSpecialValueFor("scepter_crit_bonus")
end
