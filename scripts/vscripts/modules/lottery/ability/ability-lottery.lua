local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local __TS__Number = ____lualib.__TS__Number
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local ____player_2Dmember_2Dpoint = require("api.player-member-point")
local PlayerMemberPointApi = ____player_2Dmember_2Dpoint.PlayerMemberPointApi
local ____player = require("api.player")
local MemberLevel = ____player.MemberLevel
local Player = ____player.Player
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____net_2Dtable_2Dhelper = require("modules.helper.net-table-helper")
local NetTableHelper = ____net_2Dtable_2Dhelper.NetTableHelper
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____ability_2Dlottery_2Dhelper = require("modules.lottery.ability.ability-lottery-helper")
local AbilityLotteryHelper = ____ability_2Dlottery_2Dhelper.AbilityLotteryHelper
local ____ability_2Ditem_2Dtype = require("modules.lottery.ability.ability-item-type")
local AbilityItemTypes = ____ability_2Ditem_2Dtype.AbilityItemTypes
local ____lottery_2Dabilities = require("modules.lottery.ability.lottery-abilities")
local abilityTiersActive = ____lottery_2Dabilities.abilityTiersActive
local abilityTiersPassive = ____lottery_2Dabilities.abilityTiersPassive
____exports.AbilityLottery = __TS__Class()
local AbilityLottery = ____exports.AbilityLottery
AbilityLottery.name = "AbilityLottery"
function AbilityLottery.prototype.____constructor(self)
self.randomCountBase = 6
self.randomCountExtra = 2
self.paidRefreshCosts = {10, 20, 30, 50}
self.maxPaidRefreshCount = 5
ListenToGameEvent(
"game_rules_state_change",
function()
if GameRules:State_Get() == DOTA_GAMERULES_STATE_PRE_GAME then
Timers:CreateTimer(
2,
function()
self:initLotteryAll()
end
)
end
end,
nil
)
CustomGameEventManager:RegisterListener(
"lottery_pick_ability",
function(userId, event)
self:pickAbility(userId, event)
end
)
CustomGameEventManager:RegisterListener(
"lottery_refresh_ability",
function(userId, event)
self:refreshAbility(userId, event)
end
)
CustomGameEventManager:RegisterListener(
"lottery_reset_ability",
function(userId, event)
self:resetAbility(userId, event)
end
)
end
function AbilityLottery.prototype.initLotteryAll(self)
print("initLotteryAll")
PlayerHelper:ForEachPlayer(function(____, playerId)
if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
return
end
self:initLottery(playerId)
end)
end
function AbilityLottery.prototype.initLottery(self, playerId)
self:randomAbilityForPlayer(playerId, AbilityItemTypes.Active)
self:randomAbilityForPlayer(playerId, AbilityItemTypes.Passive)
self:randomAbilityForPlayer(playerId, AbilityItemTypes.Passive2)
CustomNetTables:SetTableValue(
"lottery_status",
tostring(PlayerResource:GetSteamAccountID(playerId)),
{
isActiveAbilityRefreshed = false,
isPassiveAbilityRefreshed = false,
isPassiveAbilityRefreshed2 = false,
activePaidRefreshCount = 0,
passivePaidRefreshCount = 0,
passivePaidRefreshCount2 = 0,
abilityResettableCount = 0,
showAbilityResetButton = false
}
)
end
function AbilityLottery.prototype.getAbilityTableName(self, abilityType)
if abilityType == AbilityItemTypes.Active then
return "lottery_active_abilities"
end
if abilityType == AbilityItemTypes.Passive then
return "lottery_passive_abilities"
end
return "lottery_passive_abilities_2"
end
function AbilityLottery.prototype.getExcludedAbilityNames(self, abilityType, steamAccountID)
local abilityTable = self:getAbilityTableName(abilityType)
local lotteryAbilitiesRaw = CustomNetTables:GetTableValue(abilityTable, steamAccountID)
local executedNames = lotteryAbilitiesRaw ~= nil and __TS__ArrayMap(
__TS__ObjectValues(lotteryAbilitiesRaw),
function(____, item) return item.name end
) or ({})
if abilityType == AbilityItemTypes.Passive or abilityType == AbilityItemTypes.Passive2 then
local otherTable = abilityType == AbilityItemTypes.Passive and "lottery_passive_abilities_2" or "lottery_passive_abilities"
local otherAbilitiesRaw = CustomNetTables:GetTableValue(otherTable, steamAccountID)
if otherAbilitiesRaw ~= nil then
local otherNames = __TS__ArrayMap(
__TS__ObjectValues(otherAbilitiesRaw),
function(____, item) return item.name end
)
__TS__ArrayPushArray(executedNames, otherNames)
end
end
return executedNames
end
function AbilityLottery.prototype.randomAbilityForPlayer(self, playerId, abilityType)
local abilityTable = self:getAbilityTableName(abilityType)
local abilityTiers = abilityType == AbilityItemTypes.Active and abilityTiersActive or abilityTiersPassive
local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
local executedNames = self:getExcludedAbilityNames(abilityType, steamAccountID)
local abilityLotteryResults = AbilityLotteryHelper:getRandomAbilities(abilityTiers, self.randomCountBase, hero, executedNames)
local memberLevel = Player:GetMemberLevel(__TS__Number(steamAccountID))
if memberLevel >= MemberLevel.PREMIUM then
local extraAbilities = AbilityLotteryHelper:getRandomAbilities(
abilityTiers,
self.randomCountExtra,
hero,
executedNames,
true
)
__TS__ArrayPushArray(abilityLotteryResults, extraAbilities)
end
if #abilityLotteryResults > 0 then
local specifiedAbilityInfo = self:getSpecifiedAbilityByFixedAbility()
if specifiedAbilityInfo then
local specifiedAbility = specifiedAbilityInfo.ability
local isActive = specifiedAbilityInfo.isActive
if isActive and abilityType == AbilityItemTypes.Active then
abilityLotteryResults[1] = specifiedAbility
elseif not isActive and abilityType == AbilityItemTypes.Passive then
abilityLotteryResults[1] = specifiedAbility
end
end
if IsInToolsMode() then
if abilityType == AbilityItemTypes.Active then
abilityLotteryResults[1] = {name = "pudge_meat_hook_lua", level = 2}
end
end
end
CustomNetTables:SetTableValue(abilityTable, steamAccountID, abilityLotteryResults)
end
function AbilityLottery.prototype.getSpecifiedAbilityByFixedAbility(self)
local fixedAbility = GameRules.Option.fixedAbility
if fixedAbility == "none" then
return nil
end
for ____, tier in ipairs(abilityTiersPassive) do
if __TS__ArrayIncludes(tier.names, fixedAbility) then
return {ability = {name = fixedAbility, level = tier.level}, isActive = false}
end
end
for ____, tier in ipairs(abilityTiersActive) do
if __TS__ArrayIncludes(tier.names, fixedAbility) then
return {ability = {name = fixedAbility, level = tier.level}, isActive = true}
end
end
return nil
end
function AbilityLottery.prototype.pickAbility(self, userId, event)
local steamAccountID = tostring(PlayerResource:GetSteamAccountID(event.PlayerID))
local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
local abilityType = event.type
if abilityType == AbilityItemTypes.Active and lotteryStatus.activeAbilityName then
print("已经抽取过主动技能")
return
end
if abilityType == AbilityItemTypes.Passive and lotteryStatus.passiveAbilityName then
print("已经抽取过被动技能")
return
end
if abilityType == AbilityItemTypes.Passive2 and lotteryStatus.passiveAbilityName2 then
print("已经抽取过第二个被动技能")
return
end
local hero = PlayerResource:GetSelectedHeroEntity(event.PlayerID)
if not hero then
return
end
hero:AddAbility(event.name)
if abilityType == AbilityItemTypes.Active then
lotteryStatus.activeAbilityName = event.name
lotteryStatus.activeAbilityLevel = event.level
elseif abilityType == AbilityItemTypes.Passive then
lotteryStatus.passiveAbilityName = event.name
lotteryStatus.passiveAbilityLevel = event.level
elseif abilityType == AbilityItemTypes.Passive2 then
lotteryStatus.passiveAbilityName2 = event.name
lotteryStatus.passiveAbilityLevel2 = event.level
end
CustomNetTables:SetTableValue("lottery_status", steamAccountID, lotteryStatus)
end
function AbilityLottery.prototype.refreshAbility(self, userId, event)
local steamAccountID = tostring(PlayerResource:GetSteamAccountID(event.PlayerID))
local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
local abilityType = event.type
if abilityType ~= AbilityItemTypes.Active and abilityType ~= AbilityItemTypes.Passive and abilityType ~= AbilityItemTypes.Passive2 then
print("刷新技能类型错误")
return
end
local pickedName = self:getPickedName(lotteryStatus, abilityType)
if pickedName then
print("已经抽取过技能，不能刷新")
return
end
if not Player:IsMemberStatic(__TS__Number(steamAccountID)) then
print("非会员不能刷新")
return
end
local isRefreshed = self:isSlotRefreshed(lotteryStatus, abilityType)
if not isRefreshed then
self:randomAbilityForPlayer(event.PlayerID, abilityType)
self:setSlotRefreshed(lotteryStatus, abilityType, true)
CustomNetTables:SetTableValue("lottery_status", steamAccountID, lotteryStatus)
return
end
if ApiClient:IsLocalhost() then
print("非官方服务器不能付费刷新")
return
end
local paidCount = self:getSlotPaidCount(lotteryStatus, abilityType)
if paidCount >= self.maxPaidRefreshCount then
print("付费刷新次数已用完")
return
end
local cost = self:getPaidRefreshCost(paidCount)
local steamId = __TS__Number(steamAccountID)
if Player:GetUseableMemberPoint(steamId) < cost then
print("会员积分不足，无法付费刷新")
return
end
Player:DeductUseableMemberPoint(steamId, cost)
PlayerMemberPointApi:UseMemberPoint(steamId, cost, "lottery_refresh_ability")
self:randomAbilityForPlayer(event.PlayerID, abilityType)
self:setSlotPaidCount(lotteryStatus, abilityType, paidCount + 1)
CustomNetTables:SetTableValue("lottery_status", steamAccountID, lotteryStatus)
end
function AbilityLottery.prototype.getPaidRefreshCost(self, paidCount)
local index = math.min(paidCount, #self.paidRefreshCosts - 1)
return self.paidRefreshCosts[index + 1]
end
function AbilityLottery.prototype.getPickedName(self, lotteryStatus, abilityType)
if abilityType == AbilityItemTypes.Active then
return lotteryStatus.activeAbilityName
end
if abilityType == AbilityItemTypes.Passive then
return lotteryStatus.passiveAbilityName
end
return lotteryStatus.passiveAbilityName2
end
function AbilityLottery.prototype.isSlotRefreshed(self, lotteryStatus, abilityType)
if abilityType == AbilityItemTypes.Active then
return lotteryStatus.isActiveAbilityRefreshed
end
if abilityType == AbilityItemTypes.Passive then
return lotteryStatus.isPassiveAbilityRefreshed
end
return lotteryStatus.isPassiveAbilityRefreshed2
end
function AbilityLottery.prototype.setSlotRefreshed(self, lotteryStatus, abilityType, value)
if abilityType == AbilityItemTypes.Active then
lotteryStatus.isActiveAbilityRefreshed = value
elseif abilityType == AbilityItemTypes.Passive then
lotteryStatus.isPassiveAbilityRefreshed = value
else
lotteryStatus.isPassiveAbilityRefreshed2 = value
end
end
function AbilityLottery.prototype.getSlotPaidCount(self, lotteryStatus, abilityType)
if abilityType == AbilityItemTypes.Active then
return lotteryStatus.activePaidRefreshCount
end
if abilityType == AbilityItemTypes.Passive then
return lotteryStatus.passivePaidRefreshCount
end
return lotteryStatus.passivePaidRefreshCount2
end
function AbilityLottery.prototype.setSlotPaidCount(self, lotteryStatus, abilityType, value)
if abilityType == AbilityItemTypes.Active then
lotteryStatus.activePaidRefreshCount = value
elseif abilityType == AbilityItemTypes.Passive then
lotteryStatus.passivePaidRefreshCount = value
else
lotteryStatus.passivePaidRefreshCount2 = value
end
end
function AbilityLottery.prototype.InitAbilityReset(self, playerId)
local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
local currentCount = lotteryStatus.abilityResettableCount or 0
lotteryStatus.abilityResettableCount = currentCount + 1
lotteryStatus.showAbilityResetButton = true
CustomNetTables:SetTableValue("lottery_status", steamAccountID, lotteryStatus)
return true
end
function AbilityLottery.prototype.resetAbility(self, userId, event)
local playerId = event.PlayerID
local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
local abilityType = event.type
print("[Lottery] resetAbilityRow called for type: " .. abilityType)
local resetCount = lotteryStatus.abilityResettableCount or 0
if resetCount <= 0 then
print("[Lottery] No ability reset count available")
return
end
local pickedAbilityName
if abilityType == AbilityItemTypes.Active then
pickedAbilityName = lotteryStatus.activeAbilityName
elseif abilityType == AbilityItemTypes.Passive then
pickedAbilityName = lotteryStatus.passiveAbilityName
elseif abilityType == AbilityItemTypes.Passive2 then
pickedAbilityName = lotteryStatus.passiveAbilityName2
else
print("[Lottery] Ability type error")
return
end
if not pickedAbilityName then
print("[Lottery] No ability picked for this row")
return
end
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
if not hero then
print("[Lottery] Hero not found")
return
end
local oldAbility = hero:FindAbilityByName(pickedAbilityName)
if oldAbility then
local abilityPoints = oldAbility:GetLevel()
hero:RemoveAbility(pickedAbilityName)
if abilityPoints > 0 then
hero:SetAbilityPoints(hero:GetAbilityPoints() + abilityPoints)
end
print((("[Lottery] Removed ability: " .. pickedAbilityName) .. ", add ability points: ") .. tostring(abilityPoints))
end
if abilityType == AbilityItemTypes.Active then
lotteryStatus.activeAbilityName = nil
lotteryStatus.activeAbilityLevel = nil
lotteryStatus.isActiveAbilityRefreshed = false
lotteryStatus.activePaidRefreshCount = 0
elseif abilityType == AbilityItemTypes.Passive then
lotteryStatus.passiveAbilityName = nil
lotteryStatus.passiveAbilityLevel = nil
lotteryStatus.isPassiveAbilityRefreshed = false
lotteryStatus.passivePaidRefreshCount = 0
elseif abilityType == AbilityItemTypes.Passive2 then
lotteryStatus.passiveAbilityName2 = nil
lotteryStatus.passiveAbilityLevel2 = nil
lotteryStatus.isPassiveAbilityRefreshed2 = false
lotteryStatus.passivePaidRefreshCount2 = 0
end
self:randomAbilityForPlayer(playerId, abilityType)
lotteryStatus.abilityResettableCount = resetCount - 1
print("[Lottery] Ability reset count decreased to: " .. tostring(lotteryStatus.abilityResettableCount))
CustomNetTables:SetTableValue("lottery_status", steamAccountID, lotteryStatus)
print("[Lottery] resetAbilityRow completed")
end
AbilityLottery = __TS__DecorateLegacy({reloadable}, AbilityLottery)
____exports.AbilityLottery = AbilityLottery
_G.InitAbilityReset = function(____, playerId)
return GameRules.Lottery.Ability:InitAbilityReset(playerId)
end
return ____exports
