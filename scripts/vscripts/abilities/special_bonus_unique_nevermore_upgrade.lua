LinkLuaModifier("modifier_special_bonus_unique_nevermore_upgrade",
"abilities/special_bonus_unique_nevermore_upgrade", LUA_MODIFIER_MOTION_NONE)
local BASE_REQUIEM_RADIUS = 1000
local BASE_REQUIEM_LINE_WIDTH_START = 150
local BASE_REQUIEM_LINE_WIDTH_END = 325
local DEFAULT_REQUIEM_LINE_SPEED = 700
special_bonus_unique_nevermore_upgrade = class({})
function special_bonus_unique_nevermore_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_nevermore_upgrade"
end
modifier_special_bonus_unique_nevermore_upgrade = class({})
function modifier_special_bonus_unique_nevermore_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_nevermore_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_nevermore_upgrade:IsDebuff() return false end
function modifier_special_bonus_unique_nevermore_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_START,
MODIFIER_EVENT_ON_ABILITY_EXECUTED,
}
end
function modifier_special_bonus_unique_nevermore_upgrade:OnAbilityStart(keys)
if not IsServer() then return end
local parent = self:GetParent()
if keys.unit ~= parent then
return
end
local ability = keys.ability
local abilityName = ability:GetAbilityName()
if abilityName == "nevermore_requiem" then
local duration = self:GetAbility():GetSpecialValueFor("invulnerability_duration") or 1.67
ApplyItemDataDrivenModifier(_, parent, "modifier_invulnerable_buff", { duration = duration })
self:StartIntervalThink(0.3)
self.check_ability = ability
end
end
function modifier_special_bonus_unique_nevermore_upgrade:OnAbilityExecuted(keys)
if not IsServer() then return end
local parent = self:GetParent()
if keys.unit ~= parent then return end
if parent:IsIllusion() then return end
local ability = keys.ability
if not ability or ability:IsNull() or ability:GetAbilityName() ~= "nevermore_requiem" then return end
self:TriggerExtraRequiemDamage(ability)
end
function modifier_special_bonus_unique_nevermore_upgrade:GetRequiemLineCount(parent)
if not parent or parent:IsNull() then return 0 end
return math.max(parent:GetModifierStackCount("modifier_nevermore_necromastery", parent) or 0, 0)
end
function modifier_special_bonus_unique_nevermore_upgrade:GetRequiemAoeValues(requiem)
local radius = requiem:GetSpecialValueFor("requiem_radius")
if not radius or radius <= 0 then radius = BASE_REQUIEM_RADIUS end
local aoe_bonus = math.max(radius - BASE_REQUIEM_RADIUS, 0)
local width_start = math.max(requiem:GetSpecialValueFor("requiem_line_width_start") or 0,
BASE_REQUIEM_LINE_WIDTH_START + aoe_bonus)
local width_end = math.max(requiem:GetSpecialValueFor("requiem_line_width_end") or 0,
BASE_REQUIEM_LINE_WIDTH_END + aoe_bonus)
return radius, width_start, width_end
end
function modifier_special_bonus_unique_nevermore_upgrade:CalculateExtraRequiemLineHits(distance, line_count, width_start,
width_end, radius)
if line_count <= 0 or distance > radius then return 0 end
if distance <= width_start then return line_count end
local distance_ratio = math.min(distance / math.max(radius, 1), 1)
local line_width = width_start + (width_end - width_start) * distance_ratio
local circumference = 2 * math.pi * math.max(distance, 1)
local hit_count = math.ceil(line_count * line_width / circumference)
return math.min(math.max(hit_count, 1), line_count)
end
function modifier_special_bonus_unique_nevermore_upgrade:TriggerExtraRequiemDamage(requiem)
local parent = self:GetParent()
if not parent or parent:IsNull() then return end
local line_count = self:GetRequiemLineCount(parent)
local damage_pct = self:GetAbility():GetSpecialValueFor("requiem_attack_damage_pct")
if not damage_pct or damage_pct <= 0 then damage_pct = 5 end
local damage_per_line = parent:GetAverageTrueAttackDamage(parent) * damage_pct / 100
if line_count <= 0 or damage_per_line <= 0 then return end
local radius, width_start, width_end = self:GetRequiemAoeValues(requiem)
local line_speed = requiem:GetSpecialValueFor("requiem_line_speed")
if not line_speed or line_speed <= 0 then line_speed = DEFAULT_REQUIEM_LINE_SPEED end
local origin = parent:GetAbsOrigin()
local enemies = FindUnitsInRadius(
parent:GetTeamNumber(),
origin,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() then
local distance = (enemy:GetAbsOrigin() - origin):Length2D()
local hit_count = self:CalculateExtraRequiemLineHits(distance, line_count, width_start, width_end, radius)
if hit_count > 0 then
local delay = 0
if distance > width_start then
delay = distance / line_speed
end
Timers:CreateTimer(delay, function()
if not enemy or enemy:IsNull() or not enemy:IsAlive() then return nil end
ApplyDamage({
victim = enemy,
attacker = parent,
damage = damage_per_line * hit_count,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = requiem,
})
return nil
end)
end
end
end
end
function modifier_special_bonus_unique_nevermore_upgrade:OnIntervalThink()
if not self.check_ability or self.check_ability:IsNull() then
self:StartIntervalThink(-1)
return
end
if not self.check_ability:IsChanneling() and not self.check_ability:IsInAbilityPhase() then
self:GetParent():RemoveModifierByName("modifier_invulnerable_buff")
self:StartIntervalThink(-1)
end
end
