local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/player-tip/player-tip.lua"
__TS__SourceMapTraceBack("modules/player-tip/player-tip.lua", {["8"] = 1,["9"] = 1,["10"] = 8,["11"] = 9,["12"] = 8,["14"] = 8,["15"] = 16,["16"] = 17,["17"] = 17,["18"] = 17,["19"] = 18,["20"] = 17,["21"] = 17,["22"] = 16,["23"] = 22,["24"] = 23,["25"] = 22,["26"] = 26,["27"] = 27,["28"] = 28,["29"] = 30,["30"] = 31,["33"] = 35,["34"] = 36,["37"] = 40,["38"] = 41,["41"] = 45,["42"] = 46,["43"] = 47,["44"] = 48,["45"] = 49,["46"] = 49,["47"] = 49,["48"] = 49,["51"] = 53,["52"] = 54,["53"] = 55,["54"] = 56,["55"] = 58,["56"] = 59,["57"] = 60,["58"] = 26,["59"] = 63,["60"] = 64,["61"] = 63,["62"] = 72,["63"] = 73,["64"] = 72,["65"] = 80,["66"] = 81,["67"] = 81,["68"] = 81,["69"] = 81,["70"] = 81,["71"] = 81,["72"] = 81,["73"] = 81,["74"] = 81,["75"] = 80,["76"] = 88,["77"] = 94,["78"] = 95,["79"] = 96,["80"] = 98,["81"] = 98,["82"] = 98,["83"] = 98,["84"] = 98,["85"] = 104,["86"] = 104,["87"] = 104,["88"] = 104,["89"] = 104,["90"] = 104,["91"] = 104,["92"] = 104,["93"] = 104,["94"] = 104,["95"] = 104,["96"] = 104,["97"] = 104,["98"] = 104,["99"] = 104,["100"] = 104,["101"] = 88,["102"] = 119,["103"] = 120,["104"] = 121,["105"] = 122,["107"] = 125,["108"] = 126,["109"] = 127,["111"] = 130,["112"] = 131,["113"] = 132,["115"] = 135,["116"] = 119,["117"] = 138,["118"] = 139,["119"] = 140,["120"] = 141,["122"] = 144,["123"] = 144,["124"] = 144,["125"] = 144,["126"] = 147,["127"] = 148,["129"] = 151,["130"] = 138,["131"] = 154,["132"] = 155,["133"] = 154,["134"] = 158,["135"] = 159,["136"] = 160,["139"] = 164,["140"] = 158,["141"] = 10,["142"] = 11,["143"] = 13,["144"] = 14,["145"] = 8,["146"] = 9});
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
____exports.PlayerTip = __TS__Class()
local PlayerTip = ____exports.PlayerTip
PlayerTip.name = "PlayerTip"
function PlayerTip.prototype.____constructor(self)
end
function PlayerTip.RegisterListeners(self)
    CustomGameEventManager:RegisterListener(
        "player_tip",
        function(_userId, event)
            self:OnPlayerTip(event)
        end
    )
end
function PlayerTip.GetReceivedBonus(self, playerId)
    return self.receivedByPlayer[tostring(playerId)] or 0
end
function PlayerTip.OnPlayerTip(self, event)
    local senderId = event.PlayerID
    local targetId = event.targetPlayerId
    if not self:IsValidHumanPlayer(senderId) or not self:IsValidPlayerSlot(targetId) then
        self:SendTipError(senderId, "打赏失败：只能由真人玩家给本局有效玩家打赏。")
        return
    end
    if senderId == targetId then
        self:SendTipError(senderId, "打赏失败：不能给自己打赏。")
        return
    end
    if PlayerResource:GetTeam(senderId) ~= PlayerResource:GetTeam(targetId) then
        self:SendTipError(senderId, "打赏失败：只能给队友打赏。")
        return
    end
    local senderKey = tostring(senderId)
    local targetKey = tostring(targetId)
    local usedCount = self.givenByPlayer[senderKey] or 0
    if usedCount >= self.MAX_TIPS_PER_PLAYER then
        self:SendTipError(
            senderId,
            ("打赏失败：每局最多打赏" .. tostring(self.MAX_TIPS_PER_PLAYER)) .. "次。"
        )
        return
    end
    local nextUsedCount = usedCount + 1
    local nextReceived = (self.receivedByPlayer[targetKey] or 0) + self.TIP_POINTS
    self.givenByPlayer[senderKey] = nextUsedCount
    self.receivedByPlayer[targetKey] = nextReceived
    self:PublishPlayerTipState(senderId)
    self:PublishPlayerTipState(targetId)
    self:BroadcastTipNotice(senderId, targetId, nextUsedCount, nextReceived)
