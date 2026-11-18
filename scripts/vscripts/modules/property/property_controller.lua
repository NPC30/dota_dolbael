local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/property/property_controller.lua"
__TS__SourceMapTraceBack("modules/property/property_controller.lua", {["12"] = 2,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 8,["19"] = 9,["20"] = 10,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["25"] = 15,["26"] = 16,["27"] = 17,["28"] = 18,["29"] = 19,["30"] = 20,["31"] = 21,["32"] = 22,["33"] = 23,["34"] = 24,["35"] = 25,["36"] = 26,["37"] = 27,["38"] = 28,["39"] = 29,["40"] = 30,["41"] = 31,["42"] = 33,["43"] = 33,["44"] = 34,["45"] = 34,["46"] = 35,["47"] = 35,["48"] = 37,["49"] = 38,["50"] = 37,["52"] = 65,["53"] = 67,["54"] = 68,["55"] = 69,["56"] = 70,["57"] = 71,["58"] = 72,["59"] = 76,["60"] = 77,["61"] = 78,["62"] = 79,["63"] = 80,["64"] = 81,["65"] = 82,["66"] = 86,["67"] = 90,["68"] = 94,["69"] = 101,["70"] = 105,["71"] = 109,["72"] = 113,["73"] = 117,["74"] = 121,["75"] = 125,["76"] = 129,["77"] = 133,["78"] = 137,["79"] = 141,["80"] = 145,["81"] = 149,["82"] = 64,["83"] = 183,["84"] = 184,["85"] = 185,["88"] = 190,["89"] = 191,["91"] = 195,["92"] = 196,["93"] = 197,["94"] = 198,["97"] = 183,["98"] = 204,["99"] = 208,["101"] = 209,["102"] = 209,["103"] = 210,["104"] = 209,["108"] = 213,["110"] = 204,["111"] = 218,["112"] = 219,["113"] = 220,["116"] = 223,["117"] = 218,["118"] = 227,["119"] = 228,["120"] = 229,["121"] = 230,["123"] = 232,["124"] = 227,["125"] = 236,["126"] = 239,["127"] = 239,["129"] = 242,["130"] = 244,["133"] = 249,["136"] = 255,["137"] = 256,["138"] = 259,["139"] = 260,["142"] = 265,["145"] = 272,["146"] = 273,["147"] = 274,["148"] = 275,["149"] = 276,["152"] = 279,["153"] = 280,["156"] = 284,["157"] = 287,["159"] = 293,["160"] = 296,["161"] = 297,["164"] = 236,["165"] = 306,["166"] = 311,["167"] = 312,["168"] = 313,["169"] = 314,["170"] = 315,["173"] = 318,["174"] = 319,["175"] = 320,["176"] = 306,["177"] = 323,["178"] = 328,["179"] = 329,["180"] = 331,["181"] = 332,["182"] = 333,["185"] = 336,["187"] = 338,["188"] = 339,["192"] = 344,["193"] = 345,["195"] = 351,["196"] = 323,["197"] = 44,["198"] = 50,["199"] = 53,["200"] = 56,["201"] = 58,["202"] = 59,["203"] = 60,["204"] = 158,["205"] = 158,["206"] = 158,["207"] = 158,["208"] = 158,["209"] = 158,["210"] = 158,["211"] = 158,["212"] = 158,["213"] = 158,["214"] = 158,["215"] = 158,["216"] = 158,["217"] = 158,["218"] = 158,["219"] = 158,["220"] = 158,["221"] = 158,["222"] = 158,["223"] = 158,["224"] = 158,["225"] = 158,["226"] = 158,["227"] = 37,["228"] = 38});
local ____exports = {}
local ____property_declare = require("modifiers.property.property_declare")
local property_agility_bonus_pct = ____property_declare.property_agility_bonus_pct
local property_attack_range_bonus = ____property_declare.property_attack_range_bonus
local property_attackspeed_bonus_constant = ____property_declare.property_attackspeed_bonus_constant
local property_attack_damage_pct = ____property_declare.property_attack_damage_pct
local property_bonus_vision = ____property_declare.property_bonus_vision
local property_cannot_miss = ____property_declare.property_cannot_miss
local property_cast_range_bonus_stacking = ____property_declare.property_cast_range_bonus_stacking
local property_can_use_backpack_items = ____property_declare.property_can_use_backpack_items
local property_cooldown_percentage = ____property_declare.property_cooldown_percentage
local property_evasion_constant = ____property_declare.property_evasion_constant
local property_flying = ____property_declare.property_flying
local property_health_regen_percentage = ____property_declare.property_health_regen_percentage
local property_ignore_movespeed_limit = ____property_declare.property_ignore_movespeed_limit
local property_incoming_damage_percentage = ____property_declare.property_incoming_damage_percentage
local property_lifesteal = ____property_declare.property_lifesteal
local property_magical_resistance_bonus = ____property_declare.property_magical_resistance_bonus
local property_mana_regen_total_percentage = ____property_declare.property_mana_regen_total_percentage
local property_movespeed_bonus_constant = ____property_declare.property_movespeed_bonus_constant
local property_physical_armor_bonus = ____property_declare.property_physical_armor_bonus
local property_preattack_bonus_damage = ____property_declare.property_preattack_bonus_damage
local property_pure_damage_reduction = ____property_declare.property_pure_damage_reduction
local property_spell_amplify_percentage = ____property_declare.property_spell_amplify_percentage
local property_spell_lifesteal = ____property_declare.property_spell_lifesteal
local property_intellect_bonus_pct = ____property_declare.property_intellect_bonus_pct
local property_stats_agility_bonus = ____property_declare.property_stats_agility_bonus
local property_stats_intellect_bonus = ____property_declare.property_stats_intellect_bonus
local property_stats_strength_bonus = ____property_declare.property_stats_strength_bonus
local property_strength_bonus_pct = ____property_declare.property_strength_bonus_pct
local property_status_resistance_stacking = ____property_declare.property_status_resistance_stacking
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____property_2Dvalues = require("modules.property.property-values")
local PLAYER_PROPERTY_VALUE_PER_LEVEL = ____property_2Dvalues.PLAYER_PROPERTY_VALUE_PER_LEVEL
____exports.PropertyController = __TS__Class()
local PropertyController = ____exports.PropertyController
PropertyController.name = "PropertyController"
function PropertyController.prototype.____constructor(self)
    print("PropertyController init")
    ____exports.PropertyController.propertyLuaModiferMap:set(property_cast_range_bonus_stacking.name, 25)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_spell_amplify_percentage.name, 5)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_status_resistance_stacking.name, 4)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_incoming_damage_percentage.name, -4)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_attack_range_bonus.name, 25)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_attack_damage_pct.name, PLAYER_PROPERTY_VALUE_PER_LEVEL.property_attack_damage_pct)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_lifesteal.name, 10)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_spell_lifesteal.name, 8)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_health_regen_percentage.name, 0.3)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_mana_regen_total_percentage.name, 0.3)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_ignore_movespeed_limit.name, 0.125)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_can_use_backpack_items.name, 1)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_strength_bonus_pct.name, PLAYER_PROPERTY_VALUE_PER_LEVEL.property_strength_bonus_pct)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_agility_bonus_pct.name, PLAYER_PROPERTY_VALUE_PER_LEVEL.property_agility_bonus_pct)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_intellect_bonus_pct.name, PLAYER_PROPERTY_VALUE_PER_LEVEL.property_intellect_bonus_pct)
    ____exports.PropertyController.propertyLuaModiferMap:set(property_pure_damage_reduction.name, PLAYER_PROPERTY_VALUE_PER_LEVEL.property_pure_damage_reduction)
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_cooldown_percentage.name, "modifier_player_property_cooldown_percentage_level_")
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_movespeed_bonus_constant.name, "modifier_player_property_movespeed_bonus_constant_level_")
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_bonus_vision.name, "modifier_player_property_bonus_vision_level_")
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_evasion_constant.name, "modifier_player_property_evasion_constant_level_")
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_magical_resistance_bonus.name, "modifier_player_property_magical_resistance_bonus_level_")
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_physical_armor_bonus.name, "modifier_player_property_physical_armor_bonus_level_")
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_preattack_bonus_damage.name, "modifier_player_property_preattack_bonus_damage_level_")
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_attackspeed_bonus_constant.name, "modifier_player_property_attackspeed_bonus_constant_level_")
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_stats_strength_bonus.name, "modifier_player_property_stats_strength_bonus_level_")
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_stats_agility_bonus.name, "modifier_player_property_stats_agility_bonus_level_")
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_stats_intellect_bonus.name, "modifier_player_property_stats_intellect_bonus_level_")
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_cannot_miss.name, "modifier_player_property_cannot_miss")
    ____exports.PropertyController.propertyDataDrivenModifierMap:set(property_flying.name, "modifier_player_property_flying")
