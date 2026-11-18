LinkLuaModifier("modifier_item_hero_possession", "items/item_hero_possession", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_hero_possession_item_lock", "items/item_hero_possession", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_hero_possession_stats", "items/item_hero_possession", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_hero_possession_prefetch", "items/item_hero_possession", LUA_MODIFIER_MOTION_NONE)
item_hero_possession = item_hero_possession or class({})
modifier_item_hero_possession = modifier_item_hero_possession or class({})
modifier_item_hero_possession_item_lock = modifier_item_hero_possession_item_lock or class({})
modifier_item_hero_possession_stats = modifier_item_hero_possession_stats or class({})
modifier_item_hero_possession_prefetch = modifier_item_hero_possession_prefetch or class({})
local POSSESSION_BACKEND_HOST = "https://wx.renoomgai.top/api"
local POSSESSION_CACHE_TTL = 120
local POSSESSION_MAX_ITEMS = 8
local POSSESSION_MAX_ABILITIES = 4
local POSSESSION_MAX_TOMES = 1000
local POSSESSION_MAX_MOON_SHARDS = 20
local POSSESSION_SNAPSHOT_CACHE = POSSESSION_SNAPSHOT_CACHE or {}
local POSSESSION_TITLE_CACHE = POSSESSION_TITLE_CACHE or {}
local POSSESSION_BLOCKED_ITEMS = {
item_hero_possession = true,
item_treasure_chest = true,
item_ability_rp = true,
item_skill_learning = true,
item_skill_remover = true,
item_skill_reset = true,
item_skill_talisman = true,
item_skill_transfer = true,
item_skill_transfer_passive = true,
item_universal_rune = true
}
local POSSESSION_BLOCKED_ABILITIES = {
hero_possession = true
}
local function DebugLog(message)
print("[HeroPossession] " .. tostring(message))
end
local function IsPossessionAbyssMode()
return (GameRules and GameRules.Option and GameRules.Option.abyssMode == true)
or (_G and _G.AbyssModeEnabled == true)
or (_G and (_G.AbyssModeWave or 0) > 0)
end
local function GetPossessionSnapshotQuery()
local matchId = tostring(GameRules:Script_GetMatchID())
if IsPossessionAbyssMode() then
return "matchId=" .. matchId .. "&mode=abyss"
end
return "matchId=" .. matchId .. "&difficulty=7"
end
local function GetSnapshotCacheKey(heroName)
return tostring(heroName or "") .. ":" .. GetPossessionSnapshotQuery()
end
local function IsValidHandle(entity)
if not entity then
return false
end
if IsValidEntity and not IsValidEntity(entity) then
return false
end
if entity.IsNull then
local ok, isNull = pcall(function()
return entity:IsNull()
end)
if ok and isNull then
return false
end
end
return true
end
local function ToTable(value, fallback)
if type(value) == "table" then
return value
end
return fallback or {}
end
local function ToClampedNumber(value, defaultValue, minValue, maxValue)
local numberValue = tonumber(value)
if not numberValue then
return defaultValue
end
if numberValue < minValue then
return minValue
end
if numberValue > maxValue then
return maxValue
end
return numberValue
end
local function ToAbilityLevel(value)
return math.floor(ToClampedNumber(value, 1, 1, 30))
end
local function HasAbilityKV(name)
if type(GetAbilityKeyValuesByName) ~= "function" then
return true
end
local ok, kv = pcall(function()
return GetAbilityKeyValuesByName(name)
end)
return ok and kv ~= nil
end
local function StoreSnapshotCache(heroName, snapshot)
if not heroName or not snapshot then
return
end
POSSESSION_SNAPSHOT_CACHE[heroName] = {
snapshot = snapshot,
fetchedAt = GameRules:GetGameTime(),
pending = false
}
end
local function RunSnapshotCallbacks(callbacks, payload, label)
local delay = 0
for _, callback in pairs(callbacks or {}) do
local function runOneCallback()
local ok, err = pcall(function()
callback(payload)
end)
if not ok then
DebugLog("快照回调异常(" .. tostring(label) .. "): " .. tostring(err))
end
end
if Timers then
Timers:CreateTimer(delay, runOneCallback)
delay = delay + 0.05
else
runOneCallback()
end
end
end
local function GetSnapshotSteamId(snapshot)
if not snapshot then
DebugLog("剑来称号: 快照为空，无法读取steamId")
return nil
end
local steamId = tonumber(snapshot.steamId or snapshot.sourceSteamId)
if not steamId or steamId <= 0 then
DebugLog("剑来称号: 快照缺少有效steamId/sourceSteamId，playerName=" .. tostring(snapshot.playerName))
return nil
end
return math.floor(steamId)
end
local function IsHeroPossessionActive(hero, uniqueId)
if not hero or not IsValidEntity(hero) or not uniqueId then
return false
end
local mods = hero:FindAllModifiersByName("modifier_item_hero_possession")
for _, mod in pairs(mods or {}) do
if mod.uniqueId == uniqueId then
return true
end
end
return false
end
local function SetPossessionOverheadTitle(playerId, titleData, uniqueId, playerName)
if playerId == nil or playerId < 0 then
DebugLog("剑来称号: 跳过写入临时头顶称号 playerId=" .. tostring(playerId) ..
" title=" .. tostring(titleData and titleData.title))
return
end
local playerNameText = tostring(playerName or "")
local titleText = titleData and titleData.title and tostring(titleData.title) or ""
local displayTitle = titleText
if playerNameText ~= "" then
if displayTitle ~= "" then
displayTitle = displayTitle .. " - " .. playerNameText
else
displayTitle = playerNameText
end
end
if displayTitle == "" then
DebugLog("剑来称号: 跳过写入临时头顶称号，称号和玩家名都为空 playerId=" .. tostring(playerId))
return
end
DebugLog("剑来称号: 写入临时头顶称号 playerId=" .. tostring(playerId) ..
" title=" .. tostring(displayTitle) ..
" level=" .. tostring(titleData and titleData.level or 1) ..
" uniqueId=" .. tostring(uniqueId))
CustomNetTables:SetTableValue("possession_title_table", tostring(playerId), {
title = displayTitle,
level = (titleData and titleData.level) or 1,
uniqueId = uniqueId or ""
})
end
local function ClearPossessionOverheadTitle(playerId, uniqueId)
if playerId == nil or playerId < 0 then
return
end
local key = tostring(playerId)
local current = CustomNetTables:GetTableValue("possession_title_table", key)
if current and current.uniqueId and uniqueId and current.uniqueId ~= uniqueId then
DebugLog("剑来称号: 跳过清理，uniqueId不匹配 playerId=" .. key ..
" current=" .. tostring(current.uniqueId) .. " expected=" .. tostring(uniqueId))
return
end
DebugLog("剑来称号: 清理临时头顶称号 playerId=" .. key .. " uniqueId=" .. tostring(uniqueId))
CustomNetTables:SetTableValue("possession_title_table", key, {
title = "",
level = 0,
uniqueId = uniqueId or ""
})
end
local function RequestSnapshotPlayerTitle(snapshot, onComplete)
local steamId = GetSnapshotSteamId(snapshot)
if not steamId then
DebugLog("剑来称号: 无steamId，直接回退")
onComplete(nil)
return
end
local cacheKey = tostring(steamId)
local cachedTitle = POSSESSION_TITLE_CACHE[cacheKey]
if cachedTitle ~= nil then
if cachedTitle == false then
DebugLog("剑来称号: 缓存命中为空 steamId=" .. cacheKey)
onComplete(nil)
else
DebugLog("剑来称号: 缓存命中 steamId=" .. cacheKey ..
" title=" .. tostring(cachedTitle.title) ..
" level=" .. tostring(cachedTitle.level))
onComplete(cachedTitle)
end
return
end
local service = GameRules.PlayerTitle
if not service or type(service.requestTitleBySteamId) ~= "function" then
DebugLog("称号服务未就绪，跳过剑来称号请求: " .. cacheKey)
onComplete(nil)
return
end
DebugLog("剑来称号: 开始请求 steamId=" .. cacheKey)
local ok, err = pcall(function()
service:requestTitleBySteamId(steamId, function(_, title)
POSSESSION_TITLE_CACHE[cacheKey] = title or false
DebugLog("剑来称号: 请求成功 steamId=" .. cacheKey ..
" title=" .. tostring(title and title.title) ..
" level=" .. tostring(title and title.level))
onComplete(title)
end, function()
POSSESSION_TITLE_CACHE[cacheKey] = false
DebugLog("剑来称号: 请求失败或无称号 steamId=" .. cacheKey)
onComplete(nil)
end)
end)
if not ok then
DebugLog("剑来称号请求异常: " .. tostring(err))
POSSESSION_TITLE_CACHE[cacheKey] = false
onComplete(nil)
end
end
local function ClearHawkeyeTurretActiveModifier(hero)
if not hero or not IsValidEntity(hero) then
return
end
if hero:HasModifier("modifier_item_hawkeye_turret_active") then
hero:RemoveModifierByName("modifier_item_hawkeye_turret_active")
end
end
local function IsPossessionItem(item)
return item and IsValidEntity(item) and item:GetName() == "item_hero_possession"
end
local function IsSnapshotItem(item, uniqueId, snapshotItems)
if not item or not IsValidEntity(item) or not snapshotItems then
return false
end
local itemName = item:GetName()
return snapshotItems[itemName] and item.possessionUniqueId == uniqueId
end
local function SafeItemNumber(item, methodName)
if not item or not IsValidEntity(item) or type(item[methodName]) ~= "function" then
return nil
end
local ok, value = pcall(function()
return item[methodName](item)
end)
if ok and type(value) == "number" then
return value
end
return nil
end
local function SafeSetItemNumber(item, methodName, value)
if value == nil or not item or not IsValidEntity(item) or type(item[methodName]) ~= "function" then
return
end
pcall(function()
item[methodName](item, value)
end)
end
local function CaptureItemState(item, slot)
if not item or not IsValidEntity(item) then
return nil
end
local state = {
name = item:GetName(),
slot = slot,
currentCharges = SafeItemNumber(item, "GetCurrentCharges"),
secondaryCharges = SafeItemNumber(item, "GetSecondaryCharges"),
cooldownRemaining = SafeItemNumber(item, "GetCooldownTimeRemaining")
}
return state
end
local function RestoreItemState(hero, itemState)
local itemName = type(itemState) == "table" and itemState.name or itemState
if not itemName or itemName == "item_hero_possession" then
return nil
end
local item = hero:AddItemByName(itemName)
if not item then
return nil
end
if type(itemState) == "table" then
SafeSetItemNumber(item, "SetCurrentCharges", itemState.currentCharges)
SafeSetItemNumber(item, "SetSecondaryCharges", itemState.secondaryCharges)
if itemState.cooldownRemaining and itemState.cooldownRemaining > 0 and type(item.StartCooldown) == "function" then
pcall(function()
item:StartCooldown(itemState.cooldownRemaining)
end)
end
end
return item
end
local function RemoveSnapshotItemsFromHero(hero, uniqueId, snapshotItems, removeFromOwner)
if not hero or not IsValidEntity(hero) or not snapshotItems then
return
end
for slot = DOTA_ITEM_SLOT_1, DOTA_ITEM_SLOT_9 do
local item = hero:GetItemInSlot(slot)
if IsSnapshotItem(item, uniqueId, snapshotItems) and removeFromOwner then
UTIL_RemoveImmediate(item)
end
end
for slot = DOTA_STASH_SLOT_1, DOTA_STASH_SLOT_6 do
local item = hero:GetItemInSlot(slot)
if IsSnapshotItem(item, uniqueId, snapshotItems) then
UTIL_RemoveImmediate(item)
end
end
end
local function RemoveSnapshotItemsFromCourier(courier, uniqueId, snapshotItems)
if not courier or not IsValidEntity(courier) or not snapshotItems then
return false
end
local removed = false
for slot = DOTA_ITEM_SLOT_1, DOTA_ITEM_SLOT_9 do
local item = courier:GetItemInSlot(slot)
if IsSnapshotItem(item, uniqueId, snapshotItems) then
DebugLog("清理信使携带的快照装备: " .. item:GetName())
UTIL_RemoveImmediate(item)
removed = true
end
end
return removed
end
local function RemoveSnapshotItemsFromAllCouriers(uniqueId, snapshotItems)
local removed = false
local couriers = Entities:FindAllByClassname("npc_dota_courier") or {}
for _, courier in pairs(couriers) do
if RemoveSnapshotItemsFromCourier(courier, uniqueId, snapshotItems) then
removed = true
end
end
return removed
end
local function CompactSnapshotItemsToActiveSlots(hero, uniqueId, snapshotItems)
if not hero or not IsValidEntity(hero) or not snapshotItems then
return
end
if not hero.SwapItems then
return
end
for backpackSlot = DOTA_ITEM_SLOT_7, DOTA_ITEM_SLOT_9 do
local backpackItem = hero:GetItemInSlot(backpackSlot)
if IsSnapshotItem(backpackItem, uniqueId, snapshotItems) then
for activeSlot = DOTA_ITEM_SLOT_1, DOTA_ITEM_SLOT_6 do
if not hero:GetItemInSlot(activeSlot) then
pcall(function()
hero:SwapItems(backpackSlot, activeSlot)
end)
break
end
end
end
end
end
local function MoveItemToBackpack(hero, targetItem)
if not hero or not IsValidEntity(hero) or not IsValidHandle(targetItem) then
return false
end
if not hero.SwapItems then
return false
end
local targetSlot = nil
for slot = DOTA_ITEM_SLOT_1, DOTA_ITEM_SLOT_9 do
if hero:GetItemInSlot(slot) == targetItem then
targetSlot = slot
break
end
end
if not targetSlot or targetSlot >= DOTA_ITEM_SLOT_7 then
return false
end
for backpackSlot = DOTA_ITEM_SLOT_7, DOTA_ITEM_SLOT_9 do
if not hero:GetItemInSlot(backpackSlot) then
local ok = pcall(function()
hero:SwapItems(targetSlot, backpackSlot)
end)
return ok
end
end
return false
end
local function BuildFallbackSnapshot()
return {
heroName = "fallback",
sourceType = "fallback",
playerName = "RENO",
level = 30,
items = {
"item_magic_crit_blade",
"item_ten_thousand_swords",
"item_time_gem",
"item_hawkeye_fighter",
"item_beast_armor",
"item_beast_shield"
},
strTomes = 5,
agiTomes = 5,
intTomes = 15,
moonShards = 2,
hasLuoshu = true,
luoshuAllStats = 100,
lotteryAbilities = {
{ name = "elder_titan_natural_order", level = 4 },
{ name = "ability_trigger_on_move", level = 4 }
}
}
end
function item_hero_possession:DebugLog(message)
DebugLog(message)
end
function item_hero_possession:GetIntrinsicModifierName()
return "modifier_item_hero_possession_prefetch"
end
function item_hero_possession:OnSpellStart()
local caster = self:GetCaster()
self:DebugLog("=== 开始使用英灵附身装备 ===")
if not IsValidHandle(self) or not caster or not IsValidEntity(caster) then
DebugLog("错误: 附身物品或英雄句柄无效")
return
end
local duration = self:GetSpecialValueFor("duration")
local uniqueId = DoUniqueString("possession_" .. caster:GetEntityIndex() .. "_" .. GameRules:GetGameTime())
if caster:HasModifier("modifier_item_hero_possession") or caster.__heroPossessionPending then
self:DebugLog("已有附身效果或附身请求处理中，取消重复使用")
self:EndCooldown()
return
end
caster.__heroPossessionPending = true
Timers:CreateTimer(0.1, function()
if caster and IsValidEntity(caster) and caster:IsAlive() then
if not IsValidHandle(self) then
caster.__heroPossessionPending = nil
DebugLog("附身物品句柄已失效，取消附身")
return
end
self:FetchAndApplySnapshot(caster, duration, uniqueId)
else
if caster and IsValidEntity(caster) then
caster.__heroPossessionPending = nil
end
DebugLog("警告: 英雄已死亡或无效,取消附身")
end
end)
end
function item_hero_possession:CheckMemberLevel(steamId)
local memberLevel = Player.GetMemberLevel(steamId)
self:DebugLog("玩家会员等级: " .. memberLevel)
return memberLevel >= 2
end
function item_hero_possession:CheckTowerCondition()
local caster = self:GetCaster()
local team = caster:GetTeamNumber()
local tower4_destroyed = 0
if team == DOTA_TEAM_GOODGUYS then
tower4_destroyed = AIGameMode.tower4PushedBad or 0
else
tower4_destroyed = AIGameMode.tower4PushedGood or 0
end
self:DebugLog("己方被摧毁的4塔数量: " .. tower4_destroyed)
return tower4_destroyed >= 1
end
function item_hero_possession:GetCachedSnapshot(heroName)
local cached = POSSESSION_SNAPSHOT_CACHE[GetSnapshotCacheKey(heroName)]
if not cached or not cached.snapshot or not cached.fetchedAt then
return nil
end
if GameRules:GetGameTime() - cached.fetchedAt > POSSESSION_CACHE_TTL then
return nil
end
return cached.snapshot
end
function item_hero_possession:StoreSnapshotCache(heroName, snapshot)
StoreSnapshotCache(GetSnapshotCacheKey(heroName), snapshot)
end
function item_hero_possession:IsAllowedSnapshotItem(itemName)
if type(itemName) ~= "string" or itemName == "" then
return false
end
if POSSESSION_BLOCKED_ITEMS[itemName] then
return false
end
if string.sub(itemName, 1, 5) ~= "item_" then
return false
end
return HasAbilityKV(itemName)
end
function item_hero_possession:IsAllowedSnapshotAbility(abilityName)
if type(abilityName) ~= "string" or abilityName == "" then
return false
end
if POSSESSION_BLOCKED_ABILITIES[abilityName] then
return false
end
if string.sub(abilityName, 1, 5) == "item_" then
return false
end
return HasAbilityKV(abilityName)
end
function item_hero_possession:NormalizeSnapshot(snapshot, fallbackSnapshot)
snapshot = snapshot or fallbackSnapshot
local normalized = {
heroName = snapshot.heroName or fallbackSnapshot.heroName,
sourceType = snapshot.sourceType or fallbackSnapshot.sourceType,
steamId = snapshot.steamId or snapshot.sourceSteamId or fallbackSnapshot.steamId,
playerName = tostring(snapshot.playerName or snapshot.playerId or fallbackSnapshot.playerName),
strTomes = ToClampedNumber(snapshot.strTomes, 0, 0, POSSESSION_MAX_TOMES),
agiTomes = ToClampedNumber(snapshot.agiTomes, 0, 0, POSSESSION_MAX_TOMES),
intTomes = ToClampedNumber(snapshot.intTomes, 0, 0, POSSESSION_MAX_TOMES),
moonShards = ToClampedNumber(snapshot.moonShards, 0, 0, POSSESSION_MAX_MOON_SHARDS),
hasLuoshu = snapshot.hasLuoshu == true or snapshot.hasLuoshu == 1,
luoshuAllStats = ToClampedNumber(snapshot.luoshuAllStats, 0, 0, 1000),
items = {},
lotteryAbilities = {}
}
local safeItems = {}
for _, itemName in pairs(ToTable(snapshot.items, fallbackSnapshot.items)) do
if #safeItems >= POSSESSION_MAX_ITEMS then
break
end
if self:IsAllowedSnapshotItem(itemName) then
table.insert(safeItems, itemName)
else
self:DebugLog("跳过不安全或非法快照物品: " .. tostring(itemName))
end
end
normalized.items = safeItems
local safeAbilities = {}
for _, abilityData in pairs(ToTable(snapshot.lotteryAbilities, fallbackSnapshot.lotteryAbilities)) do
if #safeAbilities >= POSSESSION_MAX_ABILITIES then
break
end
local abilityName = type(abilityData) == "table" and abilityData.name or nil
if self:IsAllowedSnapshotAbility(abilityName) then
table.insert(safeAbilities, {
name = abilityName,
level = ToAbilityLevel(abilityData.level)
})
else
self:DebugLog("跳过不安全或非法快照技能: " .. tostring(abilityName))
end
end
normalized.lotteryAbilities = safeAbilities
return normalized
end
function item_hero_possession:SafeAddSnapshotItem(hero, itemName, uniqueId)
if not self:IsAllowedSnapshotItem(itemName) then
self:DebugLog("拒绝添加快照物品: " .. tostring(itemName))
return nil
end
local ok, item = pcall(function()
return hero:AddItemByName(itemName)
end)
if not ok or not item or not IsValidEntity(item) then
self:DebugLog("添加快照物品失败，已跳过: " .. tostring(itemName))
return nil
end
item.possessionUniqueId = uniqueId
return item
end
function item_hero_possession:SafeAddSnapshotAbility(hero, abilityName, level, uniqueId)
if not self:IsAllowedSnapshotAbility(abilityName) then
self:DebugLog("拒绝添加快照技能: " .. tostring(abilityName))
return nil
end
local ok = pcall(function()
hero:AddAbility(abilityName)
end)
if not ok then
self:DebugLog("添加快照技能异常，已跳过: " .. tostring(abilityName))
return nil
end
local ability = hero:FindAbilityByName(abilityName)
if not ability then
self:DebugLog("添加快照技能失败，已跳过: " .. tostring(abilityName))
return nil
end
ability:SetLevel(level or 1)
ability.possessionUniqueId = uniqueId
return ability
end
function item_hero_possession:RequestSnapshot(heroName, onSuccess, onFailure)
if not heroName or heroName == "" then
if onFailure then
onFailure()
end
return
end
local requestQuery = GetPossessionSnapshotQuery()
local cacheKey = GetSnapshotCacheKey(heroName)
local cacheEntry = POSSESSION_SNAPSHOT_CACHE[cacheKey] or {}
cacheEntry.successCallbacks = cacheEntry.successCallbacks or {}
cacheEntry.failureCallbacks = cacheEntry.failureCallbacks or {}
if cacheEntry.pending then
if onSuccess then
table.insert(cacheEntry.successCallbacks, onSuccess)
end
if onFailure then
table.insert(cacheEntry.failureCallbacks, onFailure)
end
POSSESSION_SNAPSHOT_CACHE[cacheKey] = cacheEntry
return
end
if onSuccess then
table.insert(cacheEntry.successCallbacks, onSuccess)
end
if onFailure then
table.insert(cacheEntry.failureCallbacks, onFailure)
end
cacheEntry.pending = true
POSSESSION_SNAPSHOT_CACHE[cacheKey] = cacheEntry
local requestUrl = POSSESSION_BACKEND_HOST .. "/possession/hero/" .. heroName .. "?" .. requestQuery
self:DebugLog("请求附身快照: " .. requestUrl)
local request = CreateHTTPRequestScriptVM(
"GET",
requestUrl
)
request:SetHTTPRequestNetworkActivityTimeout(5)
request:SetHTTPRequestHeaderValue("x-api-key", GetDedicatedServerKeyV3("v2"))
request:Send(function(result)
local currentEntry = POSSESSION_SNAPSHOT_CACHE[cacheKey] or {}
currentEntry.pending = false
local successCallbacks = currentEntry.successCallbacks or {}
local failureCallbacks = currentEntry.failureCallbacks or {}
currentEntry.successCallbacks = {}
currentEntry.failureCallbacks = {}
POSSESSION_SNAPSHOT_CACHE[cacheKey] = currentEntry
if not result or result.StatusCode ~= 200 or not result.Body or result.Body == "" then
RunSnapshotCallbacks(failureCallbacks, result, "failure")
return
end
local ok, decoded = pcall(function()
return json.decode(result.Body)
end)
if not ok or not decoded or decoded.code ~= 200 or not decoded.data then
RunSnapshotCallbacks(failureCallbacks, result, "failure")
return
end
StoreSnapshotCache(cacheKey, decoded.data)
RunSnapshotCallbacks(successCallbacks, decoded.data, "success")
end)
end
function item_hero_possession:EnsureSnapshotCached(caster)
if not caster or not IsValidEntity(caster) then
return
end
local heroName = caster:GetUnitName()
if self:GetCachedSnapshot(heroName) then
return
end
self:RequestSnapshot(heroName, function(_snapshot)
self:DebugLog("已预取附身快照: " .. heroName)
end, function(_result)
self:DebugLog("预取附身快照失败: " .. heroName)
end)
end
function item_hero_possession:FetchAndApplySnapshot(caster, duration, uniqueId)
self:DebugLog("=== 获取并应用快照 === ID: " .. uniqueId)
local heroName = caster:GetUnitName()
local fallbackSnapshot = BuildFallbackSnapshot()
local savedState = self:SaveHeroState(caster)
local function applyResolvedSnapshot(snapshot)
if not IsValidHandle(self) then
if caster and IsValidEntity(caster) then
caster.__heroPossessionPending = nil
end
DebugLog("附身结果返回时物品句柄已失效，取消应用")
return
end
if not caster or not IsValidEntity(caster) or not caster:IsAlive() then
self:DebugLog("附身结果返回时英雄已无效，取消应用")
if caster and IsValidEntity(caster) then
caster.__heroPossessionPending = nil
end
return
end
snapshot = self:NormalizeSnapshot(snapshot, fallbackSnapshot)
local snapshotItemCounts = {}
for _, itemName in pairs(snapshot.items or {}) do
snapshotItemCounts[itemName] = (snapshotItemCounts[itemName] or 0) + 1
end
local abilityRestoreData = self:ApplySnapshot(caster, snapshot, duration, uniqueId)
if not abilityRestoreData then
caster.__heroPossessionPending = nil
self:DebugLog("应用快照失败，取消附身")
return
end
local modifierOk, modifier = pcall(function()
return caster:AddNewModifier(caster, nil, "modifier_item_hero_possession", {
duration = duration,
unique_id = uniqueId
})
end)
if not modifierOk then
self:DebugLog("创建主附身modifier异常: " .. tostring(modifier))
modifier = nil
end
if modifier then
modifier.savedState = savedState
modifier.addedAbilities = abilityRestoreData or {}
modifier.uniqueId = uniqueId
modifier.snapshotItems = snapshotItemCounts
self:DebugLog("Modifier创建成功, 持续时间: " .. duration .. "秒, ID: " .. uniqueId)
caster.__heroPossessionPending = nil
local ok = pcall(function()
self:SpendCharge(1)
end)
if not ok then
self:DebugLog("警告: 附身成功但消耗道具失败")
end
CompactSnapshotItemsToActiveSlots(caster, uniqueId, snapshotItemCounts)
else
caster.__heroPossessionPending = nil
self:DebugLog("Modifier创建失败，取消附身")
return
end
local possessionPlayerId = caster:GetPlayerOwnerID()
ClearPossessionOverheadTitle(possessionPlayerId, uniqueId)
RequestSnapshotPlayerTitle(snapshot, function(titleData)
if not IsHeroPossessionActive(caster, uniqueId) then
return
end
SetPossessionOverheadTitle(possessionPlayerId, titleData, uniqueId, snapshot.playerName)
end)
end
local cachedSnapshot = self:GetCachedSnapshot(heroName)
if cachedSnapshot then
self:DebugLog("命中附身快照缓存: " .. heroName)
applyResolvedSnapshot(cachedSnapshot)
return
end
self:RequestSnapshot(heroName, function(snapshot)
applyResolvedSnapshot(snapshot)
end, function(result)
self:DebugLog("附身请求失败,使用本地回退模板, status=" .. tostring(result and result.StatusCode or "nil"))
applyResolvedSnapshot(fallbackSnapshot)
end)
end
function item_hero_possession:SaveHeroState(hero)
local state = {
items = {},
strTomes = 0,
agiTomes = 0,
intTomes = 0,
moonShards = 0,
hasLuoshu = false,
abilityPoints = hero:GetAbilityPoints(),
heroLevel = hero:GetLevel(),
baseStr = hero:GetBaseStrength(),
baseAgi = hero:GetBaseAgility(),
baseInt = hero:GetBaseIntellect()
}
self:DebugLog("保存装备:")
for item_slot = DOTA_ITEM_SLOT_1, DOTA_ITEM_SLOT_9 do
local item = hero:GetItemInSlot(item_slot)
if item and item:GetName() ~= "item_hero_possession" then
local itemState = CaptureItemState(item, item_slot)
table.insert(state.items, itemState)
self:DebugLog(" 槽位" .. item_slot .. ": " .. itemState.name ..
" charges=" .. tostring(itemState.currentCharges) ..
" secondary=" .. tostring(itemState.secondaryCharges))
end
end
for item_slot = DOTA_STASH_SLOT_1, DOTA_STASH_SLOT_6 do
local item = hero:GetItemInSlot(item_slot)
if item and item:GetName() ~= "item_hero_possession" then
local itemState = CaptureItemState(item, item_slot)
table.insert(state.items, itemState)
self:DebugLog(" 储藏处" .. item_slot .. ": " .. itemState.name ..
" charges=" .. tostring(itemState.currentCharges) ..
" secondary=" .. tostring(itemState.secondaryCharges))
end
end
local unitName = hero:GetUnitName()
local strTable = CustomNetTables:GetTableValue("player_tome_table", "str_tome_" .. unitName)
state.strTomes = strTable and strTable.str or 0
self:DebugLog("力量书数量: " .. state.strTomes)
local agiTable = CustomNetTables:GetTableValue("player_tome_table", "agi_tome_" .. unitName)
state.agiTomes = agiTable and agiTable.agi or 0
self:DebugLog("敏捷书数量: " .. state.agiTomes)
local intTable = CustomNetTables:GetTableValue("player_tome_table", "int_tome_" .. unitName)
state.intTomes = intTable and intTable.int or 0
self:DebugLog("智力书数量: " .. state.intTomes)
local moonMods = hero:FindAllModifiersByName("modifier_item_moon_shard_datadriven_consumed")
state.moonShards = #moonMods
self:DebugLog("银月数量: " .. state.moonShards)
state.hasLuoshu = hero:HasModifier("modifier_luoshu_tome")
self:DebugLog("洛书状态: " .. tostring(state.hasLuoshu))
return state
end
function item_hero_possession:ApplySnapshot(hero, snapshot, duration, uniqueId)
if not hero or not IsValidEntity(hero) then
self:DebugLog("错误: hero对象无效,无法应用快照")
return false
end
if not hero:IsAlive() then
self:DebugLog("错误: 英雄已死亡,无法应用快照")
return false
end
self:DebugLog("移除所有原装备:")
for item_slot = DOTA_ITEM_SLOT_1, DOTA_ITEM_SLOT_9 do
local item = hero:GetItemInSlot(item_slot)
if item and IsValidEntity(item) and not IsPossessionItem(item) then
self:DebugLog(" 移除槽位" .. item_slot .. ": " .. item:GetName())
UTIL_RemoveImmediate(item)
end
end
for item_slot = DOTA_STASH_SLOT_1, DOTA_STASH_SLOT_6 do
local item = hero:GetItemInSlot(item_slot)
if item and IsValidEntity(item) and not IsPossessionItem(item) then
self:DebugLog(" 移除储藏处" .. item_slot .. ": " .. item:GetName())
UTIL_RemoveImmediate(item)
end
end
MoveItemToBackpack(hero, self)
self:DebugLog("添加快照装备:")
local addedSnapshotItems = {}
for _, itemName in pairs(snapshot.items) do
local item = self:SafeAddSnapshotItem(hero, itemName, uniqueId)
if item then
table.insert(addedSnapshotItems, itemName)
self:DebugLog(" 添加: " .. itemName .. " ID: " .. uniqueId)
end
end
local itemLockOk, itemLockMod = pcall(function()
return hero:AddNewModifier(hero, nil, "modifier_item_hero_possession_item_lock", {
duration = duration,
unique_id = uniqueId
})
end)
if not itemLockOk then
self:DebugLog("创建item_lock modifier异常，继续附身但跳过锁定: " .. tostring(itemLockMod))
itemLockMod = nil
end
if itemLockMod then
itemLockMod.snapshotItems = {}
for _, itemName in pairs(addedSnapshotItems) do
itemLockMod.snapshotItems[itemName] = (itemLockMod.snapshotItems[itemName] or 0) + 1
end
itemLockMod.uniqueId = uniqueId
end
self:ApplyAttributeBonus(hero, snapshot, duration, uniqueId)
self:DebugLog("添加Lottery技能:")
local abilityRestoreData = {}
for _, abilityData in pairs(snapshot.lotteryAbilities) do
local abilityName = abilityData.name
local existingAbility = hero:FindAbilityByName(abilityName)
if not existingAbility then
local ability = self:SafeAddSnapshotAbility(hero, abilityName, abilityData.level, uniqueId)
if ability then
table.insert(abilityRestoreData, {
name = abilityName,
removeOnEnd = true
})
self:DebugLog(" 添加: " .. abilityName .. " (等级" .. abilityData.level .. ") ID: " .. uniqueId)
end
else
table.insert(abilityRestoreData, {
name = abilityName,
removeOnEnd = false,
originalLevel = existingAbility:GetLevel()
})
existingAbility:SetLevel(math.max(existingAbility:GetLevel(), abilityData.level))
existingAbility.possessionUniqueId = uniqueId
self:DebugLog(" 技能已存在,更新等级和标记: " .. abilityName)
end
end
local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_morphling/morphling_morph.vpcf",
PATTACH_ABSORIGIN_FOLLOW, hero)
ParticleManager:ReleaseParticleIndex(particle)
hero:EmitSound("Hero_Morphling.Morph")
return abilityRestoreData
end
function item_hero_possession:ApplyAttributeBonus(hero, snapshot, duration, uniqueId)
if not hero or not IsValidEntity(hero) then
self:DebugLog("错误: hero对象无效")
return
end
local TOME_BONUS = 100
local MOON_SHARD_ATTACK_SPEED = 100
local bonusStr = snapshot.strTomes * TOME_BONUS
local bonusAgi = snapshot.agiTomes * TOME_BONUS
local bonusInt = snapshot.intTomes * TOME_BONUS
local bonusAttackSpeed = snapshot.moonShards * MOON_SHARD_ATTACK_SPEED
local luoshuAllStats = 0
local luoshuSpellAmp = 0
local luoshuStatusResist = 0
if snapshot.hasLuoshu then
luoshuAllStats = snapshot.luoshuAllStats or 100
luoshuSpellAmp = 50
luoshuStatusResist = 30
bonusStr = bonusStr + luoshuAllStats
bonusAgi = bonusAgi + luoshuAllStats
bonusInt = bonusInt + luoshuAllStats
self:DebugLog(" 洛书全属性: " .. luoshuAllStats)
self:DebugLog(" 洛书技能增强: " .. luoshuSpellAmp .. "%")
self:DebugLog(" 洛书状态抗性: " .. luoshuStatusResist .. "%")
end
if not self or not self.GetSpecialValueFor then
self:DebugLog("错误: ability对象无效")
return
end
local ok, modifier = pcall(function()
return hero:AddNewModifier(hero, nil, "modifier_item_hero_possession_stats", {
duration = duration,
bonus_str = bonusStr,
bonus_agi = bonusAgi,
bonus_int = bonusInt,
bonus_attack_speed = bonusAttackSpeed,
spell_amp = luoshuSpellAmp,
status_resistance = luoshuStatusResist,
unique_id = uniqueId
})
end)
if not ok then
self:DebugLog("创建属性加成modifier异常: " .. tostring(modifier))
return
end
if modifier then
modifier.uniqueId = uniqueId
self:DebugLog(" 属性加成modifier创建成功, ID: " .. uniqueId)
end
end
function modifier_item_hero_possession:IsHidden()
return true
end
function modifier_item_hero_possession:IsPurgable()
return false
end
function modifier_item_hero_possession:GetEffectName()
return "particles/units/heroes/hero_morphling/morphling_morph.vpcf"
end
function modifier_item_hero_possession:GetEffectAttachType()
return PATTACH_ABSORIGIN_FOLLOW
end
function modifier_item_hero_possession:DeclareFunctions()
return {
MODIFIER_EVENT_ON_DEATH
}
end
function modifier_item_hero_possession:OnCreated(params)
if not IsServer() then return end
self.uniqueId = params.unique_id or ""
self.remainingDuration = nil
self.wasAlive = true
end
function modifier_item_hero_possession:OnDestroy()
if not IsServer() then return end
local parent = self:GetParent()
if not parent or not IsValidEntity(parent) then return end
if not self.savedState or not self.uniqueId then return end
print("[HeroPossession] === 恢复英雄状态 === ID: " .. self.uniqueId)
ClearPossessionOverheadTitle(parent:GetPlayerOwnerID(), self.uniqueId)
for item_slot = DOTA_ITEM_SLOT_1, DOTA_ITEM_SLOT_9 do
local item = parent:GetItemInSlot(item_slot)
if item and IsValidEntity(item) and item.possessionUniqueId == self.uniqueId then
UTIL_RemoveImmediate(item)
end
end
for slot = DOTA_STASH_SLOT_1, DOTA_STASH_SLOT_6 do
local item = parent:GetItemInSlot(slot)
if item and IsValidEntity(item) and item.possessionUniqueId == self.uniqueId then
UTIL_RemoveImmediate(item)
end
end
if self.snapshotItems then
for playerId = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
if PlayerResource:IsValidPlayerID(playerId) then
local otherHero = PlayerResource:GetSelectedHeroEntity(playerId)
if otherHero and IsValidEntity(otherHero) and otherHero ~= parent then
RemoveSnapshotItemsFromHero(otherHero, self.uniqueId, self.snapshotItems, true)
end
end
end
end
ClearHawkeyeTurretActiveModifier(parent)
for _, itemState in pairs(self.savedState.items) do
local itemName = type(itemState) == "table" and itemState.name or itemState
if itemName ~= "item_hero_possession" then
local ok, item = pcall(function()
return RestoreItemState(parent, itemState)
end)
if ok and item then
print("[HeroPossession] 恢复原装备: " .. itemName ..
" charges=" .. tostring(type(itemState) == "table" and itemState.currentCharges or nil) ..
" secondary=" .. tostring(type(itemState) == "table" and itemState.secondaryCharges or nil))
else
print("[HeroPossession] 恢复原装备失败，已跳过: " .. tostring(itemName))
end
end
end
ClearHawkeyeTurretActiveModifier(parent)
local statsMods = parent:FindAllModifiersByName("modifier_item_hero_possession_stats")
for _, mod in pairs(statsMods) do
if mod.uniqueId == self.uniqueId then
mod:Destroy()
break
end
end
if self.addedAbilities then
for _, abilityRestore in pairs(self.addedAbilities) do
local ability = parent:FindAbilityByName(abilityRestore.name)
if ability and ability.possessionUniqueId == self.uniqueId then
if abilityRestore.removeOnEnd then
parent:RemoveAbility(abilityRestore.name)
else
ability:SetLevel(abilityRestore.originalLevel or ability:GetLevel())
ability.possessionUniqueId = nil
end
end
end
end
local itemLockMods = parent:FindAllModifiersByName("modifier_item_hero_possession_item_lock")
for _, mod in pairs(itemLockMods) do
if mod.uniqueId == self.uniqueId then
mod:Destroy()
break
end
end
print("[HeroPossession] 保留当前技能点: " .. tostring(parent:GetAbilityPoints()) ..
" (附身前: " .. tostring(self.savedState.abilityPoints) .. ")")
local particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_morphling/morphling_morph.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
parent
)
ParticleManager:ReleaseParticleIndex(particle)
parent:EmitSound("Hero_Morphling.Morph")
end
function item_hero_possession:RestoreHeroState(hero, savedState, addedAbilities, uniqueId)
self:DebugLog("=== 恢复英雄状态 === ID: " .. uniqueId)
local itemLockMods = hero:FindAllModifiersByName("modifier_item_hero_possession_item_lock")
local targetItemLockMod = nil
for _, mod in pairs(itemLockMods) do
if mod.uniqueId == uniqueId then
targetItemLockMod = mod
break
end
end
if targetItemLockMod and targetItemLockMod.snapshotItems then
local snapshotItems = {}
for k, v in pairs(targetItemLockMod.snapshotItems) do
snapshotItems[k] = v
end
self:DebugLog("移除快照装备:")
for item_slot = DOTA_ITEM_SLOT_1, DOTA_ITEM_SLOT_9 do
local item = hero:GetItemInSlot(item_slot)
if item then
local itemName = item:GetName()
if snapshotItems[itemName] and snapshotItems[itemName] > 0 then
self:DebugLog(" 移除槽位" .. item_slot .. ": " .. itemName)
UTIL_RemoveImmediate(item)
snapshotItems[itemName] = snapshotItems[itemName] - 1
end
end
end
for item_slot = DOTA_STASH_SLOT_1, DOTA_STASH_SLOT_6 do
local item = hero:GetItemInSlot(item_slot)
if item then
local itemName = item:GetName()
if snapshotItems[itemName] and snapshotItems[itemName] > 0 then
self:DebugLog(" 移除储藏处" .. item_slot .. ": " .. itemName)
UTIL_RemoveImmediate(item)
snapshotItems[itemName] = snapshotItems[itemName] - 1
end
end
end
end
self:DebugLog("恢复原装备:")
for _, itemState in pairs(savedState.items) do
local itemName = type(itemState) == "table" and itemState.name or itemState
local ok, item = pcall(function()
if itemName ~= "item_hero_possession" then
return RestoreItemState(hero, itemState)
end
return nil
end)
if ok and item then
self:DebugLog(" 恢复: " .. itemName ..
" charges=" .. tostring(type(itemState) == "table" and itemState.currentCharges or nil) ..
" secondary=" .. tostring(type(itemState) == "table" and itemState.secondaryCharges or nil))
elseif itemName ~= "item_hero_possession" then
self:DebugLog(" 恢复失败，已跳过: " .. tostring(itemName))
end
end
local statsMods = hero:FindAllModifiersByName("modifier_item_hero_possession_stats")
for _, mod in pairs(statsMods) do
if mod.uniqueId == uniqueId then
mod:Destroy()
self:DebugLog("移除属性加成modifier, ID: " .. uniqueId)
break
end
end
self:DebugLog("移除Lottery技能:")
if addedAbilities then
for _, abilityRestore in pairs(addedAbilities) do
local ability = hero:FindAbilityByName(abilityRestore.name)
if ability and ability.possessionUniqueId == uniqueId then
if abilityRestore.removeOnEnd then
hero:RemoveAbility(abilityRestore.name)
self:DebugLog(" 移除: " .. abilityRestore.name .. " ID: " .. uniqueId)
else
ability:SetLevel(abilityRestore.originalLevel or ability:GetLevel())
ability.possessionUniqueId = nil
self:DebugLog(" 恢复技能等级: " .. abilityRestore.name)
end
else
self:DebugLog(" 跳过: " .. abilityRestore.name .. " (属于其他附身实例)")
end
end
end
if targetItemLockMod then
targetItemLockMod:Destroy()
self:DebugLog("移除item_lock modifier, ID: " .. uniqueId)
end
self:DebugLog("保留当前技能点: " .. tostring(hero:GetAbilityPoints()) ..
" (附身前: " .. tostring(savedState.abilityPoints) .. ")")
local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_morphling/morphling_morph.vpcf",
PATTACH_ABSORIGIN_FOLLOW, hero)
ParticleManager:ReleaseParticleIndex(particle)
hero:EmitSound("Hero_Morphling.Morph")
self:DebugLog("播放恢复特效和音效")
end
function modifier_item_hero_possession_stats:IsHidden()
return false
end
function modifier_item_hero_possession_stats:IsPurgable()
return false
end
function modifier_item_hero_possession_stats:GetTexture()
return "item_hero_possession"
end
function modifier_item_hero_possession_stats:OnCreated(params)
if IsServer() then
self.bonus_str = params.bonus_str or 0
self.bonus_agi = params.bonus_agi or 0
self.bonus_int = params.bonus_int or 0
self.bonus_attack_speed = params.bonus_attack_speed or 0
self.spell_amp = params.spell_amp or 0
self.status_resistance = params.status_resistance or 0
self.uniqueId = params.unique_id or ""
self:SetHasCustomTransmitterData(true)
end
end
function modifier_item_hero_possession_stats:AddCustomTransmitterData()
return {
bonus_str = self.bonus_str,
bonus_agi = self.bonus_agi,
bonus_int = self.bonus_int,
bonus_attack_speed = self.bonus_attack_speed,
spell_amp = self.spell_amp,
status_resistance = self.status_resistance
}
end
function modifier_item_hero_possession_stats:HandleCustomTransmitterData(data)
self.bonus_str = data.bonus_str
self.bonus_agi = data.bonus_agi
self.bonus_int = data.bonus_int
self.bonus_attack_speed = data.bonus_attack_speed
self.spell_amp = data.spell_amp
self.status_resistance = data.status_resistance
end
function modifier_item_hero_possession_stats:DeclareFunctions()
return {
MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
MODIFIER_PROPERTY_TOOLTIP,
}
end
function modifier_item_hero_possession_stats:OnTooltip()
return self.bonus_str or 0
end
function modifier_item_hero_possession_stats:OnTooltip2()
return self.bonus_agi or 0
end
function modifier_item_hero_possession_stats:OnTooltip3()
return self.bonus_int or 0
end
function modifier_item_hero_possession_stats:OnTooltip4()
return self.bonus_attack_speed or 0
end
function modifier_item_hero_possession_stats:GetModifierBonusStats_Strength()
return self.bonus_str or 0
end
function modifier_item_hero_possession_stats:GetModifierBonusStats_Agility()
return self.bonus_agi or 0
end
function modifier_item_hero_possession_stats:GetModifierBonusStats_Intellect()
return self.bonus_int or 0
end
function modifier_item_hero_possession_stats:GetModifierAttackSpeedBonus_Constant()
return self.bonus_attack_speed or 0
end
function modifier_item_hero_possession_stats:GetModifierSpellAmplify_Percentage()
return self.spell_amp or 0
end
function modifier_item_hero_possession_stats:GetModifierStatusResistanceStacking()
return self.status_resistance or 0
end
function modifier_item_hero_possession_item_lock:IsHidden()
return true
end
function modifier_item_hero_possession_item_lock:IsPurgable()
return false
end
function modifier_item_hero_possession_item_lock:GetAttributes()
return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_item_hero_possession_item_lock:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ORDER
}
end
function modifier_item_hero_possession_item_lock:OnCreated(params)
if not IsServer() then return end
self.uniqueId = params.unique_id or ""
local hero = self:GetParent()
if not hero or not IsValidEntity(hero) then return end
self.initialGold = hero:GetGold()
self:StartIntervalThink(1.0)
end
function modifier_item_hero_possession_item_lock:OnIntervalThink()
if not IsServer() then return end
local hero = self:GetParent()
if not hero or not IsValidEntity(hero) then return end
for playerId = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
if PlayerResource:IsValidPlayerID(playerId) then
local otherHero = PlayerResource:GetSelectedHeroEntity(playerId)
if otherHero and IsValidEntity(otherHero) then
local isOwner = otherHero == hero
local transferredToOtherHero = false
if not isOwner then
for slot = DOTA_ITEM_SLOT_1, DOTA_ITEM_SLOT_9 do
local item = otherHero:GetItemInSlot(slot)
if IsSnapshotItem(item, self.uniqueId, self.snapshotItems) then
transferredToOtherHero = true
break
end
end
end
RemoveSnapshotItemsFromHero(otherHero, self.uniqueId, self.snapshotItems, not isOwner)
if transferredToOtherHero then
GameRules:SendCustomMessage("英灵装备不可转移给其他玩家，已自动移除", 0, 0)
end
end
end
end
if RemoveSnapshotItemsFromAllCouriers(self.uniqueId, self.snapshotItems) then
GameRules:SendCustomMessage("英灵装备不可转移给信使，已自动移除", 0, 0)
end
local droppedItems = Entities:FindAllByClassname("dota_item_drop")
for _, itemDrop in pairs(droppedItems) do
if itemDrop and IsValidEntity(itemDrop) then
local item = itemDrop:GetContainedItem()
if item and IsValidEntity(item) and self.snapshotItems and self.snapshotItems[item:GetName()]
and item.possessionUniqueId == self.uniqueId then
print("[HeroPossession] 清理地面掉落的快照装备: " .. item:GetName())
UTIL_RemoveImmediate(item)
itemDrop:RemoveSelf()
end
end
end
local currentGold = hero:GetGold()
local goldDiff = currentGold - self.initialGold
if goldDiff > 1000 then
for itemName, count in pairs(self.snapshotItems or {}) do
local item = hero:FindItemInInventory(itemName)
if not item then
hero:ModifyGold(-goldDiff, false, DOTA_ModifyGold_Unspecified)
GameRules:SendCustomMessage(
"大胆，竟然有人试图出售英灵的装备，没收违法所得" .. goldDiff .. "金币，所出售装备不予返还", 0, 0)
self.snapshotItems[itemName] = nil
self.initialGold = hero:GetGold()
return
end
end
end
self.initialGold = currentGold
end
function modifier_item_hero_possession_item_lock:OnOrder(params)
if not IsServer() then return end
local hero = self:GetParent()
if not hero or not IsValidEntity(hero) then return end
local order = params.order_type
local ability = params.ability
if not ability or not ability.GetAbilityName then return end
if order == DOTA_UNIT_ORDER_DROP_ITEM then
local itemName = ability:GetAbilityName()
if not self.snapshotItems or not self.snapshotItems[itemName] then
return
end
local uniqueId = self.uniqueId
Timers:CreateTimer(0.01, function()
if IsValidHandle(ability) and ability:GetContainer() == nil
and ability.possessionUniqueId == uniqueId then
UTIL_RemoveImmediate(ability)
end
end)
return
end
end
function modifier_item_hero_possession_item_lock:OnDestroy()
if not IsServer() then return end
local hero = self:GetParent()
if not hero or not IsValidEntity(hero) then return end
local snapshotItems = {}
for itemName, count in pairs(self.snapshotItems or {}) do
snapshotItems[itemName] = count
end
Timers:CreateTimer(0.1, function()
if not hero or not IsValidEntity(hero) then return end
RemoveSnapshotItemsFromAllCouriers(self.uniqueId, snapshotItems)
local droppedItems = Entities:FindAllByClassname("dota_item_drop")
for _, itemDrop in pairs(droppedItems) do
if itemDrop and IsValidEntity(itemDrop) then
local item = itemDrop:GetContainedItem()
if item and IsValidEntity(item) then
local itemName = item:GetName()
if snapshotItems[itemName] then
UTIL_RemoveImmediate(item)
itemDrop:RemoveSelf()
end
end
end
end
end)
end
function modifier_item_hero_possession_prefetch:IsHidden()
return true
end
function modifier_item_hero_possession_prefetch:IsPurgable()
return false
end
function modifier_item_hero_possession_prefetch:OnCreated()
if not IsServer() then return end
self.prefetched = false
self:StartIntervalThink(0.2)
end
function modifier_item_hero_possession_prefetch:OnIntervalThink()
if self.prefetched then
self:StartIntervalThink(-1)
return
end
local ability = self:GetAbility()
local parent = self:GetParent()
if not ability or not parent or not IsValidEntity(parent) or not parent:IsRealHero() then
return
end
ability:EnsureSnapshotCached(parent)
self.prefetched = true
self:StartIntervalThink(-1)
end
