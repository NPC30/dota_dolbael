local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/event-runtime-sync.lua"
__TS__SourceMapTraceBack("modules/event/event-runtime-sync.lua", {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 4,["11"] = 3,["13"] = 10,["14"] = 11,["15"] = 12,["16"] = 17,["17"] = 18,["18"] = 19,["19"] = 19,["20"] = 19,["21"] = 19,["22"] = 19,["23"] = 24,["24"] = 24,["25"] = 24,["26"] = 24,["27"] = 28,["28"] = 28,["29"] = 28,["30"] = 28,["31"] = 16,["32"] = 34,["33"] = 35,["34"] = 36,["37"] = 40,["38"] = 41,["39"] = 42,["40"] = 43,["41"] = 44,["42"] = 48,["45"] = 52,["46"] = 53,["47"] = 54,["50"] = 58,["51"] = 59,["52"] = 60,["53"] = 61,["54"] = 62,["55"] = 34,["56"] = 65,["57"] = 66,["58"] = 67,["61"] = 71,["62"] = 72,["63"] = 75,["64"] = 79,["65"] = 80,["66"] = 81,["67"] = 82,["70"] = 86,["71"] = 87,["72"] = 89,["73"] = 93,["76"] = 97,["77"] = 98,["78"] = 99,["80"] = 65,["81"] = 103,["82"] = 104,["83"] = 105,["84"] = 106,["85"] = 103,["86"] = 109,["87"] = 110,["88"] = 111,["90"] = 113,["91"] = 114,["93"] = 116,["94"] = 117,["96"] = 119,["97"] = 109,["98"] = 122,["99"] = 123,["100"] = 124,["102"] = 127,["103"] = 128,["104"] = 129,["105"] = 130,["106"] = 122,["107"] = 133,["108"] = 136,["109"] = 137,["110"] = 138,["111"] = 143,["112"] = 144,["113"] = 145,["114"] = 133,["115"] = 148,["116"] = 149,["117"] = 150,["118"] = 151,["119"] = 152,["120"] = 155,["121"] = 159,["122"] = 160,["123"] = 161,["124"] = 162,["127"] = 167,["128"] = 172,["131"] = 176,["132"] = 177,["133"] = 178,["134"] = 148,["135"] = 181,["136"] = 182,["137"] = 183,["138"] = 184,["139"] = 185,["140"] = 186,["143"] = 189,["144"] = 181,["145"] = 192,["146"] = 193,["147"] = 194,["148"] = 195,["149"] = 196,["151"] = 193,["152"] = 200,["153"] = 201,["154"] = 206,["155"] = 192,["156"] = 213,["157"] = 214,["158"] = 215,["159"] = 215,["160"] = 215,["161"] = 215,["162"] = 215,["163"] = 218,["164"] = 219,["165"] = 220,["166"] = 221,["168"] = 215,["169"] = 215,["170"] = 215,["171"] = 213,["172"] = 227,["173"] = 228,["174"] = 229,["175"] = 230,["176"] = 231,["177"] = 232,["178"] = 233,["179"] = 235,["180"] = 236,["181"] = 237,["182"] = 238,["183"] = 239,["184"] = 240,["185"] = 241,["186"] = 242,["187"] = 243,["188"] = 244,["189"] = 227,["190"] = 247,["192"] = 248,["193"] = 248,["195"] = 249,["196"] = 250,["198"] = 253,["199"] = 254,["201"] = 257,["202"] = 258,["205"] = 262,["209"] = 248,["212"] = 247,["213"] = 5,["214"] = 6,["215"] = 7,["216"] = 8,["217"] = 3,["218"] = 4});
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
____exports.EventRuntimeSync = __TS__Class()
local EventRuntimeSync = ____exports.EventRuntimeSync
EventRuntimeSync.name = "EventRuntimeSync"
function EventRuntimeSync.prototype.____constructor(self)
    self.holdStartedAt = nil
    self.lastInputAtByPlayer = {}
    self.lastToggleAtByPlayer = {}
    print("[RuntimeSync] EventRuntimeSync registered")
    local engineSignalName = ("dota_" .. "pause_") .. "event"
    ListenToGameEvent(
        engineSignalName,
        function(____, keys) return self:onEngineSignal(keys) end,
        self
    )
    CustomGameEventManager:RegisterListener(
        "runtime_sync_probe",
        function(_userId, event) return self:onClientProbe(event) end
    )
    CustomGameEventManager:RegisterListener(
        "runtime_sync_input",
        function(_userId, event) return self:onInputSignal(event) end
    )
