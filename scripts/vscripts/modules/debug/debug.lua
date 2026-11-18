local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__Number = ____lualib.__TS__Number
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/debug/Debug.lua"
__TS__SourceMapTraceBack("modules/debug/Debug.lua", {["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 2,["16"] = 3,["17"] = 3,["18"] = 4,["19"] = 4,["20"] = 5,["21"] = 5,["22"] = 6,["23"] = 6,["24"] = 8,["25"] = 9,["26"] = 8,["28"] = 10,["29"] = 12,["30"] = 21,["31"] = 22,["32"] = 22,["33"] = 22,["34"] = 22,["35"] = 22,["36"] = 19,["37"] = 25,["38"] = 26,["39"] = 27,["40"] = 28,["42"] = 30,["43"] = 25,["44"] = 33,["45"] = 34,["46"] = 36,["49"] = 40,["50"] = 41,["51"] = 42,["52"] = 44,["53"] = 45,["55"] = 50,["58"] = 53,["59"] = 54,["60"] = 55,["63"] = 56,["64"] = 57,["66"] = 59,["67"] = 60,["68"] = 61,["71"] = 62,["72"] = 63,["73"] = 64,["74"] = 65,["75"] = 66,["76"] = 67,["77"] = 68,["80"] = 72,["81"] = 73,["82"] = 74,["85"] = 75,["86"] = 77,["87"] = 78,["88"] = 81,["89"] = 82,["92"] = 85,["93"] = 86,["94"] = 88,["95"] = 89,["98"] = 90,["99"] = 92,["100"] = 93,["101"] = 96,["102"] = 97,["104"] = 86,["106"] = 101,["107"] = 102,["108"] = 103,["109"] = 104,["112"] = 105,["113"] = 106,["114"] = 107,["115"] = 108,["116"] = 109,["117"] = 110,["118"] = 111,["120"] = 102,["122"] = 115,["123"] = 116,["124"] = 117,["127"] = 118,["128"] = 119,["131"] = 120,["132"] = 122,["133"] = 116,["135"] = 127,["136"] = 128,["137"] = 129,["138"] = 130,["141"] = 131,["142"] = 128,["144"] = 134,["145"] = 135,["146"] = 136,["147"] = 137,["148"] = 138,["151"] = 139,["152"] = 136,["154"] = 142,["155"] = 143,["156"] = 144,["157"] = 145,["160"] = 146,["162"] = 148,["163"] = 149,["164"] = 150,["167"] = 151,["168"] = 152,["169"] = 153,["171"] = 155,["172"] = 156,["173"] = 157,["176"] = 158,["177"] = 159,["178"] = 160,["180"] = 162,["181"] = 163,["183"] = 165,["184"] = 166,["185"] = 167,["188"] = 168,["189"] = 169,["190"] = 170,["192"] = 172,["193"] = 173,["195"] = 176,["196"] = 177,["197"] = 178,["198"] = 179,["199"] = 180,["203"] = 181,["204"] = 181,["205"] = 182,["206"] = 183,["207"] = 184,["209"] = 186,["210"] = 181,["213"] = 178,["215"] = 191,["216"] = 192,["217"] = 193,["218"] = 194,["222"] = 195,["223"] = 195,["224"] = 196,["225"] = 197,["226"] = 198,["228"] = 195,["231"] = 192,["233"] = 204,["234"] = 205,["235"] = 206,["238"] = 207,["239"] = 208,["240"] = 211,["242"] = 213,["243"] = 214,["244"] = 215,["247"] = 216,["248"] = 217,["249"] = 218,["252"] = 221,["253"] = 222,["254"] = 223,["257"] = 224,["258"] = 225,["259"] = 226,["262"] = 229,["264"] = 232,["265"] = 233,["266"] = 234,["269"] = 235,["270"] = 236,["273"] = 237,["274"] = 238,["275"] = 239,["276"] = 240,["278"] = 242,["279"] = 243,["282"] = 233,["284"] = 249,["285"] = 250,["286"] = 251,["289"] = 252,["290"] = 253,["292"] = 254,["293"] = 254,["295"] = 255,["296"] = 256,["297"] = 256,["299"] = 257,["300"] = 258,["303"] = 254,["307"] = 263,["308"] = 264,["309"] = 265,["312"] = 266,["314"] = 269,["315"] = 270,["316"] = 271,["319"] = 273,["320"] = 274,["321"] = 276,["323"] = 276,["326"] = 280,["327"] = 281,["328"] = 282,["329"] = 283,["332"] = 285,["333"] = 286,["334"] = 281,["336"] = 290,["338"] = 291,["339"] = 291,["340"] = 292,["341"] = 292,["342"] = 292,["343"] = 293,["344"] = 294,["345"] = 295,["348"] = 297,["349"] = 298,["350"] = 293,["351"] = 292,["352"] = 292,["353"] = 291,["357"] = 304,["358"] = 305,["360"] = 308,["361"] = 309,["363"] = 312,["364"] = 313,["365"] = 314,["366"] = 315,["367"] = 316,["370"] = 317,["371"] = 314,["373"] = 321,["374"] = 322,["375"] = 323,["378"] = 325,["380"] = 328,["381"] = 329,["382"] = 330,["383"] = 331,["386"] = 332,["387"] = 329,["389"] = 336,["390"] = 337,["391"] = 338,["392"] = 339,["394"] = 342,["395"] = 343,["396"] = 344,["397"] = 345,["398"] = 346,["401"] = 349,["402"] = 350,["403"] = 351,["404"] = 352,["405"] = 353,["408"] = 357,["409"] = 358,["410"] = 359,["411"] = 361,["412"] = 362,["414"] = 363,["415"] = 363,["416"] = 364,["417"] = 363,["421"] = 359,["423"] = 369,["424"] = 370,["425"] = 371,["426"] = 373,["427"] = 374,["429"] = 376,["430"] = 376,["431"] = 377,["432"] = 376,["436"] = 371,["438"] = 382,["439"] = 383,["440"] = 384,["441"] = 386,["442"] = 387,["444"] = 388,["445"] = 388,["446"] = 389,["447"] = 388,["451"] = 384,["453"] = 394,["454"] = 395,["455"] = 397,["456"] = 398,["457"] = 399,["460"] = 403,["461"] = 404,["464"] = 420,["467"] = 407,["468"] = 408,["469"] = 410,["470"] = 411,["471"] = 414,["472"] = 414,["473"] = 414,["474"] = 415,["475"] = 416,["476"] = 414,["477"] = 414,["484"] = 424,["485"] = 425,["486"] = 426,["490"] = 427,["491"] = 427,["492"] = 428,["493"] = 429,["494"] = 430,["496"] = 427,["500"] = 434,["501"] = 435,["502"] = 436,["505"] = 437,["507"] = 440,["508"] = 441,["509"] = 442,["512"] = 443,["513"] = 444,["515"] = 446,["516"] = 447,["517"] = 448,["520"] = 449,["521"] = 450,["523"] = 452,["524"] = 453,["525"] = 454,["528"] = 455,["530"] = 458,["531"] = 459,["532"] = 460,["535"] = 461,["536"] = 462,["537"] = 462,["538"] = 462,["539"] = 462,["540"] = 462,["541"] = 462,["542"] = 462,["543"] = 462,["545"] = 472,["546"] = 473,["547"] = 474,["550"] = 475,["552"] = 478,["553"] = 479,["554"] = 480,["557"] = 481,["559"] = 484,["560"] = 485,["561"] = 486,["564"] = 487,["565"] = 488,["567"] = 491,["568"] = 492,["569"] = 493,["572"] = 494,["573"] = 495,["575"] = 498,["576"] = 499,["577"] = 500,["580"] = 501,["581"] = 502,["583"] = 33,["584"] = 506,["585"] = 510,["586"] = 511,["587"] = 511,["588"] = 511,["589"] = 511,["590"] = 511,["591"] = 511,["592"] = 511,["593"] = 511,["594"] = 511,["595"] = 511,["596"] = 511,["597"] = 523,["599"] = 524,["600"] = 525,["602"] = 527,["603"] = 528,["605"] = 530,["609"] = 532,["610"] = 506,["611"] = 535,["612"] = 536,["613"] = 537,["615"] = 539,["616"] = 540,["618"] = 542,["619"] = 543,["621"] = 545,["622"] = 535,["623"] = 548,["624"] = 549,["625"] = 550,["626"] = 556,["627"] = 557,["628"] = 558,["631"] = 562,["632"] = 563,["634"] = 548,["635"] = 567,["636"] = 569,["637"] = 569,["638"] = 569,["640"] = 569,["642"] = 568,["643"] = 570,["644"] = 571,["645"] = 567,["646"] = 576,["647"] = 577,["648"] = 578,["649"] = 578,["650"] = 578,["651"] = 578,["652"] = 578,["653"] = 576,["654"] = 8,["655"] = 9});
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____game_2Dend = require("modules.event.game-end.game-end")
local GameEnd = ____game_2Dend.GameEnd
local ____modifier_2Dhelper = require("modules.helper.modifier-helper")
local ModifierHelper = ____modifier_2Dhelper.ModifierHelper
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____skill_2Dtome_2Dauthorization = require("modules.lottery.skill-tome-authorization")
local SkillTomeAuthorization = ____skill_2Dtome_2Dauthorization.SkillTomeAuthorization
local ____debug_2Dcmd = require("modules.debug.debug-cmd")
local CMD = ____debug_2Dcmd.CMD
____exports.Debug = __TS__Class()
local Debug = ____exports.Debug
Debug.name = "Debug"
function Debug.prototype.____constructor(self)
    self.DebugEnabled = false
    self.OnlineDebugWhiteList = {136407523, 916506173, 385130282, 116431158}
    self.DebugEnabled = IsInToolsMode()
    ListenToGameEvent(
        "player_chat",
        function(____, keys) return self:OnPlayerChat(keys) end,
        self
    )
end
function Debug.prototype.addDebugItem(self, hero, itemName)
    local item = hero:AddItemByName(itemName)
    if item ~= nil and item ~= nil then
        SkillTomeAuthorization:authorizeItem(item, itemName)
    end
    return item or nil
end
function Debug.prototype.OnPlayerChat(self, keys)
    local steamid = PlayerResource:GetSteamAccountID(keys.playerid)
    if not __TS__ArrayIncludes(self.OnlineDebugWhiteList, steamid) then
        return
    end
    local strs = __TS__StringSplit(keys.text, " ")
    local cmd = strs[1]
    local args = __TS__ArraySlice(strs, 1)
    if cmd == "-debug" then
        self.DebugEnabled = not self.DebugEnabled
    end
    if not self.DebugEnabled then
        return
    end
    if cmd == CMD.ADD_ABILITY then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local abilityName = args[1]
        hero:AddAbility(abilityName)
    end
    if cmd == CMD.RM_ABILITY then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local abilityName = args[1]
        local ability = hero:FindAbilityByName(abilityName)
        if ability then
            local level = ability:GetLevel()
            hero:RemoveAbility(abilityName)
            hero:SetAbilityPoints(hero:GetAbilityPoints() + level)
            self:log(((("Removed ability: " .. abilityName) .. ", returned ") .. tostring(level)) .. " points")
        end
    end
    if cmd == CMD.ADD_ABILITY_MAX then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local abilityName = args[1]
        local newAbility = hero:AddAbility(abilityName)
        if newAbility ~= nil then
            local maxLevel = newAbility:GetMaxLevel()
            newAbility:SetLevel(maxLevel)
        end
    end
    if cmd == CMD.ADD_ABILITY_ALL then
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            local abilityName = args[1]
            local newAbility = hero:AddAbility(abilityName)
            if newAbility ~= nil then
                local maxLevel = newAbility:GetMaxLevel()
                newAbility:SetLevel(maxLevel)
            end
        end)
    end
    if cmd == CMD.RM_ABILITY_ALL then
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            local abilityName = args[1]
            local ability = hero:FindAbilityByName(abilityName)
            if ability then
                local level = ability:GetLevel()
                hero:RemoveAbility(abilityName)
                hero:SetAbilityPoints(hero:GetAbilityPoints() + level)
                self:log(((("Removed ability: " .. abilityName) .. ", returned ") .. tostring(level)) .. " points")
            end
        end)
    end
    if cmd == CMD.ADD_ABILITY_HUMAN_ALL then
        PlayerHelper:ForEachPlayer(function(____, playerId)
            if not PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
                return
            end
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            local abilityName = args[1]
            hero:AddAbility(abilityName)
        end)
    end
    if cmd == CMD.ADD_BKB_ALL then
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            self:addDebugItem(hero, "item_black_king_bar_2")
        end)
    end
    if cmd == CMD.ADD_ITEM_ALL then
        local itemName = args[1]
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            self:addDebugItem(hero, itemName)
        end)
    end
    if cmd == CMD.ADD_ITEM then
        local itemName = args[1]
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        self:addDebugItem(hero, itemName)
    end
    if cmd == CMD.RM_ITEM then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local itemName = args[1]
        local item = hero:FindItemInInventory(itemName)
        UTIL_RemoveImmediate(item)
    end
    if cmd == CMD.REPLACE_NEUTRAL_ITEM then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local item = hero:GetItemInSlot(DOTA_ITEM_NEUTRAL_ACTIVE_SLOT)
        if item then
            UTIL_RemoveImmediate(item)
        end
        local itemName = args[1]
        self:addDebugItem(hero, itemName)
    end
    if cmd == CMD.REPLACE_ENHANCE_ITEM then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local item = hero:GetItemInSlot(DOTA_ITEM_NEUTRAL_PASSIVE_SLOT)
        if item then
            UTIL_RemoveImmediate(item)
        end
        local itemName = args[1]
        self:addDebugItem(hero, itemName)
    end
    if cmd == CMD.REPLACE_ITEM_ALL then
        local itemName = args[1]
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            do
                local i = 0
                while i < 6 do
                    local item = hero:GetItemInSlot(i)
                    if item then
                        UTIL_RemoveImmediate(item)
                    end
                    self:addDebugItem(hero, itemName)
                    i = i + 1
                end
            end
        end)
    end
    if cmd == CMD.REMOVE_ITEM_ALL then
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            do
                local i = 0
                while i < 6 do
                    local item = hero:GetItemInSlot(i)
                    if item then
                        UTIL_RemoveImmediate(item)
                    end
                    i = i + 1
                end
            end
        end)
    end
    if cmd == CMD.V then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local pos = hero:GetAbsOrigin()
        local vectorString = ((((("Vector(" .. tostring(math.floor(pos.x))) .. ", ") .. tostring(math.floor(pos.y))) .. ", ") .. tostring(math.floor(pos.z))) .. ")"
        self:log("当前位置: " .. vectorString)
    end
    if cmd == CMD.M then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local modifiers = hero:FindAllModifiers()
        for ____, modifier in ipairs(modifiers) do
            self:log(modifier:GetName())
        end
    end
    if cmd == CMD.M_TARGET then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local target = self:FindModifierDebugTarget(hero, args[1])
        if target == nil then
            self:log("[ModifierTarget] 未找到附近目标，用法: -mt [tower|building|hero|creep]")
            return
        end
        self:LogUnitModifiers(target)
    end
    if cmd == CMD.M_BOT then
        PlayerHelper:ForEachPlayer(function(____, playerId)
            if not PlayerHelper:IsBotPlayerByPlayerId(playerId) then
                return
            end
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            self:log(((("=== Bot Player " .. tostring(playerId)) .. " (") .. hero:GetUnitName()) .. ") ===")
            local modifiers = hero:FindAllModifiers()
            if #modifiers == 0 then
                self:log("  无modifier")
            else
                for ____, modifier in ipairs(modifiers) do
                    self:log("  " .. modifier:GetName())
                end
            end
        end)
    end
    if cmd == CMD.A then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local abilities = hero:GetAbilityCount()
        self:log("abilities: " .. tostring(abilities))
        do
            local i = 0
            while i < abilities do
                do
                    local ability = hero:GetAbilityByIndex(i)
                    if not ability then
                        goto __continue75
                    end
                    local isHidden = ability:IsHidden()
                    self:log((((("Ability: " .. ability:GetName()) .. ", Level: ") .. tostring(ability:GetLevel())) .. ", Hidden: ") .. tostring(isHidden))
                end
                ::__continue75::
                i = i + 1
            end
        end
    end
    if cmd == CMD.SHARD then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        self:addDebugItem(hero, "item_aghanims_shard")
    end
    if cmd == CMD.G then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        hero:ModifyGold(99999, false, DOTA_ModifyGold_Unspecified)
        hero:AddExperience(99999, DOTA_ModifyXP_Unspecified, false, true)
        local ____opt_0 = hero:GetItemInSlot(15)
        if ____opt_0 ~= nil then
            ____opt_0:EndCooldown()
        end
    end
    if cmd == CMD.G_ALL then
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            hero:ModifyGold(50000, false, DOTA_ModifyGold_Unspecified)
            hero:AddExperience(50000, DOTA_ModifyXP_Unspecified, false, true)
        end)
    end
    if cmd == CMD.L_ALL then
        do
            local i = 0
            while i < 30 do
                Timers:CreateTimer(
                    i * 3,
                    function()
                        PlayerHelper:ForEachPlayer(function(____, playerId)
                            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
                            if not hero then
                                return
                            end
                            hero:HeroLevelUp(true)
                            hero:ModifyGold(5000, false, DOTA_ModifyGold_Unspecified)
                        end)
                    end
                )
                i = i + 1
            end
        end
    end
    if cmd == CMD.LOTTERY then
        GameRules.Lottery:initLotteryAll()
    end
    if cmd == CMD.END then
        GameEnd:OnGameEnd(2)
    end
    if cmd == CMD.REFRESH_AI then
        self:log("REFRESH_AI")
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            GameRules.AI:EnableAI(hero)
        end)
    end
    if cmd == CMD.KILL then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        hero:Kill(nil, hero)
    end
    if cmd == CMD.KILL_ALL then
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if not hero then
                return
            end
            hero:Kill(nil, hero)
        end)
    end
    if __TS__StringStartsWith(cmd, CMD.GET_KEY_V3) then
        local version = args[1]
        local key = GetDedicatedServerKeyV3(version)
        self:log((version .. ": ") .. key)
    end
    if __TS__StringStartsWith(cmd, CMD.ADD_MODIFIER) then
        local modifierName = args[1]
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if hero then
            hero:AddNewModifier(hero, nil, modifierName, {})
        end
    end
    if __TS__StringStartsWith(cmd, CMD.REMOVE_MODIFIER) then
        local modifierName = args[1]
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if hero then
            hero:RemoveModifierByName(modifierName)
        end
    end
    if __TS__StringStartsWith(cmd, CMD.ADD_MODIFIER_All_100) then
        local modifierName = args[1]
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if hero then
                do
                    local i = 0
                    while i < 100 do
                        hero:AddNewModifier(hero, nil, modifierName, {})
                        i = i + 1
                    end
                end
            end
        end)
    end
    if __TS__StringStartsWith(cmd, CMD.REMOVE_MODIFIER_ALL_100) then
        local modifierName = args[1]
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if hero then
                do
                    local i = 0
                    while i < 100 do
                        hero:RemoveModifierByName(modifierName)
                        i = i + 1
                    end
                end
            end
        end)
    end
    if __TS__StringStartsWith(cmd, CMD.ADD_DATADRIVE_MODIFIER_All_100) then
        local modifierName = args[1]
        PlayerHelper:ForEachPlayer(function(____, playerId)
            local hero = PlayerResource:GetSelectedHeroEntity(playerId)
            if hero then
                do
                    local i = 0
                    while i < 100 do
                        ModifierHelper:applyGlobalModifier(hero, modifierName)
                        i = i + 1
                    end
                end
            end
        end)
    end
    if cmd == CMD.REPLACE_HERO then
        self:log("收到替换英雄命令，玩家ID: " .. tostring(keys.playerid))
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            self:log(("错误: 无法获取玩家 " .. tostring(keys.playerid)) .. " 的英雄实体")
            return
        end
        local heroName = args[1]
        self:log((("当前英雄: " .. hero:GetUnitName()) .. ", 目标英雄: ") .. heroName)
        do
            local function ____catch(____error)
                self:log("英雄替换失败: " .. tostring(____error))
            end
            local ____try, ____hasReturned = pcall(function()
                local playerId = hero:GetPlayerID()
                self:log(("准备替换玩家 " .. tostring(playerId)) .. " 的英雄")
                PlayerResource:ReplaceHeroWith(playerId, heroName, 0, 0)
                self:log("英雄替换命令已执行: " .. heroName)
                Timers:CreateTimer(
                    0.1,
                    function()
                        local updatedHero = PlayerResource:GetSelectedHeroEntity(playerId)
                        self:log("替换后英雄: " .. (updatedHero and updatedHero:GetUnitName() or "null"))
                    end
                )
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
    end
    if cmd == CMD.RESET_ABILITY then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        do
            local i = 0
            while i < 30 do
                local ability = hero:GetAbilityByIndex(i)
                if ability then
                    ability:SetLevel(0)
                end
                i = i + 1
            end
        end
    end
    if cmd == CMD.REFRESH_BUYBACK then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        hero:SetBuybackCooldownTime(0)
    end
    if cmd == CMD.GET_SR then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local sr = hero:GetStatusResistance()
        self:log("status resistance: " .. tostring(sr))
    end
    if cmd == CMD.GET_MR then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local mr = hero:Script_GetMagicalArmorValue(false, hero)
        self:log("magical resistance: " .. tostring(mr))
    end
    if cmd == CMD.CHECK_IMMUNITY then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        self:LogUnitImmunityState(hero)
    end
    if cmd == CMD.DAMAGE_PURE then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local damage = __TS__Number(args[1])
        ApplyDamage({
            attacker = hero,
            victim = hero,
            damage = damage,
            damage_type = DAMAGE_TYPE_PURE,
            ability = nil,
            damage_flags = DOTA_DAMAGE_FLAG_NONE
        })
    end
    if cmd == CMD.HP_LOSS then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        hero:SetHealth(hero:GetHealth() * 0.1)
    end
    if cmd == CMD.MP_LOSS then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        hero:SetMana(hero:GetMana() * 0.1)
    end
    if cmd == CMD.STUN then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local duration = __TS__Number(args[1] or 5)
        hero:AddNewModifier(hero, nil, "modifier_stunned", {duration = duration})
    end
    if cmd == CMD.SILENCE then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local duration = __TS__Number(args[1] or 5)
        hero:AddNewModifier(hero, nil, "modifier_silence", {duration = duration})
    end
    if cmd == CMD.ROOT then
        local hero = PlayerResource:GetSelectedHeroEntity(keys.playerid)
        if not hero then
            return
        end
        local duration = __TS__Number(args[1] or 5)
        hero:AddNewModifier(hero, nil, "modifier_rooted", {duration = duration})
    end
end
function Debug.prototype.FindModifierDebugTarget(self, hero, filter)
    local typeFilter = self:GetModifierDebugTargetType(filter)
    local units = FindUnitsInRadius(
        hero:GetTeamNumber(),
        hero:GetAbsOrigin(),
        nil,
        1200,
        DOTA_UNIT_TARGET_TEAM_BOTH,
        typeFilter,
        DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
        FIND_CLOSEST,
        false
    )
    for ____, unit in ipairs(units) do
        do
            if unit:IsNull() or unit == hero then
                goto __continue146
            end
            if filter == "tower" and not unit:IsTower() then
                goto __continue146
            end
            return unit
        end
        ::__continue146::
    end
    return nil
end
function Debug.prototype.GetModifierDebugTargetType(self, filter)
    if filter == "tower" or filter == "building" then
        return DOTA_UNIT_TARGET_BUILDING
    end
    if filter == "hero" then
        return DOTA_UNIT_TARGET_HERO
    end
    if filter == "creep" then
        return DOTA_UNIT_TARGET_CREEP
    end
    return DOTA_UNIT_TARGET_ALL
end
function Debug.prototype.LogUnitModifiers(self, unit)
    local pos = unit:GetAbsOrigin()
    self:log((((((((((((("[ModifierTarget] unit=" .. unit:GetUnitName()) .. " team=") .. tostring(unit:GetTeamNumber())) .. " pos=") .. tostring(math.floor(pos.x))) .. ",") .. tostring(math.floor(pos.y))) .. ",") .. tostring(math.floor(pos.z))) .. " hp=") .. tostring(unit:GetHealth())) .. "/") .. tostring(unit:GetMaxHealth()))
    local modifiers = unit:FindAllModifiers()
    if #modifiers == 0 then
        self:log("[ModifierTarget] 无modifier")
        return
    end
    for ____, modifier in ipairs(modifiers) do
        self:log("[ModifierTarget] " .. modifier:GetName())
    end
end
function Debug.prototype.LogUnitImmunityState(self, unit)
    local ____temp_2
    if unit.IsDebuffImmune ~= nil then
        ____temp_2 = unit:IsDebuffImmune()
    else
        ____temp_2 = false
    end
    local debuffImmune = ____temp_2
    local magicImmune = unit:IsMagicImmune()
    self:log((((("[Immune] unit=" .. unit:GetUnitName()) .. " debuff=") .. tostring(debuffImmune)) .. " magic=") .. tostring(magicImmune))
end
function Debug.prototype.log(self, message)
    print("[Debug] " .. message)
    Say(
        HeroList:GetHero(0),
        message,
        false
    )
end
Debug = __TS__DecorateLegacy({reloadable}, Debug)
____exports.Debug = Debug
return ____exports
