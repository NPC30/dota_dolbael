local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__Number = ____lualib.__TS__Number
local __TS__NumberIsNaN = ____lualib.__TS__NumberIsNaN
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/player-title/player-title.lua"
__TS__SourceMapTraceBack("modules/player-title/player-title.lua", {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 11,["15"] = 11,["16"] = 11,["18"] = 13,["19"] = 14,["20"] = 17,["21"] = 17,["22"] = 17,["23"] = 17,["24"] = 17,["25"] = 18,["26"] = 18,["27"] = 18,["28"] = 19,["29"] = 20,["30"] = 18,["31"] = 18,["32"] = 16,["33"] = 24,["34"] = 25,["35"] = 26,["36"] = 27,["37"] = 28,["40"] = 32,["41"] = 33,["42"] = 34,["44"] = 24,["45"] = 38,["46"] = 39,["47"] = 40,["48"] = 41,["51"] = 44,["52"] = 39,["53"] = 38,["54"] = 48,["55"] = 53,["56"] = 54,["57"] = 55,["58"] = 56,["62"] = 61,["63"] = 62,["64"] = 62,["65"] = 62,["66"] = 62,["67"] = 62,["68"] = 62,["69"] = 68,["70"] = 69,["71"] = 70,["72"] = 71,["73"] = 72,["74"] = 75,["77"] = 79,["78"] = 80,["79"] = 81,["81"] = 62,["82"] = 84,["83"] = 85,["84"] = 86,["85"] = 87,["87"] = 62,["88"] = 62,["89"] = 48,["90"] = 93,["91"] = 94,["92"] = 94,["93"] = 96,["94"] = 97,["95"] = 97,["96"] = 97,["97"] = 97,["98"] = 97,["99"] = 94,["100"] = 99,["101"] = 100,["102"] = 94,["103"] = 94,["104"] = 93,["105"] = 105,["106"] = 106,["107"] = 106,["108"] = 106,["109"] = 106,["110"] = 106,["111"] = 105,["112"] = 112,["113"] = 113,["114"] = 114,["115"] = 115,["117"] = 118,["118"] = 119,["119"] = 120,["120"] = 121,["122"] = 122,["123"] = 123,["124"] = 124,["125"] = 125,["126"] = 126,["128"] = 128,["129"] = 129,["130"] = 130,["132"] = 132,["137"] = 135,["138"] = 136,["139"] = 137,["141"] = 140,["142"] = 140,["143"] = 142,["144"] = 142,["145"] = 142,["146"] = 140,["147"] = 140,["148"] = 112,["149"] = 146,["150"] = 147,["151"] = 148,["152"] = 149,["154"] = 152,["155"] = 153,["157"] = 156,["158"] = 146,["159"] = 12});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
____exports.PlayerTitleService = __TS__Class()
local PlayerTitleService = ____exports.PlayerTitleService
PlayerTitleService.name = "PlayerTitleService"
function PlayerTitleService.prototype.____constructor(self)
    self.didRefreshOpening = false
    self.didRefreshPostGame = false
    ListenToGameEvent(
        "game_rules_state_change",
        function() return self:onGameStateChange() end,
        self
    )
    Timers:CreateTimer(
        0,
        function()
            self:onGameStateChange()
            return nil
        end
    )
end
function PlayerTitleService.prototype.onGameStateChange(self)
    local state = GameRules:State_Get()
    if state == DOTA_GAMERULES_STATE_PRE_GAME and not self.didRefreshOpening then
        self.didRefreshOpening = true
        self:refreshAllPlayers()
        return
    end
    if state == DOTA_GAMERULES_STATE_POST_GAME and not self.didRefreshPostGame then
        self.didRefreshPostGame = true
        self:refreshAllPlayers()
    end
end
function PlayerTitleService.prototype.refreshAllPlayers(self)
    PlayerHelper:ForEachPlayer(function(____, playerId)
        local steamId = PlayerResource:GetSteamAccountID(playerId)
        if steamId <= 0 then
            return
        end
        self:refreshPlayerTitle(playerId, steamId)
    end)
end
function PlayerTitleService.prototype.requestTitleBySteamId(self, steamId, onSuccess, onFailure)
    if steamId <= 0 then
        print("[PlayerTitle] skip request invalid steamId=" .. tostring(steamId))
        if onFailure then
            onFailure(nil)
        end
        return
    end
    print("[PlayerTitle] request title steamId=" .. tostring(steamId))
    ApiClient:sendToBackupHost({
        method = HttpMethod.GET,
        path = ("/player/" .. tostring(steamId)) .. "/info",
        retryTimes = 1,
        timeoutSeconds = ____exports.PlayerTitleService.REFRESH_DELAY,
        silent = true,
        successFunc = function(____, data)
            local playerInfo = self:decodeResponse(data)
            local title = self:resolvePlayerTitle(playerInfo)
            if title then
                print((((("[PlayerTitle] title success steamId=" .. tostring(steamId)) .. " title=") .. title.title) .. " level=") .. tostring(title.level))
                onSuccess(nil, title)
                return
            end
            print("[PlayerTitle] title empty steamId=" .. tostring(steamId))
            if onFailure then
                onFailure(nil)
            end
        end,
        failureFunc = function()
            print("[PlayerTitle] title request failed steamId=" .. tostring(steamId))
            if onFailure then
                onFailure(nil)
            end
        end
    })
end
function PlayerTitleService.prototype.refreshPlayerTitle(self, playerId, steamId)
    self:requestTitleBySteamId(
        steamId,
        function(____, title)
            CustomNetTables:SetTableValue(
                "player_title_table",
                tostring(playerId),
                title
            )
        end,
        function()
            self:clearPlayerTitle(playerId)
        end
    )
end
function PlayerTitleService.prototype.clearPlayerTitle(self, playerId)
    CustomNetTables:SetTableValue(
        "player_title_table",
        tostring(playerId),
        {title = "", level = 0}
    )
end
function PlayerTitleService.prototype.resolvePlayerTitle(self, playerInfo)
    local details = playerInfo and playerInfo.achievementTitleDetails
    if not details or #details == 0 then
        return nil
    end
    local titles = {}
    local maxWingLevel = 0
    local maxFallbackLevel = 0
    for ____, detail in ipairs(details) do
        do
            local title = __TS__StringTrim(detail.title or "")
            local rawLevel = type(detail.level) == "number" and detail.level or __TS__Number(detail.level or 0)
            local level = math.floor(__TS__NumberIsNaN(__TS__Number(rawLevel)) and 0 or rawLevel)
            if not title or level <= 0 then
                goto __continue25
            end
            titles[#titles + 1] = title
            if level <= 4 then
                maxWingLevel = math.max(maxWingLevel, level)
            else
                maxFallbackLevel = math.max(maxFallbackLevel, level)
            end
        end
        ::__continue25::
    end
    local displayLevel = maxWingLevel > 0 and maxWingLevel or maxFallbackLevel
    if #titles == 0 or displayLevel <= 0 then
        return nil
    end
    return {
        title = table.concat(titles, "  "),
        level = math.max(
            1,
            math.min(displayLevel, 8)
        )
    }
end
function PlayerTitleService.prototype.decodeResponse(self, data)
    local decoded = (json.decode(data))
    if not decoded then
        return nil
    end
    if decoded.data ~= nil then
        return decoded.data
    end
    return decoded
end
PlayerTitleService.REFRESH_DELAY = 5
return ____exports
