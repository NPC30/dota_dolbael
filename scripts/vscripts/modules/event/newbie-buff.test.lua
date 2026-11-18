local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/newbie-buff.test.lua"
__TS__SourceMapTraceBack("modules/event/newbie-buff.test.lua", {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 4,["15"] = 4,["16"] = 4,["17"] = 4,["18"] = 4,["19"] = 4,["20"] = 4,["21"] = 11,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 4,["27"] = 4,["28"] = 3,["29"] = 3});
local ____exports = {}
local ____newbie_2Dbuff = require("modules.event.newbie-buff")
local GetNewbieBuffModifierName = ____newbie_2Dbuff.GetNewbieBuffModifierName
describe(
    nil,
    "GetNewbieBuffModifierName",
    function()
        test:each({
            {20, 0, "modifier_global_newbie"},
            {20, 1, "modifier_global_newbie_rebirth"},
            {21, 0, "modifier_global_newbie_2"},
            {30, 3, "modifier_global_newbie_2_rebirth"},
            {31, 0, nil},
            {31, 2, nil}
        })(
            nil,
            "selects level=%i rebirth=%i",
            function(____, seasonLevel, rebirthCount, expected)
                expect(
                    nil,
                    GetNewbieBuffModifierName(nil, seasonLevel, rebirthCount)
                ):toBe(expected)
            end
        )
    end
)
return ____exports
