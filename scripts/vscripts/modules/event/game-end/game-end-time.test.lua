local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/game-end/game-end-time.test.lua"
__TS__SourceMapTraceBack("modules/event/game-end/game-end-time.test.lua", {["4"] = 5,["5"] = 7,["6"] = 7,["7"] = 7,["8"] = 7,["9"] = 8,["10"] = 10,["11"] = 11,["12"] = 12,["13"] = 13,["14"] = 14,["15"] = 14,["16"] = 14,["17"] = 14,["19"] = 14,["21"] = 14,["22"] = 10,["23"] = 17,["24"] = 17,["25"] = 17,["26"] = 17,["27"] = 18,["28"] = 19,["29"] = 20,["30"] = 21,["31"] = 22,["33"] = 17,["34"] = 17,["35"] = 7,["36"] = 7});
fs = require("modules.event.game-end.fs")
describe(
_G,
"GameEnd game time reporting",
function()
local source = fs:readFileSync("src/vscripts/modules/event/game-end/game-end.ts", "utf8")
local function getMethodBody(self, methodName)
local start = source:indexOf("private static " .. methodName)
expect(_G, start):toBeGreaterThanOrEqual(0)
local nextMethod = source:indexOf("\n private static ", start + 1)
local ____source_slice_1 = source.slice
local ____temp_0
if nextMethod == -1 then
____temp_0 = nil
else
____temp_0 = nextMethod
end
return ____source_slice_1(source, start, ____temp_0)
end
it(
_G,
"uses the same DOTA game clock as the end screen for game/end duration",
function()
for ____, methodName in ipairs({"BuildGameEndDto", "BuildGameEndDto2"}) do
local body = getMethodBody(_G, methodName)
expect(_G, body):toContain("const gameTime = GameRules.GetDOTATime(false, true);")
expect(_G, body)["not"]:toContain("const gameTime = GameRules.GetGameTime();")
expect(_G, body):toContain("gameTimeMsec: Math.round(gameTime * 1000)")
end
end
)
end
)
