LinkLuaModifier("modifier_special_bonus_unique_pangolier_upgrade",
"abilities/special_bonus_unique_pangolier_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_pangolier_upgrade = class({})
function special_bonus_unique_pangolier_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_pangolier_upgrade"
end
modifier_special_bonus_unique_pangolier_upgrade = class({})
function modifier_special_bonus_unique_pangolier_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_pangolier_upgrade:IsPermanent() return true end
function modifier_special_bonus_unique_pangolier_upgrade:RemoveOnDeath() return false end
function modifier_special_bonus_unique_pangolier_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_pangolier_upgrade:OnCreated()
if not IsServer() then return end
local parent = self:GetParent()
end
function modifier_special_bonus_unique_pangolier_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED
}
end
function modifier_special_bonus_unique_pangolier_upgrade:ApplyShieldCrashCooldownPct(ability, cooldown_pct, stage)
if not ability or ability:IsNull() then
return
end
local remaining = ability:GetCooldownTimeRemaining() or 0
local target_cooldown = remaining * cooldown_pct / 100
if target_cooldown > 0 and remaining > target_cooldown then
ability:EndCooldown()
ability:StartCooldown(target_cooldown)
end
end
function modifier_special_bonus_unique_pangolier_upgrade:OnAbilityExecuted(params)
if not IsServer() then return end
local parent = self:GetParent()
if params.unit ~= parent then return end
if parent:IsIllusion() then return end
local ability = params.ability
if not ability or ability:IsNull() then return end
local ability_name = ability:GetAbilityName()
if ability_name ~= "pangolier_shield_crash" then return end
if not (parent:HasModifier("modifier_pangolier_gyroshell")or parent:HasModifier("modifier_pangolier_rollup")) then return end
local cooldown_pct = self:GetAbility():GetSpecialValueFor("shield_crash_cooldown_pct")
if cooldown_pct <= 0 then return end
self:ApplyShieldCrashCooldownPct(ability, cooldown_pct, "immediate")
Timers:CreateTimer(FrameTime(), function()
self:ApplyShieldCrashCooldownPct(ability, cooldown_pct, "next_frame")
return nil
end)
end
