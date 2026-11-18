local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/awakening-lottery-definitions.lua"
__TS__SourceMapTraceBack("modules/lottery/awakening-lottery-definitions.lua", {["13"] = 35,["14"] = 37,["15"] = 40,["16"] = 40,["18"] = 41,["19"] = 41,["21"] = 43,["22"] = 43,["23"] = 43,["24"] = 43,["25"] = 43,["26"] = 43,["27"] = 49,["28"] = 50,["29"] = 50,["30"] = 50,["31"] = 50,["32"] = 50,["33"] = 50,["34"] = 50,["35"] = 50,["36"] = 50,["37"] = 43,["38"] = 43,["39"] = 63,["40"] = 63,["42"] = 64,["43"] = 37,["44"] = 67,["45"] = 67,["46"] = 67,["47"] = 67,["48"] = 67,["49"] = 67,["50"] = 67,["51"] = 67,["52"] = 67,["53"] = 67,["54"] = 67,["55"] = 101,["56"] = 101,["57"] = 101,["58"] = 101,["59"] = 101,["60"] = 101,["61"] = 67,["62"] = 67,["63"] = 67,["64"] = 67,["65"] = 67,["66"] = 67,["67"] = 67,["68"] = 67,["69"] = 67,["70"] = 67,["71"] = 67,["72"] = 67,["73"] = 67,["74"] = 67,["75"] = 149,["76"] = 149,["77"] = 149,["78"] = 149,["79"] = 149,["80"] = 149,["81"] = 155,["82"] = 156,["83"] = 156,["84"] = 156,["85"] = 156,["86"] = 156,["87"] = 156,["88"] = 156,["89"] = 155,["90"] = 165,["91"] = 165,["92"] = 165,["93"] = 165,["94"] = 165,["95"] = 165,["96"] = 165,["97"] = 165,["98"] = 149,["99"] = 149,["100"] = 149,["101"] = 67,["102"] = 67,["103"] = 181,["104"] = 181,["105"] = 181,["107"] = 181,["108"] = 182,["109"] = 183,["110"] = 183,["111"] = 183,["112"] = 183,["113"] = 182,["114"] = 188,["115"] = 189,["116"] = 188,["117"] = 192,["118"] = 193,["119"] = 193,["121"] = 194,["122"] = 192,["123"] = 197,["124"] = 202,["125"] = 203,["126"] = 203,["127"] = 203,["128"] = 204,["129"] = 204,["131"] = 205,["132"] = 205,["134"] = 206,["135"] = 206,["137"] = 207,["138"] = 207,["140"] = 208,["141"] = 208,["142"] = 208,["143"] = 208,["144"] = 203,["145"] = 203,["146"] = 197,["147"] = 212,["148"] = 218,["149"] = 218,["150"] = 218,["151"] = 218,["152"] = 218,["153"] = 218,["154"] = 218,["155"] = 219,["156"] = 219,["157"] = 219,["158"] = 219,["159"] = 220,["160"] = 220,["162"] = 222,["163"] = 223,["164"] = 223,["166"] = 225,["167"] = 212,["168"] = 228,["169"] = 229,["170"] = 230,["171"] = 230,["173"] = 231,["174"] = 228,["175"] = 239,["176"] = 240,["177"] = 241,["179"] = 243,["180"] = 239,["181"] = 246,["182"] = 247,["183"] = 247,["184"] = 248,["185"] = 249,["186"] = 249,["187"] = 247,["188"] = 247,["189"] = 246});
local ____exports = {}
local TOKEN_PREFIX = "__awakening_lottery__"
local function createSingleAbilityDefinition(self, abilityName, abilityType, cleanupModifiers, disableToggleOnCleanup)
    if cleanupModifiers == nil then
        cleanupModifiers = {}
    end
    if disableToggleOnCleanup == nil then
        disableToggleOnCleanup = false
    end
    local definition = {
        itemId = "ability:" .. abilityName,
        enabled = true,
        displayAbility = abilityName,
        abilityType = abilityType,
        tier = 2,
        grants = {{
            id = "primary",
            abilityName = abilityName,
            order = 10,
            role = "primary",
            initialLevel = 0,
            refundLearnedLevels = true,
            forceVisible = abilityType == "active",
            disableToggleOnCleanup = disableToggleOnCleanup,
            cleanupModifiers = cleanupModifiers
        }}
    }
    if abilityType == "active" then
        definition.primaryHotkeyGrantId = "primary"
    end
    return definition
