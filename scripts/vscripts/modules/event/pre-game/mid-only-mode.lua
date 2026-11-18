local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local ____exports = {}
local ____ga4_2Dplayer_2Dlanguage_2Dtracker = require("api.analytics.ga4.ga4-player-language-tracker")
local GA4PlayerLanguageTracker = ____ga4_2Dplayer_2Dlanguage_2Dtracker.GA4PlayerLanguageTracker
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
____exports.MidOnlyMode = __TS__Class()
local MidOnlyMode = ____exports.MidOnlyMode
MidOnlyMode.name = "MidOnlyMode"
function MidOnlyMode.prototype.____constructor(self)
end
function MidOnlyMode.Apply(self)
print("[MidOnlyMode] Apply")
self:removeTopBotBuildings()
self:sendMessage()
end
function MidOnlyMode.removeTopBotBuildings(self)
local towers = Entities:FindAllByClassname("npc_dota_tower")
for ____, tower in ipairs(towers) do
local unitName = tower:GetUnitName()
if __TS__StringIncludes(unitName, "top") or __TS__StringIncludes(unitName, "bot") then
tower:ForceKill(false)
end
end
local barracks = Entities:FindAllByClassname("npc_dota_barracks")
for ____, barrack in ipairs(barracks) do
local unitName = barrack:GetUnitName()
if __TS__StringIncludes(unitName, "top") or __TS__StringIncludes(unitName, "bot") then
barrack:ForceKill(false)
end
end
end
function MidOnlyMode.sendMessage(self)
local msgChinese = "<font color='#FFD700'>中路乱斗模式已启用：仅保留中路，小兵金钱经验更多</font>"
local msgEnglish = "<font color='#FFD700'>Mid Only Mode enabled: only mid lane remains, creep gold/XP increased</font>"
local hasChinese = false
local hasNonChinese = false
PlayerHelper:ForEachPlayer(function(____, playerId)
local steamId = PlayerResource:GetSteamAccountID(playerId)
local language = GA4PlayerLanguageTracker:GetLanguage(steamId)
if not language then
return
end
if language == "schinese" or language == "tchinese" then
hasChinese = true
else
hasNonChinese = true
end
end)
if hasChinese then
GameRules:SendCustomMessage(msgChinese, 0, 0)
end
if hasNonChinese then
GameRules:SendCustomMessage(msgEnglish, 0, 0)
end
end
return ____exports
