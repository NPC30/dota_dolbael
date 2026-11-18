local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/lottery-ability-grant-helper.lua"
__TS__SourceMapTraceBack("modules/lottery/lottery-ability-grant-helper.lua", {["7"] = 8,["8"] = 8,["9"] = 8,["11"] = 8,["12"] = 51,["13"] = 57,["14"] = 59,["16"] = 60,["17"] = 60,["19"] = 61,["20"] = 65,["21"] = 65,["23"] = 66,["24"] = 67,["25"] = 68,["26"] = 68,["27"] = 69,["30"] = 72,["31"] = 73,["32"] = 74,["37"] = 78,["38"] = 79,["40"] = 82,["41"] = 83,["43"] = 86,["44"] = 87,["45"] = 88,["47"] = 51,["48"] = 92,["49"] = 96,["50"] = 97,["51"] = 99,["52"] = 100,["54"] = 92,["55"] = 9,["56"] = 22,["57"] = 22,["58"] = 22,["59"] = 22,["60"] = 22,["61"] = 22,["62"] = 22,["63"] = 22,["64"] = 22,["65"] = 22,["66"] = 22,["67"] = 22,["68"] = 22,["69"] = 22,["70"] = 22,["71"] = 22,["72"] = 22,["73"] = 22,["74"] = 22,["75"] = 22,["76"] = 22,["77"] = 22,["78"] = 22,["79"] = 22,["80"] = 22,["81"] = 22,["82"] = 22,["83"] = 22,["84"] = 114,["85"] = 120,["86"] = 114});
local ____exports = {}
____exports.LotteryAbilityGrantHelper = __TS__Class()
local LotteryAbilityGrantHelper = ____exports.LotteryAbilityGrantHelper
LotteryAbilityGrantHelper.name = "LotteryAbilityGrantHelper"
function LotteryAbilityGrantHelper.prototype.____constructor(self)
end
function LotteryAbilityGrantHelper.ApplyGrantSideEffects(self, hero, abilityName, ability, playerId)
    local steamAccountID = tostring(PlayerResource:GetSteamAccountID(playerId))
    for ____, binding in ipairs(self.ABILITY_BINDINGS) do
        do
            if abilityName ~= binding.sourceAbility then
                goto __continue4
            end
            local steamAllowed = not binding.steamIds or #binding.steamIds == 0 or __TS__ArrayIncludes(binding.steamIds, steamAccountID)
            if not steamAllowed then
                goto __continue4
            end
            if abilityName == "death_prophet_witchcraft2" then
                ability:SetLevel(1)
                local ____opt_0 = GameRules.Option
                if ____opt_0 and ____opt_0.abyssMode then
                    goto __continue4
                end
            end
            local bound = hero:AddAbility(binding.boundAbility)
            if bound and binding.boundLevel ~= nil and binding.boundLevel ~= 0 then
                bound:SetLevel(binding.boundLevel)
            end
        end
        ::__continue4::
    end
    if __TS__ArrayIncludes(self.FORCE_VISIBLE_ABILITIES, abilityName) then
        ability:SetHidden(false)
    end
    if abilityName == "rubick_curiosity" then
        self:ApplyRubickCuriosityStacks(hero, ability)
    end
    if abilityName == "artoria_instinct_lottery" then
        ability:SetLevel(1)
        ability:SetHidden(false)
    end
end
function LotteryAbilityGrantHelper.ApplyRubickCuriosityStacks(self, hero, ability)
    local modifierName = "modifier_rubick_curiosity"
    local modifier = hero:FindModifierByName(modifierName) or hero:AddNewModifier(hero, ability, modifierName, {})
    if modifier ~= nil then
        modifier:SetStackCount(hero:GetLevel())
    end
end
LotteryAbilityGrantHelper.ABILITY_BINDINGS = {{sourceAbility = "death_prophet_witchcraft2", boundAbility = "death_prophet_witchcraft", boundLevel = 1}, {sourceAbility = "grimstroke_spirit_walk", boundAbility = "special_bonus_unique_grimstroke_upgrade", boundLevel = 1}}
LotteryAbilityGrantHelper.FORCE_VISIBLE_ABILITIES = {
    "death_prophet_witchcraft",
    "night_stalker_hunter_in_the_night",
    "spectre_desolate",
    "obsidian_destroyer_equilibrium",
    "slark_essence_shift",
    "rubick_curiosity",
    "dragon_knight_dragon_blood",
    "venomancer_poison_sting",
    "centaur_horsepower",
    "omniknight_degen_aura",
    "rattletrap_armor_power",
    "huskar_blood_magic",
    "largo_encore",
    "primal_beast_colossal",
    "juggernaut_bladeform",
    "clinkz_infernal_shred",
    "riki_innate_backstab",
    "morphling_flow",
    "morphling_ebb_and_flow",
    "vengefulspirit_retribution",
    "sniper_keen_scope",
    "pantsushot",
    "artoria_instinct",
    "artoria_instinct_lottery",
    "zuus_static_field",
    "sandking_caustic_finale"
}
_G.ApplyLotteryAbilityGrantSideEffects = function(____, hero, abilityName, ability, playerId)
    ____exports.LotteryAbilityGrantHelper:ApplyGrantSideEffects(hero, abilityName, ability, playerId)
end
return ____exports
