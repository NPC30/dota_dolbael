if BotItemThink == nil then
print("Bot Item Think initialize!")
_G.BotItemThink = class({})
end
BotItemThink.activeItemCache = BotItemThink.activeItemCache or {}
BotItemThink.enemyHeroSearchCache = BotItemThink.enemyHeroSearchCache or {}
function BotItemThink:BeginUseActiveItem(hHero)
local key = BotItemThink:GetHeroItemCacheKey(hHero)
BotItemThink.enemyHeroSearchCache[key] = nil
end
function BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, iRange)
local key = BotItemThink:GetHeroItemCacheKey(hHero)
local rangeKey = math.floor(iRange)
local now = GameRules:GetGameTime()
local heroCache = BotItemThink.enemyHeroSearchCache[key]
if heroCache == nil then
heroCache = {}
BotItemThink.enemyHeroSearchCache[key] = heroCache
end
local cached = heroCache[rangeKey]
if cached and now < cached.nextRefreshTime then
return cached.units
end
local units = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
heroCache[rangeKey] = {
units = units,
nextRefreshTime = now + 0.55
}
return units
end
function BotItemThink:UseBkbItems(tUsableItems, hHero)
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_black_king_bar_2") then
return true
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_flight_bar") then
return true
end
return BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_beast_shield")
end
function BotItemThink:FindVisibleEnemyHeroesNoRange(hHero)
local heroes = {}
for playerId = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
if PlayerResource:IsValidPlayerID(playerId) and PlayerResource:GetTeam(playerId) ~= hHero:GetTeamNumber() then
local hEnemy = PlayerResource:GetSelectedHeroEntity(playerId)
if hEnemy and not hEnemy:IsNull() and hEnemy:IsAlive() and hHero:CanEntityBeSeenByMyTeam(hEnemy) then
heroes[#heroes + 1] = hEnemy
end
end
end
return heroes
end
function BotItemThink:TryUseBkbOnThreatCooldown(tUsableItems, hHero)
local now = GameRules:GetDOTATime(false, false)
if hHero.bot_next_bkb_threat_check_time and now < hHero.bot_next_bkb_threat_check_time then
return false
end
local healthPercent = hHero:GetHealthPercent()
if healthPercent >= 90 or hHero:HasModifier("modifier_black_king_bar_immune") then
return false
end
if not BotItemThink:IsItemCanUse(tUsableItems, "item_black_king_bar_2") and not BotItemThink:IsItemCanUse(tUsableItems, "item_flight_bar") and not BotItemThink:IsItemCanUse(tUsableItems, "item_beast_shield") then
return false
end
hHero.bot_next_bkb_threat_check_time = now + 5
local tEnemyHeroes = BotItemThink:FindVisibleEnemyHeroesNoRange(hHero)
if #tEnemyHeroes == 0 then
return false
end
for i = 1, #tEnemyHeroes do
local hEnemy = tEnemyHeroes[i]
if hEnemy and not hEnemy:IsNull() and hEnemy:IsAlive() and hEnemy:GetAttackTarget() == hHero then
if RandomInt(1, 100) <= 20 then
return BotItemThink:UseBkbItems(tUsableItems, hHero)
end
return false
end
end
return false
end
function BotItemThink:UseActiveItem(hHero)
BotItemThink:BeginUseActiveItem(hHero)
local tUsableItems = BotItemThink:GetUsableItems(hHero)
if BotItemThink:IsItemCanUse(tUsableItems, "item_holy_locket") then
local iRange = GetFullCastRange(hHero, tUsableItems["item_holy_locket"])
local tTeamHeroes = BotThink:FindFriendHeroesInRangeAndVisible(hHero, iRange)
local iCount = #tTeamHeroes
for i = 1, iCount do
local hTeamHero = tTeamHeroes[i]
if hTeamHero:GetHealthPercent() < 40 then
if BotItemThink:UseItemOnTarget(tUsableItems, hHero, "item_holy_locket", hTeamHero) then
return true
end
end
end
end
if BotItemThink:IsItemCanUse(tUsableItems, "item_orb_of_the_brine") then
local iRange = GetFullCastRange(hHero, tUsableItems["item_orb_of_the_brine"])
local tTeamHeroes = BotThink:FindFriendHeroesInRangeAndVisible(hHero, iRange)
local iCount = #tTeamHeroes
for i = 1, iCount do
local hTeamHero = tTeamHeroes[i]
if hTeamHero:GetHealthPercent() < 40 then
if BotItemThink:UseItemOnTarget(tUsableItems, hHero, "item_orb_of_the_brine", hTeamHero) then
return true
end
end
end
end
if BotItemThink:IsItemCanUse(tUsableItems, "item_saint_orb") then
local iRange = GetFullCastRange(hHero, tUsableItems["item_saint_orb"])
local tTeamHeroes = BotThink:FindFriendHeroesInRangeAndVisible(hHero, iRange)
local iCount = #tTeamHeroes
for i = 1, iCount do
local hTeamHero = tTeamHeroes[i]
if hTeamHero:GetHealthPercent() < 80 then
if BotItemThink:UseItemOnTarget(tUsableItems, hHero, "item_saint_orb", hTeamHero) then
return true
end
end
end
end
if BotItemThink:IsItemCanUse(tUsableItems, "item_abyssal_blade_v2") then
local iRandom = RandomInt(1, 100)
local usePercent = 20
if iRandom <= usePercent and hHero:GetHealthPercent() > 15 then
local iRange = GetFullCastRange(hHero, tUsableItems["item_abyssal_blade_v2"])
local tAllHeroes = BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, iRange)
if #tAllHeroes > 0 then
local hTarget = tAllHeroes[1]
if BotItemThink:UseItemOnTarget(tUsableItems, hHero, "item_abyssal_blade_v2", hTarget) then
return true
end
end
end
end
if BotItemThink:IsItemCanUse(tUsableItems, "item_forbidden_blade") then
local iRandom = RandomInt(1, 100)
local usePercent = 20
if iRandom <= usePercent and hHero:GetHealthPercent() > 15 then
local iRange = GetFullCastRange(hHero, tUsableItems["item_forbidden_blade"])
local tAllHeroes = BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, iRange)
if #tAllHeroes > 0 then
local hTarget = tAllHeroes[1]
if BotItemThink:UseItemOnTarget(tUsableItems, hHero, "item_forbidden_blade", hTarget) then
return true
end
end
end
end
if BotItemThink:UseItemOnEnemyNear(tUsableItems, hHero, "item_blue_fantasy") then
return true
end
if BotItemThink:UseItemOnEnemyNear(tUsableItems, hHero, "item_shadow_judgment") then
return true
end
if BotItemThink:UseItemOnEnemyNear(tUsableItems, hHero, "item_sheepstick") then
return true
end
if BotItemThink:UseItemOnEnemyNear(tUsableItems, hHero, "item_necronomicon_staff") then
return true
end
if BotItemThink:UseItemOnEnemyNear(tUsableItems, hHero, "item_ethereal_blade") then
return true
end
if BotItemThink:UseItemOnEnemyNear(tUsableItems, hHero, "item_dagon") then
return true
end
if BotItemThink:UseItemOnEnemyNear(tUsableItems, hHero, "item_dagon_2") then
return true
end
if BotItemThink:UseItemOnEnemyNear(tUsableItems, hHero, "item_dagon_3") then
return true
end
if BotItemThink:UseItemOnEnemyNear(tUsableItems, hHero, "item_dagon_4") then
return true
end
if BotItemThink:UseItemOnEnemyNear(tUsableItems, hHero, "item_dagon_5") then
return true
end
if BotItemThink:UseItemOnEnemyNear(tUsableItems, hHero, "item_shadow_impact") then
return true
end
if BotItemThink:IsItemCanUse(tUsableItems, "item_heavens_halberd_v2") then
local iRange = GetFullCastRange(hHero, tUsableItems["item_heavens_halberd_v2"])
local tAllHeroes = BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, iRange)
if #tAllHeroes > 1 then
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_heavens_halberd_v2") then
return true
end
end
end
if BotItemThink:IsItemCanUse(tUsableItems, "item_jump_jump_jump") then
if hHero:GetHealthPercent() > 20 then
local iRange = GetFullCastRange(hHero, tUsableItems["item_jump_jump_jump"])
local tAllHeroes = BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, iRange)
if #tAllHeroes > 0 then
local hTarget = tAllHeroes[1]
if BotItemThink:UseItemOnPostion(tUsableItems, hHero, "item_jump_jump_jump", hTarget) then
return true
end
end
end
end
if BotItemThink:IsItemCanUse(tUsableItems, "item_flight_bar") then
if hHero:GetHealthPercent() > 20 then
local iRange = GetFullCastRange(hHero, tUsableItems["item_flight_bar"])
local tAllHeroes = BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, iRange)
if #tAllHeroes > 0 then
local hTarget = tAllHeroes[1]
if BotItemThink:UseItemOnPostion(tUsableItems, hHero, "item_flight_bar", hTarget) then
return true
end
end
end
end
if BotItemThink:IsItemCanUse(tUsableItems, "item_gungir_2") then
local iRange = GetFullCastRange(hHero, tUsableItems["item_gungir_2"])
local tAllHeroes = BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, iRange)
if #tAllHeroes > 0 then
local hTarget = tAllHeroes[1]
if BotItemThink:UseItemOnPostion(tUsableItems, hHero, "item_gungir_2", hTarget) then
return true
end
end
end
if BotItemThink:IsItemCanUse(tUsableItems, "item_forbidden_staff") then
local iRange = GetFullCastRange(hHero, tUsableItems["item_forbidden_staff"])
local tAllHeroes = BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, iRange)
if #tAllHeroes > 0 then
local hTarget = tAllHeroes[1]
if BotItemThink:UseItemOnPostion(tUsableItems, hHero, "item_forbidden_staff", hTarget) then
return true
end
end
end
local searchRange = 1200
if BotItemThink:TryUseBkbOnThreatCooldown(tUsableItems, hHero) then
return true
end
local tAllHeroes = BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, searchRange)
if #tAllHeroes == 0 then
return false
end
if hHero:GetHealthPercent() < 99 then
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_blade_mail_2") then
return true
end
end
if hHero:GetHealthPercent() < 99 then
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_force_field_ultra") then
return true
end
end
if hHero:GetHealthPercent() < 99 then
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_beast_armor") then
return true
end
end
if hHero:GetHealthPercent() < 90 then
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_insight_armor") then
return true
end
end
if hHero:GetHealthPercent() < 50 then
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_undying_heart") then
return true
end
end
if hHero:GetHealthPercent() < 50 then
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_withered_spring") then
return true
end
end
if hHero:GetHealthPercent() < 50 then
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_silver_edge_2") then
return true
end
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_adi_king") then
return true
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_adi_king_plus") then
return true
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_hawkeye_fighter") then
return true
end
if hHero:GetHealthPercent() < 90 then
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_force_field") then
return true
end
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_magic_scepter") then
return true
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_hallowed_scepter") then
return true
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_magic_abyss_staff") then
return true
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_magic_sword") then
return true
end
searchRange = 900
tAllHeroes = BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, searchRange)
if #tAllHeroes == 0 then
return false
end
if hHero:GetHealthPercent() < 60 then
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_satanic_2") then
return true
end
end
if hHero:GetHealthPercent() < 60 then
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_dracula_mask") then
return true
end
end
if hHero:GetHealthPercent() < 99 then
if BotItemThink:UseBkbItems(tUsableItems, hHero) then
return true
end
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_manta_1") then
return true
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_wasp_despotic") then
return true
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_wasp_callous") then
return true
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_wasp_golden") then
return true
end
searchRange = 600
tAllHeroes = BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, searchRange)
if #tAllHeroes == 0 then
return false
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_shivas_guard_2") then
return true
end
if BotItemThink:IsItemCanUse(tUsableItems, "item_hurricane_pike_2") then
local itemUseCastRange = 600
tAllHeroes = BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, itemUseCastRange)
if #tAllHeroes > 0 then
if BotItemThink:UseItemOnTarget(tUsableItems, hHero, "item_hurricane_pike_2", tAllHeroes[1]) then
return true
end
end
end
if BotItemThink:IsItemCanUse(tUsableItems, "item_refresher") or BotItemThink:IsItemCanUse(tUsableItems, "item_refresh_core") or BotItemThink:IsItemCanUse(tUsableItems, "item_time_gem") then
local cooldownThreshold = 60
if BotThink:GetCooldownTotal(hHero) > cooldownThreshold then
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_refresher") then
return true
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_refresh_core") then
return true
end
if BotItemThink:UseItemNoTarget(tUsableItems, hHero, "item_time_gem") then
return true
end
end
end
return false
end
function BotItemThink:GetHeroItemCacheKey(hHero)
return hHero:GetEntityIndex()
end
function BotItemThink:InvalidateItemCache(hHero)
BotItemThink.activeItemCache[BotItemThink:GetHeroItemCacheKey(hHero)] = nil
end
function BotItemThink:IsItemReady(hHero, hItem)
if not hItem then
return false
end
if hItem.IsNull and hItem:IsNull() then
return false
end
if hItem:GetCooldownTimeRemaining() > 0 then
return false
end
if hHero:GetMana() < hItem:GetManaCost(-1) then
return false
end
return true
end
function BotItemThink:GetUsableItems(hHero)
local fNow = GameRules:GetGameTime()
local iCacheKey = BotItemThink:GetHeroItemCacheKey(hHero)
local tCached = BotItemThink.activeItemCache[iCacheKey]
if tCached and fNow < tCached.nextRefreshTime then
return tCached.items
end
local nCurrentMana = hHero:GetMana()
local tUsableItems = {}
local fNextRefreshDelay = 2
for i = 0, 5 do
local hItem = hHero:GetItemInSlot(i)
if hItem then
local sItemName = hItem:GetName()
local fCooldownRemaining = hItem:GetCooldownTimeRemaining()
if fCooldownRemaining == 0 then
local nItemManaCost = hItem:GetManaCost(-1)
if nCurrentMana >= nItemManaCost then
tUsableItems[sItemName] = hItem
fNextRefreshDelay = math.min(fNextRefreshDelay, 0.4)
else
fNextRefreshDelay = math.min(fNextRefreshDelay, 0.4)
end
else
fNextRefreshDelay = math.min(fNextRefreshDelay, math.max(0.4, fCooldownRemaining))
end
end
end
BotItemThink.activeItemCache[iCacheKey] = {
items = tUsableItems,
nextRefreshTime = fNow + math.min(fNextRefreshDelay, 2)
}
return tUsableItems
end
function BotItemThink:UseItemNoTarget(tUsableItems, hHero, sItemName)
local hItem = tUsableItems[sItemName]
if BotItemThink:IsItemReady(hHero, hItem) then
hHero:CastAbilityNoTarget(hItem, hHero:GetPlayerOwnerID())
BotItemThink:InvalidateItemCache(hHero)
return true
end
return false
end
function BotItemThink:UseItemOnPostion(tUsableItems, hHero, sItemName, hTarget)
local hItem = tUsableItems[sItemName]
if BotItemThink:IsItemReady(hHero, hItem) then
hHero:CastAbilityOnPosition(hTarget:GetOrigin(), hItem, hHero:GetPlayerOwnerID())
BotItemThink:InvalidateItemCache(hHero)
return true
end
return false
end
function BotItemThink:UseItemOnEnemyNear(tUsableItems, hHero, sItemName)
local hItem = tUsableItems[sItemName]
if hItem then
local iRange = GetFullCastRange(hHero, hItem)
local tAllHeroes = BotItemThink:FindEnemyHeroesInRangeAndVisibleCached(hHero, iRange)
if #tAllHeroes > 0 then
local hTarget = tAllHeroes[1]
if BotItemThink:UseItemOnTarget(tUsableItems, hHero, sItemName, hTarget) then
return true
end
end
end
return false
end
function BotItemThink:UseItemOnTarget(tUsableItems, hHero, sItemName, hTarget)
local hItem = tUsableItems[sItemName]
if BotItemThink:IsItemReady(hHero, hItem) then
hHero:CastAbilityOnTarget(hTarget, hItem, hHero:GetPlayerOwnerID())
BotItemThink:InvalidateItemCache(hHero)
return true
end
return false
end
function BotItemThink:IsItemCanUse(tUsableItems, sItemName)
local hItem = tUsableItems[sItemName]
if hItem then
return true
end
return false
end
