modifier_artoria_instinct_lottery = class({})
function modifier_artoria_instinct_lottery:IsHidden()
return true
end
function modifier_artoria_instinct_lottery:IsPurgable()
return false
end
function modifier_artoria_instinct_lottery:RemoveOnDeath()
return false
end
function modifier_artoria_instinct_lottery:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_START,
MODIFIER_EVENT_ON_ABILITY_FULLY_CAST,
MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
}
end
function modifier_artoria_instinct_lottery:OnCreated()
self.native_modifier_name = "modifier_antimage_counterspell"
self:RefreshValues()
if IsServer() then
self:StartIntervalThink(1.0)
end
end
function modifier_artoria_instinct_lottery:OnRefresh()
self:RefreshValues()
end
function modifier_artoria_instinct_lottery:RefreshValues()
local ability = self:GetAbility()
if not ability or ability:IsNull() then return end
self.magic_res = ability:GetSpecialValueFor("magic_res")
self.status_res = ability:GetSpecialValueFor("status_res")
self.shield_duration = ability:GetSpecialValueFor("shield_duration")
if self.shield_duration <= 0 then
self.shield_duration = 1.0
end
end
function modifier_artoria_instinct_lottery:OnDestroy()
if not IsServer() then return end
local parent = self:GetParent()
if not parent or parent:IsNull() then return end
local shield = parent:FindModifierByName(self.native_modifier_name)
if shield then
shield:Destroy()
end
end
function modifier_artoria_instinct_lottery:OnIntervalThink()
if not IsServer() then return end
local parent = self:GetParent()
local ability = self:GetAbility()
if not parent or parent:IsNull() or not parent:IsAlive() then return end
if not ability or ability:IsNull() then return end
if ability:GetLevel() <= 0 then
ability:SetLevel(1)
end
end
function modifier_artoria_instinct_lottery:GetModifierMagicalResistanceBonus()
return self.magic_res or 0
end
function modifier_artoria_instinct_lottery:GetModifierStatusResistanceStacking()
return self.status_res or 0
end
function modifier_artoria_instinct_lottery:OnAbilityStart(params)
if not IsServer() then return end
local parent = self:GetParent()
if not self:IsEnemyTargetedSpell(params, parent) then return end
local ability_name = params.ability:GetAbilityName()
if self.skip_abilities[ability_name] then
return
end
if self.late_arm_abilities[ability_name] then
return
end
self:ArmShield()
end
function modifier_artoria_instinct_lottery:OnAbilityFullyCast(params)
if not IsServer() then return end
local parent = self:GetParent()
if not self:IsEnemyTargetedSpell(params, parent) then return end
local ability_name = params.ability:GetAbilityName()
if not self.late_arm_abilities[ability_name] then return end
if self.skip_abilities[ability_name] then return end
self:ArmShield()
end
function modifier_artoria_instinct_lottery:IsEnemyTargetedSpell(params, parent)
if not parent or parent:IsNull() then return false end
if not params or not params.unit or params.unit:IsNull() then return false end
if not params.ability or params.ability:IsNull() then return false end
if params.unit:GetTeamNumber() == parent:GetTeamNumber() then return false end
if params.target ~= parent then return false end
return true
end
function modifier_artoria_instinct_lottery:ArmShield()
local parent = self:GetParent()
local ability = self:GetAbility()
if not parent or parent:IsNull() then return end
if not ability or ability:IsNull() then return end
if not ability:IsCooldownReady() then return end
if parent:FindModifierByName(self.native_modifier_name) then return end
parent:AddNewModifier(parent, ability, self.native_modifier_name, {
duration = self.shield_duration,
})
local level = math.max(ability:GetLevel() - 1, 0)
local cooldown = ability:GetCooldown(level)
ability:StartCooldown(cooldown)
end
modifier_artoria_instinct_lottery.late_arm_abilities = {
["oracle_fortunes_end"] = true,
["medusa_mystic_snake"] = true,
["viper_viper_strike"] = true,
}
modifier_artoria_instinct_lottery.skip_abilities = {
["lion_impale"] = true,
}
