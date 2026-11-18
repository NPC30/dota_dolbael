local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/treasure/treasure.lua"
__TS__SourceMapTraceBack("modules/treasure/treasure.lua", {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 2,["15"] = 3,["16"] = 3,["17"] = 4,["18"] = 4,["19"] = 5,["20"] = 5,["21"] = 6,["22"] = 6,["23"] = 7,["24"] = 7,["25"] = 7,["26"] = 8,["27"] = 10,["28"] = 15,["29"] = 16,["30"] = 15,["32"] = 27,["33"] = 28,["34"] = 29,["35"] = 30,["36"] = 31,["37"] = 32,["38"] = 33,["39"] = 36,["40"] = 36,["41"] = 38,["42"] = 39,["43"] = 40,["44"] = 41,["45"] = 41,["46"] = 41,["47"] = 41,["48"] = 42,["49"] = 42,["50"] = 42,["51"] = 43,["52"] = 44,["53"] = 42,["54"] = 42,["55"] = 46,["56"] = 47,["57"] = 47,["58"] = 47,["59"] = 48,["60"] = 49,["61"] = 50,["63"] = 52,["64"] = 47,["65"] = 47,["67"] = 36,["68"] = 36,["69"] = 36,["70"] = 35,["71"] = 60,["72"] = 61,["75"] = 65,["76"] = 66,["77"] = 67,["79"] = 60,["80"] = 71,["81"] = 72,["82"] = 73,["85"] = 76,["86"] = 77,["89"] = 80,["90"] = 81,["91"] = 82,["94"] = 85,["95"] = 86,["96"] = 72,["97"] = 71,["98"] = 90,["99"] = 91,["100"] = 92,["101"] = 93,["102"] = 94,["103"] = 95,["104"] = 96,["105"] = 96,["106"] = 96,["107"] = 96,["108"] = 96,["111"] = 104,["112"] = 105,["113"] = 106,["114"] = 106,["115"] = 106,["116"] = 106,["117"] = 106,["120"] = 114,["121"] = 114,["122"] = 114,["123"] = 114,["124"] = 114,["125"] = 119,["126"] = 120,["127"] = 121,["130"] = 125,["131"] = 90,["132"] = 128,["133"] = 129,["134"] = 128,["135"] = 132,["136"] = 132,["137"] = 132,["139"] = 133,["140"] = 134,["141"] = 135,["144"] = 138,["145"] = 139,["146"] = 140,["149"] = 143,["150"] = 144,["151"] = 145,["152"] = 146,["153"] = 147,["156"] = 150,["158"] = 152,["159"] = 153,["160"] = 154,["161"] = 134,["162"] = 158,["163"] = 132,["164"] = 161,["165"] = 162,["166"] = 163,["169"] = 166,["170"] = 167,["171"] = 168,["172"] = 169,["175"] = 172,["176"] = 173,["177"] = 174,["178"] = 175,["179"] = 177,["180"] = 178,["181"] = 179,["182"] = 180,["184"] = 184,["185"] = 190,["188"] = 196,["189"] = 197,["190"] = 198,["191"] = 201,["192"] = 161,["193"] = 204,["194"] = 209,["195"] = 210,["196"] = 211,["197"] = 212,["198"] = 216,["199"] = 217,["200"] = 204,["201"] = 220,["202"] = 221,["203"] = 222,["204"] = 223,["206"] = 226,["207"] = 227,["209"] = 230,["210"] = 234,["211"] = 235,["213"] = 238,["214"] = 240,["215"] = 220,["216"] = 243,["217"] = 248,["218"] = 243,["219"] = 251,["220"] = 252,["221"] = 253,["222"] = 254,["223"] = 255,["224"] = 256,["225"] = 257,["226"] = 260,["227"] = 260,["228"] = 260,["229"] = 260,["230"] = 260,["231"] = 260,["232"] = 260,["233"] = 260,["234"] = 268,["235"] = 269,["237"] = 271,["238"] = 271,["239"] = 273,["240"] = 274,["241"] = 251,["242"] = 277,["243"] = 282,["244"] = 283,["245"] = 284,["246"] = 285,["247"] = 285,["248"] = 286,["249"] = 287,["250"] = 290,["251"] = 293,["252"] = 295,["253"] = 285,["254"] = 285,["255"] = 285,["256"] = 285,["257"] = 285,["258"] = 285,["259"] = 289,["260"] = 289,["261"] = 289,["262"] = 289,["263"] = 289,["264"] = 289,["265"] = 285,["266"] = 302,["267"] = 303,["268"] = 306,["269"] = 307,["270"] = 308,["273"] = 311,["274"] = 312,["275"] = 313,["276"] = 314,["278"] = 316,["279"] = 317,["280"] = 318,["283"] = 321,["284"] = 321,["285"] = 321,["286"] = 321,["287"] = 322,["288"] = 323,["291"] = 326,["292"] = 327,["293"] = 328,["294"] = 285,["295"] = 332,["296"] = 333,["297"] = 334,["300"] = 337,["301"] = 338,["304"] = 341,["305"] = 342,["306"] = 342,["307"] = 342,["308"] = 343,["309"] = 342,["310"] = 342,["311"] = 285,["312"] = 285,["313"] = 285,["314"] = 277,["315"] = 349,["316"] = 350,["317"] = 351,["320"] = 355,["321"] = 355,["322"] = 356,["323"] = 356,["325"] = 356,["326"] = 356,["328"] = 356,["329"] = 355,["330"] = 355,["331"] = 358,["334"] = 362,["335"] = 349,["336"] = 367,["337"] = 374,["339"] = 376,["340"] = 374,["342"] = 374,["345"] = 382,["346"] = 367,["347"] = 385,["348"] = 391,["349"] = 392,["351"] = 395,["352"] = 396,["353"] = 396,["354"] = 396,["355"] = 396,["356"] = 399,["357"] = 385,["358"] = 402,["359"] = 408,["360"] = 409,["362"] = 412,["363"] = 413,["364"] = 414,["365"] = 415,["367"] = 418,["368"] = 419,["369"] = 422,["371"] = 425,["372"] = 402,["373"] = 428,["374"] = 433,["377"] = 437,["378"] = 438,["379"] = 439,["380"] = 428,["381"] = 442,["382"] = 443,["385"] = 447,["386"] = 442,["387"] = 454,["388"] = 460,["389"] = 460,["392"] = 464,["393"] = 464,["394"] = 465,["395"] = 465,["396"] = 467,["397"] = 467,["398"] = 469,["399"] = 469,["400"] = 470,["401"] = 470,["402"] = 471,["403"] = 465,["404"] = 465,["405"] = 465,["406"] = 465,["407"] = 465,["408"] = 465,["409"] = 465,["410"] = 465,["411"] = 465,["412"] = 465,["413"] = 465,["414"] = 465,["415"] = 465,["416"] = 473,["417"] = 454,["418"] = 478,["419"] = 482,["420"] = 483,["422"] = 485,["423"] = 486,["425"] = 489,["428"] = 495,["430"] = 499,["431"] = 499,["433"] = 500,["434"] = 501,["435"] = 502,["437"] = 504,["440"] = 499,["443"] = 507,["444"] = 478,["445"] = 514,["446"] = 515,["447"] = 514,["448"] = 521,["449"] = 522,["450"] = 523,["451"] = 524,["452"] = 521,["453"] = 527,["454"] = 528,["455"] = 528,["457"] = 529,["458"] = 529,["460"] = 530,["461"] = 527,["462"] = 17,["463"] = 18,["464"] = 19,["465"] = 20,["466"] = 21,["467"] = 22,["468"] = 23,["469"] = 24,["470"] = 25,["471"] = 15,["472"] = 16});
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____ability_2Dreplacer = require("modules.helper.ability-replacer")
local AbilityReplacer = ____ability_2Dreplacer.AbilityReplacer
local ____hero_2Dname_2Dhelper = require("modules.helper.hero-name-helper")
local HeroNameHelper = ____hero_2Dname_2Dhelper.HeroNameHelper
local ____ability_2Dreplace_2Ditem_2Dlimit = require("modules.lottery.ability-replace.ability-replace-item-limit")
local AbilityReplaceItemLimit = ____ability_2Dreplace_2Ditem_2Dlimit.AbilityReplaceItemLimit
local ____item_2Dlottery_2Dhelper = require("modules.lottery.item.item-lottery-helper")
local ItemLotteryPool = ____item_2Dlottery_2Dhelper.ItemLotteryPool
local ItemLotteryHelper = ____item_2Dlottery_2Dhelper.ItemLotteryHelper
local ____treasure_2Dbackend = require("modules.treasure.treasure-backend")
local TREASURE_BACKEND_HOST = ____treasure_2Dbackend.TREASURE_BACKEND_HOST
____exports.Treasure = __TS__Class()
local Treasure = ____exports.Treasure
Treasure.name = "Treasure"
function Treasure.prototype.____constructor(self)
    self.initialGranted = false
    self.preparedByPlayer = {}
    self.initialPreparedByPlayer = {}
    self.initialOpenedByPlayer = {}
    self.initialAwakeningApplyRequestedByPlayer = {}
    self.preparedCountByPlayer = {}
    self.initialPrepareRetryCountByPlayer = {}
    ListenToGameEvent(
        "game_rules_state_change",
        function()
            local state = GameRules:State_Get()
            if state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
                Timers:CreateTimer(
                    ____exports.Treasure.INITIAL_GRANT_DELAY,
                    function() return self:grantInitial() end
                )
                Timers:CreateTimer(
                    ____exports.Treasure.INITIAL_GRANT_DELAY + ____exports.Treasure.GRANT_INTERVAL,
                    function()
                        self:grantAll(false)
                        return ____exports.Treasure.GRANT_INTERVAL
                    end
                )
                self:prepareInitialChests()
                Timers:CreateTimer(
                    ____exports.Treasure.INITIAL_PREPARE_RETRY_INTERVAL,
                    function()
                        self:prepareInitialChests()
                        if GameRules:GetGameTime() < ____exports.Treasure.INITIAL_GRANT_DELAY then
                            return ____exports.Treasure.INITIAL_PREPARE_RETRY_INTERVAL
                        end
                        return nil
                    end
                )
            end
        end,
        nil
    )
