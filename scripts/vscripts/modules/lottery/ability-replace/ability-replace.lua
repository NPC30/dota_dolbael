local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/ability-replace/ability-replace.lua"
__TS__SourceMapTraceBack("modules/lottery/ability-replace/ability-replace.lua", {["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 10,["24"] = 11,["25"] = 11,["26"] = 12,["27"] = 12,["28"] = 13,["29"] = 13,["30"] = 30,["31"] = 31,["32"] = 30,["34"] = 36,["35"] = 37,["36"] = 40,["37"] = 40,["38"] = 40,["39"] = 40,["40"] = 40,["41"] = 40,["42"] = 40,["43"] = 40,["44"] = 40,["45"] = 40,["46"] = 40,["47"] = 55,["48"] = 58,["49"] = 58,["50"] = 58,["51"] = 59,["52"] = 58,["53"] = 58,["54"] = 61,["55"] = 61,["56"] = 61,["57"] = 62,["58"] = 61,["59"] = 61,["60"] = 64,["61"] = 64,["62"] = 64,["63"] = 65,["64"] = 64,["65"] = 64,["66"] = 67,["67"] = 67,["68"] = 67,["69"] = 68,["70"] = 67,["71"] = 67,["72"] = 57,["73"] = 72,["74"] = 73,["75"] = 72,["76"] = 76,["77"] = 77,["78"] = 76,["79"] = 80,["80"] = 85,["81"] = 80,["82"] = 88,["83"] = 94,["84"] = 95,["85"] = 96,["86"] = 97,["88"] = 100,["89"] = 101,["90"] = 102,["91"] = 103,["93"] = 106,["94"] = 107,["95"] = 108,["96"] = 110,["97"] = 117,["98"] = 118,["100"] = 120,["102"] = 124,["103"] = 125,["104"] = 126,["105"] = 127,["107"] = 130,["108"] = 130,["109"] = 130,["110"] = 130,["111"] = 130,["112"] = 130,["113"] = 130,["114"] = 130,["115"] = 130,["116"] = 130,["117"] = 130,["118"] = 130,["119"] = 142,["120"] = 143,["121"] = 88,["122"] = 146,["123"] = 150,["125"] = 151,["126"] = 151,["128"] = 152,["129"] = 153,["130"] = 153,["132"] = 154,["133"] = 155,["134"] = 156,["135"] = 157,["136"] = 161,["137"] = 162,["139"] = 170,["140"] = 170,["141"] = 170,["142"] = 170,["143"] = 170,["144"] = 170,["145"] = 170,["146"] = 170,["149"] = 151,["152"] = 179,["153"] = 179,["154"] = 179,["155"] = 179,["156"] = 182,["158"] = 183,["159"] = 187,["160"] = 188,["162"] = 190,["163"] = 190,["164"] = 190,["165"] = 190,["166"] = 191,["170"] = 199,["171"] = 146,["172"] = 202,["173"] = 203,["174"] = 204,["177"] = 205,["180"] = 209,["181"] = 209,["182"] = 209,["183"] = 209,["184"] = 210,["185"] = 211,["188"] = 215,["189"] = 216,["190"] = 217,["191"] = 218,["194"] = 222,["195"] = 223,["198"] = 226,["199"] = 227,["202"] = 231,["203"] = 232,["204"] = 233,["205"] = 234,["206"] = 235,["207"] = 202,["208"] = 238,["209"] = 243,["210"] = 244,["213"] = 248,["214"] = 249,["215"] = 250,["218"] = 254,["219"] = 255,["222"] = 263,["223"] = 264,["224"] = 266,["225"] = 267,["226"] = 268,["227"] = 269,["228"] = 270,["229"] = 271,["231"] = 274,["232"] = 275,["233"] = 238,["234"] = 278,["235"] = 279,["238"] = 283,["239"] = 284,["242"] = 288,["243"] = 289,["244"] = 290,["246"] = 278,["247"] = 294,["248"] = 299,["249"] = 300,["252"] = 304,["253"] = 305,["254"] = 307,["255"] = 313,["258"] = 317,["259"] = 318,["262"] = 326,["263"] = 327,["264"] = 329,["265"] = 330,["266"] = 331,["267"] = 336,["268"] = 337,["271"] = 341,["272"] = 342,["273"] = 343,["274"] = 344,["275"] = 345,["276"] = 347,["277"] = 348,["278"] = 349,["279"] = 350,["280"] = 351,["282"] = 353,["283"] = 354,["284"] = 355,["287"] = 359,["288"] = 360,["289"] = 361,["290"] = 362,["293"] = 365,["294"] = 366,["295"] = 366,["296"] = 366,["297"] = 366,["298"] = 366,["299"] = 366,["300"] = 372,["301"] = 373,["302"] = 374,["303"] = 294,["304"] = 377,["305"] = 378,["308"] = 381,["309"] = 382,["312"] = 385,["313"] = 377,["314"] = 388,["315"] = 389,["316"] = 391,["319"] = 400,["320"] = 401,["323"] = 403,["324"] = 408,["325"] = 409,["326"] = 410,["327"] = 388,["328"] = 413,["329"] = 417,["330"] = 419,["333"] = 427,["334"] = 427,["335"] = 427,["336"] = 427,["337"] = 430,["338"] = 431,["341"] = 435,["342"] = 436,["345"] = 438,["346"] = 439,["347"] = 440,["348"] = 441,["349"] = 442,["352"] = 446,["353"] = 447,["356"] = 451,["357"] = 452,["360"] = 460,["361"] = 461,["362"] = 463,["363"] = 464,["364"] = 465,["365"] = 466,["366"] = 467,["367"] = 468,["369"] = 470,["370"] = 472,["371"] = 473,["372"] = 474,["373"] = 475,["376"] = 478,["377"] = 479,["378"] = 480,["379"] = 481,["380"] = 413,["381"] = 484,["382"] = 489,["383"] = 490,["384"] = 492,["385"] = 493,["386"] = 500,["387"] = 501,["388"] = 502,["389"] = 502,["390"] = 503,["391"] = 503,["392"] = 503,["393"] = 503,["394"] = 503,["395"] = 503,["396"] = 502,["397"] = 502,["399"] = 513,["400"] = 513,["401"] = 513,["402"] = 513,["403"] = 484,["404"] = 516,["405"] = 517,["406"] = 518,["407"] = 523,["408"] = 524,["409"] = 525,["410"] = 525,["411"] = 525,["412"] = 525,["413"] = 525,["414"] = 525,["415"] = 525,["418"] = 529,["419"] = 529,["420"] = 530,["422"] = 532,["423"] = 516,["424"] = 535,["425"] = 540,["426"] = 541,["427"] = 541,["429"] = 542,["430"] = 542,["432"] = 543,["433"] = 543,["434"] = 543,["435"] = 543,["436"] = 543,["437"] = 543,["438"] = 543,["439"] = 543,["440"] = 535,["441"] = 553,["442"] = 554,["443"] = 555,["444"] = 556,["445"] = 561,["446"] = 561,["447"] = 561,["448"] = 561,["449"] = 561,["450"] = 562,["453"] = 565,["454"] = 553,["455"] = 568,["456"] = 569,["457"] = 572,["458"] = 572,["459"] = 572,["461"] = 572,["463"] = 572,["464"] = 568,["465"] = 575,["466"] = 576,["467"] = 577,["470"] = 581,["471"] = 582,["472"] = 583,["474"] = 585,["475"] = 586,["476"] = 587,["477"] = 588,["478"] = 589,["482"] = 593,["483"] = 595,["484"] = 596,["487"] = 599,["488"] = 575,["489"] = 613,["490"] = 614,["491"] = 615,["492"] = 615,["494"] = 617,["495"] = 618,["496"] = 619,["499"] = 620,["500"] = 621,["503"] = 622,["504"] = 623,["505"] = 624,["509"] = 618,["510"] = 629,["511"] = 613,["512"] = 632,["513"] = 633,["516"] = 634,["517"] = 635,["518"] = 636,["520"] = 632,["521"] = 640,["522"] = 645,["523"] = 646,["524"] = 648,["525"] = 650,["527"] = 640,["528"] = 654,["529"] = 655,["530"] = 656,["531"] = 657,["532"] = 657,["533"] = 657,["534"] = 657,["535"] = 657,["536"] = 657,["537"] = 657,["538"] = 657,["539"] = 657,["540"] = 657,["541"] = 657,["542"] = 657,["543"] = 657,["546"] = 669,["547"] = 670,["548"] = 670,["549"] = 670,["550"] = 670,["551"] = 670,["552"] = 670,["553"] = 670,["554"] = 670,["555"] = 670,["556"] = 670,["557"] = 670,["558"] = 670,["559"] = 670,["560"] = 670,["561"] = 670,["562"] = 670,["563"] = 654,["564"] = 684,["565"] = 685,["566"] = 686,["567"] = 687,["568"] = 688,["570"] = 691,["571"] = 692,["572"] = 684,["573"] = 695,["574"] = 696,["575"] = 697,["576"] = 695,["577"] = 32,["578"] = 33,["579"] = 34,["580"] = 30,["581"] = 31,["582"] = 711,["583"] = 712,["584"] = 711,["585"] = 715,["586"] = 716,["587"] = 715,["588"] = 719,["589"] = 724,["590"] = 719});
local ____exports = {}
local ____player = require("api.player")
local MemberLevel = ____player.MemberLevel
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____net_2Dtable_2Dhelper = require("modules.helper.net-table-helper")
local NetTableHelper = ____net_2Dtable_2Dhelper.NetTableHelper
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____lottery_2Dabilities = require("modules.lottery.lottery-abilities")
local abilityTiersActive = ____lottery_2Dabilities.abilityTiersActive
local abilityTiersPassive = ____lottery_2Dabilities.abilityTiersPassive
local ____lottery_2Dability_2Dgrant_2Dhelper = require("modules.lottery.lottery-ability-grant-helper")
local LotteryAbilityGrantHelper = ____lottery_2Dability_2Dgrant_2Dhelper.LotteryAbilityGrantHelper
local ____lottery_2Dhelper = require("modules.lottery.lottery-helper")
local LotteryHelper = ____lottery_2Dhelper.LotteryHelper
local ____ability_2Dreplace_2Dhelper = require("modules.lottery.ability-replace.ability-replace-helper")
local AbilityReplaceHelper = ____ability_2Dreplace_2Dhelper.AbilityReplaceHelper
____exports.AbilityReplace = __TS__Class()
local AbilityReplace = ____exports.AbilityReplace
AbilityReplace.name = "AbilityReplace"
function AbilityReplace.prototype.____constructor(self)
    self.pendingByPlayer = {}
    self.transferBoundKeysByPlayer = {}
    self.dangerousAbilities = {
        doom_bringer_doom = {"modifier_doom_bringer_doom_aura_self", "modifier_doom_bringer_doom_aura"},
        pangolier_gyroshell = {"modifier_pangolier_gyroshell"},
        juggernaut_omni_slash = {"modifier_juggernaut_omnislash"},
        faceless_void_chronosphere = {"modifier_faceless_void_chronosphere", "modifier_faceless_void_chronosphere_self"},
        bane_nightmare = {"modifier_bane_nightmare"},
        shadow_shaman_shackles = {"modifier_shadow_shaman_shackles"},
        brewmaster_primal_split_lua = {"modifier_brewmaster_primal_split_lua"},
        dragon_knight_elder_dragon_form = {"modifier_dragon_knight_elder_dragon_form"},
        muerta_pierce_the_veil = {"modifier_muerta_pierce_the_veil_buff"}
    }
    self.abyssBlockedLotteryAbilities = {"enigma_black_hole"}
    CustomGameEventManager:RegisterListener(
        "ability_replace_select_removed",
        function(_userId, event)
            self:selectRemovedAbility(event.PlayerID, event.abilityName)
        end
    )
    CustomGameEventManager:RegisterListener(
        "ability_replace_pick_new",
        function(_userId, event)
            self:pickNewAbility(event.PlayerID, event)
        end
    )
    CustomGameEventManager:RegisterListener(
        "ability_replace_refresh",
        function(_userId, event)
            self:refreshCandidates(event.PlayerID)
        end
    )
    CustomGameEventManager:RegisterListener(
        "ability_replace_close",
        function(_userId, event)
            self:clearSession(event.PlayerID)
        end
    )
end
function AbilityReplace.prototype.InitAbilityReplace(self, playerId)
    return self:initSession(playerId, "replace")
end
function AbilityReplace.prototype.InitSkillReset(self, playerId, itemEntIndex)
    return self:initSession(playerId, "skillReset", itemEntIndex)
end
function AbilityReplace.prototype.InitSkillTransfer(self, playerId, targetEntIndex, itemEntIndex)
    return self:initSession(playerId, "skillTransfer", itemEntIndex, targetEntIndex)
end
function AbilityReplace.prototype.initSession(self, playerId, mode, itemEntIndex, targetEntIndex)
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not PlayerHelper:IsHumanPlayer(hero) then
        print("[AbilityReplace] init denied, hero is not human")
        return false
    end
    local playerKey = tostring(playerId)
    if self.pendingByPlayer[playerKey] then
        print("[AbilityReplace] init denied, session already pending")
        return false
    end
    local targetPlayerName
    if mode == "skillTransfer" then
        local target = EntIndexToHScript(targetEntIndex)
        if not target or target:IsNull() or not target:IsRealHero() or target:GetTeamNumber() ~= hero:GetTeamNumber() or target:GetPlayerOwnerID() < 0 or target == hero then
            print("[AbilityReplace] init denied, invalid transfer target")
            return false
        end
        targetPlayerName = PlayerResource:GetPlayerName(target:GetPlayerOwnerID()) or target:GetUnitName()
    end
    local removableAbilities = self:getRemovableAbilities(hero, playerId)
    if #removableAbilities == 0 then
        print("[AbilityReplace] init denied, no removable abilities")
        return false
    end
    self.pendingByPlayer[playerKey] = {
        mode = mode,
        removableAbilities = removableAbilities,
        candidates = {},
        isRefreshed = false,
        isClaiming = false,
        currentRefreshCount = 0,
        maxRefreshCount = mode == "replace" and self:getMaxRefreshCount(playerId) or 0,
        itemEntIndex = itemEntIndex,
        targetEntIndex = targetEntIndex,
        targetPlayerName = targetPlayerName
    }
    self:publish(playerId)
    return true
end
function AbilityReplace.prototype.getRemovableAbilities(self, hero, playerId)
    local abilities = {}
    do
        local i = 0
        while i < hero:GetAbilityCount() do
            do
                local ability = hero:GetAbilityByIndex(i)
                if not ability then
                    goto __continue17
                end
                local abilityName = ability:GetAbilityName()
                local runtimeInnate = self:isInnateAbility(ability)
                local kvInnate = AbilityReplaceHelper:GetInnateKVValue(abilityName)
                local debugShouldLog = runtimeInnate or AbilityReplaceHelper:IsInnateKVValue(kvInnate) or abilityName == "lion_to_hell_and_back"
                if debugShouldLog then
                    print((((((((((("[AbilityReplace][InnateDebug][Scan] name=" .. abilityName) .. " hidden=") .. tostring(ability:IsHidden())) .. " item=") .. tostring(ability:IsItem())) .. " runtimeInnate=") .. tostring(runtimeInnate)) .. " kvInnate=") .. tostring(kvInnate)) .. " behavior=") .. tostring(ability:GetBehavior()))
                end
                abilities[#abilities + 1] = {
                    name = abilityName,
                    level = ability:GetLevel(),
                    behavior = ability:GetBehavior(),
                    isHidden = ability:IsHidden(),
                    isItem = ability:IsItem(),
                    isInnate = runtimeInnate
                }
            end
            ::__continue17::
            i = i + 1
        end
    end
    local removableAbilities = __TS__ArrayFilter(
        AbilityReplaceHelper:getRemovableAbilities(abilities),
        function(____, ability) return not self:isAwakeningBundleAbility(playerId, ability.name) end
    )
    for ____, ability in ipairs(abilities) do
        do
            local debugShouldLog = ability.isInnate == true or AbilityReplaceHelper:IsInnateKVValue(AbilityReplaceHelper:GetInnateKVValue(ability.name)) or ability.name == "lion_to_hell_and_back"
            if not debugShouldLog then
                goto __continue21
            end
            local included = __TS__ArraySome(
                removableAbilities,
                function(____, item) return item.name == ability.name end
            )
            print((((((((((("[AbilityReplace][InnateDebug][Result] name=" .. ability.name) .. " removable=") .. tostring(included)) .. " hidden=") .. tostring(ability.isHidden)) .. " item=") .. tostring(ability.isItem)) .. " runtimeInnate=") .. tostring(ability.isInnate == true)) .. " kvInnate=") .. tostring(AbilityReplaceHelper:GetInnateKVValue(ability.name)))
        end
        ::__continue21::
    end
    return removableAbilities
end
function AbilityReplace.prototype.selectRemovedAbility(self, playerId, abilityName)
    local pending = self.pendingByPlayer[tostring(playerId)]
    if not pending or pending.isClaiming then
        return
    end
    if pending.selectedRemovedAbilityName then
        return
    end
    local selected = __TS__ArrayFind(
        pending.removableAbilities,
        function(____, ability) return ability.name == abilityName end
    )
    if not selected then
        print("[AbilityReplace] selected ability not removable: " .. abilityName)
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero or not self:isAbilityStillEligible(hero, selected.name, playerId) then
        print("[AbilityReplace] selected ability no longer eligible: " .. abilityName)
        self:clearSession(playerId)
        return
    end
    if pending.mode == "skillReset" then
        self:resetSelectedAbility(playerId, hero, selected.name)
        return
    end
    if pending.mode == "skillTransfer" then
        self:transferSelectedAbility(playerId, hero, selected.name)
        return
    end
    pending.selectedRemovedAbilityName = selected.name
    pending.selectedRemovedAbilityType = selected.type
    pending.candidates = self:generateCandidates(playerId, hero, selected)
    pending.isRefreshed = pending.currentRefreshCount >= pending.maxRefreshCount
    self:publish(playerId)
end
function AbilityReplace.prototype.resetSelectedAbility(self, playerId, hero, abilityName)
    local pending = self.pendingByPlayer[tostring(playerId)]
    if not pending then
        return
    end
    local ability = hero:FindAbilityByName(abilityName)
    if not ability or not self:isAbilityStillEligible(hero, abilityName, playerId) then
        self:clearSession(playerId)
        return
    end
    if self:hasBlockingDangerousModifier(abilityName) then
        GameRules:SendCustomMessage("<font color='#FF0000'>技能使用中无法遗忘，稍后再试;This ability is being used, please try reset later</font>", 1, 0)
        return
    end
    pending.isClaiming = true
    self:publish(playerId)
    local oldLevel = ability:GetLevel()
    AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, abilityName)
    ability:SetLevel(0)
    AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, abilityName)
    if oldLevel > 0 then
        hero:SetAbilityPoints(hero:GetAbilityPoints() + oldLevel)
    end
    self:consumeSkillResetItem(playerId, pending.itemEntIndex)
    self:clearSession(playerId)
end
function AbilityReplace.prototype.consumeSkillResetItem(self, playerId, itemEntIndex)
    if itemEntIndex == nil then
        return
    end
    local item = EntIndexToHScript(itemEntIndex)
    if not item or item:IsNull() or item:GetAbilityName() ~= "item_skill_reset" then
        return
    end
    item:SpendCharge(1)
    if item:GetCurrentCharges() <= 0 then
        item:RemoveSelf()
    end
end
function AbilityReplace.prototype.transferSelectedAbility(self, playerId, hero, abilityName)
    local pending = self.pendingByPlayer[tostring(playerId)]
    if not pending or pending.targetEntIndex == nil then
        return
    end
    local target = EntIndexToHScript(pending.targetEntIndex)
    local ability = hero:FindAbilityByName(abilityName)
    if not target or target:IsNull() or not target:IsRealHero() or not ability or not self:isAbilityStillEligible(hero, abilityName, playerId) then
        self:clearSession(playerId)
        return
    end
    if self:hasBlockingDangerousModifier(abilityName) then
        GameRules:SendCustomMessage("<font color='#FF0000'>技能使用中无法移交，稍后再试;This ability is being used, please try transfer later</font>", 1, 0)
        return
    end
    pending.isClaiming = true
    self:publish(playerId)
    local targetExisting = target:FindAbilityByName(abilityName)
    if targetExisting and not targetExisting:IsHidden() then
        GameRules:SendCustomMessage("<font color='#FF0000'>目标已有该技能，无法移交;Target already has this ability</font>", 1, 0)
        pending.isClaiming = false
        self:publish(playerId)
        return
    end
    local oldLevel = ability:GetLevel()
    AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, abilityName)
    hero:RemoveAbility(abilityName)
    AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, abilityName)
    self:removeBoundCompanion(hero, abilityName)
    if targetExisting and targetExisting:IsHidden() then
        targetExisting:SetHidden(false)
        targetExisting:SetStolen(false)
        if oldLevel > targetExisting:GetLevel() then
            targetExisting:SetLevel(oldLevel)
        end
        self:bindTransferredAbilityKey(target, abilityName)
        self:consumeTransferItem(pending.itemEntIndex)
        self:clearSession(playerId)
        return
    end
    local newAbility = target:AddAbility(abilityName)
    if not newAbility then
        print("[AbilityReplace] failed to transfer ability: " .. abilityName)
        self:clearSession(playerId)
        return
    end
    newAbility:SetLevel(oldLevel > 0 and oldLevel or 1)
    LotteryAbilityGrantHelper:ApplyGrantSideEffects(
        target,
        abilityName,
        newAbility,
        target:GetPlayerOwnerID()
    )
    self:bindTransferredAbilityKey(target, abilityName)
    self:consumeTransferItem(pending.itemEntIndex)
    self:clearSession(playerId)
