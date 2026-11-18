_G.AbilityTomeUsageCounts = _G.AbilityTomeUsageCounts or {}
if _G.SkillTomeAuthorizationEnabled == nil then
_G.SkillTomeAuthorizationEnabled = false
end
_G.AllowedSkillTomeUses = _G.AllowedSkillTomeUses or {}
_G.SkillTomeAuthorizationStats = _G.SkillTomeAuthorizationStats or {}
local PROTECTED_SKILL_TOME_ITEMS = {
item_tome_of_ability_reset = true,
item_tome_of_ability_replace = true,
item_skill_learning = true,
}
local function GetSkillTomeItemName(item)
if not item or item:IsNull() then
return nil
end
if item.GetAbilityName then
return item:GetAbilityName()
end
if item.GetName then
return item:GetName()
end
return nil
end
local function GetSkillTomeStats(item_name)
if item_name == nil then
return nil
end
_G.SkillTomeAuthorizationStats[item_name] = _G.SkillTomeAuthorizationStats[item_name] or {
authorized = 0,
used = 0,
consumed = 0,
unauthorized = 0,
}
return _G.SkillTomeAuthorizationStats[item_name]
end
local function IncrementSkillTomeStat(item_or_name, field)
local item_name = type(item_or_name) == "string" and item_or_name or GetSkillTomeItemName(item_or_name)
if not SkillTomeIsProtectedItem(item_name) then
return
end
local stats = GetSkillTomeStats(item_name)
if stats == nil then
return
end
stats[field] = (stats[field] or 0) + 1
print(
"[SkillTomeAuthorization] stats",
item_name,
"authorized",
stats.authorized or 0,
"used",
stats.used or 0,
"consumed",
stats.consumed or 0,
"unauthorized",
stats.unauthorized or 0
)
end
function SkillTomeAuthorizationIsEnabled()
return _G.SkillTomeAuthorizationEnabled == true
end
function SkillTomeIsProtectedItem(item_or_name)
local item_name = type(item_or_name) == "string" and item_or_name or GetSkillTomeItemName(item_or_name)
return item_name ~= nil and PROTECTED_SKILL_TOME_ITEMS[item_name] == true
end
function SkillTomeAuthorizeItem(item)
if not item or item:IsNull() or not SkillTomeIsProtectedItem(item) then
return
end
_G.AllowedSkillTomeUses[item:entindex()] = true
IncrementSkillTomeStat(item, "authorized")
end
function SkillTomeRecordAuthorizedGrant(item_or_name)
IncrementSkillTomeStat(item_or_name, "authorized")
end
function SkillTomeRecordSuccessfulUse(item_or_name)
IncrementSkillTomeStat(item_or_name, "used")
end
function SkillTomeRecordUnauthorizedUse(item_or_name)
IncrementSkillTomeStat(item_or_name, "unauthorized")
end
function SkillTomeHasAuthorizedItem(item)
if not SkillTomeAuthorizationIsEnabled() then
return true
end
if not item or item:IsNull() then
return false
end
if not SkillTomeIsProtectedItem(item) then
return true
end
return _G.AllowedSkillTomeUses[item:entindex()] == true
end
function SkillTomeConsumeAuthorizedItem(item)
if not SkillTomeAuthorizationIsEnabled() then
return true
end
if not item or item:IsNull() then
return false
end
if not SkillTomeIsProtectedItem(item) then
return true
end
if _G.AllowedSkillTomeUses[item:entindex()] ~= true then
return false
end
_G.AllowedSkillTomeUses[item:entindex()] = nil
IncrementSkillTomeStat(item, "consumed")
return true
end
local function GetTomeUsagePlayerKey(player_id, prefix)
local steam_id = PlayerResource:GetSteamAccountID(player_id)
if steam_id ~= nil and steam_id > 0 then
return prefix .. "_steam_" .. tostring(steam_id)
end
return prefix .. "_player_" .. tostring(player_id)
end
local function GetTomeUsageCount(key)
return _G.AbilityTomeUsageCounts[key] or 0
end
local function SetTomeUsageCount(key, count)
_G.AbilityTomeUsageCounts[key] = count
end
function AbilityTomeUsageCanUseTotal(player_id, prefix, max_usage)
local key = GetTomeUsagePlayerKey(player_id, prefix)
local current_count = GetTomeUsageCount(key)
return current_count < max_usage, current_count, key
end
function AbilityTomeUsageIncrementTotal(player_id, prefix)
local key = GetTomeUsagePlayerKey(player_id, prefix)
local new_count = GetTomeUsageCount(key) + 1
SetTomeUsageCount(key, new_count)
return new_count
end
function AbilityTomeUsageCanUseWindow(player_id, prefix, max_usage, window_seconds)
local window_index = math.floor(GameRules:GetGameTime() / window_seconds)
local key = GetTomeUsagePlayerKey(player_id, prefix .. "_window_" .. tostring(window_index))
local current_count = GetTomeUsageCount(key)
return current_count < max_usage, current_count, key, window_index
end
function AbilityTomeUsageIncrementWindow(player_id, prefix, window_seconds)
local window_index = math.floor(GameRules:GetGameTime() / window_seconds)
local key = GetTomeUsagePlayerKey(player_id, prefix .. "_window_" .. tostring(window_index))
local new_count = GetTomeUsageCount(key) + 1
SetTomeUsageCount(key, new_count)
return new_count
end