end
function PropertyController.RemoveAllPlayerProperty(self, steamAccountId)
    local hero = PlayerHelper:FindHeroBySteeamAccountId(steamAccountId)
    if not hero then
        return
    end
    for ____, key in __TS__Iterator(____exports.PropertyController.propertyLuaModiferMap:keys()) do
        hero:RemoveModifierByName(key)
    end
    for ____, key in __TS__Iterator(____exports.PropertyController.propertyDataDrivenModifierMap:keys()) do
        local value = ____exports.PropertyController.propertyDataDrivenModifierMap:get(key)
        if value then
            ____exports.PropertyController:RemoveDataDrivenPlayerPropertyModifiers(hero, value)
        end
    end
end
function PropertyController.RemoveDataDrivenPlayerPropertyModifiers(self, hero, registeredModifierName)
    if __TS__StringEndsWith(registeredModifierName, "_level_") then
        do
            local i = 1
            while i <= ____exports.PropertyController.MULTI_DATA_DRIVEN_PROPERTY_MAX_LEVEL do
                hero:RemoveModifierByName(registeredModifierName .. tostring(i))
                i = i + 1
            end
        end
    else
        hero:RemoveModifierByName(registeredModifierName)
    end
end
function PropertyController.LevelupPlayerProperty(self, property)
    local hero = PlayerHelper:FindHeroBySteeamAccountId(property.steamId)
    if not hero then
        return
    end
    ____exports.PropertyController:LevelupHeroProperty(hero, property)
