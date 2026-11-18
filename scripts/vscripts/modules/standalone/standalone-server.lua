local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/standalone/standalone-server.lua"
__TS__SourceMapTraceBack("modules/standalone/standalone-server.lua", {["6"] = 15,["7"] = 15,["8"] = 15,["10"] = 15,["11"] = 46,["12"] = 47,["13"] = 48,["16"] = 52,["17"] = 53,["18"] = 53,["19"] = 55,["20"] = 56,["21"] = 56,["22"] = 56,["23"] = 56,["24"] = 56,["25"] = 53,["26"] = 53,["27"] = 53,["28"] = 53,["29"] = 60,["30"] = 61,["32"] = 65,["33"] = 68,["34"] = 69,["36"] = 46,["37"] = 75,["38"] = 82,["39"] = 82,["40"] = 82,["41"] = 82,["42"] = 82,["43"] = 82,["44"] = 82,["45"] = 89,["46"] = 90,["49"] = 95,["50"] = 96,["53"] = 100,["54"] = 101,["55"] = 102,["56"] = 103,["57"] = 104,["58"] = 105,["59"] = 108,["60"] = 108,["61"] = 108,["62"] = 108,["63"] = 108,["64"] = 75,["65"] = 115,["66"] = 116,["67"] = 117,["69"] = 120,["70"] = 121,["72"] = 124,["73"] = 125,["74"] = 126,["75"] = 127,["77"] = 130,["78"] = 131,["79"] = 132,["81"] = 135,["82"] = 136,["83"] = 137,["84"] = 138,["85"] = 139,["87"] = 142,["89"] = 143,["90"] = 143,["91"] = 144,["93"] = 148,["95"] = 142,["97"] = 141,["98"] = 149,["99"] = 150,["100"] = 151,["102"] = 153,["103"] = 154,["104"] = 155,["105"] = 156,["107"] = 158,["109"] = 162,["110"] = 163,["112"] = 167,["113"] = 168,["115"] = 172,["116"] = 173,["117"] = 174,["118"] = 115,["119"] = 177,["120"] = 178,["121"] = 179,["122"] = 180,["123"] = 182,["124"] = 183,["125"] = 184,["126"] = 185,["128"] = 188,["129"] = 189,["130"] = 190,["132"] = 195,["133"] = 196,["134"] = 197,["135"] = 198,["136"] = 199,["138"] = 202,["139"] = 203,["140"] = 204,["141"] = 205,["142"] = 206,["143"] = 207,["145"] = 210,["146"] = 211,["147"] = 212,["148"] = 213,["150"] = 216,["151"] = 217,["152"] = 218,["153"] = 219,["154"] = 220,["155"] = 221,["157"] = 224,["158"] = 228,["159"] = 229,["160"] = 230,["161"] = 231,["163"] = 234,["164"] = 235,["165"] = 236,["166"] = 239,["168"] = 242,["169"] = 177,["170"] = 245,["171"] = 246,["174"] = 250,["175"] = 251,["176"] = 252,["177"] = 253,["180"] = 257,["181"] = 245,["182"] = 262,["183"] = 269,["184"] = 270,["185"] = 274,["186"] = 274,["187"] = 274,["188"] = 274,["189"] = 274,["190"] = 270,["192"] = 278,["193"] = 279,["194"] = 279,["195"] = 280,["197"] = 281,["199"] = 279,["201"] = 285,["202"] = 290,["204"] = 293,["205"] = 294,["206"] = 295,["208"] = 298,["209"] = 299,["210"] = 299,["211"] = 299,["212"] = 299,["213"] = 299,["214"] = 299,["215"] = 299,["217"] = 301,["218"] = 302,["219"] = 302,["220"] = 302,["221"] = 302,["222"] = 302,["223"] = 302,["224"] = 302,["226"] = 304,["227"] = 305,["228"] = 305,["229"] = 305,["230"] = 305,["231"] = 305,["232"] = 305,["233"] = 305,["235"] = 307,["236"] = 308,["237"] = 308,["238"] = 308,["239"] = 308,["240"] = 308,["241"] = 308,["242"] = 308,["244"] = 310,["245"] = 311,["246"] = 311,["247"] = 311,["248"] = 311,["249"] = 311,["250"] = 311,["251"] = 311,["253"] = 313,["254"] = 314,["255"] = 314,["256"] = 314,["257"] = 314,["258"] = 314,["259"] = 314,["260"] = 314,["262"] = 316,["263"] = 262,["264"] = 319,["265"] = 324,["266"] = 325,["268"] = 328,["269"] = 329,["270"] = 330,["272"] = 333,["273"] = 334,["274"] = 334,["275"] = 334,["276"] = 334,["277"] = 334,["278"] = 334,["279"] = 334,["281"] = 336,["282"] = 337,["283"] = 337,["284"] = 337,["285"] = 337,["286"] = 337,["287"] = 337,["288"] = 337,["290"] = 339,["291"] = 340,["292"] = 340,["293"] = 340,["294"] = 340,["295"] = 340,["296"] = 340,["297"] = 340,["299"] = 342,["300"] = 343,["301"] = 343,["302"] = 343,["303"] = 343,["304"] = 343,["305"] = 343,["306"] = 343,["308"] = 345,["309"] = 346,["310"] = 346,["311"] = 346,["312"] = 346,["313"] = 346,["314"] = 346,["315"] = 346,["317"] = 348,["318"] = 349,["319"] = 349,["320"] = 349,["321"] = 349,["322"] = 349,["323"] = 349,["324"] = 349,["326"] = 351,["327"] = 352,["328"] = 352,["329"] = 352,["330"] = 352,["331"] = 352,["332"] = 352,["333"] = 352,["335"] = 354,["336"] = 319,["337"] = 357,["338"] = 364,["339"] = 364,["340"] = 364,["341"] = 364,["342"] = 364,["343"] = 364,["344"] = 364,["345"] = 357,["346"] = 367,["347"] = 368,["348"] = 369,["349"] = 370,["351"] = 372,["352"] = 372,["354"] = 373,["355"] = 375,["356"] = 380,["358"] = 383,["359"] = 384,["360"] = 385,["362"] = 387,["366"] = 372,["369"] = 391,["370"] = 367,["371"] = 16,["372"] = 17,["373"] = 18,["374"] = 19,["375"] = 20,["376"] = 21,["377"] = 22,["378"] = 23,["379"] = 24,["380"] = 24,["381"] = 24,["382"] = 24,["383"] = 24,["384"] = 24,["385"] = 24,["386"] = 24,["387"] = 33,["388"] = 34,["389"] = 35,["390"] = 36,["391"] = 37,["392"] = 38});
local ____exports = {}
____exports.StandaloneServer = __TS__Class()
local StandaloneServer = ____exports.StandaloneServer
StandaloneServer.name = "StandaloneServer"
function StandaloneServer.prototype.____constructor(self)
end
function StandaloneServer.Initialize(self)
    local mapName = string.lower(GetMapName())
    if self.initialized or not IsDedicatedServer() or self.SUPPORTED_MAPS[mapName] ~= true then
        return
    end
    self.initialized = true
    Convars:RegisterCommand(
        self.COMMAND,
        function(_commandName, protocolVersion, selection, difficulty, extraArgument) return self:Authorize(
            mapName,
            protocolVersion,
            selection,
            difficulty,
            extraArgument
        ) end,
        "Authorize the Windy10v10AI standalone bootstrap.",
        FCVAR_NONE
    )
    if mapName == "abyss" then
        print(((("[StandaloneServer] command-ready: command=" .. self.COMMAND) .. ", protocol=") .. self.PROTOCOL_V1) .. ", map=abyss")
    end
    print((((("[StandaloneServer] command-ready: command=" .. self.COMMAND) .. ", protocol=") .. self.PROTOCOL_V2) .. ", map=") .. mapName)
    if mapName == "n7" or mapName == "rd" or mapName == "abyss" or mapName == "custom" then
        print((((("[StandaloneServer] command-ready: command=" .. self.COMMAND) .. ", protocol=") .. self.PROTOCOL_V3) .. ", map=") .. mapName)
    end
