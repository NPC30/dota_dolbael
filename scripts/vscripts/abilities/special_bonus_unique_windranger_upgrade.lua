LinkLuaModifier("modifier_special_bonus_unique_windranger_upgrade_channel",
"abilities/special_bonus_unique_windranger_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_windranger_upgrade = class({})
function special_bonus_unique_windranger_upgrade:GetAOERadius()
return self:GetSpecialValueFor("radius")
end
function special_bonus_unique_windranger_upgrade:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
caster:AddNewModifier(caster, self, "modifier_special_bonus_unique_windranger_upgrade_channel", {
duration = self:GetChannelTime(),
x = self:GetCursorPosition().x,
y = self:GetCursorPosition().y,
z = self:GetCursorPosition().z
})
end
function special_bonus_unique_windranger_upgrade:OnChannelFinish()
if not IsServer() then return end
self:GetCaster():RemoveModifierByName("modifier_special_bonus_unique_windranger_upgrade_channel")
end
modifier_special_bonus_unique_windranger_upgrade_channel = class({})
function modifier_special_bonus_unique_windranger_upgrade_channel:IsHidden() return false end
function modifier_special_bonus_unique_windranger_upgrade_channel:IsPurgable() return false end
function modifier_special_bonus_unique_windranger_upgrade_channel:OnCreated(kv)
if not IsServer() then return end
local ability = self:GetAbility()
self.center = Vector(tonumber(kv.x) or 0, tonumber(kv.y) or 0, tonumber(kv.z) or 0)
self.radius = ability:GetSpecialValueFor("radius")
if self.radius <= 0 then
self.radius = 600
end
self.target_refresh_interval = ability:GetSpecialValueFor("target_refresh_interval")
if self.target_refresh_interval <= 0 then
self.target_refresh_interval = 0.6
end
self.cached_enemies = {}
self.next_target_refresh_time = 0
self:StartIntervalThink(0.03)
end
function modifier_special_bonus_unique_windranger_upgrade_channel:RefreshTargets()
local caster = self:GetParent()
self.cached_enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
self.center,
nil,
self.radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
FIND_ANY_ORDER,
false
)
end
function modifier_special_bonus_unique_windranger_upgrade_channel:OnIntervalThink()
if not IsServer() then return end
local caster = self:GetParent()
if not caster:IsAlive() or not caster:IsChanneling() then
self:Destroy()
return
end
local base_attack_time = caster:GetBaseAttackTime(true)
local attack_speed = caster:GetAttackSpeed(false)
local interval = 1
if attack_speed and attack_speed > 0 then
interval = base_attack_time / attack_speed / 2
end
if interval < 0.1 then
interval = 0.1
end
local now = GameRules:GetGameTime()
if now >= self.next_target_refresh_time then
self:RefreshTargets()
self.next_target_refresh_time = now + self.target_refresh_interval
end
local valid_enemies = {}
for _, enemy in pairs(self.cached_enemies or {}) do
if enemy and not enemy:IsNull() and enemy:IsAlive()
and enemy:GetTeamNumber() ~= caster:GetTeamNumber()
and (enemy:GetAbsOrigin() - self.center):Length2D() <= self.radius then
table.insert(valid_enemies, enemy)
end
end
if #valid_enemies > 0 then
local enemy = valid_enemies[RandomInt(1, #valid_enemies)]
caster:PerformAttack(enemy, true, true, true, false, true, false, true)
end
self:StartIntervalThink(interval)
end
