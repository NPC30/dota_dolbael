local GOLEM_TYPES = {
"npc_dota_warlock_golem",
"npc_dota_warlock_golem_scepter_1",
"npc_dota_warlock_golem_scepter_2",
"npc_dota_warlock_golem_scepter_3",
"npc_dota_warlock_golem_scepter_4",
"npc_dota_warlock_golem_scepter_5"
}
local MODIFIER_NAME = "modifier_special_bonus_unique_warlock_golem_buff"
function OnAbilityExecuted(params)
if not IsServer() then return end
local caster = params.caster
local event_ability = params.event_ability
if not caster or not event_ability then return end
if event_ability:GetAbilityName() ~= "warlock_rain_of_chaos" then return end
local attack_pct = tonumber(params.attack_pct) or 0
local health_pct = tonumber(params.health_pct) or 0
local armor_pct = tonumber(params.armor_pct) or 0
local magic_resist_pct = tonumber(params.magic_resist_pct) or 0
local level = math.max(event_ability:GetLevel() - 1, 0)
local has_scepter = caster:HasScepter()
local attack_key = has_scepter and "golem_dmg_scepter" or "golem_dmg"
local health_key = has_scepter and "golem_hp_scepter" or "golem_hp"
local base_golem_attack = event_ability:GetLevelSpecialValueFor(attack_key, level) or 0
local base_golem_health = event_ability:GetLevelSpecialValueFor(health_key, level) or 0
Timers:CreateTimer(1.3, function()
if not caster or caster:IsNull() or not caster:IsAlive() then return nil end
local hellfires = {}
for _, golem_type in ipairs(GOLEM_TYPES) do
local golems = Entities:FindAllByClassname(golem_type)
for _, golem in ipairs(golems) do
if not golem:IsNull()
and golem:GetTeamNumber() == caster:GetTeamNumber()
and golem:GetOwner() == caster then
table.insert(hellfires, golem)
end
end
end
if #hellfires == 0 then return nil end
local bonus_attack = (caster:GetAverageTrueAttackDamage(nil) or 0) * (attack_pct / 100)
local bonus_health = (caster:GetMaxHealth() or 0) * (health_pct / 100)
local bonus_armor = (caster:GetPhysicalArmorValue(false) or 0) * (armor_pct / 100)
local caster_magic_resist = (caster:Script_GetMagicalArmorValue(caster) or 0) * 100
local bonus_magic_resist = caster_magic_resist * (magic_resist_pct / 100)
for _, golem in ipairs(hellfires) do
if golem:IsNull() then goto continue end
local target_attack = base_golem_attack + bonus_attack
local target_health = base_golem_health + bonus_health
golem:SetBaseDamageMin(target_attack)
golem:SetBaseDamageMax(target_attack)
golem:SetBaseMaxHealth(target_health)
golem:SetMaxHealth(target_health)
golem:SetHealth(target_health)
golem:RemoveModifierByName(MODIFIER_NAME)
golem:AddNewModifier(caster, event_ability, MODIFIER_NAME, {
bonus_armor = bonus_armor,
bonus_magic_resist = bonus_magic_resist
})
::continue::
end
return nil
end)
end
LinkLuaModifier(MODIFIER_NAME, "abilities/special_bonus_unique_warlock_upgrade", LUA_MODIFIER_MOTION_NONE)
modifier_special_bonus_unique_warlock_golem_buff = class({})
function modifier_special_bonus_unique_warlock_golem_buff:IsHidden()
return false
end
function modifier_special_bonus_unique_warlock_golem_buff:IsPurgable()
return false
end
function modifier_special_bonus_unique_warlock_golem_buff:RemoveOnDeath()
return true
end
function modifier_special_bonus_unique_warlock_golem_buff:DeclareFunctions()
return {
MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS
}
end
function modifier_special_bonus_unique_warlock_golem_buff:OnCreated(kv)
if not IsServer() then return end
self.bonus_armor = kv.bonus_armor and tonumber(kv.bonus_armor) or 0
self.bonus_magic_resist = kv.bonus_magic_resist and tonumber(kv.bonus_magic_resist) or 0
self:SetHasCustomTransmitterData(true)
self:SendBuffRefreshToClients()
end
function modifier_special_bonus_unique_warlock_golem_buff:AddCustomTransmitterData()
return {
bonus_armor = self.bonus_armor,
bonus_magic_resist = self.bonus_magic_resist
}
end
function modifier_special_bonus_unique_warlock_golem_buff:HandleCustomTransmitterData(data)
self.bonus_armor = data.bonus_armor
self.bonus_magic_resist = data.bonus_magic_resist
end
function modifier_special_bonus_unique_warlock_golem_buff:GetModifierPhysicalArmorBonus()
return self.bonus_armor or 0
end
function modifier_special_bonus_unique_warlock_golem_buff:GetModifierMagicalResistanceBonus()
return self.bonus_magic_resist or 0
end
