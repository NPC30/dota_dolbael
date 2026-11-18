local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/action/action-ability.lua"
__TS__SourceMapTraceBack("ai/action/action-ability.lua", {["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 8,["19"] = 9,["20"] = 10,["21"] = 11,["22"] = 14,["23"] = 14,["24"] = 14,["26"] = 14,["27"] = 29,["28"] = 34,["29"] = 29,["30"] = 37,["31"] = 38,["32"] = 39,["33"] = 40,["35"] = 43,["36"] = 43,["37"] = 43,["38"] = 43,["39"] = 46,["40"] = 47,["41"] = 48,["43"] = 51,["45"] = 52,["46"] = 53,["48"] = 55,["49"] = 56,["50"] = 57,["52"] = 59,["53"] = 60,["54"] = 61,["56"] = 63,["57"] = 64,["58"] = 65,["60"] = 67,["64"] = 69,["65"] = 37,["66"] = 72,["67"] = 73,["68"] = 74,["69"] = 75,["71"] = 78,["72"] = 79,["73"] = 80,["75"] = 83,["76"] = 84,["78"] = 85,["79"] = 86,["81"] = 88,["82"] = 89,["83"] = 90,["85"] = 92,["86"] = 93,["87"] = 94,["89"] = 96,["90"] = 97,["91"] = 98,["93"] = 100,["94"] = 101,["95"] = 102,["97"] = 104,["98"] = 105,["99"] = 106,["101"] = 108,["105"] = 110,["106"] = 72,["107"] = 113,["108"] = 114,["109"] = 115,["110"] = 116,["112"] = 119,["114"] = 120,["115"] = 121,["117"] = 123,["118"] = 124,["120"] = 126,["121"] = 127,["122"] = 128,["124"] = 131,["125"] = 132,["126"] = 133,["127"] = 134,["129"] = 136,["130"] = 137,["135"] = 141,["136"] = 113,["137"] = 144,["138"] = 149,["139"] = 161,["140"] = 163,["141"] = 163,["142"] = 163,["143"] = 163,["144"] = 163,["145"] = 163,["146"] = 163,["147"] = 144,["148"] = 173,["149"] = 180,["150"] = 181,["151"] = 182,["152"] = 183,["154"] = 186,["155"] = 187,["157"] = 191,["158"] = 191,["159"] = 191,["160"] = 192,["162"] = 195,["163"] = 196,["165"] = 200,["166"] = 201,["167"] = 202,["169"] = 204,["170"] = 205,["171"] = 206,["172"] = 207,["173"] = 208,["176"] = 212,["177"] = 214,["178"] = 215,["180"] = 217,["181"] = 217,["182"] = 222,["183"] = 222,["184"] = 222,["185"] = 222,["186"] = 222,["187"] = 222,["188"] = 222,["189"] = 223,["190"] = 225,["191"] = 230,["193"] = 234,["194"] = 235,["196"] = 239,["197"] = 240,["198"] = 241,["200"] = 243,["201"] = 243,["202"] = 243,["203"] = 243,["204"] = 243,["205"] = 244,["206"] = 245,["207"] = 246,["208"] = 247,["210"] = 249,["211"] = 249,["212"] = 249,["213"] = 249,["214"] = 249,["215"] = 250,["216"] = 251,["217"] = 252,["218"] = 253,["220"] = 255,["221"] = 255,["222"] = 255,["223"] = 255,["224"] = 255,["225"] = 256,["226"] = 257,["227"] = 258,["228"] = 259,["230"] = 261,["231"] = 261,["232"] = 261,["233"] = 261,["234"] = 262,["236"] = 264,["237"] = 265,["240"] = 269,["241"] = 173,["242"] = 275,["243"] = 276,["244"] = 276,["245"] = 276,["246"] = 276,["247"] = 277,["248"] = 278,["249"] = 275,["250"] = 285,["251"] = 289,["252"] = 290,["253"] = 291,["256"] = 294,["257"] = 285,["258"] = 297,["259"] = 298,["260"] = 299,["261"] = 301,["262"] = 302,["264"] = 305,["265"] = 306,["266"] = 297,["267"] = 309,["268"] = 310,["269"] = 311,["271"] = 313,["272"] = 309,["273"] = 321,["274"] = 322,["275"] = 323,["277"] = 325,["278"] = 326,["280"] = 328,["281"] = 321,["282"] = 334,["283"] = 335,["284"] = 336,["285"] = 337,["286"] = 338,["289"] = 341,["290"] = 342,["292"] = 344,["293"] = 345,["295"] = 347,["296"] = 348,["298"] = 351,["299"] = 354,["301"] = 356,["302"] = 334,["303"] = 359,["304"] = 364,["305"] = 365,["306"] = 366,["307"] = 367,["308"] = 368,["310"] = 370,["311"] = 371,["313"] = 374,["314"] = 359,["315"] = 377,["316"] = 382,["317"] = 383,["318"] = 383,["319"] = 383,["320"] = 383,["321"] = 383,["322"] = 384,["324"] = 387,["325"] = 390,["326"] = 390,["327"] = 390,["328"] = 390,["329"] = 390,["330"] = 391,["332"] = 393,["333"] = 394,["334"] = 394,["335"] = 394,["336"] = 394,["337"] = 395,["339"] = 397,["340"] = 377,["341"] = 400,["342"] = 406,["343"] = 407,["344"] = 408,["345"] = 408,["346"] = 408,["347"] = 408,["348"] = 409,["350"] = 411,["352"] = 414,["353"] = 415,["354"] = 416,["356"] = 418,["357"] = 418,["358"] = 418,["359"] = 418,["360"] = 418,["361"] = 419,["362"] = 400,["363"] = 422,["364"] = 428,["365"] = 429,["367"] = 430,["368"] = 431,["370"] = 433,["371"] = 434,["372"] = 435,["377"] = 438,["378"] = 422,["379"] = 441,["380"] = 446,["381"] = 447,["382"] = 448,["383"] = 449,["385"] = 451,["386"] = 452,["388"] = 454,["389"] = 455,["391"] = 457,["392"] = 458,["394"] = 460,["395"] = 461,["397"] = 463,["398"] = 464,["400"] = 466,["401"] = 441,["402"] = 469,["403"] = 475,["404"] = 476,["406"] = 478,["407"] = 479,["408"] = 481,["409"] = 485,["412"] = 488,["413"] = 469,["414"] = 491,["415"] = 495,["416"] = 496,["417"] = 497,["418"] = 498,["420"] = 500,["421"] = 501,["424"] = 504,["425"] = 491,["426"] = 507,["427"] = 511,["428"] = 511,["429"] = 511,["430"] = 511,["431"] = 507,["432"] = 514,["433"] = 515,["434"] = 516,["435"] = 516,["436"] = 517,["437"] = 518,["438"] = 519,["440"] = 521,["441"] = 522,["444"] = 525,["445"] = 525,["446"] = 526,["447"] = 527,["448"] = 528,["450"] = 530,["451"] = 531,["454"] = 534,["455"] = 534,["456"] = 535,["457"] = 536,["458"] = 537,["460"] = 539,["461"] = 540,["465"] = 544,["466"] = 514,["467"] = 15,["468"] = 16,["469"] = 17,["470"] = 18,["471"] = 19,["472"] = 19,["473"] = 19,["474"] = 19,["475"] = 19,["476"] = 19,["477"] = 19,["478"] = 19,["479"] = 19});
local ____exports = {}
local ____action_2Dfind = require("ai.action.action-find")
local ActionFind = ____action_2Dfind.ActionFind
local ____cached_2Dability_2Dstate = require("ai.action.cached-ability-state")
local CachedAbilityState = ____cached_2Dability_2Dstate.CachedAbilityState
local ____cached_2Dfind = require("ai.action.cached-find")
local CachedFind = ____cached_2Dfind.CachedFind
local ____bot_2Dability_2Dcast_2Drules = require("ai.action.bot-ability-cast-rules")
local BotAbilityCastRules = ____bot_2Dability_2Dcast_2Drules.BotAbilityCastRules
local BotAbilityCastRuleResult = ____bot_2Dability_2Dcast_2Drules.BotAbilityCastRuleResult
local ____cast_2Dcondition = require("ai.action.cast-condition")
local CheckAbilityConditionFailure = ____cast_2Dcondition.CheckAbilityConditionFailure
local CheckUnitConditionFailure = ____cast_2Dcondition.CheckUnitConditionFailure
local DeepMerge = ____cast_2Dcondition.DeepMerge
local FilterTargetWithCondition = ____cast_2Dcondition.FilterTargetWithCondition
____exports.ActionAbility = __TS__Class()
local ActionAbility = ____exports.ActionAbility
ActionAbility.name = "ActionAbility"
function ActionAbility.prototype.____constructor(self)
end
function ActionAbility.CastAbilityOnFindEnemyHero(self, ai, abilityName, condition)
    return self:CastAbilityOnFindEnemy(ai, abilityName, condition, DOTA_UNIT_TARGET_HERO)
end
function ActionAbility.CastGenericTeamAbility(self, ai)
    local hero = ai:GetHero()
    if hero:IsSilenced() then
        return false
    end
    local allies = __TS__ArraySort(
        CachedFind:FindTeamHeroes(hero, self.genericTeamHeroSearchRadius, 0.5),
        function(____, a, b) return a:GetHealthPercent() - b:GetHealthPercent() end
    )
    local enemies = CachedFind:FindEnemyHeroes(hero, self.genericTeamThreatRadius, 0.5)
    if #allies == 0 or #enemies == 0 then
        return false
    end
    for ____, ability in ipairs(CachedAbilityState:GetAbilities(hero)) do
        do
            if not CachedAbilityState:CanCheckAbility(hero, ability) then
                goto __continue8
            end
            if not self:IsGenericTeamAbilityCandidate(ability) then
                CachedAbilityState:MarkAbilitySkipped(hero, ability)
                goto __continue8
            end
            if not ability:IsFullyCastable() then
                CachedAbilityState:MarkAbilityNotReady(hero, ability)
                goto __continue8
            end
            if self:CastGenericTeamAbilityInternal(hero, ability, allies, enemies) then
                CachedAbilityState:MarkAbilityUsed(hero, ability)
                return true
            end
            CachedAbilityState:MarkAbilityNoTarget(hero, ability)
        end
        ::__continue8::
    end
    return false
end
function ActionAbility.CastGenericEnemyHeroAbility(self, ai)
    local hero = ai:GetHero()
    if hero:IsSilenced() then
        return false
    end
    local enemies = CachedFind:FindEnemyHeroes(hero, self.genericEnemyHeroSearchRadius, 0.5)
    if #enemies == 0 then
        return false
    end
    local target = enemies[1]
    for ____, ability in ipairs(CachedAbilityState:GetAbilities(hero)) do
        do
            if not CachedAbilityState:CanCheckAbility(hero, ability) then
                goto __continue17
            end
            if BotAbilityCastRules:HasEnemyHeroRule(ability:GetName()) then
                CachedAbilityState:MarkAbilitySkipped(hero, ability)
                goto __continue17
            end
            if not self:IsGenericEnemyHeroAbilityCandidate(ability) then
                CachedAbilityState:MarkAbilitySkipped(hero, ability)
                goto __continue17
            end
            if not ability:IsFullyCastable() then
                CachedAbilityState:MarkAbilityNotReady(hero, ability)
                goto __continue17
            end
            if not self:ShouldUseGenericAbility(hero, ability, target) then
                CachedAbilityState:MarkAbilityNoTarget(hero, ability)
                goto __continue17
            end
            if self:CastGenericAbilityOnEnemyHero(hero, ability, target) then
                CachedAbilityState:MarkAbilityUsed(hero, ability)
                return true
            end
            CachedAbilityState:MarkAbilityNoTarget(hero, ability)
        end
        ::__continue17::
    end
    return false
end
function ActionAbility.CastSpecialEnemyHeroAbility(self, ai)
    local hero = ai:GetHero()
    if hero:IsSilenced() then
        return false
    end
    for ____, ability in ipairs(CachedAbilityState:GetAbilities(hero)) do
        do
            if not CachedAbilityState:CanCheckAbility(hero, ability) then
                goto __continue27
            end
            if not BotAbilityCastRules:HasEnemyHeroRule(ability:GetName()) then
                goto __continue27
            end
            if not ability:IsFullyCastable() then
                CachedAbilityState:MarkAbilityNotReady(hero, ability)
                goto __continue27
            end
            local result = BotAbilityCastRules:TryCastEnemyHeroRule(hero, ability)
            if result == BotAbilityCastRuleResult.CASTED then
                CachedAbilityState:MarkAbilityUsed(hero, ability)
                return true
            end
            if result == BotAbilityCastRuleResult.BLOCKED then
                CachedAbilityState:MarkAbilityNoTarget(hero, ability)
            end
        end
        ::__continue27::
    end
    return false
end
function ActionAbility.CastAbilityOnFindEnemyCreep(self, ai, abilityName, condition)
    local defaultCondition = {self = {unitCondition = {manaPercent = {gte = 50}, healthPercent = {gte = 50}}}, ability = {level = {gte = 3}}}
    local mergedCondition = DeepMerge(nil, defaultCondition, condition)
    return self:CastAbilityOnFindEnemy(
        ai,
        abilityName,
        mergedCondition,
        DOTA_UNIT_TARGET_CREEP,
        DOTA_UNIT_TARGET_FLAG_NOT_ANCIENTS
    )
end
function ActionAbility.CastAbilityOnFindEnemy(self, ai, abilityName, condition, typeFilter, flagFilterExtra)
    local hero = ai:GetHero()
    local ability = hero:FindAbilityByName(abilityName)
    if not ability then
        return false
    end
    if not ability:IsFullyCastable() then
        return false
    end
    local ____CheckUnitConditionFailure_4 = CheckUnitConditionFailure
    local ____opt_0 = condition and condition.self
    if ____CheckUnitConditionFailure_4(nil, hero, ____opt_0 and ____opt_0.unitCondition) then
        return false
    end
    if CheckAbilityConditionFailure(nil, ability, condition and condition.ability) then
        return false
    end
    if typeFilter == DOTA_UNIT_TARGET_HERO then
        if ai:FindNearestEnemyHero() == nil then
            return false
        end
    elseif typeFilter == DOTA_UNIT_TARGET_CREEP then
        if ai:FindNearestEnemyCreep() == nil then
            return false
        elseif ai:FindNearestEnemyCreep():IsAncient() then
            return false
        end
    end
    local flagFilter = DOTA_UNIT_TARGET_FLAG_NONE
    if flagFilterExtra then
        flagFilter = flagFilter + flagFilterExtra
    end
    local ____opt_7 = condition and condition.target
    local findRange = ____opt_7 and ____opt_7.range or self:GetFullCastRange(hero, ability)
    local enemies = ActionFind:FindEnemies(
        hero,
        findRange,
        typeFilter,
        flagFilter,
        FIND_ANY_ORDER
    )
    local target = FilterTargetWithCondition(nil, condition, enemies, hero)
    if not target then
        return false
    end
    if condition and condition.action then
        return self:doAction(condition, ability)
    end
    if self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) then
        if IsInToolsMode() then
            print(("[AI] CastAbilityOnEnemy " .. abilityName) .. " on target")
        end
        hero:CastAbilityOnTarget(
            target,
            ability,
            hero:GetPlayerOwnerID()
        )
        return true
    elseif self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_POINT) then
        if IsInToolsMode() then
            print(("[AI] CastAbilityOnEnemy " .. abilityName) .. " on point")
        end
        hero:CastAbilityOnPosition(
            target:GetAbsOrigin(),
            ability,
            hero:GetPlayerOwnerID()
        )
        return true
    elseif self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_AOE) then
        if IsInToolsMode() then
            print(("[AI] CastAbilityOnEnemy " .. abilityName) .. " on position")
        end
        hero:CastAbilityOnPosition(
            target:GetAbsOrigin(),
            ability,
            hero:GetPlayerOwnerID()
        )
        return true
    elseif self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_NO_TARGET) then
        if IsInToolsMode() then
            print(("[AI] CastAbilityOnEnemy " .. abilityName) .. " no target")
        end
        hero:CastAbilityNoTarget(
            ability,
            hero:GetPlayerOwnerID()
        )
        return true
    else
        if IsInToolsMode() then
            print(("[AI] ERROR CastAbilityOnEnemy " .. abilityName) .. " not found behavior")
        end
    end
    return false