end
function Treasure.prototype.grantInitial(self)
    if self.initialGranted then
        return
    end
    local grantedCount = self:grantAll(true)
    if grantedCount > 0 then
        self.initialGranted = true
    end
end
function Treasure.prototype.prepareInitialChests(self)
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        local key = tostring(playerId)
        if self.initialPreparedByPlayer[key] then
            return
        end
        local hero = PlayerResource:GetSelectedHeroEntity(playerId)
        if not hero then
            print("[Treasure] initial prepare delayed, hero not found: " .. tostring(playerId))
            return
        end
        self.initialPreparedByPlayer[key] = true
        self:prepareGrantedChest(hero, true)
    end)
end
function Treasure.prototype.PrepareAndApplyInitialAwakening(self, hero)
    local playerId = hero:GetPlayerOwnerID()
    local key = tostring(playerId)
    local steamId = PlayerResource:GetSteamAccountID(playerId)
    local backendHeroName = HeroNameHelper:GetBackendHeroName(hero)
    if ____exports.Treasure:IsPlayerAwakened(playerId, hero) then
        self:sendDebugMessage(
            playerId,
            steamId,
            (("开局觉醒请求跳过：已觉醒，hero=" .. backendHeroName) .. ", unit=") .. hero:GetUnitName()
        )
        return
    end
    self.initialAwakeningApplyRequestedByPlayer[key] = true
    if not ____exports.Treasure:IsGameInProgress() then
        self:sendDebugMessage(
            playerId,
            steamId,
            (("开局觉醒请求等待：hero=" .. backendHeroName) .. ", unit=") .. hero:GetUnitName()
        )
        return
    end
    self:sendDebugMessage(
        playerId,
        steamId,
        (((("开局觉醒请求开始：hero=" .. backendHeroName) .. ", unit=") .. hero:GetUnitName()) .. ", prepared=") .. (self.initialPreparedByPlayer[key] and "yes" or "no")
    )
    if not self.initialPreparedByPlayer[key] then
        self.initialPreparedByPlayer[key] = true
        self:prepareGrantedChest(hero, true)
        return
    end
    self:applyPreparedInitialAwakening(playerId, hero)
