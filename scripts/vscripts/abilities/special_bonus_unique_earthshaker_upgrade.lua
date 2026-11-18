require("abilities/ability_blacklist_butterfly")
LinkLuaModifier("modifier_special_bonus_unique_earthshaker_upgrade",
"abilities/special_bonus_unique_earthshaker_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_earthshaker_upgrade = class({})
function special_bonus_unique_earthshaker_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_earthshaker_upgrade"
end
modifier_special_bonus_unique_earthshaker_upgrade = class({})
function modifier_special_bonus_unique_earthshaker_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_earthshaker_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_earthshaker_upgrade:RemoveOnDeath() return false end
function modifier_special_bonus_unique_earthshaker_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED
}
end
function modifier_special_bonus_unique_earthshaker_upgrade:OnAbilityExecuted(params)
if not IsServer() then return end
local parent = self:GetParent()
if params.unit ~= parent then return end
local event_ability = params.ability
if not event_ability or event_ability:IsNull() or event_ability:IsItem() then return end
if event_ability == self:GetAbility() then return end
if IsAbilityExcludedForButterflyOnCast and IsAbilityExcludedForButterflyOnCast(event_ability:GetAbilityName()) then return end
local aftershock = parent:FindAbilityByName("earthshaker_aftershock")
if not aftershock or aftershock:IsNull() or aftershock:GetLevel() <= 0 then return end
local radius = aftershock:GetSpecialValueFor("aftershock_range")
local damage = aftershock:GetSpecialValueFor("aftershock_damage") / 2
if radius <= 0 or damage <= 0 then return end
local enemies = FindUnitsInRadius(
parent:GetTeamNumber(),
parent:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
ApplyDamage({
victim = enemy,
attacker = parent,
damage = damage,
damage_type = DAMAGE_TYPE_PURE,
ability = self:GetAbility(),
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL
})
end
local particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_earthshaker/earthshaker_aftershock.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
parent
)
ParticleManager:SetParticleControl(particle, 1, Vector(radius, radius, radius))
ParticleManager:ReleaseParticleIndex(particle)
parent:EmitSound("Hero_EarthShaker.Aftershock")
end
