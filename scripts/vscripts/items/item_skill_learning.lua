require("libraries/popups")
require("items/item_tome_usage_limit")
item_skill_learning = class({})
LinkLuaModifier("modifier_skill_learning_tracker", "items/item_skill_learning.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_skill_learning_display", "items/item_skill_learning.lua", LUA_MODIFIER_MOTION_NONE)
function item_skill_learning:GetIntrinsicModifierName()
return "modifier_skill_learning_tracker"
end
local LOTTERY_ABILITIES_ACTIVE = {
{ "enigma_black_hole", 5 },
{ "abaddon_borrowed_time", 5 },
{ "dazzle_good_juju", 5 },
{ "faceless_void_time_zone_new", 5 },
{ "gyrocopter_flak_cannon", 5 },
{ "medusa_split_shot", 5 },
{ "winter_wyvern_arctic_burn", 5 },
{ "bounty_hunter_track", 4 },
{ "juggernaut_omni_slash", 4 },
{ "doom_bringer_doom", 4 },
{ "sven_gods_strength", 4 },
{ "axe_culling_blade", 4 },
{ "ember_spirit_sleight_of_fist", 4 },
{ "omniknight_hammer_of_purity", 4 },
{ "silencer_glaives_of_wisdom", 4 },
{ "lion_finger_of_death", 3 },
{ "shadow_shaman_mass_serpent_ward", 3 },
{ "necrolyte_reapers_scythe", 3 },
{ "storm_spirit_ball_lightning", 3 },
{ "slark_shadow_dance", 3 },
{ "brewmaster_primal_split_lua", 3 },
{ "alchemist_chemical_rage", 3 },
{ "medusa_stone_gaze", 3 },
{ "bloodseeker_rupture", 3 },
{ "tidehunter_ravage", 3 },
{ "silencer_global_silence", 3 },
{ "earthshaker_echo_slam", 3 },
{ "legion_commander_duel", 3 },
{ "dark_willow_shadow_realm", 3 },
{ "dark_seer_vacuum", 3 },
{ "doom_bringer_infernal_blade", 3 },
{ "ancient_apparition_chilling_touch", 3 },
{ "viper_poison_attack", 3 },
{ "dazzle_rain_of_vermin", 3 },
{ "clinkz_burning_barrage2", 3 },
{ "ancient_apparition_freezing_aura", 3 },
{ "magnataur_horn_toss2", 3 },
{ "tinker_rearm_lua", 2 },
{ "omniknight_guardian_angel", 2 },
{ "winter_wyvern_winters_curse", 2 },
{ "weaver_time_lapse", 2 },
{ "witch_doctor_death_ward", 2 },
{ "kunkka_ghostship", 2 },
{ "slardar_amplify_damage", 2 },
{ "pangolier_gyroshell", 2 },
{ "pudge_dismember", 2 },
{ "pudge_meat_hook", 2 },
{ "sniper_shrapnel", 2 },
{ "lion_impale", 2 },
{ "sandking_burrowstrike", 2 },
{ "sven_storm_bolt", 2 },
{ "dark_willow_bramble_maze", 2 },
{ "kunkka_torrent", 2 },
{ "lina_light_strike_array", 2 },
{ "slardar_slithereen_crush", 2 },
{ "omniknight_repel", 2 },
{ "mars_bulwark", 2 },
{ "earthshaker_enchant_totem", 2 },
{ "witch_doctor_paralyzing_cask", 2 },
{ "pudge_flesh_heap", 2 },
{ "templar_assassin_refraction", 2 },
{ "templar_assassin_meld", 2 },
{ "drow_ranger_frost_arrows", 2 },
{ "lina_flame_cloak2", 2 },
{ "abaddon_aphotic_shield", 1 },
{ "axe_berserkers_call", 1 },
{ "antimage_blink", 1 },
{ "phantom_lancer_doppelwalk", 1 },
{ "queenofpain_blink", 1 },
{ "faceless_void_time_walk", 1 },
{ "morphling_waveform", 1 },
{ "slark_pounce", 1 },
{ "mirana_leap", 1 },
{ "riki_blink_strike", 1 },
{ "weaver_shukuchi", 1 },
{ "ember_spirit_activate_fire_remnant", 1 },
{ "phantom_assassin_phantom_strike", 1 },
{ "spectre_spectral_dagger", 1 },
}
local LOTTERY_ABILITIES_PASSIVE = {
{ "muerta_gunslinger", 5 },
{ "slark_essence_shift", 5 },
{ "templar_assassin_psi_blades", 5 },
{ "dazzle_good_juju", 5 },
{ "faceless_void_time_lock", 5 },
{ "ability_trigger_on_spell_reflect", 5 },
{ "ability_charge_damage", 5 },
{ "medusa_split_shot", 5 },
{ "winter_wyvern_arctic_burn", 5 },
{ "luna_moon_glaive", 4 },
{ "elder_titan_natural_order", 4 },
{ "phantom_assassin_coup_de_grace", 4 },
{ "sven_great_cleave", 4 },
{ "slardar_bash", 4 },
{ "dawnbreaker_luminosity", 4 },
{ "spectre_dispersion2", 4 },
{ "omniknight_hammer_of_purity", 4 },
{ "batrider_smoldering_resin2", 4 },
{ "ogre_magi_multicast_lua", 4 },
{ "leshrac_defilement2", 4 },
{ "tinker_eureka2", 4 },
{ "ability_trigger_learned_skills", 4 },
{ "ability_trigger_on_cast", 4 },
{ "ability_trigger_on_attacked", 4 },
{ "ability_trigger_on_move", 4 },
{ "axe_counter_helix", 3 },
{ "earthshaker_aftershock", 3 },
{ "chaos_knight_chaos_strike", 3 },
{ "centaur_return", 3 },
{ "ursa_fury_swipes", 3 },
{ "vengefulspirit_command_aura", 3 },
{ "kunkka_tidebringer", 3 },
{ "riki_permanent_invisibility", 3 },
{ "weaver_geminate_attack", 3 },
{ "spectre_desolate", 3 },
{ "tiny_grow", 3 },
{ "frostbitten_golem_time_warp_aura", 3 },
{ "doom_bringer_infernal_blade", 3 },
{ "silencer_glaives_of_wisdom", 3 },
{ "drow_ranger_trueshot2", 3 },
{ "crystal_maiden_ice_explosion", 3 },
{ "centaur_sturdy", 3 },
{ "bloodseeker_thirst", 2 },
{ "rubick_arcane_supremacy", 2 },
{ "monkey_king_jingu_mastery", 2 },
{ "skeleton_king_mortal_strike", 2 },
{ "huskar_berserkers_blood", 2 },
{ "legion_commander_moment_of_courage", 2 },
{ "abyssal_underlord_atrophy_aura", 2 },
{ "obsidian_destroyer_equilibrium", 2 },
{ "abaddon_frostmourne", 2 },
{ "lycan_feral_impulse", 2 },
{ "drow_ranger_frost_arrows", 2 },
{ "axe_one_man_army2", 2 },
{ "drow_ranger_marksmanship", 1 },
{ "spirit_breaker_greater_bash", 1 },
{ "antimage_mana_break", 1 },
{ "sniper_headshot", 1 },
{ "bounty_hunter_jinada", 1 },
{ "venomancer_poison_sting", 1 },
{ "troll_warlord_fervor", 1 },
{ "visage_gravekeepers_cloak", 1 },
{ "life_stealer_ghoul_frenzy", 1 },
{ "viper_corrosive_skin", 1 },
{ "pangolier_lucky_shot", 1 },
{ "enchantress_impetus", 1 },
{ "ancient_apparition_chilling_touch", 1 },
{ "bounty_hunter_cutpurse2", 1 },
{ "faceless_void_backtrack2", 1 },
}
function item_skill_learning:GetStoredAbility()
return self.stored_ability_data
end
function item_skill_learning:GetMaxUsagePerPlayer()
local configured = self:GetSpecialValueFor("max_usage_per_player")
if configured ~= nil and configured > 0 then
return configured
end
return 3
end
function item_skill_learning:GetUsageKey(player_id)
local steam_id = PlayerResource:GetSteamAccountID(player_id)
if steam_id ~= nil and steam_id > 0 then
return "skill_learning_steam_" .. tostring(steam_id)
end
return "skill_learning_player_" .. tostring(player_id)
end
function item_skill_learning:SetStoredAbility(data)
self.stored_ability_data = data
if IsServer() then
local caster = self:GetCaster()
if caster and data and data.ability_name then
local modifiers = caster:FindAllModifiersByName("modifier_skill_learning_display")
for _, mod in pairs(modifiers) do
mod:Destroy()
end
caster:AddNewModifier(caster, self, "modifier_skill_learning_display", {
ability_name = data.ability_name
})
end
end
end
function item_skill_learning:GetRandomLotteryAbility(hero)
local all_abilities = {}
for _, ability_data in pairs(LOTTERY_ABILITIES_PASSIVE) do
table.insert(all_abilities, { name = ability_data[1], level = ability_data[2] })
end
local available_abilities = {}
for _, ability_data in pairs(all_abilities) do
if not hero:HasAbility(ability_data.name) then
table.insert(available_abilities, ability_data)
end
end
if #available_abilities > 0 then
local random_index = RandomInt(1, #available_abilities)
return available_abilities[random_index]
end
return { name = "abaddon_aphotic_shield", level = 1 }
end
function item_skill_learning:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
local player_id = caster:GetPlayerOwnerID()
local stored_ability = self:GetStoredAbility()
print("[SkillLearning] OnSpellStart, caster:", caster:GetUnitName())
print("[SkillLearning] Stored ability:", stored_ability and stored_ability.ability_name or "nil")
if not stored_ability or not stored_ability.ability_name then
print("[SkillLearning] ERROR: No stored ability")
return
end
if not SkillTomeHasAuthorizedItem(self) then
print("[SkillLearning] unauthorized item instance")
SkillTomeRecordUnauthorizedUse(self)
local player = caster:GetPlayerOwner()
if player then
CustomGameEventManager:Send_ServerToPlayer(player, "player_tip_error", {
message = "#dota_hud_error_skill_tome_unauthorized"
})
end
return
end
local usage_key = self:GetUsageKey(player_id)
local usage_data = CustomNetTables:GetTableValue("skill_learning_usage", usage_key)
local max_usage = self:GetMaxUsagePerPlayer()
local current_count = (usage_data and usage_data.count) or 0
print("[SkillLearning] usage times:", current_count, "max:", max_usage, "key:", usage_key)
if current_count >= max_usage then
print("[SkillLearning] Max usage reached:", current_count)
return
end
local existing_ability = caster:FindAbilityByName(stored_ability.ability_name)
if existing_ability then
print("[SkillLearning] Already has this ability")
return
end
local new_ability = caster:AddAbility(stored_ability.ability_name)
if new_ability then
new_ability:SetLevel(stored_ability.ability_level or 1)
if ApplyLotteryAbilityGrantSideEffects then
ApplyLotteryAbilityGrantSideEffects(_, caster, stored_ability.ability_name, new_ability, player_id)
end
print("[SkillLearning] Added ability:", stored_ability.ability_name)
local new_count = current_count + 1
CustomNetTables:SetTableValue("skill_learning_usage", usage_key, { count = new_count })
caster:RemoveModifierByName("modifier_skill_learning_display")
EmitSoundOn("Item.TomeOfKnowledge", caster)
SkillTomeRecordSuccessfulUse(self)
SkillTomeConsumeAuthorizedItem(self)
end
self:RemoveSelf()
end
function item_skill_learning:GetAbilityTextureName()
local stored_ability = self:GetStoredAbility()
if stored_ability and stored_ability.ability_name then
return stored_ability.ability_name
end
return "item_skill_learning"
end
modifier_skill_learning_tracker = class({})
function modifier_skill_learning_tracker:IsHidden()
return true
end
function modifier_skill_learning_tracker:IsPurgable()
return false
end
function modifier_skill_learning_tracker:OnCreated()
if IsServer() then
Timers:CreateTimer(0.03, function()
local caster = self:GetCaster()
local ability = self:GetAbility()
if not caster or not ability then return end
local stored_ability = ability:GetStoredAbility()
if stored_ability and stored_ability.ability_name then
local modifiers = caster:FindAllModifiersByName("modifier_skill_learning_display")
for _, mod in pairs(modifiers) do
mod:Destroy()
end
caster:AddNewModifier(caster, ability, "modifier_skill_learning_display", {
ability_name = stored_ability.ability_name
})
end
end)
end
end
function modifier_skill_learning_tracker:OnDestroy()
if IsServer() then
local caster = self:GetCaster()
local modifiers = caster:FindAllModifiersByName("modifier_skill_learning_display")
for _, mod in pairs(modifiers) do
mod:Destroy()
end
end
end
modifier_skill_learning_display = class({})
function modifier_skill_learning_display:IsHidden()
return false
end
function modifier_skill_learning_display:IsPurgable()
return false
end
function modifier_skill_learning_display:RemoveOnDeath()
return false
end
function modifier_skill_learning_display:GetAttributes()
return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_skill_learning_display:OnCreated(params)
if IsServer() then
local ability = self:GetAbility()
if ability then
local stored_ability = ability:GetStoredAbility()
if stored_ability then
self.ability_name = stored_ability.ability_name
end
end
self:SetHasCustomTransmitterData(true)
end
end
function modifier_skill_learning_display:AddCustomTransmitterData()
return {
ability_name = self.ability_name
}
end
function modifier_skill_learning_display:HandleCustomTransmitterData(data)
self.ability_name = data.ability_name
end
function modifier_skill_learning_display:GetTexture()
return self.ability_name or "skill_learning"
end
function modifier_skill_learning_display:DeclareFunctions()
return {
MODIFIER_PROPERTY_TOOLTIP
}
end
function modifier_skill_learning_display:OnTooltip()
return self.ability_level or 1
end
