local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/helper/bot-ability.lua"
__TS__SourceMapTraceBack("modules/helper/bot-ability.lua", {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 4,["15"] = 4,["17"] = 4,["18"] = 43,["19"] = 43,["20"] = 43,["22"] = 44,["23"] = 45,["24"] = 48,["25"] = 49,["27"] = 53,["28"] = 43,["29"] = 56,["30"] = 57,["31"] = 58,["32"] = 56,["33"] = 61,["34"] = 62,["35"] = 63,["36"] = 64,["39"] = 68,["40"] = 68,["41"] = 68,["42"] = 69,["43"] = 70,["45"] = 68,["46"] = 68,["47"] = 73,["48"] = 74,["49"] = 61,["50"] = 77,["51"] = 82,["54"] = 86,["55"] = 87,["56"] = 88,["57"] = 90,["58"] = 91,["59"] = 92,["61"] = 94,["62"] = 94,["64"] = 96,["65"] = 97,["66"] = 98,["67"] = 99,["69"] = 102,["70"] = 77,["71"] = 112,["72"] = 113,["73"] = 114,["76"] = 118,["77"] = 120,["79"] = 121,["80"] = 121,["81"] = 122,["82"] = 123,["83"] = 123,["84"] = 123,["85"] = 121,["88"] = 126,["89"] = 127,["90"] = 128,["91"] = 130,["93"] = 131,["94"] = 132,["95"] = 135,["96"] = 136,["97"] = 137,["98"] = 138,["102"] = 157,["105"] = 143,["106"] = 144,["107"] = 145,["108"] = 146,["109"] = 147,["110"] = 148,["112"] = 152,["122"] = 162,["123"] = 163,["124"] = 164,["125"] = 165,["127"] = 170,["128"] = 171,["130"] = 112,["131"] = 176,["132"] = 177,["133"] = 178,["134"] = 180,["135"] = 181,["138"] = 185,["139"] = 186,["140"] = 187,["141"] = 189,["142"] = 193,["143"] = 194,["144"] = 195,["145"] = 197,["146"] = 198,["147"] = 199,["149"] = 202,["150"] = 203,["153"] = 207,["154"] = 213,["155"] = 214,["156"] = 214,["157"] = 214,["158"] = 214,["159"] = 214,["160"] = 217,["161"] = 217,["162"] = 217,["163"] = 217,["164"] = 218,["165"] = 220,["166"] = 176,["167"] = 226,["168"] = 227,["169"] = 228,["170"] = 228,["171"] = 228,["172"] = 228,["173"] = 228,["174"] = 228,["175"] = 228,["176"] = 235,["177"] = 237,["178"] = 238,["180"] = 240,["181"] = 241,["182"] = 244,["183"] = 247,["184"] = 248,["185"] = 226,["186"] = 251,["187"] = 252,["188"] = 251,["189"] = 258,["190"] = 259,["191"] = 261,["192"] = 262,["195"] = 258,["196"] = 270,["197"] = 271,["198"] = 272,["199"] = 273,["200"] = 270,["201"] = 279,["202"] = 280,["203"] = 281,["204"] = 283,["207"] = 288,["208"] = 288,["209"] = 288,["210"] = 289,["211"] = 291,["214"] = 294,["215"] = 294,["216"] = 294,["217"] = 294,["218"] = 294,["219"] = 288,["220"] = 288,["221"] = 279,["222"] = 301,["223"] = 306,["224"] = 307,["226"] = 310,["227"] = 311,["228"] = 312,["229"] = 315,["230"] = 316,["232"] = 319,["233"] = 321,["234"] = 322,["235"] = 323,["237"] = 326,["238"] = 301,["239"] = 332,["240"] = 333,["241"] = 334,["242"] = 336,["245"] = 340,["246"] = 342,["249"] = 345,["250"] = 345,["251"] = 345,["252"] = 345,["253"] = 345,["254"] = 332,["255"] = 351,["256"] = 353,["257"] = 355,["260"] = 358,["261"] = 358,["262"] = 358,["263"] = 358,["264"] = 358,["265"] = 351,["266"] = 6,["267"] = 7,["268"] = 8,["269"] = 11,["270"] = 13,["271"] = 14,["272"] = 19,["273"] = 19,["274"] = 19,["275"] = 19,["276"] = 19,["277"] = 19,["278"] = 19,["279"] = 19,["280"] = 19,["281"] = 19,["282"] = 19,["283"] = 19,["284"] = 19});
local ____exports = {}
local ____lottery_2Dabilities = require("modules.lottery.lottery-abilities")
local abilityTiersPassive = ____lottery_2Dabilities.abilityTiersPassive
local ____lottery_2Dhelper = require("modules.lottery.lottery-helper")
local LotteryHelper = ____lottery_2Dhelper.LotteryHelper
____exports.BotAbility = __TS__Class()
local BotAbility = ____exports.BotAbility
BotAbility.name = "BotAbility"
function BotAbility.prototype.____constructor(self)
end
function BotAbility.AddBotAbility(self, hero, bossAbilityCount)
    if bossAbilityCount == nil then
        bossAbilityCount = 0
    end
    self:AddBotPower(hero)
    self:AddPassiveAbilityForBot(hero)
    if bossAbilityCount >= 0 then
        self:AddBossAbilities(hero, bossAbilityCount)
    end
    self:SyncBotAbilitiesToNetTable(hero)