end
function AbilityReplace.prototype.consumeTransferItem(self, itemEntIndex)
    if itemEntIndex == nil then
        return
    end
    local item = EntIndexToHScript(itemEntIndex)
    if not item or item:IsNull() then
        return
    end
    item:RemoveSelf()
end
function AbilityReplace.prototype.refreshCandidates(self, playerId)
    local pending = self.pendingByPlayer[tostring(playerId)]
    if not pending or pending.isClaiming or pending.currentRefreshCount >= pending.maxRefreshCount or not pending.selectedRemovedAbilityName or not pending.selectedRemovedAbilityType then
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero then
        return
    end
    pending.candidates = self:generateCandidates(playerId, hero, {name = pending.selectedRemovedAbilityName, level = 0, type = pending.selectedRemovedAbilityType})
    pending.currentRefreshCount = pending.currentRefreshCount + 1
    pending.isRefreshed = pending.currentRefreshCount >= pending.maxRefreshCount
    self:publish(playerId)
end
function AbilityReplace.prototype.pickNewAbility(self, playerId, event)
    local pending = self.pendingByPlayer[tostring(playerId)]
    if not pending or pending.isClaiming or not pending.selectedRemovedAbilityName or not pending.selectedRemovedAbilityType then
        return
    end
    local candidate = __TS__ArrayFind(
        pending.candidates,
        function(____, item) return item.name == event.name and item.level == event.level end
    )
    if not candidate then
        print("[AbilityReplace] candidate not found: " .. event.name)
        return
    end
    local hero = PlayerResource:GetSelectedHeroEntity(playerId)
    if not hero then
        return
    end
    local oldAbilityName = pending.selectedRemovedAbilityName
    local oldAbility = hero:FindAbilityByName(oldAbilityName)
    if not oldAbility or not self:isAbilityStillEligible(hero, oldAbilityName, playerId) then
        print("[AbilityReplace] old ability no longer eligible: " .. oldAbilityName)
        self:clearSession(playerId)
        return
    end
    if hero:FindAbilityByName(candidate.name) then
        print("[AbilityReplace] duplicate candidate denied: " .. candidate.name)
        return
    end
    if self:hasBlockingDangerousModifier(oldAbilityName) then
        GameRules:SendCustomMessage("<font color='#FF0000'>技能使用中无法替换，稍后再试;This ability is being used, please try replace later</font>", 1, 0)
        return
    end
    pending.isClaiming = true
    self:publish(playerId)
    local oldLevel = oldAbility:GetLevel()
    AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, oldAbilityName)
    hero:RemoveAbility(oldAbilityName)
    AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, oldAbilityName)
    if oldLevel > 0 then
        hero:SetAbilityPoints(hero:GetAbilityPoints() + oldLevel)
    end
    self:removeBoundCompanion(hero, oldAbilityName)
    local newAbility = hero:AddAbility(candidate.name)
    if not newAbility then
        print("[AbilityReplace] failed to add ability: " .. candidate.name)
        self:clearSession(playerId)
        return
    end
    newAbility:SetLevel(candidate.level)
    LotteryAbilityGrantHelper:ApplyGrantSideEffects(hero, candidate.name, newAbility, playerId)
    self:syncLotteryStatus(playerId, oldAbilityName, candidate)
    self:clearSession(playerId)
