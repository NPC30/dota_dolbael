LinkLuaModifier("modifier_rubick_bonus_stolen_passive_1", "abilities/special_bonus_unique_rubick_upgrade",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_rubick_bonus_stolen_passive_2", "abilities/special_bonus_unique_rubick_upgrade",
LUA_MODIFIER_MOTION_NONE)
local MOD_1 = "modifier_rubick_bonus_stolen_passive_1"
local MOD_2 = "modifier_rubick_bonus_stolen_passive_2"
function IsNativeHeroAbility(unit, ability_name)
if not unit or not ability_name or ability_name == "" then return false end
local unit_name = unit:GetUnitName()
local hero_prefix = string.gsub(unit_name, "npc_dota_hero_", "")
if hero_prefix == "" then return false end
return string.find(ability_name, "^" .. hero_prefix .. "_") ~= nil
end
function OnAbilityExecuted_Rubick(keys)
if not IsServer() then return end
local caster = keys.unit or keys.caster
if not caster or not caster:IsAlive() then return end
local event_ability = keys.event_ability
if not event_ability or event_ability:GetAbilityName() ~= "rubick_telekinesis" then return end
local target = keys.target
if not target or not target:IsHero() then return end
local steal_ability = caster:FindAbilityByName("rubick_spell_steal")
if not steal_ability or not steal_ability:IsTrained() then return end
local our_duration = (steal_ability:GetSpecialValueFor("duration") or 180) / 2
local bonus_ability = caster:FindAbilityByName("special_bonus_unique_rubick_upgrade")
if not bonus_ability or not bonus_ability:IsTrained() then return end
if not bonus_ability:GetAutoCastState() then return end
local max_slots = bonus_ability:GetSpecialValueFor("max_stolen_passives") or 2
max_slots = math.max(1, math.min(2, tonumber(max_slots) or 2))
local passive_ability = GetOnePassiveFromUnit(target, caster)
if not passive_ability then return end
local ability_name = passive_ability:GetAbilityName()
local level = passive_ability:GetLevel()
if level < 1 then level = 1 end
local is_native = IsNativeHeroAbility(target, ability_name)
local is_enemy = target:GetTeamNumber() ~= caster:GetTeamNumber()
local removed_from_owner = 0
if is_enemy and not is_native then
target:RemoveAbility(ability_name)
removed_from_owner = 1
end
local mod1 = caster:FindModifierByName(MOD_1)
local mod2 = caster:FindModifierByName(MOD_2)
local count = (mod1 and 1 or 0) + (mod2 and 1 or 0)
if count == 0 then
local ab = caster:AddAbility(ability_name)
if ab then ab:SetLevel(level) end
caster:AddNewModifier(caster, bonus_ability, MOD_1, {
duration = our_duration,
ability_name = ability_name,
level = level,
original_owner_index = target:GetEntityIndex(),
removed_from_owner = removed_from_owner
})
elseif count == 1 and max_slots >= 2 then
local ab = caster:AddAbility(ability_name)
if not ab then return end
ab:SetLevel(level)
caster:AddNewModifier(caster, bonus_ability, MOD_2, {
duration = our_duration,
ability_name = ability_name,
level = level,
original_owner_index = target:GetEntityIndex(),
removed_from_owner = removed_from_owner
})
else
local to_replace
if not mod1 then
to_replace = mod2
elseif not mod2 then
to_replace = mod1
else
local r1 = mod1:GetRemainingTime()
local r2 = mod2:GetRemainingTime()
to_replace = (r1 <= r2) and mod1 or mod2
end
to_replace:Destroy()
local ab = caster:AddAbility(ability_name)
if not ab then return end
ab:SetLevel(level)
local new_mod_name = (to_replace == mod1) and MOD_1 or MOD_2
caster:AddNewModifier(caster, bonus_ability, new_mod_name, {
duration = our_duration,
ability_name = ability_name,
level = level,
original_owner_index = target:GetEntityIndex(),
removed_from_owner = removed_from_owner
})
end
end
function ShouldSkipAbilityForSteal(abil, name, caster)
if not abil or not name or name == "" then return true end
if string.find(name, "special_bonus") then return true end
if string.find(name, "razor_dynamo") then return true end
if string.sub(name, 1, 5) == "item_" then return true end
if string.find(name, "_innate_") then return true end
if string.find(name, "_facet_") or string.find(name, "special_bonus_facet") then return true end
if caster then
local existing = caster:FindAbilityByName(name)
if existing and not existing:IsHidden() then return true end
end
return false
end
function GetOnePassiveFromUnit(unit, caster)
local DOTA_ABILITY_BEHAVIOR_PASSIVE = 2
local ability_count = unit:GetAbilityCount()
local abilities = {}
for i = 0, ability_count - 1 do
local abil = unit:GetAbilityByIndex(i)
if abil then
local name = abil:GetAbilityName()
if not ShouldSkipAbilityForSteal(abil, name, caster) then
local behavior = abil:GetBehavior()
if type(behavior) ~= "number" then behavior = tonumber(tostring(behavior)) or 0 end
if bit.band(behavior, DOTA_ABILITY_BEHAVIOR_PASSIVE) ~= 0 then
print("name", name)
if behavior > 4398046511104 or bit.band(behavior, DOTA_ABILITY_BEHAVIOR_NOT_LEARNABLE) ~= 0 then
print("name,innate", name, true, behavior)
else
table.insert(abilities, abil)
end
end
end
end
end
if #abilities > 0 then return abilities[RandomInt(1, #abilities)] end
return nil
end
modifier_rubick_bonus_stolen_passive = class({})
function modifier_rubick_bonus_stolen_passive:IsHidden() return false end
function modifier_rubick_bonus_stolen_passive:IsPurgable() return false end
function modifier_rubick_bonus_stolen_passive:RemoveOnDeath() return true end
function modifier_rubick_bonus_stolen_passive:OnCreated(kv)
if not IsServer() then return end
self.ability_name = kv.ability_name or ""
self.level = tonumber(kv.level) or 1
self.original_owner_index = tonumber(kv.original_owner_index)
self.removed_from_owner = (tonumber(kv.removed_from_owner) or 0) == 1
end
function modifier_rubick_bonus_stolen_passive:OnDestroy()
if not IsServer() then return end
local parent = self:GetParent()
if self.ability_name ~= "" then
parent:RemoveAbility(self.ability_name)
if self.removed_from_owner and self.original_owner_index then
local owner = EntIndexToHScript(self.original_owner_index)
if owner and IsValidEntity(owner) then
local ab = owner:AddAbility(self.ability_name)
if ab then ab:SetLevel(self.level) end
end
end
end
end
modifier_rubick_bonus_stolen_passive_1 = modifier_rubick_bonus_stolen_passive
modifier_rubick_bonus_stolen_passive_2 = modifier_rubick_bonus_stolen_passive
