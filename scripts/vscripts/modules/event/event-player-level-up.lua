local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/event-player-level-up.lua"
__TS__SourceMapTraceBack("modules/event/event-player-level-up.lua", {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 8,["20"] = 9,["21"] = 8,["23"] = 11,["24"] = 11,["25"] = 11,["26"] = 11,["27"] = 11,["28"] = 10,["29"] = 14,["30"] = 15,["31"] = 16,["32"] = 17,["35"] = 21,["36"] = 22,["37"] = 14,["38"] = 29,["39"] = 30,["40"] = 31,["41"] = 32,["43"] = 34,["44"] = 35,["45"] = 36,["47"] = 29,["48"] = 46,["49"] = 47,["50"] = 47,["51"] = 47,["52"] = 48,["55"] = 51,["56"] = 53,["58"] = 58,["60"] = 47,["61"] = 47,["62"] = 46,["63"] = 8,["64"] = 9});
local ____exports = {}
local ____player = require("api.player")
local Player = ____player.Player
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____GameConfig = require("modules.GameConfig")
local GameConfig = ____GameConfig.GameConfig
local ____bot_2Dability = require("modules.helper.bot-ability")
local BotAbility = ____bot_2Dability.BotAbility
local ____bot_2Dintellect_2Dcap = require("modules.helper.bot-intellect-cap")
local BotIntellectCap = ____bot_2Dintellect_2Dcap.BotIntellectCap
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
____exports.EventPlayerLevelUp = __TS__Class()
local EventPlayerLevelUp = ____exports.EventPlayerLevelUp
EventPlayerLevelUp.name = "EventPlayerLevelUp"
function EventPlayerLevelUp.prototype.____constructor(self)
    ListenToGameEvent(
        "dota_player_gained_level",
        function(____, keys) return self:OnPlayerLevelUp(keys) end,
        self
    )
end
function EventPlayerLevelUp.prototype.OnPlayerLevelUp(self, keys)
    local hero = EntIndexToHScript(keys.hero_entindex)
    if not hero then
        print("[Event] ERROR: OnPlayerLevelUp hero is undefined")
        return
    end
    self:UpdatePlayerAndBot(hero)
    self:SetDeathXP(hero, keys.level)
end
function EventPlayerLevelUp.prototype.UpdatePlayerAndBot(self, hero)
    if PlayerHelper:IsHumanPlayer(hero) then
        print("[Event] OnPlayerLevelUp SetPlayerProperty " .. hero:GetUnitName())
        Player:SetPlayerProperty(hero)
    end
    if PlayerHelper:IsBotPlayer(hero) then
        BotAbility:LevelUpBotAbility(hero)
        BotIntellectCap:Update(hero)
    end
end
function EventPlayerLevelUp.prototype.SetDeathXP(self, hero, level)
    Timers:CreateTimer(
        0.5,
        function()
            if hero:IsNull() then
                return
            end
            if level <= GameConfig.LEVEL_THRESHOLD then
                hero:SetCustomDeathXP(GameConfig.LOW_LEVEL_BASE_XP + hero:GetCurrentXP() * GameConfig.LOW_LEVEL_XP_FACTOR)
            else
                hero:SetCustomDeathXP(GameConfig.HIGH_LEVEL_BASE_XP + hero:GetCurrentXP() * GameConfig.HIGH_LEVEL_XP_FACTOR)
            end
        end
    )
end
EventPlayerLevelUp = __TS__DecorateLegacy({reloadable}, EventPlayerLevelUp)
____exports.EventPlayerLevelUp = EventPlayerLevelUp
return ____exports
