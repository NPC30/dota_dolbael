local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/mode/mode-assassin.lua"
__TS__SourceMapTraceBack("ai/mode/mode-assassin.lua", {["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 5,["17"] = 5,["19"] = 5,["20"] = 6,["21"] = 5,["22"] = 8,["23"] = 9,["24"] = 10,["25"] = 11,["26"] = 13,["27"] = 17,["29"] = 21,["30"] = 22,["31"] = 23,["33"] = 26,["34"] = 27,["35"] = 27,["36"] = 27,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 27,["41"] = 27,["42"] = 27,["43"] = 27,["44"] = 27,["45"] = 40,["46"] = 41,["48"] = 45,["49"] = 46,["51"] = 51,["52"] = 53,["53"] = 55,["55"] = 58,["56"] = 59,["57"] = 60,["58"] = 62,["59"] = 63,["60"] = 64,["61"] = 65,["65"] = 70,["66"] = 72,["67"] = 73,["69"] = 76,["70"] = 77,["71"] = 78,["73"] = 81,["74"] = 81,["75"] = 81,["76"] = 81,["77"] = 8,["78"] = 86,["79"] = 87,["81"] = 88,["82"] = 88,["83"] = 89,["84"] = 90,["85"] = 91,["86"] = 92,["87"] = 93,["88"] = 94,["92"] = 88,["95"] = 99,["96"] = 86});
local ____exports = {}
local ____bot_2Dpush_2Dtiming = require("ai.bot-push-timing")
local BotPushTiming = ____bot_2Dpush_2Dtiming.BotPushTiming
local ____mode_2Dbase = require("ai.mode.mode-base")
local ModeBase = ____mode_2Dbase.ModeBase
local ____mode_2Denum = require("ai.mode.mode-enum")
local ModeEnum = ____mode_2Denum.ModeEnum
____exports.ModeAssassin = __TS__Class()
local ModeAssassin = ____exports.ModeAssassin
ModeAssassin.name = "ModeAssassin"
__TS__ClassExtends(ModeAssassin, ModeBase)
function ModeAssassin.prototype.____constructor(self, ...)
    ModeBase.prototype.____constructor(self, ...)
    self.mode = ModeEnum.ASSASSIN
end
function ModeAssassin.prototype.GetDesire(self, heroAI)
    local desire = 0
    local hero = heroAI:GetHero()
    local pid = hero:GetPlayerOwnerID()
    if PlayerResource:IsValidPlayerID(pid) and PlayerResource:IsFakeClient(pid) and BotPushTiming:isAfterPhaseStart(heroAI.gameTime) then
        return 0
    end
    local gameTime = GameRules:GetDOTATime(false, false)
    if gameTime > 13 * 60 then
        return 0
    end
    local heroName = heroAI:GetHero():GetUnitName()
    local assassinHeroes = {
        "npc_dota_hero_bounty_hunter",
        "npc_dota_hero_phantom_assassin",
        "npc_dota_hero_riki",
        "npc_dota_hero_bloodseeker",
        "npc_dota_hero_lina",
        "npc_dota_hero_lion",
        "npc_dota_hero_skywrath_mage",
        "npc_dota_hero_zuus",
        "npc_dota_hero_nevermore"
    }
    if not __TS__ArrayIncludes(assassinHeroes, heroName) and not hero.isBoss then
        return 0
    end
    if heroAI:GetHero():GetLevel() < 20 then
        return 0
    end
    local target = heroAI:FindNearestAloneEnemyAssassin()
    if not target then
        return 0
    end
    if hero.isBoss then
        local bossLevel = hero:GetLevel()
        local targetLevel = 10
        if bossLevel >= targetLevel then
            local highestPlayerLevel = self:GetHighestPlayerLevel()
            if bossLevel >= highestPlayerLevel then
                desire = desire + 0.3
            end
        end
    end
    desire = desire + 0.5
    if heroAI:GetHero():GetHealthPercent() > 70 then
        desire = desire + 0.2
    end
    local nearbyAllies = heroAI:FindNearbyAllies(1500)
    if #nearbyAllies >= 3 then
        desire = desire - 0.1
    end
    return math.max(
        0,
        math.min(desire, 0.8)
    )
end
function ModeAssassin.prototype.GetHighestPlayerLevel(self)
    local highestLevel = 0
    do
        local i = 0
        while i < 24 do
            if PlayerResource:IsValidPlayerID(i) and not PlayerResource:IsFakeClient(i) then
                local playerHero = PlayerResource:GetSelectedHeroEntity(i)
                if playerHero and not playerHero:IsNull() then
                    local level = playerHero:GetLevel()
                    if level > highestLevel then
                        highestLevel = level
                    end
                end
            end
            i = i + 1
        end
    end
    return highestLevel
end
return ____exports
