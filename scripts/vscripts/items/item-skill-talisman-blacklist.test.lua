local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "items/item-skill-talisman-blacklist.test.lua"
__TS__SourceMapTraceBack("items/item-skill-talisman-blacklist.test.lua", {["4"] = 5,["5"] = 7,["6"] = 7,["7"] = 7,["8"] = 7,["9"] = 8,["10"] = 8,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 14,["15"] = 8,["16"] = 8,["17"] = 7,["18"] = 7});
fs = require("items.fs")
describe(
_G,
"item_skill_talisman blacklist",
function()
it(
_G,
"excludes lifestealer infest from stored talisman abilities",
function()
local blacklist = fs:readFileSync("game/scripts/vscripts/abilities/ability_blacklist_butterfly.lua", "utf8")
expect(_G, blacklist):toContain("[\"life_stealer_infest\"] = true")
end
)
end
)
