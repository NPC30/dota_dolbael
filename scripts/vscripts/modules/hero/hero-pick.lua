local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/hero/hero-pick.lua"
__TS__SourceMapTraceBack("modules/hero/hero-pick.lua", {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 5,["17"] = 5,["18"] = 5,["20"] = 5,["21"] = 6,["22"] = 7,["23"] = 8,["24"] = 9,["26"] = 9,["29"] = 7,["30"] = 6,["31"] = 14,["32"] = 15,["33"] = 16,["34"] = 17,["37"] = 20,["39"] = 20,["42"] = 15,["43"] = 14,["44"] = 25,["45"] = 26,["46"] = 28,["47"] = 28,["48"] = 32,["49"] = 34,["50"] = 35,["51"] = 37,["52"] = 38,["53"] = 40,["54"] = 43,["55"] = 46,["56"] = 49,["57"] = 50,["58"] = 51,["59"] = 52,["60"] = 53,["61"] = 54,["64"] = 49,["66"] = 60,["67"] = 60,["68"] = 61,["69"] = 62,["70"] = 63,["71"] = 60,["75"] = 76,["76"] = 76,["77"] = 77,["78"] = 78,["79"] = 79,["80"] = 76,["83"] = 93,["84"] = 96,["86"] = 98,["87"] = 101,["88"] = 102,["89"] = 103,["90"] = 104,["91"] = 107,["93"] = 101,["94"] = 25,["95"] = 112,["96"] = 113,["97"] = 115,["98"] = 116,["100"] = 121,["101"] = 122,["102"] = 123,["103"] = 124,["104"] = 112,["105"] = 127,["106"] = 128,["107"] = 129,["108"] = 130,["111"] = 133,["112"] = 134,["115"] = 138,["116"] = 139,["117"] = 140,["120"] = 143,["121"] = 144,["122"] = 129,["123"] = 127,["124"] = 148,["125"] = 148,["126"] = 148,["127"] = 148,["128"] = 148,["129"] = 148,["130"] = 148,["131"] = 148,["132"] = 148,["133"] = 148,["134"] = 148,["135"] = 148,["136"] = 148,["137"] = 148,["138"] = 148,["139"] = 148,["140"] = 148,["141"] = 148,["142"] = 148,["143"] = 148,["144"] = 148,["145"] = 148,["146"] = 148,["147"] = 148,["148"] = 148,["149"] = 148,["150"] = 148,["151"] = 148,["152"] = 148,["153"] = 148,["154"] = 148,["155"] = 148,["156"] = 148,["157"] = 148,["158"] = 148,["159"] = 148,["160"] = 148,["161"] = 148,["162"] = 148,["163"] = 148,["164"] = 148,["165"] = 148,["166"] = 148,["167"] = 148,["168"] = 148,["169"] = 148,["170"] = 148,["171"] = 148,["172"] = 148,["173"] = 148,["174"] = 148,["175"] = 148,["176"] = 148,["177"] = 148,["178"] = 148});
local ____exports = {}
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____bot_2Dpush_2Dtiming = require("ai.bot-push-timing")
local BotPushTiming = ____bot_2Dpush_2Dtiming.BotPushTiming
local ____hero_2Dban_2Dpick = require("modules.hero.hero-ban-pick")
local HeroBanPick = ____hero_2Dban_2Dpick.HeroBanPick
____exports.HeroPick = __TS__Class()
local HeroPick = ____exports.HeroPick
HeroPick.name = "HeroPick"
function HeroPick.prototype.____constructor(self)
end
function HeroPick.PickRandomHeroes(self)
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            local ____opt_0 = PlayerResource:GetPlayer(playerId)
            if ____opt_0 ~= nil then
                ____opt_0:MakeRandomHeroSelection()
            end
        end
    end)
end
function HeroPick.PickHumanHeroes(self)
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            if PlayerResource:HasSelectedHero(playerId) then
                return
            end
            local ____opt_2 = PlayerResource:GetPlayer(playerId)
            if ____opt_2 ~= nil then
                ____opt_2:MakeRandomHeroSelection()
            end
        end
    end)
