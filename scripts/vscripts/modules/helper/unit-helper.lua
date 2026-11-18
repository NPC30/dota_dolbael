local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/helper/unit-helper.lua"
__TS__SourceMapTraceBack("modules/helper/unit-helper.lua", {["5"] = 2,["6"] = 3,["7"] = 4,["9"] = 6,["10"] = 2,["11"] = 9,["12"] = 10,["13"] = 11,["15"] = 13,["16"] = 9});
local ____exports = {}
function ____exports.IsEnemyTeam(self, unit1, unit2)
    if not unit1 or not unit2 then
        return false
    end
    return unit1:GetTeamNumber() ~= unit2:GetTeamNumber()
end
function ____exports.IsSameTeam(self, unit1, unit2)
    if not unit1 or not unit2 then
        return false
    end
    return unit1:GetTeamNumber() == unit2:GetTeamNumber()
end
return ____exports
