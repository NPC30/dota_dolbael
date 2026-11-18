LinkLuaModifier("modifier_special_bonus_unique_centaur_upgrade_listener",
"abilities/special_bonus_unique_centaur_upgrade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_special_bonus_unique_centaur_upgrade_strength",
"abilities/special_bonus_unique_centaur_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_centaur_upgrade = class({})
function special_bonus_unique_centaur_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_centaur_upgrade_listener"
end
modifier_special_bonus_unique_centaur_upgrade_listener = class({})
function modifier_special_bonus_unique_centaur_upgrade_listener:IsHidden() return true end
function modifier_special_bonus_unique_centaur_upgrade_listener:IsPurgable() return false end
function modifier_special_bonus_unique_centaur_upgrade_listener:RemoveOnDeath() return false end
function modifier_special_bonus_unique_centaur_upgrade_listener:OnCreated()
if not IsServer() then return end
local parent = self:GetParent()
if parent and not parent:IsNull() then
parent:RemoveModifierByName("modifier_centaur_doubleedge_buff")
end
self:ScheduleNextAutoCastCheck(self:GetAutoCastCheckInterval())
end
function modifier_special_bonus_unique_centaur_upgrade_listener:OnRefresh()
if not IsServer() then return end
self:ScheduleNextAutoCastCheck(self:GetAutoCastCheckInterval())
end
function modifier_special_bonus_unique_centaur_upgrade_listener:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED,
}
end
function modifier_special_bonus_unique_centaur_upgrade_listener:OnAbilityExecuted(params)
if not IsServer() then return end
local parent = self:GetParent()
if params.unit ~= parent then return end
if not params.ability or params.ability:IsNull() then return end
if params.ability:GetAbilityName() ~= "centaur_double_edge" then return end
Timers:CreateTimer(0.03, function()
if not parent or parent:IsNull() then return end
self:TransferDoubleEdgeBuffStacks()
parent:RemoveModifierByName("modifier_centaur_doubleedge_buff")
end)
end
function modifier_special_bonus_unique_centaur_upgrade_listener:OnIntervalThink()
if not IsServer() then return end
self:CheckAndAutoCastDoubleEdge()
end
function modifier_special_bonus_unique_centaur_upgrade_listener:GetAutoCastCheckInterval()
local ability = self:GetAbility()
local interval = ability and ability:GetSpecialValueFor("autocast_check_interval") or 0.5
if not interval or interval <= 0 then interval = 0.5 end
return interval
end
function modifier_special_bonus_unique_centaur_upgrade_listener:ScheduleNextAutoCastCheck(delay)
if not IsServer() then return end
self:StartIntervalThink(math.max(delay or self:GetAutoCastCheckInterval(), 0.1))
end
function modifier_special_bonus_unique_centaur_upgrade_listener:CheckAndAutoCastDoubleEdge()
local parent = self:GetParent()
local ability = self:GetAbility()
local interval = self:GetAutoCastCheckInterval()
if not parent or parent:IsNull() or not parent:IsAlive() then
self:ScheduleNextAutoCastCheck(interval)
return
end
if not ability or ability:IsNull() or not ability:GetAutoCastState() then
self:ScheduleNextAutoCastCheck(interval)
return
end
local double_edge = parent:FindAbilityByName("centaur_double_edge")
if not double_edge or double_edge:IsNull() or double_edge:GetLevel() <= 0 then
self:ScheduleNextAutoCastCheck(interval)
return
end
local cooldown_remaining = double_edge:GetCooldownTimeRemaining()
if cooldown_remaining and cooldown_remaining > 0 then
self:ScheduleNextAutoCastCheck(cooldown_remaining)
return
end
if not double_edge:IsFullyCastable() or parent:IsSilenced() or parent:IsHexed() then
self:ScheduleNextAutoCastCheck(interval)
return
end
local origin = parent:GetAbsOrigin()
local cast_range = GetFullCastRange(parent, double_edge)
if not cast_range or cast_range <= 0 then
cast_range = double_edge:GetCastRange(origin, nil)
end
if not cast_range or cast_range <= 0 then
self:ScheduleNextAutoCastCheck(interval)
return
end
local enemies = FindUnitsInRadius(
parent:GetTeamNumber(),
origin,
nil,
cast_range,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS,
FIND_CLOSEST,
false
)
if not enemies or #enemies <= 0 then
self:ScheduleNextAutoCastCheck(interval)
return
end
parent:CastAbilityOnTarget(enemies[1], double_edge, parent:GetPlayerOwnerID())
local next_delay = double_edge:GetCooldownTimeRemaining()
if not next_delay or next_delay <= 0 then next_delay = interval end
self:ScheduleNextAutoCastCheck(next_delay)
end
function modifier_special_bonus_unique_centaur_upgrade_listener:TransferDoubleEdgeBuffStacks()
local parent = self:GetParent()
if not parent or parent:IsNull() then return end
local double_edge_buff = parent:FindModifierByName("modifier_centaur_doubleedge_buff")
if not double_edge_buff then return end
local stacks_to_add = double_edge_buff:GetStackCount()
if stacks_to_add <= 0 then stacks_to_add = 1 end
if stacks_to_add <= 0 then return end
self:AddStrengthStacks(stacks_to_add)
end
function modifier_special_bonus_unique_centaur_upgrade_listener:AddStrengthStacks(stacks_to_add)
local parent = self:GetParent()
if not parent or parent:IsNull() then return end
local ability = self:GetAbility()
if not ability or ability:IsNull() then return end
local duration = ability:GetSpecialValueFor("stack_duration")
local max_stacks = ability:GetSpecialValueFor("max_stacks")
if duration <= 0 then duration = 15 end
if max_stacks <= 0 then max_stacks = 20 end
local modifier = parent:FindModifierByName("modifier_special_bonus_unique_centaur_upgrade_strength")
if not modifier then
modifier = parent:AddNewModifier(parent, ability, "modifier_special_bonus_unique_centaur_upgrade_strength", {
duration = duration,
})
end
if modifier then
modifier:SetDuration(duration, true)
modifier:SetStackCount(math.min(modifier:GetStackCount() + stacks_to_add, max_stacks))
end
end
modifier_special_bonus_unique_centaur_upgrade_strength = class({})
function modifier_special_bonus_unique_centaur_upgrade_strength:IsHidden() return false end
function modifier_special_bonus_unique_centaur_upgrade_strength:IsPurgable() return false end
function modifier_special_bonus_unique_centaur_upgrade_strength:IsDebuff() return false end
function modifier_special_bonus_unique_centaur_upgrade_strength:OnCreated()
local parent = self:GetParent()
local ability = self:GetAbility()
self.source_strength = parent and parent:GetStrength() or 0
self.strength_pct_per_stack = ability and ability:GetSpecialValueFor("strength_pct_per_stack") or 12
self.bonus_strength = 0
if IsServer() and self:GetStackCount() <= 0 then
self:SetStackCount(0)
end
self:UpdateBonusStrength()
end
function modifier_special_bonus_unique_centaur_upgrade_strength:OnRefresh()
local ability = self:GetAbility()
self.strength_pct_per_stack = ability and ability:GetSpecialValueFor("strength_pct_per_stack") or 12
self:UpdateBonusStrength()
end
function modifier_special_bonus_unique_centaur_upgrade_strength:OnStackCountChanged()
self:UpdateBonusStrength()
end
function modifier_special_bonus_unique_centaur_upgrade_strength:UpdateBonusStrength()
self.bonus_strength = self.source_strength * self.strength_pct_per_stack * self:GetStackCount() * 0.01
end
function modifier_special_bonus_unique_centaur_upgrade_strength:DeclareFunctions()
return {
MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
}
end
function modifier_special_bonus_unique_centaur_upgrade_strength:GetModifierBonusStats_Strength()
return self.bonus_strength or 0
end