end
function Treasure.IsGameInProgress(self)
    return GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS
end
function Treasure.prototype.grantAll(self, initialGrant)
    if initialGrant == nil then
        initialGrant = true
    end
    local grantedCount = 0
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            return
        end
        local hero = PlayerResource:GetSelectedHeroEntity(playerId)
        if not hero then
            print((("[Treasure] failed to grant " .. ____exports.Treasure.ITEM_NAME) .. ", hero not found: ") .. tostring(playerId))
            return
        end
        local key = tostring(playerId)
        if initialGrant then
            if not self.initialPreparedByPlayer[key] then
                self.initialPreparedByPlayer[key] = true
                self:prepareGrantedChest(hero, true)
            end
        else
            self:prepareGrantedChest(hero, false)
        end
        hero:AddItemByName(____exports.Treasure.ITEM_NAME)
        grantedCount = grantedCount + 1
        print((((("[Treasure] granted " .. ____exports.Treasure.ITEM_NAME) .. " to player ") .. tostring(playerId)) .. ", initial=") .. tostring(initialGrant))
    end)
    return grantedCount
end
function Treasure.prototype.openNextChest(self, opener)
    if not PlayerHelper:IsHumanPlayer(opener) then
        print("[Treasure] open ignored, opener is not human")
        return
    end
    local playerId = opener:GetPlayerOwnerID()
    local selectedHero = PlayerResource:GetSelectedHeroEntity(playerId)
    if selectedHero ~= opener then
        print("[Treasure] open ignored, opener is not selected hero: " .. tostring(playerId))
        return
    end
    local key = tostring(playerId)
    local queue = self.preparedByPlayer[key] or ({})
    local prepared = table.remove(queue, 1)
    self.preparedByPlayer[key] = queue
    if prepared then
        if prepared.initialChest then
            self.initialOpenedByPlayer[key] = true
            self:applyInitialAwakening(playerId, opener, true, {awakening = prepared.awakening})
        end
        GameRules.Lottery.Item:onTriggeredPrepared(opener, prepared.candidates, prepared.poolType, prepared.openId)
        print((((((("[Treasure] opened prepared chest #" .. tostring(prepared.chestNumber)) .. " for player ") .. tostring(playerId)) .. ", pool=") .. prepared.poolType) .. ", openId=") .. (prepared.openId or "local"))
        return
    end
    local fallbackChestNumber = self:getNextChestNumber(key)
    local fallbackPool = ____exports.Treasure:getPoolForChestNumber(fallbackChestNumber)
    print((((("[Treasure] prepared chest missing for player " .. tostring(playerId)) .. ", fallback to local lottery #") .. tostring(fallbackChestNumber)) .. ", pool=") .. fallbackPool)
    GameRules.Lottery.Item:onTriggered(opener, fallbackPool)
