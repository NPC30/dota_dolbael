local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/newbie-buff.lua"
__TS__SourceMapTraceBack("modules/event/newbie-buff.lua", {["5"] = 7,["6"] = 11,["7"] = 12,["8"] = 13,["10"] = 15,["11"] = 16,["13"] = 18,["14"] = 7});
local ____exports = {}
function ____exports.GetNewbieBuffModifierName(self, seasonLevel, rebirthCount)
    local isRebirth = rebirthCount > 0
    if seasonLevel <= 20 then
        return isRebirth and "modifier_global_newbie_rebirth" or "modifier_global_newbie"
    end
    if seasonLevel <= 30 then
        return isRebirth and "modifier_global_newbie_2_rebirth" or "modifier_global_newbie_2"
    end
    return nil
end
return ____exports
