local ____exports = {}
local ____item_2Dtier_2Dconfig = require("ai.build-item.item-tier-config")
local ItemTier = ____item_2Dtier_2Dconfig.ItemTier
____exports.HeroTemplate = HeroTemplate or ({})
____exports.HeroTemplate.StrengthTank = "StrengthTank"
____exports.HeroTemplate.AgilityCarryMelee = "AgilityCarryMelee"
____exports.HeroTemplate.AgilityCarryRanged = "AgilityCarryRanged"
____exports.HeroTemplate.MagicalCarry = "MagicalCarry"
____exports.HeroTemplate.Support = "Support"
local StrengthTankTemplate = {name = ____exports.HeroTemplate.StrengthTank, itemsByTier = {
[ItemTier.T1] = {"item_phase_boots", "item_bracer", "item_vanguard"},
[ItemTier.T2] = {
"item_blink",
"item_blade_mail",
"item_echo_sabre_2",
"item_radiance",
"item_black_king_bar"
},
[ItemTier.T3] = {"item_overwhelming_blink", "item_blade_mail_2", "item_heart", "item_radiance_2"},
[ItemTier.T4] = {
"item_black_king_bar_2",
"item_jump_jump_jump",
"item_insight_armor",
"item_undying_heart",
"item_abyssal_blade_v2",
"item_shivas_guard_2"
},
[ItemTier.T5] = {"item_beast_shield", "item_beast_armor", "item_withered_spring"}
}, consumablesByTier = {
[ItemTier.T1] = {"item_blood_grenade", "item_faerie_fire"},
[ItemTier.T2] = {"item_aghanims_shard", "item_wings_of_haste"},
[ItemTier.T3] = {"item_ultimate_scepter_2"},
[ItemTier.T4] = {"item_tome_of_strength"},
[ItemTier.T5] = {
"item_tome_of_luoshu",
"item_tome_of_strength",
"item_tome_of_strength",
"item_tome_of_agility",
"item_tome_of_intelligence"
}
}}
local AgilityCarryMeleeTemplate = {name = ____exports.HeroTemplate.AgilityCarryMelee, itemsByTier = {
[ItemTier.T1] = {"item_power_treads", "item_wraith_band", "item_vanguard"},
[ItemTier.T2] = {"item_sange_and_yasha", "item_monkey_king_bar", "item_black_king_bar"},
[ItemTier.T3] = {"item_monkey_king_bar_2", "item_wasp_callous", "item_satanic"},
[ItemTier.T4] = {
"item_black_king_bar_2",
"item_wasp_golden",
"item_infernal_desolator",
"item_excalibur",
"item_abyssal_blade_v2",
"item_satanic_2"
},
[ItemTier.T5] = {"item_rapier_ultra_bot_1", "item_magic_sword", "item_switchable_crit_blade"}
}, consumablesByTier = {
[ItemTier.T1] = {"item_blood_grenade", "item_faerie_fire"},
[ItemTier.T2] = {"item_aghanims_shard", "item_wings_of_haste"},
[ItemTier.T3] = {"item_ultimate_scepter_2", "item_moon_shard_datadriven"},
[ItemTier.T4] = {"item_tome_of_agility"},
[ItemTier.T5] = {
"item_tome_of_luoshu",
"item_tome_of_agility",
"item_tome_of_strength",
"item_tome_of_agility",
"item_tome_of_intelligence"
}
}}
local AgilityCarryRangedTemplate = {name = ____exports.HeroTemplate.AgilityCarryRanged, itemsByTier = {
[ItemTier.T1] = {"item_power_treads", "item_wraith_band", "item_mask_of_madness"},
[ItemTier.T2] = {"item_sange_and_yasha", "item_monkey_king_bar", "item_black_king_bar"},
[ItemTier.T3] = {"item_monkey_king_bar_2", "item_satanic"},
[ItemTier.T4] = {"item_excalibur", "item_satanic_2", "item_black_king_bar_2"},
[ItemTier.T5] = {"item_rapier_ultra_bot_1", "item_switchable_crit_blade", "item_hawkeye_turret"}
}, consumablesByTier = {
[ItemTier.T1] = {"item_blood_grenade", "item_faerie_fire"},
[ItemTier.T2] = {"item_aghanims_shard", "item_wings_of_haste"},
[ItemTier.T3] = {"item_ultimate_scepter_2", "item_moon_shard_datadriven"},
[ItemTier.T4] = {"item_tome_of_agility"},
[ItemTier.T5] = {
"item_tome_of_luoshu",
"item_tome_of_agility",
"item_tome_of_strength",
"item_tome_of_agility",
"item_tome_of_intelligence"
}
}}
local MagicalCarryTemplate = {name = ____exports.HeroTemplate.MagicalCarry, itemsByTier = {
[ItemTier.T1] = {"item_arcane_boots", "item_null_talisman", "item_hand_of_midas"},
[ItemTier.T2] = {
"item_kaya",
"item_octarine_core",
"item_rod_of_atos",
"item_glimmer_cape",
"item_force_staff",
"item_aether_lens_2",
"item_aeon_disk"
},
[ItemTier.T3] = {
"item_arcane_blink_2",
"item_magic_scepter",
"item_sheepstick",
"item_refresher",
"item_aeon_pendant"
},
[ItemTier.T4] = {
"item_arcane_blink",
"item_hallowed_scepter",
"item_necronomicon_staff",
"item_refresh_core",
"item_shivas_guard_2"
},
[ItemTier.T5] = {"item_time_gem"}
}, consumablesByTier = {
[ItemTier.T1] = {"item_enchanted_mango", "item_infused_raindrop"},
[ItemTier.T2] = {"item_aghanims_shard", "item_wings_of_haste"},
[ItemTier.T3] = {"item_ultimate_scepter_2"},
[ItemTier.T4] = {"item_tome_of_intelligence"},
[ItemTier.T5] = {
"item_tome_of_luoshu",
"item_tome_of_intelligence",
"item_tome_of_strength",
"item_tome_of_agility",
"item_tome_of_intelligence"
}
}}
local SupportTemplate = {name = ____exports.HeroTemplate.Support, itemsByTier = {
[ItemTier.T1] = {"item_tranquil_boots", "item_magic_wand", "item_null_talisman", "item_hand_of_midas"},
[ItemTier.T2] = {
"item_rod_of_atos",
"item_glimmer_cape",
"item_force_staff",
"item_holy_locket",
"item_aeon_disk",
"item_hand_of_group"
},
[ItemTier.T3] = {"item_guardian_greaves", "item_sheepstick", "item_aeon_pendant", "item_orb_of_the_brine"},
[ItemTier.T4] = {
"item_gungir_2",
"item_guardian_greaves_artifact",
"item_necronomicon_staff",
"item_refresh_core",
"item_shivas_guard_2",
"item_hallowed_scepter"
},
[ItemTier.T5] = {"item_time_gem", "item_magic_crit_blade"}
}, consumablesByTier = {[ItemTier.T1] = {"item_enchanted_mango", "item_infused_raindrop"}, [ItemTier.T2] = {"item_aghanims_shard", "item_wings_of_haste"}, [ItemTier.T3] = {"item_ultimate_scepter_2"}, [ItemTier.T5] = {
"item_tome_of_luoshu",
"item_tome_of_intelligence",
"item_tome_of_strength",
"item_tome_of_agility",
"item_tome_of_intelligence"
}}}
____exports.HeroTemplates = {
[____exports.HeroTemplate.AgilityCarryMelee] = AgilityCarryMeleeTemplate,
[____exports.HeroTemplate.AgilityCarryRanged] = AgilityCarryRangedTemplate,
[____exports.HeroTemplate.MagicalCarry] = MagicalCarryTemplate,
[____exports.HeroTemplate.StrengthTank] = StrengthTankTemplate,
[____exports.HeroTemplate.Support] = SupportTemplate
}
function ____exports.getHeroTemplate(self, template)
return ____exports.HeroTemplates[template]
end
function ____exports.getTemplateItemsByTier(self, template, tier)
local templateConfig = ____exports.HeroTemplates[template]
if not templateConfig then
return {}
end
return templateConfig.itemsByTier[tier] or ({})
end
function ____exports.getTemplateConsumablesByTier(self, template, tier)
local templateConfig = ____exports.HeroTemplates[template]
if not templateConfig or not templateConfig.consumablesByTier then
return {}
end
return templateConfig.consumablesByTier[tier] or ({})
end
return ____exports
