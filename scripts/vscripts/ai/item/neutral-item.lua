local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/item/neutral-item.lua"
__TS__SourceMapTraceBack("ai/item/neutral-item.lua", {["8"] = 15,["9"] = 15,["10"] = 15,["12"] = 15,["13"] = 17,["14"] = 18,["15"] = 18,["16"] = 18,["17"] = 18,["18"] = 18,["19"] = 18,["20"] = 18,["21"] = 19,["22"] = 21,["23"] = 21,["24"] = 21,["25"] = 21,["26"] = 21,["27"] = 21,["28"] = 21,["29"] = 23,["30"] = 25,["31"] = 25,["32"] = 25,["33"] = 25,["34"] = 25,["35"] = 25,["36"] = 25,["37"] = 26,["38"] = 28,["39"] = 28,["40"] = 28,["41"] = 28,["42"] = 28,["43"] = 28,["44"] = 28,["45"] = 29,["46"] = 31,["47"] = 31,["48"] = 31,["49"] = 31,["50"] = 31,["51"] = 31,["52"] = 31,["53"] = 32,["54"] = 34,["55"] = 34,["56"] = 34,["57"] = 34,["58"] = 34,["59"] = 34,["60"] = 34,["61"] = 35,["62"] = 37,["63"] = 37,["64"] = 37,["65"] = 37,["66"] = 37,["67"] = 37,["68"] = 37,["70"] = 40,["71"] = 40,["72"] = 40,["73"] = 40,["74"] = 40,["75"] = 40,["76"] = 40,["78"] = 43,["79"] = 43,["80"] = 43,["81"] = 43,["82"] = 44,["83"] = 17,["84"] = 48,["85"] = 50,["86"] = 51,["87"] = 52,["88"] = 52,["89"] = 52,["90"] = 52,["91"] = 52,["92"] = 52,["93"] = 52,["94"] = 52,["95"] = 52,["96"] = 52,["97"] = 52,["98"] = 52,["99"] = 51,["100"] = 66,["101"] = 66,["102"] = 66,["103"] = 66,["104"] = 66,["105"] = 66,["106"] = 50,["107"] = 75,["108"] = 76,["109"] = 76,["110"] = 76,["111"] = 76,["112"] = 76,["113"] = 76,["114"] = 76,["115"] = 76,["116"] = 76,["117"] = 75,["118"] = 87,["119"] = 87,["120"] = 87,["121"] = 87,["122"] = 87,["123"] = 87,["124"] = 87,["125"] = 87,["126"] = 87,["127"] = 87,["128"] = 50,["129"] = 100,["130"] = 101,["131"] = 101,["132"] = 101,["133"] = 101,["134"] = 101,["135"] = 101,["136"] = 101,["137"] = 101,["138"] = 101,["139"] = 100,["140"] = 112,["141"] = 112,["142"] = 112,["143"] = 112,["144"] = 112,["145"] = 112,["146"] = 112,["147"] = 112,["148"] = 112,["149"] = 50,["150"] = 124,["151"] = 125,["152"] = 125,["153"] = 125,["154"] = 125,["155"] = 125,["156"] = 125,["157"] = 125,["158"] = 125,["159"] = 125,["160"] = 125,["161"] = 124,["162"] = 137,["163"] = 137,["164"] = 137,["165"] = 137,["166"] = 137,["167"] = 137,["168"] = 137,["169"] = 137,["170"] = 137,["171"] = 137,["172"] = 50,["173"] = 150,["174"] = 151,["175"] = 151,["176"] = 151,["177"] = 151,["178"] = 151,["179"] = 151,["180"] = 151,["181"] = 151,["182"] = 151,["183"] = 151,["184"] = 150,["185"] = 163,["186"] = 163,["187"] = 163,["188"] = 163,["189"] = 163,["190"] = 163,["191"] = 163,["192"] = 163,["193"] = 50,["194"] = 50,["195"] = 48,["196"] = 178,["197"] = 179,["198"] = 180,["200"] = 182,["201"] = 182,["202"] = 183,["203"] = 184,["205"] = 182,["208"] = 187,["209"] = 178,["210"] = 191,["211"] = 195,["212"] = 195,["213"] = 196,["214"] = 196,["216"] = 198,["217"] = 191,["218"] = 202,["219"] = 206,["220"] = 206,["221"] = 207,["222"] = 207,["224"] = 209,["225"] = 202,["226"] = 213,["227"] = 214,["228"] = 214,["230"] = 216,["231"] = 216,["232"] = 216,["233"] = 216,["234"] = 216,["235"] = 217,["236"] = 219,["237"] = 220,["238"] = 221,["239"] = 222,["242"] = 226,["243"] = 213});
local ____exports = {}
____exports.NeutralItemManager = __TS__Class()
local NeutralItemManager = ____exports.NeutralItemManager
NeutralItemManager.name = "NeutralItemManager"
function NeutralItemManager.prototype.____constructor(self)
end
function NeutralItemManager.GetTierStartTimes(self)
    local baseTimeMin = {
        0,
        6,
        12,
        18,
        24
    }
    local multiplier = GameRules.Option.direGoldXpMultiplier
    local addTimeMin = {
        0,
        0,
        0,
        0,
        0
    }
    if multiplier >= 20 then
        addTimeMin = {
            0,
            0,
            0,
            0,
            0
        }
    elseif multiplier >= 10 then
        addTimeMin = {
            1,
            1,
            1,
            1,
            2
        }
    elseif multiplier >= 8 then
        addTimeMin = {
            2,
            2,
            2,
            3,
            4
        }
    elseif multiplier >= 6 then
        addTimeMin = {
            3,
            3,
            4,
            5,
            6
        }
    elseif multiplier >= 4 then
        addTimeMin = {
            4,
            5,
            6,
            7,
            9
        }
    else
        addTimeMin = {
            6,
            7,
            8,
            9,
            12
        }
    end
    local baseTime = __TS__ArrayMap(
        baseTimeMin,
        function(____, time, index) return time * 60 + addTimeMin[index + 1] * 60 end
    )
    return baseTime
