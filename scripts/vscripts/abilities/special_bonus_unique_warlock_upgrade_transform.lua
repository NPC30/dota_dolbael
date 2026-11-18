LinkLuaModifier("modifier_special_bonus_unique_warlock_upgrade_transform_form",
"abilities/special_bonus_unique_warlock_upgrade_transform", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_warlock_upgrade_transform = class({})
local WARLOCK_GOLEM_MODEL = "models/heroes/warlock/warlock_demon.vmdl"
local WARLOCK_GOLEM_ATTACK_SOUND = "Hero_WarlockGolem.Attack"
local WARLOCK_DAMAGE_REDUCTION_TALENT = "special_bonus_unique_warlock_1"
local WARLOCK_REINCARNATION_TALENT = "special_bonus_unique_warlock_4"
local WARLOCK_GOLEM_PASSIVES = {
"warlock_golem_flaming_fists",
"warlock_golem_permanent_immolation"
}
local function HasLearnedAbility(unit, ability_name)
if not unit or unit:IsNull() then return false end
local ability = unit:FindAbilityByName(ability_name)
return ability and not ability:IsNull() and ability:GetLevel() > 0
end
local function ApplyWarlockTransformImpact(caster, ability, position)
if not caster or caster:IsNull() or not ability or ability:IsNull() then return end
caster:EmitSound("DOTA_Item.MeteorHammer.Impact")
caster:EmitSound("Hero_WarlockGolem.Spawn")
local radius = ability:GetSpecialValueFor("aoe")
local stun_duration = ability:GetSpecialValueFor("stun_duration")
local impact_pfx = ParticleManager:CreateParticle("particles/items3_fx/blink_overwhelming_burst.vpcf",
PATTACH_CUSTOMORIGIN, caster)
ParticleManager:SetParticleControl(impact_pfx, 0, position)
ParticleManager:SetParticleControl(impact_pfx, 1, Vector(radius, radius, radius))
ParticleManager:ReleaseParticleIndex(impact_pfx)
local enemies = FindUnitsInRadius(caster:GetTeamNumber(),
position,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
FIND_ANY_ORDER,
false)
for _, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() then
enemy:AddNewModifier(caster, ability, "modifier_stunned", {
duration = stun_duration
})
end
end
end
function special_bonus_unique_warlock_upgrade_transform:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
local target_loc = self:GetCursorPosition()
local duration = self:GetSpecialValueFor("golem_duration")
if duration <= 0 then
duration = self:GetSpecialValueFor("duration")
end
if duration <= 0 then
duration = 60
end
caster:EmitSound("DOTA_Item.BlinkDagger.Activate")
local blink_pfx = ParticleManager:CreateParticle("particles/items_fx/blink_dagger_start.vpcf", PATTACH_CUSTOMORIGIN,
caster)
ParticleManager:ReleaseParticleIndex(blink_pfx)
FindClearSpaceForUnit(caster, target_loc, true)
ProjectileManager:ProjectileDodge(caster)
caster:EmitSound("DOTA_Item.MeteorHammer.Cast")
caster:EmitSound("Hero_Warlock.RainOfChaos")
local blink_end_pfx = ParticleManager:CreateParticle("particles/items_fx/blink_dagger_end.vpcf", PATTACH_ABSORIGIN,
caster)
ParticleManager:ReleaseParticleIndex(blink_end_pfx)
local impact_delay = self:GetSpecialValueFor("impact_delay")
local meteor_pfx = ParticleManager:CreateParticle("particles/items4_fx/meteor_hammer_spell.vpcf", PATTACH_WORLDORIGIN,
caster)
ParticleManager:SetParticleControl(meteor_pfx, 0, target_loc + Vector(0, 0, 1000))
ParticleManager:SetParticleControl(meteor_pfx, 1, target_loc)
ParticleManager:SetParticleControl(meteor_pfx, 2, Vector(impact_delay, 0, 0))
ParticleManager:ReleaseParticleIndex(meteor_pfx)
caster:AddNewModifier(caster, self, "modifier_special_bonus_unique_warlock_upgrade_transform_form", {
duration = duration,
level = self:GetLevel()
})
Timers:CreateTimer(impact_delay, function()
if not caster or caster:IsNull() then return nil end
ApplyWarlockTransformImpact(caster, self, caster:GetAbsOrigin())
return nil
end)
end
modifier_special_bonus_unique_warlock_upgrade_transform_form = class({})
function modifier_special_bonus_unique_warlock_upgrade_transform_form:IsHidden()
return false
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:IsPurgable()
return false
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:RemoveOnDeath()
return true
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:GetTexture()
return "warlock_rain_of_chaos"
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:DeclareFunctions()
return {
MODIFIER_PROPERTY_MODEL_CHANGE,
MODIFIER_PROPERTY_TRANSLATE_ATTACK_SOUND,
MODIFIER_PROPERTY_HEALTH_BONUS,
MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
MODIFIER_EVENT_ON_DEATH
}
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:GetModifierModelChange()
return WARLOCK_GOLEM_MODEL
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:GetAttackSound()
return WARLOCK_GOLEM_ATTACK_SOUND
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:GetModifierHealthBonus()
return self.bonus_health or 0
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:GetModifierPreAttack_BonusDamage()
return self.bonus_damage or 0
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:GetModifierPhysicalArmorBonus()
return self.bonus_armor or 0
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:GetModifierIncomingDamage_Percentage()
if self.has_damage_reduction_talent then
return -(self.talent_damage_reduction or 0)
end
return 0
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:OnCreated(kv)
kv = kv or {}
local parent = self:GetParent()
local transform_ability = self:GetAbility()
if transform_ability and not transform_ability:IsNull() then
self.bonus_health = transform_ability:GetSpecialValueFor("bonus_health")
self.bonus_damage = transform_ability:GetSpecialValueFor("bonus_damage")
self.bonus_armor = transform_ability:GetSpecialValueFor("bonus_armor")
self.talent_damage_reduction = transform_ability:GetSpecialValueFor("talent_damage_reduction")
end
if not IsServer() then return end
self.reincarnated = tonumber(kv.reincarnated) == 1
self.has_damage_reduction_talent = HasLearnedAbility(parent, WARLOCK_DAMAGE_REDUCTION_TALENT)
self.has_reincarnation_talent = HasLearnedAbility(parent, WARLOCK_REINCARNATION_TALENT)
self.granted_abilities = self.granted_abilities or {}
if not self.original_attack_capability then
self.original_attack_capability = parent:GetAttackCapability()
end
parent:SetAttackCapability(DOTA_UNIT_CAP_MELEE_ATTACK)
local transform_level = tonumber(kv.level) or 1
if transform_ability and not transform_ability:IsNull() then
transform_level = transform_ability:GetLevel()
end
for _, ability_name in ipairs(WARLOCK_GOLEM_PASSIVES) do
local passive_ability = parent:FindAbilityByName(ability_name)
if not passive_ability then
passive_ability = parent:AddAbility(ability_name)
self.granted_abilities[ability_name] = true
end
if passive_ability then
local max_level = passive_ability:GetMaxLevel()
if max_level <= 0 then
max_level = transform_level
end
passive_ability:SetLevel(math.min(transform_level, max_level))
passive_ability:SetHidden(false)
end
end
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:OnRefresh(kv)
self:OnCreated(kv)
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:OnDeath(params)
if not IsServer() then return end
local parent = self:GetParent()
if params.unit ~= parent then return end
if self.reincarnated or not self.has_reincarnation_talent then return end
local transform_ability = self:GetAbility()
if not transform_ability or transform_ability:IsNull() then return end
self.reincarnated = true
local position = parent:GetAbsOrigin()
local remaining_duration = self:GetRemainingTime()
if remaining_duration <= 0 then
remaining_duration = transform_ability:GetSpecialValueFor("golem_duration")
end
Timers:CreateTimer(0.03, function()
if not parent or parent:IsNull() then return nil end
parent:RespawnHero(false, false)
FindClearSpaceForUnit(parent, position, true)
parent:SetHealth(parent:GetMaxHealth())
parent:AddNewModifier(parent, transform_ability, "modifier_special_bonus_unique_warlock_upgrade_transform_form", {
duration = remaining_duration,
level = transform_ability:GetLevel(),
reincarnated = 1
})
ApplyWarlockTransformImpact(parent, transform_ability, position)
return nil
end)
end
function modifier_special_bonus_unique_warlock_upgrade_transform_form:OnDestroy()
if not IsServer() then return end
local parent = self:GetParent()
if not parent or parent:IsNull() then return end
if self.original_attack_capability then
parent:SetAttackCapability(self.original_attack_capability)
end
if self.granted_abilities then
for ability_name, granted in pairs(self.granted_abilities) do
if granted and parent:FindAbilityByName(ability_name) then
parent:RemoveAbility(ability_name)
end
end
end
end