end
____exports.AWAKENING_LOTTERY_DEFINITIONS = {
    createSingleAbilityDefinition(nil, "break_speed_limit", "passive", {"modifier_break_speed_limit", "modifier_break_speed_limit_stacks"}),
    createSingleAbilityDefinition(nil, "dark_seer_normal_punch3", "passive", {"modifier_dark_seer_normal_punch3"}),
    createSingleAbilityDefinition(nil, "death_burst_health_growth", "passive", {"modifier_death_burst_health_growth", "modifier_death_burst_health_rage"}),
    createSingleAbilityDefinition(nil, "death_burst_attack_growth", "passive", {"modifier_death_burst_attack_growth", "modifier_death_burst_rage"}),
    createSingleAbilityDefinition(nil, "special_bonus_unique_sven_upgrade", "passive", {"modifier_special_bonus_unique_sven_upgrade", "modifier_special_bonus_unique_sven_upgrade_bonus_damage"}),
    createSingleAbilityDefinition(nil, "special_bonus_unique_troll_warlord_upgrade", "passive", {"modifier_special_bonus_unique_troll_warlord_upgrade", "modifier_special_bonus_unique_troll_warlord_upgrade_damage"}),
    createSingleAbilityDefinition(nil, "necrolyte_heartstopper_aura_datadriven", "passive", {"modifier_heartstopper_aura_datadriven"}),
    createSingleAbilityDefinition(nil, "special_bonus_unique_jakiro_upgrade", "passive"),
    createSingleAbilityDefinition(nil, "arc_warden_scepter2_fixed", "active", {"modifier_arc_warden_scepter2_fixed"}),
    createSingleAbilityDefinition(nil, "spectre_desolate_curse", "active", {"modifier_spectre_desolate_curse"}),
    createSingleAbilityDefinition(
        nil,
        "medusa_split_shot2",
        "active",
        {"modifier_medusa_split_shot"},
        true
    ),
    createSingleAbilityDefinition(nil, "special_bonus_unique_enchantress_upgrade", "active", {"modifier_special_bonus_unique_enchantress_upgrade_autocast"}),
    createSingleAbilityDefinition(nil, "juggernaut_blade_fury_custom", "active", {"modifier_juggernaut_blade_fury_custom"}),
    createSingleAbilityDefinition(nil, "special_bonus_unique_windranger_upgrade", "active", {"modifier_special_bonus_unique_windranger_upgrade_channel"}),
    createSingleAbilityDefinition(nil, "abyss_sword_hidden_sharp_upgrade", "active", {"modifier_abyss_sword_hidden_sharp_upgrade", "modifier_abyss_sword_hidden_sharp_upgrade_interval"}),
    createSingleAbilityDefinition(nil, "imba_batrider_flaming_lasso_enhanced", "active", {"modifier_imba_batrider_flaming_lasso_enhanced", "modifier_imba_batrider_flaming_lasso_movespeed"}),
    createSingleAbilityDefinition(nil, "special_bonus_unique_phantom_assassin_upgrade", "active"),
    createSingleAbilityDefinition(nil, "pudge_meat_hook_lua_upgrade", "active", {"modifier_meat_hook_followthrough_lua", "modifier_meat_hook_lua"}),
    createSingleAbilityDefinition(nil, "special_bonus_unique_warlock_upgrade_transform", "active", {"modifier_special_bonus_unique_warlock_upgrade_transform_form"}),
    createSingleAbilityDefinition(nil, "techies_land_mines2", "active"),
    createSingleAbilityDefinition(nil, "russian_roulette", "active", {"modifier_russian_roulette_caster", "modifier_russian_roulette"}),
    createSingleAbilityDefinition(nil, "ability_copy_item", "active"),
    createSingleAbilityDefinition(nil, "rob_equipment", "active", {"modifier_rob_equipment_thinker", "modifier_rob_equipment_track_kill", "modifier_rob_equipment_speed_slow"}),
    createSingleAbilityDefinition(nil, "sniper_assassinate_upgrade", "active", {"modifier_sniper_assassinate_target", "modifier_assassinate_caster_crit", "modifier_sniper_assassinate_upgrade_auto", "modifier_sniper_assassinate_upgrade_auto_cooldown"}),
    {
        itemId = "ability:axe_auto_culling_blade",
        enabled = true,
        displayAbility = "axe_auto_culling_blade",
        abilityType = "active",
        tier = 2,
        grants = {{
            id = "culling_blade",
            abilityName = "axe_culling_blade",
            order = 10,
            role = "dependency",
            initialLevel = 1,
            refundLearnedLevels = false,
            forceVisible = true
        }, {
            id = "primary",
            abilityName = "axe_auto_culling_blade",
            order = 20,
            role = "primary",
            initialLevel = 0,
            refundLearnedLevels = true,
            forceVisible = true,
            cleanupModifiers = {"modifier_axe_auto_culling_blade"}
        }},
        primaryHotkeyGrantId = "primary",
        extraHotkeys = {{grantId = "culling_blade", key = "5"}}
    }
}
____exports.AwakeningLotteryDefinitions = __TS__Class()
local AwakeningLotteryDefinitions = ____exports.AwakeningLotteryDefinitions
AwakeningLotteryDefinitions.name = "AwakeningLotteryDefinitions"
function AwakeningLotteryDefinitions.prototype.____constructor(self)
end
function AwakeningLotteryDefinitions.GetByItemId(self, itemId)
    return __TS__ArrayFind(
        ____exports.AWAKENING_LOTTERY_DEFINITIONS,
        function(____, definition) return definition.enabled and definition.itemId == itemId end
    )