end
function ActionAbility.GetFullCastRange(self, ____self, ability)
    local range = ability:GetCastRange(
        ____self:GetAbsOrigin(),
        nil
    )
    local castRangeIncrease = ____self:GetCastRangeBonus()
    return range + castRangeIncrease
end
function ActionAbility.findOneVisibleUnits(self, units, ____self)
    for ____, unit in ipairs(units) do
        if unit:IsAlive() and unit:CanEntityBeSeenByMyTeam(____self) then
            return unit
        end
    end
    return nil
end
function ActionAbility.IsAbilityBehavior(self, ability, behavior)
    local rawBehavior = ability:GetBehavior()
    local abilityBehavior = type(rawBehavior) == "number" and rawBehavior or tonumber(tostring(rawBehavior))
    if abilityBehavior == nil then
        return false
    end
    local isBitSet = bit.band(abilityBehavior, behavior) == behavior
    return not not isBitSet
end
function ActionAbility.IsGenericEnemyHeroAbilityCandidate(self, ability)
    if not self:IsGenericUsableAbility(ability) then
        return false
    end
    return self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) or self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_POINT) or self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_AOE) or self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_NO_TARGET)
end
function ActionAbility.IsGenericTeamAbilityCandidate(self, ability)
    if not self:IsGenericUsableAbility(ability) then
        return false
    end
    if self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_NO_TARGET) then
        return ability:GetName() == "omniknight_guardian_angel"
    end
    return self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) and self:IsAbilityTargetTeam(ability, DOTA_UNIT_TARGET_TEAM_FRIENDLY)
