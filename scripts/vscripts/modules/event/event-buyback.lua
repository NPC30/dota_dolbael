local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/event-buyback.lua"
__TS__SourceMapTraceBack("modules/event/event-buyback.lua", {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 6,["16"] = 7,["17"] = 6,["19"] = 9,["20"] = 9,["21"] = 9,["22"] = 9,["23"] = 9,["24"] = 8,["25"] = 12,["26"] = 13,["27"] = 14,["28"] = 15,["31"] = 18,["34"] = 21,["37"] = 26,["38"] = 27,["41"] = 32,["42"] = 33,["43"] = 35,["44"] = 35,["45"] = 35,["46"] = 36,["47"] = 35,["48"] = 35,["50"] = 12,["51"] = 41,["52"] = 42,["53"] = 43,["54"] = 44,["56"] = 41,["57"] = 6,["58"] = 7});
local ____exports = {}
local ____player = require("api.player")
local Player = ____player.Player
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____GameConfig = require("modules.GameConfig")
local GameConfig = ____GameConfig.GameConfig
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
____exports.EventDotaBuyback = __TS__Class()
local EventDotaBuyback = ____exports.EventDotaBuyback
EventDotaBuyback.name = "EventDotaBuyback"
function EventDotaBuyback.prototype.____constructor(self)
    ListenToGameEvent(
        "dota_buyback",
        function(____, keys) return self:onBuyback(keys) end,
        self
    )
end
function EventDotaBuyback.prototype.onBuyback(self, keys)
    local playerId = keys.player_id
    local hero = EntIndexToHScript(keys.entindex)
    if not hero then
        return
    end
    if not hero:IsRealHero() then
        return
    end
    if hero:IsReincarnating() then
        return
    end
    if GameRules.AbyssMode:IsEnabled() and PlayerHelper:IsBotPlayer(hero) then
        GameRules.AbyssMode:OnBotBuyback(hero)
        return
    end
    local steamAccountID = PlayerResource:GetSteamAccountID(playerId)
    if Player:IsMemberStatic(steamAccountID) then
        Timers:CreateTimer(
            0.5,
            function()
                self:setBuyBackCooldownTime(hero)
            end
        )
    end
end
function EventDotaBuyback.prototype.setBuyBackCooldownTime(self, hero)
    local buybackTime = hero:GetBuybackCooldownTime()
    if buybackTime > GameConfig.MEMBER_BUYBACK_CD then
        hero:SetBuybackCooldownTime(GameConfig.MEMBER_BUYBACK_CD)
    end
end
EventDotaBuyback = __TS__DecorateLegacy({reloadable}, EventDotaBuyback)
____exports.EventDotaBuyback = EventDotaBuyback
return ____exports
