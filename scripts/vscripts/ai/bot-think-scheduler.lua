local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/bot-think-scheduler.lua"
__TS__SourceMapTraceBack("ai/bot-think-scheduler.lua", {["5"] = 1,["6"] = 2,["7"] = 3,["8"] = 4,["9"] = 19,["10"] = 20,["11"] = 25,["12"] = 27,["13"] = 19});
local ____exports = {}
____exports.BOT_COMBAT_THINK_INTERVAL = 0.6
____exports.BOT_TRAVEL_THINK_INTERVAL = 1.2
____exports.BOT_TRAVEL_MOVE_THRESHOLD = 120
____exports.BOT_TRAVEL_STREAK_REQUIRED = 2
function ____exports.ResolveBotThinkSchedule(self, observation)
    local isTraveling = observation.movedDistance >= ____exports.BOT_TRAVEL_MOVE_THRESHOLD and not observation.isAttacking and not observation.isCasting and not observation.hasNearbyEnemyHero
    local travelStreak = isTraveling and observation.previousTravelStreak + 1 or 0
    return {interval = travelStreak >= ____exports.BOT_TRAVEL_STREAK_REQUIRED and ____exports.BOT_TRAVEL_THINK_INTERVAL or ____exports.BOT_COMBAT_THINK_INTERVAL, travelStreak = travelStreak}
end
return ____exports
