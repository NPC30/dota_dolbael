local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/bot-think-scheduler.test.lua"
__TS__SourceMapTraceBack("ai/bot-think-scheduler.test.lua", {["6"] = 1,["7"] = 2,["8"] = 3,["9"] = 4,["10"] = 7,["11"] = 7,["12"] = 7,["13"] = 7,["14"] = 8,["15"] = 8,["16"] = 8,["17"] = 8,["18"] = 9,["19"] = 9,["20"] = 9,["21"] = 9,["22"] = 9,["23"] = 9,["24"] = 9,["25"] = 16,["26"] = 16,["27"] = 16,["28"] = 16,["29"] = 16,["30"] = 16,["31"] = 16,["32"] = 24,["33"] = 25,["34"] = 8,["35"] = 8,["36"] = 28,["37"] = 28,["38"] = 28,["39"] = 32,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 39,["45"] = 28,["46"] = 28,["47"] = 42,["48"] = 42,["49"] = 42,["50"] = 42,["51"] = 43,["52"] = 43,["53"] = 43,["54"] = 43,["55"] = 43,["56"] = 43,["57"] = 43,["58"] = 51,["59"] = 42,["60"] = 42,["61"] = 7,["62"] = 7});
local ____exports = {}
local ____bot_2Dthink_2Dscheduler = require("ai.bot-think-scheduler")
local BOT_COMBAT_THINK_INTERVAL = ____bot_2Dthink_2Dscheduler.BOT_COMBAT_THINK_INTERVAL
local BOT_TRAVEL_THINK_INTERVAL = ____bot_2Dthink_2Dscheduler.BOT_TRAVEL_THINK_INTERVAL
local ResolveBotThinkSchedule = ____bot_2Dthink_2Dscheduler.ResolveBotThinkSchedule
describe(
    nil,
    "ResolveBotThinkSchedule",
    function()
        it(
            nil,
            "backs off after two consecutive travel observations without an enemy hero",
            function()
                local first = ResolveBotThinkSchedule(nil, {
                    movedDistance = 180,
                    isAttacking = false,
                    isCasting = false,
                    hasNearbyEnemyHero = false,
                    previousTravelStreak = 0
                })
                local second = ResolveBotThinkSchedule(nil, {
                    movedDistance = 360,
                    isAttacking = false,
                    isCasting = false,
                    hasNearbyEnemyHero = false,
                    previousTravelStreak = first.travelStreak
                })
                expect(nil, first.interval):toBe(BOT_COMBAT_THINK_INTERVAL)
                expect(nil, second.interval):toBe(BOT_TRAVEL_THINK_INTERVAL)
            end
        )
        it:each({{isAttacking = true, isCasting = false, hasNearbyEnemyHero = false}, {isAttacking = false, isCasting = true, hasNearbyEnemyHero = false}, {isAttacking = false, isCasting = false, hasNearbyEnemyHero = true}})(
            nil,
            "restores combat frequency for %#",
            function(____, state)
                local result = ResolveBotThinkSchedule(
                    nil,
                    __TS__ObjectAssign({movedDistance = 360, previousTravelStreak = 4}, state)
                )
                expect(nil, result):toEqual({interval = BOT_COMBAT_THINK_INTERVAL, travelStreak = 0})
            end
        )
        it(
            nil,
            "does not treat small position changes as continuous travel",
            function()
                local result = ResolveBotThinkSchedule(nil, {
                    movedDistance = 80,
                    isAttacking = false,
                    isCasting = false,
                    hasNearbyEnemyHero = false,
                    previousTravelStreak = 3
                })
                expect(nil, result):toEqual({interval = BOT_COMBAT_THINK_INTERVAL, travelStreak = 0})
            end
        )
    end
)
return ____exports
