item_magic_crit_blade = class({})
function item_magic_crit_blade:GetIntrinsicModifierName()
return "modifier_item_magic_crit_blade"
end
function item_magic_crit_blade:IsRefreshable()
return false
end
function item_magic_crit_blade:OnSpellStart()
local caster = self:GetCaster()
local all_modifiers = caster:FindAllModifiersByName("modifier_item_magic_crit_blade")
if not all_modifiers or #all_modifiers == 0 then return end
local first_modifier = all_modifiers[1]
if first_modifier.is_on_cooldown then return end
local current_mode = first_modifier:GetStackCount()
if current_mode == 0 then current_mode = 1 end
current_mode = current_mode + 1
if current_mode > 3 then current_mode = 1 end
for _, mod in pairs(all_modifiers) do
mod:SetStackCount(current_mode)
end
EmitSoundOn("Item.ToggleOn", caster)
end
function item_magic_crit_blade:GetCooldown(level)
local caster = self:GetCaster()
if not caster then return 0 end
if caster:IsNull() then return 0 end
local success, all_modifiers = pcall(function()
return caster:FindAllModifiersByName("modifier_item_magic_crit_blade")
end)
if success and all_modifiers and #all_modifiers > 0 then
local modifier = all_modifiers[1]
local mode = modifier:GetStackCount()
if mode == 0 then mode = 1 end
return self:GetSpecialValueFor("cooldown_mode" .. mode)
end
return 0
end
LinkLuaModifier("modifier_item_magic_crit_blade", "items/item_magic_crit_blade", LUA_MODIFIER_MOTION_NONE)
modifier_item_magic_crit_blade = class({})
function modifier_item_magic_crit_blade:IsHidden()
return false
end
function modifier_item_magic_crit_blade:IsPurgable()
return false
end
function modifier_item_magic_crit_blade:RemoveOnDeath()
return false
end
function modifier_item_magic_crit_blade:GetAttributes()
return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_magic_crit_blade:GetModifierPriority()
return MODIFIER_PRIORITY_SUPER_ULTRA
end
function modifier_item_magic_crit_blade:OnCreated()
self:OnRefresh()
if IsServer() then
local ability = self:GetAbility()
if not ability then return end
local saved_mode = ability:GetSecondaryCharges()
if saved_mode > 0 and saved_mode <= 3 then
self:SetStackCount(saved_mode)
elseif self:GetStackCount() == 0 then
self:SetStackCount(1)
end
for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
mod:GetAbility():SetSecondaryCharges(_)
end
local remaining_cooldown = ability:GetCooldownTimeRemaining()
if remaining_cooldown > 0 then
self.has_guaranteed_crit = false
self.is_on_cooldown = true
self:StartIntervalThink(remaining_cooldown)
else
self.has_guaranteed_crit = true
self.is_on_cooldown = false
end
end
if self:GetAbility() then
self.spell_amp_per_int = self:GetAbility():GetSpecialValueFor("spell_amp_per_int") or 0.3
self.spell_lifesteal = self:GetAbility():GetSpecialValueFor("spell_lifesteal") or 30
else
self.spell_amp_per_int = 0.3
self.spell_lifesteal = 30
end
end
function modifier_item_magic_crit_blade:OnRefresh()
self.stats_modifier_name = "modifier_item_magic_crit_blade_stats"
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_magic_crit_blade:OnDestroy()
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_magic_crit_blade:DeclareFunctions()
return {
MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
MODIFIER_PROPERTY_SPELL_LIFESTEAL_AMPLIFY_PERCENTAGE,
MODIFIER_EVENT_ON_TAKEDAMAGE,
MODIFIER_PROPERTY_TOOLTIP,
}
end
function modifier_item_magic_crit_blade:GetModifierSpellAmplify_Percentage()
if self:GetParent():HasModifier("modifier_item_magic_phantom_crit_blade") then
return 0
end
if self:GetAbility() and self:GetAbility():GetSecondaryCharges() == 1 then
local ability = self:GetAbility()
if not ability or ability:IsNull() then return 0 end
local spell_amp_per_int = ability:GetSpecialValueFor("spell_amp_per_int")
local parent = self:GetParent()
if parent:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
local current_int = parent:GetIntellect(false)
return current_int * spell_amp_per_int
else
local total_stats = parent:GetStrength() + parent:GetAgility() + parent:GetIntellect(false)
return total_stats * spell_amp_per_int / 4
end
end
return 0
end
function modifier_item_magic_crit_blade:GetModifierSpellLifestealRegenAmplify_Percentage()
if self:GetAbility() and self:GetAbility():GetSecondaryCharges() == 1 then
local ability = self:GetAbility()
if not ability or ability:IsNull() then return 0 end
local spell_lifesteal = ability:GetSpecialValueFor("spell_lifesteal")
return spell_lifesteal
end
return 0
end
function modifier_item_magic_crit_blade:OnTooltip()
return self:GetStackCount()
end
function modifier_item_magic_crit_blade:OnTakeDamage(params)
if not IsServer() then return end
if params.damage < 200 then return end
local parent = self:GetParent()
local ability = self:GetAbility()
if params.attacker ~= parent then return end
if params.inflictor then
local ability_name = params.inflictor:GetAbilityName()
if ability_name == "lich_sinister_gaze" or
string.find(ability_name, "lich_sinister_gaze") or
ability_name == "item_blade_mail" or
ability_name == "item_blade_mail_2" or
ability_name == "item_magic_phantom_crit_blade" or
ability_name == "item_beast_armor" then
return
end
end
if bit.band(params.damage_flags, DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION) == DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION then
return
end
if bit.band(params.damage_flags, DOTA_DAMAGE_FLAG_REFLECTION) == DOTA_DAMAGE_FLAG_REFLECTION then
return
end
if params.damage_type == DAMAGE_TYPE_PHYSICAL then return end
local target = params.unit
if not target or target:IsBuilding() then return end
if not ability or ability:GetSecondaryCharges() ~= 1 then return end
local mode = self:GetStackCount()
if mode == 0 then mode = 1 end
local should_crit = false
local multiplier = 0
local crit_type = ""
if self.has_guaranteed_crit then
should_crit = true
multiplier = ability:GetSpecialValueFor("guaranteed_spell_crit_multiplier_mode" .. mode)
self.triggered_guaranteed_crit = true
self.triggered_chance_crit = false
crit_type = "必然暴击"
else
local crit_chance = ability:GetSpecialValueFor("spell_crit_chance_mode" .. mode)
local roll = RandomFloat(0, 100)
if roll <= crit_chance then
should_crit = true
multiplier = ability:GetSpecialValueFor("spell_crit_multiplier_mode" .. mode)
self.triggered_guaranteed_crit = false
self.triggered_chance_crit = true
crit_type = "概率暴击"
else
self.triggered_chance_crit = false
end
end
if should_crit then
local extra_damage = params.original_damage * (multiplier - 1)
local total_damage = params.original_damage + extra_damage
ApplyDamage({
victim = target,
attacker = parent,
damage = extra_damage,
damage_type = params.damage_type,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_REFLECTION,
ability = ability,
})
if self.triggered_guaranteed_crit then
self.has_guaranteed_crit = false
self.is_on_cooldown = true
self.triggered_guaranteed_crit = false
local cooldown = ability:GetSpecialValueFor("cooldown_mode" .. mode)
ability:StartCooldown(cooldown)
self:StartIntervalThink(cooldown)
end
SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, target, extra_damage, nil)
EmitSoundOn("Hero_PhantomAssassin.CoupDeGrace", target)
end
end
function modifier_item_magic_crit_blade:OnIntervalThink()
if IsServer() then
self.has_guaranteed_crit = true
self.is_on_cooldown = false
self:StartIntervalThink(-1)
end
end
function modifier_item_magic_crit_blade:GetTexture()
return "molongkuangwu"
end
