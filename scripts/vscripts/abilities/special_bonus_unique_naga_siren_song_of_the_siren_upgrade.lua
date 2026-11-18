special_bonus_unique_naga_siren_song_of_the_siren_upgrade = class({})
local FREEZE_MODIFIER = "modifier_faceless_void_chronosphere_freeze"
function special_bonus_unique_naga_siren_song_of_the_siren_upgrade:GetAOERadius()
return self:GetSpecialValueFor("radius")
end
function special_bonus_unique_naga_siren_song_of_the_siren_upgrade:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
local duration = self:GetSpecialValueFor("duration")
local radius = self:GetSpecialValueFor("radius")
local recheck_interval = self:GetSpecialValueFor("recheck_interval")
if recheck_interval <= 0 then
recheck_interval = 1
end
caster:EmitSound("Hero_NagaSiren.SongOfTheSiren")
local elapsed = 0
local function ApplyFreeze()
if not caster or caster:IsNull() then return nil end
if elapsed >= duration then return nil end
local center = caster:GetAbsOrigin()
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
center,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
local freeze_duration = math.min(recheck_interval + 0.2, duration - elapsed + 0.1)
for _, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() and enemy:IsAlive() then
local status_resistance = enemy:GetStatusResistance()
local resistance_scale = 1 - status_resistance
if resistance_scale <= 0 then
resistance_scale = 0.01
end
local adjusted_duration = freeze_duration / resistance_scale
enemy:AddNewModifier(caster, self, FREEZE_MODIFIER, { duration = adjusted_duration })
end
end
elapsed = elapsed + recheck_interval
if elapsed < duration then
return recheck_interval
end
return nil
end
Timers:CreateTimer(0, ApplyFreeze)
end
