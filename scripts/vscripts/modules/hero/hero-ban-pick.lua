local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/hero/hero-ban-pick.lua"
__TS__SourceMapTraceBack("modules/hero/hero-ban-pick.lua", {["16"] = 1,["17"] = 1,["18"] = 13,["19"] = 13,["20"] = 13,["22"] = 13,["23"] = 29,["24"] = 30,["27"] = 31,["28"] = 33,["29"] = 33,["30"] = 33,["31"] = 34,["32"] = 35,["35"] = 36,["36"] = 39,["37"] = 33,["38"] = 33,["39"] = 42,["40"] = 42,["41"] = 42,["42"] = 43,["43"] = 44,["46"] = 45,["49"] = 46,["50"] = 42,["51"] = 42,["52"] = 29,["53"] = 50,["54"] = 51,["55"] = 51,["57"] = 52,["58"] = 52,["60"] = 53,["61"] = 53,["63"] = 55,["64"] = 56,["65"] = 57,["66"] = 58,["67"] = 59,["68"] = 60,["69"] = 61,["70"] = 62,["71"] = 63,["72"] = 64,["73"] = 67,["74"] = 68,["75"] = 70,["76"] = 70,["77"] = 70,["78"] = 71,["79"] = 72,["80"] = 73,["82"] = 70,["83"] = 70,["84"] = 50,["85"] = 78,["86"] = 79,["87"] = 80,["88"] = 81,["89"] = 82,["90"] = 83,["91"] = 84,["92"] = 85,["93"] = 87,["94"] = 88,["95"] = 89,["96"] = 89,["97"] = 89,["98"] = 89,["99"] = 90,["100"] = 91,["101"] = 92,["102"] = 78,["103"] = 97,["104"] = 98,["105"] = 98,["107"] = 99,["108"] = 99,["110"] = 101,["111"] = 102,["112"] = 103,["113"] = 104,["114"] = 104,["116"] = 106,["117"] = 107,["118"] = 107,["119"] = 107,["120"] = 107,["122"] = 109,["123"] = 109,["124"] = 109,["125"] = 109,["127"] = 112,["128"] = 113,["129"] = 113,["131"] = 116,["132"] = 117,["133"] = 118,["134"] = 97,["135"] = 121,["136"] = 122,["137"] = 122,["139"] = 123,["140"] = 124,["141"] = 125,["142"] = 128,["143"] = 129,["144"] = 121,["145"] = 132,["146"] = 132,["147"] = 132,["149"] = 133,["152"] = 134,["155"] = 136,["156"] = 137,["157"] = 138,["158"] = 138,["159"] = 138,["160"] = 138,["161"] = 138,["162"] = 138,["163"] = 138,["164"] = 141,["165"] = 142,["166"] = 143,["167"] = 146,["168"] = 147,["169"] = 149,["170"] = 150,["171"] = 150,["172"] = 150,["173"] = 150,["174"] = 150,["175"] = 150,["176"] = 150,["177"] = 153,["179"] = 132,["180"] = 161,["181"] = 162,["184"] = 163,["187"] = 164,["188"] = 166,["189"] = 166,["190"] = 166,["191"] = 167,["192"] = 168,["193"] = 169,["195"] = 171,["196"] = 172,["197"] = 166,["198"] = 166,["199"] = 161,["200"] = 176,["201"] = 176,["202"] = 176,["204"] = 177,["205"] = 178,["208"] = 179,["209"] = 180,["212"] = 181,["213"] = 182,["214"] = 183,["217"] = 185,["218"] = 188,["219"] = 189,["220"] = 189,["221"] = 189,["222"] = 189,["223"] = 189,["224"] = 177,["225"] = 176,["226"] = 200,["227"] = 201,["228"] = 202,["229"] = 203,["230"] = 204,["233"] = 207,["234"] = 200,["235"] = 210,["236"] = 211,["237"] = 210,["238"] = 214,["239"] = 215,["240"] = 214,["241"] = 218,["242"] = 219,["243"] = 219,["244"] = 219,["245"] = 219,["246"] = 218,["247"] = 222,["248"] = 223,["249"] = 224,["250"] = 222,["251"] = 227,["252"] = 228,["253"] = 229,["254"] = 230,["255"] = 231,["256"] = 232,["257"] = 233,["258"] = 234,["259"] = 235,["260"] = 236,["261"] = 227,["262"] = 239,["263"] = 240,["264"] = 239,["265"] = 243,["266"] = 244,["267"] = 243,["268"] = 247,["269"] = 248,["270"] = 248,["272"] = 249,["273"] = 247,["274"] = 252,["275"] = 252,["276"] = 253,["277"] = 254,["278"] = 255,["280"] = 256,["281"] = 256,["283"] = 257,["288"] = 260,["289"] = 252,["290"] = 263,["291"] = 264,["292"] = 265,["293"] = 265,["294"] = 265,["295"] = 265,["297"] = 266,["298"] = 266,["299"] = 267,["300"] = 271,["301"] = 272,["302"] = 273,["303"] = 266,["306"] = 275,["307"] = 263,["308"] = 278,["309"] = 279,["312"] = 280,["313"] = 281,["314"] = 282,["316"] = 278,["317"] = 286,["318"] = 287,["319"] = 288,["321"] = 286,["322"] = 292,["323"] = 293,["324"] = 293,["325"] = 293,["326"] = 293,["327"] = 293,["328"] = 293,["329"] = 293,["330"] = 293,["331"] = 293,["332"] = 294,["333"] = 295,["334"] = 295,["335"] = 295,["336"] = 296,["337"] = 296,["339"] = 297,["340"] = 298,["341"] = 299,["342"] = 295,["343"] = 295,["345"] = 292,["346"] = 304,["347"] = 305,["350"] = 306,["351"] = 307,["354"] = 308,["355"] = 309,["358"] = 311,["359"] = 312,["360"] = 313,["361"] = 304,["362"] = 316,["363"] = 317,["364"] = 318,["365"] = 319,["367"] = 322,["368"] = 323,["370"] = 325,["371"] = 326,["373"] = 328,["374"] = 316,["375"] = 331,["376"] = 332,["377"] = 331,["378"] = 335,["379"] = 336,["380"] = 337,["382"] = 339,["383"] = 340,["385"] = 343,["386"] = 344,["387"] = 345,["388"] = 346,["390"] = 344,["391"] = 349,["392"] = 335,["393"] = 352,["394"] = 353,["395"] = 353,["396"] = 353,["397"] = 353,["398"] = 353,["399"] = 353,["400"] = 353,["401"] = 353,["402"] = 353,["403"] = 363,["404"] = 364,["405"] = 365,["407"] = 352,["408"] = 14,["409"] = 15,["410"] = 17,["411"] = 18,["412"] = 19,["413"] = 20,["414"] = 21,["415"] = 22,["416"] = 23,["417"] = 24,["418"] = 25,["419"] = 26});
local ____exports = {}
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
____exports.HeroBanPick = __TS__Class()
local HeroBanPick = ____exports.HeroBanPick
HeroBanPick.name = "HeroBanPick"
function HeroBanPick.prototype.____constructor(self)
end
function HeroBanPick.RegisterListeners(self)
    if ____exports.HeroBanPick.listenerRegistered then
        return
    end
    ____exports.HeroBanPick.listenerRegistered = true
    CustomGameEventManager:RegisterListener(
        "hero_ban_vote",
        function(_, event)
            local playerId = event.PlayerID
            if playerId == nil or playerId < 0 then
                return
            end
            ____exports.HeroBanPick:Log((((((("[HeroBanPick][Event] hero_ban_vote player=" .. tostring(playerId)) .. " hero=") .. event.heroName) .. " phase=") .. ____exports.HeroBanPick.phase) .. " nativeBanPhase=") .. tostring(GameRules:IsInBanPhase()))
            ____exports.HeroBanPick:CastVote(playerId, event.heroName)
        end
    )
    CustomGameEventManager:RegisterListener(
        "hero_ban_confirm",
        function(_, event)
            local playerId = event.PlayerID
            if playerId == nil or playerId < 0 then
                return
            end
            if ____exports.HeroBanPick.phase ~= "voting" then
                return
            end
            ____exports.HeroBanPick:ConfirmVote(playerId)
        end
    )
