item_switchable_crit_blade = class({})
function item_switchable_crit_blade:GetIntrinsicModifierName()
return "modifier_item_switchable_crit_blade"
end
function item_switchable_crit_blade:IsRefreshable()
return false
end
function item_switchable_crit_blade:OnSpellStart()
local caster = self:GetCaster()
if not caster or caster:IsNull() then
return
end
local modifier = caster:FindModifierByName("modifier_item_switchable_crit_blade")
if not modifier then return end
if modifier.is_on_cooldown then return end
local current_mode = modifier:GetStackCount()
if current_mode == 0 then current_mode = 1 end
current_mode = current_mode + 1
if current_mode > 3 then current_mode = 1 end
modifier:SetStackCount(current_mode)
self:SetSecondaryCharges(current_mode)
modifier:CacheValues()
EmitSoundOn("Item.ToggleOn", caster)
end
function item_switchable_crit_blade:GetCooldown(level)
local caster = self:GetCaster()
if not caster or caster:IsNull() then
return 0
end
local modifier = caster:FindModifierByName("modifier_item_switchable_crit_blade")
if modifier then
local mode = modifier:GetStackCount()
if mode == 0 then mode = 1 end
return self:GetSpecialValueFor("cooldown_mode" .. mode)
end
return 0
end
LinkLuaModifier("modifier_item_switchable_crit_blade", "items/item_switchable_crit_blade", LUA_MODIFIER_MOTION_NONE)
modifier_item_switchable_crit_blade = class({})
function modifier_item_switchable_crit_blade:IsHidden()
return false
end
function modifier_item_switchable_crit_blade:IsPurgable()
return false
end
function modifier_item_switchable_crit_blade:RemoveOnDeath()
return false
end
function modifier_item_switchable_crit_blade:GetAttributes()
return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_switchable_crit_blade:GetModifierPriority()
return MODIFIER_PRIORITY_SUPER_ULTRA
end
function modifier_item_switchable_crit_blade:CacheValues()
local ability = self:GetAbility()
if not ability then return end
self.ability = ability
self.parent = self:GetParent()
self.mode = self:GetStackCount()
if self.mode == 0 then self.mode = 1 end
self.guaranteed_crit_multiplier = ability:GetSpecialValueFor("guaranteed_crit_multiplier_mode" .. self.mode)
self.crit_chance = ability:GetSpecialValueFor("crit_chance_mode" .. self.mode)
self.crit_multiplier = ability:GetSpecialValueFor("crit_multiplier_mode" .. self.mode)
self.cooldown = ability:GetSpecialValueFor("cooldown_mode" .. self.mode)
self.has_double_crit = self.parent:HasModifier("modifier_player_reno")
self.reno_crit_multiplier = 1
if self.has_double_crit then
self.reno_crit_multiplier = math.min(1 + self.parent:GetAgility() / 1000, 10)
end
end
function modifier_item_switchable_crit_blade:OnCreated()
self:OnRefresh()
self:CacheValues()
if IsServer() then
local ability = self:GetAbility()
if not ability then return end
local saved_mode = ability:GetSecondaryCharges()
if saved_mode > 0 and saved_mode <= 3 then
self:SetStackCount(saved_mode)
elseif self:GetStackCount() == 0 then
self:SetStackCount(1)
ability:SetSecondaryCharges(1)
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
end
function modifier_item_switchable_crit_blade:OnRefresh()
self.stats_modifier_name = "modifier_item_switchable_crit_blade_stats"
self:CacheValues()
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_switchable_crit_blade:OnDestroy()
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_switchable_crit_blade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ATTACK_LANDED,
MODIFIER_PROPERTY_TOOLTIP,
MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE,
}
end
function modifier_item_switchable_crit_blade:OnTooltip()
return self:GetStackCount()
end
function modifier_item_switchable_crit_blade:GetModifierPreAttack_CriticalStrike(params)
if not IsServer() then return 0 end
local function record_guihai_crit_multiplier(multiplier)
self.magic_sword_crit_multiplier = multiplier
end
if self.has_guaranteed_crit then
self.triggered_guaranteed_crit = true
self.triggered_chance_crit = false
record_guihai_crit_multiplier(self.guaranteed_crit_multiplier)
return self.guaranteed_crit_multiplier * 100
end
if RandomFloat(0, 100) <= self.crit_chance then
local final_multiplier = self.crit_multiplier
if self.has_double_crit then
final_multiplier = final_multiplier * (self.reno_crit_multiplier or 1)
end
self.triggered_guaranteed_crit = false
self.triggered_chance_crit = true
record_guihai_crit_multiplier(final_multiplier)
return final_multiplier * 100
elseif RandomFloat(0, 100) <= 30 then
local fallback_multiplier = 3.3 * (self.reno_crit_multiplier or 1)
record_guihai_crit_multiplier(fallback_multiplier)
return fallback_multiplier * 100
end
record_guihai_crit_multiplier(1)
self.triggered_chance_crit = false
return 0
end
function modifier_item_switchable_crit_blade:OnAttackLanded(params)
if not IsServer() then return end
if params.attacker ~= self:GetParent() then return end
if self.triggered_guaranteed_crit then
self.has_guaranteed_crit = false
self.is_on_cooldown = true
self.triggered_guaranteed_crit = false
self.ability:StartCooldown(self.cooldown)
EmitSoundOn("Hero_Brewmaster.Brawler.Crit", params.target)
self:StartIntervalThink(self.cooldown)
end
if self.triggered_chance_crit then
EmitSoundOn("Hero_Brewmaster.Brawler.Crit", params.target)
self.triggered_chance_crit = false
end
end
function modifier_item_switchable_crit_blade:OnIntervalThink()
if IsServer() then
self:CacheValues()
self.has_guaranteed_crit = true
self.is_on_cooldown = false
self:StartIntervalThink(-1)
end
end
function modifier_item_switchable_crit_blade:GetTexture()
return "guihaiyidao"
end
