LinkLuaModifier("modifier_item_shadow_impact", "items/item_shadow_impact", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_shadow_impact_sheep", "items/item_shadow_impact", LUA_MODIFIER_MOTION_NONE)
local PlayerProperty = require("libraries/player_property")
item_shadow_impact = class({})
function item_shadow_impact:GetIntrinsicModifierName()
return "modifier_item_shadow_impact"
end
function item_shadow_impact:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
if target:TriggerSpellAbsorb(self) then
return
end
self:ApplyCombinedImpact(target)
end
function item_shadow_impact:ApplyCombinedImpact(target)
local caster = self:GetCaster()
local duration = self:GetSpecialValueFor("ethereal_duration") * (1 - target:GetStatusResistance())
local primary_stat = 0
if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_STRENGTH then
primary_stat = caster:GetStrength()
elseif caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_AGILITY then
primary_stat = caster:GetAgility()
elseif caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_INTELLECT then
primary_stat = caster:GetIntellect(false)
else
primary_stat = (caster:GetStrength() + caster:GetAgility() + caster:GetIntellect(false)) / 2
end
local ethereal_damage = self:GetSpecialValueFor("blast_damage_base") +
primary_stat * self:GetSpecialValueFor("blast_agility_multiplier")
local dagon_damage = self:GetSpecialValueFor("dagon_damage")
local blast_att_multiplier = self:GetSpecialValueFor("necrolyte_att_multiplier")
local allAtt = caster:GetStrength() + caster:GetAgility() + caster:GetIntellect(false)
local necrolyte_damage = allAtt * blast_att_multiplier
local magical_damage = ethereal_damage + dagon_damage + necrolyte_damage
ApplyDamage({
victim = target,
attacker = caster,
damage = magical_damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = self
})
target:AddNewModifier(caster, self, "modifier_item_ethereal_blade_ethereal", { duration = 0.5 })
target:AddNewModifier(caster, self, "modifier_break", { duration = duration })
PlayerProperty.ApplyPureDamageWithReduction({
victim = target,
attacker = caster,
damage = self:GetSpecialValueFor("absolute_damage"),
damage_type = DAMAGE_TYPE_PURE,
ability = self
})
local sheep_duration = self:GetSpecialValueFor("sheep_duration") * (1 - target:GetStatusResistance())
target:AddNewModifier(caster, self, "modifier_shadow_impact_sheep", { duration = sheep_duration })
local particle = ParticleManager:CreateParticle(
"particles/items_fx/dagon.vpcf",
PATTACH_CUSTOMORIGIN,
caster
)
ParticleManager:SetParticleControlEnt(particle, 0, caster, PATTACH_POINT_FOLLOW, "attach_attack1",
caster:GetAbsOrigin(), true)
ParticleManager:SetParticleControlEnt(particle, 1, target, PATTACH_POINT_FOLLOW, "attach_hitloc",
target:GetAbsOrigin(), true)
ParticleManager:ReleaseParticleIndex(particle)
EmitSoundOn("Hero_Lion.FingerOfDeath", target)
end
modifier_item_shadow_impact = class({})
function modifier_item_shadow_impact:IsHidden() return true end
function modifier_item_shadow_impact:IsPurgable() return false end
function modifier_item_shadow_impact:RemoveOnDeath() return false end
function modifier_item_shadow_impact:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_shadow_impact:OnCreated()
self:OnRefresh()
if not self:GetAbility() then return end
local ability = self:GetAbility()
self.bonus_cast_range = ability:GetSpecialValueFor("bonus_cast_range")
end
function modifier_item_shadow_impact:OnRefresh()
self.stats_modifier_name = "modifier_item_shadow_impact_stats"
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_shadow_impact:OnDestroy()
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_shadow_impact:DeclareFunctions()
return {
MODIFIER_PROPERTY_CAST_RANGE_BONUS,
}
end
function modifier_item_shadow_impact:GetModifierCastRangeBonus()
return self.bonus_cast_range or 0
end
function modifier_item_shadow_impact:GetTexture()
return "anyingchongji"
end
modifier_shadow_impact_sheep = class({})
function modifier_shadow_impact_sheep:IsHidden() return false end
function modifier_shadow_impact_sheep:IsDebuff() return true end
function modifier_shadow_impact_sheep:IsPurgable() return true end
function modifier_shadow_impact_sheep:GetTexture()
return "anyingchongji"
end
function modifier_shadow_impact_sheep:OnCreated()
if not IsServer() then return end
local model_list = { "models/props_gameplay/pig.vmdl", "models/props_gameplay/sheep01.vmdl" }
self.model_file = model_list[RandomInt(1, #model_list)]
if self:GetAbility() then
self.sheep_movement_speed = self:GetAbility():GetSpecialValueFor("sheep_movement_speed") or 140
end
end
function modifier_shadow_impact_sheep:CheckState()
return {
[MODIFIER_STATE_SILENCED] = true,
[MODIFIER_STATE_MUTED] = true,
[MODIFIER_STATE_DISARMED] = true,
[MODIFIER_STATE_HEXED] = true,
}
end
function modifier_shadow_impact_sheep:DeclareFunctions()
return {
MODIFIER_PROPERTY_MOVESPEED_BASE_OVERRIDE,
MODIFIER_PROPERTY_MODEL_CHANGE,
}
end
function modifier_shadow_impact_sheep:GetModifierMoveSpeedOverride()
return self.sheep_movement_speed or 140
end
function modifier_shadow_impact_sheep:GetModifierModelChange()
return self.model_file
end
