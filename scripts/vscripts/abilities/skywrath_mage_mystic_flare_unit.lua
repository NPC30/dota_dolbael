local COOLDOWN_SCAN_INTERVAL = 10.0
local ARCANE_BOLT_ABILITY = "skywrath_mage_arcane_bolt"
local function IsCooldownReductionCandidate(ability, ability_unit, ability_aoe)
if not ability or ability:IsNull() or ability == ability_unit or ability == ability_aoe then return false end
if ability:GetLevel() <= 0 then return false end
if ability.IsPassive and ability:IsPassive() then return false end
if ability.IsActivated and not ability:IsActivated() then return false end
local cooldown = ability:GetCooldown(math.max(ability:GetLevel() - 1, 0))
return cooldown and cooldown > 0
end
local function GetCooldownReductionAbilities(caster, ability_unit, ability_aoe)
local now = GameRules:GetGameTime()
if caster._skywrath_mystic_flare_cd_scan_time and
now < caster._skywrath_mystic_flare_cd_scan_time and
caster._skywrath_mystic_flare_cd_abilities then
return caster._skywrath_mystic_flare_cd_abilities
end
local abilities = {}
local ability_count = caster.GetAbilityCount and caster:GetAbilityCount() or 16
for slot = 0, ability_count - 1 do
local ability = caster:GetAbilityByIndex(slot)
if IsCooldownReductionCandidate(ability, ability_unit, ability_aoe) then
table.insert(abilities, ability)
end
end
caster._skywrath_mystic_flare_cd_abilities = abilities
caster._skywrath_mystic_flare_cd_scan_time = now + COOLDOWN_SCAN_INTERVAL
return abilities
end
local function ReduceCachedAbilityCooldowns(caster, ability_unit, ability_aoe, cooldown_reduce_per_hit)
if cooldown_reduce_per_hit <= 0 then return end
local abilities = GetCooldownReductionAbilities(caster, ability_unit, ability_aoe)
for _, ability in pairs(abilities) do
if ability and not ability:IsNull() then
local remaining = ability:GetCooldownTimeRemaining()
if remaining and remaining > 0 then
ability:EndCooldown()
if remaining > cooldown_reduce_per_hit then
ability:StartCooldown(remaining - cooldown_reduce_per_hit)
end
end
end
end
end
local function TryCastArcaneBolt(caster, target)
if not target or target:IsNull() or not target:IsAlive() then return end
local arcane_bolt = caster:FindAbilityByName(ARCANE_BOLT_ABILITY)
if not arcane_bolt or arcane_bolt:IsNull() or arcane_bolt:GetLevel() <= 0 then return end
if arcane_bolt:GetCooldownTimeRemaining() > 0 then return end
if arcane_bolt.IsFullyCastable and not arcane_bolt:IsFullyCastable() then return end
caster:SetCursorCastTarget(target)
caster:CastAbilityImmediately(arcane_bolt, caster:GetPlayerOwnerID())
caster:SetCursorCastTarget(nil)
end
function OnSpellStart(keys)
local caster = keys.caster
local target = keys.target
local ability_unit = keys.ability
local ability_aoe = caster:FindAbilityByName("skywrath_mage_mystic_flare")
if ability_aoe then
local level_aoe = ability_aoe:GetLevel()
local level_unit = ability_unit:GetLevel()
if level_aoe > level_unit then
ability_unit:SetLevel(level_aoe)
elseif level_aoe < level_unit then
ability_aoe:SetLevel(level_unit)
end
end
local total_damage = (ability_aoe and ability_aoe:GetSpecialValueFor("damage")) or
ability_unit:GetSpecialValueFor("damage") or 800
local duration = ability_unit:GetSpecialValueFor("duration") or 4.0
local damage_interval = ability_unit:GetSpecialValueFor("damage_interval") or 0.2
local damage_int_pct = ability_unit:GetSpecialValueFor("damage_int_pct") or 0.1
local cooldown_reduce_per_hit = ability_unit:GetSpecialValueFor("cooldown_reduce_per_hit") or 0
local damage_type = (ability_aoe and ability_aoe:GetAbilityDamageType()) or ability_unit:GetAbilityDamageType() or
DAMAGE_TYPE_MAGICAL
local tick_count = math.floor(duration / damage_interval)
if tick_count < 1 then
tick_count = 1
end
local damage_per_tick = total_damage / tick_count + caster:GetIntellect(false) * damage_int_pct
local particle_name = "particles/units/heroes/hero_skywrath_mage/skywrath_mage_mystic_flare.vpcf"
local particle_interval = 0.2
local particle_elapsed = 0
Timers:CreateTimer(0, function()
if not target or not target:IsAlive() then
return nil
end
if particle_elapsed >= duration then
return nil
end
local pos = target:GetAbsOrigin()
local nfx = ParticleManager:CreateParticle(particle_name, PATTACH_WORLDORIGIN, nil)
ParticleManager:SetParticleControl(nfx, 0, pos)
ParticleManager:SetParticleControl(nfx, 1, pos)
ParticleManager:ReleaseParticleIndex(nfx)
particle_elapsed = particle_elapsed + particle_interval
return particle_interval
end)
target:EmitSound("Hero_SkywrathMage.MysticFlare.Target")
local tick_index = 0
Timers:CreateTimer(damage_interval, function()
if not target or not target:IsAlive() then
return nil
end
if tick_index >= tick_count then
return nil
end
local damage_table = {
victim = target,
attacker = caster,
damage = damage_per_tick,
damage_type = damage_type,
ability = ability_aoe or ability_unit
}
ApplyDamage(damage_table)
ReduceCachedAbilityCooldowns(caster, ability_unit, ability_aoe, cooldown_reduce_per_hit)
TryCastArcaneBolt(caster, target)
tick_index = tick_index + 1
return damage_interval
end)
end
