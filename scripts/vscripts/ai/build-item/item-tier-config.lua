local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFrom = ____lualib.__TS__ArrayFrom
local ____exports = {}
____exports.ItemTier = ItemTier or ({})
____exports.ItemTier.T1 = 1
____exports.ItemTier[____exports.ItemTier.T1] = "T1"
____exports.ItemTier.T2 = 2
____exports.ItemTier[____exports.ItemTier.T2] = "T2"
____exports.ItemTier.T3 = 3
____exports.ItemTier[____exports.ItemTier.T3] = "T3"
____exports.ItemTier.T4 = 4
____exports.ItemTier[____exports.ItemTier.T4] = "T4"
____exports.ItemTier.T5 = 5
____exports.ItemTier[____exports.ItemTier.T5] = "T5"
____exports.ItemTierConfig = {
item_boots = {name = "item_boots", tier = ____exports.ItemTier.T1, cost = 500, upgrades = {"item_power_treads", "item_phase_boots", "item_arcane_boots", "item_tranquil_boots"}},
item_magic_wand = {name = "item_magic_wand", tier = ____exports.ItemTier.T1, cost = 450, upgrades = {"item_holy_locket"}},
item_bracer = {name = "item_bracer", tier = ____exports.ItemTier.T1, cost = 500},
item_null_talisman = {name = "item_null_talisman", tier = ____exports.ItemTier.T1, cost = 500},
item_wraith_band = {name = "item_wraith_band", tier = ____exports.ItemTier.T1, cost = 500},
item_quelling_blade_2_datadriven = {name = "item_quelling_blade_2_datadriven", tier = ____exports.ItemTier.T1, cost = 600},
item_blood_grenade = {name = "item_blood_grenade", tier = ____exports.ItemTier.T1, cost = 100},
item_clarity = {name = "item_clarity", tier = ____exports.ItemTier.T1, cost = 50},
item_tango = {name = "item_tango", tier = ____exports.ItemTier.T1, cost = 120},
item_flask = {name = "item_flask", tier = ____exports.ItemTier.T1, cost = 110},
item_enchanted_mango = {name = "item_enchanted_mango", tier = ____exports.ItemTier.T1, cost = 260},
item_faerie_fire = {name = "item_faerie_fire", tier = ____exports.ItemTier.T1, cost = 260},
item_infused_raindrop = {name = "item_infused_raindrop", tier = ____exports.ItemTier.T1, cost = 675},
item_soul_ring = {name = "item_soul_ring", tier = ____exports.ItemTier.T1, cost = 805},
item_tranquil_boots = {name = "item_tranquil_boots", tier = ____exports.ItemTier.T1, cost = 900},
item_orb_of_corrosion = {name = "item_orb_of_corrosion", tier = ____exports.ItemTier.T1, cost = 1050},
item_falcon_blade = {name = "item_falcon_blade", tier = ____exports.ItemTier.T1, cost = 1125},
item_power_treads = {name = "item_power_treads", tier = ____exports.ItemTier.T1, cost = 1400, upgrades = {"item_phase_boots"}},
item_arcane_boots = {name = "item_arcane_boots", tier = ____exports.ItemTier.T1, cost = 1400},
item_phase_boots = {name = "item_phase_boots", tier = ____exports.ItemTier.T1, cost = 1500, upgrades = {"item_adi_king", "item_adi_king_plus"}},
item_vanguard = {name = "item_vanguard", tier = ____exports.ItemTier.T1, cost = 1700},
item_mask_of_madness = {name = "item_mask_of_madness", tier = ____exports.ItemTier.T1, cost = 1900},
item_kaya = {name = "item_kaya", tier = ____exports.ItemTier.T2, cost = 2100, upgrades = {"item_kaya_and_sange", "item_yasha_and_kaya", "item_sacred_trident"}},
item_sange = {name = "item_sange", tier = ____exports.ItemTier.T2, cost = 2100, upgrades = {"item_sange_and_yasha", "item_kaya_and_sange", "item_sacred_trident"}},
item_yasha = {name = "item_yasha", tier = ____exports.ItemTier.T2, cost = 2100, upgrades = {"item_sange_and_yasha", "item_yasha_and_kaya", "item_sacred_trident"}},
item_glimmer_cape = {name = "item_glimmer_cape", tier = ____exports.ItemTier.T2, cost = 2150},
item_vladmir = {name = "item_vladmir", tier = ____exports.ItemTier.T2, cost = 2200, upgrades = {"item_vladmir_2"}},
item_force_staff = {name = "item_force_staff", tier = ____exports.ItemTier.T2, cost = 2200, upgrades = {"item_force_staff_2", "item_force_staff_3"}},
item_hand_of_midas = {name = "item_hand_of_midas", tier = ____exports.ItemTier.T2, cost = 2200, upgrades = {"item_hand_of_group"}},
item_holy_locket = {name = "item_holy_locket", tier = ____exports.ItemTier.T2, cost = 2250, upgrades = {"item_orb_of_the_brine"}},
item_blink = {name = "item_blink", tier = ____exports.ItemTier.T2, cost = 2250, upgrades = {"item_swift_blink", "item_overwhelming_blink", "item_arcane_blink_2", "item_jump_jump_jump"}},
item_rod_of_atos = {name = "item_rod_of_atos", tier = ____exports.ItemTier.T2, cost = 2250},
item_blade_mail = {name = "item_blade_mail", tier = ____exports.ItemTier.T2, cost = 2300, upgrades = {"item_blade_mail_2"}},
item_aether_lens = {name = "item_aether_lens", tier = ____exports.ItemTier.T2, cost = 2350, upgrades = {"item_aether_lens_2"}},
item_armlet = {name = "item_armlet", tier = ____exports.ItemTier.T2, cost = 2500, upgrades = {"item_armlet_plus", "item_armlet_pro_max"}},
item_travel_boots = {name = "item_travel_boots", tier = ____exports.ItemTier.T2, cost = 2500},
item_heavens_halberd = {name = "item_heavens_halberd", tier = ____exports.ItemTier.T2, cost = 2600, upgrades = {"item_heavens_halberd_v2"}},
item_echo_sabre = {name = "item_echo_sabre", tier = ____exports.ItemTier.T2, cost = 2700, upgrades = {"item_echo_sabre_2"}},
item_basher = {name = "item_basher", tier = ____exports.ItemTier.T2, cost = 2875, upgrades = {"item_abyssal_blade", "item_abyssal_blade_v2"}},
item_aeon_disk = {name = "item_aeon_disk", tier = ____exports.ItemTier.T2, cost = 3000, upgrades = {"item_aeon_pendant"}},
item_aether_lens_2 = {name = "item_aether_lens_2", tier = ____exports.ItemTier.T2, cost = 3200, prerequisite = "item_aether_lens"},
item_desolator = {name = "item_desolator", tier = ____exports.ItemTier.T2, cost = 3500, upgrades = {"item_dodo_desolator", "item_infernal_desolator"}},
item_wings_of_haste = {name = "item_wings_of_haste", tier = ____exports.ItemTier.T2, cost = 3700},
item_eternal_shroud = {name = "item_eternal_shroud", tier = ____exports.ItemTier.T2, cost = 3700, upgrades = {"item_eternal_shroud_ultra"}},
item_force_staff_2 = {
name = "item_force_staff_2",
tier = ____exports.ItemTier.T2,
cost = 3700,
prerequisite = "item_force_staff",
upgrades = {"item_force_staff_3"}
},
item_pipe = {name = "item_pipe", tier = ____exports.ItemTier.T2, cost = 3725},
item_lotus_orb = {name = "item_lotus_orb", tier = ____exports.ItemTier.T2, cost = 3850, upgrades = {"item_saint_orb"}},
item_bfury = {name = "item_bfury", tier = ____exports.ItemTier.T2, cost = 3900, upgrades = {"item_bfury_ultra"}},
item_black_king_bar = {name = "item_black_king_bar", tier = ____exports.ItemTier.T2, cost = 4050, upgrades = {"item_black_king_bar_2"}},
item_yasha_and_kaya = {
name = "item_yasha_and_kaya",
tier = ____exports.ItemTier.T2,
cost = 4200,
prerequisite = "item_yasha",
upgrades = {"item_sacred_trident", "item_sacred_six_vein"}
},
item_ultimate_scepter = {name = "item_ultimate_scepter", tier = ____exports.ItemTier.T2, cost = 4200, upgrades = {"item_ultimate_scepter_2"}},
item_kaya_and_sange = {
name = "item_kaya_and_sange",
tier = ____exports.ItemTier.T2,
cost = 4200,
prerequisite = "item_kaya",
upgrades = {"item_sacred_trident", "item_sacred_six_vein", "item_kaya_and_sange_1"}
},
item_sange_and_yasha = {
name = "item_sange_and_yasha",
tier = ____exports.ItemTier.T2,
cost = 4200,
prerequisite = "item_sange",
upgrades = {"item_sacred_trident", "item_sacred_six_vein", "item_sange_and_yasha_1"}
},
item_echo_sabre_2 = {name = "item_echo_sabre_2", tier = ____exports.ItemTier.T2, cost = 4325},
item_bloodstone_v2 = {name = "item_bloodstone_v2", tier = ____exports.ItemTier.T2, cost = 4400, upgrades = {"item_bloodstone"}},
item_hurricane_pike = {name = "item_hurricane_pike", tier = ____exports.ItemTier.T2, cost = 4450, upgrades = {"item_hurricane_pike_2"}},
item_shotgun = {name = "item_shotgun", tier = ____exports.ItemTier.T2, cost = 4500, upgrades = {"item_shotgun_v2"}},
item_armlet_plus = {
name = "item_armlet_plus",
tier = ____exports.ItemTier.T2,
cost = 4500,
prerequisite = "item_armlet",
upgrades = {"item_armlet_pro_max"}
},
item_gungir = {name = "item_gungir", tier = ____exports.ItemTier.T2, cost = 4550, upgrades = {"item_gungir_2"}},
item_manta = {name = "item_manta", tier = ____exports.ItemTier.T2, cost = 4650, upgrades = {"item_manta_1", "item_manta_2"}},
item_monkey_king_bar = {name = "item_monkey_king_bar", tier = ____exports.ItemTier.T2, cost = 4700, upgrades = {"item_monkey_king_bar_2"}},
item_radiance = {name = "item_radiance", tier = ____exports.ItemTier.T2, cost = 4700, upgrades = {"item_radiance_2"}},
item_sphere = {name = "item_sphere", tier = ____exports.ItemTier.T2, cost = 4800, upgrades = {"item_sphere_2", "item_saint_orb"}},
item_hand_of_group = {name = "item_hand_of_group", tier = ____exports.ItemTier.T2, cost = 4800, prerequisite = "item_hand_of_midas"},
item_octarine_core = {name = "item_octarine_core", tier = ____exports.ItemTier.T2, cost = 4800, upgrades = {"item_arcane_octarine_core", "item_refresh_core"}},
item_adi_king = {
name = "item_adi_king",
tier = ____exports.ItemTier.T3,
cost = 5000,
prerequisite = "item_power_treads",
upgrades = {"item_adi_king_plus"}
},
item_refresher = {name = "item_refresher", tier = ____exports.ItemTier.T3, cost = 5000, upgrades = {"item_refresh_core"}},
item_satanic = {name = "item_satanic", tier = ____exports.ItemTier.T3, cost = 5050, upgrades = {"item_satanic_2"}},
item_arcane_blink_2 = {
name = "item_arcane_blink_2",
tier = ____exports.ItemTier.T3,
cost = 5050,
prerequisite = "item_blink",
upgrades = {"item_arcane_blink", "item_jump_jump_jump"}
},
item_guardian_greaves = {name = "item_guardian_greaves", tier = ____exports.ItemTier.T3, cost = 5050, upgrades = {"item_guardian_greaves_artifact"}},
item_greater_crit = {name = "item_greater_crit", tier = ____exports.ItemTier.T3, cost = 5100},
item_assault = {name = "item_assault", tier = ____exports.ItemTier.T3, cost = 5125},
item_shivas_guard = {name = "item_shivas_guard", tier = ____exports.ItemTier.T3, cost = 5175, upgrades = {"item_shivas_guard_2"}},
item_sheepstick = {name = "item_sheepstick", tier = ____exports.ItemTier.T3, cost = 5200, upgrades = {"item_necronomicon_staff"}},
item_heart = {name = "item_heart", tier = ____exports.ItemTier.T3, cost = 5200, upgrades = {"item_undying_heart"}},
item_force_staff_3 = {name = "item_force_staff_3", tier = ____exports.ItemTier.T3, cost = 5200, prerequisite = "item_force_staff_2"},
item_swift_blink = {
name = "item_swift_blink",
tier = ____exports.ItemTier.T3,
cost = 5300,
prerequisite = "item_blink",
upgrades = {"item_swift_blink_2", "item_jump_jump_jump"}
},
item_overwhelming_blink = {
name = "item_overwhelming_blink",
tier = ____exports.ItemTier.T3,
cost = 5300,
prerequisite = "item_blink",
upgrades = {"item_overwhelming_blink_2", "item_jump_jump_jump"}
},
item_silver_edge = {name = "item_silver_edge", tier = ____exports.ItemTier.T3, cost = 5350, upgrades = {"item_silver_edge_2"}},
item_ethereal_blade = {name = "item_ethereal_blade", tier = ____exports.ItemTier.T3, cost = 5450, upgrades = {"item_ethereal_blade_ultra"}},
item_butterfly = {name = "item_butterfly", tier = ____exports.ItemTier.T3, cost = 5450, upgrades = {"item_wasp_callous", "item_wasp_despotic", "item_wasp_golden"}},
item_mjollnir = {name = "item_mjollnir", tier = ____exports.ItemTier.T3, cost = 5500},
item_blade_mail_2 = {name = "item_blade_mail_2", tier = ____exports.ItemTier.T3, cost = 5600, prerequisite = "item_blade_mail"},
item_rapier = {name = "item_rapier", tier = ____exports.ItemTier.T3, cost = 5600, upgrades = {"item_excalibur"}},
item_skadi = {name = "item_skadi", tier = ____exports.ItemTier.T3, cost = 5900, upgrades = {"item_skadi_2"}},
item_radiance_2 = {name = "item_radiance_2", tier = ____exports.ItemTier.T3, cost = 6000, prerequisite = "item_radiance"},
item_phylactery = {name = "item_phylactery", tier = ____exports.ItemTier.T3, cost = 6000},
item_aeon_pendant = {name = "item_aeon_pendant", tier = ____exports.ItemTier.T3, cost = 6000, prerequisite = "item_aeon_disk"},
item_devastator = {name = "item_devastator", tier = ____exports.ItemTier.T3, cost = 6200, upgrades = {"item_devastator_2"}},
item_abyssal_blade = {
name = "item_abyssal_blade",
tier = ____exports.ItemTier.T3,
cost = 6250,
prerequisite = "item_basher",
upgrades = {"item_abyssal_blade_v2"}
},
item_armlet_pro_max = {name = "item_armlet_pro_max", tier = ____exports.ItemTier.T3, cost = 6500, prerequisite = "item_armlet_plus"},
item_sphere_2 = {
name = "item_sphere_2",
tier = ____exports.ItemTier.T3,
cost = 6800,
prerequisite = "item_sphere",
upgrades = {"item_saint_orb"}
},
item_dagon_5 = {name = "item_dagon_5", tier = ____exports.ItemTier.T3, cost = 7450},
item_sacred_trident = {
name = "item_sacred_trident",
tier = ____exports.ItemTier.T3,
cost = 7800,
prerequisite = "item_kaya",
upgrades = {"item_sacred_six_vein"}
},
item_manta_1 = {
name = "item_manta_1",
tier = ____exports.ItemTier.T3,
cost = 8000,
prerequisite = "item_manta",
upgrades = {"item_manta_2"}
},
item_orb_of_the_brine = {name = "item_orb_of_the_brine", tier = ____exports.ItemTier.T3, cost = 8000, prerequisite = "item_holy_locket"},
item_magic_scepter = {name = "item_magic_scepter", tier = ____exports.ItemTier.T3, cost = 8000, upgrades = {"item_hallowed_scepter"}},
item_moon_shard_datadriven = {name = "item_moon_shard_datadriven", tier = ____exports.ItemTier.T3, cost = 8000},
item_silver_edge_2 = {name = "item_silver_edge_2", tier = ____exports.ItemTier.T3, cost = 8350, prerequisite = "item_silver_edge"},
item_dodo_desolator = {
name = "item_dodo_desolator",
tier = ____exports.ItemTier.T3,
cost = 8600,
prerequisite = "item_desolator",
upgrades = {"item_infernal_desolator"}
},
item_ultimate_scepter_2 = {name = "item_ultimate_scepter_2", tier = ____exports.ItemTier.T3, cost = 8600, prerequisite = "item_ultimate_scepter"},
item_bloodstone = {name = "item_bloodstone", tier = ____exports.ItemTier.T3, cost = 9000, prerequisite = "item_bloodstone_v2"},
item_heavens_halberd_v2 = {name = "item_heavens_halberd_v2", tier = ____exports.ItemTier.T3, cost = 9500, prerequisite = "item_heavens_halberd"},
item_adi_king_plus = {name = "item_adi_king_plus", tier = ____exports.ItemTier.T3, cost = 9600, prerequisite = "item_adi_king"},
item_eternal_shroud_ultra = {name = "item_eternal_shroud_ultra", tier = ____exports.ItemTier.T3, cost = 9600},
item_hurricane_pike_2 = {name = "item_hurricane_pike_2", tier = ____exports.ItemTier.T3, cost = 9700, prerequisite = "item_hurricane_pike"},
item_monkey_king_bar_2 = {name = "item_monkey_king_bar_2", tier = ____exports.ItemTier.T3, cost = 9800, prerequisite = "item_monkey_king_bar"},
item_angels_demise = {name = "item_angels_demise", tier = ____exports.ItemTier.T3, cost = 9800},
item_vladmir_2 = {name = "item_vladmir_2", tier = ____exports.ItemTier.T3, cost = 9800, prerequisite = "item_vladmir"},
item_wasp_callous = {
name = "item_wasp_callous",
tier = ____exports.ItemTier.T4,
cost = 10000,
prerequisite = "item_butterfly",
upgrades = {"item_wasp_golden"}
},
item_wasp_despotic = {
name = "item_wasp_despotic",
tier = ____exports.ItemTier.T4,
cost = 10000,
prerequisite = "item_butterfly",
upgrades = {"item_wasp_golden"}
},
item_shotgun_v2 = {name = "item_shotgun_v2", tier = ____exports.ItemTier.T4, cost = 10000, prerequisite = "item_shotgun"},
item_arcane_blink = {
name = "item_arcane_blink",
tier = ____exports.ItemTier.T4,
cost = 10100,
prerequisite = "item_arcane_blink_2",
upgrades = {"item_jump_jump_jump"}
},
item_overwhelming_blink_2 = {
name = "item_overwhelming_blink_2",
tier = ____exports.ItemTier.T4,
cost = 10600,
prerequisite = "item_overwhelming_blink",
upgrades = {"item_jump_jump_jump"}
},
item_arcane_octarine_core = {name = "item_arcane_octarine_core", tier = ____exports.ItemTier.T4, cost = 10600, prerequisite = "item_octarine_core"},
item_swift_blink_2 = {
name = "item_swift_blink_2",
tier = ____exports.ItemTier.T4,
cost = 10600,
prerequisite = "item_swift_blink",
upgrades = {"item_jump_jump_jump"}
},
item_insight_armor = {name = "item_insight_armor", tier = ____exports.ItemTier.T4, cost = 10800},
item_abyssal_blade_v2 = {
name = "item_abyssal_blade_v2",
tier = ____exports.ItemTier.T4,
cost = 10800,
prerequisite = "item_abyssal_blade",
upgrades = {"item_shadow_judgment"}
},
item_saint_orb = {name = "item_saint_orb", tier = ____exports.ItemTier.T4, cost = 11000, prerequisite = "item_lotus_orb"},
item_manta_2 = {name = "item_manta_2", tier = ____exports.ItemTier.T4, cost = 11100, prerequisite = "item_manta_1"},
item_black_king_bar_2 = {
name = "item_black_king_bar_2",
tier = ____exports.ItemTier.T4,
cost = 11600,
prerequisite = "item_black_king_bar",
upgrades = {"item_beast_shield"}
},
item_ethereal_blade_ultra = {name = "item_ethereal_blade_ultra", tier = ____exports.ItemTier.T4, cost = 12000, prerequisite = "item_ethereal_blade"},
item_skadi_2 = {name = "item_skadi_2", tier = ____exports.ItemTier.T4, cost = 12000, prerequisite = "item_skadi"},
item_satanic_2 = {name = "item_satanic_2", tier = ____exports.ItemTier.T4, cost = 12000, prerequisite = "item_satanic"},
item_bfury_ultra = {name = "item_bfury_ultra", tier = ____exports.ItemTier.T4, cost = 12000, prerequisite = "item_bfury"},
item_devastator_2 = {name = "item_devastator_2", tier = ____exports.ItemTier.T4, cost = 12600, prerequisite = "item_devastator"},
item_undying_heart = {name = "item_undying_heart", tier = ____exports.ItemTier.T4, cost = 13800, prerequisite = "item_heart"},
item_shivas_guard_2 = {name = "item_shivas_guard_2", tier = ____exports.ItemTier.T4, cost = 14000, prerequisite = "item_shivas_guard"},
item_kaya_and_sange_1 = {name = "item_kaya_and_sange_1", tier = ____exports.ItemTier.T4, cost = 14000, prerequisite = "item_kaya_and_sange"},
item_sange_and_yasha_1 = {name = "item_sange_and_yasha_1", tier = ____exports.ItemTier.T4, cost = 14000, prerequisite = "item_sange_and_yasha"},
item_gungir_2 = {name = "item_gungir_2", tier = ____exports.ItemTier.T4, cost = 15000, prerequisite = "item_gungir"},
item_infernal_desolator = {
name = "item_infernal_desolator",
tier = ____exports.ItemTier.T4,
cost = 15600,
prerequisite = "item_dodo_desolator",
upgrades = {"item_magic_sword"}
},
item_sacred_six_vein = {name = "item_sacred_six_vein", tier = ____exports.ItemTier.T4, cost = 15600, prerequisite = "item_sacred_trident"},
item_jump_jump_jump = {name = "item_jump_jump_jump", tier = ____exports.ItemTier.T4, cost = 15650, prerequisite = "item_overwhelming_blink_2"},
item_necronomicon_staff = {name = "item_necronomicon_staff", tier = ____exports.ItemTier.T4, cost = 16000, prerequisite = "item_sheepstick"},
item_force_field_ultra = {name = "item_force_field_ultra", tier = ____exports.ItemTier.T4, cost = 16600},
item_blue_fantasy = {name = "item_blue_fantasy", tier = ____exports.ItemTier.T4, cost = 16745},
item_hallowed_scepter = {
name = "item_hallowed_scepter",
tier = ____exports.ItemTier.T4,
cost = 16800,
prerequisite = "item_magic_scepter",
upgrades = {"item_magic_crit_blade"}
},
item_refresh_core = {name = "item_refresh_core", tier = ____exports.ItemTier.T4, cost = 19800, prerequisite = "item_arcane_octarine_core"},
item_guardian_greaves_artifact = {name = "item_guardian_greaves_artifact", tier = ____exports.ItemTier.T4, cost = 19900, prerequisite = "item_guardian_greaves"},
item_tome_of_agility = {name = "item_tome_of_agility", tier = ____exports.ItemTier.T4, cost = 19999},
item_tome_of_intelligence = {name = "item_tome_of_intelligence", tier = ____exports.ItemTier.T4, cost = 19999},
item_tome_of_strength = {name = "item_tome_of_strength", tier = ____exports.ItemTier.T4, cost = 19999},
item_wasp_golden = {name = "item_wasp_golden", tier = ____exports.ItemTier.T4, cost = 20000, prerequisite = "item_wasp_callous"},
item_excalibur = {
name = "item_excalibur",
tier = ____exports.ItemTier.T4,
cost = 29800,
prerequisite = "item_monkey_king_bar_2",
upgrades = {"item_rapier_ultra_bot_1"}
},
item_hawkeye_fighter = {name = "item_hawkeye_fighter", tier = ____exports.ItemTier.T5, cost = 56349},
item_dracula_mask = {name = "item_dracula_mask", tier = ____exports.ItemTier.T5, cost = 57449},
item_forbidden_staff = {name = "item_forbidden_staff", tier = ____exports.ItemTier.T5, cost = 58449},
item_tome_of_luoshu = {name = "item_tome_of_luoshu", tier = ____exports.ItemTier.T5, cost = 60000},
item_rapier_ultra_bot_1 = {name = "item_rapier_ultra_bot_1", tier = ____exports.ItemTier.T5, cost = 60000, prerequisite = "item_excalibur"},
item_swift_glove = {name = "item_swift_glove", tier = ____exports.ItemTier.T5, cost = 60099},
item_forbidden_blade = {name = "item_forbidden_blade", tier = ____exports.ItemTier.T5, cost = 62544},
item_shadow_impact = {name = "item_shadow_impact", tier = ____exports.ItemTier.T5, cost = 65249},
item_hawkeye_turret = {name = "item_hawkeye_turret", tier = ____exports.ItemTier.T5, cost = 65299},
item_withered_spring = {name = "item_withered_spring", tier = ____exports.ItemTier.T5, cost = 65649, prerequisite = "item_undying_heart"},
item_magic_crit_blade = {name = "item_magic_crit_blade", tier = ____exports.ItemTier.T5, cost = 65999, prerequisite = "item_hallowed_scepter"},
item_beast_armor = {name = "item_beast_armor", tier = ____exports.ItemTier.T5, cost = 66599},
item_magic_sword = {name = "item_magic_sword", tier = ____exports.ItemTier.T5, cost = 69599, prerequisite = "item_bfury_ultra"},
item_beast_shield = {name = "item_beast_shield", tier = ____exports.ItemTier.T5, cost = 71799},
item_time_gem = {name = "item_time_gem", tier = ____exports.ItemTier.T5, cost = 77799, prerequisite = "item_refresh_core"},
item_switchable_crit_blade = {name = "item_switchable_crit_blade", tier = ____exports.ItemTier.T5, cost = 79799},
item_ten_thousand_swords = {name = "item_ten_thousand_swords", tier = ____exports.ItemTier.T5, cost = 87599}
}
function ____exports.getItemConfig(self, itemName)
return ____exports.ItemTierConfig[itemName]
end
function ____exports.getItemTier(self, itemName)
local ____opt_0 = ____exports.ItemTierConfig[itemName]
return ____opt_0 and ____opt_0.tier
end
function ____exports.InitializeItemUpgrades(self)
print("[AI] InitializeItemUpgrades 初始化装备升级关系")
for itemName in pairs(____exports.ItemTierConfig) do
do
local config = ____exports.ItemTierConfig[itemName]
if not config then
goto __continue5
end
local upgradesFromPrerequisite = {}
for otherItemName in pairs(____exports.ItemTierConfig) do
do
local otherConfig = ____exports.ItemTierConfig[otherItemName]
if not otherConfig then
goto __continue7
end
if otherConfig.prerequisite == itemName then
upgradesFromPrerequisite[#upgradesFromPrerequisite + 1] = otherItemName
end
end
::__continue7::
end
if #upgradesFromPrerequisite > 0 then
if config.upgrades and #config.upgrades > 0 then
local existingUpgrades = __TS__New(Set, config.upgrades)
for ____, upgrade in ipairs(upgradesFromPrerequisite) do
existingUpgrades:add(upgrade)
end
config.upgrades = __TS__ArrayFrom(existingUpgrades)
else
config.upgrades = upgradesFromPrerequisite
end
end
end
::__continue5::
end
for itemName in pairs(____exports.ItemTierConfig) do
do
local config = ____exports.ItemTierConfig[itemName]
if not config then
goto __continue17
end
if not config.upgrades or #config.upgrades == 0 then
goto __continue17
end
local allUpgrades = __TS__New(Set, config.upgrades)
local visited = __TS__New(Set)
local function collectAllUpgrades(self, item)
if visited:has(item) then
return
end
visited:add(item)
local itemConfig = ____exports.ItemTierConfig[item]
if not itemConfig or not itemConfig.upgrades then
return
end
for ____, upgrade in ipairs(itemConfig.upgrades) do
if not allUpgrades:has(upgrade) then
allUpgrades:add(upgrade)
collectAllUpgrades(nil, upgrade)
end
end
end
for ____, directUpgrade in ipairs(config.upgrades) do
collectAllUpgrades(nil, directUpgrade)
end
config.upgrades = __TS__ArrayFrom(allUpgrades)
end
::__continue17::
end
end
function ____exports.GetItemPrerequisites(self, itemName)
local config = ____exports.ItemTierConfig[itemName]
if not config or not config.prerequisite then
return {}
end
local prerequisites = {}
local currentItem = config.prerequisite
while currentItem do
local currentConfig = ____exports.ItemTierConfig[currentItem]
if not currentConfig then
break
end
prerequisites[#prerequisites + 1] = currentItem
currentItem = currentConfig.prerequisite
end
return prerequisites
end
function ____exports.GetItemUpgradeChain(self, itemName)
local config = ____exports.ItemTierConfig[itemName]
return config and config.upgrades or ({})
end
return ____exports
