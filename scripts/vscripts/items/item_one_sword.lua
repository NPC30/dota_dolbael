local FREEZE_MODIFIER = "modifier_faceless_void_chronosphere_freeze"
local MAGIC_IMMUNE_MODIFIER = "modifier_item_one_sword_magic_immune"
local PARTICLE_FREEZE_WAVE = "particles/units/heroes/hero_earthshaker/earthshaker_aftershock.vpcf"
local PARTICLE_CHARGE_FLASH = "particles/custom/goku/goku_super_saiyan.vpcf"
local PARTICLE_CASTING_AMBIENT = "particles/units/heroes/hero_leshrac/leshrac_pulse_nova_ambient.vpcf"
local PARTICLE_EXECUTION_BEAM = "particles/units/heroes/hero_lina/lina_spell_laguna_blade.vpcf"
local PARTICLE_JUDGMENT_LINK = "particles/units/heroes/hero_lion/lion_spell_mana_drain.vpcf"
local PARTICLE_AEGIS_AMBIENT = "particles/items_fx/aegis_lvl_1000_ambient.vpcf"
LinkLuaModifier("modifier_item_one_sword_tracker", "items/item_one_sword.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_one_sword_casting", "items/item_one_sword.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_one_sword_magic_immune", "items/item_one_sword.lua", LUA_MODIFIER_MOTION_NONE)
local function GetStackCount(ability)
if not ability then return 0 end
return ability.one_sword_stacks or ability:GetCurrentCharges() or 0
end
local function SetStackCount(ability, stacks)
if not ability then return end
stacks = math.max(0, math.floor(stacks or 0))
ability.one_sword_stacks = stacks
ability:SetCurrentCharges(stacks)
end
local function StartNormalCooldown(ability)
if not ability then return end
if ability.one_sword_releasing then return end
local cooldown = ability:GetSpecialValueFor("active_cooldown")
if cooldown <= 0 then
cooldown = ability:GetCooldown(-1)
end
if cooldown <= 0 then
cooldown = 60
end
local caster = ability:GetCaster()
if caster and not caster:IsNull() then
cooldown = cooldown * caster:GetCooldownReduction()
end
ability:EndCooldown()
ability:StartCooldown(cooldown)
end
local function DestroyParticleLater(particle, delay)
if not particle then return end
Timers:CreateTimer(delay or 0, function()
ParticleManager:DestroyParticle(particle, false)
ParticleManager:ReleaseParticleIndex(particle)
return nil
end)
end
local function ClearFreeze(ability)
if not ability or not ability.one_sword_freeze_modifiers then return end
for _, modifier in pairs(ability.one_sword_freeze_modifiers) do
if modifier and not modifier:IsNull() then
modifier:Destroy()
end
end
ability.one_sword_freeze_modifiers = nil
end
local function ClearJudgmentLinks(ability)
if not ability or not ability.one_sword_link_particles then return end
for _, particle in pairs(ability.one_sword_link_particles) do
ParticleManager:DestroyParticle(particle, false)
ParticleManager:ReleaseParticleIndex(particle)
end
ability.one_sword_link_particles = nil
ability.one_sword_last_link_target = nil
end
local SuppressActiveKill
local StartReleaseSequence
local function ResolvePendingExecutions(ability)
if not ability or not ability.one_sword_pending_executions then return end
local caster = ability:GetCaster()
if not caster or caster:IsNull() then return end
for _, execution in pairs(ability.one_sword_pending_executions) do
local target = execution.target
if target and not target:IsNull() and target:IsAlive() then
SuppressActiveKill(caster, target)
if execution.kill then
target:Kill(ability, caster)
if target:IsAlive() then
target:ForceKill(false)
end
elseif execution.damage and execution.damage > 0 then
ApplyDamage({
victim = target,
attacker = caster,
damage = execution.damage,
damage_type = DAMAGE_TYPE_PURE,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
ability = ability
})
end
end
end
ability.one_sword_pending_executions = nil
ability.one_sword_pending_execution_map = nil
end
local function CleanupSequence(ability)
if not ability then return end
if StartReleaseSequence and StartReleaseSequence(ability) then return end
ClearJudgmentLinks(ability)
ResolvePendingExecutions(ability)
ClearFreeze(ability)
if ability.one_sword_charge_particles then
for _, particle in pairs(ability.one_sword_charge_particles) do
ParticleManager:DestroyParticle(particle, false)
ParticleManager:ReleaseParticleIndex(particle)
end
ability.one_sword_charge_particles = nil
end
local caster = ability:GetCaster()
if caster and not caster:IsNull() then
if ability.one_sword_bkb_modifier and not ability.one_sword_bkb_modifier:IsNull() then
ability.one_sword_bkb_modifier:Destroy()
ability.one_sword_bkb_modifier = nil
end
if ability.one_sword_origin and caster:IsAlive() then
ability.one_sword_returned_to_origin = true
end
caster:RemoveModifierByName("modifier_item_one_sword_casting")
if ability.one_sword_origin and caster:IsAlive() then
local origin = ability.one_sword_origin
FindClearSpaceForUnit(caster, origin, true)
end
end
ability.one_sword_executing = false
ability.one_sword_initial_target = nil
ability.one_sword_waiting_for_manual_target = nil
ability.one_sword_window_token = (ability.one_sword_window_token or 0) + 1
ability.one_sword_bkb_modifier = nil
ability.one_sword_elevation_restored = nil
ability.one_sword_origin = nil
ability.one_sword_returned_to_origin = nil
ability.one_sword_pending_executions = nil
ability.one_sword_pending_execution_map = nil
ability.one_sword_last_link_target = nil
end
local function IsValidEnemyHero(caster, unit)
return caster
and unit
and not unit:IsNull()
and unit:IsAlive()
and unit:IsHero()
and not unit:IsIllusion()
and unit:GetTeamNumber() ~= caster:GetTeamNumber()
end
local function GetChainRadius(ability)
local radius = ability:GetSpecialValueFor("chain_radius")
if radius <= 0 then
radius = 2400
end
return radius
end
local function IsWithinChainRadius(ability, caster, target)
return (target:GetAbsOrigin() - caster:GetAbsOrigin()):Length2D() <= GetChainRadius(ability)
end
local function GetCastTarget(keys)
if keys and keys.target and not keys.target:IsNull() then
return keys.target
end
local ability = keys and keys.ability
if ability and ability.GetCursorTarget then
local target = ability:GetCursorTarget()
if target and not target:IsNull() then
return target
end
end
return nil
end
local function FindEnemyHeroes(caster, radius)
local result = {}
local seen = {}
local function TryAddEnemy(enemy)
if not IsValidEnemyHero(caster, enemy) then return end
if (enemy:GetAbsOrigin() - caster:GetAbsOrigin()):Length2D() > radius then return end
local key = tostring(enemy:entindex())
if seen[key] then return end
seen[key] = true
table.insert(result, enemy)
end
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
FIND_CLOSEST,
false
)
for _, enemy in pairs(enemies) do
TryAddEnemy(enemy)
end
for playerId = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
if PlayerResource:IsValidPlayerID(playerId) then
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
TryAddEnemy(hero)
end
end
table.sort(result, function(a, b)
return (a:GetAbsOrigin() - caster:GetAbsOrigin()):Length2D() < (b:GetAbsOrigin() - caster:GetAbsOrigin()):Length2D()
end)
return result
end
local function ApplyFreeze(ability, caster, targets)
local freeze_duration = ability:GetSpecialValueFor("freeze_duration")
if freeze_duration <= 0 then
freeze_duration = 20
end
ability.one_sword_freeze_modifiers = {}
for _, enemy in pairs(targets) do
if IsValidEnemyHero(caster, enemy) then
local resistance_scale = 1 - enemy:GetStatusResistance()
if resistance_scale <= 0 then
resistance_scale = 0.01
end
local modifier = enemy:AddNewModifier(caster, ability, FREEZE_MODIFIER, {
duration = freeze_duration / resistance_scale
})
if modifier then
table.insert(ability.one_sword_freeze_modifiers, modifier)
end
end
end
end
local function PlayFreezeWave(ability, caster)
local radius = ability:GetSpecialValueFor("target_radius")
if radius <= 0 then
radius = 1200
end
local particle = ParticleManager:CreateParticle(
PARTICLE_FREEZE_WAVE,
PATTACH_ABSORIGIN,
caster
)
ParticleManager:SetParticleControl(particle, 0, caster:GetAbsOrigin())
ParticleManager:SetParticleControl(particle, 1, Vector(radius, radius, radius))
ParticleManager:ReleaseParticleIndex(particle)
caster:EmitSound("Hero_EarthShaker.EchoSlamSmall")
end
local function PlayExecutionBeam(ability, caster, target)
if not caster or caster:IsNull() or not target or target:IsNull() then return end
local beam_particle = ParticleManager:CreateParticle(
PARTICLE_EXECUTION_BEAM,
PATTACH_CUSTOMORIGIN,
caster
)
ParticleManager:SetParticleControlEnt(
beam_particle,
0,
caster,
PATTACH_POINT_FOLLOW,
"attach_attack1",
caster:GetAbsOrigin(),
true
)
ParticleManager:SetParticleControlEnt(
beam_particle,
1,
target,
PATTACH_POINT_FOLLOW,
"attach_hitloc",
target:GetAbsOrigin(),
true
)
ParticleManager:ReleaseParticleIndex(beam_particle)
end
local function PlayExecutionEffects(ability, caster, target)
local caster_origin = caster:GetAbsOrigin()
local target_origin = target:GetAbsOrigin()
local direction = target_origin - caster_origin
if direction:Length2D() <= 1 then
direction = caster:GetForwardVector()
else
direction = direction:Normalized()
end
local behind_distance = ability:GetSpecialValueFor("blink_behind_distance")
if behind_distance <= 0 then
behind_distance = 160
end
local behind_position = target_origin + direction * behind_distance
local blink_delay = ability:GetSpecialValueFor("blink_delay")
if blink_delay <= 0 then
blink_delay = 0.12
end
Timers:CreateTimer(blink_delay, function()
if caster and not caster:IsNull() and caster:IsAlive() then
PlayExecutionBeam(ability, caster, target)
EmitSoundOn("Hero_Zuus.LightningBolt", target)
caster:SetAbsOrigin(behind_position)
caster:FaceTowards(target_origin)
local casting_modifier = caster:FindModifierByName("modifier_item_one_sword_casting")
if casting_modifier and casting_modifier.SetElevatedPosition then
casting_modifier:SetElevatedPosition()
end
end
return nil
end)
end
SuppressActiveKill = function(caster, target)
if not caster or not target then return end
target.one_sword_suppressed_killer = caster:entindex()
target.one_sword_suppressed_until = GameRules:GetGameTime() + 1
Timers:CreateTimer(1, function()
if target and not target:IsNull() then
target.one_sword_suppressed_killer = nil
target.one_sword_suppressed_until = nil
end
return nil
end)
end
local function GetExecuteDelay(ability)
local execute_delay = ability:GetSpecialValueFor("execute_delay")
if execute_delay <= 0 then
execute_delay = 0.2
end
return execute_delay
end
StartReleaseSequence = function(ability)
if not ability then return false end
if ability.one_sword_releasing then return true end
local executions = ability.one_sword_pending_executions
if not executions or #executions <= 0 then return false end
local caster = ability:GetCaster()
if not caster or caster:IsNull() then return false end
ability.one_sword_releasing = true
ability.one_sword_waiting_for_manual_target = nil
ability.one_sword_window_token = (ability.one_sword_window_token or 0) + 1
local interval = ability:GetSpecialValueFor("release_interval")
if interval <= 0 then
interval = 0.15
end
local execute_delay = GetExecuteDelay(ability)
for index, execution in ipairs(executions) do
Timers:CreateTimer((index - 1) * interval, function()
if not ability or ability:IsNull() then return nil end
local target = execution.target
if caster and not caster:IsNull() and caster:IsAlive()
and target and not target:IsNull() and target:IsAlive() then
PlayExecutionEffects(ability, caster, target)
Timers:CreateTimer(execute_delay, function()
if target and not target:IsNull() and target:IsAlive() then
SuppressActiveKill(caster, target)
if execution.kill then
target:Kill(ability, caster)
if target:IsAlive() then
target:ForceKill(false)
end
elseif execution.damage and execution.damage > 0 then
ApplyDamage({
victim = target,
attacker = caster,
damage = execution.damage,
damage_type = DAMAGE_TYPE_PURE,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
ability = ability
})
end
end
return nil
end)
end
return nil
end)
end
Timers:CreateTimer(#executions * interval + execute_delay + 0.05, function()
if ability and not ability:IsNull() then
ability.one_sword_pending_executions = nil
ability.one_sword_pending_execution_map = nil
ability.one_sword_releasing = nil
CleanupSequence(ability)
StartNormalCooldown(ability)
end
return nil
end)
return true
end
local function RestoreElevationAfterFirstHit(ability, caster)
if ability.one_sword_elevation_restored then return end
local casting_modifier = caster:FindModifierByName("modifier_item_one_sword_casting")
if casting_modifier and casting_modifier.StopElevation then
casting_modifier:StopElevation()
end
ability.one_sword_elevation_restored = true
end
local function CreateJudgmentLink(ability, from_target, to_target)
if not ability or not from_target or not to_target then return end
if from_target:IsNull() or to_target:IsNull() then return end
ability.one_sword_link_particles = ability.one_sword_link_particles or {}
local particle = ParticleManager:CreateParticle(
PARTICLE_JUDGMENT_LINK,
PATTACH_CUSTOMORIGIN,
nil
)
ParticleManager:SetParticleControlEnt(
particle,
0,
from_target,
PATTACH_POINT_FOLLOW,
"attach_hitloc",
from_target:GetAbsOrigin(),
true
)
ParticleManager:SetParticleControlEnt(
particle,
1,
to_target,
PATTACH_POINT_FOLLOW,
"attach_hitloc",
to_target:GetAbsOrigin(),
true
)
table.insert(ability.one_sword_link_particles, particle)
end
local function QueuePendingExecution(ability, target, kill, damage)
if not ability or not target or target:IsNull() then return false end
if not ability.one_sword_pending_executions then
ability.one_sword_pending_executions = {}
ability.one_sword_pending_execution_map = {}
end
local key = tostring(target:entindex())
if ability.one_sword_pending_execution_map[key] then
return false
end
local execution = {
target = target,
kill = kill,
damage = damage or 0
}
table.insert(ability.one_sword_pending_executions, execution)
ability.one_sword_pending_execution_map[key] = execution
local link_source = ability.one_sword_last_link_target
if not link_source then
link_source = ability:GetCaster()
end
if link_source
and not link_source:IsNull()
and link_source ~= target then
CreateJudgmentLink(ability, link_source, target)
end
ability.one_sword_last_link_target = target
return true
end
local function IsTargetPending(ability, target)
if not ability or not target or target:IsNull() then return false end
local pending_map = ability.one_sword_pending_execution_map
return pending_map and pending_map[tostring(target:entindex())] ~= nil
end
local function IsAutoChainEnabled(ability)
return ability and ability.one_sword_auto_chain_enabled == true
end
local function FindNextAutoTarget(ability, caster)
if not ability or not caster or caster:IsNull() then return nil end
local enemies = FindEnemyHeroes(caster, GetChainRadius(ability))
for _, enemy in pairs(enemies) do
if not IsTargetPending(ability, enemy) and IsWithinChainRadius(ability, caster, enemy) then
return enemy
end
end
return nil
end
local function ExecutePartialDamageAndFinish(ability, caster, target, stacks, execute_health)
ability.one_sword_waiting_for_manual_target = nil
ability.one_sword_window_token = (ability.one_sword_window_token or 0) + 1
SetStackCount(ability, 0)
caster:FaceTowards(target:GetAbsOrigin())
local damage = math.max(1, stacks * execute_health)
QueuePendingExecution(ability, target, false, damage)
CleanupSequence(ability)
StartNormalCooldown(ability)
end
local ExecuteTarget
local StartManualWindow
local function OpenNextConnectionWindow(ability)
if IsAutoChainEnabled(ability) then
StartManualWindow(ability)
return
end
Timers:CreateTimer(0.03, function()
if ability and not ability:IsNull() and ability.one_sword_executing then
StartManualWindow(ability)
end
return nil
end)
end
local function ToggleAutoChain(ability, caster)
if not ability or not caster then return end
ability.one_sword_auto_chain_enabled = not ability.one_sword_auto_chain_enabled
if ability.one_sword_auto_chain_enabled then
caster:EmitSound("General.ButtonClick")
else
caster:EmitSound("General.ButtonClickRelease")
end
ability:EndCooldown()
end
StartManualWindow = function(ability)
if not ability or ability:IsNull() or not ability.one_sword_executing then return end
if IsAutoChainEnabled(ability) then
ability.one_sword_waiting_for_manual_target = nil
ability.one_sword_window_token = (ability.one_sword_window_token or 0) + 1
local token = ability.one_sword_window_token
local auto_delay = ability:GetSpecialValueFor("auto_chain_delay")
if auto_delay <= 0 then
auto_delay = 0.8
end
Timers:CreateTimer(auto_delay, function()
if not ability or ability:IsNull() then return nil end
if not ability.one_sword_executing or ability.one_sword_window_token ~= token then return nil end
local caster = ability:GetCaster()
if not caster or caster:IsNull() or not caster:IsAlive() then
CleanupSequence(ability)
StartNormalCooldown(ability)
return nil
end
if GetStackCount(ability) <= 0 then
CleanupSequence(ability)
StartNormalCooldown(ability)
return nil
end
local next_target = FindNextAutoTarget(ability, caster)
if next_target then
ExecuteTarget(ability, next_target)
else
CleanupSequence(ability)
StartNormalCooldown(ability)
end
return nil
end)
return
end
local caster = ability:GetCaster()
if not caster or caster:IsNull() or not caster:IsAlive() or not FindNextAutoTarget(ability, caster) then
CleanupSequence(ability)
StartNormalCooldown(ability)
return
end
local window = ability:GetSpecialValueFor("chain_window")
if window <= 0 then
window = 1.5
end
ability:EndCooldown()
ability.one_sword_waiting_for_manual_target = true
ability.one_sword_window_token = (ability.one_sword_window_token or 0) + 1
local token = ability.one_sword_window_token
Timers:CreateTimer(window, function()
if not ability or ability:IsNull() then return nil end
if ability.one_sword_executing
and ability.one_sword_waiting_for_manual_target
and ability.one_sword_window_token == token then
ability.one_sword_waiting_for_manual_target = nil
CleanupSequence(ability)
StartNormalCooldown(ability)
end
return nil
end)
end
ExecuteTarget = function(ability, target)
if not ability or ability:IsNull() or not ability.one_sword_executing then return nil end
local caster = ability:GetCaster()
if not caster or caster:IsNull() or not caster:IsAlive() then
CleanupSequence(ability)
StartNormalCooldown(ability)
return nil
end
if not IsValidEnemyHero(caster, target) or not IsWithinChainRadius(ability, caster, target) then
CleanupSequence(ability)
StartNormalCooldown(ability)
return nil
end
local execute_health = ability:GetSpecialValueFor("execute_health_per_stack")
if execute_health <= 0 then
execute_health = 1000
end
local pending_key = tostring(target:entindex())
local already_pending = ability.one_sword_pending_execution_map
and ability.one_sword_pending_execution_map[pending_key]
if already_pending then
ability.one_sword_waiting_for_manual_target = nil
ability.one_sword_window_token = (ability.one_sword_window_token or 0) + 1
caster:FaceTowards(target:GetAbsOrigin())
OpenNextConnectionWindow(ability)
return nil
end
local cost = math.max(1, math.ceil(target:GetHealth() / execute_health))
local stacks = GetStackCount(ability)
if stacks < cost then
if stacks > 0 then
ExecutePartialDamageAndFinish(ability, caster, target, stacks, execute_health)
else
CleanupSequence(ability)
StartNormalCooldown(ability)
end
return nil
end
SetStackCount(ability, stacks - cost)
ability.one_sword_waiting_for_manual_target = nil
ability.one_sword_window_token = (ability.one_sword_window_token or 0) + 1
caster:FaceTowards(target:GetAbsOrigin())
QueuePendingExecution(ability, target, true, 0)
OpenNextConnectionWindow(ability)
return nil
end
function OneSwordOnCreated(keys)
if not IsServer() then return end
local caster = keys.caster
local ability = keys.ability
if not caster or not ability then return end
if ability.one_sword_tracker and not ability.one_sword_tracker:IsNull() then
ability.one_sword_tracker:Destroy()
end
ability.one_sword_tracker = caster:AddNewModifier(caster, ability, "modifier_item_one_sword_tracker", {})
SetStackCount(ability, GetStackCount(ability))
end
function OneSwordOnDestroy(keys)
if not IsServer() then return end
local ability = keys.ability
if not ability then return end
CleanupSequence(ability)
if ability.one_sword_tracker and not ability.one_sword_tracker:IsNull() then
ability.one_sword_tracker:Destroy()
end
ability.one_sword_tracker = nil
end
function OneSwordOnSpellStart(keys)
if not IsServer() then return end
local caster = keys.caster
local ability = keys.ability
local target = GetCastTarget(keys)
if not caster or not ability then
StartNormalCooldown(ability)
return
end
if target == caster then
ToggleAutoChain(ability, caster)
return
end
if target and not target:IsNull() and target:GetTeamNumber() == caster:GetTeamNumber() then
ability:EndCooldown()
return
end
if ability.one_sword_executing then
if target then
ExecuteTarget(ability, target)
else
ability:EndCooldown()
end
return
end
if not IsValidEnemyHero(caster, target) or not IsWithinChainRadius(ability, caster, target) then
StartNormalCooldown(ability)
return
end
if GetStackCount(ability) <= 0 then
StartNormalCooldown(ability)
return
end
local radius = ability:GetSpecialValueFor("target_radius")
if radius <= 0 then
radius = 99999
end
local targets = FindEnemyHeroes(caster, radius)
if #targets <= 0 then
StartNormalCooldown(ability)
return
end
ability.one_sword_executing = true
ability.one_sword_initial_target = target
ability.one_sword_waiting_for_manual_target = nil
ability.one_sword_window_token = (ability.one_sword_window_token or 0) + 1
ability.one_sword_elevation_restored = nil
ability.one_sword_origin = caster:GetAbsOrigin()
ability.one_sword_returned_to_origin = nil
PlayFreezeWave(ability, caster)
ApplyFreeze(ability, caster, targets)
caster:EmitSound("Hero_Silencer.GlobalSilence.Cast")
local freeze_duration = ability:GetSpecialValueFor("freeze_duration")
if freeze_duration <= 0 then
freeze_duration = 20
end
ability.one_sword_bkb_modifier = caster:AddNewModifier(caster, ability, MAGIC_IMMUNE_MODIFIER, { duration = freeze_duration })
caster:AddNewModifier(caster, ability, "modifier_item_one_sword_casting", { duration = freeze_duration })
caster:StartGesture(ACT_DOTA_CAST_ABILITY_6)
ability.one_sword_charge_particles = {}
local charge_particle = ParticleManager:CreateParticle(
PARTICLE_CHARGE_FLASH,
PATTACH_ABSORIGIN_FOLLOW,
caster
)
ParticleManager:SetParticleControl(charge_particle, 60, Vector(120, 220, 255))
ParticleManager:SetParticleControl(charge_particle, 61, Vector(255, 255, 255))
DestroyParticleLater(charge_particle, 0)
ExecuteTarget(ability, target)
end
modifier_item_one_sword_tracker = class({})
function modifier_item_one_sword_tracker:IsHidden() return true end
function modifier_item_one_sword_tracker:IsPurgable() return false end
function modifier_item_one_sword_tracker:IsPurgeException() return false end
function modifier_item_one_sword_tracker:RemoveOnDeath() return false end
function modifier_item_one_sword_tracker:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_one_sword_tracker:DeclareFunctions()
return {
MODIFIER_EVENT_ON_DEATH
}
end
function modifier_item_one_sword_tracker:OnCreated()
if not IsServer() then return end
local ability = self:GetAbility()
if ability then
SetStackCount(ability, GetStackCount(ability))
end
end
function modifier_item_one_sword_tracker:OnDeath(params)
if not IsServer() then return end
local parent = self:GetParent()
local ability = self:GetAbility()
local victim = params.unit
if not parent or not ability or not victim then return end
if victim.one_sword_suppressed_killer == parent:entindex()
and (victim.one_sword_suppressed_until or 0) >= GameRules:GetGameTime() then
return
end
if params.attacker ~= parent then return end
if victim:GetTeamNumber() == parent:GetTeamNumber() then return end
if not victim:IsHero() or victim:IsIllusion() then return end
local gain_health = ability:GetSpecialValueFor("kill_health_per_stack")
if gain_health <= 0 then
gain_health = 1000
end
local gain = math.max(1, math.floor(victim:GetMaxHealth() / gain_health))
SetStackCount(ability, GetStackCount(ability) + gain)
end
modifier_item_one_sword_casting = class({})
function modifier_item_one_sword_casting:IsHidden() return true end
function modifier_item_one_sword_casting:IsPurgable() return false end
function modifier_item_one_sword_casting:IsPurgeException() return false end
function modifier_item_one_sword_casting:RemoveOnDeath() return true end
function modifier_item_one_sword_casting:GetEffectName()
return PARTICLE_CASTING_AMBIENT
end
function modifier_item_one_sword_casting:GetEffectAttachType()
return PATTACH_ABSORIGIN_FOLLOW
end
function modifier_item_one_sword_casting:OnCreated()
if not IsServer() then return end
local ability = self:GetAbility()
self.start_time = GameRules:GetGameTime()
self.rise_duration = 1
self.height = 350
if ability then
local charge_delay = ability:GetSpecialValueFor("charge_delay")
if charge_delay > 0 then
self.rise_duration = charge_delay
end
local height = ability:GetSpecialValueFor("elevated_z")
if height > 0 then
self.height = height
end
end
self:StartIntervalThink(0.03)
self:SetElevatedPosition()
end
function modifier_item_one_sword_casting:GetCurrentHeight()
if self.elevation_stopped then
return 0
end
local elapsed = GameRules:GetGameTime() - (self.start_time or GameRules:GetGameTime())
local rise_duration = self.rise_duration or 1
local height = self.height or 350
if elapsed >= rise_duration then
return height
end
return height * math.max(0, elapsed) / rise_duration
end
function modifier_item_one_sword_casting:StopElevation()
if not IsServer() then return end
self.elevation_stopped = true
local parent = self:GetParent()
if not parent or parent:IsNull() or not parent:IsAlive() then return end
local ground = GetGroundPosition(parent:GetAbsOrigin(), parent)
FindClearSpaceForUnit(parent, ground, true)
end
function modifier_item_one_sword_casting:SetElevatedPosition()
if not IsServer() then return end
local parent = self:GetParent()
if not parent or parent:IsNull() or not parent:IsAlive() then return end
local origin = parent:GetAbsOrigin()
local ground = GetGroundPosition(origin, parent)
local elevated_position = Vector(ground.x, ground.y, ground.z + self:GetCurrentHeight())
parent:SetAbsOrigin(elevated_position)
end
function modifier_item_one_sword_casting:OnIntervalThink()
self:SetElevatedPosition()
end
function modifier_item_one_sword_casting:OnDestroy()
if not IsServer() then return end
local ability = self:GetAbility()
if ability and ability.one_sword_returned_to_origin then return end
local parent = self:GetParent()
if not parent or parent:IsNull() then return end
if not parent:IsAlive() then return end
local ground = GetGroundPosition(parent:GetAbsOrigin(), parent)
FindClearSpaceForUnit(parent, ground, true)
end
function modifier_item_one_sword_casting:CheckState()
local ability = self:GetAbility()
local state = {
[MODIFIER_STATE_INVULNERABLE] = true,
[MODIFIER_STATE_ROOTED] = true,
[MODIFIER_STATE_DISARMED] = true
}
if not ability or not ability.one_sword_waiting_for_manual_target then
state[MODIFIER_STATE_SILENCED] = true
state[MODIFIER_STATE_MUTED] = true
state[MODIFIER_STATE_COMMAND_RESTRICTED] = true
end
return state
end
modifier_item_one_sword_magic_immune = class({})
function modifier_item_one_sword_magic_immune:IsHidden() return false end
function modifier_item_one_sword_magic_immune:IsPurgable() return false end
function modifier_item_one_sword_magic_immune:IsPurgeException() return false end
function modifier_item_one_sword_magic_immune:GetTexture()
return "taiyi_sword"
end
function modifier_item_one_sword_magic_immune:GetEffectName()
return PARTICLE_AEGIS_AMBIENT
end
function modifier_item_one_sword_magic_immune:GetEffectAttachType()
return PATTACH_ABSORIGIN_FOLLOW
end
function modifier_item_one_sword_magic_immune:CheckState()
return {
[MODIFIER_STATE_MAGIC_IMMUNE] = true
}
end