end
function AbilityReplace.prototype.generateCandidates(self, playerId, hero, removedAbility)
    local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
    local tiers = removedAbility.type == "abilityActive" and abilityTiersActive or abilityTiersPassive
    local excludedNames = self:getExcludedNames(steamAccountID, removedAbility.name)
    local candidates = LotteryHelper:getRandomAbilities(tiers, ____exports.AbilityReplace.BASE_CANDIDATE_COUNT, hero, excludedNames)
    local member = NetTableHelper:GetMember(steamAccountID)
    if member.enable and member.level >= MemberLevel.PREMIUM then
        __TS__ArrayPushArray(
            candidates,
            LotteryHelper:getRandomAbilities(
                tiers,
                ____exports.AbilityReplace.PREMIUM_CANDIDATE_COUNT,
                hero,
                excludedNames,
                true
            )
        )
    end
    return __TS__ArrayFilter(
        candidates,
        function(____, candidate) return candidate.name ~= removedAbility.name end
    )
end
function AbilityReplace.prototype.getExcludedNames(self, steamAccountID, removedAbilityName)
    local excludedNames = {removedAbilityName}
    for ____, tableName in ipairs({"lottery_active_abilities", "lottery_passive_abilities", "lottery_passive_abilities_2"}) do
        local raw = CustomNetTables:GetTableValue(tableName, steamAccountID)
        if raw ~= nil then
            __TS__ArrayPushArray(
                excludedNames,
                __TS__ArrayMap(
                    __TS__ObjectValues(raw),
                    function(____, item) return item.name end
                )
            )
        end
    end
    local ____opt_0 = GameRules.Option
    if (____opt_0 and ____opt_0.abyssMode) == true then
        __TS__ArrayPushArray(excludedNames, self.abyssBlockedLotteryAbilities)
    end
    return excludedNames
