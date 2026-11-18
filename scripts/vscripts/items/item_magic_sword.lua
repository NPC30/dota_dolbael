LinkLuaModifier("modifier_item_magic_sword_active_proc", "items/item_magic_sword", LUA_MODIFIER_MOTION_NONE)
function MagicSwordOnCreated(keys)
if not IsServer() then return end
local caster = keys.caster
local ability = keys.ability
if not caster or not ability then return end
local battlefury_modifier = caster:AddNewModifier(caster, ability, "modifier_item_battlefury", {})
local desolator_modifier = caster:AddNewModifier(caster, ability, "modifier_item_desolator", {})
if not ability.added_modifiers then
ability.added_modifiers = {}
end
if battlefury_modifier then
table.insert(ability.added_modifiers, battlefury_modifier)
end
if desolator_modifier then
table.insert(ability.added_modifiers, desolator_modifier)
end
end
function MagicSwordOnDestroy(keys)
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
function MagicSwordActiveOnCreated(keys)
if not IsServer() then return end
local caster = keys.caster
local ability = keys.ability
if not caster or not ability then return end
local duration = ability:GetSpecialValueFor("active_duration")
caster:AddNewModifier(caster, ability, "modifier_item_magic_sword_active_proc", { duration = duration })
end
modifier_item_magic_sword_active_proc = class({})
function modifier_item_magic_sword_active_proc:IsDebuff() return false end
function modifier_item_magic_sword_active_proc:IsHidden() return true end
function modifier_item_magic_sword_active_proc:IsPurgable() return false end
function modifier_item_magic_sword_active_proc:RemoveOnDeath() return true end
function modifier_item_magic_sword_active_proc:OnCreated()
local ability = self:GetAbility()
self.convert_pct = ability and ability:GetSpecialValueFor("convert_pct") or 0
end
function modifier_item_magic_sword_active_proc:DeclareFunctions()
return {
MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end
function modifier_item_magic_sword_active_proc:GetModifierProcAttack_Feedback(keys)
if not IsServer() then return end
local parent = self:GetParent()
if keys.attacker ~= parent then return end
if keys.target:GetTeam() == parent:GetTeam() then return end
local ability = self:GetAbility()
if not ability then return end
local pure_damage = keys.damage * self.convert_pct / 100
if keys.target:IsBuilding() then
pure_damage = pure_damage * 2
end
if pure_damage <= 0 then return end
ApplyDamage({
victim = keys.target,
attacker = parent,
damage = pure_damage,
damage_type = DAMAGE_TYPE_PURE,
ability = ability,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION
})
SendOverheadEventMessage(nil, OVERHEAD_ALERT_DAMAGE, keys.target, pure_damage, nil)
end
