local ____exports = {}
local ____hero_2Dbuild_2Dconfig_2Dtemplate = require("ai.build-item.hero-build-config-template")
local HeroTemplate = ____hero_2Dbuild_2Dconfig_2Dtemplate.HeroTemplate
local ____item_2Dtier_2Dconfig = require("ai.build-item.item-tier-config")
local ItemTier = ____item_2Dtier_2Dconfig.ItemTier
____exports.HeroBuilds = {
npc_dota_hero_bounty_hunter = {template = HeroTemplate.AgilityCarryMelee, targetItemsByTier = {[ItemTier.T1] = {"item_hand_of_midas"}, [ItemTier.T4] = {"item_blue_fantasy", "item_sange_and_yasha_1"}}},
npc_dota_hero_luna = {template = HeroTemplate.AgilityCarryRanged, targetItemsByTier = {[ItemTier.T3] = {"item_monkey_king_bar_2"}, [ItemTier.T4] = {"item_excalibur", "item_skadi_2", "item_satanic_2", "item_black_king_bar_2"}}},
npc_dota_hero_drow_ranger = {template = HeroTemplate.AgilityCarryRanged, targetItemsByTier = {[ItemTier.T3] = {"item_monkey_king_bar_2", "item_hurricane_pike_2"}, [ItemTier.T4] = {"item_excalibur", "item_satanic_2", "item_black_king_bar_2"}}},
npc_dota_hero_sniper = {template = HeroTemplate.AgilityCarryRanged, targetItemsByTier = {[ItemTier.T3] = {"item_monkey_king_bar_2", "item_hurricane_pike_2"}, [ItemTier.T4] = {"item_shotgun_v2", "item_satanic_2", "item_black_king_bar_2"}}},
npc_dota_hero_lion = {template = HeroTemplate.MagicalCarry, targetItemsByTier = {[ItemTier.T3] = {"item_aeon_pendant"}, [ItemTier.T4] = {"item_hallowed_scepter", "item_necronomicon_staff", "item_refresh_core", "item_arcane_blink"}}},
npc_dota_hero_lina = {template = HeroTemplate.MagicalCarry, targetItemsByTier = {[ItemTier.T4] = {"item_hallowed_scepter", "item_necronomicon_staff", "item_refresh_core", "item_arcane_blink"}}},
npc_dota_hero_shadow_shaman = {template = HeroTemplate.MagicalCarry, targetItemsByTier = {[ItemTier.T3] = {"item_aeon_pendant"}, [ItemTier.T4] = {"item_hallowed_scepter", "item_necronomicon_staff", "item_refresh_core", "item_arcane_blink"}}},
npc_dota_hero_abaddon = {template = HeroTemplate.StrengthTank, targetItemsByTier = {[ItemTier.T2] = {"item_hand_of_group"}, [ItemTier.T3] = {"item_radiance_2", "item_orb_of_the_brine"}, [ItemTier.T4] = {"item_shivas_guard_2", "item_saint_orb"}, [ItemTier.T5] = {"item_magic_sword", "item_time_gem"}}},
npc_dota_hero_axe = {template = HeroTemplate.StrengthTank, targetItemsByTier = {[ItemTier.T1] = {"item_hand_of_midas"}, [ItemTier.T3] = {"item_blade_mail_2", "item_radiance_2"}, [ItemTier.T4] = {}, [ItemTier.T5] = {"item_jump_jump_jump"}}},
npc_dota_hero_pudge = {template = HeroTemplate.StrengthTank, targetItemsByTier = {[ItemTier.T3] = {"item_blade_mail_2", "item_radiance_2", "item_eternal_shroud_ultra"}, [ItemTier.T4] = {"item_undying_heart", "item_black_king_bar_2", "item_overwhelming_blink_2"}}},
npc_dota_hero_bane = {template = HeroTemplate.Support, targetItemsByTier = {[ItemTier.T1] = {"item_hand_of_midas"}}},
npc_dota_hero_crystal_maiden = {template = HeroTemplate.Support, targetItemsByTier = {[ItemTier.T2] = {"item_aether_lens_2"}, [ItemTier.T3] = {"item_aeon_pendant"}, [ItemTier.T4] = {"item_hallowed_scepter", "item_necronomicon_staff", "item_refresh_core"}}}
}
function ____exports.getHeroBuildConfig(self, heroName)
return ____exports.HeroBuilds[heroName]
end
return ____exports
