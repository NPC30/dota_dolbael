local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/item/item-lottery.lua"
__TS__SourceMapTraceBack("modules/lottery/item/item-lottery.lua", {["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 6,["21"] = 6,["22"] = 7,["23"] = 7,["24"] = 8,["25"] = 8,["26"] = 8,["27"] = 9,["28"] = 9,["31"] = 29,["32"] = 30,["33"] = 29,["35"] = 32,["36"] = 33,["37"] = 33,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 33,["45"] = 33,["46"] = 33,["47"] = 33,["48"] = 33,["49"] = 33,["50"] = 33,["51"] = 33,["52"] = 33,["53"] = 33,["54"] = 33,["55"] = 33,["56"] = 33,["57"] = 33,["58"] = 33,["59"] = 33,["60"] = 33,["61"] = 33,["62"] = 61,["63"] = 61,["64"] = 61,["65"] = 62,["66"] = 61,["67"] = 61,["68"] = 64,["69"] = 64,["70"] = 64,["71"] = 65,["72"] = 64,["73"] = 64,["74"] = 60,["75"] = 72,["76"] = 74,["77"] = 74,["79"] = 76,["80"] = 77,["83"] = 80,["84"] = 81,["85"] = 82,["88"] = 86,["89"] = 87,["90"] = 88,["91"] = 72,["92"] = 91,["93"] = 94,["94"] = 94,["96"] = 97,["97"] = 98,["100"] = 101,["101"] = 102,["102"] = 103,["105"] = 107,["106"] = 108,["107"] = 91,["108"] = 118,["109"] = 124,["110"] = 129,["111"] = 129,["112"] = 129,["113"] = 129,["114"] = 129,["115"] = 129,["116"] = 129,["117"] = 136,["118"] = 136,["119"] = 136,["120"] = 136,["121"] = 136,["122"] = 118,["123"] = 144,["124"] = 145,["125"] = 146,["126"] = 147,["127"] = 148,["130"] = 151,["131"] = 152,["134"] = 156,["135"] = 156,["136"] = 156,["137"] = 156,["138"] = 159,["139"] = 160,["142"] = 164,["143"] = 165,["144"] = 166,["147"] = 169,["148"] = 170,["149"] = 170,["150"] = 170,["151"] = 170,["152"] = 170,["153"] = 170,["154"] = 170,["155"] = 170,["156"] = 170,["157"] = 170,["158"] = 170,["159"] = 178,["160"] = 179,["161"] = 179,["162"] = 179,["163"] = 179,["164"] = 179,["165"] = 180,["166"] = 181,["167"] = 187,["168"] = 188,["169"] = 188,["170"] = 188,["171"] = 188,["172"] = 188,["173"] = 188,["174"] = 188,["175"] = 188,["176"] = 188,["177"] = 188,["178"] = 188,["181"] = 197,["182"] = 198,["183"] = 199,["184"] = 200,["186"] = 202,["187"] = 203,["188"] = 204,["189"] = 205,["190"] = 206,["193"] = 209,["194"] = 210,["195"] = 211,["196"] = 211,["197"] = 211,["198"] = 211,["199"] = 211,["200"] = 178,["201"] = 218,["202"] = 219,["203"] = 220,["206"] = 224,["207"] = 225,["208"] = 225,["209"] = 225,["210"] = 225,["211"] = 225,["212"] = 235,["213"] = 236,["214"] = 244,["215"] = 225,["216"] = 246,["217"] = 247,["218"] = 248,["219"] = 249,["220"] = 250,["221"] = 250,["222"] = 250,["223"] = 250,["224"] = 250,["225"] = 225,["226"] = 225,["227"] = 144,["228"] = 259,["229"] = 260,["230"] = 259,["231"] = 263,["232"] = 268,["233"] = 269,["234"] = 270,["235"] = 271,["238"] = 274,["239"] = 275,["241"] = 277,["242"] = 278,["243"] = 279,["244"] = 280,["247"] = 284,["248"] = 287,["249"] = 288,["250"] = 289,["251"] = 290,["252"] = 291,["253"] = 292,["255"] = 294,["256"] = 295,["258"] = 263,["259"] = 299,["260"] = 304,["263"] = 308,["264"] = 309,["267"] = 313,["268"] = 314,["269"] = 318,["270"] = 299,["271"] = 321,["272"] = 322,["273"] = 323,["274"] = 324,["275"] = 325,["278"] = 328,["279"] = 329,["282"] = 332,["283"] = 333,["284"] = 334,["287"] = 337,["288"] = 338,["291"] = 341,["292"] = 342,["295"] = 346,["296"] = 347,["297"] = 350,["298"] = 355,["299"] = 361,["300"] = 361,["301"] = 361,["302"] = 361,["303"] = 361,["304"] = 366,["305"] = 321,["306"] = 31,["307"] = 29,["308"] = 30});
local ____exports = {}
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
local HttpMethod = ____api_2Dclient.HttpMethod
local ____player = require("api.player")
local MemberLevel = ____player.MemberLevel
local Player = ____player.Player
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____ability_2Dreplace_2Ditem_2Dlimit = require("modules.lottery.ability-replace.ability-replace-item-limit")
local AbilityReplaceItemLimit = ____ability_2Dreplace_2Ditem_2Dlimit.AbilityReplaceItemLimit
local ____skill_2Dtome_2Dauthorization = require("modules.lottery.skill-tome-authorization")
local SkillTomeAuthorization = ____skill_2Dtome_2Dauthorization.SkillTomeAuthorization
local ____item_2Dlottery_2Dhelper = require("modules.lottery.item.item-lottery-helper")
local ItemLotteryHelper = ____item_2Dlottery_2Dhelper.ItemLotteryHelper
local ItemLotteryPool = ____item_2Dlottery_2Dhelper.ItemLotteryPool
local ____treasure_2Dbackend = require("modules.treasure.treasure-backend")
local TREASURE_BACKEND_HOST = ____treasure_2Dbackend.TREASURE_BACKEND_HOST
--- 物品抽奖：触发后弹 4 选 1，倒计时由客户端驱动，归零自动随机选 1。
-- 触发源（藏宝箱 / 未来 boss / 商店开箱）调 onTriggered 即可，本模块不关心来源。
____exports.ItemLottery = __TS__Class()
local ItemLottery = ____exports.ItemLottery
ItemLottery.name = "ItemLottery"
function ItemLottery.prototype.____constructor(self)
    self.pendingByPlayer = {}
    self.permanentGrowthModifiers = {
        item_treasure_perm_strength_10 = "modifier_item_treasure_perm_strength",
        item_treasure_perm_strength_20 = "modifier_item_treasure_perm_strength",
        item_treasure_perm_strength_50 = "modifier_item_treasure_perm_strength",
        item_treasure_perm_agility_10 = "modifier_item_treasure_perm_agility",
        item_treasure_perm_agility_20 = "modifier_item_treasure_perm_agility",
        item_treasure_perm_agility_50 = "modifier_item_treasure_perm_agility",
        item_treasure_perm_intellect_10 = "modifier_item_treasure_perm_intellect",
        item_treasure_perm_intellect_20 = "modifier_item_treasure_perm_intellect",
        item_treasure_perm_intellect_50 = "modifier_item_treasure_perm_intellect",
        item_treasure_perm_health_1000 = "modifier_item_treasure_perm_health",
        item_treasure_perm_health_2000 = "modifier_item_treasure_perm_health",
        item_treasure_perm_health_5000 = "modifier_item_treasure_perm_health",
        item_treasure_perm_base_attack_pct_10 = "modifier_item_treasure_perm_base_attack_pct",
        item_treasure_perm_base_attack_pct_20 = "modifier_item_treasure_perm_base_attack_pct",
        item_treasure_perm_base_attack_pct_50 = "modifier_item_treasure_perm_base_attack_pct",
        item_treasure_perm_damage_100 = "modifier_item_treasure_perm_damage",
        item_treasure_perm_damage_200 = "modifier_item_treasure_perm_damage",
        item_treasure_perm_damage_500 = "modifier_item_treasure_perm_damage",
        item_treasure_perm_armor_10 = "modifier_item_treasure_perm_armor",
        item_treasure_perm_armor_20 = "modifier_item_treasure_perm_armor",
        item_treasure_perm_armor_50 = "modifier_item_treasure_perm_armor",
        item_treasure_perm_movespeed_30 = "modifier_item_treasure_perm_movespeed",
        item_treasure_perm_movespeed_60 = "modifier_item_treasure_perm_movespeed",
        item_treasure_perm_movespeed_100 = "modifier_item_treasure_perm_movespeed"
    }
    CustomGameEventManager:RegisterListener(
        "lottery_pick_item",
        function(_userId, event)
            self:pickItem(event.PlayerID, event)
        end
    )
    CustomGameEventManager:RegisterListener(
        "lottery_refresh_item",
        function(_userId, event)
            self:refreshItem(event.PlayerID)
        end
    )
end
function ItemLottery.prototype.onTriggered(self, opener, pool)
    if pool == nil then
        pool = ItemLotteryPool.DEFAULT
    end
    if not PlayerHelper:IsHumanPlayer(opener) then
        print("[ItemLottery] trigger ignored, opener is not human")
        return
    end
    local playerId = opener:GetPlayerOwnerID()
    if playerId < 0 then
        print("[ItemLottery] trigger ignored, invalid player id")
        return
    end
    local candidates = ItemLotteryHelper:getRandomItems(____exports.ItemLottery.CANDIDATE_COUNT, pool)
    self:setPendingLottery(playerId, candidates, pool)
    print((("[ItemLottery] triggered for player " .. tostring(playerId)) .. ", pool=") .. pool)
end
function ItemLottery.prototype.onTriggeredPrepared(self, opener, candidates, pool, openId)
    if pool == nil then
        pool = ItemLotteryPool.DEFAULT
    end
    if not PlayerHelper:IsHumanPlayer(opener) then
        print("[ItemLottery] prepared trigger ignored, opener is not human")
        return
    end
    local playerId = opener:GetPlayerOwnerID()
    if playerId < 0 then
        print("[ItemLottery] prepared trigger ignored, invalid player id")
        return
    end
    self:setPendingLottery(playerId, candidates, pool, openId)
    print((((("[ItemLottery] prepared trigger for player " .. tostring(playerId)) .. ", pool=") .. pool) .. ", openId=") .. (openId or "local"))
end
function ItemLottery.prototype.setPendingLottery(self, playerId, candidates, pool, openId)
    local sanitizedCandidates = AbilityReplaceItemLimit:sanitizeTreasureCandidates(playerId, candidates, pool)
    self.pendingByPlayer[tostring(playerId)] = {
        candidates = sanitizedCandidates,
        isRefreshed = false,
        isClaiming = false,
        poolType = pool,
        openId = openId
    }
    CustomNetTables:SetTableValue(
        "lottery_item",
        tostring(playerId),
        {candidates = sanitizedCandidates, isRefreshed = false, poolType = pool, openId = openId}
    )
end
function ItemLottery.prototype.pickItem(self, playerId, event)
    local playerKey = tostring(playerId)
    local pending = self.pendingByPlayer[playerKey]
    if not pending or #pending.candidates == 0 then
        print("[ItemLottery] no pending lottery for player " .. tostring(playerId))
        return
    end
    if pending.isClaiming then
        print("[ItemLottery] pick ignored, claim already locked for player " .. tostring(playerId))
        return
    end
    local matched = __TS__ArrayFind(
        pending.candidates,
        function(____, c) return c.name == event.name and c.level == event.level end
    )
    if not matched then
        print((("[ItemLottery] candidate not found for player " .. tostring(playerId)) .. ": ") .. event.name)
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero then
        print("[ItemLottery] hero not found for player " .. tostring(playerId))
        return
    end
    pending.isClaiming = true
    CustomNetTables:SetTableValue(
        "lottery_item",
        tostring(playerId),
        {
            candidates = pending.candidates,
            isRefreshed = pending.isRefreshed,
            isClaiming = true,
            poolType = pending.poolType,
            openId = pending.openId
        }
    )
    local function finishGrant()
        local item = CreateItem(
            matched.name,
            hero:GetPlayerOwner(),
            hero
        )
        if item == nil then
            print((("[ItemLottery] failed to create claimed item for player " .. tostring(playerId)) .. ": ") .. matched.name)
            pending.isClaiming = false
            CustomNetTables:SetTableValue(
                "lottery_item",
                tostring(playerId),
                {
                    candidates = pending.candidates,
                    isRefreshed = pending.isRefreshed,
                    isClaiming = false,
                    poolType = pending.poolType,
                    openId = pending.openId
                }
            )
            return
        end
        item:SetPurchaser(hero)
        item:SetOwner(hero)
        if self:isPermanentGrowthItem(matched.name) then
            self:applyPermanentGrowthItem(matched.name, item, hero)
        else
            hero:AddItem(item)
            SkillTomeAuthorization:authorizeHeroItem(hero, item, matched.name)
            self:initializeGrantedItem(item, hero, matched.name)
            if matched.name == AbilityReplaceItemLimit.ITEM_NAME then
                AbilityReplaceItemLimit:markTreasureGranted(playerId)
            end
        end
        print((("[ItemLottery] player " .. tostring(playerId)) .. " picked ") .. matched.name)
        self.pendingByPlayer[playerKey] = nil
        CustomNetTables:SetTableValue(
            "lottery_item",
            tostring(playerId),
            {candidates = {}, isRefreshed = false, poolType = ItemLotteryPool.DEFAULT}
        )
    end
    local openId = pending.openId
    if not openId or openId == "" then
        finishGrant(nil)
        return
    end
    local steamId = PlayerResource:GetSteamAccountID(playerId)
    ApiClient:sendWithRetry({
        method = HttpMethod.POST,
        hostOverride = TREASURE_BACKEND_HOST,
        path = "/game/treasure/claim",
        body = {steamId = steamId, openId = openId, selectedRewardCode = matched.name, autoSelected = event.autoSelected == true or event.autoSelected == 1},
        successFunc = function(____, body)
            print((((("[ItemLottery] treasure claim accepted for player " .. tostring(playerId)) .. ", reward=") .. matched.name) .. ", response=") .. body)
            finishGrant(nil)
        end,
        failureFunc = function(____, body)
            print((("[ItemLottery] treasure claim failed for player " .. tostring(playerId)) .. ": ") .. body)
            GameRules:SendCustomMessage("后端奖励校验失败，本次未发放奖励", 0, 0)
            self.pendingByPlayer[playerKey] = nil
            CustomNetTables:SetTableValue(
                "lottery_item",
                tostring(playerId),
                {candidates = {}, isRefreshed = false, poolType = ItemLotteryPool.DEFAULT}
            )
        end
    })
end
function ItemLottery.prototype.isPermanentGrowthItem(self, itemName)
    return self.permanentGrowthModifiers[itemName] ~= nil
end
function ItemLottery.prototype.applyPermanentGrowthItem(self, itemName, item, hero)
    local modifierName = self.permanentGrowthModifiers[itemName]
    if modifierName == nil then
        print("[ItemLottery] permanent growth modifier missing for " .. itemName)
        UTIL_Remove(item)
        return
    end
    if item:GetLevel() < 1 then
        item:SetLevel(1)
    end
    local bonus = item:GetSpecialValueFor("bonus")
    if bonus <= 0 then
        print("[ItemLottery] permanent growth bonus invalid for " .. itemName)
        UTIL_Remove(item)
        return
    end
    local modifier = hero:FindModifierByName(modifierName) or hero:AddNewModifier(hero, nil, modifierName, {})
    if modifier ~= nil and not modifier:IsNull() then
        modifier:SetStackCount(modifier:GetStackCount() + bonus)
        modifier:ForceRefresh()
        hero:CalculateStatBonus(true)
        EmitSoundOnClient("Item.TomeOfKnowledge", hero)
        print((("[ItemLottery] player consumed permanent growth " .. itemName) .. " bonus ") .. tostring(bonus))
    end
    if not item:IsNull() then
        UTIL_Remove(item)
    end
end
function ItemLottery.prototype.initializeGrantedItem(self, item, hero, itemName)
    if itemName ~= "item_skill_learning" then
        return
    end
    local skillLearningItem = item
    if skillLearningItem:GetStoredAbility() then
        return
    end
    local randomAbility = skillLearningItem:GetRandomLotteryAbility(hero)
    skillLearningItem:SetStoredAbility({ability_name = randomAbility.name, ability_level = randomAbility.level or 1})
    print("[SkillLearning] Granted from item lottery, stored ability: " .. randomAbility.name)
end
function ItemLottery.prototype.refreshItem(self, playerId)
    local playerKey = tostring(playerId)
    local pending = self.pendingByPlayer[playerKey]
    if not pending then
        print("[ItemLottery] refresh denied, no pending lottery, player " .. tostring(playerId))
        return
    end
    if pending.isClaiming then
        print("[ItemLottery] refresh denied, claim already locked, player " .. tostring(playerId))
        return
    end
    local steamAccountID = PlayerResource:GetSteamAccountID(playerId)
    if Player:GetMemberLevel(steamAccountID) < MemberLevel.PREMIUM then
        print("[ItemLottery] refresh denied, not PREMIUM, player " .. tostring(playerId))
        return
    end
    if pending.isRefreshed then
        print("[ItemLottery] refresh denied, already refreshed, player " .. tostring(playerId))
        return
    end
    if #pending.candidates == 0 then
        print("[ItemLottery] refresh denied, already picked or empty, player " .. tostring(playerId))
        return
    end
    local pool = pending.poolType or ItemLotteryPool.DEFAULT
    local excludedNames = AbilityReplaceItemLimit:hasTreasureGrant(playerId) and __TS__New(Set, {AbilityReplaceItemLimit.ITEM_NAME}) or nil
    local candidates = ItemLotteryHelper:getRandomItems(____exports.ItemLottery.CANDIDATE_COUNT, pool, excludedNames)
    self.pendingByPlayer[playerKey] = {candidates = candidates, isRefreshed = true, isClaiming = false, poolType = pool}
    CustomNetTables:SetTableValue(
        "lottery_item",
        tostring(playerId),
        {candidates = candidates, isRefreshed = true, poolType = pool}
    )
    print("[ItemLottery] refreshed for player " .. tostring(playerId))
end
ItemLottery.CANDIDATE_COUNT = 4
ItemLottery = __TS__DecorateLegacy({reloadable}, ItemLottery)
____exports.ItemLottery = ItemLottery
return ____exports
