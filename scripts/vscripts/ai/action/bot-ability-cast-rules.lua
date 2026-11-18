local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/action/bot-ability-cast-rules.lua"
__TS__SourceMapTraceBack("ai/action/bot-ability-cast-rules.lua", {["6"] = 14,["7"] = 1,["8"] = 1,["9"] = 58,["10"] = 63,["11"] = 64,["12"] = 65,["13"] = 66,["15"] = 67,["16"] = 68,["18"] = 70,["19"] = 70,["20"] = 70,["21"] = 70,["22"] = 71,["26"] = 73,["27"] = 63,["29"] = 77,["30"] = 81,["31"] = 82,["32"] = 83,["33"] = 84,["34"] = 85,["36"] = 87,["37"] = 91,["38"] = 91,["39"] = 91,["40"] = 91,["41"] = 91,["42"] = 96,["44"] = 97,["45"] = 98,["47"] = 100,["48"] = 101,["49"] = 101,["50"] = 101,["51"] = 101,["52"] = 101,["53"] = 102,["58"] = 105,["59"] = 81,["61"] = 109,["62"] = 113,["63"] = 114,["64"] = 115,["65"] = 118,["66"] = 118,["67"] = 118,["68"] = 118,["69"] = 118,["70"] = 124,["72"] = 125,["73"] = 126,["75"] = 128,["76"] = 129,["77"] = 131,["78"] = 134,["79"] = 134,["80"] = 134,["81"] = 134,["82"] = 134,["83"] = 135,["88"] = 138,["89"] = 113,["91"] = 142,["92"] = 143,["93"] = 144,["94"] = 145,["95"] = 146,["98"] = 149,["100"] = 152,["101"] = 153,["102"] = 153,["103"] = 153,["104"] = 153,["106"] = 156,["107"] = 157,["109"] = 3,["110"] = 4,["111"] = 5,["112"] = 6,["113"] = 14,["114"] = 15,["115"] = 17,["116"] = 17,["117"] = 17,["118"] = 17,["119"] = 17,["120"] = 17,["121"] = 17,["122"] = 41,["123"] = 41,["124"] = 41,["126"] = 41,["127"] = 42,["128"] = 43,["129"] = 42,["130"] = 46,["131"] = 50,["132"] = 51,["133"] = 52,["135"] = 54,["136"] = 46});
local ____exports = {}
local meleeNoTargetRule, fixedDamageExecuteRule, missingHealthExecuteRule, getSpecialValue, getFullCastRange, isDisabled, MELEE_RULE_REFRESH_INTERVAL, EXECUTE_RULE_REFRESH_INTERVAL
local ____cached_2Dfind = require("ai.action.cached-find")
local CachedFind = ____cached_2Dfind.CachedFind
function meleeNoTargetRule(self, options)
    return function(____, hero, ability)
        local radius = getSpecialValue(nil, ability, options.radiusSpecials, options.fallbackRadius)
        local enemies = CachedFind:FindEnemyHeroes(hero, radius, MELEE_RULE_REFRESH_INTERVAL)
        for ____, enemy in ipairs(enemies) do
            do
                if options.ignoreDisabledTargets and isDisabled(nil, enemy) then
                    goto __continue8
                end
                hero:CastAbilityNoTarget(
                    ability,
                    hero:GetPlayerOwnerID()
                )
                return ____exports.BotAbilityCastRuleResult.CASTED
            end
            ::__continue8::
        end
        return ____exports.BotAbilityCastRuleResult.BLOCKED
    end
end
function fixedDamageExecuteRule(self, options)
    return function(____, hero, ability)
        local castRange = getFullCastRange(nil, hero, ability)
        local baseDamage = getSpecialValue(nil, ability, options.damageSpecials, 0)
        if baseDamage <= 0 then
            return ____exports.BotAbilityCastRuleResult.BLOCKED
        end
        local damage = options.includeSpellAmp and baseDamage * (1 + hero:GetSpellAmplification(false)) or baseDamage
        local enemies = CachedFind:FindEnemyHeroes(
            hero,
            math.max(castRange + 150, 250),
            EXECUTE_RULE_REFRESH_INTERVAL
        )
        for ____, enemy in ipairs(enemies) do
            do
                if castRange > 0 and hero:GetRangeToUnit(enemy) > castRange + 150 then
                    goto __continue14
                end
                if enemy:GetHealth() <= damage then
                    hero:CastAbilityOnTarget(
                        enemy,
                        ability,
                        hero:GetPlayerOwnerID()
                    )
                    return ____exports.BotAbilityCastRuleResult.CASTED
                end
            end
            ::__continue14::
        end
        return ____exports.BotAbilityCastRuleResult.BLOCKED
    end
