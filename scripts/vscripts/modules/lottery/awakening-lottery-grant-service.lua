local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayReverse = ____lualib.__TS__ArrayReverse
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/awakening-lottery-grant-service.lua"
__TS__SourceMapTraceBack("modules/lottery/awakening-lottery-grant-service.lua", {["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 9,["15"] = 12,["16"] = 12,["17"] = 14,["18"] = 14,["19"] = 14,["21"] = 14,["22"] = 15,["23"] = 20,["24"] = 20,["26"] = 21,["27"] = 22,["28"] = 22,["30"] = 24,["31"] = 24,["32"] = 24,["33"] = 24,["34"] = 25,["35"] = 25,["37"] = 27,["38"] = 28,["39"] = 28,["40"] = 28,["41"] = 28,["42"] = 29,["43"] = 30,["44"] = 31,["45"] = 32,["46"] = 33,["47"] = 34,["49"] = 37,["50"] = 38,["51"] = 39,["53"] = 41,["54"] = 42,["56"] = 44,["57"] = 45,["58"] = 45,["59"] = 45,["60"] = 45,["61"] = 45,["62"] = 45,["63"] = 45,["65"] = 54,["66"] = 54,["67"] = 55,["68"] = 55,["69"] = 55,["70"] = 55,["71"] = 55,["73"] = 56,["75"] = 54,["76"] = 57,["77"] = 57,["78"] = 57,["79"] = 58,["80"] = 59,["81"] = 59,["82"] = 59,["83"] = 59,["84"] = 60,["85"] = 57,["86"] = 57,["87"] = 57,["88"] = 57,["89"] = 64,["90"] = 65,["91"] = 65,["92"] = 65,["93"] = 65,["94"] = 65,["95"] = 65,["96"] = 65,["97"] = 65,["98"] = 15,["99"] = 75,["100"] = 80,["101"] = 81,["102"] = 82,["103"] = 84,["105"] = 85,["106"] = 85,["108"] = 86,["109"] = 87,["110"] = 87,["112"] = 89,["113"] = 89,["114"] = 89,["115"] = 89,["116"] = 89,["117"] = 90,["118"] = 91,["119"] = 92,["120"] = 93,["121"] = 93,["122"] = 93,["123"] = 93,["125"] = 95,["126"] = 96,["127"] = 97,["128"] = 98,["132"] = 101,["133"] = 102,["135"] = 104,["136"] = 105,["137"] = 75,["138"] = 108,["139"] = 113,["141"] = 114,["142"] = 114,["144"] = 115,["145"] = 115,["146"] = 115,["147"] = 115,["148"] = 116,["149"] = 117,["150"] = 117,["152"] = 118,["153"] = 119,["154"] = 120,["155"] = 121,["159"] = 108,["160"] = 125,["161"] = 129,["162"] = 130,["163"] = 131,["166"] = 125,["167"] = 136,["168"] = 140,["169"] = 141,["171"] = 136,["172"] = 145,["173"] = 149,["174"] = 150,["177"] = 151,["178"] = 152,["180"] = 145,["181"] = 159,["182"] = 163,["183"] = 164,["186"] = 165,["187"] = 166,["189"] = 159});
local ____exports = {}
local ____ability_2Dreplace_2Dhelper = require("modules.lottery.ability-replace.ability-replace-helper")
local AbilityReplaceHelper = ____ability_2Dreplace_2Dhelper.AbilityReplaceHelper
local ____awakening_2Dlottery_2Ddefinitions = require("modules.lottery.awakening-lottery-definitions")
local AwakeningLotteryDefinitions = ____awakening_2Dlottery_2Ddefinitions.AwakeningLotteryDefinitions
local ____lottery_2Dability_2Dgrant_2Dhelper = require("modules.lottery.lottery-ability-grant-helper")
local LotteryAbilityGrantHelper = ____lottery_2Dability_2Dgrant_2Dhelper.LotteryAbilityGrantHelper
____exports.AwakeningLotteryGrantService = __TS__Class()
local AwakeningLotteryGrantService = ____exports.AwakeningLotteryGrantService
AwakeningLotteryGrantService.name = "AwakeningLotteryGrantService"
function AwakeningLotteryGrantService.prototype.____constructor(self)
end
function AwakeningLotteryGrantService.Grant(self, hero, candidate, playerId)
    if candidate.source ~= "awakening" or not candidate.entryId then
        return nil
    end
    local definition = AwakeningLotteryDefinitions:GetByItemId(candidate.entryId)
    if not definition or definition.displayAbility ~= candidate.name then
        return nil
    end
    local primary = __TS__ArrayFind(
        definition.grants,
        function(____, grant) return grant.role == "primary" end
    )
    if not primary or hero:HasAbility(primary.abilityName) then
        return nil
    end
    local grantedAbilities = {}
    local orderedGrants = __TS__ArraySort(
        {unpack(definition.grants)},
        function(____, a, b) return a.order - b.order end
    )
    for ____, grant in ipairs(orderedGrants) do
        local existing = hero:FindAbilityByName(grant.abilityName)
        local ability = existing or hero:AddAbility(grant.abilityName)
        if not ability then
            self:Rollback(hero, definition, grantedAbilities)
            return nil
        end
        local created = existing == nil
        if created and grant.initialLevel > 0 then
            ability:SetLevel(grant.initialLevel)
        end
        if grant.forceVisible then
            ability:SetHidden(false)
        end
        LotteryAbilityGrantHelper:ApplyGrantSideEffects(hero, grant.abilityName, ability, playerId)
        grantedAbilities[#grantedAbilities + 1] = {
            id = grant.id,
            abilityName = grant.abilityName,
            created = created,
            initialLevel = ability:GetLevel(),
            refundLearnedLevels = grant.refundLearnedLevels
        }
    end
    local ____definition_primaryHotkeyGrantId_2
    if definition.primaryHotkeyGrantId then
        local ____opt_0 = __TS__ArrayFind(
            definition.grants,
            function(____, grant) return grant.id == definition.primaryHotkeyGrantId end
        )
        ____definition_primaryHotkeyGrantId_2 = ____opt_0 and ____opt_0.abilityName
    else
        ____definition_primaryHotkeyGrantId_2 = nil
    end
    local hotkeyAbilityName = ____definition_primaryHotkeyGrantId_2
    local extraHotkeys = __TS__ArrayFilter(
        __TS__ArrayMap(
            definition.extraHotkeys or ({}),
            function(____, hotkey)
                local grant = __TS__ArrayFind(
                    definition.grants,
                    function(____, item) return item.id == hotkey.grantId end
                )
                return grant and ({abilityName = grant.abilityName, key = hotkey.key}) or nil
            end
        ),
        function(____, item) return item ~= nil end
    )
    self:BindExtraHotkeys(playerId, extraHotkeys)
    return {
        source = "awakening",
        entryId = definition.itemId,
        displayAbilityName = definition.displayAbility,
        hotkeyAbilityName = hotkeyAbilityName,
        grantedAbilities = grantedAbilities,
        extraHotkeys = extraHotkeys
    }
end
function AwakeningLotteryGrantService.Cleanup(self, hero, state, playerId)
    local definition = AwakeningLotteryDefinitions:GetByItemId(state.entryId)
    local refundedAbilityPoints = 0
    local grantedAbilities = __TS__ArrayReverse({unpack(state.grantedAbilities)})
    for ____, granted in ipairs(grantedAbilities) do
        do
            if not granted.created then
                goto __continue19
            end
            local ability = hero:FindAbilityByName(granted.abilityName)
            if not ability then
                goto __continue19
            end
            local ____opt_3 = definition
            local grantDefinition = ____opt_3 and __TS__ArrayFind(
                definition and definition.grants,
                function(____, grant) return grant.id == granted.id end
            )
            self:PrepareAbilityForRemoval(ability, grantDefinition)
            self:RemoveCleanupModifiers(hero, grantDefinition)
            if granted.refundLearnedLevels then
                refundedAbilityPoints = refundedAbilityPoints + math.max(
                    0,
                    ability:GetLevel() - granted.initialLevel
                )
            end
            AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, granted.abilityName)
            hero:RemoveAbility(granted.abilityName)
            AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, granted.abilityName)
            self:RemoveCleanupModifiers(hero, grantDefinition)
        end
        ::__continue19::
    end
    if refundedAbilityPoints > 0 then
        hero:SetAbilityPoints(hero:GetAbilityPoints() + refundedAbilityPoints)
    end
    self:UnbindExtraHotkeys(playerId, state.extraHotkeys or ({}))
    return refundedAbilityPoints
end
function AwakeningLotteryGrantService.Rollback(self, hero, definition, grantedAbilities)
    for ____, granted in ipairs(__TS__ArrayReverse({unpack(grantedAbilities)})) do
        do
            if not granted.created then
                goto __continue27
            end
            local grantDefinition = __TS__ArrayFind(
                definition.grants,
                function(____, grant) return grant.id == granted.id end
            )
            local ability = hero:FindAbilityByName(granted.abilityName)
            if ability then
                self:PrepareAbilityForRemoval(ability, grantDefinition)
            end
            self:RemoveCleanupModifiers(hero, grantDefinition)
            AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, granted.abilityName)
            hero:RemoveAbility(granted.abilityName)
            AbilityReplaceHelper:cleanupRemovedAbilityModifiers(hero, granted.abilityName)
        end
        ::__continue27::
    end