end
function AbilityReplace.prototype.isAbilityStillEligible(self, hero, abilityName, playerId)
    local ability = hero:FindAbilityByName(abilityName)
    if not ability then
        return false
    end
    if self:isAwakeningBundleAbility(playerId, abilityName) then
        return false
    end
    return AbilityReplaceHelper:isEligibleAbility({
        name = ability:GetAbilityName(),
        level = ability:GetLevel(),
        behavior = ability:GetBehavior(),
        isHidden = ability:IsHidden(),
        isItem = ability:IsItem(),
        isInnate = self:isInnateAbility(ability)
    })
end
function AbilityReplace.prototype.isAwakeningBundleAbility(self, playerId, abilityName)
    local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
    local status = NetTableHelper:GetLotteryStatus(steamAccountID)
    for ____, bundle in ipairs({status.activeAbilityBundle, status.passiveAbilityBundle, status.passiveAbilityBundle2}) do
        local ____opt_2 = bundle
        if ____opt_2 and __TS__ArraySome(
            bundle and bundle.grantedAbilities,
            function(____, granted) return granted.abilityName == abilityName end
        ) then
            return true
        end
    end
    return false
end
function AbilityReplace.prototype.isInnateAbility(self, ability)
    local abilityAny = ability
    local ____temp_6
    if type(abilityAny.IsInnateAbility) == "function" then
        ____temp_6 = abilityAny:IsInnateAbility()
    else
        ____temp_6 = false
    end
    return ____temp_6
