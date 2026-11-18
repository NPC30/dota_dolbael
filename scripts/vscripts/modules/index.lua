local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/index.lua"
__TS__SourceMapTraceBack("modules/index.lua", {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 13,["31"] = 13,["32"] = 14,["33"] = 14,["34"] = 15,["35"] = 15,["36"] = 16,["37"] = 16,["38"] = 17,["39"] = 17,["40"] = 18,["41"] = 18,["42"] = 19,["43"] = 19,["44"] = 20,["45"] = 20,["48"] = 40,["49"] = 43,["50"] = 45,["51"] = 47,["52"] = 49,["53"] = 51,["54"] = 53,["55"] = 55,["56"] = 57,["57"] = 59,["58"] = 61,["59"] = 63,["60"] = 65,["61"] = 67,["63"] = 70,["64"] = 70,["66"] = 72,["67"] = 72,["69"] = 74,["70"] = 74,["72"] = 76,["73"] = 76,["75"] = 78,["76"] = 78,["78"] = 80,["79"] = 80,["81"] = 82,["82"] = 82,["84"] = 84,["85"] = 84,["87"] = 40});
local ____exports = {}
local ____AI = require("ai.AI")
local AI = ____AI.AI
local ____analytics = require("api.analytics.analytics")
local Analytics = ____analytics.Analytics
local ____player = require("api.player")
local Player = ____player.Player
local ____showcase = require("api.showcase")
local Showcase = ____showcase.Showcase
local ____GameConfig = require("modules.GameConfig")
local GameConfig = ____GameConfig.GameConfig
local ____virtual_2Dgold_2Dbank = require("modules.bank.virtual-gold-bank")
local VirtualGoldBank = ____virtual_2Dgold_2Dbank.VirtualGoldBank
local ____Debug = require("modules.debug.Debug")
local Debug = ____Debug.Debug
local ____event = require("modules.event.event")
local Event = ____event.Event
local ____gold_2Dxp_2Dfilter = require("modules.filter.gold-xp-filter")
local GoldXPFilter = ____gold_2Dxp_2Dfilter.GoldXPFilter
local ____hero_2Dban_2Dpick = require("modules.hero.hero-ban-pick")
local HeroBanPick = ____hero_2Dban_2Dpick.HeroBanPick
local ____lottery = require("modules.lottery.lottery")
local Lottery = ____lottery.Lottery
local ____option = require("modules.option")
local Option = ____option.Option
local ____property_controller = require("modules.property.property_controller")
local PropertyController = ____property_controller.PropertyController
local ____treasure = require("modules.treasure.treasure")
local Treasure = ____treasure.Treasure
local ____activity_2Dnotice = require("modules.activity-notice.activity-notice")
local ActivityNotice = ____activity_2Dnotice.ActivityNotice
local ____abyss_2Dmode = require("modules.abyss.abyss-mode")
local AbyssMode = ____abyss_2Dmode.AbyssMode
local ____player_2Dtitle = require("modules.player-title.player-title")
local PlayerTitleService = ____player_2Dtitle.PlayerTitleService
local ____player_2Dtip = require("modules.player-tip.player-tip")
local PlayerTip = ____player_2Dtip.PlayerTip
local ____skill_2Dtome_2Dauthorization = require("modules.lottery.skill-tome-authorization")
local SkillTomeAuthorization = ____skill_2Dtome_2Dauthorization.SkillTomeAuthorization
local ____game = require("api.game")
local Game = ____game.Game
--- 这个方法会在game_mode实体生成之后调用，且仅调用一次
-- 因此在这里作为单例模式使用
function ____exports.ActivateModules(self)
    if GameRules.GameConfig == nil then
        __TS__New(Debug)
        __TS__New(Event)
        __TS__New(PropertyController)
        __TS__New(GoldXPFilter)
        HeroBanPick:RegisterListeners()
        PlayerTip:RegisterListeners()
        SkillTomeAuthorization:initialize()
        Game:RegisterListeners()
        __TS__New(VirtualGoldBank)
        __TS__New(Player)
        __TS__New(Showcase)
        __TS__New(ActivityNotice)
    end
    if GameRules.AI == nil then
        GameRules.AI = __TS__New(AI)
    end
    if GameRules.GameConfig == nil then
        GameRules.GameConfig = __TS__New(GameConfig)
    end
    if GameRules.Option == nil then
        GameRules.Option = __TS__New(Option)
    end
    if GameRules.Lottery == nil then
        GameRules.Lottery = __TS__New(Lottery)
    end
    if GameRules.Analytic == nil then
        GameRules.Analytic = __TS__New(Analytics)
    end
    if GameRules.Treasure == nil then
        GameRules.Treasure = __TS__New(Treasure)
    end
    if GameRules.PlayerTitle == nil then
        GameRules.PlayerTitle = __TS__New(PlayerTitleService)
    end
    if GameRules.AbyssMode == nil then
        GameRules.AbyssMode = __TS__New(AbyssMode)
    end
end
return ____exports
