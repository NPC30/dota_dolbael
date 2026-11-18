local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/item/lottery-items.lua"
__TS__SourceMapTraceBack("modules/lottery/item/lottery-items.lua", {["7"] = 7,["8"] = 87,["9"] = 89,["10"] = 89,["11"] = 89,["12"] = 89,["13"] = 89,["14"] = 7,["15"] = 98,["16"] = 100,["17"] = 100,["18"] = 100,["19"] = 100,["20"] = 100,["21"] = 100,["22"] = 100,["23"] = 100,["24"] = 100,["25"] = 100,["26"] = 100,["27"] = 7,["28"] = 115,["29"] = 117,["30"] = 117,["31"] = 117,["32"] = 117,["33"] = 117,["34"] = 117,["35"] = 117,["36"] = 117,["37"] = 117,["38"] = 117,["39"] = 117,["40"] = 117,["41"] = 117,["42"] = 117,["43"] = 117,["44"] = 117,["45"] = 117,["46"] = 117,["47"] = 117,["48"] = 7,["49"] = 141,["50"] = 143,["51"] = 143,["52"] = 143,["53"] = 143,["54"] = 143,["55"] = 143,["56"] = 143,["57"] = 143,["58"] = 143,["59"] = 143,["60"] = 143,["61"] = 143,["62"] = 143,["63"] = 143,["64"] = 143,["65"] = 7,["66"] = 162,["67"] = 164,["68"] = 164,["69"] = 164,["70"] = 164,["71"] = 164,["72"] = 164,["73"] = 164,["74"] = 164,["75"] = 164,["76"] = 164,["77"] = 164,["78"] = 164,["79"] = 7,["80"] = 7});
local ____exports = {}
--- 物品抽奖池，Tier 5-1。配合 ITEM_TIER_RATES [1,5,20,60,100] 累计阈值使用。
-- 单格出现概率：T5 1% / T4 4% / T3 15% / T2 40% / T1 40%
____exports.itemTiers = {
    {level = 5, names = {
        "item_universal_rune",
        "item_tome_of_luoshu",
        "item_tome_of_ability_replace",
        "item_treasure_perm_base_attack_pct_50",
        "item_treasure_cooldown"
    }},
    {level = 4, names = {
        "item_tome_of_ability_reset",
        "item_treasure_wall",
        "item_tome_of_agility",
        "item_tome_of_intelligence",
        "item_tome_of_strength",
        "item_treasure_mie_large",
        "item_treasure_fu",
        "item_treasure_tianshen",
        "item_treasure_ju",
        "item_treasure_burst",
        "item_treasure_perm_base_attack_pct_20"
    }},
    {level = 3, names = {
        "item_consumable_gem",
        "item_ultimate_scepter_2",
        "item_candy_candy",
        "item_wings_of_haste",
        "item_random_rune",
        "item_treasure_mie_medium",
        "item_scroll_guardian_angel",
        "item_treasure_speed",
        "item_treasure_invis",
        "item_treasure_bash",
        "item_rune_transmuter_advanced",
        "item_treasure_perm_strength_50",
        "item_treasure_perm_agility_50",
        "item_treasure_perm_intellect_50",
        "item_treasure_perm_health_5000",
        "item_treasure_perm_armor_50",
        "item_treasure_perm_movespeed_100",
        "item_treasure_perm_damage_500",
        "item_treasure_gold_bag_4000"
    }},
    {level = 2, names = {
        "item_collector",
        "item_tome_of_knowledge",
        "item_aghanims_shard",
        "item_treasure_perm_base_attack_pct_10",
        "item_treasure_perm_strength_20",
        "item_treasure_perm_agility_20",
        "item_treasure_perm_intellect_20",
        "item_treasure_perm_health_2000",
        "item_treasure_perm_damage_200",
        "item_treasure_perm_armor_20",
        "item_treasure_perm_movespeed_60",
        "item_treasure_gold_bag_2000",
        "item_great_famango",
        "item_treasure_mie_small",
        "item_rune_transmuter_random"
    }},
    {level = 1, names = {
        "item_great_famango",
        "item_treasure_gold_bag_1000",
        "item_treasure_perm_strength_10",
        "item_treasure_perm_agility_10",
        "item_treasure_perm_intellect_10",
        "item_treasure_perm_health_1000",
        "item_treasure_perm_damage_100",
        "item_treasure_perm_armor_10",
        "item_treasure_perm_movespeed_30",
        "item_foragers_stats",
        "item_foragers_mana",
        "item_foragers_health"
    }}
}
return ____exports