end
function AbilityReplace.prototype.bindTransferredAbilityKey(self, target, abilityName)
    local playerId = target:GetPlayerOwnerID()
    if playerId < 0 then
        return
    end
    local playerKey = tostring(playerId)
    if not self.transferBoundKeysByPlayer[playerKey] then
        self.transferBoundKeysByPlayer[playerKey] = {}
    end
    local usedKeys = self.transferBoundKeysByPlayer[playerKey]
    local nextKey = ____exports.AbilityReplace.TRANSFER_HOTKEYS[1]
    for ____, key in ipairs(____exports.AbilityReplace.TRANSFER_HOTKEYS) do
        if not usedKeys[key] then
            nextKey = key
            break
        end
    end
    usedKeys[nextKey] = abilityName
    local player = PlayerResource:GetPlayer(playerId)
    if not player then
        return
    end
    CustomGameEventManager:Send_ServerToPlayer(player, "bind_ability_to_key", {ability_name = abilityName, key = nextKey})
end
function AbilityReplace.prototype.hasBlockingDangerousModifier(self, abilityName)
    local modifiers = self.dangerousAbilities[abilityName]
    if not modifiers or #modifiers == 0 then
        return false
    end
    local hasActiveModifier = false
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if hasActiveModifier then
            return
        end
        local hero = PlayerResource:GetSelectedHeroEntity(playerId)
        if not hero then
            return
        end
        for ____, modifier in ipairs(modifiers) do
            if hero:HasModifier(modifier) then
                hasActiveModifier = true
                return
            end
        end
    end)
    return hasActiveModifier