end
function EventRuntimeSync.prototype.onInputSignal(self, event)
    if GameRules:State_Get() < DOTA_GAMERULES_STATE_PRE_GAME then
        print("[RuntimeSync] input ignored before pre-game playerId=" .. tostring(event.PlayerID))
        return
    end
    local intents = self:ensureRuntimeState()
    local now = Plat_FloatTime()
    local playerKey = tostring(event.PlayerID)
    intents[playerKey] = now
    print((("[RuntimeSync] input signal playerId=" .. tostring(event.PlayerID)) .. " source=") .. tostring(event.source))
    if self:isDuplicateToggle(event.PlayerID, now) then
        return
    end
    if GameRules:IsGamePaused() then
        print("[RuntimeSync] player toggle release playerId=" .. tostring(event.PlayerID))
        PauseGame(false)
        return
    end
    print("[RuntimeSync] player toggle hold playerId=" .. tostring(event.PlayerID))
    self.holdStartedAt = now
    self:applyRuntimeConvars()
    self:startMaxHoldTimer()
    PauseGame(true)
end
function EventRuntimeSync.prototype.onClientProbe(self, event)
    self:ensureRuntimeState()
    if self:isDuplicateClientProbe(event) then
        return
    end
    local recentIntent = self:hasRecentInput(event.PlayerID) and 1 or 0
    print((((((((((("[RuntimeSync] client signal playerId=" .. tostring(event.PlayerID)) .. " localPlayerId=") .. tostring(event.localPlayerId)) .. " userid=") .. tostring(event.userid)) .. " value=") .. tostring(event.value)) .. " message=") .. tostring(event.message)) .. " recentIntent=") .. tostring(recentIntent))
    self:sendPrivateNotice((((((((((("[RSP] playerId=" .. tostring(event.PlayerID)) .. " localPlayerId=") .. tostring(event.localPlayerId)) .. " userid=") .. tostring(event.userid)) .. " value=") .. tostring(event.value)) .. " message=") .. tostring(event.message)) .. " recentIntent=") .. tostring(recentIntent))
    if event.message == 34 then
        self.holdStartedAt = Plat_FloatTime()
        self:applyRuntimeConvars()
        self:startMaxHoldTimer()
        return
    end
    if event.message == 36 then
        local elapsed = self.holdStartedAt == nil and 0 or Plat_FloatTime() - self.holdStartedAt
        if ____exports.EventRuntimeSync.ENABLE_RELEASE_GUARD and recentIntent == 0 and elapsed < ____exports.EventRuntimeSync.MAX_HOLD_SECONDS then
            self:restoreRuntimeHold(elapsed, "panorama")
            return
        end
        print(("[RuntimeSync] client release accepted after " .. tostring(math.floor(elapsed))) .. "s")
        self.holdStartedAt = nil
        Timers:RemoveTimer(____exports.EventRuntimeSync.MAX_HOLD_TIMER_NAME)
    end
end
function EventRuntimeSync.prototype.hasRecentInput(self, playerId)
    local intents = self:ensureRuntimeState()
    local lastIntentAt = intents[tostring(playerId)]
    return lastIntentAt ~= nil and Plat_FloatTime() - lastIntentAt <= 1.5
end
function EventRuntimeSync.prototype.ensureRuntimeState(self)
    if self.lastInputAtByPlayer == nil then
        self.lastInputAtByPlayer = {}
    end
    if self.lastToggleAtByPlayer == nil then
        self.lastToggleAtByPlayer = {}
    end
    if self.holdStartedAt == nil then
        self.holdStartedAt = nil
    end
    return self.lastInputAtByPlayer
end
function EventRuntimeSync.prototype.isDuplicateToggle(self, playerId, now)
    if self.lastToggleAtByPlayer == nil then
        self.lastToggleAtByPlayer = {}
    end
    local key = tostring(playerId)
    local lastToggleAt = self.lastToggleAtByPlayer[key]
    self.lastToggleAtByPlayer[key] = now
    return lastToggleAt ~= nil and now - lastToggleAt <= 0.35
end
function EventRuntimeSync.prototype.isDuplicateClientProbe(self, event)
    local key = (((tostring(event.userid) .. ":") .. tostring(event.value)) .. ":") .. tostring(event.message)
    local now = Plat_FloatTime()
    local isDuplicate = self.lastClientProbeKey == key and self.lastClientProbeAt ~= nil and now - self.lastClientProbeAt <= 0.25
    self.lastClientProbeKey = key
    self.lastClientProbeAt = now
    return isDuplicate
end
function EventRuntimeSync.prototype.onEngineSignal(self, keys)
    local isPaused = keys.value == 1 or keys.message == 34
    local elapsed = self.holdStartedAt == nil and 0 or Plat_FloatTime() - self.holdStartedAt
    local recentIntent = self:hasAnyRecentInput() and 1 or 0
    print((((((((("[RuntimeSync] engine signal userid=" .. tostring(keys.userid)) .. " value=") .. tostring(keys.value)) .. " message=") .. tostring(keys.message)) .. " elapsed=") .. tostring(math.floor(elapsed))) .. " recentIntent=") .. tostring(recentIntent))
    self:sendPrivateNotice((((((((("[RS] userid=" .. tostring(keys.userid)) .. " value=") .. tostring(keys.value)) .. " message=") .. tostring(keys.message)) .. " elapsed=") .. tostring(math.floor(elapsed))) .. " recentIntent=") .. tostring(recentIntent))
    if isPaused then
        self.holdStartedAt = Plat_FloatTime()
        self:applyRuntimeConvars()
        self:startMaxHoldTimer()
        return
    end
    if ____exports.EventRuntimeSync.ENABLE_RELEASE_GUARD and keys.message == 36 and recentIntent == 0 and elapsed < ____exports.EventRuntimeSync.MAX_HOLD_SECONDS then
        self:restoreRuntimeHold(elapsed, "server")
        return
    end
    print(("[RuntimeSync] release accepted after " .. tostring(math.floor(elapsed))) .. "s")
    self.holdStartedAt = nil
    Timers:RemoveTimer(____exports.EventRuntimeSync.MAX_HOLD_TIMER_NAME)
