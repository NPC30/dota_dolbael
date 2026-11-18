local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____player = require("api.player")
local Player = ____player.Player
local ____event_2Dentity_2Dkilled = require("modules.event.event-entity-killed")
local TowerPushStatus = ____event_2Dentity_2Dkilled.TowerPushStatus
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
____exports.BotTeam = __TS__Class()
local BotTeam = ____exports.BotTeam
BotTeam.name = "BotTeam"
function BotTeam.prototype.____constructor(self)
self.botPushMin = 5
self.botPushLevel = 10
self.baseBotPushMin = 5
self.pushStarted = false
self.addAmount = 0
self.addAmountBase = 1
self.addAmountPlayerNumberBonus = 0.2
self.addAmountNeedLevel = 0.015
self.refreshInterval = 1
self:initBotPushTime()
self:initAddAmount()
Timers:CreateTimer(
self.refreshInterval,
function()
self:refreshTeamStrategy()
self:addMoneyForBots()
return self.refreshInterval
end
)
end
function BotTeam.prototype.initBotPushTime(self)
if GameRules.Option.midOnlyMode then
self.baseBotPushMin = 1.5
else
self.baseBotPushMin = 5
end
self.botPushMin = self.baseBotPushMin
print("[BotTeam] Base bot push min: " .. tostring(self.baseBotPushMin))
local randomLevel = RandomInt(0, 2)
local requiredLevel = self:getTowerRequiredLevel()
if GameRules.Option.midOnlyMode then
self.botPushLevel = math.floor(requiredLevel / 3) + randomLevel
else
self.botPushLevel = requiredLevel + randomLevel
end
print("[BotTeam] Bot push level: " .. tostring(self.botPushLevel))
end
function BotTeam.prototype.getBotTeamAverageLevel(self)
local totalLevel = 0
local botCount = 0
do
local playerId = 0
while playerId < 24 do
do
if not PlayerResource:IsValidPlayerID(playerId) then
goto __continue15
end
local playerTeam = PlayerResource:GetTeam(playerId)
local isBot = PlayerResource:IsFakeClient(playerId)
if playerTeam == DOTA_TEAM_BADGUYS and isBot then
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
if hero and hero:IsAlive() then
totalLevel = totalLevel + hero:GetLevel()
botCount = botCount + 1
end
end
end
::__continue15::
playerId = playerId + 1
end
end
return botCount > 0 and totalLevel / botCount or 1
end
function BotTeam.prototype.getTowerRequiredLevel(self)
local towerPower = GameRules.Option.towerPower
if towerPower <= 200 then
return 12
elseif towerPower <= 300 then
return 13
elseif towerPower <= 400 then
return 14
else
return 15
end
end
function BotTeam.prototype.calculatePushTierByTowerStatus(self)
if GameRules.Option.midOnlyMode then
return self:calculatePushTierMidOnly()
end
return self:calculatePushTierNormal()
end
function BotTeam.prototype.calculatePushTierNormal(self)
if TowerPushStatus.barrackPushedGood > 5 or TowerPushStatus.barrackPushedBad > 5 then
return -1
elseif TowerPushStatus.barrackPushedGood > 2 or TowerPushStatus.barrackPushedBad > 2 then
return 5
end
if TowerPushStatus.tower3PushedGood >= 2 or TowerPushStatus.tower3PushedBad >= 2 then
return 4
end
if TowerPushStatus.tower2PushedGood >= 2 or TowerPushStatus.tower2PushedBad >= 2 then
return 3
end
if TowerPushStatus.tower1PushedGood >= 2 or TowerPushStatus.tower1PushedBad >= 2 then
return 2
end
return 1
end
function BotTeam.prototype.calculatePushTierMidOnly(self)
if TowerPushStatus.barrackPushedGood >= 1 or TowerPushStatus.barrackPushedBad >= 1 then
return -1
end
if TowerPushStatus.tower3PushedGood >= 1 or TowerPushStatus.tower3PushedBad >= 1 then
return 4
end
if TowerPushStatus.tower2PushedGood >= 1 or TowerPushStatus.tower2PushedBad >= 1 then
return 3
end
if TowerPushStatus.tower1PushedGood >= 1 or TowerPushStatus.tower1PushedBad >= 1 then
return 2
end
return 1
end
function BotTeam.prototype.refreshTeamStrategy(self)
local avgLevel = self:getBotTeamAverageLevel()
local isStartPushForce = avgLevel >= self.botPushLevel
local gameTime = GameRules:GetDOTATime(false, false)
local gameModeEntity = GameRules:GetGameModeEntity()
if gameTime >= self.botPushMin * 4 * 60 then
self.pushStarted = true
gameModeEntity:SetBotsMaxPushTier(-1)
elseif gameTime >= self.botPushMin * 60 or isStartPushForce then
self.pushStarted = true
local pushTier = self:calculatePushTierByTowerStatus()
gameModeEntity:SetBotsMaxPushTier(pushTier)
gameModeEntity:SetBotsInLateGame(true)
gameModeEntity:SetBotsAlwaysPushWithHuman(true)
else
gameModeEntity:SetBotsInLateGame(true)
gameModeEntity:SetBotsAlwaysPushWithHuman(false)
gameModeEntity:SetBotsMaxPushTier(1)
end
end
function BotTeam.prototype.initAddAmount(self)
local playerNumberBonus = Player:GetPlayerCount() * self.addAmountPlayerNumberBonus
local totalLevel = 0
for ____, player in __TS__Iterator(Player.playerInfoMap:values()) do
local seasonLevel = player.seasonLevel or 0
local memberLevel = player.memberLevel or 0
totalLevel = totalLevel + (seasonLevel + memberLevel)
end
local levelBonus = totalLevel * self.addAmountNeedLevel
self.addAmount = math.floor(self.addAmountBase + levelBonus + playerNumberBonus)
print(((((("[BotTeam] Add amount: " .. tostring(self.addAmount)) .. " (playerNumber: ") .. tostring(playerNumberBonus)) .. ", levelBonus: ") .. tostring(levelBonus)) .. ")")
end
function BotTeam.prototype.isAfterPhaseStart(self)
return self.pushStarted
end
function BotTeam.prototype.addMoneyForBots(self)
local gameTime = GameRules:GetDOTATime(false, false)
if gameTime <= 0 then
return
end
PlayerHelper:ForEachPlayer(function(____, playerId)
if not PlayerHelper:IsBotPlayerByPlayerId(playerId) then
return
end
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
if not hero then
return
end
local multiplier = GameRules.GoldXPFilter:getPlayerGoldXpMultiplier(playerId)
local addMoney = multiplier * self.addAmount
local maxAmountPerSec = math.floor(addMoney * 2)
local totalGold = PlayerResource:GetTotalEarnedGold(playerId)
local goldPerSec = totalGold / gameTime
if goldPerSec > maxAmountPerSec then
return
end
hero:ModifyGold(addMoney, true, DOTA_ModifyGold_GameTick)
end)
end
BotTeam = __TS__DecorateLegacy({reloadable}, BotTeam)
____exports.BotTeam = BotTeam
return ____exports
