local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/hero/hero-ban-pick.test.lua"
__TS__SourceMapTraceBack("modules/hero/hero-ban-pick.test.lua", {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 4,["17"] = 8,["18"] = 8,["19"] = 8,["20"] = 8,["21"] = 9,["22"] = 10,["23"] = 11,["24"] = 13,["25"] = 13,["26"] = 13,["27"] = 13,["28"] = 8,["29"] = 8,["30"] = 18,["31"] = 18,["32"] = 18,["33"] = 18,["34"] = 19,["35"] = 20,["36"] = 22,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 18,["42"] = 18,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 27,["47"] = 28,["48"] = 29,["49"] = 30,["50"] = 31,["51"] = 32,["52"] = 33,["53"] = 35,["54"] = 37,["55"] = 37,["56"] = 37,["57"] = 37,["58"] = 27,["59"] = 27,["60"] = 45,["61"] = 45,["62"] = 45,["63"] = 45,["64"] = 46,["65"] = 47,["66"] = 49,["67"] = 51,["68"] = 51,["69"] = 51,["70"] = 51,["71"] = 45,["72"] = 45,["73"] = 54,["74"] = 54,["75"] = 54,["76"] = 54,["77"] = 55,["78"] = 56,["79"] = 57,["80"] = 59,["81"] = 59,["82"] = 59,["83"] = 59,["84"] = 54,["85"] = 54,["86"] = 62,["87"] = 62,["88"] = 62,["89"] = 62,["90"] = 63,["91"] = 64,["92"] = 65,["93"] = 67,["94"] = 67,["95"] = 67,["96"] = 67,["97"] = 68,["98"] = 68,["99"] = 68,["100"] = 68,["101"] = 62,["102"] = 62,["103"] = 71,["104"] = 71,["105"] = 71,["106"] = 71,["107"] = 72,["108"] = 73,["109"] = 75,["110"] = 75,["111"] = 75,["112"] = 75,["113"] = 76,["114"] = 76,["115"] = 76,["116"] = 76,["117"] = 71,["118"] = 71,["119"] = 79,["120"] = 79,["121"] = 79,["122"] = 79,["123"] = 80,["124"] = 81,["125"] = 83,["126"] = 83,["127"] = 83,["128"] = 83,["129"] = 84,["130"] = 84,["131"] = 84,["132"] = 84,["133"] = 79,["134"] = 79,["135"] = 87,["136"] = 87,["137"] = 87,["138"] = 87,["139"] = 88,["140"] = 89,["141"] = 90,["142"] = 92,["143"] = 92,["144"] = 92,["145"] = 92,["146"] = 93,["147"] = 93,["148"] = 93,["149"] = 93,["150"] = 87,["151"] = 87,["152"] = 99,["153"] = 99,["154"] = 99,["155"] = 99,["156"] = 100,["157"] = 101,["158"] = 102,["159"] = 103,["160"] = 105,["161"] = 105,["162"] = 105,["163"] = 105,["164"] = 106,["165"] = 106,["166"] = 106,["167"] = 106,["168"] = 99,["169"] = 99,["170"] = 109,["171"] = 109,["172"] = 109,["173"] = 109,["174"] = 110,["175"] = 111,["176"] = 113,["177"] = 113,["178"] = 113,["179"] = 113,["180"] = 109,["181"] = 109,["182"] = 122,["183"] = 122,["184"] = 122,["185"] = 122,["186"] = 123,["187"] = 124,["188"] = 126,["189"] = 126,["190"] = 126,["191"] = 126,["192"] = 122,["193"] = 122,["194"] = 135,["195"] = 135,["196"] = 135,["197"] = 135,["198"] = 136,["199"] = 140,["200"] = 141,["201"] = 142,["202"] = 143,["203"] = 143,["204"] = 145,["205"] = 145,["206"] = 145,["207"] = 145,["208"] = 143,["209"] = 143,["210"] = 143,["211"] = 148,["212"] = 152,["213"] = 162,["214"] = 162,["215"] = 162,["216"] = 162,["217"] = 163,["218"] = 164,["219"] = 164,["220"] = 164,["221"] = 164,["222"] = 172,["223"] = 174,["224"] = 176,["225"] = 176,["226"] = 176,["227"] = 176,["228"] = 178,["229"] = 179,["230"] = 135,["231"] = 135,["232"] = 3,["233"] = 3});
local ____exports = {}
local ____hero_2Dban_2Dpick = require("modules.hero.hero-ban-pick")
local HeroBanPick = ____hero_2Dban_2Dpick.HeroBanPick
describe(
    nil,
    "HeroBanPick",
    function()
        beforeEach(
            nil,
            function()
                HeroBanPick:ResetForTest()
            end
        )
        it(
            nil,
            "keeps one vote per player and replaces previous votes",
            function()
                HeroBanPick:CastVote(0, "npc_dota_hero_axe")
                HeroBanPick:CastVote(0, "npc_dota_hero_lina")
                HeroBanPick:CastVote(1, "npc_dota_hero_lina")
                expect(
                    nil,
                    HeroBanPick:GetVoteCounts()
                ):toEqual({npc_dota_hero_lina = 2})
            end
        )
        it(
            nil,
            "finalizes only the latest hero after a player changes vote",
            function()
                HeroBanPick:CastVote(0, "npc_dota_hero_axe")
                HeroBanPick:CastVote(0, "npc_dota_hero_lina")
                HeroBanPick:FinalizeBans()
                expect(
                    nil,
                    HeroBanPick:GetBannedHeroes()
                ):toEqual({"npc_dota_hero_lina"})
            end
        )
        it(
            nil,
            "finalizes all currently voted heroes without a ban limit",
            function()
                HeroBanPick:CastVote(0, "npc_dota_hero_axe")
                HeroBanPick:CastVote(1, "npc_dota_hero_lina")
                HeroBanPick:CastVote(2, "npc_dota_hero_axe")
                HeroBanPick:CastVote(3, "npc_dota_hero_lion")
                HeroBanPick:CastVote(4, "npc_dota_hero_lion")
                HeroBanPick:CastVote(5, "npc_dota_hero_pudge")
                HeroBanPick:FinalizeBans(2)
                expect(
                    nil,
                    HeroBanPick:GetBannedHeroes()
                ):toEqual({"npc_dota_hero_axe", "npc_dota_hero_lion", "npc_dota_hero_lina", "npc_dota_hero_pudge"})
            end
        )
        it(
            nil,
            "does not finalize when only one player is ready",
            function()
                HeroBanPick:SetHumanPlayerIdsForTest({0, 1})
                HeroBanPick:CastVote(0, "npc_dota_hero_axe")
                HeroBanPick:ConfirmVote(0)
                expect(
                    nil,
                    HeroBanPick:GetPhaseForTest()
                ):toBe("voting")
            end
        )
        it(
            nil,
            "finalizes early after every human player has voted",
            function()
                HeroBanPick:SetHumanPlayerIdsForTest({0, 1})
                HeroBanPick:CastVote(0, "npc_dota_hero_axe")
                HeroBanPick:CastVote(1, "npc_dota_hero_lina")
                expect(
                    nil,
                    HeroBanPick:GetBannedHeroes()
                ):toEqual({"npc_dota_hero_axe", "npc_dota_hero_lina"})
            end
        )
        it(
            nil,
            "finalizes early when remaining humans confirm without voting",
            function()
                HeroBanPick:SetHumanPlayerIdsForTest({0, 1})
                HeroBanPick:CastVote(0, "npc_dota_hero_axe")
                HeroBanPick:ConfirmVote(1)
                expect(
                    nil,
                    HeroBanPick:GetPhaseForTest()
                ):toBe("complete")
                expect(
                    nil,
                    HeroBanPick:GetBannedHeroes()
                ):toEqual({"npc_dota_hero_axe"})
            end
        )
        it(
            nil,
            "allows a solo player to confirm without voting",
            function()
                HeroBanPick:SetHumanPlayerIdsForTest({0})
                HeroBanPick:ConfirmVote(0)
                expect(
                    nil,
                    HeroBanPick:GetPhaseForTest()
                ):toBe("complete")
                expect(
                    nil,
                    HeroBanPick:GetBannedHeroes()
                ):toEqual({})
            end
        )
        it(
            nil,
            "keeps solo voting open after the first ban slot",
            function()
                HeroBanPick:SetHumanPlayerIdsForTest({0})
                HeroBanPick:CastVote(0, "npc_dota_hero_axe")
                expect(
                    nil,
                    HeroBanPick:GetPhaseForTest()
                ):toBe("voting")
                expect(
                    nil,
                    HeroBanPick:GetVoteCounts()
                ):toEqual({npc_dota_hero_axe = 1})
            end
        )
        it(
            nil,
            "keeps solo voting open after the second ban slot",
            function()
                HeroBanPick:SetHumanPlayerIdsForTest({0})
                HeroBanPick:CastVote(0, "npc_dota_hero_axe")
                HeroBanPick:CastVote(0, "npc_dota_hero_lina")
                expect(
                    nil,
                    HeroBanPick:GetPhaseForTest()
                ):toBe("voting")
                expect(
                    nil,
                    HeroBanPick:GetVoteCounts()
                ):toEqual({npc_dota_hero_axe = 1, npc_dota_hero_lina = 1})
            end
        )
        it(
            nil,
            "finalizes solo bans after confirm",
            function()
                HeroBanPick:SetHumanPlayerIdsForTest({0})
                HeroBanPick:CastVote(0, "npc_dota_hero_axe")
                HeroBanPick:CastVote(0, "npc_dota_hero_lina")
                HeroBanPick:ConfirmVote(0)
                expect(
                    nil,
                    HeroBanPick:GetPhaseForTest()
                ):toBe("complete")
                expect(
                    nil,
                    HeroBanPick:GetBannedHeroes()
                ):toEqual({"npc_dota_hero_axe", "npc_dota_hero_lina"})
            end
        )
        it(
            nil,
            "filters banned heroes from candidate pools",
            function()
                HeroBanPick:CastVote(0, "npc_dota_hero_axe")
                HeroBanPick:FinalizeBans(1)
                expect(
                    nil,
                    HeroBanPick:FilterBannedHeroes({"npc_dota_hero_axe", "npc_dota_hero_lina", "npc_dota_hero_lion"})
                ):toEqual({"npc_dota_hero_lina", "npc_dota_hero_lion"})
            end
        )
        it(
            nil,
            "chooses a non-banned fallback hero for invalid human selections",
            function()
                HeroBanPick:CastVote(0, "npc_dota_hero_axe")
                HeroBanPick:FinalizeBans(1)
                expect(
                    nil,
                    HeroBanPick:GetFallbackHeroName({"npc_dota_hero_axe", "npc_dota_hero_lina", "npc_dota_hero_lion"})
                ):toBe("npc_dota_hero_lina")
            end
        )
        it(
            nil,
            "auto bans random draft heroes down to the requested remaining count",
            function()
                local testGlobal = _G
                local previousGameRules = testGlobal.GameRules
                local previousCustomNetTables = testGlobal.CustomNetTables
                local blacklisted = {}
                testGlobal.GameRules = {
                    ClearHeroBlacklist = jest:fn(),
                    AddHeroToBlacklist = jest:fn(function(____, heroName)
                        local ____temp_0 = #blacklisted + 1
                        blacklisted[____temp_0] = heroName
                        return ____temp_0
                    end),
                    GetBannedHeroes = jest:fn(function() return {} end)
                }
                testGlobal.CustomNetTables = {SetTableValue = jest:fn()}
                HeroBanPick:ApplyRandomDraftBan({"npc_dota_hero_axe", "npc_dota_hero_lina", "npc_dota_hero_lion", "npc_dota_hero_pudge"}, 2)
                expect(
                    nil,
                    HeroBanPick:GetBannedHeroes()
                ):toHaveLength(2)
                expect(nil, blacklisted):toHaveLength(2)
                expect(
                    nil,
                    HeroBanPick:FilterBannedHeroes({"npc_dota_hero_axe", "npc_dota_hero_lina", "npc_dota_hero_lion", "npc_dota_hero_pudge"})
                ):toHaveLength(2)
                local bannedAfterRandomDraft = HeroBanPick:GetBannedHeroes()
                HeroBanPick:FinalizeBans()
                expect(
                    nil,
                    HeroBanPick:GetBannedHeroes()
                ):toEqual(bannedAfterRandomDraft)
                testGlobal.GameRules = previousGameRules
                testGlobal.CustomNetTables = previousCustomNetTables
            end
        )
    end
)
return ____exports