end
function AbilityReplace.prototype.removeBoundCompanion(self, hero, abilityName)
    if abilityName ~= "death_prophet_witchcraft2" then
        return
    end
    local companion = hero:FindAbilityByName("death_prophet_witchcraft")
    if companion then
        hero:RemoveAbility("death_prophet_witchcraft")
    end
end
function AbilityReplace.prototype.syncLotteryStatus(self, playerId, oldAbilityName, newAbility)
    local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
    local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
    if AbilityReplaceHelper:replaceLotteryStatusAbility(lotteryStatus, oldAbilityName, newAbility) then
        CustomNetTables:SetTableValue("lottery_status", steamAccountID, lotteryStatus)
    end
end
function AbilityReplace.prototype.publish(self, playerId)
    local pending = self.pendingByPlayer[tostring(playerId)]
    if not pending then
        CustomNetTables:SetTableValue(
            "ability_replace",
            tostring(playerId),
            {
                mode = "replace",
                removableAbilities = {},
                candidates = {},
                targetPlayerName = nil,
                isRefreshed = false,
                currentRefreshCount = 0,
                maxRefreshCount = 0
            }
        )
        return
    end
    local isRefreshed = pending.currentRefreshCount >= pending.maxRefreshCount
    CustomNetTables:SetTableValue(
        "ability_replace",
        tostring(playerId),
        {
            mode = pending.mode,
            removableAbilities = pending.removableAbilities,
            candidates = pending.candidates,
            selectedRemovedAbilityName = pending.selectedRemovedAbilityName,
            selectedRemovedAbilityType = pending.selectedRemovedAbilityType,
            targetPlayerName = pending.targetPlayerName,
            isRefreshed = isRefreshed,
            currentRefreshCount = pending.currentRefreshCount,
            maxRefreshCount = pending.maxRefreshCount,
            isClaiming = pending.isClaiming
        }
    )