end
function PlayerTip.IsValidHumanPlayer(self, playerId)
    return playerId >= 0 and PlayerResource:IsValidPlayerID(playerId) and PlayerResource:IsValidPlayer(playerId) and PlayerResource:GetSteamAccountID(playerId) > 0
end
function PlayerTip.IsValidPlayerSlot(self, playerId)
    return playerId >= 0 and PlayerResource:IsValidPlayerID(playerId) and PlayerResource:IsValidPlayer(playerId)
end
function PlayerTip.PublishPlayerTipState(self, playerId)
    CustomNetTables:SetTableValue(
        "player_tips",
        tostring(playerId),
        {
            given = self.givenByPlayer[tostring(playerId)] or 0,
            received = self.receivedByPlayer[tostring(playerId)] or 0,
            maxTips = self.MAX_TIPS_PER_PLAYER
        }
    )
end
function PlayerTip.BroadcastTipNotice(self, senderId, targetId, usedCount, totalReceived)
    local fromPlayerName = self:GetPlayerDisplayName(senderId)
    local targetPlayerName = self:GetPlayerDisplayName(targetId)
    local message = ((((fromPlayerName .. " 打赏了 ") .. targetPlayerName) .. " +") .. tostring(self.TIP_POINTS)) .. " 勇士积分"
    GameRules:SendCustomMessage(
        ((((("<font color='#FFD36B'>[打赏]</font> <font color='#66CCFF'>" .. fromPlayerName) .. "</font> 打赏了 <font color='#66FF99'>") .. targetPlayerName) .. "</font> <font color='#FFD36B'>+") .. tostring(self.TIP_POINTS)) .. "勇士积分</font>",
        0,
        0
    )
    CustomGameEventManager:Send_ServerToAllClients(
        "player_tip_notice",
        {
            fromPlayerName = fromPlayerName,
            fromPlayerId = senderId,
            fromHeroName = PlayerResource:GetSelectedHeroName(senderId),
            targetPlayerName = targetPlayerName,
            targetPlayerId = targetId,
            targetHeroName = PlayerResource:GetSelectedHeroName(targetId),
            bonus = self.TIP_POINTS,
            totalReceived = totalReceived,
            usedCount = usedCount,
            maxTips = self.MAX_TIPS_PER_PLAYER,
            message = message
        }
    )
end
function PlayerTip.GetPlayerDisplayName(self, playerId)
    local cachedName = self:GetCachedPlayerName(playerId)
    if cachedName ~= nil then
        return cachedName
    end
    local playerName = PlayerResource:GetPlayerName(playerId)
    if playerName and playerName ~= "" then
        return playerName
    end
    local heroName = PlayerResource:GetSelectedHeroName(playerId)
    if heroName and heroName ~= "" then
        return self:GetReadableHeroName(heroName)
    end
    return "玩家" .. tostring(playerId)
end
function PlayerTip.GetCachedPlayerName(self, playerId)
    local steamId = PlayerResource:GetSteamAccountID(playerId)
    if not steamId or steamId <= 0 then
        return nil
    end
    local playerData = CustomNetTables:GetTableValue(
        "player_table",
        tostring(steamId)
    )
    if playerData and playerData.playerName and playerData.playerName ~= "" then
        return playerData.playerName
    end
    return nil
end
function PlayerTip.GetReadableHeroName(self, heroName)
    return __TS__StringReplace(heroName, "npc_dota_hero_", "")
end
function PlayerTip.SendTipError(self, playerId, message)
    local player = PlayerResource:GetPlayer(playerId)
    if not player then
        return
    end
    CustomGameEventManager:Send_ServerToPlayer(player, "player_tip_error", {message = message})
end
PlayerTip.MAX_TIPS_PER_PLAYER = 5
PlayerTip.TIP_POINTS = 1
PlayerTip.givenByPlayer = {}
PlayerTip.receivedByPlayer = {}
PlayerTip = __TS__DecorateLegacy({reloadable}, PlayerTip)
____exports.PlayerTip = PlayerTip
return ____exports
