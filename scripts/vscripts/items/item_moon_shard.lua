local function IsSoloSelfCast(caster, target)
return caster == target and PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_GOODGUYS) == 1
end
function MoonShardOnSpell(keys)
local caster = keys.caster
local target = keys.target
local ability = keys.ability
local modifier = keys.modifier
if caster:IsRealHero() and target:IsRealHero() and not caster:HasModifier("modifier_arc_warden_tempest_double") and not target:HasModifier("modifier_arc_warden_tempest_double") then
if caster:HasAbility("special_bonus_unique_alchemist_upgrade") and (caster ~= target or IsSoloSelfCast(caster, target)) and caster:HasModifier("modifier_alchemist_scepter_bonus_damage") then
AddStacks(ability, caster, caster, "modifier_alchemist_scepter_bonus_damage", 1, true)
end
AddStacks(ability, caster, target, modifier, 1, true)
EmitSoundOnClient("Item.MoonShard.Consume", target)
ability:SpendCharge(1)
end
end
