local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/helper/bot-intellect-cap.lua"
__TS__SourceMapTraceBack("modules/helper/bot-intellect-cap.lua", {["8"] = 1,["9"] = 1,["12"] = 7,["13"] = 7,["14"] = 7,["15"] = 7,["16"] = 7,["17"] = 7,["18"] = 7,["19"] = 7,["20"] = 7,["21"] = 7,["22"] = 7,["23"] = 7,["24"] = 7,["25"] = 7,["26"] = 7,["27"] = 7,["28"] = 7,["29"] = 7,["30"] = 7,["31"] = 7,["32"] = 7,["33"] = 7,["34"] = 7,["35"] = 7,["36"] = 7,["37"] = 7,["38"] = 7,["39"] = 7,["40"] = 7,["41"] = 7,["42"] = 7,["43"] = 7,["44"] = 7,["45"] = 7,["46"] = 7,["47"] = 7,["48"] = 7,["49"] = 7,["50"] = 7,["51"] = 7,["52"] = 7,["53"] = 7,["54"] = 7,["55"] = 7,["56"] = 7,["57"] = 7,["58"] = 7,["59"] = 7,["60"] = 7,["61"] = 7,["62"] = 7,["63"] = 7,["64"] = 7,["65"] = 7,["66"] = 7,["67"] = 7,["68"] = 7,["69"] = 7,["70"] = 7,["71"] = 7,["72"] = 7,["73"] = 7,["74"] = 7,["75"] = 7,["76"] = 7,["77"] = 7,["78"] = 7,["79"] = 7,["80"] = 7,["81"] = 7,["82"] = 7,["83"] = 7,["84"] = 7,["85"] = 7,["86"] = 7,["87"] = 7,["88"] = 7,["89"] = 7,["90"] = 7,["91"] = 7,["92"] = 7,["93"] = 7,["94"] = 7,["95"] = 7,["96"] = 7,["97"] = 7,["98"] = 7,["99"] = 7,["100"] = 7,["101"] = 7,["102"] = 7,["103"] = 7,["104"] = 7,["105"] = 7,["106"] = 7,["107"] = 7,["108"] = 7,["109"] = 7,["110"] = 7,["111"] = 7,["113"] = 111,["114"] = 112,["115"] = 112,["117"] = 113,["118"] = 114,["119"] = 114,["122"] = 115,["123"] = 115,["124"] = 116,["125"] = 117,["126"] = 118,["127"] = 119,["128"] = 119,["130"] = 120,["131"] = 121,["133"] = 115,["136"] = 124,["137"] = 111,["140"] = 131,["141"] = 131,["142"] = 131,["144"] = 131,["145"] = 138,["146"] = 139,["149"] = 140,["152"] = 142,["153"] = 143,["154"] = 144,["155"] = 145,["156"] = 147,["157"] = 148,["158"] = 149,["159"] = 150,["161"] = 152,["162"] = 138,["163"] = 155,["165"] = 156,["166"] = 156,["168"] = 157,["169"] = 157,["171"] = 158,["172"] = 159,["173"] = 160,["174"] = 161,["178"] = 156,["181"] = 155,["182"] = 168,["183"] = 168,["184"] = 168,["186"] = 169,["189"] = 170,["190"] = 171,["191"] = 171,["192"] = 171,["193"] = 172,["194"] = 173,["195"] = 171,["196"] = 171,["197"] = 168,["198"] = 133,["199"] = 166});
local ____exports = {}
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
--- 真实智力 -> 生效智力 对照表（你提供的表，按真实智力升序）
-- 介于两点之间时线性插值；高于最大点取 1500；低于 1000 为 1:1。
local INTELLECT_TABLE = {
    {0, 0},
    {100, 100},
    {200, 200},
    {300, 300},
    {400, 400},
    {500, 500},
    {600, 600},
    {700, 700},
    {800, 800},
    {900, 900},
    {1000, 966},
    {1156, 1016},
    {1256, 1056},
    {1356, 1093},
    {1456, 1127},
    {1556, 1158},
    {1656, 1186},
    {1756, 1211},
    {1856, 1233},
    {1956, 1252},
    {2056, 1268},
    {2156, 1281},
    {2256, 1291},
    {2356, 1300},
    {2456, 1308},
    {2556, 1315},
    {2656, 1322},
    {2756, 1328},
    {2856, 1334},
    {2956, 1340},
    {3056, 1346},
    {3156, 1352},
    {3256, 1357},
    {3356, 1362},
    {3456, 1367},
    {3556, 1372},
    {3656, 1377},
    {3756, 1382},
    {3856, 1386},
    {3956, 1390},
    {4056, 1394},
    {4156, 1398},
    {4256, 1402},
    {4356, 1406},
    {4456, 1410},
    {4556, 1413},
    {4656, 1416},
    {4756, 1419},
    {4856, 1422},
    {4956, 1425},
    {5056, 1428},
    {5156, 1431},
    {5256, 1434},
    {5356, 1437},
    {5456, 1440},
    {5556, 1443},
    {5656, 1445},
    {5756, 1447},
    {5856, 1449},
    {5956, 1451},
    {6056, 1453},
    {6156, 1455},
    {6256, 1457},
    {6356, 1459},
    {6456, 1461},
    {6556, 1463},
    {6656, 1465},
    {6756, 1467},
    {6856, 1469},
    {6956, 1471},
    {7056, 1473},
    {7156, 1474},
    {7256, 1475},
    {7356, 1476},
    {7456, 1477},
    {7556, 1478},
    {7656, 1479},
    {7756, 1480},
    {7856, 1481},
    {7956, 1482},
    {8056, 1483},
    {8156, 1484},
    {8256, 1485},
    {8356, 1486},
    {8456, 1487},
    {8556, 1488},
    {8656, 1489},
    {8756, 1490},
    {8856, 1491},
    {8956, 1492},
    {9056, 1493},
    {9156, 1494},
    {9256, 1495},
    {9356, 1496},
    {9456, 1497},
    {9556, 1498},
    {9656, 1499},
    {9756, 1500}
}
--- 根据真实智力查表（含线性插值）得到生效智力。
local function getEffectiveIntellect(self, rawInt)
    if rawInt <= 900 then
        return rawInt
    end
    local n = #INTELLECT_TABLE
    if rawInt >= INTELLECT_TABLE[n][1] then
        return INTELLECT_TABLE[n][2]
    end
    do
        local i = 0
        while i < n - 1 do
            local r0, e0 = unpack(INTELLECT_TABLE[i + 1])
            local r1, e1 = unpack(INTELLECT_TABLE[i + 1 + 1])
            if rawInt >= r0 and rawInt <= r1 then
                if r0 == r1 then
                    return e0
                end
                local t = (rawInt - r0) / (r1 - r0)
                return math.floor(e0 + t * (e1 - e0))
            end
            i = i + 1
        end
    end
    return rawInt