end
function AbilityReplace.prototype.getMaxRefreshCount(self, playerId)
    local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
    local lotteryStatus = NetTableHelper:GetLotteryStatus(steamAccountID)
    if lotteryStatus.maxRefreshCount ~= nil then
        return lotteryStatus.maxRefreshCount
    end
    local member = NetTableHelper:GetMember(steamAccountID)
    return GameRules.Lottery:getMaxRefreshCount(steamAccountID, member.enable)
end
function AbilityReplace.prototype.clearSession(self, playerId)
    self.pendingByPlayer[tostring(playerId)] = nil
    self:publish(playerId)
end
AbilityReplace.BASE_CANDIDATE_COUNT = 6
AbilityReplace.PREMIUM_CANDIDATE_COUNT = 2
AbilityReplace.TRANSFER_HOTKEYS = {"5", "6", "7", "8"}
AbilityReplace = __TS__DecorateLegacy({reloadable}, AbilityReplace)
____exports.AbilityReplace = AbilityReplace
_G.InitAbilityReplace = function(____, playerId)
    return GameRules.Lottery.AbilityReplace:InitAbilityReplace(playerId)
end
_G.InitSkillReset = function(____, playerId, itemEntIndex)
    return GameRules.Lottery.AbilityReplace:InitSkillReset(playerId, itemEntIndex)
end
_G.InitSkillTransfer = function(____, playerId, targetEntIndex, itemEntIndex)
    return GameRules.Lottery.AbilityReplace:InitSkillTransfer(playerId, targetEntIndex, itemEntIndex)
end
return ____exports
