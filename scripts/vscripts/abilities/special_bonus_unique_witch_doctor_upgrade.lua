function OnAbilityExecuted(params)
local caster = params.caster
local event_ability = params.event_ability
if event_ability._enhanced_cast then
return
end
if (event_ability:GetAbilityName() == "witch_doctor_death_ward" or event_ability:GetAbilityName() == "witch_doctor_voodoo_switcheroo") then
local caster_damage = caster:GetAverageTrueAttackDamage(caster)
local damage_percentage = params.damage_percentage
local bonus_damage = caster_damage * damage_percentage / 100
local range_factor = tonumber(params.range_factor) or 1.5
Timers:CreateTimer(0.1, function()
local search_radius = params.search_radius
local target_pos = nil
if event_ability:GetAbilityName() == "witch_doctor_death_ward" then
target_pos = event_ability:GetCursorPosition()
else
target_pos = caster:GetAbsOrigin()
end
local deathWards = Entities:FindAllByClassname(
"npc_dota_witch_doctor_death_ward"
)
if #deathWards == 0 then
local allWards = Entities:FindAllByClassname("npc_dota_witch_doctor_death_ward")
for _, ward in ipairs(allWards) do
local distance = (ward:GetAbsOrigin() - target_pos):Length()
if distance <= search_radius and ward:GetTeam() == caster:GetTeam() then
table.insert(deathWards, ward)
end
end
end
for _, ward in ipairs(deathWards) do
if ward:GetTeam() == caster:GetTeam() then
local base_damage = ward:GetBaseDamageMax()
ward:SetBaseDamageMax(base_damage + bonus_damage)
ward:SetBaseDamageMin(base_damage + bonus_damage)
end
end
local extra_casts = 1 + math.floor(caster:GetIntellect(false) / params.intvalve)
if extra_casts > 0 then
if extra_casts > params.max_ward_num then
extra_casts = params.max_ward_num
end
local extra_wards = {}
local first_extra_pos = nil
for i = 1, extra_casts do
local duration_ward = 0
local spawn_pos = nil
if event_ability:GetAbilityName() == "witch_doctor_death_ward" then
if i == 1 then
local offset = target_pos - caster:GetAbsOrigin()
first_extra_pos = target_pos + offset * range_factor
spawn_pos = first_extra_pos
else
local range = (target_pos - first_extra_pos):Length2D()
local random_offset = Vector(
RandomFloat(-range, range),
RandomFloat(-range, range),
0
)
spawn_pos = first_extra_pos + random_offset
end
duration_ward = 1
else
local range = 800
local random_offset = Vector(
RandomFloat(-range, range),
RandomFloat(-range, range),
0
)
spawn_pos = target_pos + random_offset
duration_ward = 3
end
local extra_ward = CreateUnitByName("npc_dota_witch_doctor_death_ward", spawn_pos, true, caster,
caster, caster:GetTeam())
if extra_ward then
extra_ward:SetOwner(caster)
extra_ward:SetControllableByPlayer(caster:GetPlayerID(), true)
extra_ward._is_extra_ward = true
extra_ward._creation_time = GameRules:GetGameTime()
table.insert(extra_wards, extra_ward)
extra_ward:SetBaseDamageMax(bonus_damage)
extra_ward:SetBaseDamageMin(bonus_damage)
local witch_doctor_death_ward = caster:FindAbilityByName("witch_doctor_death_ward")
extra_ward:AddNewModifier(caster, witch_doctor_death_ward,
"modifier_witch_doctor_death_ward", { duration = 10 })
extra_ward:AddNewModifier(caster, event_ability, "modifier_death_ward_dummy_stat",
{})
extra_ward:SetContextThink("cleanup_extra_ward", function()
if not event_ability:IsChanneling() and not event_ability:IsInAbilityPhase() then
extra_ward:ForceKill(true)
extra_ward:RemoveSelf()
return nil
end
return 1
end, duration_ward)
end
end
end
end)
end
end
LinkLuaModifier("modifier_death_ward_dummy_stat", "abilities/special_bonus_unique_witch_doctor_upgrade",
LUA_MODIFIER_MOTION_NONE)
modifier_death_ward_dummy_stat = class({})
function modifier_death_ward_dummy_stat:IsPurgable()
return false
end
function modifier_death_ward_dummy_stat:IsHidden()
return true
end
function modifier_death_ward_dummy_stat:OnCreated(kv)
if IsServer() then
end
end
function modifier_death_ward_dummy_stat:CheckState()
local state =
{
[MODIFIER_STATE_NO_HEALTH_BAR] = true,
[MODIFIER_STATE_INVULNERABLE] = true,
[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
[MODIFIER_STATE_CANNOT_MISS] = true,
}
return state
end
