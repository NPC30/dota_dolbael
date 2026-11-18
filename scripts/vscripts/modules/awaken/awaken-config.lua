local ____exports = {}
____exports.ABILITY_REPLACEMENTS = {
{heroName = "npc_dota_hero_pudge", targetAbility = "pudge_meat_hook", newAbility = "pudge_meat_hook_lua", newLevel = 0},
{heroName = "npc_dota_hero_juggernaut", targetAbility = "juggernaut_blade_fury", newAbility = "juggernaut_blade_fury_custom", newLevel = 0},
{heroName = "npc_dota_hero_slark", newAbility = "break_speed_limit", newLevel = 0},
{heroName = "npc_dota_hero_sniper", targetAbility = "sniper_assassinate", newAbility = "sniper_assassinate_upgrade", newLevel = 0},
{
heroName = "npc_dota_hero_axe",
targetSlot = 3,
newAbility = "axe_auto_culling_blade",
newLevel = 0,
inheritLevelFrom = "axe_culling_blade"
},
{heroName = "npc_dota_hero_necrolyte", targetAbility = "necrolyte_heartstopper_aura", newAbility = "necrolyte_heartstopper_aura_datadriven", newLevel = 0},
{
heroName = "npc_dota_hero_enchantress",
targetSlot = 4,
newAbility = "special_bonus_unique_enchantress_upgrade",
newLevel = 0,
inheritLevelFrom = "enchantress_impetus"
},
{heroName = "npc_dota_hero_zuus", newAbility = "special_bonus_unique_zuus_upgrade", newLevel = 1},
{heroName = "npc_dota_hero_phantom_assassin", targetAbility = "phantom_assassin_phantom_strike", newAbility = "special_bonus_unique_phantom_assassin_upgrade", newLevel = 0},
{heroName = "npc_dota_hero_witch_doctor", newAbility = "special_bonus_unique_witch_doctor_upgrade", newLevel = 1},
{heroName = "npc_dota_hero_nevermore", newAbility = "special_bonus_unique_nevermore_upgrade", newLevel = 1}
}
return ____exports
