russian_roulette = class({})
LinkLuaModifier("modifier_russian_roulette", "abilities/russian_roulette", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_russian_roulette_root", "abilities/russian_roulette", LUA_MODIFIER_MOTION_NONE)
function russian_roulette:OnCreated()
self.last_kill_time = 0
self.team_min_players = {}
for team = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
local min_player_id = nil
for i = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
if PlayerResource:IsValidPlayerID(i) and PlayerResource:GetTeam(i) == team then
if min_player_id == nil or i < min_player_id then
min_player_id = i
end
end
end
self.team_min_players[team] = min_player_id
end
end
function russian_roulette:GetCastRange()
local current_time = GameRules:GetDOTATime(false, false)
if self.last_kill_time and (current_time - self.last_kill_time) <= 12 then
return 18000
end
return 1800
end
function russian_roulette:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
if not target or target:IsNull() then return end
if self.last_kill_time == nil then
self.last_kill_time = 0
self.team_min_players = {}
for team = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
local min_player_id = nil
for i = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
if PlayerResource:IsValidPlayerID(i) and PlayerResource:GetTeam(i) == team then
if min_player_id == nil or i < min_player_id then
min_player_id = i
end
end
end
self.team_min_players[team] = min_player_id
end
end
for team = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
local min_player_id = nil
for i = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
if PlayerResource:IsValidPlayerID(i) and PlayerResource:GetTeam(i) == team then
if min_player_id == nil or i < min_player_id then
min_player_id = i
end
end
end
self.team_min_players[team] = min_player_id
end
local current_time = GameRules:GetDOTATime(false, false)
if current_time - self.last_kill_time <= 12 then
local time_seconds = math.floor(current_time) % 10
local bot_number = self:GetBotNumber(target)
local player_id = target:GetPlayerID()
local team_number = target:GetTeamNumber()
local min_player_id = self.team_min_players[team_number]
if time_seconds == bot_number then
self:DealFatalDamage(target, {
ability = self,
caster = caster,
target = target
})
EmitSoundOn("Hero_Sniper.Assassinate", caster)
local particle = ParticleManager:CreateParticle(
"particles/items3_fx/blink_overwhelming_burst.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
target
)
ParticleManager:SetParticleControl(particle, 0, target:GetAbsOrigin())
ParticleManager:SetParticleControl(particle, 1, Vector(200, 200, 200))
Timers:CreateTimer(2.0, function()
ParticleManager:DestroyParticle(particle, false)
ParticleManager:ReleaseParticleIndex(particle)
end)
self:EndCooldown()
return
end
end
EmitSoundOn("Hero_LegionCommander.PressTheAttack", caster)
local level = self:GetLevel()
local is_enemy = caster:GetTeamNumber() ~= target:GetTeamNumber()
local caster_level = caster:GetLevel()
local target_level = target:GetLevel()
local level_diff = target_level - caster_level
local effective_level = level
if is_enemy and level_diff > 0 then
if level_diff >= 30 then
effective_level = math.max(level - 3, 1)
elseif level_diff >= 20 then
effective_level = math.max(level - 2, 1)
elseif level_diff >= 10 then
effective_level = math.max(level - 1, 1)
elseif level_diff <= -10 then
effective_level = 5
end
end
local caster_mod = caster:AddNewModifier(caster, self, "modifier_russian_roulette_root", {})
if caster_mod then
if not is_enemy then
caster_mod:SetStackCount(2)
else
caster_mod:SetStackCount(effective_level)
end
end
local target_mod = target:AddNewModifier(caster, self, "modifier_russian_roulette_root", {})
if target_mod then
if not is_enemy then
target_mod:SetStackCount(2)
else
target_mod:SetStackCount(effective_level)
end
end
local damage_sequence = self:GetDamageSequence(effective_level, is_enemy)
local fatal_shot = math.random(1, 6)
local context = {
ability = self,
target = target,
caster = caster,
damage_sequence = damage_sequence,
fatal_shot = fatal_shot,
current_shot = 0,
is_active = true,
caster_modifier = caster_mod,
target_modifier = target_mod,
current_target_particle = nil
}
local caster_player = caster:GetPlayerOwner()
local target_player = target:GetPlayerOwner()
local caster_name = caster_player and caster:GetName()
local target_name = target_player and target:GetName()
local HeroName = string.gsub(target_name, "npc_dota_hero_", "")
local messages = {
HeroName .. "，TMD出来单挑啊！!",
HeroName .. "，我赌你的枪里，没有子弹!",
HeroName .. "，我TM看你不顺眼很久了!",
HeroName .. "，速速出来受死!",
}
local message = messages[RandomInt(1, #messages)]
Say(caster, message, false)
self:StartRoulette(context)
end
function russian_roulette:DealFatalDamage(target, context)
if context.target == context.target then
self.last_kill_time = GameRules:GetDOTATime(false, false)
if context.caster:IsAlive() then
context.caster:AddNewModifier(context.caster, self, "modifier_russian_roulette_range_bonus",
{ duration = 12 })
end
end
EmitSoundOn("Ability.Assassinate", context.caster)
EmitSoundOn("Hero_Sniper.AssassinateDamage", target)
local particle = ParticleManager:CreateParticle(
"particles/items3_fx/blink_overwhelming_burst.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
target
)
ParticleManager:SetParticleControl(particle, 0, target:GetAbsOrigin())
ParticleManager:SetParticleControl(particle, 1, Vector(200, 200, 200))
Timers:CreateTimer(2.0, function()
ParticleManager:DestroyParticle(particle, false)
ParticleManager:ReleaseParticleIndex(particle)
end)
local killer = (target == context.caster) and context.target or context.caster
target:Kill(self, killer)
end
function russian_roulette:GetBotNumber(unit)
local player_id = unit:GetPlayerID()
local team_number = unit:GetTeamNumber()
if not player_id then
return 0
end
local min_player_id = self.team_min_players[team_number]
if min_player_id then
local num = player_id - min_player_id + 1
if num == 10 then
return 0
else
return num
end
end
return 0
end
function russian_roulette:GetDamageSequence(level, is_enemy)
if not is_enemy then
return { 1, 0, 1, 0, 1, 0 }
end
local sequences = {
{ 1, 0, 0, 1, 0, 0 },
{ 1, 0, 1, 0, 1, 0 },
{ 1, 1, 0, 1, 0, 1 },
{ 1, 1, 1, 0, 1, 0 },
{ 1, 1, 1, 1, 0, 1 },
}
return sequences[level] or sequences[1]
end
function russian_roulette:StartRoulette(context)
local interval = self:GetSpecialValueFor("interval")
Timers:CreateTimer(interval, function()
if not context.is_active then return nil end
if GameRules:IsGamePaused() then return 0.03 end
context.current_shot = context.current_shot + 1
if context.current_shot > 6 or not context.caster:IsAlive() or not context.target:IsAlive() then
context.is_active = false
if context.current_target_particle then
ParticleManager:DestroyParticle(context.current_target_particle, false)
ParticleManager:ReleaseParticleIndex(context.current_target_particle)
end
if context.caster_modifier and not context.caster_modifier:IsNull() then
context.caster_modifier:Destroy()
end
if context.target_modifier and not context.target_modifier:IsNull() then
context.target_modifier:Destroy()
end
return nil
end
local current_target = context.damage_sequence[context.current_shot] == 1 and context.target or context.caster
if context.current_target_particle then
ParticleManager:DestroyParticle(context.current_target_particle, false)
ParticleManager:ReleaseParticleIndex(context.current_target_particle)
end
context.current_target_particle = ParticleManager:CreateParticleForTeam(
"particles/econ/items/sniper/sniper_charlie/sniper_crosshair_charlie.vpcf",
PATTACH_OVERHEAD_FOLLOW,
current_target,
context.caster:GetTeamNumber()
)
local aura_particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_templar_assassin/templar_assassin_refraction.vpcf",
PATTACH_OVERHEAD_FOLLOW,
current_target
)
EmitSoundOn("Ability.AssassinateLoad", context.caster)
local is_fatal = (context.current_shot == context.fatal_shot)
Timers:CreateTimer(0.5, function()
if not context.is_active then return nil end
if GameRules:IsGamePaused() then return 0.03 end
if is_fatal then
self:DealFatalDamage(current_target, context)
else
self:DealNormalDamage(current_target, context)
end
Timers:CreateTimer(0.5, function()
ParticleManager:DestroyParticle(aura_particle, false)
ParticleManager:ReleaseParticleIndex(aura_particle)
end)
if not current_target:IsAlive() then
context.is_active = false
if context.current_target_particle then
ParticleManager:DestroyParticle(context.current_target_particle, false)
ParticleManager:ReleaseParticleIndex(context.current_target_particle)
end
if context.caster_modifier and not context.caster_modifier:IsNull() then
context.caster_modifier:Destroy()
end
if context.target_modifier and not context.target_modifier:IsNull() then
context.target_modifier:Destroy()
end
if current_target == context.target then
self:EndCooldown()
end
end
end)
return interval
end)
end
function russian_roulette:DealNormalDamage(target, context)
EmitSoundOn("Hero_Sniper.PreAttack", context.caster)
EmitSoundOn("Hero_Sniper.Attack", context.caster)
end
modifier_russian_roulette = class({})
function modifier_russian_roulette:IsHidden() return true end
function modifier_russian_roulette:IsPurgable() return false end
modifier_russian_roulette_root = class({})
function modifier_russian_roulette_root:IsHidden() return false end
function modifier_russian_roulette_root:IsPurgable() return false end
function modifier_russian_roulette_root:IsDebuff() return true end
function modifier_russian_roulette_root:CheckState()
return {
[MODIFIER_STATE_ROOTED] = true,
[MODIFIER_STATE_DISARMED] = true,
[MODIFIER_STATE_MUTED] = true,
}
end
function modifier_russian_roulette_root:GetTexture()
return "russian_roulette"
end
function modifier_russian_roulette_root:OnCreated(params)
if self:GetStackCount() > 0 then
self.effective_level = self:GetStackCount()
else
self.effective_level = 1
end
end
function modifier_russian_roulette_root:OnRefresh(params)
if self:GetStackCount() > 0 then
self.effective_level = self:GetStackCount()
else
self.effective_level = 1
end
end
function modifier_russian_roulette_root:OnTooltip()
return self.effective_level or 1
end
function modifier_russian_roulette_root:DeclareFunctions()
return {
MODIFIER_PROPERTY_TOOLTIP
}
end
modifier_russian_roulette_range_bonus = class({})
LinkLuaModifier("modifier_russian_roulette_range_bonus", "abilities/russian_roulette", LUA_MODIFIER_MOTION_NONE)
function modifier_russian_roulette_range_bonus:IsHidden() return false end
function modifier_russian_roulette_range_bonus:IsPurgable() return false end
function modifier_russian_roulette_range_bonus:IsDebuff() return false end
function modifier_russian_roulette_range_bonus:OnCreated(keys)
if not IsServer() then return end
self.particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_bloodseeker/bloodseeker_scepter_blood_mist_aoe.vpcf", 1, self:GetCaster())
ParticleManager:SetParticleControl(self.particle, 1, Vector(250, 0, 0))
end
function modifier_russian_roulette_range_bonus:OnDestroy(keys)
if not IsServer() then return end
ParticleManager:DestroyParticle(self.particle, false)
ParticleManager:ReleaseParticleIndex(self.particle)
end
