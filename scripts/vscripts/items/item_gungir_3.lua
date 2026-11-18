item_gungir_3 = class({})
local GUNGIR_3_TALISMAN_ITEMS = {
item_zhuque = true,
}
local GUNGIR_3_MAX_LEVEL = 10
local GUNGIR_3_PULL_SPREAD = 96
local GUNGIR_3_PULL_DURATION = 0.35
local GUNGIR_3_INITIAL_PULL_COUNT = 3
local GUNGIR_3_MAX_PULL_COUNT = 13
local GUNGIR_3_KILL_ASSIST_PER_PULL = 30
local GUNGIR_3_INTERNAL_COOLDOWN = 1.0
local GUNGIR_3_PROJECTILE_SPEED = 1750
LinkLuaModifier("modifier_item_gungir_3", "items/item_gungir_3", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_gungir_3_root", "items/item_gungir_3", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_gungir_3_pull", "items/item_gungir_3", LUA_MODIFIER_MOTION_HORIZONTAL)
function item_gungir_3:GetIntrinsicModifierName()
return "modifier_item_gungir_3"
end
function item_gungir_3:GetAOERadius()
return self:GetSpecialValueFor("radius") + self:GetSpecialValueFor("bonus_aoe")
end
function item_gungir_3:OnSpellStart()
if not self:IsInternalCooldownReady() then
return
end
self.gungir3_next_active_time = GameRules:GetGameTime() + GUNGIR_3_INTERNAL_COOLDOWN
local caster = self:GetCaster()
self:EnsureGungir3Level()
local target_point = self:GetCursorPosition()
local radius = self:GetAOERadius()
if self:GetAutoCastState() then
self:ConsumeDroppedTalismans(target_point, radius)
return
end
local damage = self:GetSpecialValueFor("active_damage")
local duration = self:GetSpecialValueFor("duration")
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
target_point,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
local has_enemy_hero = false
for _, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() and enemy:IsAlive() and enemy:IsHero() then
has_enemy_hero = true
break
end
end
EmitSoundOn("DOTA_Item.Gleipnir.Activate", caster)
EmitSoundOnLocationWithCaster(target_point, "Hero_Dark_Seer.Vacuum", caster)
self:CreateCastEffects(target_point, radius)
local pull_targets = self:SelectPullTargets(enemies, self:GetPullUnitCount())
for _, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() and enemy:IsAlive() then
self:LaunchGleipnirProjectile(enemy)
ApplyDamage({
victim = enemy,
attacker = caster,
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = self
})
enemy:AddNewModifier(caster, self, "modifier_item_gungir_3_root", {
duration = duration * (1 - enemy:GetStatusResistance())
})
if pull_targets[enemy:entindex()] then
self:PullEnemyToCenter(enemy, target_point)
end
end
end
Timers:CreateTimer(GUNGIR_3_PULL_DURATION + 0.03, function()
ResolveNPCPositions(target_point, GUNGIR_3_PULL_SPREAD)
end)
if not has_enemy_hero then
self:ConsumeDroppedTalismans(target_point, radius)
end
end
function item_gungir_3:GetPullUnitCount()
local kill_assist_count = self.gungir3_kill_assist_count or 0
local bonus_count = math.floor(kill_assist_count / GUNGIR_3_KILL_ASSIST_PER_PULL)
return math.min(GUNGIR_3_MAX_PULL_COUNT, GUNGIR_3_INITIAL_PULL_COUNT + bonus_count)
end
function item_gungir_3:IsInternalCooldownReady()
local next_active_time = self.gungir3_next_active_time or 0
return GameRules:GetGameTime() >= next_active_time
end
function item_gungir_3:SelectPullTargets(enemies, pull_count)
local pull_targets = {}
local selected_count = 0
for _, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() and enemy:IsAlive() and self:IsPullPriorityHero(enemy) then
pull_targets[enemy:entindex()] = true
selected_count = selected_count + 1
if selected_count >= pull_count then
return pull_targets
end
end
end
for _, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() and enemy:IsAlive() and not self:IsPullPriorityHero(enemy) then
pull_targets[enemy:entindex()] = true
selected_count = selected_count + 1
if selected_count >= pull_count then
return pull_targets
end
end
end
return pull_targets
end
function item_gungir_3:IsPullPriorityHero(unit)
return unit:IsRealHero() or unit:IsHero()
end
function item_gungir_3:CreateCastEffects(target_point, radius)
local gleipnir_particle = ParticleManager:CreateParticle(
"particles/items3_fx/gleipnir_active.vpcf",
PATTACH_WORLDORIGIN,
nil
)
ParticleManager:SetParticleControl(gleipnir_particle, 0, target_point)
ParticleManager:SetParticleControl(gleipnir_particle, 1, Vector(radius, radius, radius))
ParticleManager:ReleaseParticleIndex(gleipnir_particle)
local vacuum_particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_dark_seer/dark_seer_vacuum.vpcf",
PATTACH_WORLDORIGIN,
nil
)
ParticleManager:SetParticleControl(vacuum_particle, 0, target_point)
ParticleManager:SetParticleControl(vacuum_particle, 1, Vector(radius, 0, 0))
ParticleManager:ReleaseParticleIndex(vacuum_particle)
end
function item_gungir_3:LaunchGleipnirProjectile(target)
local caster = self:GetCaster()
if not caster or caster:IsNull() or not target or target:IsNull() then
return
end
ProjectileManager:CreateTrackingProjectile({
Target = target,
Source = caster,
Ability = self,
EffectName = "particles/items3_fx/gleipnir_projectile.vpcf",
iMoveSpeed = GUNGIR_3_PROJECTILE_SPEED,
bDodgeable = false,
bProvidesVision = false,
iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
})
end
function item_gungir_3:PullEnemyToCenter(enemy, target_point)
local pull_position = target_point + RandomVector(RandomInt(0, GUNGIR_3_PULL_SPREAD))
enemy:Interrupt()
enemy:AddNewModifier(self:GetCaster(), self, "modifier_item_gungir_3_pull", {
duration = GUNGIR_3_PULL_DURATION,
x = pull_position.x,
y = pull_position.y,
z = pull_position.z
})
end
function item_gungir_3:ConsumeDroppedTalismans(target_point, radius)
local caster = self:GetCaster()
if not caster or caster:IsNull() then
return
end
local current_level = self:EnsureGungir3Level()
if current_level >= GUNGIR_3_MAX_LEVEL then
return
end
local item_drops = Entities:FindAllByClassname("dota_item_drop")
local consumed_count = 0
for _, item_drop in pairs(item_drops) do
if current_level + consumed_count >= GUNGIR_3_MAX_LEVEL then
break
end
if item_drop and not item_drop:IsNull() then
local item = item_drop:GetContainedItem()
if item and not item:IsNull() then
local distance = (item_drop:GetAbsOrigin() - target_point):Length2D()
if GUNGIR_3_TALISMAN_ITEMS[item:GetName()] and distance <= radius then
item:RemoveSelf()
item_drop:RemoveSelf()
consumed_count = consumed_count + 1
end
end
end
end
if consumed_count <= 0 then
return
end
self:UpgradeGungir3(consumed_count)
EmitSoundOn("Item.TomeOfKnowledge", caster)
end
function item_gungir_3:UpgradeGungir3(levels_to_add)
local current_level = self:EnsureGungir3Level()
local target_level = math.min(GUNGIR_3_MAX_LEVEL, current_level + levels_to_add)
if target_level <= current_level then
return
end
self:SetLevel(target_level)
local caster = self:GetCaster()
if caster and not caster:IsNull() then
local modifier = caster:FindModifierByName("modifier_item_gungir_3")
if modifier and not modifier:IsNull() then
modifier:ForceRefresh()
end
end
end
function item_gungir_3:EnsureGungir3Level()
local current_level = math.max(self:GetLevel(), 1)
if self:GetLevel() < 1 then
self:SetLevel(current_level)
end
return current_level
end
modifier_item_gungir_3 = class({})
function modifier_item_gungir_3:IsHidden() return false end
function modifier_item_gungir_3:IsPurgable() return false end
function modifier_item_gungir_3:RemoveOnDeath() return false end
function modifier_item_gungir_3:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_gungir_3:OnCreated()
if IsServer() then
local ability = self:GetAbility()
if ability and not ability:IsNull() and ability.gungir3_kill_assist_count == nil then
ability.gungir3_kill_assist_count = 0
end
self.last_kill_assist_total = self:GetOwnerKillAssistTotal()
self:StartIntervalThink(1.0)
end
self:OnRefresh()
end
function modifier_item_gungir_3:OnRefresh()
if IsServer() then
local ability = self:GetAbility()
local parent = self:GetParent()
if ability and not ability:IsNull() and parent and not parent:IsNull() then
parent:RemoveModifierByName("modifier_item_gungir")
parent:AddNewModifier(parent, ability, "modifier_item_gungir", {})
self:SetStackCount(ability:GetPullUnitCount())
end
end
end
function modifier_item_gungir_3:OnDestroy()
if IsServer() then
local parent = self:GetParent()
Timers:CreateTimer(0, function()
if parent and not parent:IsNull() and not parent:HasModifier("modifier_item_gungir_3") and not parent:HasModifier("modifier_item_forbidden_staff") then
parent:RemoveModifierByName("modifier_item_gungir")
end
end)
end
end
function modifier_item_gungir_3:DeclareFunctions()
return {
MODIFIER_PROPERTY_TOOLTIP
}
end
function modifier_item_gungir_3:OnTooltip()
return self:GetStackCount()
end
function modifier_item_gungir_3:OnIntervalThink()
local ability = self:GetAbility()
if not ability or ability:IsNull() then
return
end
local current_total = self:GetOwnerKillAssistTotal()
if self.last_kill_assist_total == nil or current_total < self.last_kill_assist_total then
self.last_kill_assist_total = current_total
return
end
local delta = current_total - self.last_kill_assist_total
if delta > 0 then
ability.gungir3_kill_assist_count = (ability.gungir3_kill_assist_count or 0) + delta
self.last_kill_assist_total = current_total
self:SetStackCount(ability:GetPullUnitCount())
end
end
function modifier_item_gungir_3:GetTexture()
return "item_gungir_3"
end
function modifier_item_gungir_3:GetOwnerKillAssistTotal()
local parent = self:GetParent()
if not parent or parent:IsNull() then
return 0
end
local player_id = parent:GetPlayerOwnerID()
if player_id == nil or player_id < 0 then
return 0
end
return PlayerResource:GetKills(player_id) + PlayerResource:GetAssists(player_id)
end
modifier_item_gungir_3_root = class({})
function modifier_item_gungir_3_root:IsHidden() return false end
function modifier_item_gungir_3_root:IsDebuff() return true end
function modifier_item_gungir_3_root:IsPurgable() return true end
function modifier_item_gungir_3_root:CheckState()
return {
[MODIFIER_STATE_ROOTED] = true
}
end
function modifier_item_gungir_3_root:GetEffectName()
return "particles/items3_fx/gleipnir_root.vpcf"
end
function modifier_item_gungir_3_root:GetEffectAttachType()
return PATTACH_ABSORIGIN_FOLLOW
end
modifier_item_gungir_3_pull = class({})
function modifier_item_gungir_3_pull:IsHidden() return true end
function modifier_item_gungir_3_pull:IsPurgable() return false end
function modifier_item_gungir_3_pull:GetAttributes()
return MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_gungir_3_pull:OnCreated(kv)
if not IsServer() then
return
end
self.parent = self:GetParent()
self.start_position = self.parent:GetAbsOrigin()
self.target_position = Vector(kv.x or self.start_position.x, kv.y or self.start_position.y, kv.z or self.start_position.z)
self.elapsed = 0
self.duration = math.max(self:GetDuration(), 0.03)
if self:ApplyHorizontalMotionController() == false then
self:Destroy()
end
end
function modifier_item_gungir_3_pull:UpdateHorizontalMotion(me, dt)
if not IsServer() then
return
end
self.elapsed = self.elapsed + dt
local progress = math.min(self.elapsed / self.duration, 1.0)
local eased_progress = 1 - ((1 - progress) * (1 - progress))
local next_position = self.start_position + (self.target_position - self.start_position) * eased_progress
next_position.z = GetGroundHeight(next_position, self.parent)
me:SetAbsOrigin(next_position)
if progress >= 1.0 then
self:Destroy()
end
end
function modifier_item_gungir_3_pull:OnHorizontalMotionInterrupted()
if IsServer() then
self:Destroy()
end
end
function modifier_item_gungir_3_pull:OnDestroy()
if not IsServer() then
return
end
local parent = self:GetParent()
if parent and not parent:IsNull() then
parent:RemoveHorizontalMotionController(self)
FindClearSpaceForUnit(parent, parent:GetAbsOrigin(), true)
end
end