end
function StandaloneServer.Authorize(self, mapName, protocolVersion, selectionText, difficultyText, extraArgument)
    local selection = self:ResolveSelection(
        mapName,
        protocolVersion,
        selectionText,
        difficultyText,
        extraArgument
    )
    if selection == nil then
        print((((("[StandaloneServer] command-rejected: reason=map-selection, map=" .. mapName) .. ", protocol=") .. (protocolVersion or "none")) .. ", selection=") .. (selectionText or "none"))
        return
    end
    if self.authorized or self.completed then
        print("[StandaloneServer] command-ignored: reason=already-started")
        return
    end
    self.authorized = true
    self.selectedMap = mapName
    self.selectedHumanSummary = nil
    self.selectedSelection = selection
    self.selectedProtocol = protocolVersion
    print((((((("[StandaloneServer] command-accepted: map=" .. mapName) .. ", protocol=") .. tostring(protocolVersion)) .. ", variant=") .. selection.variant) .. ", difficulty=N") .. tostring(selection.difficulty))
    GameRules:GetGameModeEntity():SetContextThink(
        self.THINK_NAME,
        function() return self:TryEnterCustomSetup() end,
        0.25
    )
end
function StandaloneServer.TryEnterCustomSetup(self)
    if not self.authorized or self.completed then
        return nil
    end
    if self.presetApplied then
        return self:TryFinishCustomSetup()
    end
    local state = GameRules:State_Get()
    if state ~= DOTA_GAMERULES_STATE_INIT then
        print("[StandaloneServer] bootstrap-stopped: reason=unexpected-state, state=" .. tostring(state))
        return nil
    end
    local summary = self:GetConnectedHumanSummary()
    if summary.humanCount == 0 then
        return 0.25
    end
    local mapName = self.selectedMap
    local selection = self.selectedSelection
    if mapName == nil or selection == nil then
        print("[StandaloneServer] bootstrap-stopped: reason=preset-application")
        return nil
    end
    local ____selection_manualSetup_1 = selection.manualSetup
    if not ____selection_manualSetup_1 then
        local ____temp_0
        if self.selectedProtocol == self.PROTOCOL_V3 then
            ____temp_0 = GameRules.Option:ApplyStandalonePreset(mapName, selection.difficulty, {midOnlyMode = selection.midOnlyMode, abyssStrictLimits = selection.abyssStrictLimits})
        else
            ____temp_0 = GameRules.Option:ApplyStandalonePreset(mapName, selection.difficulty)
        end
        ____selection_manualSetup_1 = ____temp_0
    end
    local presetApplied = ____selection_manualSetup_1
    if not presetApplied then
        print("[StandaloneServer] bootstrap-stopped: reason=preset-application")
        return nil
    end
    self.presetApplied = true
    self.selectedHumanSummary = summary
    if selection.manualSetup then
        print("[StandaloneServer] options: variant=custom, preset=manual")
    else
        print((((((((("[StandaloneServer] options: variant=" .. selection.variant) .. ", difficulty=N") .. tostring(selection.difficulty)) .. ", midOnly=") .. tostring(selection.midOnlyMode)) .. ", abyss=") .. tostring(GameRules.Option.abyssMode)) .. ", strict=") .. tostring(selection.abyssStrictLimits))
    end
    if self.selectedProtocol == self.PROTOCOL_V1 then
        print((((("[StandaloneServer] ready: map=abyss, preset=N99, humanCount=" .. tostring(summary.humanCount)) .. ", steamIdCount=") .. tostring(summary.steamIdCount)) .. ", zeroSteamIdCount=") .. tostring(summary.zeroSteamIdCount))
    end
    if self.selectedProtocol ~= self.PROTOCOL_V3 then
        print((((((((("[StandaloneServer] ready: map=" .. mapName) .. ", difficulty=N") .. tostring(selection.difficulty)) .. ", humanCount=") .. tostring(summary.humanCount)) .. ", steamIdCount=") .. tostring(summary.steamIdCount)) .. ", zeroSteamIdCount=") .. tostring(summary.zeroSteamIdCount))
    end
    print("[StandaloneServer] transition-requested: action=ResetToCustomGameSetup, state=INIT")
    GameRules:ResetToCustomGameSetup()
    return self.TRANSITION_THINK_INTERVAL