end
function ActionAbility.IsGenericUsableAbility(self, ability)
    local abilityName = ability:GetName()
    for ____, pattern in ipairs(self.genericSkipAbilityNamePatterns) do
        if __TS__StringIncludes(abilityName, pattern) then
            return false
        end
    end
    if ability:GetLevel() <= 0 then
        return false
    end
    if ability:IsHidden() or ability:IsPassive() then
        return false
    end
    if self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_ITEM) then
        return false
    end
    if self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_TOGGLE) or self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_AUTOCAST) then
        return false
    end
    return true
end
function ActionAbility.ShouldUseGenericAbility(self, hero, ability, target)
    local castRange = self:GetFullCastRange(hero, ability)
    local distance = hero:GetRangeToUnit(target)
    if self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_NO_TARGET) then
        if distance > self.genericNoTargetRadius then
            return false
        end
    elseif castRange > 0 and distance > castRange + 150 then
        return false
    end
    return true
end
function ActionAbility.CastGenericAbilityOnEnemyHero(self, hero, ability, target)
    if self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) then
        hero:CastAbilityOnTarget(
            target,
            ability,
            hero:GetPlayerOwnerID()
        )
        return true
    end
    if self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_POINT) or self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_AOE) then
        hero:CastAbilityOnPosition(
            target:GetAbsOrigin(),
            ability,
            hero:GetPlayerOwnerID()
        )
        return true
    end
    if self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_NO_TARGET) then
        hero:CastAbilityNoTarget(
            ability,
            hero:GetPlayerOwnerID()
        )
        return true
    end
    return false