end
function PropertyController.GetPropertyActiveLevel(self, hero, property)
    if __TS__ArrayIncludes(____exports.PropertyController.limitPropertyNames, property.name) then
        local activeLevelMax = math.floor(hero:GetLevel() / ____exports.PropertyController.HERO_LEVEL_PER_POINT)
        return math.min(property.level, activeLevelMax)
    end
    return property.level
end
function PropertyController.LevelupHeroProperty(self, hero, property, forceEnable)
    if forceEnable == nil then
        forceEnable = false
    end
    local isMoveSpeedProperty = property.name == "property_movespeed_bonus_constant"
    if not forceEnable and not GameRules.Option.enablePlayerAttribute and not isMoveSpeedProperty then
        return
    end
    if hero:HasModifier("modifier_mind_control") and not isMoveSpeedProperty then
        return
    end
    local name = property.name
    local activeLevel = ____exports.PropertyController:GetPropertyActiveLevel(hero, property)
    if name == "property_skill_points_bonus" then
        ____exports.PropertyController:SetBonusSkillPoints(hero, property, activeLevel)
        return
    end
    if not hero:IsAlive() then
        return
    end
    local propertyValuePerLevel = ____exports.PropertyController.propertyLuaModiferMap:get(property.name)
    if propertyValuePerLevel then
        hero:RemoveModifierByName(property.name)
        local minLevel = ____exports.PropertyController.luaPropertyMinLevelMap:get(property.name) or 1
        if activeLevel < minLevel then
            return
        end
        local value = propertyValuePerLevel * activeLevel
        if value == 0 then
            return
        end
        local addedModifier = hero:AddNewModifier(hero, nil, property.name, {value = value})
        print((((("[PropertyController] UpgradeHeroProperty " .. property.name) .. " ") .. (addedModifier and addedModifier:GetName() or "nil")) .. " ") .. tostring(value))
    else
        local dataDrivenModifierName = ____exports.PropertyController.propertyDataDrivenModifierMap:get(property.name)
        if dataDrivenModifierName then
            ____exports.PropertyController:RefreshDataDrivenPlayerProperty(hero, dataDrivenModifierName, activeLevel)
        end
    end
