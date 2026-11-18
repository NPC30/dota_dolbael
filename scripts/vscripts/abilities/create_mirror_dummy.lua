LinkLuaModifier("modifier_mirror_dummy_spell_amp_dynamic", "abilities/create_mirror_dummy",
LUA_MODIFIER_MOTION_NONE)
local function ApplyMirrorDummySpellAmp(caster, dummy, ability, caster_spell_amp)
if not dummy.GetSpellAmplification then return end
local dummy_spell_amp = dummy:GetSpellAmplification(false) or 0
local bonus_spell_amp = caster_spell_amp - dummy_spell_amp
if bonus_spell_amp <= 0 then return end
dummy:AddNewModifier(caster, ability, "modifier_mirror_dummy_spell_amp_dynamic", {
spell_amp = bonus_spell_amp
})
end
function CreateMirrorDummy_crystal_maiden(keys)
local caster = keys.caster
local ability = keys.ability
local duration = keys.Duration
local target_pos = ability:GetCursorPosition()
if not caster or caster:IsNull() then
return
end
if not ability or ability:IsNull() then
return
end
local dummy = CreateUnitByName("dummy_unit_hero", target_pos, false, caster, caster, caster:GetTeamNumber())
if not dummy or dummy:IsNull() then
return
end
dummy:SetOwner(caster)
dummy:SetControllableByPlayer(caster:GetPlayerID(), true)
local spell_amp = caster:GetSpellAmplification(false)
dummy:SetMana(9999)
local copiedItems = 0
for i = 0, 8 do
local item = caster:GetItemInSlot(i)
if item and not item:IsNull() then
local dummyItem = dummy:AddItemByName(item:GetName())
if dummyItem then
dummyItem:SetCurrentCharges(item:GetCurrentCharges())
copiedItems = copiedItems + 1
else
end
end
end
if caster:HasModifier("modifier_item_ultimate_scepter") then
dummy:AddNewModifier(caster, nil, "modifier_item_ultimate_scepter", { duration = -1 })
end
if caster:HasModifier("modifier_item_aghanims_shard") then
dummy:AddNewModifier(caster, nil, "modifier_item_aghanims_shard", { duration = -1 })
end
local NeedCopyAbilities = {
"crystal_maiden_freezing_field",
"crystal_maiden_frostbite",
"special_bonus_unique_crystal_maiden_3",
}
local copiedAbilities = {}
local actualCopyCount = #NeedCopyAbilities
for i = 1, actualCopyCount do
local abilityName = NeedCopyAbilities[i]
local casterAbility = caster:FindAbilityByName(abilityName)
local abilityLevel = 1
if casterAbility and not casterAbility:IsNull() then
abilityLevel = casterAbility:GetLevel()
else
end
local dummyAbility = dummy:AddAbility(abilityName)
if dummyAbility then
local level = math.min(abilityLevel, dummyAbility:GetMaxLevel())
dummyAbility:SetLevel(level)
table.insert(copiedAbilities, dummyAbility)
else
end
end
ApplyMirrorDummySpellAmp(caster, dummy, ability, spell_amp)
if #copiedAbilities > 0 then
Timers:CreateTimer(0.05, function()
if dummy and not dummy:IsNull() and copiedAbilities[1] and not copiedAbilities[1]:IsNull() then
local firstAbility = copiedAbilities[1]
local manaCost = firstAbility:GetManaCost(firstAbility:GetLevel())
local currentMana = dummy:GetMana()
if currentMana < manaCost then
dummy:SetMana(manaCost + 100)
end
if not firstAbility:IsFullyCastable() then
if firstAbility:IsCooldownReady() == false then
end
return
end
local abilityBehavior = firstAbility:GetBehavior()
if dummy:HasItemInInventory("item_magic_abyss_staff") then
dummy:CastAbilityNoTarget(dummy:FindItemInInventory("item_magic_abyss_staff"),
caster:GetPlayerOwnerID())
end
if bit.band(abilityBehavior, DOTA_ABILITY_BEHAVIOR_NO_TARGET) ~= 0 then
dummy:CastAbilityNoTarget(firstAbility, caster:GetPlayerOwnerID())
elseif bit.band(abilityBehavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 then
dummy:CastAbilityOnPosition(target_pos, firstAbility, caster:GetPlayerOwnerID())
elseif bit.band(abilityBehavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
local castRange = firstAbility:GetCastRange() or 1000
local enemies = FindUnitsInRadius(dummy:GetTeamNumber(), dummy:GetAbsOrigin(), nil, castRange,
DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER,
false)
if #enemies > 0 then
dummy:CastAbilityOnTarget(enemies[1], firstAbility, caster:GetPlayerOwnerID())
else
end
else
end
else
end
end)
end
if not Timers then
require("libraries/timers")
end
Timers:CreateTimer(duration, function()
if dummy and not dummy:IsNull() then
dummy:RemoveSelf()
else
end
end)
end
function PrintDummyStatus(dummy, caster)
if not dummy or dummy:IsNull() then
print("[PrintDummyStatus] dummy 无效")
return
end
print("=== Dummy Unit 状态检查 ===")
local spellAmp = 0
if dummy.GetSpellAmplification then
spellAmp = dummy:GetSpellAmplification(false) or 0
end
print(string.format("[基础属性] 法术增强: %.5f",
spellAmp))
print(string.format("[资源] 生命值: %d/%d, 魔法值: %d/%d",
dummy:GetHealth(), dummy:GetMaxHealth(),
dummy:GetMana(), dummy:GetMaxMana()))
print(string.format("[防御] 护甲: %.2f",
dummy:GetPhysicalArmorValue(false)))
print(string.format("[攻击] 攻击力: %d-%d, 攻速: %d",
dummy:GetBaseDamageMin(), dummy:GetBaseDamageMax(),
dummy:GetAttackSpeed(false)))
print("[技能列表]")
for i = 0, 15 do
local ability = dummy:GetAbilityByIndex(i)
if ability and not ability:IsNull() then
print(string.format(" 技能%d: %s (等级:%d/%d, 冷却:%.1fs, 魔法消耗:%d)",
i, ability:GetName(), ability:GetLevel(), ability:GetMaxLevel(),
ability:GetCooldownTimeRemaining(), ability:GetManaCost(ability:GetLevel())))
end
end
print("[物品列表]")
for i = 0, 8 do
local item = dummy:GetItemInSlot(i)
if item and not item:IsNull() then
print(string.format(" 物品%d: %s (充能:%d)",
i, item:GetName(), item:GetCurrentCharges()))
end
end
print("[修饰符列表]")
local modifiers = dummy:FindAllModifiers()
for _, modifier in pairs(modifiers) do
if modifier and not modifier:IsNull() then
local duration = modifier:GetDuration()
local remaining = modifier:GetRemainingTime()
print(string.format(" %s (剩余时间:%.1fs)",
modifier:GetName(), remaining))
end
end
print("=== 检查完成 ===")
end
function CreateMirrorDummy_enigma(keys)
local caster = keys.caster
local ability = keys.ability
local duration = keys.Duration
local target_pos = ability:GetCursorPosition()
if not caster or caster:IsNull() then
return
end
if not ability or ability:IsNull() then
return
end
local dummy = CreateUnitByName("dummy_unit_hero", target_pos, false, caster, caster, caster:GetTeamNumber())
if not dummy or dummy:IsNull() then
return
end
dummy:SetOwner(caster)
dummy:SetControllableByPlayer(caster:GetPlayerID(), true)
local spell_amp = caster:GetSpellAmplification(false)
dummy:SetMana(9999)
local copiedItems = 0
for i = 0, 8 do
local item = caster:GetItemInSlot(i)
if item and not item:IsNull() then
local dummyItem = dummy:AddItemByName(item:GetName())
if dummyItem then
dummyItem:SetCurrentCharges(item:GetCurrentCharges())
copiedItems = copiedItems + 1
else
end
end
end
if caster:HasModifier("modifier_item_ultimate_scepter") then
dummy:AddNewModifier(caster, nil, "modifier_item_ultimate_scepter", { duration = -1 })
end
if caster:HasModifier("modifier_item_aghanims_shard") then
dummy:AddNewModifier(caster, nil, "modifier_item_aghanims_shard", { duration = -1 })
end
local NeedCopyAbilities = {
"enigma_black_hole"
}
local copiedAbilities = {}
local actualCopyCount = #NeedCopyAbilities
for i = 1, actualCopyCount do
local abilityName = NeedCopyAbilities[i]
local casterAbility = caster:FindAbilityByName(abilityName)
local abilityLevel = 1
if casterAbility and not casterAbility:IsNull() then
abilityLevel = casterAbility:GetLevel()
else
end
local dummyAbility = dummy:AddAbility(abilityName)
if dummyAbility then
local level = math.min(abilityLevel, dummyAbility:GetMaxLevel())
dummyAbility:SetLevel(level)
table.insert(copiedAbilities, dummyAbility)
else
end
end
ApplyMirrorDummySpellAmp(caster, dummy, ability, spell_amp)
if #copiedAbilities > 0 then
Timers:CreateTimer(0.05, function()
if dummy and not dummy:IsNull() and copiedAbilities[1] and not copiedAbilities[1]:IsNull() then
local firstAbility = copiedAbilities[1]
local manaCost = firstAbility:GetManaCost(firstAbility:GetLevel())
local currentMana = dummy:GetMana()
if currentMana < manaCost then
dummy:SetMana(manaCost + 100)
end
if not firstAbility:IsFullyCastable() then
if firstAbility:IsCooldownReady() == false then
end
return
end
local abilityBehavior = firstAbility:GetBehavior()
if dummy:HasItemInInventory("item_magic_abyss_staff") then
dummy:CastAbilityNoTarget(dummy:FindItemInInventory("item_magic_abyss_staff"),
caster:GetPlayerOwnerID())
end
if bit.band(abilityBehavior, DOTA_ABILITY_BEHAVIOR_NO_TARGET) ~= 0 then
dummy:CastAbilityNoTarget(firstAbility, caster:GetPlayerOwnerID())
elseif bit.band(abilityBehavior, DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 then
dummy:CastAbilityOnPosition(target_pos, firstAbility, caster:GetPlayerOwnerID())
elseif bit.band(abilityBehavior, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
local castRange = firstAbility:GetCastRange() or 1000
local enemies = FindUnitsInRadius(dummy:GetTeamNumber(), dummy:GetAbsOrigin(), nil, castRange,
DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER,
false)
if #enemies > 0 then
dummy:CastAbilityOnTarget(enemies[1], firstAbility, caster:GetPlayerOwnerID())
else
end
else
end
else
end
end)
end
if not Timers then
require("libraries/timers")
end
Timers:CreateTimer(duration, function()
if dummy and not dummy:IsNull() then
dummy:RemoveSelf()
else
end
end)
end
modifier_mirror_dummy_spell_amp_dynamic = class({})
function modifier_mirror_dummy_spell_amp_dynamic:IsHidden() return true end
function modifier_mirror_dummy_spell_amp_dynamic:IsPurgable() return false end
function modifier_mirror_dummy_spell_amp_dynamic:RemoveOnDeath() return false end
function modifier_mirror_dummy_spell_amp_dynamic:OnCreated(kv)
self.spell_amp = (tonumber(kv.spell_amp) or 0) * 100
end
function modifier_mirror_dummy_spell_amp_dynamic:DeclareFunctions()
return {
MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE
}
end
function modifier_mirror_dummy_spell_amp_dynamic:GetModifierSpellAmplify_Percentage()
return self.spell_amp
end