end
function ActionAbility.CastGenericTeamAbilityInternal(self, hero, ability, allies, enemies)
    if self:IsAbilityBehavior(ability, DOTA_ABILITY_BEHAVIOR_NO_TARGET) then
        if self:ShouldUseGenericNoTargetTeamAbility(hero, ability, allies, enemies) then
            hero:CastAbilityNoTarget(
                ability,
                hero:GetPlayerOwnerID()
            )
            return true
        end
        return false
    end
    local target = self:FindGenericTeamAbilityTarget(hero, ability, allies, enemies)
    if target == nil then
        return false
    end
    hero:CastAbilityOnTarget(
        target,
        ability,
        hero:GetPlayerOwnerID()
    )
    return true
end
function ActionAbility.FindGenericTeamAbilityTarget(self, hero, ability, allies, enemies)
    local castRange = self:GetFullCastRange(hero, ability)
    for ____, ally in ipairs(allies) do
        do
            if castRange > 0 and hero:GetRangeToUnit(ally) > castRange + 150 then
                goto __continue91
            end
            local threatened = self:IsAllyThreatenedByEnemyHero(ally, enemies)
            if self:ShouldUseGenericTeamTargetAbility(ability, ally, threatened) then
                return ally
            end
        end
        ::__continue91::
    end
    return nil
