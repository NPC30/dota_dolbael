local ____lualib = require("lualib_bundle")
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__Number = ____lualib.__TS__Number
local __TS__NumberIsFinite = ____lualib.__TS__NumberIsFinite
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/ability-replace/ability-replace-helper.lua"
__TS__SourceMapTraceBack("modules/lottery/ability-replace/ability-replace-helper.lua", {["13"] = 8,["14"] = 9,["15"] = 10,["16"] = 11,["17"] = 11,["18"] = 11,["19"] = 11,["20"] = 11,["21"] = 11,["22"] = 11,["23"] = 11,["24"] = 11,["25"] = 11,["26"] = 11,["27"] = 11,["28"] = 11,["29"] = 24,["30"] = 25,["31"] = 25,["32"] = 25,["33"] = 25,["34"] = 25,["35"] = 25,["36"] = 25,["37"] = 25,["38"] = 43,["39"] = 43,["40"] = 43,["42"] = 43,["43"] = 46,["44"] = 47,["45"] = 46,["46"] = 50,["47"] = 51,["48"] = 52,["52"] = 59,["55"] = 56,["56"] = 57,["62"] = 55,["65"] = 50,["66"] = 63,["67"] = 64,["68"] = 63,["69"] = 69,["70"] = 70,["71"] = 71,["73"] = 74,["74"] = 74,["75"] = 74,["77"] = 74,["78"] = 75,["79"] = 69,["80"] = 78,["81"] = 79,["82"] = 80,["83"] = 78,["84"] = 83,["85"] = 84,["86"] = 83,["87"] = 87,["88"] = 88,["89"] = 89,["90"] = 87,["91"] = 95,["92"] = 96,["93"] = 97,["95"] = 99,["96"] = 100,["98"] = 102,["99"] = 103,["100"] = 104,["101"] = 105,["102"] = 106,["104"] = 108,["105"] = 95,["106"] = 111,["107"] = 112,["108"] = 112,["110"] = 113,["111"] = 113,["113"] = 114,["114"] = 114,["116"] = 115,["117"] = 115,["119"] = 116,["120"] = 116,["122"] = 117,["123"] = 117,["125"] = 118,["126"] = 118,["128"] = 119,["129"] = 111,["130"] = 122,["131"] = 123,["132"] = 124,["135"] = 126,["136"] = 127,["137"] = 128,["140"] = 122,["141"] = 133,["142"] = 136,["143"] = 136,["144"] = 136,["145"] = 136,["146"] = 136,["147"] = 138,["148"] = 138,["149"] = 138,["150"] = 138,["151"] = 136,["152"] = 136,["153"] = 133,["154"] = 145,["155"] = 150,["156"] = 151,["157"] = 152,["158"] = 153,["160"] = 156,["161"] = 157,["162"] = 158,["163"] = 159,["165"] = 162,["166"] = 163,["167"] = 164,["168"] = 165,["170"] = 168,["171"] = 145,["172"] = 44});
local ____exports = {}
local PASSIVE_BEHAVIOR_FLAG = 2
local INNATE_BEHAVIOR_THRESHOLD = 4398046511104
local NOT_LEARNABLE_BEHAVIOR_FLAG = 64
local INNATE_ABILITY_NAMES = __TS__New(Set, {
    "dragon_knight_dragon_blood",
    "jakiro_double_trouble2",
    "leshrac_defilement2",
    "tinker_eureka2",
    "pudge_innate_graft_flesh2",
    "silencer_brain_drain2",
    "razor_dynamo2",
    "tiny_insurmountable2",
    "death_prophet_witchcraft2",
    "ursa_maul2",
    "axe_one_man_army2"
})
local NON_REMOVABLE_ABILITY_NAMES = __TS__New(Set, {"bounty_hunter_jinada"})
local REMOVED_ABILITY_MODIFIER_CLEANUP = {
    dark_seer_normal_punch2 = {"modifier_dark_seer_normal_punch2"},
    medusa_split_shot = {"modifier_medusa_split_shot"},
    muerta_gunslinger = {"modifier_muerta_gunslinger"},
    dark_seer_normal_punch3 = {"modifier_dark_seer_normal_punch3"},
    weaver_geminate_attack = {"modifier_weaver_geminate_attack"},
    tusk_walrus_punch = {"modifier_tusk_walrus_punch"}
}
____exports.AbilityReplaceHelper = __TS__Class()
local AbilityReplaceHelper = ____exports.AbilityReplaceHelper
AbilityReplaceHelper.name = "AbilityReplaceHelper"
function AbilityReplaceHelper.prototype.____constructor(self)
end
function AbilityReplaceHelper.AddInnateAbilityNameForTest(self, abilityName)
    self.innateAbilityNames:add(abilityName)