end
function NeutralItemManager.GetDefaultConfig(self)
    return {
        [1] = {items = {
            {name = "item_occult_bracelet", level = 1},
            {name = "item_kobold_cup", level = 1},
            {name = "item_chipped_vest", level = 1},
            {name = "item_polliwog_charm", level = 1},
            {name = "item_dormant_curio", level = 1},
            {name = "item_duelist_gloves", level = 1},
            {name = "item_weighted_dice", level = 1},
            {name = "item_ash_legion_shield", level = 1},
            {name = "item_dagger_of_ristul", level = 1},
            {name = "item_stonefeather_satchel", level = 1},
            {name = "item_possessed_mask", level = 1},
            {name = "item_foragers_kit", level = 1}
        }, enhancements = {
            {name = "item_enhancement_brawny", level = 1},
            {name = "item_enhancement_alert", level = 1},
            {name = "item_enhancement_tough", level = 1},
            {name = "item_enhancement_quickened", level = 1},
            {name = "item_enhancement_mystical", level = 1},
            {name = "item_enhancement_vital", level = 1}
        }},
        [2] = {items = {
            {name = "item_essence_ring", level = 1},
            {name = "item_mana_draught", level = 1},
            {name = "item_poor_mans_shield", level = 1},
            {name = "item_searing_signet", level = 1},
            {name = "item_pogo_stick", level = 1},
            {name = "item_defiant_shell", level = 1},
            {name = "item_crippling_crossbow", level = 1},
            {name = "item_medallion_of_courage", level = 1},
            {name = "item_seeds_of_serenity", level = 1}
        }, enhancements = {
            {name = "item_enhancement_mystical", level = 2},
            {name = "item_enhancement_brawny", level = 2},
            {name = "item_enhancement_alert", level = 2},
            {name = "item_enhancement_tough", level = 2},
            {name = "item_enhancement_quickened", level = 2},
            {name = "item_enhancement_greedy", level = 1},
            {name = "item_enhancement_crude", level = 1},
            {name = "item_enhancement_nimble", level = 1},
            {name = "item_enhancement_keen_eyed", level = 1},
            {name = "item_enhancement_titanic", level = 1}
        }},
        [3] = {items = {
            {name = "item_serrated_shiv", level = 1},
            {name = "item_gunpowder_gauntlets", level = 1},
            {name = "item_jidi_pollen_bag", level = 1},
            {name = "item_psychic_headband", level = 1},
            {name = "item_unrelenting_eye", level = 1},
            {name = "item_cloak_of_flames", level = 1},
            {name = "item_spellslinger", level = 1},
            {name = "item_stormcrafter", level = 1},
            {name = "item_partisans_brand", level = 1}
        }, enhancements = {
            {name = "item_enhancement_mystical", level = 3},
            {name = "item_enhancement_brawny", level = 3},
            {name = "item_enhancement_alert", level = 3},
            {name = "item_enhancement_tough", level = 3},
            {name = "item_enhancement_quickened", level = 3},
            {name = "item_enhancement_greedy", level = 2},
            {name = "item_enhancement_crude", level = 2},
            {name = "item_enhancement_nimble", level = 2},
            {name = "item_enhancement_keen_eyed", level = 2}
        }},
        [4] = {items = {
            {name = "item_crippling_crossbow", level = 1},
            {name = "item_giant_maul", level = 1},
            {name = "item_rattlecage", level = 1},
            {name = "item_idol_of_screeauk", level = 1},
            {name = "item_flayers_bota", level = 1},
            {name = "item_metamorphic_mandible", level = 1},
            {name = "item_dandelion_amulet", level = 1},
            {name = "item_enchanters_bauble", level = 1},
            {name = "item_prophets_pendulum", level = 1},
            {name = "item_conjurers_catalyst", level = 1}
        }, enhancements = {
            {name = "item_enhancement_mystical", level = 4},
            {name = "item_enhancement_brawny", level = 4},
            {name = "item_enhancement_alert", level = 4},
            {name = "item_enhancement_tough", level = 4},
            {name = "item_enhancement_quickened", level = 4},
            {name = "item_enhancement_timeless", level = 1},
            {name = "item_enhancement_crude", level = 3},
            {name = "item_enhancement_nimble", level = 3},
            {name = "item_enhancement_keen_eyed", level = 3},
            {name = "item_enhancement_titanic", level = 3}
        }},
        [5] = {items = {
            {name = "item_desolator_2", level = 1},
            {name = "item_fallen_sky", level = 1},
            {name = "item_demonicon", level = 1},
            {name = "item_minotaur_horn", level = 1},
            {name = "item_spider_legs", level = 1},
            {name = "item_riftshadow_prism", level = 1},
            {name = "item_dezun_bloodrite", level = 1},
            {name = "item_divine_regalia", level = 1},
            {name = "item_harmonizer", level = 1},
            {name = "item_heavy_blade", level = 1}
        }, enhancements = {
            {name = "item_enhancement_timeless", level = 2},
            {name = "item_enhancement_evolved", level = 1},
            {name = "item_enhancement_fleetfooted", level = 1},
            {name = "item_enhancement_vampiric", level = 1},
            {name = "item_enhancement_hulking", level = 1},
            {name = "item_enhancement_audacious", level = 1},
            {name = "item_enhancement_feverish", level = 1},
            {name = "item_enhancement_manic", level = 1}
        }}
    }
