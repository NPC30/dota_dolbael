function OnAbilityExecuted_bane(keys)
local caster = keys.unit
local executed_ability = keys.event_ability
local abilityName = executed_ability:GetAbilityName()
if abilityName == "bane_fiends_grip" then
local duration = executed_ability:GetSpecialValueFor("AbilityChannelTime")
local int_valve = keys.int_valve or 200
local grab_radius = keys.radius or 600
local caster_Intellect = caster:GetIntellect(false)
local extra_targets = math.floor(caster_Intellect / int_valve) + 1
local target = keys.target
if target and extra_targets > 0 then
local units = FindUnitsInRadius(caster:GetTeamNumber(),
target:GetAbsOrigin(),
nil,
grab_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false)
local affected_count = 0
for _, unit in pairs(units) do
if unit ~= target and affected_count < extra_targets then
unit:AddNewModifier(caster, executed_ability, "modifier_bane_fiends_grip", { duration = duration })
affected_count = affected_count + 1
end
end
else
end
elseif abilityName == "bane_enfeeble" then
local duration = executed_ability:GetSpecialValueFor("duration") or 9
local bonus_damage_pct = executed_ability:GetSpecialValueFor("damage_reduction") or 60
local spell_amp_pct = bonus_damage_pct
local cast_range_bonus_pct = executed_ability:GetSpecialValueFor("cast_reduction") or 30
local target = keys.target
local spell_amp = (target:GetSpellAmplification(false) + 1) * spell_amp_pct
local bonus_damage = target:GetAverageTrueAttackDamage(nil) * bonus_damage_pct / 100
local cast_range_bonus = (target:GetCastRangeBonus() + 600) * (1 - cast_range_bonus_pct / 100)
if target then
executed_ability.bind_target:AddNewModifier(caster, executed_ability, "modifier_amp_and_damage_bonus",
{
duration = duration,
bonus_damage = bonus_damage,
spell_amp = spell_amp,
cast_range_bonus = cast_range_bonus
})
end
elseif abilityName == "special_bonus_unique_bane_upgrade" then
local ability = caster:FindAbilityByName("bane_enfeeble")
local target = keys.target
if ability and target then
ability.bind_target = target
end
end
end
LinkLuaModifier("modifier_amp_and_damage_bonus", "abilities/special_bonus_unique_bane_upgrade.lua",
LUA_MODIFIER_MOTION_NONE)
modifier_amp_and_damage_bonus = class({})
function modifier_amp_and_damage_bonus:IsHidden() return false end
function modifier_amp_and_damage_bonus:IsPurgable() return false end
function modifier_amp_and_damage_bonus:IsDebuff() return false end
function modifier_amp_and_damage_bonus:DeclareFunctions()
return {
MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
MODIFIER_PROPERTY_CAST_RANGE_BONUS_STACKING
}
end
function modifier_amp_and_damage_bonus:OnCreated(kv)
if not IsServer() then return end
self.bonus_damage = kv.bonus_damage or 0
self.spell_amp = kv.spell_amp or 0
self.cast_range_bonus = kv.cast_range_bonus or 0
self:SetHasCustomTransmitterData(true)
self.particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_ogre_magi/ogre_magi_bloodlust_buff.vpcf", PATTACH_ABSORIGIN_FOLLOW,
self:GetParent())
self:AddParticle(
self.particle,
false,
false,
-1,
false,
false
)
end
function modifier_amp_and_damage_bonus:AddCustomTransmitterData()
return {
bonus_damage = self.bonus_damage,
spell_amp = self.spell_amp,
cast_range_bonus = self.cast_range_bonus,
}
end
function modifier_amp_and_damage_bonus:HandleCustomTransmitterData(data)
self.bonus_damage = data.bonus_damage
self.spell_amp = data.spell_amp
self.cast_range_bonus = data.cast_range_bonus
end
function modifier_amp_and_damage_bonus:OnDestroy()
if IsServer() then
ParticleManager:DestroyParticle(self.particle, false)
ParticleManager:ReleaseParticleIndex(self.particle)
end
end
function modifier_amp_and_damage_bonus:GetModifierPreAttack_BonusDamage()
return self.bonus_damage
end
function modifier_amp_and_damage_bonus:GetModifierSpellAmplify_Percentage()
return self.spell_amp
end
function modifier_amp_and_damage_bonus:GetModifierCastRangeBonusStacking()
return self.cast_range_bonus
end
