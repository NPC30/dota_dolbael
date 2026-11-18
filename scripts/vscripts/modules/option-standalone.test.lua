local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/option-standalone.test.lua"
__TS__SourceMapTraceBack("modules/option-standalone.test.lua", {["5"] = 1,["6"] = 1,["7"] = 5,["8"] = 5,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 13,["13"] = 14,["14"] = 14,["15"] = 14,["16"] = 14,["17"] = 14,["18"] = 14,["19"] = 14,["20"] = 14,["21"] = 14,["22"] = 14,["23"] = 13,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 15,["28"] = 15,["29"] = 15,["30"] = 15,["31"] = 15,["32"] = 15,["33"] = 15,["34"] = 13,["35"] = 16,["36"] = 16,["37"] = 16,["38"] = 16,["39"] = 16,["40"] = 16,["41"] = 16,["42"] = 16,["43"] = 16,["44"] = 16,["45"] = 13,["46"] = 17,["47"] = 17,["48"] = 17,["49"] = 17,["50"] = 17,["51"] = 17,["52"] = 17,["53"] = 17,["54"] = 17,["55"] = 17,["56"] = 13,["57"] = 18,["58"] = 18,["59"] = 18,["60"] = 18,["61"] = 18,["62"] = 18,["63"] = 18,["64"] = 18,["65"] = 18,["66"] = 18,["67"] = 13,["68"] = 19,["69"] = 19,["70"] = 19,["71"] = 19,["72"] = 19,["73"] = 19,["74"] = 19,["75"] = 19,["76"] = 19,["77"] = 19,["78"] = 13,["79"] = 20,["80"] = 20,["81"] = 20,["82"] = 20,["83"] = 20,["84"] = 20,["85"] = 20,["86"] = 20,["87"] = 20,["88"] = 20,["89"] = 13,["90"] = 21,["91"] = 21,["92"] = 21,["93"] = 21,["94"] = 21,["95"] = 21,["96"] = 21,["97"] = 21,["98"] = 21,["99"] = 21,["100"] = 13,["101"] = 22,["102"] = 22,["103"] = 22,["104"] = 22,["105"] = 22,["106"] = 22,["107"] = 22,["108"] = 22,["109"] = 22,["110"] = 22,["111"] = 13,["112"] = 23,["113"] = 23,["114"] = 23,["115"] = 23,["116"] = 23,["117"] = 23,["118"] = 23,["119"] = 23,["120"] = 23,["121"] = 23,["122"] = 13,["123"] = 24,["124"] = 24,["125"] = 24,["126"] = 24,["127"] = 24,["128"] = 24,["129"] = 24,["130"] = 24,["131"] = 24,["132"] = 24,["133"] = 13,["134"] = 13,["135"] = 13,["136"] = 13,["137"] = 27,["138"] = 38,["139"] = 40,["140"] = 40,["141"] = 40,["142"] = 40,["143"] = 40,["144"] = 40,["145"] = 40,["146"] = 40,["147"] = 40,["148"] = 40,["149"] = 40,["150"] = 40,["151"] = 40,["152"] = 40,["153"] = 40,["154"] = 40,["155"] = 40,["156"] = 40,["157"] = 40,["158"] = 13,["159"] = 13,["160"] = 62,["161"] = 62,["162"] = 62,["163"] = 62,["164"] = 63,["165"] = 63,["166"] = 63,["167"] = 63,["168"] = 62,["169"] = 62,["170"] = 66,["171"] = 67,["172"] = 67,["173"] = 67,["174"] = 67,["175"] = 67,["176"] = 66,["177"] = 68,["178"] = 68,["179"] = 68,["180"] = 68,["181"] = 68,["182"] = 66,["183"] = 69,["184"] = 69,["185"] = 69,["186"] = 69,["187"] = 69,["188"] = 66,["189"] = 70,["190"] = 70,["191"] = 70,["192"] = 70,["193"] = 70,["194"] = 66,["195"] = 66,["196"] = 66,["197"] = 73,["198"] = 74,["199"] = 74,["200"] = 74,["201"] = 74,["202"] = 66,["203"] = 66,["204"] = 5,["205"] = 5});
local ____exports = {}
local ____option = require("modules.option")
local Option = ____option.Option
describe(
    nil,
    "Option standalone presets",
    function()
        local option = Option.prototype
        it:each({
            {
                1,
                2,
                100,
                5000,
                1000,
                100,
                50,
                0,
                0
            },
            {
                2,
                3,
                150,
                3000,
                1000,
                100,
                50,
                0,
                0
            },
            {
                3,
                4,
                200,
                3000,
                3000,
                100,
                50,
                0,
                0
            },
            {
                4,
                5,
                250,
                3000,
                3000,
                100,
                50,
                0,
                0
            },
            {
                5,
                7,
                300,
                3000,
                3000,
                100,
                50,
                0,
                0
            },
            {
                6,
                10,
                400,
                3000,
                5000,
                100,
                50,
                0,
                0
            },
            {
                7,
                15,
                500,
                3000,
                5000,
                50,
                135,
                0,
                0
            },
            {
                8,
                15,
                500,
                3000,
                7000,
                50,
                135,
                0,
                0
            },
            {
                9,
                20,
                500,
                3000,
                7000,
                50,
                135,
                0,
                0
            },
            {
                99,
                12,
                700,
                7000,
                5000,
                50,
                200,
                1,
                1
            },
            {
                0,
                20,
                500,
                5000,
                3000,
                50,
                200,
                1,
                0
            }
        })(
            nil,
            "maps N%i to the source-native option values",
            function(____, difficulty, direMultiplier, towerPower, playerGold, botGold, respawn, maxLevel, midOnly, abyss)
                local preset = option:GetStandalonePreset(difficulty)
                expect(nil, preset):toMatchObject({
                    multiplier_radiant = 1.5,
                    multiplier_dire = direMultiplier,
                    multiplier_dire_xp = direMultiplier,
                    player_number_radiant = 1,
                    player_number_dire = 10,
                    tower_power_pct = towerPower,
                    starting_gold_player = playerGold,
                    starting_gold_bot = botGold,
                    respawn_time_pct = respawn,
                    max_level = maxLevel,
                    fixed_ability = "none",
                    same_hero_selection = 0,
                    enable_player_attribute = 1,
                    extra_passive_abilities = 1,
                    mid_only_mode = midOnly,
                    abyss_mode = abyss,
                    abyss_strict_limits = difficulty == 0 and 0 or 1
                })
            end
        )
        it(
            nil,
            "rejects a difficulty without a source-native preset",
            function()
                expect(
                    nil,
                    option:GetStandalonePreset(10)
                ):toBeUndefined()
            end
        )
        it:each({{
            7,
            true,
            true,
            1,
            1
        }, {
            8,
            true,
            true,
            1,
            1
        }, {
            9,
            true,
            true,
            1,
            1
        }, {
            99,
            true,
            false,
            1,
            0
        }})(
            nil,
            "applies fixed standalone flags for N%i",
            function(____, difficulty, midOnlyMode, abyssStrictLimits, expectedMidOnly, expectedStrict)
                expect(
                    nil,
                    option:GetStandalonePreset(difficulty, {midOnlyMode = midOnlyMode, abyssStrictLimits = abyssStrictLimits})
                ):toMatchObject({mid_only_mode = expectedMidOnly, abyss_strict_limits = expectedStrict})
            end
        )
    end
)
return ____exports
