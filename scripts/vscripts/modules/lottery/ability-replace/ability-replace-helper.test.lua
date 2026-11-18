local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/ability-replace/ability-replace-helper.test.lua"
__TS__SourceMapTraceBack("modules/lottery/ability-replace/ability-replace-helper.test.lua", {["6"] = 1,["7"] = 2,["8"] = 7,["9"] = 8,["10"] = 9,["11"] = 10,["12"] = 11,["13"] = 12,["14"] = 13,["15"] = 8,["16"] = 7,["17"] = 18,["18"] = 18,["19"] = 18,["20"] = 18,["21"] = 19,["22"] = 19,["23"] = 19,["24"] = 19,["25"] = 20,["26"] = 20,["27"] = 20,["28"] = 20,["29"] = 20,["30"] = 20,["31"] = 20,["32"] = 20,["33"] = 20,["34"] = 20,["35"] = 20,["36"] = 20,["37"] = 20,["38"] = 20,["39"] = 20,["40"] = 36,["41"] = 19,["42"] = 19,["43"] = 51,["44"] = 51,["45"] = 51,["46"] = 51,["47"] = 52,["48"] = 52,["49"] = 52,["50"] = 52,["51"] = 53,["52"] = 53,["53"] = 53,["54"] = 53,["55"] = 54,["56"] = 54,["57"] = 54,["58"] = 54,["59"] = 51,["60"] = 51,["61"] = 57,["62"] = 57,["63"] = 57,["64"] = 57,["65"] = 58,["66"] = 58,["67"] = 58,["68"] = 58,["69"] = 58,["70"] = 58,["71"] = 58,["72"] = 58,["73"] = 58,["74"] = 58,["75"] = 58,["76"] = 58,["77"] = 58,["78"] = 72,["79"] = 78,["80"] = 79,["81"] = 80,["82"] = 81,["83"] = 57,["84"] = 57,["85"] = 84,["86"] = 84,["87"] = 84,["88"] = 84,["89"] = 85,["90"] = 85,["91"] = 85,["92"] = 85,["93"] = 92,["94"] = 93,["95"] = 95,["96"] = 96,["97"] = 97,["98"] = 84,["99"] = 84,["100"] = 18,["101"] = 18});
local ____exports = {}
local ____ability_2Dreplace_2Dhelper = require("modules.lottery.ability-replace.ability-replace-helper")
local AbilityReplaceHelper = ____ability_2Dreplace_2Dhelper.AbilityReplaceHelper
local function ability(self, overrides)
    return __TS__ObjectAssign({
        name = "test_ability",
        level = 1,
        behavior = 0,
        isHidden = false,
        isItem = false
    }, overrides)
end
describe(
    nil,
    "AbilityReplaceHelper",
    function()
        test(
            nil,
            "filters hidden abilities, innate abilities, and normal talents but keeps upgrade talents",
            function()
                local removable = AbilityReplaceHelper:getRemovableAbilities({
                    ability(nil, {name = "visible_active", behavior = 0, level = 2}),
                    ability(nil, {name = "hidden_active", isHidden = true}),
                    ability(nil, {name = "item_active", isItem = true}),
                    ability(nil, {name = "bounty_hunter_jinada", behavior = 2, level = 1}),
                    ability(nil, {name = "weaver_geminate_attack", behavior = 2, level = 1}),
                    ability(nil, {name = "runtime_innate_ability", behavior = 2, level = 1, isInnate = true}),
                    ability(nil, {name = "lion_to_hell_and_back", behavior = 4398046511106, level = 1}),
                    ability(nil, {name = "not_learnable_innate", behavior = 66, level = 1}),
                    ability(nil, {name = "dragon_knight_dragon_blood", behavior = 2, level = 1}),
                    ability(nil, {name = "pudge_innate_graft_flesh2", behavior = 2, level = 1}),
                    ability(nil, {name = "special_bonus_strength_10"}),
                    ability(nil, {name = "special_bonus_unique_grimstroke_upgrade", behavior = 2, level = 1}),
                    ability(nil, {name = "generic_hidden"})
                })
                expect(nil, removable):toEqual({{name = "visible_active", level = 2, type = "abilityActive"}, {name = "weaver_geminate_attack", level = 1, type = "abilityPassive"}, {name = "special_bonus_unique_grimstroke_upgrade", level = 1, type = "abilityPassive"}})
            end
        )
        test(
            nil,
            "maps passive behavior to passive replacement pool",
            function()
                expect(
                    nil,
                    AbilityReplaceHelper:getAbilityItemType(2)
                ):toBe("abilityPassive")
                expect(
                    nil,
                    AbilityReplaceHelper:getAbilityItemType(0)
                ):toBe("abilityActive")
                expect(
                    nil,
                    AbilityReplaceHelper:getAbilityItemType("2")
                ):toBe("abilityPassive")
            end
        )
        test(
            nil,
            "updates first matching lottery status slot",
            function()
                local status = {
                    activeAbilityName = "old_active",
                    activeAbilityLevel = 2,
                    isActiveAbilityRefreshed = false,
                    passiveAbilityName = "old_passive",
                    passiveAbilityLevel = 3,
                    isPassiveAbilityRefreshed = false,
                    passiveAbilityName2 = "old_passive_2",
                    passiveAbilityLevel2 = 4,
                    isPassiveAbilityRefreshed2 = false,
                    abilityResettableCount = 0,
                    showAbilityResetButton = false
                }
                local updated = AbilityReplaceHelper:replaceLotteryStatusAbility(status, "old_passive", {name = "new_passive", level = 5})
                expect(nil, updated):toBe(true)
                expect(nil, status.passiveAbilityName):toBe("new_passive")
                expect(nil, status.passiveAbilityLevel):toBe(5)
                expect(nil, status.activeAbilityName):toBe("old_active")
            end
        )
        test(
            nil,
            "cleans up stale intrinsic modifiers for safely removable abilities",
            function()
                local hero = {
                    HasModifier = jest:fn():mockImplementation(function(____, modifierName) return modifierName == "modifier_tusk_walrus_punch" end),
                    RemoveModifierByName = jest:fn()
                }
                AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, "tusk_walrus_punch")
                AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, "bounty_hunter_jinada")
                expect(nil, hero.HasModifier):toHaveBeenCalledWith("modifier_tusk_walrus_punch")
                expect(nil, hero.RemoveModifierByName):toHaveBeenCalledWith("modifier_tusk_walrus_punch")
                expect(nil, hero.RemoveModifierByName):toHaveBeenCalledTimes(1)
            end
        )
    end
)
return ____exports
