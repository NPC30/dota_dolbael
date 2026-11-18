local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/action/action-attack.lua"
__TS__SourceMapTraceBack("ai/action/action-attack.lua", {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["17"] = 9,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 18,["26"] = 20,["27"] = 21,["28"] = 22,["30"] = 25,["31"] = 26,["33"] = 29,["34"] = 29,["35"] = 29,["36"] = 29,["37"] = 29,["38"] = 29,["39"] = 35,["41"] = 4});
local ____exports = {}
local ____hero_2Dutil = require("ai.hero.hero-util")
local HeroUtil = ____hero_2Dutil.HeroUtil
____exports.ActionAttack = __TS__Class()
local ActionAttack = ____exports.ActionAttack
ActionAttack.name = "ActionAttack"
function ActionAttack.prototype.____constructor(self)
end
function ActionAttack.Attack(self, hero, target)
    if not target then
        return false
    end
    if HeroUtil:IsInAttackRange(hero, target) then
        ExecuteOrderFromTable({
            OrderType = DOTA_UNIT_ORDER_ATTACK_TARGET,
            UnitIndex = hero:GetEntityIndex(),
            TargetIndex = target:GetEntityIndex(),
            Queue = false
        })
        return true
    else
        local distanceToTarget = hero:GetRangeToUnit(target)
        if distanceToTarget > 300 then
            return false
        end
        if IsInToolsMode() then
            print((("[AI] MoveToTargetToAttack " .. hero:GetUnitName()) .. " to ") .. target:GetUnitName())
        end
        ExecuteOrderFromTable({
            OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
            UnitIndex = hero:GetEntityIndex(),
            Position = target:GetAbsOrigin(),
            Queue = false
        })
        return true
    end
end
return ____exports
