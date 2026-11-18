LinkLuaModifier("modifier_special_bonus_unique_lycan_upgrade_tracker",
"abilities/special_bonus_unique_lycan_upgrade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_special_bonus_unique_lycan_upgrade_cleanup",
"abilities/special_bonus_unique_lycan_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_lycan_upgrade = class({})
local LYCAN_WOLF_MODIFIERS = {
"modifier_lycan_wolf_bite_lifesteal",
"modifier_lycan_shapeshift",
"modifier_lycan_shapeshift_aura",
"modifier_lycan_shapeshift_speed",
"modifier_lycan_apex_predator",
}
function special_bonus_unique_lycan_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_lycan_upgrade_tracker"
end
function special_bonus_unique_lycan_upgrade:ApplyMindControlToTarget(target)
local caster = self:GetCaster()
if not caster or caster:IsNull() or not target or target:IsNull() or not target:IsAlive() then
return
end
if target:GetTeamNumber() == caster:GetTeamNumber() then
return
end
if not target:IsRealHero() or IsHumanPlayer(target:GetPlayerOwnerID()) then
return
end
target:AddNewModifier(caster, self, "modifier_mind_control", { duration = 999999999 })
target:AddNewModifier(caster, self, "modifier_special_bonus_unique_lycan_upgrade_cleanup", {})
local wolf_bite = caster:FindAbilityByName("lycan_wolf_bite")
if wolf_bite and not wolf_bite:IsNull() and wolf_bite:GetLevel() > 0 then
caster:CastAbilityOnTarget(target, wolf_bite, caster:GetPlayerOwnerID())
end
end
local function ClearLycanWolfModifiers(target)
if not target or target:IsNull() then
return
end
for _, modifier_name in pairs(LYCAN_WOLF_MODIFIERS) do
if target:HasModifier(modifier_name) then
target:RemoveModifierByName(modifier_name)
end
end
end
modifier_special_bonus_unique_lycan_upgrade_cleanup = class({})
function modifier_special_bonus_unique_lycan_upgrade_cleanup:IsHidden() return true end
function modifier_special_bonus_unique_lycan_upgrade_cleanup:IsPurgable() return false end
function modifier_special_bonus_unique_lycan_upgrade_cleanup:RemoveOnDeath() return true end
function modifier_special_bonus_unique_lycan_upgrade_cleanup:OnCreated()
if not IsServer() then return end
self:StartIntervalThink(0.2)
end
function modifier_special_bonus_unique_lycan_upgrade_cleanup:OnIntervalThink()
if not IsServer() then return end
local parent = self:GetParent()
if not parent or parent:IsNull() or not parent:HasModifier("modifier_mind_control") then
ClearLycanWolfModifiers(parent)
self:Destroy()
end
end
function modifier_special_bonus_unique_lycan_upgrade_cleanup:OnDestroy()
if not IsServer() then return end
ClearLycanWolfModifiers(self:GetParent())
end
modifier_special_bonus_unique_lycan_upgrade_tracker = class({})
function modifier_special_bonus_unique_lycan_upgrade_tracker:IsHidden() return true end
function modifier_special_bonus_unique_lycan_upgrade_tracker:IsPurgable() return false end
function modifier_special_bonus_unique_lycan_upgrade_tracker:RemoveOnDeath() return false end
function modifier_special_bonus_unique_lycan_upgrade_tracker:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED,
}
end
function modifier_special_bonus_unique_lycan_upgrade_tracker:OnAbilityExecuted(params)
if not IsServer() then return end
if not params.ability or params.ability:IsNull() then return end
if params.ability:GetAbilityName() == "lycan_wolf_bite" then
self:CleanupWolfBiteAttackRange(params.target)
return
end
if params.ability:GetAbilityName() ~= "lycan_shapeshift" then return end
local parent = self:GetParent()
if params.unit ~= parent then return end
if GameRules:IsDaytime() then return end
local ability = self:GetAbility()
if not ability or ability:IsNull() then return end
local radius = ability:GetSpecialValueFor("radius")
if radius <= 0 then
radius = 1500
end
local enemies = FindUnitsInRadius(
parent:GetTeamNumber(),
parent:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE,
FIND_ANY_ORDER,
false
)
local candidates = {}
for _, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() and enemy:IsAlive() and enemy:IsRealHero() and
not IsHumanPlayer(enemy:GetPlayerOwnerID()) then
table.insert(candidates, enemy)
end
end
if #candidates <= 0 then return end
local target = candidates[RandomInt(1, #candidates)]
ability:ApplyMindControlToTarget(target)
end
function modifier_special_bonus_unique_lycan_upgrade_tracker:CleanupWolfBiteAttackRange(target)
if not target or target:IsNull() then return end
Timers:CreateTimer(1.0, function()
if not target or target:IsNull() then return end
if target:HasModifier("modifier_lycan_wolf_bite_attack_range") then
target:RemoveModifierByName("modifier_lycan_wolf_bite_attack_range")
end
if target:HasModifier("modifier_lycan_shapeshift_speed") then
target:RemoveModifierByName("modifier_lycan_shapeshift_speed")
end
end)
end
