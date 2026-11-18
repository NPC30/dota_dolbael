function OnSpellStart(keys)
local caster = keys.caster
local target = keys.target
local ability = caster:FindAbilityByName("lion_finger_of_death")
if not ability then return end
local ability2 = caster:FindAbilityByName("special_bonus_unique_lion_upgrade")
if not ability2 then return end
local level = ability:GetLevel()
local level2 = ability2:GetLevel()
if level > level2 then
ability2:SetLevel(level)
elseif level < level2 then
ability:SetLevel(level2)
end
target:EmitSound("Hero_Lion.FingerOfDeath")
local nfx = ParticleManager:CreateParticle("particles/units/heroes/hero_lion/lion_spell_finger_of_death.vpcf",
PATTACH_CUSTOMORIGIN, caster)
ParticleManager:SetParticleControlEnt(nfx, 0, caster, PATTACH_POINT_FOLLOW, "attach_attack1", caster:GetAbsOrigin(),
true)
ParticleManager:SetParticleControlEnt(nfx, 1, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetAbsOrigin(),
true)
local forward = caster:GetForwardVector()
local distance = (caster:GetAbsOrigin() - target:GetAbsOrigin()):Length2D()
local position1 = caster:GetAbsOrigin() + forward * distance / 3 * 2
ParticleManager:SetParticleControl(nfx, 6, position1)
local position2 = caster:GetAbsOrigin() + forward * distance / 3
ParticleManager:SetParticleControl(nfx, 10, position2)
ParticleManager:ReleaseParticleIndex(nfx)
local radius = ability:GetSpecialValueFor("splash_radius_scepter") or 325
if (radius > 3250) then
radius = 3250
end
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
target:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
local enemy_count = #enemies + 1
local base_damage = ability:GetSpecialValueFor("damage") or 1000
local damage_per_kill = ability:GetSpecialValueFor("damage_per_kill") or 60
local cooldown_reduction = ability2:GetSpecialValueFor("cooldown_reduction") or 0.5
local kill_modifier = caster:FindModifierByName("modifier_lion_finger_of_death_kill_counter")
local kill_stacks = 0
if kill_modifier then
kill_stacks = kill_modifier:GetStackCount()
end
if (enemy_count < 2) then
enemy_count = 2
end
local total_damage = base_damage + (damage_per_kill * kill_stacks) * enemy_count
local damage_table = {
victim = target,
attacker = caster,
damage = total_damage,
damage_type = ability:GetAbilityDamageType(),
ability = ability
}
ApplyDamage(damage_table)
local hero_count = 0
for _, enemy in ipairs(enemies) do
if enemy:IsRealHero() then
hero_count = hero_count + 1
end
end
local duration_check = 1
Timers:CreateTimer(0.1, function()
if duration_check > 4 then
return nil
end
if target:IsRealHero() and not target:IsAlive() then
local add_stack = hero_count + 1
if add_stack < 2 then
add_stack = 2
end
if not kill_modifier then
kill_modifier = caster:AddNewModifier(caster, ability, "modifier_lion_finger_of_death_kill_counter",
{ duration = -1 })
end
kill_modifier:SetStackCount(kill_modifier:GetStackCount() + add_stack)
local remaining_cooldown = ability2:GetCooldownTimeRemaining()
ability2:EndCooldown()
ability2:StartCooldown(remaining_cooldown * (100 - cooldown_reduction) / 100)
return nil
end
duration_check = duration_check + 0.3
return 0.3
end)
return nil
end