end
function Treasure.MarkPlayerAwakened(self, playerId, hero, abilityName)
    local key = tostring(playerId)
    ____exports.Treasure.awakenedByPlayer[key] = true
    ____exports.Treasure.awakeningAbilityByPlayer[key] = abilityName
    local heroAny = hero
    heroAny.__showcaseAwakeningApplied = true
    heroAny.__showcaseAwakeningAbilityName = abilityName
end
function Treasure.IsPlayerAwakened(self, playerId, hero)
    local key = tostring(playerId)
    if ____exports.Treasure.awakenedByPlayer[key] then
        return true
    end
    if not hero then
        return false
    end
    local heroAny = hero
    if heroAny.__showcaseAwakeningApplied then
        return true
    end
    local abilityName = ____exports.Treasure.awakeningAbilityByPlayer[key] or heroAny.__showcaseAwakeningAbilityName
    return abilityName ~= nil and hero:HasAbility(abilityName)
end
function Treasure.ApplyAwakeningImmediately(self, playerId, hero, abilityName)
    ____exports.Treasure:applyAwakeningWithVerification(playerId, hero, abilityName, 1)
end
function Treasure.prototype.prepareGrantedChest(self, hero, initialChest)
    local playerId = hero:GetPlayerOwnerID()
    local key = tostring(playerId)
    local localId = DoUniqueString((("treasure_" .. tostring(playerId)) .. "_") .. tostring(GameRules:GetGameTime()))
    local chestNumber = self:getNextChestNumber(key)
    local poolType = ____exports.Treasure:getPoolForChestNumber(chestNumber)
    local excludedNames = AbilityReplaceItemLimit:hasTreasureGrant(playerId) and __TS__New(Set, {AbilityReplaceItemLimit.ITEM_NAME}) or nil
    local prepared = {
        playerId = playerId,
        localId = localId,
        candidates = ItemLotteryHelper:getRandomItems(4, poolType, excludedNames),
        chestNumber = chestNumber,
        poolType = poolType,
        initialChest = initialChest
    }
    if self.preparedByPlayer[key] == nil then
        self.preparedByPlayer[key] = {}
    end
    local ____self_preparedByPlayer_key_0 = self.preparedByPlayer[key]
    ____self_preparedByPlayer_key_0[#____self_preparedByPlayer_key_0 + 1] = prepared
    local steamId = PlayerResource:GetSteamAccountID(playerId)
    self:requestPrepareChest(hero, prepared, steamId)
end
function Treasure.prototype.requestPrepareChest(self, hero, prepared, steamId)
    local playerId = hero:GetPlayerOwnerID()
    local key = tostring(playerId)
    local backendHeroName = HeroNameHelper:GetBackendHeroName(hero)
    local ____ApiClient_9 = ApiClient
    local ____ApiClient_sendWithRetry_10 = ApiClient.sendWithRetry
    local ____HttpMethod_POST_7 = HttpMethod.POST
    local ____TREASURE_BACKEND_HOST_8 = TREASURE_BACKEND_HOST
    local ____steamId_3 = steamId
    local ____prepared_initialChest_4 = prepared.initialChest
    local ____opt_1 = GameRules.Option
    ____ApiClient_sendWithRetry_10(
        ____ApiClient_9,
        {
            method = ____HttpMethod_POST_7,
            hostOverride = ____TREASURE_BACKEND_HOST_8,
            path = "/game/treasure/prepare",
            body = {
                steamId = ____steamId_3,
                heroName = backendHeroName,
                matchId = "",
                initialChest = ____prepared_initialChest_4,
                abyss = (____opt_1 and ____opt_1.abyssMode) == true and ({enabled = true, heroName = backendHeroName}) or nil
            },
            successFunc = function(____, body)
                local parsed = (json.decode(body))
                local data = parsed and parsed.data
                if not data then
                    print("[Treasure] prepare response empty for player " .. tostring(playerId))
                    return
                end
                self.initialPrepareRetryCountByPlayer[key] = 0
                if prepared.initialChest then
                    self:sendDebugAwakeningStatus(playerId, steamId, data)
                    self:syncAbyssRecordStatus(playerId, steamId, hero, data)
                end
                local queue = self.preparedByPlayer[key]
                if not queue then
                    self:applyInitialAwakening(playerId, hero, prepared.initialChest, data)
                    return
                end
                local target = __TS__ArrayFind(
                    queue,
                    function(____, item) return item.localId == prepared.localId end
                )
                if not target then
                    self:applyInitialAwakening(playerId, hero, prepared.initialChest, data)
                    return
                end
                self:applyPreparedResponse(target, data)
                self:applyPreparedInitialAwakening(playerId, hero)
                print((((((("[Treasure] prepared backend chest #" .. tostring(target.chestNumber)) .. " for player ") .. tostring(playerId)) .. ", pool=") .. target.poolType) .. ", openId=") .. (data.openId or "none"))
            end,
            failureFunc = function(____, body)
                print((("[Treasure] prepare request failed for player " .. tostring(playerId)) .. ": ") .. body)
                if not prepared.initialChest then
                    return
                end
                local retryCount = self.initialPrepareRetryCountByPlayer[key] or 0
                if retryCount >= 12 or ____exports.Treasure:IsPlayerAwakened(playerId, hero) then
                    return
                end
                self.initialPrepareRetryCountByPlayer[key] = retryCount + 1
                Timers:CreateTimer(
                    ____exports.Treasure.INITIAL_PREPARE_RETRY_INTERVAL,
                    function()
                        self:requestPrepareChest(hero, prepared, steamId)
                    end
                )
            end
        }
    )
end
function Treasure.prototype.applyPreparedInitialAwakening(self, playerId, hero)
    local key = tostring(playerId)
    if not self.initialOpenedByPlayer[key] and not self.initialAwakeningApplyRequestedByPlayer[key] then
        return
    end
    local prepared = __TS__ArrayFind(
        self.preparedByPlayer[key] or ({}),
        function(____, item)
            local ____item_initialChest_13 = item.initialChest
            if ____item_initialChest_13 then
                local ____opt_11 = item.awakening
                ____item_initialChest_13 = ____opt_11 and ____opt_11.active
            end
            return ____item_initialChest_13 and item.awakening.abilityName
        end
    )
    if not prepared then
        return
    end
    self:applyInitialAwakening(playerId, hero, true, {awakening = prepared.awakening})
end
function Treasure.prototype.applyInitialAwakening(self, playerId, hero, initialChest, response)
    local ____temp_16 = not initialChest or ____exports.Treasure:IsPlayerAwakened(playerId, hero)
    if not ____temp_16 then
        local ____opt_14 = response.awakening
        ____temp_16 = not (____opt_14 and ____opt_14.active)
    end
    if ____temp_16 or not response.awakening.abilityName then
        return
    end
    ____exports.Treasure:ApplyAwakeningImmediately(playerId, hero, response.awakening.abilityName)
end
function Treasure.applyAwakeningWithVerification(self, playerId, hero, abilityName, attempt)
    if ____exports.Treasure:IsPlayerAwakened(playerId, hero) then
        return nil
    end
    AbilityReplacer:applySpecificAwakening(hero, abilityName, 0)
    Timers:CreateTimer(
        ____exports.Treasure.AWAKENING_VERIFY_DELAY,
        function() return ____exports.Treasure:verifyAwakeningApplied(playerId, hero, abilityName, attempt) end
    )
    return nil
end
function Treasure.verifyAwakeningApplied(self, playerId, hero, abilityName, attempt)
    if ____exports.Treasure:IsPlayerAwakened(playerId, hero) then
        return nil
    end
    if hero:HasAbility(abilityName) then
        ____exports.Treasure:MarkPlayerAwakened(playerId, hero, abilityName)
        print((("[Treasure] verified initial awakening " .. abilityName) .. " for player ") .. tostring(playerId))
        return nil
    end
    if attempt >= ____exports.Treasure.AWAKENING_APPLY_MAX_ATTEMPTS then
        print(((((("[Treasure] failed to verify initial awakening " .. abilityName) .. " for player ") .. tostring(playerId)) .. " after ") .. tostring(attempt)) .. " attempts")
        return nil
    end
    return ____exports.Treasure:applyAwakeningWithVerification(playerId, hero, abilityName, attempt + 1)
end
function Treasure.prototype.sendDebugAwakeningStatus(self, playerId, steamId, response)
    if not response.awakening then
        return
    end
    local status = response.awakening.active and "active" or "inactive"
    local abilityName = response.awakening.abilityName or "none"
    self:sendDebugMessage(playerId, steamId, (("觉醒状态请求成功：" .. status) .. ", ability=") .. abilityName)
end
function Treasure.prototype.sendDebugMessage(self, playerId, steamId, message)
    if steamId ~= ____exports.Treasure.DEBUG_STEAM_ID then
        return
    end
    GameRules:SendCustomMessage("<font color='#66CCFF'>[TreasureDebug]</font> " .. message, playerId, 0)
end
function Treasure.prototype.syncAbyssRecordStatus(self, playerId, steamId, hero, response)
    local ____opt_17 = GameRules.Option
    if (____opt_17 and ____opt_17.abyssMode) ~= true then
        return
    end
    local ____opt_19 = response.abyss
    local bestWave = ____opt_19 and ____opt_19.maxWave or 0
    local ____CustomNetTables_SetTableValue_33 = CustomNetTables.SetTableValue
    local ____tostring_result_32 = tostring(steamId)
    local ____opt_21 = GameRules.AbyssMode
    local ____temp_29 = ____opt_21 and ____opt_21:GetCurrentWave() or _G.AbyssModeWave or 0
    local ____opt_23 = GameRules.AbyssMode
    local ____temp_30 = ____opt_23 and ____opt_23:GetNextWaveRespawnTime() or 0
    local ____opt_25 = GameRules.AbyssMode
    local ____temp_31 = ____opt_25 and ____opt_25:GetNextWaveRespawnDelay() or 0
    local ____opt_27 = response.abyss
    ____CustomNetTables_SetTableValue_33(
        CustomNetTables,
        "abyss_status",
        ____tostring_result_32,
        {
            enabled = 1,
            currentWave = ____temp_29,
            personalBestWave = bestWave,
            nextWaveRespawnTime = ____temp_30,
            nextWaveRespawnDelay = ____temp_31,
            heroName = ____opt_27 and ____opt_27.heroName or hero:GetUnitName()
        }
    )
    print((((("[Treasure] synced abyss record for player " .. tostring(playerId)) .. ", hero=") .. hero:GetUnitName()) .. ", bestWave=") .. tostring(bestWave))
end
function Treasure.prototype.applyPreparedResponse(self, prepared, response)
    if response.openId then
        prepared.openId = response.openId
    end
    if response.awakening then
        prepared.awakening = response.awakening
    end
    if response.mode ~= "replace_tail_slots" or not response.replacements or #response.replacements == 0 then
        return
    end
    local replaceCount = math.min(response.replaceCount or #response.replacements, #prepared.candidates)
    do
        local i = 0
        while i < replaceCount do
            do
                local replacement = response.replacements[i + 1]
                if not replacement then
                    goto __continue76
                end
                prepared.candidates[#prepared.candidates - replaceCount + i + 1] = self:toLotteryCandidate(replacement)
            end
            ::__continue76::
            i = i + 1
        end
    end
    prepared.candidates = AbilityReplaceItemLimit:sanitizeTreasureCandidates(prepared.playerId, prepared.candidates, prepared.poolType)
end
function Treasure.prototype.toLotteryCandidate(self, replacement)
    return {name = replacement.rewardCode, level = replacement.level or 3}
end
function Treasure.prototype.getNextChestNumber(self, playerKey)
    local nextNumber = (self.preparedCountByPlayer[playerKey] or 0) + 1
    self.preparedCountByPlayer[playerKey] = nextNumber
    return nextNumber
end
function Treasure.getPoolForChestNumber(self, chestNumber)
    if chestNumber <= 2 then
        return ItemLotteryPool.INITIAL
    end
    if chestNumber <= 5 then
        return ItemLotteryPool.DEFAULT
    end
    return ItemLotteryPool.PREMIUM
end
Treasure.ITEM_NAME = "item_treasure_chest"
Treasure.GRANT_INTERVAL = 240
Treasure.INITIAL_GRANT_DELAY = 120
Treasure.INITIAL_PREPARE_RETRY_INTERVAL = 10
Treasure.AWAKENING_VERIFY_DELAY = 1
Treasure.AWAKENING_APPLY_MAX_ATTEMPTS = 6
Treasure.DEBUG_STEAM_ID = 116431158
Treasure.awakenedByPlayer = {}
Treasure.awakeningAbilityByPlayer = {}
Treasure = __TS__DecorateLegacy({reloadable}, Treasure)
____exports.Treasure = Treasure
return ____exports
