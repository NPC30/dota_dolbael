local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____event_2Dentity_2Dkilled = require("modules.event.event-entity-killed")
local TowerPushStatus = ____event_2Dentity_2Dkilled.TowerPushStatus
____exports.CreepBuffManager = __TS__Class()
local CreepBuffManager = ____exports.CreepBuffManager
CreepBuffManager.name = "CreepBuffManager"
function CreepBuffManager.prototype.____constructor(self)
self.MID_ONLY_MODE_CREEP_BOUNTY_MULTIPLIER = 3
self.currentBuffLevels = {buffLevelGood = 0, buffLevelBad = 0}
self.laneGoldMultiplier = 1
ListenToGameEvent(
"npc_spawned",
function(____, keys) return self:onNPCSpawned(keys) end,
self
)
Timers:CreateTimer(
2,
function()
self:refreshBuffLevels()
return 10
end
)
end
function CreepBuffManager.prototype.refreshBuffLevels(self)
self.currentBuffLevels = self:calculateCreepBuffLevels()
self.laneGoldMultiplier = self:calculateLaneGoldMultiplier()
end
function CreepBuffManager.prototype.onNPCSpawned(self, keys)
if GameRules:State_Get() < DOTA_GAMERULES_STATE_PRE_GAME then
Timers:CreateTimer(
1,
function()
self:onNPCSpawned(keys)
end
)
return
end
local entity = EntIndexToHScript(keys.entindex)
if not entity or entity:IsNull() then
return
end
local name = entity:GetName()
if name == "npc_dota_creep_lane" or name == "npc_dota_creep_siege" then
if GameRules.Option.midOnlyMode then
local lane = self:getCreepLane(entity:GetAbsOrigin())
if lane ~= "mid" then
entity:ForceKill(false)
return
end
entity:SetMaximumGoldBounty(entity:GetMaximumGoldBounty() * self.MID_ONLY_MODE_CREEP_BOUNTY_MULTIPLIER)
entity:SetMinimumGoldBounty(entity:GetMinimumGoldBounty() * self.MID_ONLY_MODE_CREEP_BOUNTY_MULTIPLIER)
entity:SetDeathXP(entity:GetDeathXP() * self.MID_ONLY_MODE_CREEP_BOUNTY_MULTIPLIER)
end
self:applyCreepBuff(entity)
end
end
function CreepBuffManager.prototype.getCreepLane(self, position)
local x = position.x
local y = position.y
local diff = math.abs(math.abs(x) - math.abs(y))
if diff < 1500 then
return "mid"
elseif x > 0 and y < 0 then
return "bot"
elseif x < 0 and y > 0 then
return "top"
end
return "unknown"
end
function CreepBuffManager.prototype.applyCreepBuff(self, creep)
local unitName = creep:GetUnitName()
local team = creep:GetTeamNumber()
local buffLevel = 0
if team == DOTA_TEAM_GOODGUYS then
buffLevel = self.currentBuffLevels.buffLevelGood
elseif team == DOTA_TEAM_BADGUYS then
buffLevel = self.currentBuffLevels.buffLevelBad
end
local originMaxGold = creep:GetMaximumGoldBounty()
local originMinGold = creep:GetMinimumGoldBounty()
local modifiedMaxGold = originMaxGold * self.laneGoldMultiplier
local modifiedMinGold = originMinGold * self.laneGoldMultiplier
creep:SetMaximumGoldBounty(modifiedMaxGold)
creep:SetMinimumGoldBounty(modifiedMinGold)
local baseMaxHealth = self:calculateCreepBaseMaxHealth(creep, buffLevel)
creep:SetBaseMaxHealth(baseMaxHealth)
if buffLevel > 0 then
if (string.find(unitName, "upgraded", nil, true) or 0) - 1 == -1 and (string.find(unitName, "mega", nil, true) or 0) - 1 == -1 then
local ability = creep:AddAbility("creep_buff")
if ability ~= nil then
ability:SetLevel(buffLevel)
end
return
elseif (string.find(unitName, "upgraded", nil, true) or 0) - 1 ~= -1 and (string.find(unitName, "mega", nil, true) or 0) - 1 == -1 then
local ability = creep:AddAbility("creep_buff_upgraded")
if ability ~= nil then
ability:SetLevel(buffLevel)
end
return
elseif (string.find(unitName, "mega", nil, true) or 0) - 1 ~= -1 then
local ability = creep:AddAbility("creep_buff_mega")
if ability ~= nil then
ability:SetLevel(buffLevel)
end
return
end
end
end
function CreepBuffManager.prototype.calculateLaneGoldMultiplier(self)
local time = GameRules:GetDOTATime(false, false)
local mul = 1
if time <= 15 * 60 then
mul = 1
else
mul = math.floor(time / 900)
end
mul = math.min(mul, 4)
return mul
end
function CreepBuffManager.prototype.calculateCreepBuffLevels(self)
local baseCreepBuffLevel = self:getCreepBuffByTowerPower()
baseCreepBuffLevel = baseCreepBuffLevel + self:getCreepBuffByGameTime()
local buffLevelGood = baseCreepBuffLevel
local buffLevelBad = baseCreepBuffLevel
local totalTower12Good = TowerPushStatus.tower1PushedGood + TowerPushStatus.tower2PushedGood
local totalTower12Bad = TowerPushStatus.tower1PushedBad + TowerPushStatus.tower2PushedBad
if totalTower12Good >= 6 then
buffLevelGood = buffLevelGood + 3
elseif totalTower12Good >= 3 then
buffLevelGood = buffLevelGood + 2
elseif totalTower12Good >= 1 then
buffLevelGood = buffLevelGood + 1
end
if totalTower12Bad >= 6 then
buffLevelBad = buffLevelBad + 3
elseif totalTower12Bad >= 3 then
buffLevelBad = buffLevelBad + 2
elseif totalTower12Bad >= 1 then
buffLevelBad = buffLevelBad + 1
end
if TowerPushStatus.tower3PushedGood >= 1 then
buffLevelGood = buffLevelGood + 1
end
if TowerPushStatus.tower3PushedBad >= 1 then
buffLevelBad = buffLevelBad + 1
end
if TowerPushStatus.tower4PushedGood == 1 then
buffLevelGood = buffLevelGood + 1
elseif TowerPushStatus.tower4PushedGood > 1 then
buffLevelGood = buffLevelGood + 2
end
if TowerPushStatus.tower4PushedBad == 1 then
buffLevelBad = buffLevelBad + 1
elseif TowerPushStatus.tower4PushedBad > 1 then
buffLevelBad = buffLevelBad + 2
end
if TowerPushStatus.tower1PushedGood == 0 then
buffLevelGood = 0
end
if TowerPushStatus.tower1PushedBad == 0 then
buffLevelBad = 0
end
buffLevelGood = math.min(buffLevelGood, 10)
buffLevelBad = math.min(buffLevelBad, 10)
return {buffLevelGood = buffLevelGood, buffLevelBad = buffLevelBad}
end
function CreepBuffManager.prototype.calculateCreepBaseMaxHealth(self, creep, buffLevel)
local baseMaxHealth = creep:GetBaseMaxHealth()
if buffLevel > 0 then
baseMaxHealth = baseMaxHealth + baseMaxHealth * (0.05 * buffLevel)
baseMaxHealth = baseMaxHealth + 100 * buffLevel
end
return baseMaxHealth
end
function CreepBuffManager.prototype.getCreepBuffByTowerPower(self)
local gameTime = GameRules:GetDOTATime(false, false)
if gameTime <= 25 * 60 then
return 0
end
local sumTowerPower = GameRules.Option.towerPower
if sumTowerPower <= 150 then
return 0
elseif sumTowerPower <= 400 then
return 1
else
return 2
end
end
function CreepBuffManager.prototype.getCreepBuffByGameTime(self)
local gameTime = GameRules:GetDOTATime(false, false)
if gameTime <= 10 * 60 then
return 0
elseif gameTime <= 20 * 60 then
return 1
elseif gameTime <= 30 * 60 then
return 2
elseif gameTime <= 40 * 60 then
return 3
elseif gameTime <= 50 * 60 then
return 4
else
return 5
end
end
CreepBuffManager = __TS__DecorateLegacy({reloadable}, CreepBuffManager)
____exports.CreepBuffManager = CreepBuffManager
return ____exports
