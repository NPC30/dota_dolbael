local function IsSoloSelfCast(caster, target)
return caster == target and PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_GOODGUYS) == 1
end
function MoonShard10xOnSpell(keys)
local caster = keys.caster
local target = keys.target
local ability = keys.ability
local modifier = keys.modifier
for i = 1, 10 do
AddStacks(ability, caster, target, modifier, 1, true)
end
if caster:HasAbility("special_bonus_unique_alchemist_upgrade") and (caster ~= target or IsSoloSelfCast(caster, target)) and caster:HasModifier("modifier_alchemist_scepter_bonus_damage") then
for i = 1, 10 do
AddStacks(ability, caster, caster, "modifier_alchemist_scepter_bonus_damage", 1, true)
end
end
ability:SpendCharge(1)
caster:EmitSound("DOTA_Item.MoonShard.Consume")
local particle = ParticleManager:CreateParticle("particles/items2_fx/moon_shard.vpcf", PATTACH_ABSORIGIN_FOLLOW,
caster)
ParticleManager:ReleaseParticleIndex(particle)
end
