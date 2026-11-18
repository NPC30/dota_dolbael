LinkLuaModifier("modifier_special_bonus_unique_life_stealer_upgrade",
"abilities/special_bonus_unique_life_stealer_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_life_stealer_upgrade = class({})
function special_bonus_unique_life_stealer_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_life_stealer_upgrade"
end
modifier_special_bonus_unique_life_stealer_upgrade = class({})
function modifier_special_bonus_unique_life_stealer_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_life_stealer_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_life_stealer_upgrade:RemoveOnDeath() return false end
function modifier_special_bonus_unique_life_stealer_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ATTACK_LANDED,
}
end
function modifier_special_bonus_unique_life_stealer_upgrade:OnAttackLanded(params)
if not IsServer() then return end
local parent = self:GetParent()
if params.attacker ~= parent then return end
local target = params.target
if not target or target:IsNull() or not target:IsAlive() then return end
if target:GetTeamNumber() == parent:GetTeamNumber() then return end
if target:IsBuilding() or target:IsOther() then return end
local feast = parent:FindAbilityByName("life_stealer_feast")
if not feast or feast:IsNull() or feast:GetLevel() <= 0 then return end
local hp_damage_percent = feast:GetSpecialValueFor("hp_damage_percent")
if hp_damage_percent <= 0 then return end
local damage = target:GetMaxHealth() * hp_damage_percent * 0.01
if damage <= 0 then return end
ApplyDamage({
victim = target,
attacker = parent,
damage = damage,
damage_type = DAMAGE_TYPE_PURE,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION,
ability = self:GetAbility(),
})
end