end
function missingHealthExecuteRule(self, options)
    return function(____, hero, ability)
        local castRange = getFullCastRange(nil, hero, ability)
        local damagePerMissingHealth = ability:GetSpecialValueFor(options.damagePerMissingHealthSpecial)
        local enemies = CachedFind:FindEnemyHeroes(
            hero,
            math.max(castRange + 150, 250),
            EXECUTE_RULE_REFRESH_INTERVAL
        )
        for ____, enemy in ipairs(enemies) do
            do
                if castRange > 0 and hero:GetRangeToUnit(enemy) > castRange + 150 then
                    goto __continue20
                end
                local missingHealth = enemy:GetMaxHealth() - enemy:GetHealth()
                local estimatedDamage = missingHealth * damagePerMissingHealth
                if estimatedDamage >= enemy:GetHealth() or enemy:GetHealthPercent() <= options.maxHealthPercent then
                    hero:CastAbilityOnTarget(
                        enemy,
                        ability,
                        hero:GetPlayerOwnerID()
                    )
                    return ____exports.BotAbilityCastRuleResult.CASTED
                end
            end
            ::__continue20::
        end
        return ____exports.BotAbilityCastRuleResult.BLOCKED
    end
end
function getSpecialValue(self, ability, names, fallback)
    for ____, name in ipairs(names) do
        local value = ability:GetSpecialValueFor(name)
        if value > 0 then
            return value
        end
    end
    return fallback
end
function getFullCastRange(self, hero, ability)
    return ability:GetCastRange(
        hero:GetAbsOrigin(),
        nil
    ) + hero:GetCastRangeBonus()
end
function isDisabled(self, unit)
    return unit:IsStunned() or unit:IsHexed() or unit:IsNightmared() or unit:IsFrozen()
end
____exports.BotAbilityCastRuleResult = BotAbilityCastRuleResult or ({})
____exports.BotAbilityCastRuleResult.PASS = "pass"
____exports.BotAbilityCastRuleResult.BLOCKED = "blocked"
____exports.BotAbilityCastRuleResult.CASTED = "casted"
MELEE_RULE_REFRESH_INTERVAL = 0.5
EXECUTE_RULE_REFRESH_INTERVAL = 0.5
local specialEnemyHeroRules = {
    axe_berserkers_call = meleeNoTargetRule(nil, {radiusSpecials = {"radius"}, fallbackRadius = 350, ignoreDisabledTargets = true}),
    centaur_hoof_stomp = meleeNoTargetRule(nil, {radiusSpecials = {"radius"}, fallbackRadius = 325}),
    slardar_slithereen_crush = meleeNoTargetRule(nil, {radiusSpecials = {"crush_radius", "radius"}, fallbackRadius = 350}),
    axe_culling_blade = fixedDamageExecuteRule(nil, {damageSpecials = {"damage"}, includeSpellAmp = true}),
    necrolyte_reapers_scythe = missingHealthExecuteRule(nil, {damagePerMissingHealthSpecial = "damage_per_health", maxHealthPercent = 35})
}
____exports.BotAbilityCastRules = __TS__Class()
local BotAbilityCastRules = ____exports.BotAbilityCastRules
BotAbilityCastRules.name = "BotAbilityCastRules"
function BotAbilityCastRules.prototype.____constructor(self)
end
function BotAbilityCastRules.HasEnemyHeroRule(self, abilityName)
    return specialEnemyHeroRules[abilityName] ~= nil
end
function BotAbilityCastRules.TryCastEnemyHeroRule(self, hero, ability)
    local rule = specialEnemyHeroRules[ability:GetName()]
    if rule == nil then
        return ____exports.BotAbilityCastRuleResult.PASS
    end
    return rule(nil, hero, ability)
end
return ____exports
