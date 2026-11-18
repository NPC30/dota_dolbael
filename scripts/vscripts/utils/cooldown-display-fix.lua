local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack("G:/steam/nvm/10v10/game/game/scripts/vscripts/utils/cooldown-display-fix.lua", {["6"] = 5,["7"] = 6,["8"] = 7,["9"] = 8,["10"] = 9,["11"] = 10,["12"] = 11,["13"] = 12,["15"] = 14,["16"] = 8});
abilityLua = _G.CDOTA_Ability_Lua
if abilityLua and abilityLua.GetCooldown then
local originalGetCooldown = abilityLua.GetCooldown
abilityLua.GetCooldown = function(self, level)
local base = originalGetCooldown(self, level)
local caster = self:GetCaster()
if caster and not caster:IsNull() then
return base * caster:GetCooldownReduction()
end
return base
end
end
