local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__Iterator = ____lualib.__TS__Iterator
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/action/cached-ability-state.lua"
__TS__SourceMapTraceBack("ai/action/cached-ability-state.lua", {["11"] = 10,["12"] = 10,["13"] = 10,["15"] = 10,["16"] = 17,["17"] = 18,["18"] = 19,["19"] = 20,["20"] = 21,["21"] = 22,["22"] = 22,["23"] = 22,["24"] = 22,["25"] = 23,["27"] = 26,["29"] = 27,["30"] = 27,["32"] = 28,["33"] = 29,["34"] = 30,["36"] = 32,["39"] = 27,["42"] = 35,["43"] = 39,["44"] = 17,["45"] = 42,["46"] = 43,["47"] = 44,["48"] = 45,["49"] = 42,["50"] = 48,["51"] = 49,["52"] = 49,["53"] = 49,["54"] = 49,["55"] = 49,["56"] = 48,["57"] = 56,["58"] = 57,["59"] = 58,["60"] = 59,["61"] = 59,["62"] = 59,["63"] = 59,["64"] = 59,["67"] = 62,["68"] = 63,["71"] = 66,["72"] = 56,["73"] = 69,["74"] = 70,["75"] = 69,["76"] = 73,["77"] = 74,["78"] = 73,["79"] = 77,["80"] = 78,["81"] = 79,["82"] = 80,["83"] = 81,["84"] = 82,["85"] = 83,["88"] = 77,["89"] = 88,["90"] = 93,["91"] = 93,["92"] = 93,["93"] = 93,["94"] = 88,["95"] = 98,["96"] = 99,["97"] = 99,["98"] = 99,["99"] = 99,["100"] = 98,["101"] = 102,["102"] = 103,["103"] = 102,["104"] = 106,["105"] = 109,["106"] = 106,["107"] = 11,["108"] = 12,["109"] = 13,["110"] = 14,["111"] = 15});
local ____exports = {}
____exports.CachedAbilityState = __TS__Class()
local CachedAbilityState = ____exports.CachedAbilityState
CachedAbilityState.name = "CachedAbilityState"
function CachedAbilityState.prototype.____constructor(self)
end
function CachedAbilityState.GetAbilities(self, hero)
    local heroId = hero:entindex()
    local now = GameRules:GetGameTime()
    local cached = self.abilityByHero:get(heroId)
    if cached ~= nil and now < cached.nextRefreshTime then
        cached.abilities = __TS__ArrayFilter(
            cached.abilities,
            function(____, ability) return self:IsValidAbility(ability) end
        )
        return cached.abilities
    end
    local abilities = {}
    do
        local slot = 0
        while slot < hero:GetAbilityCount() do
            do
                local ability = hero:GetAbilityByIndex(slot)
                if not self:IsValidAbility(ability) then
                    goto __continue6
                end
                abilities[#abilities + 1] = ability
            end
            ::__continue6::
            slot = slot + 1
        end
    end
    self.abilityByHero:set(heroId, {nextRefreshTime = now + self.AbilityRefreshInterval, abilities = abilities})
    return abilities
end
function CachedAbilityState.CanCheckAbility(self, hero, ability)
    local now = GameRules:GetGameTime()
    local cached = self.checkByHeroAbility:get(self:GetHeroAbilityKey(hero, ability))
    return cached == nil or now >= cached.nextCheckTime
end
function CachedAbilityState.MarkAbilityUsed(self, hero, ability)
    self:SetNextAbilityCheck(
        hero,
        ability,
        self:ClampDelay(ability:GetCooldownTimeRemaining() or self.minCheckInterval)
    )
end
function CachedAbilityState.MarkAbilityNotReady(self, hero, ability)
    local cooldownRemaining = ability:GetCooldownTimeRemaining()
    if cooldownRemaining > 0 then
        self:SetNextAbilityCheck(
            hero,
            ability,
            self:ClampDelay(cooldownRemaining)
        )
        return
    end
    if ability:GetManaCost(-1) > hero:GetMana() then
        self:SetNextAbilityCheck(hero, ability, 0.5)
        return
    end
    self:SetNextAbilityCheck(hero, ability, self.minCheckInterval)
end
function CachedAbilityState.MarkAbilityNoTarget(self, hero, ability)
    self:SetNextAbilityCheck(hero, ability, 0.75)
end
function CachedAbilityState.MarkAbilitySkipped(self, hero, ability)
    self:SetNextAbilityCheck(hero, ability, self.AbilityRefreshInterval)
end
function CachedAbilityState.InvalidateHero(self, hero)
    local heroId = hero:entindex()
    self.abilityByHero:delete(heroId)
    local keyPrefix = tostring(heroId) .. ":"
    for ____, key in __TS__Iterator(self.checkByHeroAbility:keys()) do
        if __TS__StringStartsWith(key, keyPrefix) then
            self.checkByHeroAbility:delete(key)
        end
    end
end
function CachedAbilityState.SetNextAbilityCheck(self, hero, ability, delay)
    self.checkByHeroAbility:set(
        self:GetHeroAbilityKey(hero, ability),
        {nextCheckTime = GameRules:GetGameTime() + delay}
    )
end
function CachedAbilityState.ClampDelay(self, delay)
    return math.min(
        self.maxCheckInterval,
        math.max(self.minCheckInterval, delay)
    )
end
function CachedAbilityState.GetHeroAbilityKey(self, hero, ability)
    return (tostring(hero:entindex()) .. ":") .. ability:GetName()
end
function CachedAbilityState.IsValidAbility(self, ability)
    return ability ~= nil and not ability:IsNull()
end
CachedAbilityState.AbilityRefreshInterval = 10
CachedAbilityState.minCheckInterval = 0.3
CachedAbilityState.maxCheckInterval = 2
CachedAbilityState.abilityByHero = __TS__New(Map)
CachedAbilityState.checkByHeroAbility = __TS__New(Map)
return ____exports
