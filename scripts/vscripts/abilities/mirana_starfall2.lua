LinkLuaModifier("modifier_mirana_starfall2", "abilities/mirana_starfall2.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_mirana_starfall2_cooldown", "abilities/mirana_starfall2.lua",
LUA_MODIFIER_MOTION_NONE)
mirana_starfall2 = class({})
function mirana_starfall2:GetIntrinsicModifierName()
return "modifier_mirana_starfall2"
end
modifier_mirana_starfall2 = class({})
function modifier_mirana_starfall2:IsHidden()
return true
end
function modifier_mirana_starfall2:IsPurgable()
return false
end
function modifier_mirana_starfall2:DeclareFunctions()
return {
MODIFIER_EVENT_ON_TAKEDAMAGE,
}
end
function modifier_mirana_starfall2:OnTakeDamage(keys)
local ability = self:GetAbility()
if not ability or ability:IsNull() then
return
end
local parent = self:GetParent()
if keys.attacker ~= parent then
return
end
if not keys.inflictor then
return
end
local ability_name = keys.inflictor:GetAbilityName()
if ability_name ~= "mirana_starfall" then
return
end
if parent:HasModifier("modifier_mirana_starfall2_cooldown") then
return
end
local damage_pct = ability:GetSpecialValueFor("damage_pct")
local attack_damage = parent:GetAverageTrueAttackDamage(nil)
if attack_damage <= 0 then
return
end
local bonus_damage = attack_damage * (damage_pct / 100)
if not keys.unit or keys.unit:IsNull() then
return
end
ApplyDamage({
victim = keys.unit,
attacker = parent,
damage = bonus_damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = ability,
damage_flags = DOTA_DAMAGE_FLAG_NONE,
})
local cooldown = ability:GetSpecialValueFor("internal_cooldown")
if cooldown > 0 then
parent:AddNewModifier(parent, ability, "modifier_mirana_starfall2_cooldown", { duration = cooldown })
else
end
end
modifier_mirana_starfall2_cooldown = class({})
function modifier_mirana_starfall2_cooldown:IsHidden()
return true
end
function modifier_mirana_starfall2_cooldown:IsPurgable()
return false
end
function modifier_mirana_starfall2_cooldown:RemoveOnDeath()
return true
end
