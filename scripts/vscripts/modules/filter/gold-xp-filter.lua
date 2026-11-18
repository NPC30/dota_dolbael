local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/filter/gold-xp-filter.lua"
__TS__SourceMapTraceBack("modules/filter/gold-xp-filter.lua", {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 4,["16"] = 11,["17"] = 11,["18"] = 11,["19"] = 11,["20"] = 11,["21"] = 11,["22"] = 11,["23"] = 11,["24"] = 11,["25"] = 11,["26"] = 11,["27"] = 11,["28"] = 11,["29"] = 7,["30"] = 7,["31"] = 7,["32"] = 7,["33"] = 8,["34"] = 8,["35"] = 8,["36"] = 8,["37"] = 6,["38"] = 37,["39"] = 38,["40"] = 39,["41"] = 40,["42"] = 41,["43"] = 43,["44"] = 44,["46"] = 48,["47"] = 50,["49"] = 52,["50"] = 53,["51"] = 55,["52"] = 56,["54"] = 59,["55"] = 61,["56"] = 37,["57"] = 64,["58"] = 65,["59"] = 66,["60"] = 67,["61"] = 68,["62"] = 69,["63"] = 70,["64"] = 71,["65"] = 72,["66"] = 73,["67"] = 74,["68"] = 75,["69"] = 76,["70"] = 77,["71"] = 78,["73"] = 80,["75"] = 64,["76"] = 84,["77"] = 85,["78"] = 86,["79"] = 87,["80"] = 88,["81"] = 90,["82"] = 91,["84"] = 94,["85"] = 96,["86"] = 84,["87"] = 107,["88"] = 108,["89"] = 109,["90"] = 110,["91"] = 112,["92"] = 113,["93"] = 114,["95"] = 116,["96"] = 117,["97"] = 107,["98"] = 120,["99"] = 121,["100"] = 124,["101"] = 125,["102"] = 126,["103"] = 128,["105"] = 131,["107"] = 134,["108"] = 135,["109"] = 136,["111"] = 139,["112"] = 120,["113"] = 142,["114"] = 143,["115"] = 145,["116"] = 146,["117"] = 147,["118"] = 148,["120"] = 150,["122"] = 153,["123"] = 154,["124"] = 155,["126"] = 157,["127"] = 142,["128"] = 166,["129"] = 167,["130"] = 168,["132"] = 170,["133"] = 171,["134"] = 166,["135"] = 4,["136"] = 5});
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
____exports.GoldXPFilter = __TS__Class()
local GoldXPFilter = ____exports.GoldXPFilter
GoldXPFilter.name = "GoldXPFilter"
function GoldXPFilter.prototype.____constructor(self)
    self.GOLD_REASON_NOT_FILTER = {
        DOTA_ModifyGold_Unspecified,
        DOTA_ModifyGold_Death,
        DOTA_ModifyGold_Buyback,
        DOTA_ModifyGold_PurchaseConsumable,
        DOTA_ModifyGold_PurchaseItem,
        DOTA_ModifyGold_AbandonedRedistribute,
        DOTA_ModifyGold_SellItem,
        DOTA_ModifyGold_AbilityCost,
        DOTA_ModifyGold_CheatCommand,
        DOTA_ModifyGold_SelectionPenalty,
        DOTA_ModifyGold_GameTick
    }
    GameRules:GetGameModeEntity():SetModifyGoldFilter(
        function(____, args) return self:filterGold(args) end,
        self
    )
    GameRules:GetGameModeEntity():SetModifyExperienceFilter(
        function(____, args) return self:filterXP(args) end,
        self
    )
end
function GoldXPFilter.prototype.filterGold(self, args)
    local gold = args.gold
    local playerID = args.player_id_const
    local reason = args.reason_const
    local mul = self:getPlayerGoldXpMultiplier(playerID)
    if __TS__ArrayIncludes(self.GOLD_REASON_NOT_FILTER, reason) then
        return true
    end
    if reason == DOTA_ModifyGold_AbilityGold then
        mul = math.sqrt(mul)
    end
    if reason == DOTA_ModifyGold_HeroKill then
        gold = self:filterHeroKillGold(gold)
        gold = gold * self:rewardFilterByKill(playerID)
        mul = self:filterHeroKillGoldByMultiplier(mul)
    end
    args.gold = math.floor(gold * mul)
    return true
end
function GoldXPFilter.prototype.filterHeroKillGold(self, gold)
    if gold > 100000 then
        return gold / 30 + 7750 - 100000 / 30
    elseif gold > 50000 then
        return gold / 24 + 5250 - 50000 / 20
    elseif gold > 20000 then
        return gold / 18 + 3250 - 20000 / 15
    elseif gold > 10000 then
        return gold / 10 + 1250
    elseif gold > 3200 then
        return gold / 8 + 1000
    elseif gold > 1600 then
        return gold / 4 + 600
    elseif gold > 400 then
        return gold / 2 + 200
    else
        return gold
    end
end
function GoldXPFilter.prototype.filterXP(self, args)
    local xp = args.experience
    local playerID = args.player_id_const
    local reason = args.reason_const
    local mul = self:getPlayerXpMultiplier(playerID)
    if reason == DOTA_ModifyXP_HeroKill then
        mul = self:filterHeroKillGoldByMultiplier(mul)
    end
    args.experience = math.floor(xp * mul)
    return true
end
function GoldXPFilter.prototype.rewardFilterByKill(self, playerID)
    local playerKill = PlayerResource:GetKills(playerID)
    local teamKill = PlayerResource:GetTeamKills(PlayerResource:GetTeam(playerID))
    local teamCount = PlayerResource:GetPlayerCountForTeam(PlayerResource:GetTeam(playerID))
    local rewardMulti = 1
    if teamKill < 10 then
        return rewardMulti
    end
    rewardMulti = 1 + (1 / teamCount - playerKill / teamKill) / 2
    return rewardMulti
end
function GoldXPFilter.prototype.getPlayerGoldXpMultiplier(self, playerID)
    local mul = 1
    if PlayerHelper:IsHumanPlayerByPlayerId(playerID) then
        mul = GameRules.Option.radiantGoldXpMultiplier
    elseif PlayerHelper:IsGoodTeamPlayer(playerID) then
        mul = GameRules.Option.radiantGoldXpMultiplier
    else
        mul = GameRules.Option.direGoldXpMultiplier
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerID)
    if hero and hero.isBoss then
        mul = mul * 2
    end
    return mul
end
function GoldXPFilter.prototype.getPlayerXpMultiplier(self, playerID)
    local mul = 1
    if PlayerHelper:IsHumanPlayerByPlayerId(playerID) then
        mul = GameRules.Option.radiantGoldXpMultiplier
    elseif PlayerHelper:IsGoodTeamPlayer(playerID) then
        mul = GameRules.Option.radiantGoldXpMultiplier
    else
        mul = GameRules.Option.direXpMultiplier or GameRules.Option.direGoldXpMultiplier
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerID)
    if hero and hero.isBoss then
        mul = mul * 2
    end
    return mul
end
function GoldXPFilter.prototype.filterHeroKillGoldByMultiplier(self, mul)
    if mul <= 1 then
        return mul
    end
    local reduceRate = 0.5
    return 1 + (mul - 1) * reduceRate
end
GoldXPFilter = __TS__DecorateLegacy({reloadable}, GoldXPFilter)
____exports.GoldXPFilter = GoldXPFilter
return ____exports