end
function StandaloneServer.TryFinishCustomSetup(self)
    local state = GameRules:State_Get()
    local selection = self.selectedSelection
    self.transitionPollCount = self.transitionPollCount + 1
    if selection == nil then
        self.completed = true
        print("[StandaloneServer] transition-stopped: reason=missing-selection")
        return nil
    end
    if self.lastTransitionState ~= state then
        self.lastTransitionState = state
        print((("[StandaloneServer] transition-state: state=" .. tostring(state)) .. ", poll=") .. tostring(self.transitionPollCount))
    end
    if self.finishRequested and state ~= DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP then
        self.completed = true
        print("[StandaloneServer] transition-complete: state=" .. tostring(state))
        self:EmitV3Ready("auto")
        return nil
    end
    if not self.finishRequested and state == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP then
        if selection.manualSetup then
            self.completed = true
            print("[StandaloneServer] setup-manual: state=CUSTOM_GAME_SETUP, action=wait-for-ui")
            self:EmitV3Ready("manual")
            return nil
        end
        if self.setupObservedPoll == nil then
            self.setupObservedPoll = self.transitionPollCount
            GameRules:EnableCustomGameSetupAutoLaunch(false)
            print("[StandaloneServer] setup-timing: phase=visible, minimumSeconds=5")
        end
        local visiblePolls = self.transitionPollCount - self.setupObservedPoll
        if visiblePolls >= self.MINIMUM_SETUP_POLLS then
            self.finishRequested = true
            print("[StandaloneServer] setup-timing: phase=finish, elapsedSeconds=5")
            print("[StandaloneServer] transition-requested: action=FinishCustomGameSetup")
            GameRules:FinishCustomGameSetup()
        end
    elseif not self.finishRequested and state ~= DOTA_GAMERULES_STATE_INIT and state ~= DOTA_GAMERULES_STATE_WAIT_FOR_PLAYERS_TO_LOAD then
        self.completed = true
        print(("[StandaloneServer] transition-complete: state=" .. tostring(state)) .. ", reason=already-advanced")
        self:EmitV3Ready("auto")
        return nil
    end
    if self.transitionPollCount >= self.MAX_TRANSITION_POLLS then
        self.completed = true
        print((("[StandaloneServer] transition-stopped: reason=timeout, state=" .. tostring(state)) .. ", finishRequested=") .. tostring(self.finishRequested))
        return nil
    end
    return self.TRANSITION_THINK_INTERVAL
