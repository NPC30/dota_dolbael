LinkLuaModifier("modifier_item_shadow_vessel_eye_damage", "items/item_shadow_vessel_eye", LUA_MODIFIER_MOTION_NONE)
function ShadowVesselEyeOnCreated(keys)
if not IsServer() then return end
local caster = keys.caster
local ability = keys.ability
if not caster or not ability then return end
local skadi_modifier = caster:AddNewModifier(caster, ability, "modifier_item_skadi", {})
if not ability.added_modifiers then
ability.added_modifiers = {}
end
if skadi_modifier then
table.insert(ability.added_modifiers, skadi_modifier)
end
end
function ShadowVesselEyeOnDestroy(keys)
if not IsServer() then return end
local ability = keys.ability
if not ability or not ability.added_modifiers then return end
for _, modifier in pairs(ability.added_modifiers) do
if modifier and not modifier:IsNull() then
modifier:Destroy()
end
end
ability.added_modifiers = nil
end
function ShadowVesselEyeOnSpellStart(keys)
if not IsServer() then return end
local caster = keys.caster
local target = keys.target or keys.Target
local ability = keys.ability
if not caster or not target or not ability then return end
caster:EmitSound("DOTA_Item.SpiritVessel.Cast")
ShadowVesselEyeApplyActiveEffect(caster, target, ability)
end
function ShadowVesselEyeApplyActiveEffect(caster, target, ability)
if not target or target:IsNull() or not ability then return end
local duration = ability:GetSpecialValueFor("duration")
target:EmitSound("DOTA_Item.SpiritVessel.Target.Enemy")
target:Purge(true, false, false, false, false)
target:AddNewModifier(caster, ability, "modifier_item_spirit_vessel_damage", { duration = duration })
target:AddNewModifier(caster, ability, "modifier_item_shadow_vessel_eye_damage", { duration = duration })
end
modifier_item_shadow_vessel_eye_damage = class({})
function modifier_item_shadow_vessel_eye_damage:GetTexture()
return "shadow_evil_ring"
end
function modifier_item_shadow_vessel_eye_damage:IsDebuff() return true end
function modifier_item_shadow_vessel_eye_damage:IsHidden() return false end
function modifier_item_shadow_vessel_eye_damage:IsPurgable() return false end
function modifier_item_shadow_vessel_eye_damage:IsPurgeException() return false end
function modifier_item_shadow_vessel_eye_damage:OnCreated()
local ability = self:GetAbility()
if not ability then return end
self.max_hp_damage_pct = ability:GetSpecialValueFor("max_hp_damage_pct") * 0.01
self.status_resistance_reduction = ability:GetSpecialValueFor("status_resistance_reduction")
if not IsServer() then return end
self.damageTable = {
attacker = self:GetCaster(),
victim = self:GetParent(),
damage_type = DAMAGE_TYPE_PURE,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION,
ability = ability
}
self:StartIntervalThink(1)
end
function modifier_item_shadow_vessel_eye_damage:OnIntervalThink()
if not IsServer() then return end
self.damageTable.damage = self:GetParent():GetMaxHealth() * self.max_hp_damage_pct
ApplyDamage(self.damageTable)
end
function modifier_item_shadow_vessel_eye_damage:DeclareFunctions()
return {
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
MODIFIER_PROPERTY_TOOLTIP,
MODIFIER_PROPERTY_TOOLTIP2
}
end
function modifier_item_shadow_vessel_eye_damage:GetModifierStatusResistanceStacking()
return -self.status_resistance_reduction
end
function modifier_item_shadow_vessel_eye_damage:OnTooltip()
return self.max_hp_damage_pct * 100
end
function modifier_item_shadow_vessel_eye_damage:OnTooltip2()
return self.status_resistance_reduction
end
