local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____event_2Dentity_2Dkilled = require("modules.event.event-entity-killed")
local TowerPushStatus = ____event_2Dentity_2Dkilled.TowerPushStatus
____exports.HeroBuyback = __TS__Class()
local HeroBuyback = ____exports.HeroBuyback
HeroBuyback.name = "HeroBuyback"
function HeroBuyback.prototype.____constructor(self)
self.refreshInterval = 1
Timers:CreateTimer(
2,
function()
self:refreshBuybackCost()
return self.refreshInterval
end
)
end
function HeroBuyback.prototype.refreshBuybackCost(self)
do
local playerId = 0
while playerId < PlayerResource:GetPlayerCount() do
do
if not PlayerResource:IsValidPlayerID(playerId) then
goto __continue5
end
if PlayerResource:IsFakeClient(playerId) then
if TowerPushStatus.tower3PushedGood > 0 or TowerPushStatus.tower3PushedBad > 0 then
PlayerResource:SetCustomBuybackCost(
playerId,
self:calculateBuybackCost(playerId)
)
else
PlayerResource:SetCustomBuybackCost(playerId, 100000)
end
else
PlayerResource:SetCustomBuybackCost(
playerId,
self:calculateBuybackCost(playerId)
)
end
end
::__continue5::
playerId = playerId + 1
end
end
end
function HeroBuyback.prototype.calculateBuybackCost(self, playerId)
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
if not hero then
return 0
end
local level = hero:GetLevel()
local netWorth = PlayerResource:GetNetWorth(playerId)
local baseCost = 100 + level * level * 1.5
local netWorthCost = netWorth * 0.0125
local totalCost = baseCost + netWorthCost
return math.floor(totalCost)
end
return ____exports