end
function StandaloneServer.EmitV3Ready(self, setup)
    if self.selectedProtocol ~= self.PROTOCOL_V3 then
        return
    end
    local mapName = self.selectedMap
    local selection = self.selectedSelection
    local summary = self.selectedHumanSummary
    if mapName == nil or selection == nil or summary == nil then
        return
    end
    print((((((((((((("[StandaloneServer] ready: map=" .. mapName) .. ", variant=") .. selection.variant) .. ", difficulty=N") .. tostring(selection.difficulty)) .. ", humanCount=") .. tostring(summary.humanCount)) .. ", steamIdCount=") .. tostring(summary.steamIdCount)) .. ", zeroSteamIdCount=") .. tostring(summary.zeroSteamIdCount)) .. ", setup=") .. setup)
end
function StandaloneServer.ResolveSelection(self, mapName, protocolVersion, selectionText, difficultyText, extraArgument)
    if protocolVersion == self.PROTOCOL_V1 then
        return mapName == "abyss" and selectionText == nil and difficultyText == nil and extraArgument == nil and self:CreateSelection(
            99,
            "abyss",
            false,
            true,
            true
        ) or nil
    end
    if protocolVersion == self.PROTOCOL_V3 then
        local ____temp_2
        if extraArgument == nil then
            ____temp_2 = self:ResolveV3Selection(mapName, selectionText, difficultyText)
        else
            ____temp_2 = nil
        end
        return ____temp_2
    end
    if protocolVersion ~= self.PROTOCOL_V2 or selectionText == nil or difficultyText ~= nil or extraArgument ~= nil then
        return nil
    end
    local difficulty = tonumber(selectionText)
    if difficulty == nil or math.floor(difficulty) ~= difficulty then
        return nil
    end
    if mapName == "dota" and difficulty >= 1 and difficulty <= 6 then
        return self:CreateSelection(
            difficulty,
            "legacy-N" .. tostring(difficulty),
            false,
            false,
            true
        )
    end
    if mapName == "n6" and difficulty == 6 then
        return self:CreateSelection(
            6,
            "legacy-N6",
            false,
            false,
            true
        )
    end
    if mapName == "n7" and difficulty == 7 then
        return self:CreateSelection(
            7,
            "n7",
            false,
            false,
            true
        )
    end
    if mapName == "rd" and (difficulty == 8 or difficulty == 9) then
        return self:CreateSelection(
            difficulty,
            "legacy-RD" .. tostring(difficulty - 1),
            false,
            false,
            true
        )
    end
    if mapName == "abyss" and difficulty == 99 then
        return self:CreateSelection(
            99,
            "abyss",
            false,
            true,
            true
        )
    end
    if mapName == "custom" and difficulty == 0 then
        return self:CreateSelection(
            0,
            "custom",
            true,
            false,
            false
        )
    end
    return nil
