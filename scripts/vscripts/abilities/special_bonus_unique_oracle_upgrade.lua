function OnHealReceived(event)
PrintTable(event)
local caster = event.caster
local target = event.unit
Printf("[OnHealReceived] caster: %s", caster:GetName())
Printf("[OnHealReceived] target: %s", target:GetName())
if event.attacker ~= caster or target:GetTeam() ~= caster:GetTeam() then
Printf("[OnHealReceived] Early return - Not caster's heal or wrong team")
return
end
local max_health = target:GetMaxHealth()
local current_health = target:GetHealth()
local overheal = math.max(0, current_health + heal_amount - max_health)
Printf("[OverhealConversion] Health calc - Current: %.2f, Max: %.2f, Heal: %.2f, Overheal: %.2f",
current_health, max_health, heal_amount, overheal)
if overheal > 0 then
local conversion_pct = event.conversion_pct * 0.01
local damage = overheal * conversion_pct
local radius = event.conversion_radius
Printf("[OverhealConversion] Converting - Overheal: %.2f, Pct: %.2f, Damage: %.2f, Radius: %.2f",
overheal, conversion_pct, damage, radius)
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
target:GetOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
Printf("[OverhealConversion] Found %d enemies in radius", #enemies)
for _, enemy in pairs(enemies) do
local damage_table = {
victim = enemy,
attacker = caster,
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = event.ability
}
ApplyDamage(damage_table)
Printf("[OverhealConversion] Dealt %.2f damage to %s", damage, enemy:GetName())
end
local particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_omniknight/omniknight_purification.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
target
)
ParticleManager:SetParticleControl(particle, 1, Vector(radius, 0, 0))
ParticleManager:ReleaseParticleIndex(particle)
Printf("[OverhealConversion] Effect created and released")
else
Printf("[OverhealConversion] No overheal to convert")
end
end
