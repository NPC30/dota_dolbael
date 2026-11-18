local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/action/cast-condition.lua"
__TS__SourceMapTraceBack("ai/action/cast-condition.lua", {["8"] = 150,["14"] = 97,["15"] = 101,["16"] = 102,["18"] = 105,["19"] = 105,["20"] = 105,["21"] = 105,["22"] = 105,["23"] = 106,["25"] = 108,["26"] = 108,["27"] = 108,["28"] = 108,["29"] = 108,["30"] = 109,["32"] = 112,["33"] = 113,["35"] = 115,["36"] = 116,["38"] = 118,["39"] = 119,["41"] = 122,["42"] = 97,["43"] = 150,["44"] = 151,["45"] = 152,["47"] = 154,["48"] = 155,["50"] = 157,["52"] = 190,["53"] = 191,["55"] = 62,["56"] = 67,["57"] = 67,["58"] = 67,["59"] = 67,["60"] = 68,["62"] = 71,["64"] = 72,["65"] = 73,["67"] = 75,["68"] = 76,["70"] = 79,["71"] = 79,["72"] = 81,["73"] = 82,["75"] = 84,["79"] = 87,["80"] = 62,["86"] = 132,["87"] = 136,["88"] = 137,["90"] = 140,["91"] = 140,["92"] = 140,["93"] = 140,["94"] = 140,["95"] = 141,["97"] = 143,["98"] = 143,["99"] = 143,["100"] = 143,["101"] = 143,["102"] = 144,["104"] = 147,["105"] = 132,["110"] = 166,["111"] = 167,["112"] = 167,["114"] = 169,["115"] = 171,["116"] = 171,["117"] = 171,["118"] = 172,["119"] = 173,["120"] = 175,["123"] = 177,["124"] = 178,["126"] = 183,["128"] = 171,["129"] = 171,["130"] = 187,["131"] = 166});
local ____exports = {}
local CheckNumberRangeFailure, isObject
--- 检查单位是否满足指定条件
-- 
-- @param unit - 要检查的单位
-- @param unitCondition - 可选的条件，用于检查单位
-- @returns 如果单位检测失败，则返回 `true`，否则返回 `false`
function ____exports.CheckUnitConditionFailure(self, unit, unitCondition)
    if not unitCondition then
        return false
    end
    if CheckNumberRangeFailure(
        nil,
        unit:GetHealthPercent(),
        unitCondition.healthPercent
    ) then
        return true
    end
    if CheckNumberRangeFailure(
        nil,
        unit:GetManaPercent(),
        unitCondition.manaPercent
    ) then
        return true
    end
    if unitCondition.hasScepter and not unit:HasScepter() then
        return true
    end
    if unitCondition.hasShard and not unit:HasModifier("modifier_item_aghanims_shard") then
        return true
    end
    if unitCondition.noModifier and unit:HasModifier(unitCondition.noModifier) then
        return true
    end
    return false
end
function CheckNumberRangeFailure(self, value, range)
    if (range and range.gte) ~= nil and value < range.gte then
        return true
    end
    if (range and range.lte) ~= nil and value > range.lte then
        return true
    end
    return false
end
function isObject(self, item)
    return item ~= nil and type(item) == "table"
end
function ____exports.FilterTargetWithCondition(self, condition, units, ____self)
    local ____CheckNumberRangeFailure_5 = CheckNumberRangeFailure
    local ____temp_4 = #units
    local ____opt_0 = condition and condition.target
    if ____CheckNumberRangeFailure_5(nil, ____temp_4, ____opt_0 and ____opt_0.count) then
        return nil
    end
    for ____, unit in ipairs(units) do
        do
            if not unit:IsAlive() then
                goto __continue4
            end
            if not unit:CanEntityBeSeenByMyTeam(____self) then
                goto __continue4
            end
            local ____opt_6 = condition and condition.target
            local unitCondition = ____opt_6 and ____opt_6.unitCondition
            if ____exports.CheckUnitConditionFailure(nil, unit, unitCondition) then
                goto __continue4
            end
            return unit
        end
        ::__continue4::
    end
    return nil
end
--- 检查技能是否满足指定条件
-- 
-- @param ability - 要检查的技能
-- @param abilityCoindition - 可选的条件，用于检查技能
-- @returns 如果技能检测失败，则返回 `true`，否则返回 `false`
function ____exports.CheckAbilityConditionFailure(self, ability, abilityCoindition)
    if not abilityCoindition then
        return false
    end
    if CheckNumberRangeFailure(
        nil,
        ability:GetLevel(),
        abilityCoindition.level
    ) then
        return true
    end
    if CheckNumberRangeFailure(
        nil,
        ability:GetCurrentAbilityCharges(),
        abilityCoindition.charges
    ) then
        return true
    end
    return false
end
--- 深度合并两个类型为 `T` 的对象，其中 `T` 扩展自 `CastCondition`。
-- 
-- @param target - 要合并的目标对象，必须存在
-- @param source - 要合并的源对象，可选
function ____exports.DeepMerge(self, target, source)
    if not source then
        return target
    end
    local result = __TS__ObjectAssign({}, target)
    __TS__ArrayForEach(
        __TS__ObjectKeys(source),
        function(____, key)
            local targetValue = result[key]
            local sourceValue = source[key]
            if sourceValue == nil then
                return
            end
            if isObject(nil, targetValue) and isObject(nil, sourceValue) then
                result[key] = ____exports.DeepMerge(nil, targetValue, sourceValue)
            else
                result[key] = sourceValue
            end
        end
    )
    return result
end
return ____exports