end
function AwakeningLotteryGrantService.RemoveCleanupModifiers(self, hero, grant)
    for ____, modifierName in ipairs(grant and grant.cleanupModifiers or ({})) do
        if hero:HasModifier(modifierName) then
            hero:RemoveModifierByName(modifierName)
        end
    end
end
function AwakeningLotteryGrantService.PrepareAbilityForRemoval(self, ability, grant)
    if grant and grant.disableToggleOnCleanup and ability:GetToggleState() then
        ability:ToggleAbility()
    end
end
function AwakeningLotteryGrantService.BindExtraHotkeys(self, playerId, hotkeys)
    local player = PlayerResource:GetPlayer(playerId)
    if not player then
        return
    end
    for ____, hotkey in ipairs(hotkeys) do
        CustomGameEventManager:Send_ServerToPlayer(player, "bind_ability_to_key", {ability_name = hotkey.abilityName, key = hotkey.key})
    end
end
function AwakeningLotteryGrantService.UnbindExtraHotkeys(self, playerId, hotkeys)
    local player = PlayerResource:GetPlayer(playerId)
    if not player then
        return
    end
    for ____, hotkey in ipairs(hotkeys) do
        CustomGameEventManager:Send_ServerToPlayer(player, "unbind_ability_from_key", {key = hotkey.key})
    end
end
return ____exports
