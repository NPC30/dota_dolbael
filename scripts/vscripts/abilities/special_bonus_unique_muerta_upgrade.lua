local PlayerProperty = require("libraries/player_property")
function OnAttackLanded_Muerta(keys)
if not IsServer() then return end
local attacker = keys.attacker or keys.caster
local target = keys.target
if not attacker or not target or target:IsNull() or not target:IsAlive() then return end
if not attacker:HasModifier("modifier_muerta_pierce_the_veil_buff") then return end
if not PlayerProperty.IsDebuffOrMagicImmune(target) then return end
local ability = attacker:FindAbilityByName("special_bonus_unique_muerta_upgrade")
if not ability or ability:GetLevel() < 1 then return end
local damage = attacker:GetAverageTrueAttackDamage(target)
if damage <= 0 then return end
ApplyDamage({
victim = target,
attacker = attacker,
damage = damage,
damage_type = DAMAGE_TYPE_PHYSICAL,
damage_flags = DOTA_DAMAGE_FLAG_BYPASSES_BLOCK,
ability = ability,
})
end
