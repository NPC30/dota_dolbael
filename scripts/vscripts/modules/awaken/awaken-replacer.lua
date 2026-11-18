local ____lualib = require("lualib_bundle")
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local ____exports = {}
local ____awaken_2Dconfig = require("modules.awaken.awaken-config")
local ABILITY_REPLACEMENTS = ____awaken_2Dconfig.ABILITY_REPLACEMENTS
local function addAbilityAtLevel(self, hero, abilityName, level)
local added = hero:AddAbility(abilityName)
if added ~= nil then
added:SetLevel(math.min(
level,
added:GetMaxLevel()
))
end
end
local function resolveTargetAbility(self, hero, replacement)
if replacement.targetAbility ~= nil then
return replacement.targetAbility
end
if replacement.targetSlot ~= nil then
local ____opt_0 = hero:GetAbilityByIndex(replacement.targetSlot)
return ____opt_0 and ____opt_0:GetAbilityName()
end
return nil
end
local function resolveNewLevel(self, hero, replacement, fallbackLevel)
if replacement.inheritLevelFrom ~= nil then
local linked = hero:FindAbilityByName(replacement.inheritLevelFrom)
if linked ~= nil then
return linked:GetLevel()
end
end
return fallbackLevel
end
local function insertAbility(self, hero, replacement, targetAbilityName)
local oldAbility = hero:FindAbilityByName(targetAbilityName)
if oldAbility == nil then
return false
end
local savedLevel = oldAbility:GetLevel()
local newAbilityLevel = resolveNewLevel(nil, hero, replacement, replacement.newLevel)
hero:RemoveAbility(targetAbilityName)
hero:SetAbilityPoints(hero:GetAbilityPoints() + savedLevel)
addAbilityAtLevel(nil, hero, replacement.newAbility, newAbilityLevel)
addAbilityAtLevel(nil, hero, targetAbilityName, savedLevel)
return true
end
local function replaceAbility(self, hero, replacement, targetAbilityName)
local savedLevel = 0
if targetAbilityName ~= nil then
local oldAbility = hero:FindAbilityByName(targetAbilityName)
if oldAbility ~= nil then
savedLevel = oldAbility:GetLevel()
end
end
local fallbackLevel = replacement.newLevel > 0 and replacement.newLevel or savedLevel
local newAbilityLevel = resolveNewLevel(nil, hero, replacement, fallbackLevel)
if targetAbilityName ~= nil and hero:FindAbilityByName(targetAbilityName) ~= nil then
hero:RemoveAbility(targetAbilityName)
end
addAbilityAtLevel(nil, hero, replacement.newAbility, newAbilityLevel)
return true
end
function ____exports.executeReplacement(self, hero, replacement)
if hero:FindAbilityByName(replacement.newAbility) ~= nil then
return false
end
if replacement.targetAbility == nil and replacement.targetSlot == nil then
addAbilityAtLevel(
nil,
hero,
replacement.newAbility,
resolveNewLevel(nil, hero, replacement, replacement.newLevel)
)
return true
end
local targetAbilityName = resolveTargetAbility(nil, hero, replacement)
if replacement.targetSlot ~= nil and targetAbilityName ~= nil and targetAbilityName ~= "generic_hidden" then
return insertAbility(nil, hero, replacement, targetAbilityName)
end
return replaceAbility(nil, hero, replacement, targetAbilityName)
end
function ____exports.canAwaken(self, hero)
local heroName = hero:GetUnitName()
return __TS__ArraySome(
ABILITY_REPLACEMENTS,
function(____, r) return r.heroName == heroName end
)
end
function ____exports.isAwakened(self, hero)
local heroName = hero:GetUnitName()
local matched = __TS__ArrayFilter(
ABILITY_REPLACEMENTS,
function(____, r) return r.heroName == heroName end
)
if #matched == 0 then
return false
end
return __TS__ArrayEvery(
matched,
function(____, r) return hero:FindAbilityByName(r.newAbility) ~= nil end
)
end
function ____exports.applyAwakenByHero(self, hero)
local heroName = hero:GetUnitName()
local applied = false
for ____, replacement in ipairs(ABILITY_REPLACEMENTS) do
do
if heroName ~= replacement.heroName then
goto __continue27
end
if ____exports.executeReplacement(nil, hero, replacement) then
applied = true
end
end
::__continue27::
end
return applied
end
return ____exports
