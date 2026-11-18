function OnAbilityExecuted_FacelessVoidUpgrade(keys)
if not IsServer() then
return
end
local caster = keys.caster
local ability_executed = keys.event_ability or keys.ability
if caster == nil or ability_executed == nil then
return
end
if ability_executed:GetAbilityName() ~= "faceless_void_time_walk" then
return
end
local target_pos = ability_executed:GetCursorPosition()
if (target_pos.x == 0 and target_pos.y == 0 and target_pos.z == 0) then
target_pos = caster:GetAbsOrigin()
end
local radius = tonumber(keys.radius) or 575
local base_duration = tonumber(keys.duration) or 2.0
local chronosphere_particles = {}
local particle_pos = Vector(target_pos.x, target_pos.y, target_pos.z)
local chronosphere_particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_faceless_void/faceless_void_chronosphere.vpcf",
PATTACH_WORLDORIGIN,
nil
)
if chronosphere_particle then
ParticleManager:SetParticleControl(chronosphere_particle, 0, particle_pos)
ParticleManager:SetParticleControl(chronosphere_particle, 1, Vector(radius, 0, 0))
table.insert(chronosphere_particles, chronosphere_particle)
end
local particle_duration = base_duration
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
target_pos,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
if enemy:IsAlive() then
local status_resistance = enemy:GetStatusResistance()
local resistance_scale = 1 - status_resistance
if resistance_scale <= 0 then
resistance_scale = 0.01
end
local duration = base_duration / resistance_scale
if duration > particle_duration then
particle_duration = duration
end
enemy:AddNewModifier(
caster,
ability_executed,
"modifier_faceless_void_chronosphere_freeze",
{ duration = duration }
)
end
end
Timers:CreateTimer(particle_duration, function()
for _, pfx in ipairs(chronosphere_particles) do
if pfx then
ParticleManager:DestroyParticle(pfx, false)
ParticleManager:ReleaseParticleIndex(pfx)
end
end
return nil
end)
end
