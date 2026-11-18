local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/hero/hero-util.lua"
__TS__SourceMapTraceBack("ai/hero/hero-util.lua", {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 10,["12"] = 12,["13"] = 13,["15"] = 16,["16"] = 17,["18"] = 20,["19"] = 21,["21"] = 24,["22"] = 25,["24"] = 28,["25"] = 29,["27"] = 32,["28"] = 33,["29"] = 34,["32"] = 38,["33"] = 10,["34"] = 71,["35"] = 72,["36"] = 71,["37"] = 79,["38"] = 80,["39"] = 81,["40"] = 82,["41"] = 83,["42"] = 84,["43"] = 79,["44"] = 87,["45"] = 88,["46"] = 89,["47"] = 87,["48"] = 2,["49"] = 2,["50"] = 2,["51"] = 2,["52"] = 2,["53"] = 2,["54"] = 2});
local ____exports = {}
____exports.HeroUtil = __TS__Class()
local HeroUtil = ____exports.HeroUtil
HeroUtil.name = "HeroUtil"
function HeroUtil.prototype.____constructor(self)
end
function HeroUtil.NotActionable(self, hero)
    if hero:IsAlive() == false then
        return true
    end
    if hero:IsStunned() then
        return true
    end
    if hero:IsHexed() then
        return true
    end
    if hero:IsNightmared() then
        return true
    end
    if hero:IsFrozen() then
        return true
    end
    for ____, modifier in ipairs(self.stunModifiers) do
        if hero:HasModifier(modifier) then
            return true
        end
    end
    return false
end
function HeroUtil.IsInAttackRange(self, attacker, target)
    return self:GetDistanceToAttackRange(attacker, target) <= 0
end
function HeroUtil.GetDistanceToAttackRange(self, attacker, target)
    local attackRange = attacker:GetBaseAttackRange()
    local attackerCollision = attacker:GetHullRadius()
    local targetCollision = target:GetHullRadius()
    local distance = attacker:GetRangeToUnit(target) - attackerCollision - targetCollision
    return distance - attackRange
end
function HeroUtil.GetDistanceToHero(self, attacker, target)
    local distance = attacker:GetRangeToUnit(target)
    return distance
end
HeroUtil.stunModifiers = {
    "modifier_axe_berserkers_call",
    "modifier_legion_commander_duel",
    "modifier_winter_wyvern_winters_curse",
    "modifier_huskar_life_break_taunt",
    "modifier_teleporting"
}
return ____exports
