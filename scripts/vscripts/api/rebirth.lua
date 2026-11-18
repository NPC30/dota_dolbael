local ____lualib = require("lualib_bundle")
local __TS__Number = ____lualib.__TS__Number
local __TS__NumberIsFinite = ____lualib.__TS__NumberIsFinite
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/rebirth.lua"
__TS__SourceMapTraceBack("api/rebirth.lua", {["7"] = 27,["8"] = 28,["9"] = 28,["10"] = 28,["11"] = 28,["12"] = 28,["13"] = 28,["14"] = 27,["15"] = 41,["16"] = 41,["17"] = 41,["18"] = 41,["19"] = 41,["20"] = 41,["21"] = 27,["22"] = 54,["23"] = 54,["24"] = 54,["25"] = 54,["26"] = 54,["27"] = 54,["28"] = 27,["29"] = 67,["30"] = 67,["31"] = 67,["32"] = 67,["33"] = 67,["34"] = 67,["35"] = 27,["36"] = 82,["37"] = 83,["38"] = 84,["39"] = 84,["41"] = 85,["42"] = 82,["43"] = 88,["44"] = 89,["45"] = 88,["46"] = 97,["47"] = 98,["48"] = 98,["49"] = 98,["50"] = 98,["51"] = 99,["52"] = 100,["53"] = 100,["55"] = 102,["56"] = 105,["57"] = 106,["58"] = 110,["59"] = 110,["60"] = 110,["61"] = 110,["62"] = 119,["63"] = 119,["64"] = 120,["66"] = 121,["68"] = 123,["69"] = 123,["70"] = 124,["72"] = 125,["74"] = 126,["75"] = 126,["76"] = 126,["78"] = 126,["80"] = 128,["81"] = 128,["82"] = 129,["84"] = 130,["86"] = 104,["87"] = 104,["88"] = 104,["89"] = 104,["90"] = 104,["91"] = 104,["92"] = 104,["93"] = 104,["94"] = 97,["95"] = 137,["96"] = 142,["97"] = 142,["98"] = 143,["99"] = 144,["101"] = 147,["102"] = 148,["103"] = 148,["105"] = 150,["106"] = 151,["107"] = 151,["109"] = 153,["110"] = 137});
local ____exports = {}
local REBIRTH_RULES = {{
    count = 0,
    baseAttributeBonus = 0,
    singleAttributeEffectiveMax = 8,
    abilities = {moveSpeedLimitBreak = false, enemyCounter = false, flying = false, extraSlot = false},
    warriorExpCap = 0,
    memberExpCap = 0
}, {
    count = 1,
    baseAttributeBonus = 1,
    singleAttributeEffectiveMax = 9,
    abilities = {moveSpeedLimitBreak = true, enemyCounter = false, flying = false, extraSlot = false},
    warriorExpCap = 7000,
    memberExpCap = 0
}, {
    count = 2,
    baseAttributeBonus = 2,
    singleAttributeEffectiveMax = 10,
    abilities = {moveSpeedLimitBreak = true, enemyCounter = true, flying = true, extraSlot = false},
    warriorExpCap = 7000,
    memberExpCap = 3000
}, {
    count = 3,
    baseAttributeBonus = 3,
    singleAttributeEffectiveMax = 11,
    abilities = {moveSpeedLimitBreak = true, enemyCounter = true, flying = true, extraSlot = true},
    warriorExpCap = 6000,
    memberExpCap = 3000
}}
local function toNonNegativeInteger(self, value, fallback)
    local numeric = __TS__Number(value)
    if not __TS__NumberIsFinite(numeric) or numeric < 0 then
        return fallback
    end
    return math.floor(numeric)
end
function ____exports.isRebirthDirectAbilityProperty(self, propertyName)
    return propertyName == "property_ignore_movespeed_limit" or propertyName == "property_cannot_miss" or propertyName == "property_flying" or propertyName == "property_can_use_backpack_items"
end
function ____exports.resolveRebirth(self, rebirth)
    local count = math.min(
        3,
        toNonNegativeInteger(nil, rebirth and rebirth.count, 0)
    )
    local fallback = REBIRTH_RULES[count + 1]
    if count == 0 then
        return fallback
    end
    local abilities = rebirth and rebirth.abilities
    local ____count_24 = count
    local ____toNonNegativeInteger_result_25 = toNonNegativeInteger(nil, rebirth and rebirth.baseAttributeBonus, fallback.baseAttributeBonus)
    local ____math_max_result_26 = math.max(
        8,
        toNonNegativeInteger(nil, rebirth and rebirth.singleAttributeEffectiveMax, fallback.singleAttributeEffectiveMax)
    )
    local ____temp_10
    if type(abilities and abilities.moveSpeedLimitBreak) == "boolean" then
        ____temp_10 = abilities.moveSpeedLimitBreak
    else
        ____temp_10 = fallback.abilities.moveSpeedLimitBreak
    end
    local ____temp_13
    if type(abilities and abilities.enemyCounter) == "boolean" then
        ____temp_13 = abilities.enemyCounter
    else
        ____temp_13 = fallback.abilities.enemyCounter
    end
    local ____temp_16
    if type(abilities and abilities.flying) == "boolean" then
        ____temp_16 = abilities.flying
    else
        ____temp_16 = fallback.abilities.flying
    end
    local ____temp_19
    if type(abilities and abilities.extraSlot) == "boolean" then
        ____temp_19 = abilities.extraSlot
    else
        ____temp_19 = fallback.abilities.extraSlot
    end
    return {
        count = ____count_24,
        baseAttributeBonus = ____toNonNegativeInteger_result_25,
        singleAttributeEffectiveMax = ____math_max_result_26,
        abilities = {moveSpeedLimitBreak = ____temp_10, enemyCounter = ____temp_13, flying = ____temp_16, extraSlot = ____temp_19},
        warriorExpCap = toNonNegativeInteger(nil, rebirth and rebirth.warriorExpCap, fallback.warriorExpCap),
        memberExpCap = toNonNegativeInteger(nil, rebirth and rebirth.memberExpCap, fallback.memberExpCap)
    }
end
function ____exports.getRebirthEffectivePropertyLevel(self, propertyName, rawLevel, rebirth)
    local ____opt_27 = rebirth and rebirth.propertyEffectiveLevels
    local backendEffectiveLevel = ____opt_27 and ____opt_27[propertyName]
    if backendEffectiveLevel ~= nil then
        return toNonNegativeInteger(nil, backendEffectiveLevel, 0)
    end
    local legacyLevel = toNonNegativeInteger(nil, rawLevel, 0)
    if ____exports.isRebirthDirectAbilityProperty(nil, propertyName) then
        return legacyLevel
    end
    local resolved = ____exports.resolveRebirth(nil, rebirth)
    if resolved.count == 0 then
        return legacyLevel
    end
    return math.min(resolved.singleAttributeEffectiveMax, legacyLevel + resolved.baseAttributeBonus)
end
return ____exports