end
function AbilityReplaceHelper.GetInnateKVValue(self, abilityName)
    if type(GetAbilityKeyValuesByName) ~= "function" then
        return nil
    end
    do
        local function ____catch(_error)
            return true, nil
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            local kv = GetAbilityKeyValuesByName(nil, abilityName)
            return true, kv and kv.Innate
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function AbilityReplaceHelper.IsInnateKVValue(self, innateValue)
    return innateValue == 1 or innateValue == "1" or innateValue == true or innateValue == "true"
end
function AbilityReplaceHelper.normalizeBehavior(self, behavior)
    if type(behavior) == "number" then
        return behavior
    end
    local ____behavior_2 = behavior
    if ____behavior_2 == nil then
        ____behavior_2 = "0"
    end
    local normalizedBehavior = __TS__Number(tostring(____behavior_2))
    return __TS__NumberIsFinite(normalizedBehavior) and normalizedBehavior or 0
end
function AbilityReplaceHelper.getAbilityItemType(self, behavior)
    local normalizedBehavior = self:normalizeBehavior(behavior)
    return bit.band(normalizedBehavior, PASSIVE_BEHAVIOR_FLAG) ~= 0 and "abilityPassive" or "abilityActive"
end
function AbilityReplaceHelper.isNormalTalent(self, abilityName)
    return (string.find(abilityName, "special_bonus", nil, true) or 0) - 1 == 0 and not __TS__StringEndsWith(abilityName, "upgrade")
end
function AbilityReplaceHelper.isInnateBehavior(self, behavior)
    local normalizedBehavior = self:normalizeBehavior(behavior)
    return normalizedBehavior > INNATE_BEHAVIOR_THRESHOLD or bit.band(normalizedBehavior, NOT_LEARNABLE_BEHAVIOR_FLAG) ~= 0
end
function AbilityReplaceHelper.isInnateAbilityName(self, abilityName)
    if (string.find(abilityName, "_innate_", nil, true) or 0) - 1 >= 0 then
        return true
    end
    if self.innateAbilityNames:has(abilityName) then
        return true
    end
    local innateValue = self:GetInnateKVValue(abilityName)
    local isInnate = self:IsInnateKVValue(innateValue)
    if isInnate then
        self.innateAbilityNames:add(abilityName)
        return true
    end
    return false
end
function AbilityReplaceHelper.isEligibleAbility(self, ability)
    if ability.isHidden or ability.isItem then
        return false
    end
    if ability.name == "generic_hidden" then
        return false
    end
    if NON_REMOVABLE_ABILITY_NAMES:has(ability.name) then
        return false
    end
    if ability.isInnate == true then
        return false
    end
    if self:isInnateBehavior(ability.behavior) then
        return false
    end
    if self:isInnateAbilityName(ability.name) then
        return false
    end
    if self:isNormalTalent(ability.name) then
        return false
    end
    return true
end
function AbilityReplaceHelper.cleanupRemovedAbilityModifiers(self, hero, abilityName)
    local modifierNames = REMOVED_ABILITY_MODIFIER_CLEANUP[abilityName]
    if not modifierNames then
        return
    end
    for ____, modifierName in ipairs(modifierNames) do
        if hero:HasModifier(modifierName) then
            hero:RemoveModifierByName(modifierName)
        end
    end
end
function AbilityReplaceHelper.getRemovableAbilities(self, abilities)
    return __TS__ArrayMap(
        __TS__ArrayFilter(
            abilities,
            function(____, ability) return self:isEligibleAbility(ability) end
        ),
        function(____, ability) return {
            name = ability.name,
            level = ability.level,
            type = self:getAbilityItemType(ability.behavior)
        } end
    )
end
function AbilityReplaceHelper.replaceLotteryStatusAbility(self, lotteryStatus, oldAbilityName, newAbility)
    if lotteryStatus.activeAbilityName == oldAbilityName then
        lotteryStatus.activeAbilityName = newAbility.name
        lotteryStatus.activeAbilityLevel = newAbility.level
        return true
    end
    if lotteryStatus.passiveAbilityName == oldAbilityName then
        lotteryStatus.passiveAbilityName = newAbility.name
        lotteryStatus.passiveAbilityLevel = newAbility.level
        return true
    end
    if lotteryStatus.passiveAbilityName2 == oldAbilityName then
        lotteryStatus.passiveAbilityName2 = newAbility.name
        lotteryStatus.passiveAbilityLevel2 = newAbility.level
        return true
    end
    return false
end
AbilityReplaceHelper.innateAbilityNames = __TS__New(Set, INNATE_ABILITY_NAMES)
return ____exports