end
function PropertyController.SetBonusSkillPoints(self, hero, property, activeLevel)
    local steamId = property.steamId
    local shoudAddSP = math.floor(activeLevel / 2)
    local currentAddedSP = ____exports.PropertyController.bnusSkillPointsAdded:get(steamId) or 0
    local deltaSP = shoudAddSP - currentAddedSP
    if deltaSP <= 0 then
        return
    end
    print((("[PropertyController] setBonusSkillPoints " .. tostring(shoudAddSP)) .. " ") .. tostring(deltaSP))
    hero:SetAbilityPoints(hero:GetAbilityPoints() + deltaSP)
    ____exports.PropertyController.bnusSkillPointsAdded:set(steamId, shoudAddSP)
end
function PropertyController.RefreshDataDrivenPlayerProperty(self, hero, modifierName, level)
    local registeredName = modifierName
    ____exports.PropertyController:RemoveDataDrivenPlayerPropertyModifiers(hero, registeredName)
    local applyName = modifierName
    if __TS__StringEndsWith(registeredName, "_level_") then
        if level == 0 then
            return
        end
        applyName = registeredName .. tostring(level)
    else
        local minLevel = ____exports.PropertyController.SINGLE_DATA_DRIVEN_PROPERTY_MIN_LEVEL
        if level < minLevel then
            return
        end
    end
    if not self.PLAYER_MODIFER_DATA_DRIVEN_ITEM then
        self.PLAYER_MODIFER_DATA_DRIVEN_ITEM = CreateItem("item_player_modifiers", nil, nil)
    end
    self.PLAYER_MODIFER_DATA_DRIVEN_ITEM:ApplyDataDrivenModifier(hero, hero, applyName, {duration = -1})
end
PropertyController.propertyLuaModiferMap = __TS__New(Map)
PropertyController.propertyDataDrivenModifierMap = __TS__New(Map)
PropertyController.bnusSkillPointsAdded = __TS__New(Map)
PropertyController.HERO_LEVEL_PER_POINT = 2
PropertyController.SINGLE_DATA_DRIVEN_PROPERTY_MIN_LEVEL = 8
PropertyController.MULTI_DATA_DRIVEN_PROPERTY_MAX_LEVEL = 13
PropertyController.luaPropertyMinLevelMap = __TS__New(Map, {{property_can_use_backpack_items.name, 16}})
PropertyController.limitPropertyNames = {
    "property_skill_points_bonus",
    "property_cast_range_bonus_stacking",
    "property_spell_amplify_percentage",
    "property_status_resistance_stacking",
    "property_evasion_constant",
    "property_magical_resistance_bonus",
    "property_incoming_damage_percentage",
    "property_attack_range_bonus",
    "property_attack_damage_pct",
    "property_physical_armor_bonus",
    "property_preattack_bonus_damage",
    "property_attackspeed_bonus_constant",
    "property_stats_strength_bonus",
    "property_stats_agility_bonus",
    "property_stats_intellect_bonus",
    "property_lifesteal",
    "property_spell_lifesteal",
    "property_strength_bonus_pct",
    "property_agility_bonus_pct",
    "property_intellect_bonus_pct",
    "property_pure_damage_reduction"
}
PropertyController = __TS__DecorateLegacy({reloadable}, PropertyController)
____exports.PropertyController = PropertyController
return ____exports
