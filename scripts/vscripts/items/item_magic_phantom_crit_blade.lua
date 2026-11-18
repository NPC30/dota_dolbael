item_magic_phantom_crit_blade = class({})
function item_magic_phantom_crit_blade:GetIntrinsicModifierName()
return "modifier_item_magic_phantom_crit_blade"
end
function item_magic_phantom_crit_blade:IsRefreshable()
return false
end
LinkLuaModifier("modifier_item_magic_phantom_crit_blade", "items/item_magic_phantom_crit_blade", LUA_MODIFIER_MOTION_NONE)
modifier_item_magic_phantom_crit_blade = class({})
function modifier_item_magic_phantom_crit_blade:IsHidden()
return true
end
function modifier_item_magic_phantom_crit_blade:IsPurgable()
return false
end
function modifier_item_magic_phantom_crit_blade:RemoveOnDeath()
return false
end
function modifier_item_magic_phantom_crit_blade:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_magic_phantom_crit_blade:OnCreated()
self:OnRefresh()
if IsServer() then
if self:GetAbility() then
self.spell_amp_per_int = self:GetAbility():GetSpecialValueFor("spell_amp_per_int") or 0.3
self.spell_lifesteal = self:GetAbility():GetSpecialValueFor("spell_lifesteal") or 30
end
for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
mod:GetAbility():SetSecondaryCharges(_)
end
end
end
function modifier_item_magic_phantom_crit_blade:OnRefresh()
self.stats_modifier_name = "modifier_item_magic_phantom_crit_blade_stats"
if IsServer() then
RefreshItemDataDrivenModifier(self:GetParent(), self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_magic_phantom_crit_blade:OnDestroy()
if IsServer() then
RefreshItemDataDrivenModifier(self:GetParent(), self:GetAbility(), self.stats_modifier_name)
for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
mod:GetAbility():SetSecondaryCharges(_)
end
end
end
function modifier_item_magic_phantom_crit_blade:DeclareFunctions()
return {
MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
MODIFIER_PROPERTY_SPELL_LIFESTEAL_AMPLIFY_PERCENTAGE,
MODIFIER_EVENT_ON_ATTACK_LANDED,
}
end
function modifier_item_magic_phantom_crit_blade:OnAttackLanded(params)
if not IsServer() then return end
if params.attacker ~= self:GetParent() then return end
if params.target:IsBuilding() then return end
local ability = self:GetAbility()
if not ability or ability:GetSecondaryCharges() ~= 1 then return end
local phantom_crit_chance = ability:GetSpecialValueFor("phantom_crit_chance")
if not RollPseudoRandomPercentage(phantom_crit_chance, DOTA_PSEUDO_RANDOM_NONE, self) then return end
local base_damage = params.attacker:GetAverageTrueAttackDamage(params.attacker)
local phantom_crit_multiplier = ability:GetSpecialValueFor("phantom_crit_multiplier")
local damage = base_damage * (phantom_crit_multiplier / 100)
ApplyDamage({
victim = params.target,
attacker = params.attacker,
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = ability,
})
EmitSoundOn("Hero_Brewmaster.Brawler.Crit", params.target)
SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, params.target, damage, nil)
end
function modifier_item_magic_phantom_crit_blade:GetModifierSpellAmplify_Percentage()
local ability = self:GetAbility()
if not ability or ability:GetSecondaryCharges() ~= 1 then
return 0
end
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
function modifier_item_magic_phantom_crit_blade:GetModifierSpellLifestealRegenAmplify_Percentage()
local ability = self:GetAbility()
if not ability then return 0 end
return ability:GetSpecialValueFor("spell_lifesteal")
end
function modifier_item_magic_phantom_crit_blade:GetTexture()
return "molongkuangwu2"
end
