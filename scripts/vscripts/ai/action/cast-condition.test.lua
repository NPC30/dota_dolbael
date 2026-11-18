local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/action/cast-condition.test.lua"
__TS__SourceMapTraceBack("ai/action/cast-condition.test.lua", {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 4,["19"] = 4,["20"] = 10,["21"] = 10,["22"] = 10,["23"] = 10,["24"] = 11,["25"] = 12,["26"] = 13,["27"] = 14,["28"] = 10,["29"] = 10,["30"] = 17,["31"] = 17,["32"] = 17,["33"] = 17,["34"] = 18,["35"] = 23,["36"] = 28,["37"] = 29,["38"] = 17,["39"] = 17,["40"] = 36,["41"] = 36,["42"] = 36,["43"] = 36,["44"] = 37,["45"] = 42,["46"] = 47,["47"] = 48,["48"] = 36,["49"] = 36,["50"] = 55,["51"] = 55,["52"] = 55,["53"] = 55,["54"] = 56,["55"] = 61,["56"] = 69,["57"] = 70,["58"] = 55,["59"] = 55,["60"] = 81,["61"] = 81,["62"] = 81,["63"] = 81,["64"] = 82,["65"] = 85,["66"] = 88,["67"] = 89,["68"] = 81,["69"] = 81,["70"] = 3,["71"] = 3});
local ____exports = {}
local ____cast_2Dcondition = require("ai.action.cast-condition")
local DeepMerge = ____cast_2Dcondition.DeepMerge
describe(
    nil,
    "DeepMerge",
    function()
        it(
            nil,
            "should return the target if source is undefined",
            function()
                local target = {debug = true}
                local result = DeepMerge(nil, target)
                expect(nil, result):toEqual(target)
            end
        )
        it(
            nil,
            "should merge source into target",
            function()
                local target = {debug = true}
                local source = {debug = false}
                local result = DeepMerge(nil, target, source)
                expect(nil, result):toEqual({debug = false})
            end
        )
        it(
            nil,
            "should deeply merge nested objects",
            function()
                local target = {target = {count = {gte = 1, lte = 5}}}
                local source = {target = {count = {gte = 2}}}
                local result = DeepMerge(nil, target, source)
                expect(nil, result):toEqual({target = {count = {gte = 2, lte = 5}}})
            end
        )
        it(
            nil,
            "should override non-object properties",
            function()
                local target = {ability = {charges = {gte = 3, lte = 3}}}
                local source = {ability = {charges = {gte = 5}}}
                local result = DeepMerge(nil, target, source)
                expect(nil, result):toEqual({ability = {charges = {gte = 5, lte = 3}}})
            end
        )
        it(
            nil,
            "should keep the rest of the object",
            function()
                local target = {ability = {charges = {gte = 5}}}
                local source = {ability = {level = {gte = 1, lte = 3}}}
                local result = DeepMerge(nil, target, source)
                expect(nil, result):toEqual({ability = {charges = {gte = 5}, level = {gte = 1, lte = 3}}})
            end
        )
        it(
            nil,
            "should handle undefined properties in source",
            function()
                local target = {debug = true}
                local source = {debug = nil}
                local result = DeepMerge(nil, target, source)
                expect(nil, result):toEqual({debug = true})
            end
        )
    end
)
return ____exports
