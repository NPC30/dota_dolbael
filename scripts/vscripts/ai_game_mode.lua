function Precache(context)
PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_alchemist.vsndevts", context)
PrecacheResource("soundfile", "soundevents/game_sounds_custom.vsndevts", context)
end
if AIGameMode == nil then
_G.AIGameMode = class({})
end
require('timers')
require('util')
require('bot/bot_item_data')
require('events')
require('bot/bot_think_item_build')
require('bot/bot_think_item_use')
require('bot/bot_think_ability_use')
require('bot/bot_think_modifier')
function Activate()
AIGameMode:InitGameMode()
end
function Precache(context)
PrecacheResource("soundfile", "soundevents/hero_artoria.vsndevts", context)
PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_abyss_sword.vsndevts", context)
PrecacheResource("soundfile", "soundevents/voscripts/game_sounds_vo_abyss_sword.vsndevts", context)
PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_goku.vsndevts", context)
PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_saber.vsndevts", context)
PrecacheResource("soundfile", "soundevents/yukari_yakumo.vsndevts", context)
PrecacheResource("soundfile", "soundevents/hero_themes.vsndevts", context)
PrecacheResource("soundfile", "soundevents/voscripts/game_sounds_vo_jack.vsndevts", context)
end
function AIGameMode:InitGameMode()
AIGameMode:InitEvents()
AIGameMode:LinkLuaModifiers()
AIGameMode:InitGlobalVariables()
if IsInToolsMode() then
print("========Enter Debug Mode========")
self.DebugMode = true
end
print("DOTA 2 AI Wars Loaded.")
end
function AIGameMode:InitGlobalVariables()
AIGameMode.BotRecordSuccessiveDeathTable = {}
end
function AIGameMode:CachePlayerNames()
print("[CachePlayerNames] ===== START =====")
Timers:CreateTimer(10, function()
print("[CachePlayerNames] Attempting to cache player names...")
for playerId = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
if PlayerResource:IsValidPlayerID(playerId) and not PlayerResource:IsFakeClient(playerId) then
local steamAccountID = PlayerResource:GetSteamAccountID(playerId)
print("[CachePlayerNames] Processing playerId:", playerId, "steamAccountID:", steamAccountID)
if steamAccountID > 0 then
local player = PlayerResource:GetPlayer(playerId)
if player then
print("[CachePlayerNames] Sending request_player_name to playerId:", playerId)
CustomGameEventManager:Send_ServerToPlayer(
player,
"request_player_name",
{ playerId = playerId }
)
else
print("[CachePlayerNames] ✗ Player object not found for playerId:", playerId)
end
else
print("[CachePlayerNames] ✗ Invalid steamAccountID for playerId:", playerId)
end
end
end
print("[CachePlayerNames] ===== END =====")
end)
end
function AIGameMode:InitEvents()
ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(AIGameMode, "OnGameStateChanged"), self)
ListenToGameEvent("npc_spawned", Dynamic_Wrap(AIGameMode, "OnNPCSpawned"), self)
ListenToGameEvent("entity_killed", Dynamic_Wrap(AIGameMode, "OnEntityKilled"), self)
ListenToGameEvent("dota_item_picked_up", Dynamic_Wrap(AIGameMode, "OnItemPickedUp"), self)
CustomGameEventManager:RegisterListener("player_name_response", function(userId, event)
local playerId = event.playerId
local playerName = event.playerName
local steamAccountID = PlayerResource:GetSteamAccountID(playerId)
local key = tostring(steamAccountID)
local playerData = CustomNetTables:GetTableValue("player_table", key) or {}
playerData.playerName = playerName
CustomNetTables:SetTableValue("player_table", key, playerData)
local verify = CustomNetTables:GetTableValue("player_table", key)
end)
CustomGameEventManager:RegisterListener("loading_set_options", function(eventSourceIndex, args)
return AIGameMode:OnGetLoadingSetOptions(eventSourceIndex, args)
end)
CustomGameEventManager:RegisterListener("set_unit_share_mask", function(_, keys)
return AIGameMode:SetUnitShareMask(keys)
end)
end
function AIGameMode:LinkLuaModifiers()
LinkLuaModifier("modifier_bot_think_strategy", "bot/bot_think_modifier.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_bot_think_item_use", "bot/bot_think_modifier.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_bot_think_ward", "bot/bot_think_modifier.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_bot_boss_behavior", "bot/bot_boss_behavior", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_mind_control", "modifiers/modifier_mind_control.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_defection", "modifiers/modifier_defection.lua", LUA_MODIFIER_MOTION_NONE)
end
function AIGameMode:PreGameOptions()
self.iDesiredRadiant = self.iDesiredRadiant or 1
self.iDesiredDire = self.iDesiredDire or 1
self.fPlayerGoldXpMultiplier = self.fPlayerGoldXpMultiplier or 1
self.fBotGoldXpMultiplier = self.fBotGoldXpMultiplier or 1
self.iRespawnTimePercentage = self.iRespawnTimePercentage or 1
self.iMaxLevel = self.iMaxLevel or 50
self.iTowerPower = self.iTowerPower or 3
self.iStartingGoldPlayer = self.iStartingGoldPlayer or 600
self.iStartingGoldBot = self.iStartingGoldBot or 600
self.bSameHeroSelection = self.bSameHeroSelection or 0
self.fGameStartTime = 0
self.bMidOnlyMode = self.bMidOnlyMode or false
local gameMode = GameRules:GetGameModeEntity()
GameRules:SetSameHeroSelectionEnabled(true)
self.sumTowerPower = AIGameMode.iTowerPower
self.creepBuffLevel = 0
self.creepBuffLevelGood = 0
self.creepBuffLevelBad = 0
self.creepBuffLevelMegaGood = 0
self.creepBuffLevelMegaBad = 0
if self.sumTowerPower <= 5 then
self.creepBuffLevel = 0
elseif self.sumTowerPower <= 7 then
self.creepBuffLevel = 1
elseif self.sumTowerPower <= 8 then
self.creepBuffLevel = 2
elseif self.sumTowerPower <= 9 then
self.creepBuffLevel = 3
else
self.creepBuffLevel = 4
end
self.barrackPushedBad = 0
self.barrackPushedGood = 0
self.tower1PushedBad = 0
self.tower1PushedGood = 0
self.tower2PushedBad = 0
self.tower2PushedGood = 0
self.tower3PushedBad = 0
self.tower3PushedGood = 0
self.tower4PushedBad = 0
self.tower4PushedGood = 0
if self.bMidOnlyMode == 1 or self.bMidOnlyMode == true then
self.botPushMin = 1.5
else
self.botPushMin = 5
end
print("botPushMin: " .. self.botPushMin)
print("[MidOnlyMode]-PreGameOptions self.bMidOnlyMode is:" .. self.bMidOnlyMode)
BotThink:SetTome()
self.PreGameOptionsSet = true
end
function AIGameMode:GetPlayerGoldXpMultiplier(iPlayerID)
local mul = 1
if IsHumanPlayer(iPlayerID) then
mul = self.fPlayerGoldXpMultiplier
elseif IsGoodTeamPlayer(iPlayerID) then
mul = self.fPlayerGoldXpMultiplier
else
mul = self.fBotGoldXpMultiplier
end
return mul
end