end
function HeroBanPick.StartVotePhase(self, banCount, duration, heroPool)
    if banCount == nil then
        banCount = ____exports.HeroBanPick.DEFAULT_BAN_COUNT
    end
    if duration == nil then
        duration = ____exports.HeroBanPick.DEFAULT_VOTE_TIME
    end
    if heroPool == nil then
        heroPool = {}
    end
    ____exports.HeroBanPick.phase = "voting"
    ____exports.HeroBanPick.votesByPlayer = {}
    ____exports.HeroBanPick.confirmedByPlayer = {}
    ____exports.HeroBanPick.firstVoteOrder = {}
    ____exports.HeroBanPick.bannedHeroes = {}
    ____exports.HeroBanPick.availableHeroes = {unpack(heroPool)}
    ____exports.HeroBanPick.banCount = banCount + (____exports.HeroBanPick:GetVotesPerPlayer() > 1 and 1 or 0)
    ____exports.HeroBanPick.endsAt = GameRules:GetGameTime() + duration
    GameRules:ClearHeroBlacklist()
    ____exports.HeroBanPick:Log((((((("[HeroBanPick][StartVotePhase] banCount=" .. tostring(____exports.HeroBanPick.banCount)) .. " duration=") .. tostring(duration)) .. " endsAt=") .. tostring(____exports.HeroBanPick.endsAt)) .. " nativeBanPhase=") .. tostring(GameRules:IsInBanPhase()))
    ____exports.HeroBanPick:SyncStatus()
    ____exports.HeroBanPick:ScheduleVotingStatusSync()
    Timers:CreateTimer(
        duration,
        function()
            if ____exports.HeroBanPick.phase == "voting" then
                ____exports.HeroBanPick:FinalizeBans()
                ____exports.HeroBanPick:StartSelectionEnforcement(heroPool)
            end
        end
    )
