miku_dance = class({})
LinkLuaModifier("modifier_miku_dance", "modifiers/hero_miku/modifier_miku_dance", LUA_MODIFIER_MOTION_NONE)
local BOT_MAX_CHANNEL_TIME = 10
local function StopBotChannelAfterLimit(caster, ability)
local playerId = caster:GetPlayerOwnerID()
if playerId < 0 or not PlayerResource:IsFakeClient(playerId) then return end
Timers:CreateTimer(BOT_MAX_CHANNEL_TIME, function()
if not caster or caster:IsNull() or not caster:IsAlive() or not caster:IsChanneling() then return end
local activeAbility = caster:GetCurrentActiveAbility()
if activeAbility == ability then
caster:Interrupt()
end
end)
end
function miku_dance:OnSpellStart()
local caster = self:GetCaster()
local duration = self:GetSpecialValueFor("ability_duration")
caster:AddNewModifier(
caster,
self,
"modifier_miku_dance",
{
duration = duration,
start = true,
}
)
StopBotChannelAfterLimit(caster, self)
local sound_cast = ""
EmitSoundOn(sound_cast, caster)
end
function miku_dance:OnChannelFinish(bInterrupted)
local delay = self:GetSpecialValueFor("attack_interval")
self:GetCaster():AddNewModifier(
self:GetCaster(),
self,
"modifier_miku_dance",
{
duration = delay,
start = false,
}
)
end
