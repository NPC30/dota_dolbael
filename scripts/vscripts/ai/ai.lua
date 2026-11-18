local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/AI.lua"
__TS__SourceMapTraceBack("ai/AI.lua", {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 11,["28"] = 11,["29"] = 13,["30"] = 13,["31"] = 13,["33"] = 22,["34"] = 21,["35"] = 25,["36"] = 26,["37"] = 26,["38"] = 26,["39"] = 26,["40"] = 25,["41"] = 29,["42"] = 30,["43"] = 33,["44"] = 33,["46"] = 34,["47"] = 35,["48"] = 36,["49"] = 36,["52"] = 29,["53"] = 40,["54"] = 41,["55"] = 44,["56"] = 45,["58"] = 47,["60"] = 50,["62"] = 51,["63"] = 52,["64"] = 53,["66"] = 55,["67"] = 56,["68"] = 56,["69"] = 56,["70"] = 58,["71"] = 63,["73"] = 56,["74"] = 56,["78"] = 40,["79"] = 69,["80"] = 70,["81"] = 71,["83"] = 73,["84"] = 74,["86"] = 76,["87"] = 77,["89"] = 79,["90"] = 80,["92"] = 82,["93"] = 83,["95"] = 85,["96"] = 86,["98"] = 88,["99"] = 89,["101"] = 91,["102"] = 92,["104"] = 94,["105"] = 95,["107"] = 98,["108"] = 69,["109"] = 101,["110"] = 102,["111"] = 103,["113"] = 105,["114"] = 101,["115"] = 14});
local ____exports = {}
local ____bot_2Dbase = require("ai.hero.bot-base")
local BotBaseAIModifier = ____bot_2Dbase.BotBaseAIModifier
local ____hero_2Ddrow_2Dranger = require("ai.hero.hero-drow-ranger")
local DrowRangerAIModifier = ____hero_2Ddrow_2Dranger.DrowRangerAIModifier
local ____hero_2Dlion = require("ai.hero.hero-lion")
local LionAIModifier = ____hero_2Dlion.LionAIModifier
local ____hero_2Dluna = require("ai.hero.hero-luna")
local LunaAIModifier = ____hero_2Dluna.LunaAIModifier
local ____hero_2Dmedusa = require("ai.hero.hero-medusa")
local MedusaAIModifier = ____hero_2Dmedusa.MedusaAIModifier
local ____hero_2Dnecrolyte = require("ai.hero.hero-necrolyte")
local NecrolyteAIModifier = ____hero_2Dnecrolyte.NecrolyteAIModifier
local ____hero_2Dshadow_2Dshaman = require("ai.hero.hero-shadow-shaman")
local ShadowShamanAIModifier = ____hero_2Dshadow_2Dshaman.ShadowShamanAIModifier
local ____hero_2Dskeleton = require("ai.hero.hero-skeleton")
local SkeletonAIModifier = ____hero_2Dskeleton.SkeletonAIModifier
local ____hero_2Dsniper = require("ai.hero.hero-sniper")
local SniperAIModifier = ____hero_2Dsniper.SniperAIModifier
local ____hero_2Dviper = require("ai.hero.hero-viper")
local ViperAIModifier = ____hero_2Dviper.ViperAIModifier
local ____FSA = require("ai.mode.FSA")
local FSA = ____FSA.FSA
____exports.AI = __TS__Class()
local AI = ____exports.AI
AI.name = "AI"
function AI.prototype.____constructor(self)
    self.FSA = __TS__New(FSA)
end
function AI.prototype.EnableAI(self, hero)
    self:appleAIModifier(
        hero,
        self:getModifierName(hero)
    )
end
function AI.prototype.PauseAI(self, hero)
    local modifier = hero:FindModifierByName(self:getModifierName(hero))
    if modifier ~= nil then
        modifier:PauseThink()
    end
    for ____, config in ipairs(____exports.AI.legacyThinkIntervals) do
        local legacyModifier = hero:FindModifierByName(config.modifierName)
        if legacyModifier ~= nil then
            legacyModifier:StartIntervalThink(-1)
        end
    end
end
function AI.prototype.ResumeAI(self, hero)
    local modifier = hero:FindModifierByName(self:getModifierName(hero))
    if modifier == nil or modifier:IsNull() then
        self:EnableAI(hero)
    else
        modifier:ResumeThink()
    end
    for ____, config in ipairs(____exports.AI.legacyThinkIntervals) do
        do
            local legacyModifier = hero:FindModifierByName(config.modifierName)
            if legacyModifier == nil or legacyModifier:IsNull() then
                goto __continue10
            end
            legacyModifier:StartIntervalThink(-1)
            Timers:CreateTimer(
                RandomFloat(0.03, config.interval),
                function()
                    if not hero:IsNull() and hero:IsAlive() and not legacyModifier:IsNull() and hero:HasModifier(config.modifierName) then
                        legacyModifier:StartIntervalThink(config.interval)
                    end
                end
            )
        end
        ::__continue10::
    end
end
function AI.prototype.getModifierName(self, hero)
    if hero:GetUnitName() == "npc_dota_hero_lion" then
        return LionAIModifier.name
    end
    if hero:GetUnitName() == "npc_dota_hero_viper" then
        return ViperAIModifier.name
    end
    if hero:GetUnitName() == "npc_dota_hero_luna" then
        return LunaAIModifier.name
    end
    if hero:GetUnitName() == "npc_dota_hero_sniper" then
        return SniperAIModifier.name
    end
    if hero:GetUnitName() == "npc_dota_hero_medusa" then
        return MedusaAIModifier.name
    end
    if hero:GetUnitName() == "npc_dota_hero_drow_ranger" then
        return DrowRangerAIModifier.name
    end
    if hero:GetUnitName() == "npc_dota_hero_skeleton_king" then
        return SkeletonAIModifier.name
    end
    if hero:GetUnitName() == "npc_dota_hero_shadow_shaman" then
        return ShadowShamanAIModifier.name
    end
    if hero:GetUnitName() == "npc_dota_hero_necrolyte" then
        return NecrolyteAIModifier.name
    end
    return BotBaseAIModifier.name
end
function AI.prototype.appleAIModifier(self, hero, modifierName)
    if hero:HasModifier(modifierName) then
        hero:RemoveModifierByName(modifierName)
    end
    hero:AddNewModifier(hero, nil, modifierName, {})
end
AI.legacyThinkIntervals = {{modifierName = "modifier_bot_think_item_use", interval = 0.6}, {modifierName = "modifier_bot_think_strategy", interval = 5}, {modifierName = "modifier_bot_think_ward", interval = 120}}
return ____exports
