local ____exports = {}
local ____ability_2Dregistry = require("ai.ability.ability-registry")
local AbilityRegistry = ____ability_2Dregistry.AbilityRegistry
local ____ancient_apparition_chilling_touch = require("ai.ability.specs.ancient_apparition_chilling_touch")
local ancientApparitionChillingTouch = ____ancient_apparition_chilling_touch.SPECS
local ____axe_battle_hunger = require("ai.ability.specs.axe_battle_hunger")
local axeBattleHunger = ____axe_battle_hunger.SPECS
local ____axe_berserkers_call = require("ai.ability.specs.axe_berserkers_call")
local axeBerserkerSCall = ____axe_berserkers_call.SPECS
local ____axe_culling_blade = require("ai.ability.specs.axe_culling_blade")
local axeCullingBlade = ____axe_culling_blade.SPECS
local ____doom_bringer_infernal_blade = require("ai.ability.specs.doom_bringer_infernal_blade")
local doomBringerInfernalBlade = ____doom_bringer_infernal_blade.SPECS
local ____dragon_knight_breathe_fire = require("ai.ability.specs.dragon_knight_breathe_fire")
local dragonKnightBreatheFire = ____dragon_knight_breathe_fire.SPECS
local ____dragon_knight_dragon_tail = require("ai.ability.specs.dragon_knight_dragon_tail")
local dragonKnightDragonTail = ____dragon_knight_dragon_tail.SPECS
local ____dragon_knight_fireball = require("ai.ability.specs.dragon_knight_fireball")
local dragonKnightFireball = ____dragon_knight_fireball.SPECS
local ____drow_ranger_frost_arrows = require("ai.ability.specs.drow_ranger_frost_arrows")
local drowRangerFrostArrows = ____drow_ranger_frost_arrows.SPECS
local ____enchantress_impetus = require("ai.ability.specs.enchantress_impetus")
local enchantressImpetus = ____enchantress_impetus.SPECS
local ____jakiro_dual_breath = require("ai.ability.specs.jakiro_dual_breath")
local jakiroDualBreath = ____jakiro_dual_breath.SPECS
local ____lich_frost_armor = require("ai.ability.specs.lich_frost_armor")
local lichFrostArmor = ____lich_frost_armor.SPECS
local ____lich_frost_nova = require("ai.ability.specs.lich_frost_nova")
local lichFrostNova = ____lich_frost_nova.SPECS
local ____lich_frost_shield = require("ai.ability.specs.lich_frost_shield")
local lichFrostShield = ____lich_frost_shield.SPECS
local ____lion_finger_of_death = require("ai.ability.specs.lion_finger_of_death")
local lionFingerOfDeath = ____lion_finger_of_death.SPECS
local ____lion_impale = require("ai.ability.specs.lion_impale")
local lionImpale = ____lion_impale.SPECS
local ____lion_mana_drain = require("ai.ability.specs.lion_mana_drain")
local lionManaDrain = ____lion_mana_drain.SPECS
local ____lion_voodoo = require("ai.ability.specs.lion_voodoo")
local lionVoodoo = ____lion_voodoo.SPECS
local ____medusa_split_shot = require("ai.ability.specs.medusa_split_shot")
local medusaSplitShot = ____medusa_split_shot.SPECS
local ____omniknight_hammer_of_purity = require("ai.ability.specs.omniknight_hammer_of_purity")
local omniknightHammerOfPurity = ____omniknight_hammer_of_purity.SPECS
local ____omniknight_purification = require("ai.ability.specs.omniknight_purification")
local omniknightPurification = ____omniknight_purification.SPECS
local ____sandking_burrowstrike = require("ai.ability.specs.sandking_burrowstrike")
local sandkingBurrowstrike = ____sandking_burrowstrike.SPECS
local ____sandking_scorpion_strike = require("ai.ability.specs.sandking_scorpion_strike")
local sandkingScorpionStrike = ____sandking_scorpion_strike.SPECS
local ____sandking_sand_storm = require("ai.ability.specs.sandking_sand_storm")
local sandkingSandStorm = ____sandking_sand_storm.SPECS
local ____shadow_shaman_ether_shock = require("ai.ability.specs.shadow_shaman_ether_shock")
local shadowShamanEtherShock = ____shadow_shaman_ether_shock.SPECS
local ____shadow_shaman_mass_serpent_ward = require("ai.ability.specs.shadow_shaman_mass_serpent_ward")
local shadowShamanMassSerpentWard = ____shadow_shaman_mass_serpent_ward.SPECS
local ____shadow_shaman_shackles = require("ai.ability.specs.shadow_shaman_shackles")
local shadowShamanShackles = ____shadow_shaman_shackles.SPECS
local ____shadow_shaman_urnaconda = require("ai.ability.specs.shadow_shaman_urnaconda")
local shadowShamanUrnaconda = ____shadow_shaman_urnaconda.SPECS
local ____shadow_shaman_voodoo = require("ai.ability.specs.shadow_shaman_voodoo")
local shadowShamanVoodoo = ____shadow_shaman_voodoo.SPECS
local ____silencer_glaives_of_wisdom = require("ai.ability.specs.silencer_glaives_of_wisdom")
local silencerGlaivesOfWisdom = ____silencer_glaives_of_wisdom.SPECS
local ____slark_saltwater_shiv = require("ai.ability.specs.slark_saltwater_shiv")
local slarkSaltwaterShiv = ____slark_saltwater_shiv.SPECS
local ____tinker_deploy_turrets = require("ai.ability.specs.tinker_deploy_turrets")
local tinkerDeployTurrets = ____tinker_deploy_turrets.SPECS
local ____tinker_laser = require("ai.ability.specs.tinker_laser")
local tinkerLaser = ____tinker_laser.SPECS
local ____tinker_march_of_the_machines = require("ai.ability.specs.tinker_march_of_the_machines")
local tinkerMarchOfTheMachines = ____tinker_march_of_the_machines.SPECS
local ____tinker_warp_grenade = require("ai.ability.specs.tinker_warp_grenade")
local tinkerWarpGrenade = ____tinker_warp_grenade.SPECS
local ____tusk_walrus_punch = require("ai.ability.specs.tusk_walrus_punch")
local tuskWalrusPunch = ____tusk_walrus_punch.SPECS
local ____viper_poison_attack = require("ai.ability.specs.viper_poison_attack")
local viperPoisonAttack = ____viper_poison_attack.SPECS
local ____winter_wyvern_arctic_burn = require("ai.ability.specs.winter_wyvern_arctic_burn")
local winterWyvernArcticBurn = ____winter_wyvern_arctic_burn.SPECS
function ____exports.registerAbilitySpecs(self)
AbilityRegistry:registerAll(dragonKnightBreatheFire)
AbilityRegistry:registerAll(dragonKnightDragonTail)
AbilityRegistry:registerAll(dragonKnightFireball)
AbilityRegistry:registerAll(omniknightPurification)
AbilityRegistry:registerAll(jakiroDualBreath)
AbilityRegistry:registerAll(lichFrostNova)
AbilityRegistry:registerAll(lichFrostShield)
AbilityRegistry:registerAll(lionVoodoo)
AbilityRegistry:registerAll(lionImpale)
AbilityRegistry:registerAll(lionManaDrain)
AbilityRegistry:registerAll(lionFingerOfDeath)
AbilityRegistry:registerAll(axeBerserkerSCall)
AbilityRegistry:registerAll(axeBattleHunger)
AbilityRegistry:registerAll(axeCullingBlade)
AbilityRegistry:registerAll(sandkingBurrowstrike)
AbilityRegistry:registerAll(sandkingSandStorm)
AbilityRegistry:registerAll(sandkingScorpionStrike)
AbilityRegistry:registerAll(shadowShamanEtherShock)
AbilityRegistry:registerAll(shadowShamanVoodoo)
AbilityRegistry:registerAll(shadowShamanShackles)
AbilityRegistry:registerAll(shadowShamanUrnaconda)
AbilityRegistry:registerAll(shadowShamanMassSerpentWard)
AbilityRegistry:registerAll(tinkerLaser)
AbilityRegistry:registerAll(tinkerMarchOfTheMachines)
AbilityRegistry:registerAll(tinkerWarpGrenade)
AbilityRegistry:registerAll(tinkerDeployTurrets)
AbilityRegistry:registerAll(tuskWalrusPunch)
AbilityRegistry:registerAll(doomBringerInfernalBlade)
AbilityRegistry:registerAll(slarkSaltwaterShiv)
AbilityRegistry:registerAll(omniknightHammerOfPurity)
AbilityRegistry:registerAll(viperPoisonAttack)
AbilityRegistry:registerAll(silencerGlaivesOfWisdom)
AbilityRegistry:registerAll(drowRangerFrostArrows)
AbilityRegistry:registerAll(ancientApparitionChillingTouch)
AbilityRegistry:registerAll(enchantressImpetus)
AbilityRegistry:registerAll(medusaSplitShot)
AbilityRegistry:registerAll(winterWyvernArcticBurn)
AbilityRegistry:registerAll(lichFrostArmor)
end
return ____exports