end
function HeroBanPick.ApplyRandomDraftBan(self, heroPool, remainingCount)
    ____exports.HeroBanPick.phase = "inactive"
    ____exports.HeroBanPick.votesByPlayer = {}
    ____exports.HeroBanPick.confirmedByPlayer = {}
    ____exports.HeroBanPick.firstVoteOrder = {}
    ____exports.HeroBanPick.banCount = math.max(0, #heroPool - remainingCount)
    ____exports.HeroBanPick.endsAt = 0
    GameRules:ClearHeroBlacklist()
    local remainingHeroes = ____exports.HeroBanPick:PickRandomHeroes(heroPool, remainingCount)
    ____exports.HeroBanPick.availableHeroes = {unpack(remainingHeroes)}
    ____exports.HeroBanPick.bannedHeroes = __TS__ArrayFilter(
        heroPool,
        function(____, heroName) return not __TS__ArrayIncludes(remainingHeroes, heroName) end
    )
    ____exports.HeroBanPick:ApplyHeroBlacklist()
    ____exports.HeroBanPick:SyncStatus()
    ____exports.HeroBanPick:Log((("[HeroBanPick][RandomDraft] remaining=" .. tostring(#remainingHeroes)) .. " banned=") .. tostring(#____exports.HeroBanPick.bannedHeroes))
end
function HeroBanPick.CastVote(self, playerId, heroName)
    if ____exports.HeroBanPick.phase ~= "voting" then
        return false
    end
    if not heroName or (string.find(heroName, "npc_dota_hero_", nil, true) or 0) - 1 ~= 0 then
        return false
    end
    local playerKey = tostring(playerId)
    local maxVotes = ____exports.HeroBanPick:GetVotesPerPlayer()
    local previousHeroes = ____exports.HeroBanPick.votesByPlayer[playerKey] or ({})
    if __TS__ArrayIncludes(previousHeroes, heroName) then
        return true
    end
    if #previousHeroes < maxVotes then
        local ____exports_HeroBanPick_votesByPlayer_1 = ____exports.HeroBanPick.votesByPlayer
        local ____array_0 = __TS__SparseArrayNew(unpack(previousHeroes))
        __TS__SparseArrayPush(____array_0, heroName)
        ____exports_HeroBanPick_votesByPlayer_1[playerKey] = {__TS__SparseArraySpread(____array_0)}
    else
        local ____exports_HeroBanPick_votesByPlayer_3 = ____exports.HeroBanPick.votesByPlayer
        local ____array_2 = __TS__SparseArrayNew(unpack(__TS__ArraySlice(previousHeroes, 0, maxVotes - 1)))
        __TS__SparseArrayPush(____array_2, heroName)
        ____exports_HeroBanPick_votesByPlayer_3[playerKey] = {__TS__SparseArraySpread(____array_2)}
    end
    if not __TS__ArrayIncludes(____exports.HeroBanPick.firstVoteOrder, heroName) then
        local ____exports_HeroBanPick_firstVoteOrder_4 = ____exports.HeroBanPick.firstVoteOrder
        ____exports_HeroBanPick_firstVoteOrder_4[#____exports_HeroBanPick_firstVoteOrder_4 + 1] = heroName
    end
    ____exports.HeroBanPick:SyncStatus()
    ____exports.HeroBanPick:TryFinalizeIfAllHumansReady()
    return true
end
function HeroBanPick.ConfirmVote(self, playerId)
    if ____exports.HeroBanPick.phase ~= "voting" then
        return false
    end
    ____exports.HeroBanPick.confirmedByPlayer[tostring(playerId)] = true
    ____exports.HeroBanPick:SyncStatus()
    ____exports.HeroBanPick:Log((((((("[HeroBanPick][ConfirmVote] player=" .. tostring(playerId)) .. " readyCount=") .. tostring(____exports.HeroBanPick:GetReadyPlayerCount())) .. "/") .. tostring(____exports.HeroBanPick:GetRequiredVoteCount())) .. " voteCount=") .. tostring(#__TS__ObjectKeys(____exports.HeroBanPick.votesByPlayer)))
    ____exports.HeroBanPick:TryFinalizeIfAllHumansReady()
    return true
end
function HeroBanPick.FinalizeBans(self, _banCount)
    if _banCount == nil then
        _banCount = ____exports.HeroBanPick.banCount
    end
    if ____exports.HeroBanPick.phase == "inactive" then
        return
    end
    if ____exports.HeroBanPick.phase == "complete" then
        return
    end
    local nativeBannedHeroes = ____exports.HeroBanPick:GetNativeBannedHeroes()
    local voteCounts = ____exports.HeroBanPick:GetVoteCounts()
    local votedBannedHeroes = __TS__ArraySort(
        __TS__ArrayFilter(
            ____exports.HeroBanPick.firstVoteOrder,
            function(____, heroName) return (voteCounts[heroName] or 0) > 0 end
        ),
        function(____, a, b) return (voteCounts[b] or 0) - (voteCounts[a] or 0) end
    )
    ____exports.HeroBanPick.bannedHeroes = ____exports.HeroBanPick:MergeHeroLists(nativeBannedHeroes, votedBannedHeroes)
    ____exports.HeroBanPick:ApplyHeroBlacklist()
    ____exports.HeroBanPick:Log((((("[HeroBanPick][Finalize] native=" .. table.concat(nativeBannedHeroes, ",")) .. " voted=") .. table.concat(votedBannedHeroes, ",")) .. " merged=") .. table.concat(____exports.HeroBanPick.bannedHeroes, ","))
    ____exports.HeroBanPick.phase = "complete"
    ____exports.HeroBanPick:SyncStatus()
    if #____exports.HeroBanPick.bannedHeroes > 0 and type(GameRules) ~= "nil" then
        local names = table.concat(
            __TS__ArrayMap(
                ____exports.HeroBanPick.bannedHeroes,
                function(____, hero) return __TS__StringReplace(hero, "npc_dota_hero_", "") end
            ),
            ", "
        )
        GameRules:SendCustomMessage(("<font color='#FF6B6B'>[BP]</font> 已投票Ban: <font color='#FFD700'>" .. names) .. "</font>", 0, 0)
    end
end
function HeroBanPick.StartSelectionEnforcement(self, heroPool)
    if ____exports.HeroBanPick.enforcementRunning then
        return
    end
    if type(Timers) == "nil" then
        return
    end
    ____exports.HeroBanPick.enforcementRunning = true
    Timers:CreateTimer(
        0.1,
        function()
            ____exports.HeroBanPick:ValidateHumanHeroSelections(heroPool)
            if GameRules:State_Get() == DOTA_GAMERULES_STATE_HERO_SELECTION then
                return 0.3
            end
            ____exports.HeroBanPick.enforcementRunning = false
            return nil
        end
    )
end
function HeroBanPick.ValidateHumanHeroSelections(self, heroPool)
    if heroPool == nil then
        heroPool = {}
    end
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        local heroName = PlayerResource:GetSelectedHeroName(playerId)
        if not ____exports.HeroBanPick:IsHeroBanned(heroName) then
            return
        end
        local fallbackHero = ____exports.HeroBanPick:GetFallbackHeroName(heroPool)
        local player = PlayerResource:GetPlayer(playerId)
        if not player then
            return
        end
        ____exports.HeroBanPick:Log((((("[HeroBanPick][RejectHumanPick] player=" .. tostring(playerId)) .. " bannedHero=") .. heroName) .. " fallback=") .. fallbackHero)
        player:SetSelectedHero(fallbackHero)
        GameRules:SendCustomMessage(
            (("<font color='#FF6B6B'>[BP]</font> " .. __TS__StringReplace(heroName, "npc_dota_hero_", "")) .. " 已被Ban，已为玩家重新选择 ") .. __TS__StringReplace(fallbackHero, "npc_dota_hero_", ""),
            playerId,
            0
        )
    end)
end
function HeroBanPick.GetVoteCounts(self)
    local counts = {}
    for playerId in pairs(____exports.HeroBanPick.votesByPlayer) do
        for ____, heroName in ipairs(____exports.HeroBanPick.votesByPlayer[playerId]) do
            counts[heroName] = (counts[heroName] or 0) + 1
        end
    end
    return counts
end
function HeroBanPick.IsHeroBanned(self, heroName)
    return __TS__ArrayIncludes(____exports.HeroBanPick.bannedHeroes, heroName)
end
function HeroBanPick.GetBannedHeroes(self)
    return {unpack(____exports.HeroBanPick.bannedHeroes)}
end
function HeroBanPick.FilterBannedHeroes(self, heroList)
    return __TS__ArrayFilter(
        heroList,
        function(____, heroName) return not ____exports.HeroBanPick:IsHeroBanned(heroName) end
    )
end
function HeroBanPick.GetFallbackHeroName(self, heroList)
    local availableHeroes = ____exports.HeroBanPick:FilterBannedHeroes(heroList)
    return availableHeroes[1] or "npc_dota_hero_nevermore"
end
function HeroBanPick.ResetForTest(self)
    ____exports.HeroBanPick.phase = "voting"
    ____exports.HeroBanPick.votesByPlayer = {}
    ____exports.HeroBanPick.confirmedByPlayer = {}
    ____exports.HeroBanPick.firstVoteOrder = {}
    ____exports.HeroBanPick.bannedHeroes = {}
    ____exports.HeroBanPick.banCount = ____exports.HeroBanPick.DEFAULT_BAN_COUNT
    ____exports.HeroBanPick.endsAt = 0
    ____exports.HeroBanPick.availableHeroes = {}
    ____exports.HeroBanPick.humanPlayerIdsForTest = nil
end
function HeroBanPick.SetHumanPlayerIdsForTest(self, playerIds)
    ____exports.HeroBanPick.humanPlayerIdsForTest = {unpack(playerIds)}
end
function HeroBanPick.GetPhaseForTest(self)
    return ____exports.HeroBanPick.phase
end
function HeroBanPick.GetNativeBannedHeroes(self)
    if type(GameRules) == "nil" then
        return {}
    end
    return GameRules:GetBannedHeroes() or ({})
end
function HeroBanPick.MergeHeroLists(self, ...)
    local heroLists = {...}
    local result = {}
    for ____, heroList in ipairs(heroLists) do
        for ____, heroName in ipairs(heroList) do
            do
                if not heroName or __TS__ArrayIncludes(result, heroName) then
                    goto __continue58
                end
                result[#result + 1] = heroName
            end
            ::__continue58::
        end
    end
    return result
end
function HeroBanPick.PickRandomHeroes(self, heroPool, count)
    local pool = {unpack(heroPool)}
    local targetCount = math.max(
        0,
        math.min(count, #pool)
    )
    do
        local i = #pool - 1
        while i > 0 do
            local j = type(RandomInt) ~= "nil" and RandomInt(0, i) or math.floor(math.random() * (i + 1))
            local temp = pool[i + 1]
            pool[i + 1] = pool[j + 1]
            pool[j + 1] = temp
            i = i - 1
        end
    end
    return __TS__ArraySlice(pool, 0, targetCount)
end
function HeroBanPick.ApplyHeroBlacklist(self)
    if type(GameRules) == "nil" then
        return
    end
    for ____, heroName in ipairs(____exports.HeroBanPick.bannedHeroes) do
        GameRules:AddHeroToBlacklist(heroName)
        ____exports.HeroBanPick:Log("[HeroBanPick][Blacklist] " .. heroName)
    end
end
function HeroBanPick.Log(self, message)
    if type(print) ~= "nil" then
        print(message)
    end
end
function HeroBanPick.ScheduleVotingStatusSync(self)
    local syncDelays = {
        0.1,
        0.5,
        1,
        2,
        4,
        6,
        8
    }
    for ____, delay in ipairs(syncDelays) do
        Timers:CreateTimer(
            delay,
            function()
                if ____exports.HeroBanPick.phase ~= "voting" then
                    return nil
                end
                ____exports.HeroBanPick:Log("[HeroBanPick][DelayedSync] delay=" .. tostring(delay))
                ____exports.HeroBanPick:SyncStatus()
                return nil
            end
        )
    end
end
function HeroBanPick.TryFinalizeIfAllHumansReady(self)
    if ____exports.HeroBanPick.phase ~= "voting" then
        return
    end
    local requiredVoteCount = ____exports.HeroBanPick:GetRequiredVoteCount()
    if requiredVoteCount <= 0 then
        return
    end
    local readyCount = ____exports.HeroBanPick:GetReadyPlayerCount()
    if readyCount < requiredVoteCount then
        return
    end
    ____exports.HeroBanPick:Log((("[HeroBanPick][AllReady] readyCount=" .. tostring(readyCount)) .. "/") .. tostring(requiredVoteCount))
    ____exports.HeroBanPick:FinalizeBans()
    ____exports.HeroBanPick:StartSelectionEnforcement(____exports.HeroBanPick.availableHeroes)
end
function HeroBanPick.GetReadyPlayerCount(self)
    local readyByPlayer = {}
    if ____exports.HeroBanPick:GetRequiredVoteCount() == 1 then
        return #__TS__ObjectKeys(____exports.HeroBanPick.confirmedByPlayer)
    end
    for playerId in pairs(____exports.HeroBanPick.votesByPlayer) do
        readyByPlayer[playerId] = true
    end
    for playerId in pairs(____exports.HeroBanPick.confirmedByPlayer) do
        readyByPlayer[playerId] = true
    end
    return #__TS__ObjectKeys(readyByPlayer)
end
function HeroBanPick.GetVotesPerPlayer(self)
    return ____exports.HeroBanPick:GetRequiredVoteCount() == 1 and 2 or 1
end
function HeroBanPick.GetRequiredVoteCount(self)
    if ____exports.HeroBanPick.humanPlayerIdsForTest ~= nil then
        return #____exports.HeroBanPick.humanPlayerIdsForTest
    end
    if type(PlayerResource) == "nil" then
        return 0
    end
    local count = 0
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            count = count + 1
        end
    end)
    return count
end
function HeroBanPick.SyncStatus(self)
    local status = {
        phase = ____exports.HeroBanPick.phase,
        bannedHeroes = ____exports.HeroBanPick:GetBannedHeroes(),
        availableHeroes = {unpack(____exports.HeroBanPick.availableHeroes)},
        votes = ____exports.HeroBanPick:GetVoteCounts(),
        voteCount = #__TS__ObjectKeys(____exports.HeroBanPick.votesByPlayer),
        banCount = ____exports.HeroBanPick.banCount,
        endsAt = ____exports.HeroBanPick.endsAt
    }
    if type(CustomNetTables) ~= "nil" then
        CustomNetTables:SetTableValue("hero_ban_pick", "status", status)
        ____exports.HeroBanPick:Log((((((("[HeroBanPick][SyncStatus] phase=" .. status.phase) .. " available=") .. tostring(#status.availableHeroes)) .. " banned=") .. table.concat(status.bannedHeroes, ",")) .. " voteCount=") .. tostring(status.voteCount))
    end
end
HeroBanPick.DEFAULT_BAN_COUNT = 5
HeroBanPick.DEFAULT_VOTE_TIME = 10
HeroBanPick.phase = "inactive"
HeroBanPick.votesByPlayer = {}
HeroBanPick.confirmedByPlayer = {}
HeroBanPick.firstVoteOrder = {}
HeroBanPick.bannedHeroes = {}
HeroBanPick.banCount = ____exports.HeroBanPick.DEFAULT_BAN_COUNT
HeroBanPick.endsAt = 0
HeroBanPick.availableHeroes = {}
HeroBanPick.listenerRegistered = false
HeroBanPick.enforcementRunning = false
return ____exports
