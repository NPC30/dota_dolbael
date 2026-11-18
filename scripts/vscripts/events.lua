require('modifiers/player/enable_player_modifier')
require('modifiers/player/custom_player_titles')
require('event/kill')
require('items/item_collector')
require('items/item_tome_usage_limit')
function AIGameMode:OnGetLoadingSetOptions(eventSourceIndex, args)
if tonumber(args.host_privilege) ~= 1 then
return
end
self.iDesiredRadiant = tonumber(args.game_options.radiant_player_number)
self.iDesiredDire = tonumber(args.game_options.dire_player_number)
self.fPlayerGoldXpMultiplier = tonumber(args.game_options.player_gold_xp_multiplier)
self.fBotGoldXpMultiplier = tonumber(args.game_options.bot_gold_xp_multiplier)
self.iRespawnTimePercentage = tonumber(args.game_options.respawn_time_percentage)
self.iMaxLevel = tonumber(args.game_options.max_level)
self.iTowerPower = tonumber(args.game_options.tower_power)
self.iStartingGoldPlayer = tonumber(args.game_options.starting_gold_player)
self.iStartingGoldBot = tonumber(args.game_options.starting_gold_bot)
self.bSameHeroSelection = args.game_options.same_hero_selection
self.bMidOnlyMode = args.game_options.mid_only_mode
self.bAbyssMode = args.game_options.abyss_mode
self:PreGameOptions()
end
function AIGameMode:InitPlayerGold()
if self.PreGameOptionsSet then
print("[AIGameMode] InitPlayerGold")
self.tStartingGoldApplied = self.tStartingGoldApplied or {}
for i = 0, (DOTA_MAX_TEAM_PLAYERS - 1) do
if IsHumanPlayer(i) then
local currentGold = PlayerResource:GetGold(i)
local hasApplied = self.tStartingGoldApplied[i] == true
local state = GameRules:State_Get()
if not hasApplied and state == DOTA_GAMERULES_STATE_HERO_SELECTION then
PlayerResource:SetGold(i, self.iStartingGoldPlayer, true)
PlayerResource:SetGold(i, 0, false)
self.tStartingGoldApplied[i] = true
elseif currentGold > self.iStartingGoldPlayer then
PlayerResource:SetGold(i, self.iStartingGoldPlayer, true)
PlayerResource:SetGold(i, 0, false)
end
end
end
else
Timers:CreateTimer(0.5, function()
print("[AIGameMode] Try InitPlayerGold in 0.5s")
AIGameMode:InitPlayerGold()
end)
end
end
function AIGameMode:OnGameStateChanged(keys)
local state = GameRules:State_Get()
if state == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP then
elseif state == DOTA_GAMERULES_STATE_HERO_SELECTION then
if IsServer() then
self:InitPlayerGold()
self:CachePlayerNames()
end
elseif state == DOTA_GAMERULES_STATE_STRATEGY_TIME then
self.playerNumber = 0
for playerID = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
if PlayerResource:IsValidPlayerID(playerID) and PlayerResource:IsValidPlayer(playerID) and not PlayerResource:IsFakeClient(playerID) then
self.playerNumber = self.playerNumber + 1
end
end
if not self.PreGameOptionsSet then
self:PreGameOptions()
end
elseif state == DOTA_GAMERULES_STATE_PRE_GAME then
if self.bMidOnlyMode == 1 or self.bMidOnlyMode == true then
if self.bAbyssMode == 1 or self.bAbyssMode == true then
GameRules:SendCustomMessage("<font color='#FFD700'>RENO：</font>欢迎来到深渊模式，该模式BOT只有被全部击杀后才会复活在中路附近。每 5 波出现一次Boss，boss有概率掉落技能书/宝箱/技能重置书/四圣符。", 0, 0)
GameRules:SendCustomMessage("<font color='#FFD700'>结束条件：</font>32分钟/平均阵亡>5次，请在这之前尽量通关更多的波次，冲击深渊榜。", 0, 0)
GameRules:SendCustomMessage("<font color='#FFD700'>4+3技能：</font>开局 +1 被动，3分钟 +1 主动，6分钟 +1 被动。", 0, 0)
else
GameRules:SendCustomMessage("<font color='#FFD700'>RENO：欢迎来到中路乱斗模式，本模式只有一条路，且bot会更早推进</font>", 0, 0)
end
local towers = Entities:FindAllByClassname("npc_dota_tower")
local removedTowerCount = 0
for _, tower in pairs(towers) do
local unitName = tower:GetUnitName()
if string.find(unitName, "top") or string.find(unitName, "bot") then
tower:ForceKill(false)
removedTowerCount = removedTowerCount + 1
end
end
local barracks = Entities:FindAllByClassname("npc_dota_barracks")
local removedBarrackCount = 0
for _, barrack in pairs(barracks) do
local unitName = barrack:GetUnitName()
if string.find(unitName, "top") or string.find(unitName, "bot") then
barrack:ForceKill(false)
removedBarrackCount = removedBarrackCount + 1
end
end
self.tower1PushedBad = 2
self.tower1PushedGood = 2
self.tower2PushedBad = 2
self.tower2PushedGood = 2
self.tower3PushedBad = 2
self.tower3PushedGood = 2
end
Timers:CreateTimer(2, function()
AIGameMode:RefreshGameStatus()
return 1
end)
elseif state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
self.fGameStartTime = GameRules:GetGameTime()
GameRules:SpawnNeutralCreeps()
Timers:CreateTimer(600, function()
GameRules:SendCustomMessage("<font color='#FFD700'>所有人技能重置书已发放</font>", 0, 0)
for playerId = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
if PlayerResource:IsValidPlayerID(playerId) then
if not IsHumanPlayer(playerId) then
else
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
if hero then
local item = hero:AddItemByName("item_tome_of_ability_reset")
SkillTomeAuthorizeItem(item)
end
end
end
end
return 600
end)
if self.bMidOnlyMode == 1 or self.bMidOnlyMode == true then
Timers:CreateTimer(10, function()
SelectEveryValidPlayerDoFunc(function(playerId)
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
if hero and hero:IsAlive() then
local xpMultiplier = AIGameMode:GetPlayerGoldXpMultiplier(playerId)
local xpToAdd = math.floor(30 * xpMultiplier)
hero:AddExperience(xpToAdd, DOTA_ModifyXP_Unspecified, false, false)
local gameTime = GameRules:GetDOTATime(false, false)
local gameMinutes = gameTime / 60
local goldToAdd = math.floor((math.sqrt(gameMinutes) + 1) * 30 * xpMultiplier)
hero:ModifyGold(goldToAdd, true, DOTA_ModifyGold_GameTick)
end
end)
return 10
end)
end
if IsClient() then
return
end
local interval = 30
if self.bMidOnlyMode == 1 or self.bMidOnlyMode == true then
interval = 20
end
Timers:CreateTimer(interval, function()
AIGameMode:SpawnNeutralCreeps30sec()
return 20
end)
end
end
function AIGameMode:SpawnNeutralCreeps30sec()
local GameTime = GameRules:GetDOTATime(false, false)
print("SpawnNeutral at GetDOTATime " .. GameTime)
GameRules:SpawnNeutralCreeps()
end
function AIGameMode:RefreshGameStatus()
local GameTime = GameRules:GetDOTATime(false, false)
local isMidOnlyMode = self.bMidOnlyMode == 1 or self.bMidOnlyMode == true or self.bMidOnlyMode == "1" or self.bMidOnlyMode == "true"
local isAbyssMode = self.bAbyssMode == 1 or self.bAbyssMode == true or self.bAbyssMode == "1" or self.bAbyssMode == "true"
local botPushSeconds = (AIGameMode.botPushMin or 5) * 60
if isMidOnlyMode then
GameRules:GetGameModeEntity():SetBotsInLateGame(true)
GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(true)
GameRules:GetGameModeEntity():SetBotsMaxPushTier(-1)
if (not isAbyssMode) and GameTime < botPushSeconds then
GameRules:GetGameModeEntity():SetBotThinkingEnabled(true)
end
elseif (GameTime >= ((AIGameMode.botPushMin * 4) * 60)) then
GameRules:GetGameModeEntity():SetBotsMaxPushTier(-1)
elseif (GameTime >= ((AIGameMode.botPushMin * 1.3) * 60)) then
if AIGameMode.tower3PushedGood >= 2 or AIGameMode.tower3PushedBad >= 2 then
GameRules:GetGameModeEntity():SetBotsMaxPushTier(4)
end
if AIGameMode.barrackPushedGood > 5 or AIGameMode.barrackPushedBad > 5 then
GameRules:GetGameModeEntity():SetBotsMaxPushTier(-1)
elseif AIGameMode.barrackPushedGood > 2 or AIGameMode.barrackPushedBad > 2 then
GameRules:GetGameModeEntity():SetBotsMaxPushTier(5)
end
elseif (GameTime >= (AIGameMode.botPushMin * 60)) then
GameRules:GetGameModeEntity():SetBotsInLateGame(true)
GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(true)
GameRules:GetGameModeEntity():SetBotsMaxPushTier(3)
else
GameRules:GetGameModeEntity():SetBotsInLateGame(true)
GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(false)
GameRules:GetGameModeEntity():SetBotsMaxPushTier(1)
end
if isMidOnlyMode then
a = 1
else
SelectEveryValidPlayerDoFunc(function(playerId)
if PlayerResource:IsFakeClient(playerId) then
if AIGameMode.tower3PushedGood > 0 or AIGameMode.tower3PushedBad > 0 then
PlayerResource:SetCustomBuybackCost(playerId, GetBuyBackCost(playerId) / 4)
else
PlayerResource:SetCustomBuybackCost(playerId, 100000 / 4)
end
else
PlayerResource:SetCustomBuybackCost(playerId, GetBuyBackCost(playerId) / 4)
end
end)
end
local buffLevelGood = 0
local buffLevelBad = 0
local buffLevelMegaGood = 0
local buffLevelMegaBad = 0
if AIGameMode.tower3PushedGood == 1 then
buffLevelGood = buffLevelGood + 1
elseif AIGameMode.tower3PushedGood > 1 then
buffLevelGood = buffLevelGood + 3
end
if AIGameMode.tower3PushedBad == 1 then
buffLevelBad = buffLevelBad + 1
elseif AIGameMode.tower3PushedBad > 1 then
buffLevelBad = buffLevelBad + 3
end
if AIGameMode.tower4PushedGood > 1 then
buffLevelGood = buffLevelGood + 2
buffLevelMegaGood = buffLevelMegaGood + 1
end
if AIGameMode.tower4PushedBad > 1 then
buffLevelBad = buffLevelBad + 2
buffLevelMegaBad = buffLevelMegaBad + 1
end
buffLevelMegaGood = buffLevelMegaGood + AIGameMode.creepBuffLevel
buffLevelMegaBad = buffLevelMegaBad + AIGameMode.creepBuffLevel
if (GameTime >= (45 * 60)) then
buffLevelGood = buffLevelGood + 5
buffLevelBad = buffLevelBad + 5
buffLevelMegaGood = buffLevelMegaGood + 5
buffLevelMegaBad = buffLevelMegaBad + 5
elseif (GameTime >= (40 * 60)) then
buffLevelGood = buffLevelGood + 4
buffLevelBad = buffLevelBad + 4
buffLevelMegaGood = buffLevelMegaGood + 4
buffLevelMegaBad = buffLevelMegaBad + 4
elseif (GameTime >= (35 * 60)) then
buffLevelGood = buffLevelGood + 3
buffLevelBad = buffLevelBad + 3
buffLevelMegaGood = buffLevelMegaGood + 3
buffLevelMegaBad = buffLevelMegaBad + 3
elseif (GameTime >= (30 * 60)) then
buffLevelGood = buffLevelGood + 2
buffLevelBad = buffLevelBad + 2
buffLevelMegaGood = buffLevelMegaGood + 2
buffLevelMegaBad = buffLevelMegaBad + 2
elseif (GameTime >= (25 * 60)) then
buffLevelGood = buffLevelGood + 1
buffLevelBad = buffLevelBad + 1
buffLevelMegaGood = buffLevelMegaGood + 1
buffLevelMegaBad = buffLevelMegaBad + 1
elseif (GameTime >= (20 * 60)) then
buffLevelGood = buffLevelGood + 1
buffLevelBad = buffLevelBad + 1
end
if AIGameMode.tower1PushedGood == 0 then
buffLevelGood = 0
end
if AIGameMode.tower1PushedBad == 0 then
buffLevelBad = 0
end
buffLevelGood = math.min(buffLevelGood, 8)
buffLevelBad = math.min(buffLevelBad, 8)
buffLevelMegaGood = math.min(buffLevelMegaGood, 8)
buffLevelMegaBad = math.min(buffLevelMegaBad, 8)
AIGameMode.creepBuffLevelGood = buffLevelGood
AIGameMode.creepBuffLevelBad = buffLevelBad
AIGameMode.creepBuffLevelMegaGood = buffLevelMegaGood
AIGameMode.creepBuffLevelMegaBad = buffLevelMegaBad
end
function AIGameMode:OnNPCSpawned(keys)
if GameRules:State_Get() < DOTA_GAMERULES_STATE_PRE_GAME then
Timers:CreateTimer(1, function()
AIGameMode:OnNPCSpawned(keys)
end)
return
end
local hEntity = EntIndexToHScript(keys.entindex)
if not hEntity or hEntity:IsNull() then
return
end
local sName = hEntity:GetName()
if (sName == "npc_dota_creep_lane" or sName == "npc_dota_creep_siege") and (self.bMidOnlyMode == 1 or self.bMidOnlyMode == true) then
local origin = hEntity:GetAbsOrigin()
local lane = self:GetCreepLane(origin)
if lane ~= "mid" then
hEntity:ForceKill(false)
return
else
local originMaxGold = hEntity:GetMaximumGoldBounty()
local originMinGold = hEntity:GetMinimumGoldBounty()
local originXP = hEntity:GetDeathXP()
local mul = 3
hEntity:SetMaximumGoldBounty(originMaxGold * mul)
hEntity:SetMinimumGoldBounty(originMinGold * mul)
hEntity:SetDeathXP(originXP * mul)
end
end
if sName == "npc_dota_creep_lane" or sName == "npc_dota_creep_siege" then
local sUnitName = hEntity:GetUnitName()
local team = hEntity:GetTeamNumber()
local buffLevel = 0
local buffLevelMega = 0
if DOTA_TEAM_GOODGUYS == team then
buffLevel = AIGameMode.creepBuffLevelGood
buffLevelMega = AIGameMode.creepBuffLevelMegaGood
elseif DOTA_TEAM_BADGUYS == team then
buffLevel = AIGameMode.creepBuffLevelBad
buffLevelMega = AIGameMode.creepBuffLevelMegaBad
end
local originMaxGold = hEntity:GetMaximumGoldBounty()
local originMinGold = hEntity:GetMinimumGoldBounty()
local mul = AIGameMode:GetLaneGoldMul()
local modifiedMaxGold = originMaxGold * mul
local modifiedMinGold = originMinGold * mul
hEntity:SetMaximumGoldBounty(modifiedMaxGold)
hEntity:SetMinimumGoldBounty(modifiedMinGold)
if buffLevel > 0 then
if not string.find(sUnitName, "upgraded") and not string.find(sUnitName, "mega") then
local ability = hEntity:AddAbility("creep_buff")
ability:SetLevel(buffLevel)
return
end
end
if buffLevelMega > 0 then
if string.find(sUnitName, "upgraded") and not string.find(sUnitName, "mega") then
local ability = hEntity:AddAbility("creep_buff_upgraded")
ability:SetLevel(buffLevelMega)
return
elseif string.find(sUnitName, "mega") then
local ability = hEntity:AddAbility("creep_buff_mega")
ability:SetLevel(buffLevelMega)
return
end
end
end
if hEntity:IsRealHero() and not hEntity.bInitialized then
if not IsHumanPlayer(hEntity:GetPlayerOwnerID()) then
if not hEntity:HasModifier("modifier_bot_think_strategy") then
hEntity:AddNewModifier(hEntity, nil, "modifier_bot_think_strategy", {})
end
if not hEntity:HasModifier("modifier_bot_think_item_use") then
hEntity:AddNewModifier(hEntity, nil, "modifier_bot_think_item_use", {})
end
if tBotItemData.wardHeroList[sName] then
if not hEntity:HasModifier("modifier_bot_think_ward") then
hEntity:AddNewModifier(hEntity, nil, "modifier_bot_think_ward", {})
end
end
end
if IsHumanPlayer(hEntity:GetPlayerOwnerID()) then
EnablePlayerModifier(hEntity)
EnableCustomPlayerTitles(hEntity)
end
hEntity.bInitialized = true
end
end
function AIGameMode:GetCreepLane(position)
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
function AIGameMode:GetLaneGoldMul()
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
function AIGameMode:OnItemPickedUp(event)
if not event.HeroEntityIndex then
return
end
local item = EntIndexToHScript(event.ItemEntityIndex)
local hHero = EntIndexToHScript(event.HeroEntityIndex)
if item and hHero and item:GetAbilityName() == "item_skill_learning" then
if not item:GetStoredAbility() then
local random_ability = item:GetRandomLotteryAbility(hHero)
item:SetStoredAbility({
ability_name = random_ability.name,
ability_level = random_ability.level or 1
})
hHero:AddNewModifier(hHero, item, "modifier_skill_learning_display", {
ability_name = random_ability.name
})
print("[SkillLearning] Picked up, stored ability:", random_ability.name)
end
end
if event.PlayerID ~= nil and item ~= nil and hHero ~= nil and item:GetAbilityName() == "item_bag_of_gold" then
local iGold = item:GetSpecialValueFor("bonus_gold")
hHero:ModifyGoldFiltered(iGold, true, DOTA_ModifyGold_RoshanKill)
SendOverheadEventMessage(hHero, OVERHEAD_ALERT_GOLD, hHero,
iGold * AIGameMode:GetPlayerGoldXpMultiplier(event.PlayerID), nil)
end
end
function AIGameMode:SetUnitShareMask(data)
local toPlayerID = data.toPlayerID
if PlayerResource:IsValidPlayerID(toPlayerID) then
local playerId = data.PlayerID
local flag = data.flag
local disable = data.disable == 1
PlayerResource:SetUnitShareMaskForPlayer(playerId, toPlayerID, flag, disable)
local disableHelp = CustomNetTables:GetTableValue("disable_help", tostring(playerId)) or {}
disableHelp[tostring(to)] = disable
CustomNetTables:SetTableValue("disable_help", tostring(playerId), disableHelp)
end
end