end
function AwakeningLotteryDefinitions.GetToken(self, itemId)
    return TOKEN_PREFIX .. itemId
end
function AwakeningLotteryDefinitions.GetByToken(self, token)
    if not __TS__StringStartsWith(token, TOKEN_PREFIX) then
        return nil
    end
    return self:GetByItemId(__TS__StringSubstring(token, #TOKEN_PREFIX))
end
function AwakeningLotteryDefinitions.GetEligibleDefinitions(self, unlockedItemIds, abilityType, hero)
    local expectedType = abilityType == "abilityActive" and "active" or "passive"
    return __TS__ArrayFilter(
        ____exports.AWAKENING_LOTTERY_DEFINITIONS,
        function(____, definition)
            if not definition.enabled or definition.abilityType ~= expectedType then
                return false
            end
            if not __TS__ArrayIncludes(unlockedItemIds, definition.itemId) then
                return false
            end
            if not hero then
                return true
            end
            if hero:HasAbility(definition.displayAbility) then
                return false
            end
            return not __TS__ArraySome(
                definition.conflicts or ({}),
                function(____, abilityName) return hero:HasAbility(abilityName) end
            )
        end
    )
end
function AwakeningLotteryDefinitions.BuildPersonalTiers(self, baseTiers, unlockedItemIds, abilityType, hero)
    local tiers = __TS__ArrayMap(
        baseTiers,
        function(____, tier) return {
            level = tier.level,
            names = {unpack(tier.names)}
        } end
    )
    local tier2 = __TS__ArrayFind(
        tiers,
        function(____, tier) return tier.level == 2 end
    )
    if not tier2 then
        return tiers
    end
    for ____, definition in ipairs(self:GetEligibleDefinitions(unlockedItemIds, abilityType, hero)) do
        local ____tier2_names_0 = tier2.names
        ____tier2_names_0[#____tier2_names_0 + 1] = self:GetToken(definition.itemId)
    end
    return tiers
end
function AwakeningLotteryDefinitions.ResolveCandidate(self, candidate)
    local definition = self:GetByToken(candidate.name)
    if not definition then
        return candidate
    end
    return {name = definition.displayAbility, level = definition.tier, source = "awakening", entryId = definition.itemId}
end
function AwakeningLotteryDefinitions.GetPoolName(self, candidate)
    if candidate.source == "awakening" and candidate.entryId then
        return self:GetToken(candidate.entryId)
    end
    return candidate.name
end
function AwakeningLotteryDefinitions.IsGrantedAbilityName(self, abilityName)
    return __TS__ArraySome(
        ____exports.AWAKENING_LOTTERY_DEFINITIONS,
        function(____, definition) return definition.enabled and __TS__ArraySome(
            definition.grants,
            function(____, grant) return grant.abilityName == abilityName end
        ) end
    )
end
return ____exports