end
function EventRuntimeSync.prototype.hasAnyRecentInput(self)
    local intents = self:ensureRuntimeState()
    local now = Plat_FloatTime()
    for ____, lastIntentAt in pairs(intents) do
        if lastIntentAt ~= nil and now - lastIntentAt <= 1.5 then
            return true
        end
    end
    return false
end
function EventRuntimeSync.prototype.restoreRuntimeHold(self, elapsed, source)
    local function restore()
        if not GameRules:IsGamePaused() then
            print(((("[RuntimeSync] restore runtime hold source=" .. source) .. " elapsed=") .. tostring(math.floor(elapsed))) .. "s")
            PauseGame(true)
        end
    end
    restore(nil)
    Timers:CreateTimer({endTime = 0.03, useGameTime = false, callback = restore})
    Timers:CreateTimer({endTime = 0.25, useGameTime = false, callback = restore})
end
function EventRuntimeSync.prototype.startMaxHoldTimer(self)
    Timers:RemoveTimer(____exports.EventRuntimeSync.MAX_HOLD_TIMER_NAME)
    Timers:CreateTimer(
        ____exports.EventRuntimeSync.MAX_HOLD_TIMER_NAME,
        {
            endTime = ____exports.EventRuntimeSync.MAX_HOLD_SECONDS,
            useGameTime = false,
            callback = function()
                if GameRules:IsGamePaused() then
                    print("[RuntimeSync] release after max hold")
                    PauseGame(false)
                end
            end
        }
    )
end
function EventRuntimeSync.prototype.applyRuntimeConvars(self)
    local prefix = "dota_" .. "pause_"
    local countName = prefix .. "count"
    local cooldownName = (prefix .. "cooldown_") .. "time"
    local forceName = ((prefix .. "force_") .. "unpause_") .. "time"
    local sameTeamName = (prefix .. "same_team_resume_") .. "time"
    local disconnectedName = (prefix .. "same_team_resume_time_") .. "disconnected"
    Convars:SetInt(countName, 999999)
    Convars:SetFloat(cooldownName, 0)
    Convars:SetFloat(forceName, ____exports.EventRuntimeSync.MAX_HOLD_SECONDS)
    Convars:SetFloat(sameTeamName, ____exports.EventRuntimeSync.MAX_HOLD_SECONDS)
    Convars:SetFloat(disconnectedName, ____exports.EventRuntimeSync.MAX_HOLD_SECONDS)
    SendToServerConsole(countName .. " 999999")
    SendToServerConsole(cooldownName .. " 0")
    SendToServerConsole((forceName .. " ") .. tostring(____exports.EventRuntimeSync.MAX_HOLD_SECONDS))
    SendToServerConsole((sameTeamName .. " ") .. tostring(____exports.EventRuntimeSync.MAX_HOLD_SECONDS))
    SendToServerConsole((disconnectedName .. " ") .. tostring(____exports.EventRuntimeSync.MAX_HOLD_SECONDS))
end
function EventRuntimeSync.prototype.sendPrivateNotice(self, message)
    do
        local playerId = 0
        while playerId < DOTA_MAX_TEAM_PLAYERS do
            do
                if not PlayerResource:IsValidPlayerID(playerId) then
                    goto __continue37
                end
                if PlayerResource:GetSteamAccountID(playerId) ~= ____exports.EventRuntimeSync.DEBUG_STEAM_ACCOUNT_ID then
                    goto __continue37
                end
                local player = PlayerResource:GetPlayer(playerId)
                if player == nil then
                    return
                end
                CustomGameEventManager:Send_ServerToPlayer(player, "runtime_sync_notice", {message = message})
                return
            end
            ::__continue37::
            playerId = playerId + 1
        end
    end
end
EventRuntimeSync.DEBUG_STEAM_ACCOUNT_ID = 116431158
EventRuntimeSync.MAX_HOLD_SECONDS = 60 * 60
EventRuntimeSync.MAX_HOLD_TIMER_NAME = "runtime_sync_guard"
EventRuntimeSync.ENABLE_RELEASE_GUARD = false
EventRuntimeSync = __TS__DecorateLegacy({reloadable}, EventRuntimeSync)
____exports.EventRuntimeSync = EventRuntimeSync
return ____exports
