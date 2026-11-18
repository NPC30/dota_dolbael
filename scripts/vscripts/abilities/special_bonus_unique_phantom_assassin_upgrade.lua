function OnSpellStart(keys)
local caster = keys.caster
local target = keys.target
local ability = keys.ability
if caster:HasModifier("modifier_phantom_strike_datadriven") then
caster:RemoveModifierByName("modifier_phantom_strike_datadriven")
end
ability:ApplyDataDrivenModifier(caster, caster, "modifier_phantom_strike_datadriven", {})
local blink_start_pfx = ParticleManager:CreateParticle(
"particles/units/heroes/hero_phantom_assassin/phantom_assassin_phantom_strike_start.vpcf", PATTACH_ABSORIGIN,
caster)
ParticleManager:ReleaseParticleIndex(blink_start_pfx)
local casterOrigin = caster:GetAbsOrigin()
local targetOrigin = target:GetAbsOrigin()
local direction = casterOrigin - targetOrigin
direction.z = 0
direction = direction:Normalized()
local blinkDistance = 50
local blinkPosition = targetOrigin + direction * blinkDistance
Timers:CreateTimer(FrameTime(), function()
FindClearSpaceForUnit(caster, blinkPosition, true)
local blink_pfx = ParticleManager:CreateParticle(
"particles/units/heroes/hero_phantom_assassin/phantom_assassin_phantom_strike_end.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
caster)
ParticleManager:ReleaseParticleIndex(blink_pfx)
end)
caster:FaceTowards(targetOrigin)
if target and target:GetTeamNumber() ~= caster:GetTeamNumber() then
Timers:CreateTimer(0.03, function()
if caster and target and not target:IsNull() and not caster:IsNull() then
ExecuteOrderFromTable({
OrderType = DOTA_UNIT_ORDER_ATTACK_TARGET,
UnitIndex = caster:GetEntityIndex(),
TargetIndex = target:GetEntityIndex(),
Queue = false,
})
end
end)
end
end