end
function HeroPick.PickBotHeroes(self)
    math.randomseed(GameRules:GetGameTime())
    local ____opt_4 = GameRules.Option
    local nameList = ____opt_4 and ____opt_4.randomDraftMode and ({unpack(____exports.HeroPick.BotNameList)}) or HeroBanPick:FilterBannedHeroes({unpack(____exports.HeroPick.BotNameList)})
    ____exports.HeroPick:ValidateExistingBotHeroes(nameList)
    local radiantPlayerNumberCurrent = PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_GOODGUYS)
    local direPlayerNumberCurrent = PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_BADGUYS)
    local radiantBotNumber = GameRules.Option.radiantPlayerNumber - radiantPlayerNumberCurrent
    local direBotNumberNumber = GameRules.Option.direPlayerNumber - direPlayerNumberCurrent
    print((("[HeroPick][Bot] target radiant=" .. tostring(GameRules.Option.radiantPlayerNumber)) .. " dire=") .. tostring(GameRules.Option.direPlayerNumber))
    print((("[HeroPick][Bot] PlayerResource count radiant=" .. tostring(radiantPlayerNumberCurrent)) .. " dire=") .. tostring(direPlayerNumberCurrent))
    print((("[HeroPick][Bot] add radiant=" .. tostring(radiantBotNumber)) .. " dire=") .. tostring(direBotNumberNumber))
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if PlayerHelper:IsHumanPlayerByPlayerId(playerId) then
            local heroName = PlayerResource:GetSelectedHeroName(playerId)
            local index = __TS__ArrayIndexOf(nameList, heroName)
            if index >= 0 then
                __TS__ArraySplice(nameList, index, 1)
            end
        end
    end)
    do
        local i = 0
        while i < direBotNumberNumber do
            local heroName = ____exports.HeroPick:GetHeroName(nameList)
            print("[HeroPick][Bot] AddBot team=BAD hero=" .. heroName)
            Tutorial:AddBot(heroName, "", "unfair", false)
            i = i + 1
        end
    end
    do
        local i = 0
        while i < radiantBotNumber do
            local heroName = ____exports.HeroPick:GetHeroName(nameList)
            print("[HeroPick][Bot] AddBot team=GOOD hero=" .. heroName)
            Tutorial:AddBot(heroName, "", "unfair", true)
            i = i + 1
        end
    end
    if not GameRules.Option.abyssMode and not BotPushTiming:isAfterPhaseStart(GameRules:GetDOTATime(false, false)) then
        GameRules:GetGameModeEntity():SetBotThinkingEnabled(true)
    end
    Tutorial:StartTutorialMode()
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if PlayerHelper:IsBotPlayerByPlayerId(playerId) then
            local startGold = GameRules.Option.startingGoldBot
            PlayerResource:SetGold(playerId, startGold - 600, true)
            PlayerResource:SetGold(playerId, 0, false)
        end
    end)
end
function HeroPick.GetHeroName(self, nameList)
    if #nameList == 0 then
        print("[ERROR] nameList is empty")
        return "npc_dota_hero_nevermore"
    end
    local i = RandomInt(0, #nameList - 1)
    local name = nameList[i + 1]
    __TS__ArraySplice(nameList, i, 1)
    return name
end
function HeroPick.ValidateExistingBotHeroes(self, nameList)
    local allowedHeroes = __TS__New(Set, nameList)
    PlayerHelper:ForEachPlayer(function(____, playerId)
        if not PlayerHelper:IsBotPlayerByPlayerId(playerId) then
            return
        end
        local heroName = PlayerResource:GetSelectedHeroName(playerId)
        if not heroName or allowedHeroes:has(heroName) then
            return
        end
        local fallbackHero = ____exports.HeroPick:GetHeroName(nameList)
        local player = PlayerResource:GetPlayer(playerId)
        if not player then
            return
        end
        print((("[HeroPick][Bot] Replace unsupported bot hero=" .. heroName) .. " fallback=") .. fallbackHero)
        player:SetSelectedHero(fallbackHero)
    end)
end
HeroPick.BotNameList = {
    "npc_dota_hero_abaddon",
    "npc_dota_hero_axe",
    "npc_dota_hero_bane",
    "npc_dota_hero_bounty_hunter",
    "npc_dota_hero_bloodseeker",
    "npc_dota_hero_bristleback",
    "npc_dota_hero_chaos_knight",
    "npc_dota_hero_crystal_maiden",
    "npc_dota_hero_dazzle",
    "npc_dota_hero_dragon_knight",
    "npc_dota_hero_drow_ranger",
    "npc_dota_hero_earthshaker",
    "npc_dota_hero_jakiro",
    "npc_dota_hero_juggernaut",
    "npc_dota_hero_spectre",
    "npc_dota_hero_kunkka",
    "npc_dota_hero_lich",
    "npc_dota_hero_lina",
    "npc_dota_hero_lion",
    "npc_dota_hero_luna",
    "npc_dota_hero_medusa",
    "npc_dota_hero_meepo",
    "npc_dota_hero_necrolyte",
    "npc_dota_hero_nevermore",
    "npc_dota_hero_ogre_magi",
    "npc_dota_hero_omniknight",
    "npc_dota_hero_oracle",
    "npc_dota_hero_phantom_assassin",
    "npc_dota_hero_pudge",
    "npc_dota_hero_riki",
    "npc_dota_hero_sand_king",
    "npc_dota_hero_shadow_shaman",
    "npc_dota_hero_skywrath_mage",
    "npc_dota_hero_sniper",
    "npc_dota_hero_sven",
    "npc_dota_hero_tinker",
    "npc_dota_hero_tiny",
    "npc_dota_hero_vengefulspirit",
    "npc_dota_hero_viper",
    "npc_dota_hero_warlock",
    "npc_dota_hero_windrunner",
    "npc_dota_hero_witch_doctor",
    "npc_dota_hero_skeleton_king",
    "npc_dota_hero_zuus",
    "npc_dota_hero_centaur",
    "npc_dota_hero_disruptor",
    "npc_dota_hero_doom_bringer",
    "npc_dota_hero_elder_titan",
    "npc_dota_hero_gyrocopter",
    "npc_dota_hero_hoodwink",
    "npc_dota_hero_keeper_of_the_light",
    "npc_dota_hero_leshrac",
    "npc_dota_hero_slardar"
}
return ____exports
