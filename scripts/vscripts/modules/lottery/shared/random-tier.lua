local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/shared/random-tier.lua"
__TS__SourceMapTraceBack("modules/lottery/shared/random-tier.lua", {["7"] = 7,["8"] = 8,["10"] = 9,["11"] = 9,["12"] = 10,["13"] = 11,["15"] = 9,["18"] = 14,["19"] = 7});
local ____exports = {}
--- 按 rates 累计阈值从 tiers 中随机挑一档。
-- rates 长度需与 tiers 一致，元素为 [1,100] 的累计阈值（如 [1,5,20,60,100]）。
function ____exports.pickRandomTierByRate(self, tiers, rates)
    local random = RandomInt(1, 100)
    do
        local i = 0
        while i < #rates do
            if random <= rates[i + 1] then
                return tiers[i + 1]
            end
            i = i + 1
        end
    end
    return tiers[#tiers]
end
return ____exports
