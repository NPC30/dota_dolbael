local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack("utils/dota_ts_adapter.lua", {["8"] = 119,["9"] = 119,["10"] = 121,["11"] = 121,["12"] = 121,["13"] = 121,["15"] = 121,["17"] = 124,["18"] = 125,["19"] = 125,["20"] = 126,["21"] = 127,["22"] = 130,["23"] = 131,["24"] = 132,["28"] = 137,["31"] = 2,["32"] = 2,["33"] = 2,["35"] = 2,["36"] = 5,["37"] = 5,["38"] = 5,["40"] = 5,["41"] = 8,["42"] = 8,["43"] = 8,["45"] = 8,["46"] = 9,["47"] = 16,["48"] = 9,["49"] = 24,["50"] = 28,["51"] = 24,["52"] = 31,["53"] = 32,["54"] = 31,["55"] = 37,["56"] = 37,["57"] = 37,["58"] = 37,["59"] = 40,["60"] = 40,["61"] = 40,["62"] = 40,["63"] = 43,["64"] = 43,["65"] = 43,["66"] = 43,["67"] = 46,["68"] = 47,["69"] = 48,["70"] = 50,["71"] = 52,["72"] = 54,["74"] = 56,["76"] = 59,["77"] = 61,["78"] = 63,["79"] = 65,["80"] = 66,["81"] = 67,["82"] = 68,["83"] = 69,["85"] = 66,["86"] = 51,["90"] = 79,["91"] = 80,["92"] = 81,["93"] = 82,["94"] = 79,["97"] = 89,["98"] = 90,["99"] = 92,["101"] = 94,["103"] = 97,["104"] = 98,["105"] = 99,["106"] = 100,["107"] = 101,["108"] = 102,["109"] = 102,["111"] = 104,["112"] = 105,["113"] = 106,["114"] = 107,["115"] = 108,["117"] = 105,["118"] = 89,["119"] = 113,["120"] = 114,["121"] = 115,["123"] = 113});
local ____exports = {}
local getFileScope, toDotaClassInstance
function getFileScope(self)
    local ____getfenv_result_1 = getfenv(1)
    local ____G___TS__currentFile_0 = _G.__TS__currentFile
    if ____G___TS__currentFile_0 == nil then
        ____G___TS__currentFile_0 = "?"
    end
    return {____getfenv_result_1, ____G___TS__currentFile_0}
end
function toDotaClassInstance(self, instance, ____table)
    local ____table_2 = ____table
    local prototype = ____table_2.prototype
    while prototype do
        for key in pairs(prototype) do
            if not (rawget(instance, key) ~= nil) then
                if key ~= "__index" then
                    instance[key] = prototype[key]
                end
            end
        end
        prototype = getmetatable(prototype)
    end
end
____exports.BaseAbility = __TS__Class()
local BaseAbility = ____exports.BaseAbility
BaseAbility.name = "BaseAbility"
function BaseAbility.prototype.____constructor(self)
end
____exports.BaseItem = __TS__Class()
local BaseItem = ____exports.BaseItem
BaseItem.name = "BaseItem"
function BaseItem.prototype.____constructor(self)
end
____exports.BaseModifier = __TS__Class()
local BaseModifier = ____exports.BaseModifier
BaseModifier.name = "BaseModifier"
function BaseModifier.prototype.____constructor(self)
end
function BaseModifier.apply(self, target, caster, ability, modifierTable)
    return target:AddNewModifier(caster, ability, self.name, modifierTable)
end
function BaseModifier.find_on(self, target)
    return target:FindModifierByName(self.name)
end
function BaseModifier.remove(self, target)
    target:RemoveModifierByName(self.name)
end
____exports.BaseModifierMotionHorizontal = __TS__Class()
local BaseModifierMotionHorizontal = ____exports.BaseModifierMotionHorizontal
BaseModifierMotionHorizontal.name = "BaseModifierMotionHorizontal"
__TS__ClassExtends(BaseModifierMotionHorizontal, ____exports.BaseModifier)
____exports.BaseModifierMotionVertical = __TS__Class()
local BaseModifierMotionVertical = ____exports.BaseModifierMotionVertical
BaseModifierMotionVertical.name = "BaseModifierMotionVertical"
__TS__ClassExtends(BaseModifierMotionVertical, ____exports.BaseModifier)
____exports.BaseModifierMotionBoth = __TS__Class()
local BaseModifierMotionBoth = ____exports.BaseModifierMotionBoth
BaseModifierMotionBoth.name = "BaseModifierMotionBoth"
__TS__ClassExtends(BaseModifierMotionBoth, ____exports.BaseModifier)
setmetatable(____exports.BaseAbility.prototype, {__index = CDOTA_Ability_Lua or C_DOTA_Ability_Lua})
setmetatable(____exports.BaseItem.prototype, {__index = CDOTA_Item_Lua or C_DOTA_Item_Lua})
setmetatable(____exports.BaseModifier.prototype, {__index = CDOTA_Modifier_Lua})
____exports.registerAbility = function(____, name) return function(____, ability)
    if name ~= nil then
        ability.name = name
    else
        name = ability.name
    end
    local env = unpack(getFileScope(nil))
    env[name] = {}
    toDotaClassInstance(nil, env[name], ability)
    local originalSpawn = env[name].Spawn
    env[name].Spawn = function(self)
        self:____constructor()
        if originalSpawn then
            originalSpawn(self)
        end
    end
end end
--- 在「当前调用方」所在脚本的 env（用于 registerModifier 的 env 参数）。
-- 应在模块顶层调用（如 const _env = getCallerEnv()），此时调用方即该模块 chunk，返回的即该模块全局 env。
-- 与显式 scriptPath 一起传入 registerModifier，可避免移除 debug 后 path/env 错位导致的 "unknown modifier"。
function ____exports.getCallerEnv(self)
    local env = getfenv(2)
    print("[getCallerEnv] level=2 env=" .. (env == nil and "nil" or "table"))
    return env
end
--- 注册 Lua modifier：仅把 modifier 表写入 _G[name]，供引擎查找。
-- LinkLuaModifier 由 register_modifiers.ts 集中手动调用，不依赖 debug 取路径。
____exports.registerModifier = function(____, name, _scriptPath, _envOverride) return function(____, modifier)
    if name ~= nil then
        modifier.name = name
    else
        name = modifier.name
    end
    local env = _G
    env[name] = {}
    toDotaClassInstance(nil, env[name], modifier)
    _G[name] = env[name]
    local callerEnv = getfenv(2)
    if callerEnv ~= nil then
        callerEnv[name] = env[name]
    end
    local originalOnCreated = env[name].OnCreated
    env[name].OnCreated = function(self, parameters)
        self:____constructor()
        if originalOnCreated ~= nil then
            originalOnCreated(self, parameters)
        end
    end
end end
local function clearTable(self, ____table)
    for key in pairs(____table) do
        __TS__Delete(____table, key)
    end
end
return ____exports
