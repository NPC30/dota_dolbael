local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/filter/gold-xp-filter.test.lua"
__TS__SourceMapTraceBack("modules/filter/gold-xp-filter.test.lua", {["6"] = 1,["7"] = 1,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 5,["12"] = 11,["13"] = 11,["14"] = 11,["15"] = 11,["16"] = 12,["17"] = 14,["18"] = 14,["19"] = 14,["20"] = 15,["21"] = 14,["22"] = 14,["23"] = 18,["24"] = 18,["25"] = 18,["26"] = 18,["27"] = 19,["28"] = 19,["29"] = 19,["30"] = 19,["31"] = 20,["32"] = 20,["33"] = 20,["34"] = 20,["35"] = 21,["36"] = 21,["37"] = 21,["38"] = 21,["39"] = 19,["40"] = 19,["41"] = 24,["42"] = 24,["43"] = 24,["44"] = 24,["45"] = 25,["46"] = 25,["47"] = 25,["48"] = 25,["49"] = 26,["50"] = 26,["51"] = 26,["52"] = 26,["53"] = 27,["54"] = 27,["55"] = 27,["56"] = 27,["57"] = 28,["58"] = 28,["59"] = 28,["60"] = 28,["61"] = 24,["62"] = 24,["63"] = 18,["64"] = 18,["65"] = 32,["66"] = 32,["67"] = 32,["68"] = 32,["69"] = 33,["70"] = 33,["71"] = 33,["72"] = 33,["73"] = 33,["74"] = 33,["75"] = 33,["76"] = 33,["77"] = 33,["78"] = 33,["79"] = 33,["80"] = 33,["81"] = 33,["82"] = 43,["83"] = 44,["84"] = 44,["85"] = 44,["86"] = 44,["87"] = 33,["88"] = 33,["89"] = 32,["90"] = 32,["91"] = 11,["92"] = 11});
local ____exports = {}
local ____gold_2Dxp_2Dfilter = require("modules.filter.gold-xp-filter")
local GoldXPFilter = ____gold_2Dxp_2Dfilter.GoldXPFilter
global.GameRules = {GetGameModeEntity = jest:fn():mockReturnValue({
    SetModifyGoldFilter = jest:fn(),
    SetModifyExperienceFilter = jest:fn()
})}
describe(
    nil,
    "GoldFilter",
    function()
        local goldFilter
        beforeEach(
            nil,
            function()
                goldFilter = __TS__New(GoldXPFilter)
            end
        )
        describe(
            nil,
            "filterHeroKillGoldByMultiplier",
            function()
                it(
                    nil,
                    "should return the same multiplier if it is less than or equal to 1",
                    function()
                        expect(
                            nil,
                            goldFilter:filterHeroKillGoldByMultiplier(0.5)
                        ):toBe(0.5)
                        expect(
                            nil,
                            goldFilter:filterHeroKillGoldByMultiplier(1)
                        ):toBe(1)
                    end
                )
                it(
                    nil,
                    "should reduce the multiplier correctly when it is greater than 1",
                    function()
                        expect(
                            nil,
                            goldFilter:filterHeroKillGoldByMultiplier(1.5)
                        ):toBe(1.25)
                        expect(
                            nil,
                            goldFilter:filterHeroKillGoldByMultiplier(2)
                        ):toBe(1.5)
                        expect(
                            nil,
                            goldFilter:filterHeroKillGoldByMultiplier(6)
                        ):toBe(3.5)
                        expect(
                            nil,
                            goldFilter:filterHeroKillGoldByMultiplier(10)
                        ):toBeCloseTo(5.5, 1)
                    end
                )
            end
        )
        describe(
            nil,
            "filterHeroKillGold",
            function()
                it:each({
                    {0, 0},
                    {400, 400},
                    {1600, 1000},
                    {3200, 1400},
                    {6000, 1750},
                    {10000, 2250},
                    {20000, 3250},
                    {50000, 5250},
                    {100000, 7750}
                })(
                    nil,
                    "should reduce the gold correctly when the multiplier is %f",
                    function(____, gold, expected)
                        expect(
                            nil,
                            goldFilter:filterHeroKillGold(gold)
                        ):toBeCloseTo(expected, 6)
                    end
                )
            end
        )
    end
)
return ____exports