end
function BotAbility.AddExtraBossAbilities(self, hero, bossAbilityCount)
    self:AddBossAbilities(hero, bossAbilityCount)
    self:SyncBotAbilitiesToNetTable(hero)
end
function BotAbility.ClearExtraBossAbilities(self, hero)
    local heroIndex = hero:GetEntityIndex()
    local bossAbilities = self.botBossAbilities:get(heroIndex)
    if not bossAbilities or #bossAbilities == 0 then
        return
    end
    __TS__ArrayForEach(
        bossAbilities,
        function(____, abilityName)
            if hero:HasAbility(abilityName) then
                hero:RemoveAbility(abilityName)
            end
        end
    )
    self.botBossAbilities:delete(heroIndex)
    self:SyncBotAbilitiesToNetTable(hero)
end
function BotAbility.ReplaceBotPassiveAbility(self, hero, oldAbilityName, newAbilityName)
    if not hero:HasAbility(oldAbilityName) then
        return
    end
    local oldAbility = hero:FindAbilityByName(oldAbilityName)
    local oldLevel = oldAbility and not oldAbility:IsNull() and oldAbility:GetLevel() or 1
    hero:RemoveAbility(oldAbilityName)
    local newAbility = hero:FindAbilityByName(newAbilityName)
    if not newAbility or newAbility:IsNull() then
        newAbility = hero:AddAbility(newAbilityName)
    end
    if newAbility ~= nil then
        newAbility:SetLevel(math.max(1, oldLevel))
    end
    local heroIndex = hero:GetEntityIndex()
    if self.botPassiveAbilities:get(heroIndex) == oldAbilityName then
        self.botPassiveAbilities:set(heroIndex, newAbilityName)
        self:SyncBotAbilitiesToNetTable(hero)
    end
    print((((("[BotAbility] Replaced bot passive " .. oldAbilityName) .. " with ") .. newAbilityName) .. " for ") .. hero:GetUnitName())
