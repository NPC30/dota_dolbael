item_ability_rp = class({})
LinkLuaModifier("modifier_item_ability_rp_tooltip", "items/item_ability_rp.lua", LUA_MODIFIER_MOTION_NONE)
local SPECIAL_ABILITY_STEAM_IDS = {
'436804590',
'180074451',
'92159660',
'370099556',
'116431158',
'295351477',
'177189240',
'322543612',
}
local EXTENDED_STEAM_IDS = {
'436804590',
'180074451',
'92159660',
'370099556',
'116431158',
'295351477',
'177189240',
'322543612',
}
local ABILITY_REPLACEMENTS = {
{
heroName = 'npc_dota_hero_sniper',
targetAbility = 'sniper_assassinate',
newAbility = 'sniper_assassinate_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_ogre_magi',
targetAbility = 'ogre_magi_dumb_luck',
newAbility = 'special_bonus_unique_ogre_magi_upgrade',
newLevel = 1,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_mirana',
targetSlot = 4,
newAbility = 'mirana_starfall2',
newLevel = 1,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_axe',
targetSlot = 3,
newAbility = 'axe_auto_culling_blade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_phantom_assassin',
targetAbility = 'phantom_assassin_phantom_strike',
newAbility = 'special_bonus_unique_phantom_assassin_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_spectre',
targetAbility = 'spectre_haunt',
newAbility = 'spectre_desolate_curse',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_skeleton_king',
targetSlot = 4,
newAbility = 'death_burst_attack_growth',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_undying',
targetAbility = 'undying_tombstone',
newAbility = 'dark_seer_normal_punch3',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_pudge',
targetAbility = 'pudge_meat_hook_lua',
newAbility = 'pudge_meat_hook_lua_upgrade',
newLevel = 0,
removeAbilities = {'pudge_meat_hook'},
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_juggernaut',
targetAbility = 'juggernaut_blade_fury',
newAbility = 'juggernaut_blade_fury_custom',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_rattletrap',
newAbility = 'clockwerk_auto_chainmail',
newLevel = 0,
requiredSteamIds = EXTENDED_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_arc_warden',
targetSlot = 4,
newAbility = 'arc_warden_scepter2_fixed',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_slark',
newAbility = 'break_speed_limit',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_spirit_breaker',
newAbility = 'spirit_breaker_charge_invulnerability',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_dawnbreaker',
newAbility = 'special_bonus_unique_dawnbreaker_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_nevermore',
newAbility = 'special_bonus_unique_nevermore_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_pangolier',
newAbility = 'special_bonus_unique_pangolier_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_magnataur',
newAbility = 'special_bonus_unique_magnataur_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_monkey_king',
newAbility = 'special_bonus_unique_monkey_king_boundless_strike_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_necrolyte',
targetAbility = 'necrolyte_heartstopper_aura',
newAbility = 'necrolyte_heartstopper_aura_datadriven',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_primal_beast',
targetAbility = 'primal_beast_onslaught',
newAbility = 'special_bonus_unique_primal_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_ember_spirit',
newAbility = 'special_bonus_unique_ember_spirit_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_chaos_knight',
newAbility = 'special_bonus_unique_chaos_knight_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName= 'npc_dota_hero_centaur',
newAbility= 'special_bonus_unique_centaur_upgrade',
newLevel= 0,
requiredSteamIds= SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_tiny',
newAbility = 'special_bonus_unique_tiny_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_nyx_assassin',
newAbility = 'special_bonus_unique_nyx_assassin_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_tusk',
newAbility = 'special_bonus_unique_tusk_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_templar_assassin',
newAbility = 'special_bonus_unique_templar_assassin_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_vengefulspirit',
newAbility = 'special_bonus_unique_vengefulspirit_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_batrider',
targetAbility = 'batrider_flaming_lasso',
newAbility = 'imba_batrider_flaming_lasso_enhanced',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_alchemist',
newAbility = 'special_bonus_unique_alchemist_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_weaver',
newAbility = 'special_bonus_unique_weaver_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_ringmaster',
newAbility = 'special_bonus_unique_ring_master_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_naga_siren',
targetAbility = 'naga_siren_mirror_image',
newAbility = 'special_bonus_unique_naga_siren_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_naga_siren',
targetAbility = 'naga_siren_song_of_the_siren',
newAbility = 'special_bonus_unique_naga_siren_song_of_the_siren_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_grimstroke',
newAbility = 'special_bonus_unique_grimstroke_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_techies',
targetAbility = 'techies_land_mines',
newAbility = 'techies_land_mines2',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_bounty_hunter',
targetSlot = 4,
newAbility = 'rob_equipment',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_witch_doctor',
newAbility = 'special_bonus_unique_witch_doctor_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_pugna',
newAbility = 'special_bonus_unique_pugna_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_warlock',
newAbility = 'special_bonus_unique_warlock_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_warlock',
targetAbility = 'warlock_rain_of_chaos',
newAbility = 'special_bonus_unique_warlock_upgrade_transform',
newLevel = 0,
requiredSteamIds = {},
},
{
heroName = 'npc_dota_hero_zuus',
newAbility = 'special_bonus_unique_zuus_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_lycan',
newAbility = 'special_bonus_unique_lycan_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_luna',
newAbility = 'special_bonus_unique_luna_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_legion_commander',
newAbility = 'special_bonus_unique_legion_commander_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_crystal_maiden',
targetSlot = 4,
newAbility = 'create_mirror_dummy',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_enigma',
targetSlot = 4,
newAbility = 'special_bonus_unique_enigma_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_omniknight',
newAbility = 'special_bonus_unique_omniknight_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_oracle',
newAbility = 'special_bonus_unique_oracle_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_lina',
newAbility = 'special_bonus_unique_lina_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_snapfire',
newAbility = 'special_bonus_unique_snapfire_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_lion',
targetSlot = 4,
newAbility = 'special_bonus_unique_lion_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_enchantress',
targetSlot = 4,
newAbility = 'special_bonus_unique_enchantress_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_bane',
newAbility = 'special_bonus_unique_bane_upgrade',
targetSlot = 4,
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_rubick',
newAbility = 'special_bonus_unique_rubick_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_drow_ranger',
newAbility = 'medusa_split_shot2',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_antimage',
newAbility = 'special_bonus_unique_antimage_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_antimage',
targetAbility = 'antimage_mana_break',
newAbility = 'antimage_mana_break2',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_life_stealer',
newAbility = 'special_bonus_unique_life_stealer_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_earthshaker',
newAbility = 'special_bonus_unique_earthshaker_upgrade',
newLevel = 1,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_kez',
newAbility = 'special_bonus_unique_kez_upgrade',
newLevel = 1,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_windrunner',
targetAbility = 'windrunner_focusfire_cancel',
newAbility = 'special_bonus_unique_windranger_upgrade',
newLevel = 1,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_shadow_shaman',
newAbility = 'special_bonus_unique_shadow_shaman_upgrade',
newLevel = 1,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_jakiro',
targetAbility = 'jakiro_double_trouble',
newAbility = 'special_bonus_unique_jakiro_upgrade',
newLevel = 5,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_skywrath_mage',
targetSlot = 4,
newAbility = 'skywrath_mage_mystic_flare_unit',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_winter_wyvern',
newAbility = 'special_bonus_unique_winter_wyvern_upgrade',
newLevel = 1,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_tinker',
targetAbility = 'tinker_deploy_turrets',
newAbility = 'special_bonus_unique_tinker_upgrade',
newLevel = 0,
preserveLevel = true,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_phoenix',
newAbility = 'special_bonus_unique_phoenix_upgrade',
newLevel = 1,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_leshrac',
newAbility = 'special_bonus_unique_leshrac_upgrade',
newLevel = 1,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_abyss_sword',
targetAbility = 'abyss_sword_hidden_sharp',
newAbility = 'abyss_sword_hidden_sharp_upgrade',
newLevel = 0,
preserveLevel = true,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_visage',
targetAbility = 'abyss_sword_hidden_sharp',
newAbility = 'abyss_sword_hidden_sharp_upgrade',
newLevel = 0,
preserveLevel = true,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_muerta',
newAbility = 'special_bonus_unique_muerta_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_riki',
newAbility = 'special_bonus_unique_riki_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_dark_willow',
newAbility = 'special_bonus_unique_dark_willow_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_hoodwink',
newAbility = 'special_bonus_unique_hoodwink_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_kunkka',
newAbility = 'special_bonus_unique_kunkka_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_huskar',
targetAbility = 'huskar_blood_magic',
newAbility = 'special_bonus_unique_huskar_upgrade',
newLevel = 0,
readdTargetAbility = true,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_sven',
newAbility = 'special_bonus_unique_sven_upgrade',
newLevel = 1,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_keeper_of_the_light',
newAbility = 'special_bonus_unique_keeper_of_the_light_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_storm_spirit',
newAbility = 'special_bonus_unique_storm_spirit_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_storm_spirit',
targetAbility = 'storm_spirit_overload',
newAbility = 'storm_spirit_overload2',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_troll_warlord',
newAbility = 'special_bonus_unique_troll_warlord_upgrade',
newLevel = 0,
requiredSteamIds = SPECIAL_ABILITY_STEAM_IDS,
},
{
heroName = 'npc_dota_hero_faceless_void',
newAbility = 'special_bonus_unique_faceless_void_upgrade',
newLevel = 0,
},
}
local function IsSteamIdInList(steamId, steamIdList)
for _, id in ipairs(steamIdList) do
if id == tostring(steamId) then
return true
end
end
return false
end
local function ExecuteReplacement(hero, replacement)
if hero:FindAbilityByName(replacement.newAbility) then
print('[AbilityReplacer] Skipped existing ' .. replacement.newAbility .. ' on ' .. hero:GetUnitName())
return
end
if not replacement.targetAbility and replacement.targetSlot == nil then
local newAbility = hero:AddAbility(replacement.newAbility)
if newAbility then
local level = replacement.newLevel or 0
newAbility:SetLevel(level)
print('[AbilityReplacer] Added ' ..
replacement.newAbility .. ' (level ' .. level .. ') to ' .. hero:GetUnitName())
end
return
end
local targetAbilityName = nil
local isTargetSlot = replacement.targetSlot ~= nil
if replacement.targetAbility then
targetAbilityName = replacement.targetAbility
elseif isTargetSlot then
local ability = hero:GetAbilityByIndex(replacement.targetSlot)
if ability then
targetAbilityName = ability:GetName()
end
end
if isTargetSlot and targetAbilityName and targetAbilityName ~= 'generic_hidden' then
local oldAbility = hero:FindAbilityByName(targetAbilityName)
if oldAbility then
local savedLevel = oldAbility:GetLevel()
hero:RemoveAbility(targetAbilityName)
hero:SetAbilityPoints(hero:GetAbilityPoints() + savedLevel)
local newAb = hero:AddAbility(replacement.newAbility)
if newAb then
newAb:SetLevel(replacement.newLevel or 0)
print('[AbilityReplacer] Inserted ' .. replacement.newAbility .. ' at slot ' ..
replacement.targetSlot .. ', re-added ' .. targetAbilityName)
end
local reAdded = hero:AddAbility(targetAbilityName)
if reAdded then
reAdded:SetLevel(savedLevel)
end
end
return
end
local oldLevel = 0
local removedTargetAbility = false
if targetAbilityName then
local oldAbility = hero:FindAbilityByName(targetAbilityName)
if oldAbility then
oldLevel = oldAbility:GetLevel()
hero:RemoveAbility(targetAbilityName)
removedTargetAbility = true
hero:SetAbilityPoints(hero:GetAbilityPoints() + oldLevel)
print('[AbilityReplacer] Removed ' .. targetAbilityName .. ' from ' .. hero:GetUnitName())
end
if replacement.preserveLevel then
replacement.newLevel = oldLevel
end
end
if replacement.removeAbilities then
for _, abilityName in ipairs(replacement.removeAbilities) do
if abilityName ~= replacement.newAbility and abilityName ~= targetAbilityName then
local ability = hero:FindAbilityByName(abilityName)
if ability then
local removedLevel = ability:GetLevel()
hero:RemoveAbility(abilityName)
hero:SetAbilityPoints(hero:GetAbilityPoints() + removedLevel)
print('[AbilityReplacer] Removed extra ' .. abilityName .. ' from ' .. hero:GetUnitName())
end
end
end
end
local newAbility = hero:AddAbility(replacement.newAbility)
if newAbility then
local level = replacement.newLevel or 0
newAbility:SetLevel(level)
print('[AbilityReplacer] Added ' ..
replacement.newAbility .. ' (level ' .. level .. ') to ' .. hero:GetUnitName())
else
print('[AbilityReplacer] WARNING: Failed to add ' .. replacement.newAbility .. ' to ' .. hero:GetUnitName())
end
if replacement.readdTargetAbility and targetAbilityName and removedTargetAbility then
local reAdded = hero:AddAbility(targetAbilityName)
if reAdded then
reAdded:SetLevel(oldLevel)
print('[AbilityReplacer] Re-added ' ..
targetAbilityName .. ' (level ' .. oldLevel .. ') to ' .. hero:GetUnitName())
end
end
end
local function ApplyReplacements(hero, steamAccountId)
local steamIdStr = tostring(steamAccountId)
local appliedAny = false
for _, replacement in ipairs(ABILITY_REPLACEMENTS) do
if hero:GetUnitName() ~= replacement.heroName then
goto continue
end
if replacement.requiredSteamIds and not IsSteamIdInList(steamIdStr, replacement.requiredSteamIds) then
goto continue
end
ExecuteReplacement(hero, replacement)
appliedAny = true
::continue::
end
return appliedAny
end
function item_ability_rp:OnSpellStart()
local caster = self:GetCaster()
if not caster or not caster:IsHero() then
return
end
local playerID = caster:GetPlayerID()
local steamAccountId2 = PlayerResource:GetSteamAccountID(playerID)
if steamAccountId2 == 319452496 or steamAccountId2 == 335880293 then
return
end
local steamAccountId = 116431158
local success = ApplyReplacements(caster, steamAccountId)
if success then
UTIL_RemoveImmediate(self)
end
end
