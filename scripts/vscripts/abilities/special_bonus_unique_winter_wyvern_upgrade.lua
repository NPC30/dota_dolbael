LinkLuaModifier("modifier_special_bonus_unique_winter_wyvern_upgrade",
"abilities/special_bonus_unique_winter_wyvern_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_winter_wyvern_upgrade = class({})
function special_bonus_unique_winter_wyvern_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_winter_wyvern_upgrade"
end
modifier_special_bonus_unique_winter_wyvern_upgrade = class({})
function modifier_special_bonus_unique_winter_wyvern_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_winter_wyvern_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_winter_wyvern_upgrade:RemoveOnDeath() return false end
function modifier_special_bonus_unique_winter_wyvern_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ATTACK_LANDED
}
end
local function TryCastOnTarget(caster, ability_name, target)
local ability = caster:FindAbilityByName(ability_name)
if not ability or ability:IsNull() or ability:GetLevel() <= 0 then return false end
if not ability:IsFullyCastable() then return false end
caster:SetCursorCastTarget(target)
caster:CastAbilityImmediately(ability, caster:GetPlayerOwnerID())
caster:SetCursorCastTarget(nil)
return true
end
function modifier_special_bonus_unique_winter_wyvern_upgrade:OnAttackLanded(params)
if not IsServer() then return end
local caster = self:GetParent()
if params.attacker ~= caster then return end
local target = params.target
if not target or target:IsNull() or not target:IsAlive() or target:GetTeamNumber() == caster:GetTeamNumber() then return end
local ability = self:GetAbility()
local chance = ability:GetSpecialValueFor("chance")
if RandomInt(1, 100) > chance then return end
local curse_chance = ability:GetSpecialValueFor("curse_chance")
if RandomInt(1, 100) <= curse_chance then
if TryCastOnTarget(caster, "winter_wyvern_winters_curse", target) then return end
end
if not TryCastOnTarget(caster, "winter_wyvern_splinter_blast", target) then
TryCastOnTarget(caster, "winter_wyvern_winters_curse", target)
end
end
