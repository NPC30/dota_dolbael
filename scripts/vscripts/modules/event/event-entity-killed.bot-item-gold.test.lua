local ____lualib = require("lualib_bundle")
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/event-entity-killed.bot-item-gold.test.lua"
__TS__SourceMapTraceBack("modules/event/event-entity-killed.bot-item-gold.test.lua", {["8"] = 7,["9"] = 7,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 11,["15"] = 11,["16"] = 11,["17"] = 11,["18"] = 12,["19"] = 14,["20"] = 15,["21"] = 15,["22"] = 15,["23"] = 15,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 19,["28"] = 19,["29"] = 19,["30"] = 19,["31"] = 19,["32"] = 19,["33"] = 19,["34"] = 19,["35"] = 19,["36"] = 19,["37"] = 19,["38"] = 19,["39"] = 14,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 34,["44"] = 35,["45"] = 36,["46"] = 38,["47"] = 39,["48"] = 43,["49"] = 46,["50"] = 47,["51"] = 48,["52"] = 51,["53"] = 52,["54"] = 52,["55"] = 52,["56"] = 51,["57"] = 51,["58"] = 51,["59"] = 51,["60"] = 63,["61"] = 66,["62"] = 66,["63"] = 66,["64"] = 69,["65"] = 70,["66"] = 70,["68"] = 71,["69"] = 71,["71"] = 72,["72"] = 66,["73"] = 74,["74"] = 75,["75"] = 75,["80"] = 75,["81"] = 66,["82"] = 77,["83"] = 78,["84"] = 79,["85"] = 79,["87"] = 80,["88"] = 80,["89"] = 80,["90"] = 80,["91"] = 80,["92"] = 66,["93"] = 66,["94"] = 86,["95"] = 33,["96"] = 33,["97"] = 89,["98"] = 89,["99"] = 89,["100"] = 89,["101"] = 90,["102"] = 91,["103"] = 93,["104"] = 95,["105"] = 100,["106"] = 105,["107"] = 106,["108"] = 89,["109"] = 89,["110"] = 111,["111"] = 111,["112"] = 111,["113"] = 111,["114"] = 112,["115"] = 113,["116"] = 114,["117"] = 116,["118"] = 118,["119"] = 123,["120"] = 128,["121"] = 111,["122"] = 111,["123"] = 11,["124"] = 11});
local ____exports = {}
local ____event_2Dentity_2Dkilled = require("modules.event.event-entity-killed")
local EventEntityKilled = ____event_2Dentity_2Dkilled.EventEntityKilled
jest:mock(
"../../api/player",
function() return {Player = {IsMemberStatic = jest:fn(function() return false end)}} end
)
describe(
nil,
"EventEntityKilled bot item death gold reward",
function()
local playerHeroes = {}
local function createKilledBot(self, itemCosts)
local items = __TS__ArrayMap(
itemCosts,
function(____, cost) return {
GetCost = jest:fn(function() return cost end),
IsNull = jest:fn(function() return false end)
} end
)
return {
isBoss = false,
IsRealHero = jest:fn(function() return true end),
IsReincarnating = jest:fn(function() return false end),
GetPlayerID = jest:fn(function() return 3 end),
GetPlayerOwnerID = jest:fn(function() return 3 end),
GetTeamNumber = jest:fn(function() return DOTA_TEAM_BADGUYS end),
GetItemInSlot = jest:fn(function(____, slot) return items[slot + 1] end),
GetLevel = jest:fn(function() return 20 end),
SetTimeUntilRespawn = jest:fn(),
FindModifierByName = jest:fn(function() return nil end)
}
end
beforeEach(
nil,
function()
playerHeroes[0] = {ModifyGold = jest:fn()}
playerHeroes[1] = {ModifyGold = jest:fn()}
playerHeroes[2] = {ModifyGold = jest:fn()}
global.DOTA_MAX_TEAM_PLAYERS = 4
global.DotaTeam = {GOODGUYS = 2, BADGUYS = 3}
global.ModifyGoldReason = {UNSPECIFIED = 0}
global.ListenToGameEvent = jest:fn()
global.print = jest:fn()
global.Timers = {CreateTimer = jest:fn()}
global.GameRules = {
AbyssMode = {
IsEnabled = jest:fn(function() return false end),
OnBotKilled = jest:fn()
},
Lottery = {openNextStagedLotteryForPlayer = jest:fn()},
Option = {respawnTimePercentage = 100}
}
global.Player = {IsMemberStatic = jest:fn(function() return false end)}
global.PlayerResource = {
IsValidPlayer = jest:fn(function(____, playerId) return playerId >= 0 and playerId <= 3 end),
GetPlayer = jest:fn(function(____, playerId) return playerId >= 0 and playerId <= 3 and ({}) or nil end),
GetSteamAccountID = jest:fn(function(____, playerId)
if playerId == 0 then
return 111
end
if playerId == 1 then
return 222
end
return 0
end),
GetTeam = jest:fn(function(____, playerId)
local ____temp_0
if playerId == 3 then
____temp_0 = DOTA_TEAM_BADGUYS
else
____temp_0 = DOTA_TEAM_GOODGUYS
end
return ____temp_0
end),
GetSelectedHeroEntity = jest:fn(function(____, playerId)
local hero = playerHeroes[playerId]
if not hero then
return nil
end
return __TS__ObjectAssign(
{},
hero,
{IsRealHero = jest:fn(function() return true end)}
)
end)
}
global.IsInToolsMode = jest:fn(function() return false end)
end
)
it(
nil,
"grants each Steam human a share of dead Dire bot item worth without gold filter",
function()
local eventEntityKilled = __TS__New(EventEntityKilled)
local killedBot = createKilledBot(nil, {4000, 3000, 2000, 1000})
eventEntityKilled:onHeroKilled(killedBot, nil)
expect(nil, playerHeroes[0].ModifyGold):toHaveBeenCalledWith(150, true, DOTA_ModifyGold_Unspecified)
expect(nil, playerHeroes[1].ModifyGold):toHaveBeenCalledWith(150, true, DOTA_ModifyGold_Unspecified)
expect(nil, playerHeroes[2].ModifyGold)["not"]:toHaveBeenCalled()
expect(nil, global.print):toHaveBeenCalledWith("[EventEntityKilled] Dire bot item death gold: itemWorth=10000, baseGold=300, divisor=2, finalGoldPerPlayer=150, rewardPlayers=2")
end
)
it(
nil,
"counts Goodguys bots in the divisor when running in tools mode",
function()
global.IsInToolsMode = jest:fn(function() return true end)
local eventEntityKilled = __TS__New(EventEntityKilled)
local killedBot = createKilledBot(nil, {4000, 3000, 2000, 1000})
eventEntityKilled:onHeroKilled(killedBot, nil)
expect(nil, playerHeroes[0].ModifyGold):toHaveBeenCalledWith(200, true, DOTA_ModifyGold_Unspecified)
expect(nil, playerHeroes[1].ModifyGold):toHaveBeenCalledWith(200, true, DOTA_ModifyGold_Unspecified)
expect(nil, playerHeroes[2].ModifyGold)["not"]:toHaveBeenCalled()
end
)
end
)
return ____exports
