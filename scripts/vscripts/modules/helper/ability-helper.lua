local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/helper/ability-helper.lua"
__TS__SourceMapTraceBack("modules/helper/ability-helper.lua", {["5"] = 1,["6"] = 2,["7"] = 1});
local ____exports = {}
function ____exports.StartAbilityCooldown(self, ability)
    ability:StartCooldown(ability:GetCooldown(-1) * ability:GetCaster():GetCooldownReduction())
end
return ____exports