end
function NeutralItemManager.GetTargetTier(self)
    local gameTime = GameRules:GetDOTATime(false, false)
    local startTimes = self:GetTierStartTimes()
    do
        local i = #startTimes - 1
        while i >= 0 do
            if gameTime > startTimes[i + 1] then
                return i + 1
            end
            i = i - 1
        end
    end
    return 0
end
function NeutralItemManager.GetRandomTierItem(self, tier, neutralItemConfig)
    local ____opt_0 = neutralItemConfig[tier]
    local items = ____opt_0 and ____opt_0.items or ({})
    if #items == 0 then
        return nil
    end
    return self:SelectRandomItem(items)
end
function NeutralItemManager.GetRandomTierEnhancements(self, tier, neutralItemConfig)
    local ____opt_2 = neutralItemConfig[tier]
    local enhancements = ____opt_2 and ____opt_2.enhancements or ({})
    if #enhancements == 0 then
        return nil
    end
    return self:SelectRandomItem(enhancements)
end
function NeutralItemManager.SelectRandomItem(self, items)
    if #items == 0 then
        return nil
    end
    local totalWeight = __TS__ArrayReduce(
        items,
        function(____, sum, item) return sum + (item.weight or 1) end,
        0
    )
    local random = RandomFloat(0, totalWeight)
    for ____, item in ipairs(items) do
        random = random - (item.weight or 1)
        if random <= 0 then
            return item
        end
    end
    return items[1]
end
return ____exports
