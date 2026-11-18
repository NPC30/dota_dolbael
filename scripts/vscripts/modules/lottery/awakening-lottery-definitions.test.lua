local ____lualib = require("lualib_bundle")
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/awakening-lottery-definitions.test.lua"
__TS__SourceMapTraceBack("modules/lottery/awakening-lottery-definitions.test.lua", {["9"] = 1,["10"] = 2,["11"] = 3,["12"] = 6,["13"] = 6,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 7,["19"] = 7,["20"] = 7,["21"] = 7,["22"] = 7,["23"] = 15,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 16,["28"] = 22,["29"] = 22,["30"] = 22,["31"] = 22,["32"] = 22,["33"] = 22,["34"] = 22,["35"] = 22,["36"] = 22,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 27,["41"] = 27,["42"] = 28,["43"] = 28,["44"] = 28,["45"] = 28,["46"] = 28,["47"] = 28,["48"] = 28,["49"] = 15,["50"] = 15,["51"] = 33,["52"] = 33,["53"] = 33,["54"] = 33,["55"] = 34,["56"] = 36,["57"] = 36,["58"] = 37,["59"] = 37,["60"] = 37,["61"] = 36,["62"] = 36,["63"] = 41,["64"] = 41,["65"] = 42,["66"] = 42,["67"] = 42,["68"] = 41,["69"] = 41,["70"] = 33,["71"] = 33,["72"] = 48,["73"] = 48,["74"] = 48,["75"] = 48,["76"] = 49,["77"] = 49,["78"] = 49,["79"] = 49,["80"] = 49,["81"] = 49,["82"] = 49,["83"] = 52,["84"] = 52,["85"] = 52,["86"] = 52,["87"] = 52,["88"] = 52,["89"] = 52,["90"] = 57,["91"] = 57,["92"] = 57,["93"] = 57,["94"] = 57,["95"] = 57,["96"] = 57,["97"] = 57,["98"] = 57,["99"] = 57,["100"] = 67,["101"] = 67,["102"] = 67,["103"] = 67,["104"] = 67,["105"] = 67,["106"] = 67,["107"] = 67,["108"] = 67,["109"] = 67,["110"] = 67,["111"] = 67,["112"] = 67,["113"] = 67,["114"] = 67,["115"] = 67,["116"] = 67,["117"] = 67,["118"] = 85,["119"] = 48,["120"] = 48,["121"] = 88,["122"] = 88,["123"] = 88,["124"] = 88,["125"] = 89,["126"] = 89,["127"] = 89,["128"] = 89,["129"] = 92,["130"] = 95,["131"] = 96,["132"] = 96,["133"] = 96,["134"] = 96,["135"] = 96,["136"] = 96,["137"] = 96,["138"] = 96,["139"] = 88,["140"] = 88,["141"] = 101,["142"] = 101,["143"] = 101,["144"] = 101,["145"] = 102,["146"] = 103,["147"] = 104,["148"] = 105,["149"] = 105,["150"] = 105,["151"] = 105,["152"] = 105,["153"] = 105,["154"] = 105,["155"] = 106,["156"] = 107,["159"] = 101,["160"] = 101,["161"] = 112,["162"] = 112,["163"] = 112,["164"] = 112,["165"] = 113,["166"] = 113,["167"] = 113,["168"] = 113,["169"] = 118,["170"] = 112,["171"] = 112,["172"] = 6,["173"] = 6});
local ____exports = {}
local ____awakening_2Dlottery_2Ddefinitions = require("modules.lottery.awakening-lottery-definitions")
local AWAKENING_LOTTERY_DEFINITIONS = ____awakening_2Dlottery_2Ddefinitions.AWAKENING_LOTTERY_DEFINITIONS
local AwakeningLotteryDefinitions = ____awakening_2Dlottery_2Ddefinitions.AwakeningLotteryDefinitions
describe(
    nil,
    "AwakeningLotteryDefinitions",
    function()
        local baseTiers = {
            {level = 5, names = {"tier5"}},
            {level = 4, names = {"tier4"}},
            {level = 3, names = {"tier3"}},
            {level = 2, names = {"tier2"}},
            {level = 1, names = {"tier1"}}
        }
        it(
            nil,
            "adds each unlocked awakening as an independent tier 2 entry",
            function()
                local tiers = AwakeningLotteryDefinitions:BuildPersonalTiers(baseTiers, {"ability:break_speed_limit", "ability:dark_seer_normal_punch3"}, "abilityPassive")
                local ____opt_0 = __TS__ArrayFind(
                    tiers,
                    function(____, tier) return tier.level == 2 end
                )
                expect(nil, ____opt_0 and ____opt_0.names):toEqual({
                    "tier2",
                    AwakeningLotteryDefinitions:GetToken("ability:break_speed_limit"),
                    AwakeningLotteryDefinitions:GetToken("ability:dark_seer_normal_punch3")
                })
                local ____opt_2 = __TS__ArrayFind(
                    baseTiers,
                    function(____, tier) return tier.level == 2 end
                )
                expect(nil, ____opt_2 and ____opt_2.names):toEqual({"tier2"})
                expect(
                    nil,
                    __TS__ArrayEvery(
                        AWAKENING_LOTTERY_DEFINITIONS,
                        function(____, definition) return definition.tier == 2 end
                    )
                ):toBe(true)
            end
        )
        it(
            nil,
            "keeps active and passive awakening pools separate",
            function()
                local unlocked = {"ability:break_speed_limit", "ability:axe_auto_culling_blade"}
                expect(
                    nil,
                    __TS__ArrayMap(
                        AwakeningLotteryDefinitions:GetEligibleDefinitions(unlocked, "abilityActive"),
                        function(____, item) return item.itemId end
                    )
                ):toEqual({"ability:axe_auto_culling_blade"})
                expect(
                    nil,
                    __TS__ArrayMap(
                        AwakeningLotteryDefinitions:GetEligibleDefinitions(unlocked, "abilityPassive"),
                        function(____, item) return item.itemId end
                    )
                ):toEqual({"ability:break_speed_limit"})
            end
        )
        it(
            nil,
            "enables the approved standalone A and B candidates",
            function()
                local passiveNames = __TS__ArrayMap(
                    __TS__ArrayFilter(
                        AWAKENING_LOTTERY_DEFINITIONS,
                        function(____, definition) return definition.enabled and definition.abilityType == "passive" end
                    ),
                    function(____, definition) return definition.displayAbility end
                )
                local activeNames = __TS__ArrayMap(
                    __TS__ArrayFilter(
                        AWAKENING_LOTTERY_DEFINITIONS,
                        function(____, definition) return definition.enabled and definition.abilityType == "active" and #definition.grants == 1 end
                    ),
                    function(____, definition) return definition.displayAbility end
                )
                expect(nil, passiveNames):toEqual({
                    "break_speed_limit",
                    "dark_seer_normal_punch3",
                    "death_burst_health_growth",
                    "death_burst_attack_growth",
                    "special_bonus_unique_sven_upgrade",
                    "special_bonus_unique_troll_warlord_upgrade",
                    "necrolyte_heartstopper_aura_datadriven",
                    "special_bonus_unique_jakiro_upgrade"
                })
                expect(nil, activeNames):toEqual({
                    "arc_warden_scepter2_fixed",
                    "spectre_desolate_curse",
                    "medusa_split_shot2",
                    "special_bonus_unique_enchantress_upgrade",
                    "juggernaut_blade_fury_custom",
                    "special_bonus_unique_windranger_upgrade",
                    "abyss_sword_hidden_sharp_upgrade",
                    "imba_batrider_flaming_lasso_enhanced",
                    "special_bonus_unique_phantom_assassin_upgrade",
                    "pudge_meat_hook_lua_upgrade",
                    "special_bonus_unique_warlock_upgrade_transform",
                    "techies_land_mines2",
                    "russian_roulette",
                    "ability_copy_item",
                    "rob_equipment",
                    "sniper_assassinate_upgrade"
                })
                expect(nil, AWAKENING_LOTTERY_DEFINITIONS):toHaveLength(25)
            end
        )
        it(
            nil,
            "keeps linked candidates out of the standalone batch",
            function()
                expect(
                    nil,
                    AwakeningLotteryDefinitions:GetByItemId("ability:clockwerk_auto_chainmail")
                ):toBeUndefined()
                local jakiro = AwakeningLotteryDefinitions:GetByItemId("ability:special_bonus_unique_jakiro_upgrade")
                expect(nil, jakiro and jakiro.abilityType):toBe("passive")
                local ____opt_6 = jakiro
                expect(
                    nil,
                    ____opt_6 and __TS__ArrayMap(
                        jakiro and jakiro.grants,
                        function(____, grant) return grant.abilityName end
                    )
                ):toEqual({"special_bonus_unique_jakiro_upgrade"})
            end
        )
        it(
            nil,
            "uses tier 2 and native primary hotkeys for every standalone entry",
            function()
                for ____, definition in ipairs(AWAKENING_LOTTERY_DEFINITIONS) do
                    expect(nil, definition.tier):toBe(2)
                    expect(nil, definition.itemId):toBe("ability:" .. definition.displayAbility)
                    expect(
                        nil,
                        __TS__ArrayFilter(
                            definition.grants,
                            function(____, grant) return grant.role == "primary" end
                        )
                    ):toHaveLength(1)
                    if #definition.grants == 1 and definition.abilityType == "active" then
                        expect(nil, definition.primaryHotkeyGrantId):toBe("primary")
                    end
                end
            end
        )
        it(
            nil,
            "resolves a sampled token to the configured display candidate",
            function()
                local candidate = AwakeningLotteryDefinitions:ResolveCandidate({
                    name = AwakeningLotteryDefinitions:GetToken("ability:axe_auto_culling_blade"),
                    level = 2
                })
                expect(nil, candidate):toEqual({name = "axe_auto_culling_blade", level = 2, source = "awakening", entryId = "ability:axe_auto_culling_blade"})
            end
        )
    end
)
return ____exports