end
function StandaloneServer.ResolveV3Selection(self, mapName, variant, difficultyText)
    if variant == nil or difficultyText == nil then
        return nil
    end
    local difficulty = tonumber(difficultyText)
    if difficulty == nil or math.floor(difficulty) ~= difficulty then
        return nil
    end
    if mapName == "n7" and variant == "n7" and difficulty == 7 then
        return self:CreateSelection(
            difficulty,
            variant,
            false,
            false,
            true
        )
    end
    if mapName == "n7" and variant == "n7-mid" and difficulty == 7 then
        return self:CreateSelection(
            difficulty,
            variant,
            false,
            true,
            true
        )
    end
    if mapName == "rd" and variant == "rd" and (difficulty == 8 or difficulty == 9) then
        return self:CreateSelection(
            difficulty,
            variant,
            false,
            false,
            true
        )
    end
    if mapName == "rd" and variant == "rd-mid" and (difficulty == 8 or difficulty == 9) then
        return self:CreateSelection(
            difficulty,
            variant,
            false,
            true,
            true
        )
    end
    if mapName == "abyss" and variant == "abyss" and difficulty == 99 then
        return self:CreateSelection(
            difficulty,
            variant,
            false,
            true,
            true
        )
    end
    if mapName == "abyss" and variant == "abyss-noncompetitive" and difficulty == 99 then
        return self:CreateSelection(
            difficulty,
            variant,
            false,
            true,
            false
        )
    end
    if mapName == "custom" and variant == "custom" and difficulty == 0 then
        return self:CreateSelection(
            difficulty,
            variant,
            true,
            false,
            false
        )
    end
    return nil
end
function StandaloneServer.CreateSelection(self, difficulty, variant, manualSetup, midOnlyMode, abyssStrictLimits)
    return {
        difficulty = difficulty,
        variant = variant,
        manualSetup = manualSetup,
        midOnlyMode = midOnlyMode,
        abyssStrictLimits = abyssStrictLimits
    }
end
function StandaloneServer.GetConnectedHumanSummary(self)
    local humanCount = 0
    local steamIdCount = 0
    local zeroSteamIdCount = 0
    do
        local rawPlayerId = 0
        while rawPlayerId < DOTA_MAX_TEAM_PLAYERS do
            do
                local playerId = rawPlayerId
                if not PlayerResource:IsValidPlayerID(playerId) or not PlayerResource:IsValidPlayer(playerId) or PlayerResource:IsFakeClient(playerId) or PlayerResource:GetConnectionState(playerId) ~= DOTA_CONNECTION_STATE_CONNECTED then
                    goto __continue59
                end
                humanCount = humanCount + 1
                if PlayerResource:GetSteamAccountID(playerId) > 0 then
                    steamIdCount = steamIdCount + 1
                else
                    zeroSteamIdCount = zeroSteamIdCount + 1
                end
            end
            ::__continue59::
            rawPlayerId = rawPlayerId + 1
        end
    end
    return {humanCount = humanCount, steamIdCount = steamIdCount, zeroSteamIdCount = zeroSteamIdCount}
end
StandaloneServer.COMMAND = "windy_standalone_start"
StandaloneServer.PROTOCOL_V1 = "v1"
StandaloneServer.PROTOCOL_V2 = "v2"
StandaloneServer.PROTOCOL_V3 = "v3"
StandaloneServer.THINK_NAME = "WindyStandaloneEnterCustomSetup"
StandaloneServer.TRANSITION_THINK_INTERVAL = 0.1
StandaloneServer.MINIMUM_SETUP_POLLS = 50
StandaloneServer.MAX_TRANSITION_POLLS = 100
StandaloneServer.SUPPORTED_MAPS = {
    dota = true,
    n6 = true,
    n7 = true,
    rd = true,
    abyss = true,
    custom = true
}
StandaloneServer.initialized = false
StandaloneServer.authorized = false
StandaloneServer.completed = false
StandaloneServer.presetApplied = false
StandaloneServer.finishRequested = false
StandaloneServer.transitionPollCount = 0
return ____exports
