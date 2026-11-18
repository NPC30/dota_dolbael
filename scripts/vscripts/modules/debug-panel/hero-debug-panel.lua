local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local Set = ____lualib.Set
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__StringTrim = ____lualib.__TS__StringTrim
local ____exports = {}
local ____modifier_debug_invulnerable = require("modifiers.debug.modifier_debug_invulnerable")
local modifier_debug_invulnerable = ____modifier_debug_invulnerable.modifier_debug_invulnerable
local ____modifier_debug_manual_control = require("modifiers.debug.modifier_debug_manual_control")
local modifier_debug_manual_control = ____modifier_debug_manual_control.modifier_debug_manual_control
local DEFAULT_SPAWN_HERO_ID = 18
____exports.HeroDebugPanel = __TS__Class()
local HeroDebugPanel = ____exports.HeroDebugPanel
HeroDebugPanel.name = "HeroDebugPanel"
function HeroDebugPanel.prototype.____constructor(self)
self.playerHeroEntIndex = __TS__New(Map)
self.hudCreatedPlayers = __TS__New(Set)
if not IsInToolsMode() then
return
end
GameRules:SetUseUniversalShopMode(true)
self:registerButtonListeners()
CustomGameEventManager:RegisterListener(
"debug_panel_add_to_unit",
function(_userId, event) return self:onAddToUnit(event) end
)
ListenToGameEvent(
"npc_spawned",
function(____, keys) return self:onNpcSpawned(keys) end,
self
)
ListenToGameEvent(
"dota_on_hero_finish_spawn",
function(____, keys) return self:onHeroFinishSpawn(keys) end,
self
)
end
function HeroDebugPanel.prototype.registerButtonListeners(self)
self:onStr(
"SpawnToTeamButtonPressed",
function(____, e) return self:onSpawnToTeam(e) end
)
self:onStr(
"DummyTargetButtonPressed",
function(____, e) return self:onSpawnDummyTarget(e) end
)
self:onStr(
"SelectSpawnHeroButtonPressed",
function(____, e) return self:onSelectSpawnHero(e) end
)
self:onStr(
"SelectMainHeroButtonPressed",
function(____, e) return self:onSelectMainHero(e) end
)
self:onStr(
"RequestInitialSpawnHeroID",
function() return self:sendSpawnHeroId(DEFAULT_SPAWN_HERO_ID) end
)
self:onStr(
"LevelUpHero",
function(____, e) return self:withHero(
e,
function(____, h) return self:levelUpHero(h) end
) end
)
self:onStr(
"MaxLevelUpHero",
function(____, e) return self:withHero(
e,
function(____, h) return self:maxLevelHero(h) end
) end
)
self:onStr(
"ScepterHero",
function(____, e) return self:withHero(
e,
function(____, h) return self:grantScepter(h) end
) end
)
self:onStr(
"ShardHero",
function(____, e) return self:withHero(
e,
function(____, h) return self:grantShard(h) end
) end
)
self:onStr(
"ResetHero",
function(____, e) return self:withHero(
e,
function(____, h) return self:resetHero(h) end
) end
)
self:onStr(
"RemoveHeroButtonPressed",
function(____, e) return self:onRemoveHero(e) end
)
self:onStr(
"InvulnOnHero",
function(____, e) return self:withHero(
e,
function(____, h) return self:setInvulnerable(h, true) end
) end
)
self:onStr(
"InvulnOffHero",
function(____, e) return self:withHero(
e,
function(____, h) return self:setInvulnerable(h, false) end
) end
)
self:onStr(
"ToggleInvulnerabilityHero",
function(____, e) return self:withHero(
e,
function(____, h) return self:setInvulnerable(
h,
not h:HasModifier(modifier_debug_invulnerable.name)
) end
) end
)
self:onStr(
"FreeSpellsButtonPressed",
function() return self:toggleFreeSpells() end
)
self:onStr(
"RefreshButtonPressed",
function() return SendToServerConsole("dota_dev hero_refresh") end
)
self:onStr(
"ToggleDayNight",
function() return self:toggleDayNight() end
)
self:onStr(
"PauseButtonPressed",
function() return SendToServerConsole("dota_pause") end
)
self:onStr(
"LeaveButtonPressed",
function() return SendToServerConsole("disconnect") end
)
self:onStr(
"MoveToCoordPressed",
function(____, e) return self:onMoveToCoord(e) end
)
self:onStr(
"SpawnTreasureAtCoordPressed",
function(____, e) return self:onSpawnTreasure(e) end
)
self:onStr(
"SpawnRuneDoubleDamagePressed",
function(____, e) return self:spawnRune(e, DOTA_RUNE_DOUBLEDAMAGE) end
)
self:onStr(
"SpawnRuneHastePressed",
function(____, e) return self:spawnRune(e, DOTA_RUNE_HASTE) end
)
self:onStr(
"SpawnRuneIllusionPressed",
function(____, e) return self:spawnRune(e, DOTA_RUNE_ILLUSION) end
)
self:onStr(
"SpawnRuneInvisibilityPressed",
function(____, e) return self:spawnRune(e, DOTA_RUNE_INVISIBILITY) end
)
self:onStr(
"SpawnRuneRegenerationPressed",
function(____, e) return self:spawnRune(e, DOTA_RUNE_REGENERATION) end
)
self:onStr(
"SpawnRuneArcanePressed",
function(____, e) return self:spawnRune(e, DOTA_RUNE_ARCANE) end
)
end
function HeroDebugPanel.prototype.onStr(self, eventName, handler)
CustomGameEventManager:RegisterListener(
eventName,
function(_userId, event)
handler(nil, event)
EmitGlobalSound("UI.Button.Pressed")
end
)
end
function HeroDebugPanel.prototype.withHero(self, event, action)
local entIndex = tonumber(event.str)
if entIndex == nil then
return
end
local hero = EntIndexToHScript(entIndex)
if hero and not hero:IsNull() and hero:IsHero() then
action(nil, hero)
end
end
function HeroDebugPanel.prototype.getSelectedHero(self, playerId)
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
return hero and not hero:IsNull() and hero or nil
end
function HeroDebugPanel.prototype.onSpawnToTeam(self, event)
local playerId = event.PlayerID
local selectedHero = self:getSelectedHero(playerId)
if not selectedHero then
return
end
local team = tonumber(event.str) or PlayerResource:GetTeam(playerId)
local player = PlayerResource:GetPlayer(playerId)
if not player then
return
end
local heroName = Convars:GetStr("dota_hero_demo_default_enemy")
if heroName == nil then
return
end
self:spawnDebugHero(
player,
playerId,
heroName,
team,
selectedHero:GetAbsOrigin()
)
end
function HeroDebugPanel.prototype.spawnDebugHero(self, player, playerId, heroName, team, spawnLoc)
DebugCreateUnit(
player,
heroName,
team,
false,
function(spawned)
local hero = spawned
hero:AddNewModifier(hero, nil, modifier_debug_manual_control.name, {})
FindClearSpaceForUnit(hero, spawnLoc, false)
hero:SetRespawnPosition(spawnLoc)
hero:SetOwner(player)
hero:SetPlayerID(playerId)
hero:SetControllableByPlayer(playerId, false)
hero:RemoveModifierByName("modifier_rooted")
hero:SetAcquisitionRange(0)
hero:SetIdleAcquire(false)
hero:Hold()
end
)
end
function HeroDebugPanel.prototype.onSpawnDummyTarget(self, event)
local selectedHero = self:getSelectedHero(event.PlayerID)
if not selectedHero then
return
end
local dummy = CreateUnitByName(
"npc_dota_hero_target_dummy",
selectedHero:GetAbsOrigin(),
true,
nil,
nil,
DOTA_TEAM_NEUTRALS
)
dummy:SetControllableByPlayer(event.PlayerID, false)
dummy:Hold()
dummy:SetIdleAcquire(false)
dummy:SetAcquisitionRange(0)
end
function HeroDebugPanel.prototype.onSelectSpawnHero(self, event)
local heroId = tonumber(event.str)
if heroId == nil then
return
end
self:sendSpawnHeroId(heroId)
end
function HeroDebugPanel.prototype.onSelectMainHero(self, event)
local heroId = tonumber(event.str)
if heroId == nil then
return
end
local heroName = DOTAGameManager:GetHeroUnitNameByID(heroId)
CustomGameEventManager:Send_ServerToAllClients("set_main_hero_id", {hero_id = heroId, hero_name = heroName})
end
function HeroDebugPanel.prototype.sendSpawnHeroId(self, heroId)
local heroName = DOTAGameManager:GetHeroUnitNameByID(heroId)
Convars:SetStr("dota_hero_demo_default_enemy", heroName)
CustomGameEventManager:Send_ServerToAllClients("set_spawn_hero_id", {hero_id = heroId, hero_name = heroName})
end
function HeroDebugPanel.prototype.levelUpHero(self, hero)
hero:HeroLevelUp(true)
hero:ModifyGold(5000, false, DOTA_ModifyGold_Unspecified)
end
function HeroDebugPanel.prototype.maxLevelHero(self, hero)
hero:ModifyGold(99999, false, DOTA_ModifyGold_Unspecified)
hero:AddExperience(
59900,
DOTA_ModifyXP_Unspecified,
false,
false,
0
)
local abilityCount = hero:GetAbilityCount()
do
local i = 0
while i < abilityCount do
local ability = hero:GetAbilityByIndex(i)
if ability and not ability:IsAttributeBonus() then
while ability:GetLevel() < ability:GetMaxLevel() and ability:CanAbilityBeUpgraded() and not ability:IsHidden() do
hero:UpgradeAbility(ability)
end
end
i = i + 1
end
end
end
function HeroDebugPanel.prototype.grantScepter(self, hero)
if not hero:HasModifier("modifier_item_ultimate_scepter_consumed") then
hero:AddItemByName("item_ultimate_scepter_2")
end
end
function HeroDebugPanel.prototype.grantShard(self, hero)
if not hero:HasModifier("modifier_item_aghanims_shard") then
hero:AddItemByName("item_aghanims_shard")
end
end
function HeroDebugPanel.prototype.onAddToUnit(self, event)
local name = event.name
if name == nil or name == "" then
return
end
local hero = EntIndexToHScript(event.entindex)
if not hero or hero:IsNull() or not hero:IsHero() then
return
end
if event.kind == "item" then
hero:AddItemByName(name)
elseif event.kind == "ability" then
hero:AddAbility(name)
end
end
function HeroDebugPanel.prototype.resetHero(self, hero)
if not hero:HasModifier(modifier_debug_manual_control.name) then
return
end
local player = hero:GetPlayerOwner()
if not player then
return
end
local playerId = hero:GetPlayerID()
local heroName = hero:GetUnitName()
local team = hero:GetTeamNumber()
local spawnLoc = hero:GetAbsOrigin()
hero:Destroy()
self:spawnDebugHero(
player,
playerId,
heroName,
team,
spawnLoc
)
end
function HeroDebugPanel.prototype.setInvulnerable(self, hero, invulnerable)
local units = hero:IsRealHero() and hero:GetAdditionalOwnedUnits() or ({})
units[#units + 1] = hero
for ____, unit in ipairs(units) do
if invulnerable then
unit:AddNewModifier(hero, nil, modifier_debug_invulnerable.name, {})
else
unit:RemoveModifierByName(modifier_debug_invulnerable.name)
end
end
end
function HeroDebugPanel.prototype.onRemoveHero(self, event)
local entIndex = tonumber(event.str)
if entIndex == nil then
return
end
local hero = EntIndexToHScript(entIndex)
if not hero or hero:IsNull() or not hero:IsHero() then
return
end
if not hero:HasModifier(modifier_debug_manual_control.name) then
return
end
hero:Destroy()
CustomGameEventManager:Send_ServerToAllClients("remove_hero_entry", {entindex = entIndex})
end
function HeroDebugPanel.prototype.toggleFreeSpells(self)
local enabled = Convars:GetInt("dota_ability_debug") == 1
Convars:SetInt("dota_ability_debug", enabled and 0 or 1)
if not enabled then
SendToServerConsole("dota_dev hero_refresh")
end
end
function HeroDebugPanel.prototype.toggleDayNight(self)
GameRules:SetTimeOfDay(GameRules:IsDaytime() and 0.751 or 0.251)
end
function HeroDebugPanel.prototype.parseVectorStr(self, str)
local start = (string.find(str, "(", nil, true) or 0) - 1
local ____end = (string.find(str, ")", nil, true) or 0) - 1
local inner = start >= 0 and ____end > start and __TS__StringSubstring(str, start + 1, ____end) or str
local parts = __TS__StringSplit(inner, ",")
if #parts < 3 then
return nil
end
local x = tonumber(__TS__StringTrim(parts[1]))
local y = tonumber(__TS__StringTrim(parts[2]))
local z = tonumber(__TS__StringTrim(parts[3]))
if x == nil or y == nil or z == nil then
return nil
end
return Vector(x, y, z)
end
function HeroDebugPanel.prototype.onMoveToCoord(self, event)
local hero = self:getSelectedHero(event.PlayerID)
if not hero then
return
end
local target = self:parseVectorStr(event.str)
if not target then
return
end
FindClearSpaceForUnit(hero, target, false)
end
function HeroDebugPanel.prototype.onSpawnTreasure(self, event)
local point = self:parseVectorStr(event.str)
if not point then
return
end
GameRules.Treasure:debugSpawnAt(point)
end
function HeroDebugPanel.prototype.spawnRune(self, event, runeType)
local hero = self:getSelectedHero(event.PlayerID)
if not hero then
return
end
local target = hero:GetAbsOrigin():__add(hero:GetForwardVector():__mul(200))
target.z = GetGroundHeight(target, nil)
CreateRune(target, runeType)
end
function HeroDebugPanel.prototype.onHeroFinishSpawn(self, keys)
local hero = EntIndexToHScript(keys.heroindex)
if not hero or hero:IsNull() then
return
end
local playerId = hero:GetPlayerOwnerID()
if playerId < 0 or PlayerResource:IsFakeClient(playerId) then
return
end
if self.hudCreatedPlayers:has(playerId) then
return
end
self.hudCreatedPlayers:add(playerId)
CustomUI:DynamicHud_Create(playerId, "AIB_HeroDebugPanel", "file://{resources}/layout/custom_game/eyeherodemo/eyeherodemo.xml", {})
self:sendSpawnHeroId(DEFAULT_SPAWN_HERO_ID)
end
function HeroDebugPanel.prototype.onNpcSpawned(self, keys)
local unit = EntIndexToHScript(keys.entindex)
if not unit then
return
end
local hero = unit
local isRealHero = hero:IsRealHero()
local isClone = hero:IsClone()
local isTempestDouble = hero:IsTempestDouble()
if not isRealHero or isClone or isTempestDouble then
return
end
if hero:HasModifier(modifier_debug_manual_control.name) then
return
end
local playerId = hero:GetPlayerOwnerID()
if playerId >= 0 and not PlayerResource:IsFakeClient(playerId) then
local prev = self.playerHeroEntIndex:get(playerId)
if prev ~= nil and prev ~= keys.entindex then
CustomGameEventManager:Send_ServerToAllClients("remove_hero_entry", {entindex = prev})
end
self.playerHeroEntIndex:set(playerId, keys.entindex)
CustomGameEventManager:Send_ServerToAllClients(
"set_player_hero_id",
{hero_id = hero:GetHeroID()}
)
end
if keys.is_respawn == 0 then
CustomGameEventManager:Send_ServerToAllClients("add_new_hero_entry", {entindex = keys.entindex})
end
end
return ____exports
