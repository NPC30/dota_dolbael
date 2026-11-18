LinkLuaModifier("modifier_special_bonus_unique_shadow_shaman_giant_ward",
"abilities/special_bonus_unique_shadow_shaman_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_shadow_shaman_upgrade = class({})
function special_bonus_unique_shadow_shaman_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_shadow_shaman_upgrade"
end
LinkLuaModifier("modifier_special_bonus_unique_shadow_shaman_upgrade",
"abilities/special_bonus_unique_shadow_shaman_upgrade", LUA_MODIFIER_MOTION_NONE)
modifier_special_bonus_unique_shadow_shaman_upgrade = class({})
function modifier_special_bonus_unique_shadow_shaman_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_shadow_shaman_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_shadow_shaman_upgrade:RemoveOnDeath() return false end
local SHADOW_SHAMAN_WARD_NAMES = {
"npc_dota_shadow_shaman_ward_1",
"npc_dota_shadow_shaman_ward_2",
"npc_dota_shadow_shaman_ward_3"
}
local function IsShadowShamanWard(unit)
if not unit or unit:IsNull() then return false end
local name = unit:GetUnitName()
for _, ward_name in pairs(SHADOW_SHAMAN_WARD_NAMES) do
if name == ward_name then return true end
end
return false
end
local function IsAlreadyUpgradedWard(unit)
if not unit or unit:IsNull() then return false end
if unit._shadow_shaman_giant_ward then return true end
return unit:HasModifier("modifier_special_bonus_unique_shadow_shaman_giant_ward")
end
function modifier_special_bonus_unique_shadow_shaman_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_START,
MODIFIER_EVENT_ON_ABILITY_EXECUTED
}
end
function modifier_special_bonus_unique_shadow_shaman_upgrade:OnAbilityStart(params)
if not IsServer() then return end
local caster = self:GetParent()
if params.unit ~= caster then return end
local event_ability = params.ability
if not event_ability or event_ability:IsNull() then return end
if event_ability:GetAbilityName() ~= "shadow_shaman_mass_serpent_ward" then return end
if not self:GetAbility():GetAutoCastState() then return end
local cursor_pos = event_ability:GetCursorPosition()
if cursor_pos then
self.last_serpent_ward_pos = Vector(cursor_pos.x, cursor_pos.y, cursor_pos.z)
self.last_serpent_ward_time = GameRules:GetGameTime()
end
self.existing_serpent_wards = {}
for _, ward_name in pairs(SHADOW_SHAMAN_WARD_NAMES) do
local ward_entities = Entities:FindAllByClassname(ward_name) or {}
for _, unit in pairs(ward_entities) do
if unit and not unit:IsNull() and unit:GetTeamNumber() == caster:GetTeamNumber() then
self.existing_serpent_wards[unit:entindex()] = true
end
end
end
end
function modifier_special_bonus_unique_shadow_shaman_upgrade:OnAbilityExecuted(params)
if not IsServer() then return end
local caster = self:GetParent()
if params.unit ~= caster then return end
local event_ability = params.ability
if not event_ability or event_ability:IsNull() then return end
if event_ability:GetAbilityName() ~= "shadow_shaman_mass_serpent_ward" then return end
if not self:GetAbility():GetAutoCastState() then return end
local pos = nil
if self.last_serpent_ward_pos and self.last_serpent_ward_time and
GameRules:GetGameTime() - self.last_serpent_ward_time <= 2.0 then
pos = self.last_serpent_ward_pos
else
local cursor_pos = event_ability:GetCursorPosition()
if cursor_pos then
pos = Vector(cursor_pos.x, cursor_pos.y, cursor_pos.z)
end
end
if not pos then
pos = caster:GetAbsOrigin()
end
local existing_serpent_wards = self.existing_serpent_wards or {}
local function AddWardIfValid(result, seen, unit, center, radius)
if not IsShadowShamanWard(unit) then return end
if unit:GetTeamNumber() ~= caster:GetTeamNumber() then return end
if IsAlreadyUpgradedWard(unit) then return end
local ent_index = unit:entindex()
if existing_serpent_wards[ent_index] then return end
if seen[ent_index] then return end
if (unit:GetAbsOrigin() - center):Length2D() > radius then return end
seen[ent_index] = true
table.insert(result, unit)
end
local function CollectShadowShamanWards(center, radius)
local result = {}
local seen = {}
for _, ward_name in pairs(SHADOW_SHAMAN_WARD_NAMES) do
local ward_entities = Entities:FindAllByClassname(ward_name) or {}
for _, unit in pairs(ward_entities) do
AddWardIfValid(result, seen, unit, center, radius)
end
end
local nearby_units = FindUnitsInRadius(
caster:GetTeamNumber(),
center,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_FRIENDLY,
DOTA_UNIT_TARGET_ALL,
DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
FIND_ANY_ORDER,
false
)
for _, unit in pairs(nearby_units) do
AddWardIfValid(result, seen, unit, center, radius)
end
return result
end
local attempts = 0
Timers:CreateTimer(0.03, function()
if not caster or caster:IsNull() then return nil end
attempts = attempts + 1
local search_radius = self:GetAbility():GetSpecialValueFor("ward_search_radius")
if search_radius <= 0 then search_radius = 350 end
local shaman_wards = CollectShadowShamanWards(pos, search_radius)
if #shaman_wards == 0 then
if attempts < 60 then
return 0.05
end
return nil
end
table.sort(shaman_wards, function(a, b)
return (a:GetAbsOrigin() - pos):Length2D() < (b:GetAbsOrigin() - pos):Length2D()
end)
local selected_ward = nil
for index, ward in pairs(shaman_wards) do
if index == 1 then
selected_ward = ward
else
ward:ForceKill(false)
end
end
if not selected_ward or selected_ward:IsNull() then return nil end
selected_ward._shadow_shaman_giant_ward = true
selected_ward:SetOwner(caster)
selected_ward:SetControllableByPlayer(caster:GetPlayerID(), true)
selected_ward:SetModelScale(self:GetAbility():GetSpecialValueFor("ward_model_scale"))
local caster_damage = caster:GetAverageTrueAttackDamage(caster)
local ward_damage = selected_ward:GetAverageTrueAttackDamage(selected_ward)
local damage_bonus = math.max(0, caster_damage - ward_damage)
selected_ward:SetBaseDamageMin(caster_damage)
selected_ward:SetBaseDamageMax(caster_damage)
local target_attack_interval = caster:GetBaseAttackTime(true) / math.max(caster:GetAttackSpeed(false), 0.01)
local ward_base_attack_time = 1.0
local attack_speed_bonus = math.max(0, ward_base_attack_time / math.max(target_attack_interval, 0.01) * 100 - 100)
local caster_attack_range = caster:Script_GetAttackRange()
local attack_range_bonus = caster_attack_range - selected_ward:Script_GetAttackRange()
if selected_ward.SetAcquisitionRange then
selected_ward:SetAcquisitionRange(caster_attack_range)
end
selected_ward:AddNewModifier(caster, self:GetAbility(), "modifier_special_bonus_unique_shadow_shaman_giant_ward", {
duration = self:GetAbility():GetSpecialValueFor("ward_duration"),
damage_bonus = damage_bonus,
attack_speed_bonus = attack_speed_bonus,
attack_range_bonus = attack_range_bonus
})
self.existing_serpent_wards = nil
Timers:CreateTimer(0.2, function()
if selected_ward and not selected_ward:IsNull() then
selected_ward:Script_GetAttackRange()
if selected_ward.SetAcquisitionRange then
selected_ward:SetAcquisitionRange(caster_attack_range)
end
end
return nil
end)
return nil
end)
end
modifier_special_bonus_unique_shadow_shaman_giant_ward = class({})
function modifier_special_bonus_unique_shadow_shaman_giant_ward:IsHidden() return true end
function modifier_special_bonus_unique_shadow_shaman_giant_ward:IsPurgable() return false end
function modifier_special_bonus_unique_shadow_shaman_giant_ward:OnCreated(kv)
self.damage_bonus = tonumber(kv.damage_bonus) or 0
self.attack_speed_bonus = tonumber(kv.attack_speed_bonus) or 0
self.attack_range_bonus = tonumber(kv.attack_range_bonus) or 0
if IsServer() then
self:GetParent()._shadow_shaman_giant_ward = true
end
end
function modifier_special_bonus_unique_shadow_shaman_giant_ward:DeclareFunctions()
return {
MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
MODIFIER_PROPERTY_ATTACK_RANGE_BONUS
}
end
function modifier_special_bonus_unique_shadow_shaman_giant_ward:GetModifierPreAttack_BonusDamage()
return self.damage_bonus
end
function modifier_special_bonus_unique_shadow_shaman_giant_ward:GetModifierAttackSpeedBonus_Constant()
return self.attack_speed_bonus
end
function modifier_special_bonus_unique_shadow_shaman_giant_ward:GetModifierAttackRangeBonus()
return self.attack_range_bonus
end
function modifier_special_bonus_unique_shadow_shaman_giant_ward:CheckState()
return {
[MODIFIER_STATE_CANNOT_MISS] = true
}
end