end
function ActionAbility.ShouldUseGenericTeamTargetAbility(self, ability, target, threatened)
    local hp = target:GetHealthPercent()
    local name = ability:GetName()
    if name == "dazzle_shallow_grave" then
        return hp <= 40 or threatened and hp <= 60
    end
    if name == "oracle_false_promise" then
        return hp <= 45 or threatened and hp <= 65
    end
    if name == "abaddon_aphotic_shield" then
        return hp <= 60 or threatened and hp <= 80
    end
    if name == "abaddon_death_coil" then
        return hp <= 55 or threatened and hp <= 70
    end
    if name == "omniknight_purification" or name == "omniknight_martyr" then
        return hp <= 60 or threatened and hp <= 75
    end
    if name == "oracle_fates_edict" then
        return threatened and hp <= 65
    end
    return hp <= 45 or threatened and hp <= 60
end
function ActionAbility.ShouldUseGenericNoTargetTeamAbility(self, hero, ability, allies, enemies)
    if ability:GetName() ~= "omniknight_guardian_angel" then
        return false
    end
    local threatenedLowHpAllies = 0
    for ____, ally in ipairs(allies) do
        if hero:GetRangeToUnit(ally) <= self.genericTeamThreatRadius and ally:GetHealthPercent() <= 65 and self:IsAllyThreatenedByEnemyHero(ally, enemies) then
            threatenedLowHpAllies = threatenedLowHpAllies + 1
        end
    end
    return threatenedLowHpAllies >= 1 and (#allies >= 2 or #enemies >= 2)
end
function ActionAbility.IsAllyThreatenedByEnemyHero(self, ally, enemies)
    for ____, enemy in ipairs(enemies) do
        local attackTarget = enemy:GetAttackTarget()
        if attackTarget == ally then
            return true
        end
        if enemy:GetRangeToUnit(ally) <= self.genericTeamThreatRadius then
            return true
        end
    end
    return false
end
function ActionAbility.IsAbilityTargetTeam(self, ability, targetTeam)
    return bit.band(
        ability:GetAbilityTargetTeam(),
        targetTeam
    ) == targetTeam
end
function ActionAbility.doAction(self, condition, ability)
    if condition and condition.action then
        local ____opt_15 = condition and condition.action
        if ____opt_15 and ____opt_15.toggleOn then
            if not ability:GetToggleState() then
                if IsInToolsMode() then
                    print("[AI] toggleOn " .. ability:GetName())
                end
                ability:ToggleAbility()
                return true
            end
        end
        local ____opt_19 = condition and condition.action
        if ____opt_19 and ____opt_19.toggleOff then
            if ability:GetToggleState() then
                if IsInToolsMode() then
                    print("[AI] toggleOff " .. ability:GetName())
                end
                ability:ToggleAbility()
                return true
            end
        end
        local ____opt_23 = condition and condition.action
        if ____opt_23 and ____opt_23.autoCastOn then
            if not ability:GetAutoCastState() then
                if IsInToolsMode() then
                    print("[AI] autoCastOn " .. ability:GetName())
                end
                ability:ToggleAutoCast()
                return true
            end
        end
    end
    return false
end
ActionAbility.genericEnemyHeroSearchRadius = 1500
ActionAbility.genericTeamHeroSearchRadius = 2000
ActionAbility.genericTeamThreatRadius = 1600
ActionAbility.genericNoTargetRadius = 900
ActionAbility.genericSkipAbilityNamePatterns = {
    "special_bonus",
    "attribute_bonus",
    "empty",
    "hidden",
    "innate",
    "neutral_upgrade",
    "ability_capture"
}
return ____exports
