local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/helper/net-table-helper.lua"
__TS__SourceMapTraceBack("modules/helper/net-table-helper.lua", {["6"] = 4,["7"] = 4,["8"] = 6,["9"] = 7,["10"] = 6,["11"] = 10,["12"] = 10,["13"] = 10,["15"] = 10,["16"] = 11,["17"] = 12,["18"] = 13,["19"] = 14,["20"] = 14,["21"] = 14,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 14,["27"] = 23,["28"] = 23,["29"] = 23,["30"] = 23,["31"] = 23,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 23,["41"] = 23,["42"] = 23,["43"] = 23,["44"] = 11,["45"] = 43,["46"] = 44,["47"] = 45,["48"] = 46,["50"] = 49,["51"] = 49,["52"] = 49,["53"] = 49,["54"] = 49,["55"] = 49,["56"] = 43});
local ____exports = {}
local ____player = require("api.player")
local MemberLevel = ____player.MemberLevel
local function Boolean(self, value)
    return value == 1
end
____exports.NetTableHelper = __TS__Class()
local NetTableHelper = ____exports.NetTableHelper
NetTableHelper.name = "NetTableHelper"
function NetTableHelper.prototype.____constructor(self)
end
function NetTableHelper.GetLotteryStatus(self, steamAccountID)
    local lotteryStatusData = CustomNetTables:GetTableValue("lottery_status", steamAccountID)
    if not lotteryStatusData then
        return {
            isActiveAbilityRefreshed = false,
            isPassiveAbilityRefreshed = false,
            isPassiveAbilityRefreshed2 = false,
            abilityResettableCount = 0,
            showAbilityResetButton = false
        }
    end
    return {
        activeAbilityName = lotteryStatusData.activeAbilityName,
        activeAbilityLevel = lotteryStatusData.activeAbilityLevel,
        isActiveAbilityRefreshed = Boolean(nil, lotteryStatusData.isActiveAbilityRefreshed),
        passiveAbilityName = lotteryStatusData.passiveAbilityName,
        passiveAbilityLevel = lotteryStatusData.passiveAbilityLevel,
        isPassiveAbilityRefreshed = Boolean(nil, lotteryStatusData.isPassiveAbilityRefreshed),
        passiveAbilityName2 = lotteryStatusData.passiveAbilityName2,
        passiveAbilityLevel2 = lotteryStatusData.passiveAbilityLevel2,
        isPassiveAbilityRefreshed2 = Boolean(nil, lotteryStatusData.isPassiveAbilityRefreshed2),
        abilityResettableCount = lotteryStatusData.abilityResettableCount,
        showAbilityResetButton = Boolean(nil, lotteryStatusData.showAbilityResetButton),
        activeAbilityRefreshCount = lotteryStatusData.activeAbilityRefreshCount,
        passiveAbilityRefreshCount = lotteryStatusData.passiveAbilityRefreshCount,
        passiveAbilityRefreshCount2 = lotteryStatusData.passiveAbilityRefreshCount2,
        maxRefreshCount = lotteryStatusData.maxRefreshCount
    }
end
function NetTableHelper.GetMember(self, steamAccountID)
    local memberData = CustomNetTables:GetTableValue("member_table", steamAccountID)
    if not memberData then
        return {steamId = 0, enable = false, expireDateString = "", level = MemberLevel.NORMAL}
    end
    return {
        steamId = memberData.steamId,
        enable = Boolean(nil, memberData.enable),
        expireDateString = memberData.expireDateString,
        level = memberData.level
    }
end
return ____exports
