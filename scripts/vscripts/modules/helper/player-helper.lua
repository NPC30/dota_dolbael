local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/helper/player-helper.lua"
__TS__SourceMapTraceBack("modules/helper/player-helper.lua", {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["18"] = 9,["19"] = 2,["20"] = 12,["21"] = 13,["22"] = 14,["23"] = 15,["25"] = 17,["26"] = 12,["27"] = 20,["28"] = 21,["29"] = 22,["31"] = 24,["32"] = 20,["33"] = 27,["34"] = 28,["35"] = 29,["36"] = 30,["38"] = 32,["39"] = 27,["40"] = 35,["42"] = 36,["43"] = 36,["44"] = 37,["45"] = 38,["47"] = 36,["50"] = 35,["51"] = 43,["53"] = 44,["54"] = 44,["55"] = 45,["56"] = 46,["57"] = 47,["58"] = 48,["59"] = 49,["63"] = 44,["66"] = 54,["67"] = 43,["68"] = 57,["69"] = 58,["70"] = 59,["72"] = 61,["73"] = 57,["74"] = 64,["75"] = 65,["76"] = 64,["77"] = 68,["78"] = 69,["79"] = 70,["80"] = 71,["81"] = 72,["83"] = 70,["84"] = 75,["85"] = 68});
local ____exports = {}
____exports.PlayerHelper = __TS__Class()
local PlayerHelper = ____exports.PlayerHelper
PlayerHelper.name = "PlayerHelper"
function PlayerHelper.prototype.____constructor(self)
end
function PlayerHelper.IsHumanPlayer(self, npc)
    if npc and npc:IsRealHero() then
        local playerId = npc:GetPlayerOwnerID()
        if playerId >= 0 then
            return self:IsHumanPlayerByPlayerId(playerId)
        end
    end
    return false
end
function PlayerHelper.IsHumanPlayerByPlayerId(self, playerId)
    local player = PlayerResource:GetPlayer(playerId)
    if player then
        return not PlayerResource:IsFakeClient(playerId)
    end
    return false
end
function PlayerHelper.IsBotPlayer(self, npc)
    if npc and npc:IsRealHero() then
        return self:IsBotPlayerByPlayerId(npc:GetPlayerID())
    end
    return false
end
function PlayerHelper.IsBotPlayerByPlayerId(self, playerId)
    local player = PlayerResource:GetPlayer(playerId)
    if player then
        return PlayerResource:IsFakeClient(playerId)
    end
    return false
end
function PlayerHelper.ForEachPlayer(self, callback)
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            if PlayerResource:IsValidPlayer(i) then
                callback(nil, i)
            end
            i = i + 1
        end
    end
end
function PlayerHelper.FindHeroBySteeamAccountId(self, steamAccountId)
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            if PlayerResource:IsValidPlayer(i) then
                local player = PlayerResource:GetPlayer(i)
                if player then
                    if PlayerResource:GetSteamAccountID(i) == steamAccountId then
                        return player:GetAssignedHero()
                    end
                end
            end
            i = i + 1
        end
    end
    return nil
end
function PlayerHelper.IsGoodTeamUnit(self, unit)
    if not unit then
        return false
    end
    return unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS
end
function PlayerHelper.IsGoodTeamPlayer(self, playerId)
    return PlayerResource:GetTeam(playerId) == DOTA_TEAM_GOODGUYS
end
function PlayerHelper.GetHumamPlayerCount(self)
    local count = 0
    self:ForEachPlayer(function(____, playerId)
        if self:IsHumanPlayerByPlayerId(playerId) then
            count = count + 1
        end
    end)
    return count
end
return ____exports