end
--- Bot 智力控制：按真实智力-生效智力对照表，直接使用 ModifyIntellect 扣减超出部分。
-- 用「已扣减总量」反推真实智力，避免 GetIntellect 被扣减后无法得到真实值的问题。
____exports.BotIntellectCap = __TS__Class()
local BotIntellectCap = ____exports.BotIntellectCap
BotIntellectCap.name = "BotIntellectCap"
function BotIntellectCap.prototype.____constructor(self)
end
function BotIntellectCap.Update(self, hero)
    if not hero or hero:IsNull() or not hero:IsRealHero() then
        return
    end
    if not PlayerHelper:IsBotPlayer(hero) then
        return
    end
    local entIndex = hero:GetEntityIndex()
    local currentDisplayed = hero:GetIntellect(true)
    local totalSubtracted = self.totalSubtractedByHero:get(entIndex) or 0
    local rawInt = currentDisplayed + totalSubtracted
    local targetEffective = getEffectiveIntellect(nil, rawInt)
    local delta = targetEffective - currentDisplayed
    if delta ~= 0 then
        hero:ModifyIntellect(delta)
    end
    self.totalSubtractedByHero:set(entIndex, rawInt - targetEffective)
end
function BotIntellectCap.UpdateAllBots(self)
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                if not PlayerResource:IsValidPlayer(i) then
                    goto __continue14
                end
                local player = PlayerResource:GetPlayer(i)
                local hero = player and player:GetAssignedHero()
                if hero and PlayerHelper:IsBotPlayer(hero) then
                    self:Update(hero)
                end
            end
            ::__continue14::
            i = i + 1
        end
    end
end
function BotIntellectCap.StartPeriodicUpdate(self, intervalSeconds)
    if intervalSeconds == nil then
        intervalSeconds = 5
    end
    if self.periodicStarted then
        return
    end
    self.periodicStarted = true
    Timers:CreateTimer(
        intervalSeconds,
        function()
            self:UpdateAllBots()
            return intervalSeconds
        end
    )
end
BotIntellectCap.totalSubtractedByHero = __TS__New(Map)
BotIntellectCap.periodicStarted = false
return ____exports