end
function BotAbility.AddBossAbilities(self, hero, count)
    if count <= 0 then
        print(("[BotAbility] No boss abilities to add (count: " .. tostring(count)) .. ")")
        return
    end
    print((("[BotAbility] Adding " .. tostring(count)) .. " boss abilities to ") .. hero:GetUnitName())
    local shuffled = {unpack(self.bossAbilityPool)}
    do
        local i = #shuffled - 1
        while i > 0 do
            local j = RandomInt(0, i)
            local ____temp_2 = {shuffled[j + 1], shuffled[i + 1]}
            shuffled[i + 1] = ____temp_2[1]
            shuffled[j + 1] = ____temp_2[2]
            i = i - 1
        end
    end
    local addedAbilities = {}
    local addedCount = 0
    local attemptIndex = 0
    while addedCount < count and attemptIndex < #shuffled do
        do
            local abilityName = shuffled[attemptIndex + 1]
            attemptIndex = attemptIndex + 1
            local existingAbility = hero:FindAbilityByName(abilityName)
            if existingAbility ~= nil then
                print(("[BotAbility] Hero already has ability " .. abilityName) .. ", trying next")
                goto __continue17
            end
            do
                local function ____catch(____error)
                    print((("[BotAbility] ERROR adding ability " .. abilityName) .. ": ") .. tostring(____error))
                end
                local ____try, ____hasReturned = pcall(function()
                    local ability = hero:AddAbility(abilityName)
                    if ability ~= nil then
                        ability:SetLevel(1)
                        addedAbilities[#addedAbilities + 1] = abilityName
                        addedCount = addedCount + 1
                        print(((((("[BotAbility] Successfully added boss ability " .. abilityName) .. " (") .. tostring(addedCount)) .. "/") .. tostring(count)) .. ")")
                    else
                        print(("[BotAbility] Failed to add ability " .. abilityName) .. " (AddAbility returned undefined)")
                    end
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
        ::__continue17::
    end
    if #addedAbilities > 0 then
        local heroIndex = hero:GetEntityIndex()
        self.botBossAbilities:set(heroIndex, addedAbilities)
        print((("[BotAbility] Recorded " .. tostring(#addedAbilities)) .. " boss abilities for ") .. hero:GetUnitName())
    end
    if addedCount < count then
        print(((("[BotAbility] Warning: Only added " .. tostring(addedCount)) .. "/") .. tostring(count)) .. " boss abilities")
    end
end
function BotAbility.SyncBotAbilitiesToNetTable(self, hero)
    local playerId = hero:GetPlayerID()
    print("[BotAbility] SyncBotAbilitiesToNetTable called for player " .. tostring(playerId))
    if playerId == -1 then
        print("[BotAbility] Invalid player ID (-1), skipping sync")
        return
    end
    local heroIndex = hero:GetEntityIndex()
    local passiveAbility = self.botPassiveAbilities:get(heroIndex)
    local bossAbilities = self.botBossAbilities:get(heroIndex)
    print((((("[BotAbility] Hero index: " .. tostring(heroIndex)) .. ", passive: ") .. tostring(passiveAbility)) .. ", boss abilities: ") .. tostring(bossAbilities and #bossAbilities or 0))
    local AbilityName = ""
    local AbilityName1 = passiveAbility or ""
    local AbilityName2 = ""
    if bossAbilities and #bossAbilities > 0 then
        if #bossAbilities == 1 then
            AbilityName2 = bossAbilities[1]
        else
            AbilityName2 = bossAbilities[1]
            AbilityName = bossAbilities[2]
        end
    end
    local abilityData = {AbilityName = AbilityName, AbilityName1 = AbilityName1, AbilityName2 = AbilityName2}
    print("[BotAbility] Syncing abilities to network table: " .. json.encode(abilityData))
    CustomNetTables:SetTableValue(
        "bot_abilities",
        tostring(playerId),
        abilityData
    )
    local storedData = CustomNetTables:GetTableValue(
        "bot_abilities",
        tostring(playerId)
    )
    print("[BotAbility] Verification - Data stored in custom table: " .. json.encode(storedData))
    print("[BotAbility] Successfully synced to bot_abilities table for player " .. tostring(playerId))
end
function BotAbility.AddPassiveAbilityForBot(self, currentHero)
    local isHighTier = GameRules.Option.direGoldXpMultiplier >= 9
    local results = LotteryHelper:getRandomAbilities(
        abilityTiersPassive,
        1,
        currentHero,
        {},
        isHighTier
    )
    local abilityName = results[1].name
    if abilityName == "death_prophet_witchcraft2" then
        abilityName = "ogre_magi_multicast_lua"
    end
    abilityName = self:GetSafeBotPassiveAbilityName(abilityName)
    print((((("[BotAbility] AddRandomPassiveAbilityForBot " .. currentHero:GetName()) .. ", ability: ") .. abilityName) .. ", level: ") .. tostring(results[1].level))
    currentHero:AddAbility(abilityName)
    local heroIndex = currentHero:GetEntityIndex()
    self.botPassiveAbilities:set(heroIndex, abilityName)
end
function BotAbility.GetSafeBotPassiveAbilityName(self, abilityName)
    return self.BOT_PASSIVE_REPLACEMENTS[abilityName] or abilityName
end
function BotAbility.AddBotPower(self, hero)
    if GameRules.Option.direGoldXpMultiplier >= 9 then
        if not hero:HasAbility("bot_power_n6") then
            hero:AddAbility("bot_power_n6")
        end
    end
end
function BotAbility.LevelUpBotAbility(self, hero)
    self:LevelUpBotPassiveAbility(hero)
    self:LevelUpBotPower(hero)
    self:LevelUpBossAbilities(hero)
end
function BotAbility.LevelUpBossAbilities(self, hero)
    local heroIndex = hero:GetEntityIndex()
    local bossAbilities = self.botBossAbilities:get(heroIndex)
    if not bossAbilities or #bossAbilities == 0 then
        return
    end
    __TS__ArrayForEach(
        bossAbilities,
        function(____, abilityName)
            local ability = hero:FindAbilityByName(abilityName)
            if not ability or ability:IsNull() then
                return
            end
            self:UpgradeAbilityToLevel(
                ability,
                hero:GetLevel(),
                self.upgradeIntervalBossAbility
            )
        end
    )
end
function BotAbility.UpgradeAbilityToLevel(self, ability, heroLevel, upgradeInterval)
    if ability == nil then
        return false
    end
    local expectedLevel = math.floor(heroLevel / upgradeInterval)
    local abilityLevel = ability:GetLevel()
    local maxLevel = ability:GetMaxLevel()
    if abilityLevel >= maxLevel then
        return false
    end
    if expectedLevel > abilityLevel then
        local targetLevel = math.min(expectedLevel, maxLevel)
        ability:SetLevel(targetLevel)
        return true
    end
    return false
end
function BotAbility.LevelUpBotPassiveAbility(self, hero)
    local heroIndex = hero:GetEntityIndex()
    local passiveAbilityName = self.botPassiveAbilities:get(heroIndex)
    if not passiveAbilityName then
        return
    end
    local ability = hero:FindAbilityByName(passiveAbilityName)
    if not ability or ability:IsNull() then
        return
    end
    self:UpgradeAbilityToLevel(
        ability,
        hero:GetLevel(),
        self.upgradeIntervalBotPassive
    )
end
function BotAbility.LevelUpBotPower(self, hero)
    local ability = hero:FindAbilityByName("bot_power_n6")
    if not ability or ability:IsNull() then
        return
    end
    self:UpgradeAbilityToLevel(
        ability,
        hero:GetLevel(),
        self.upgradeIntervalBotPower
    )
end
BotAbility.upgradeIntervalBotPower = 5
BotAbility.upgradeIntervalBotPassive = 10
BotAbility.upgradeIntervalBossAbility = 10
BotAbility.botPassiveAbilities = __TS__New(Map)
BotAbility.botBossAbilities = __TS__New(Map)
BotAbility.BOT_PASSIVE_REPLACEMENTS = {centaur_return = "axe_counter_helix"}
BotAbility.bossAbilityPool = {
    "spectre_dispersion2",
    "tidehunter_anchor_smash",
    "phantom_assassin_coup_de_grace",
    "dazzle_good_juju",
    "elder_titan_natural_order",
    "medusa_mana_shield2",
    "ability_trigger_learned_skills",
    "sven_great_cleave",
    "pudge_innate_graft_flesh2",
    "silencer_brain_drain2",
    "spectre_desolate"
}
return ____exports
