local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "utils/lifesteal.lua"
__TS__SourceMapTraceBack("utils/lifesteal.lua", {["6"] = 6,["7"] = 7,["8"] = 7,["10"] = 8,["11"] = 8,["13"] = 10,["14"] = 10,["16"] = 11,["17"] = 11,["19"] = 12,["20"] = 12,["22"] = 13,["23"] = 13,["25"] = 14,["26"] = 14,["28"] = 15,["29"] = 6,["35"] = 23,["36"] = 25,["37"] = 25,["39"] = 27,["40"] = 27,["42"] = 30,["43"] = 33,["45"] = 34,["46"] = 37,["47"] = 40,["50"] = 42,["51"] = 23,["53"] = 46,["54"] = 52,["55"] = 55,["56"] = 56,["58"] = 59,["59"] = 46,["61"] = 63,["62"] = 69,["65"] = 71,["66"] = 71,["67"] = 71,["68"] = 71,["69"] = 71,["70"] = 71,["71"] = 71,["72"] = 71,["73"] = 74,["74"] = 81,["75"] = 63,["77"] = 85,["78"] = 91,["79"] = 92,["82"] = 95,["83"] = 96,["86"] = 99,["89"] = 102,["90"] = 103,["93"] = 105,["96"] = 107,["99"] = 109,["100"] = 109,["101"] = 109,["102"] = 109,["103"] = 109,["104"] = 109,["105"] = 109,["106"] = 111,["107"] = 111,["108"] = 111,["109"] = 111,["110"] = 111,["111"] = 111,["112"] = 111,["113"] = 85,["115"] = 115,["116"] = 121,["117"] = 122,["120"] = 125,["123"] = 128,["124"] = 130,["127"] = 133,["128"] = 134,["131"] = 136,["134"] = 138,["137"] = 140,["138"] = 140,["139"] = 140,["140"] = 140,["141"] = 140,["142"] = 140,["143"] = 140,["144"] = 141,["145"] = 141,["146"] = 141,["147"] = 141,["148"] = 141,["149"] = 141,["150"] = 141,["151"] = 115,["152"] = 159,["153"] = 164,["154"] = 159,["155"] = 167,["156"] = 172,["157"] = 167});
local ____exports = {}
--- 判断目标是否可以触发吸血效果
local function canLifestealFromTarget(self, target, isAttack)
    if not target then
        return false
    end
    if target:IsBuilding() then
        return false
    end
    if not isAttack and target:IsIllusion() then
        return false
    end
    if target:IsInvulnerable() then
        return false
    end
    if target:IsOther() then
        return false
    end
    if target:IsWard() then
        return false
    end
    if target:IsCourier() then
        return false
    end
    return true
end
--- 判断伤害是否可以触发吸血效果
-- 
-- @param damageEvent 伤害事件
-- @param isAttack 是否是攻击
-- @returns 是否可以触发吸血效果
local function canLifestealFromDamage(self, damageEvent, isAttack)
    if bit.band(damageEvent.damage_flags, DOTA_DAMAGE_FLAG_REFLECTION) == DOTA_DAMAGE_FLAG_REFLECTION then
        return false
    end
    if bit.band(damageEvent.damage_flags, DOTA_DAMAGE_FLAG_HPLOSS) == DOTA_DAMAGE_FLAG_HPLOSS then
        return false
    end
    if bit.band(damageEvent.damage_flags, DOTA_DAMAGE_FLAG_SECONDARY_PROJECTILE_ATTACK) == DOTA_DAMAGE_FLAG_SECONDARY_PROJECTILE_ATTACK then
        return false
    end
    if not isAttack then
        if bit.band(damageEvent.damage_flags, DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION) == DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION then
            return false
        end
    end
    return true
end
--- 计算实际吸血量
local function calculateLifesteal(self, damage, lifeStealPercent, isHeroTarget, isSpellLifesteal)
    local finalLifesteal = damage * (lifeStealPercent / 100)
    if not isHeroTarget then
        finalLifesteal = finalLifesteal * (isSpellLifesteal and 0.2 or 0.6)
    end
    return finalLifesteal
end
--- 应用吸血效果和特效
local function applyLifesteal(self, owner, heal, ability, isSpellLifesteal)
    if heal <= 0 then
        return
    end
    owner:HealWithParams(
        heal,
        ability or ({}),
        true,
        true,
        owner,
        isSpellLifesteal
    )
    local particleId = ParticleManager:CreateParticle(isSpellLifesteal and "particles/items3_fx/octarine_core_lifesteal.vpcf" or "particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, owner)
    ParticleManager:ReleaseParticleIndex(particleId)
end
--- 处理攻击吸血
local function handleAttackLifesteal(self, event, lifeStealPercent, owner)
    local attacker = event.attacker
    if attacker ~= owner then
        return
    end
    local ability = event.inflictor
    if event.inflictor then
        return
    end
    if event.damage_type ~= DAMAGE_TYPE_PHYSICAL then
        return
    end
    local target = event.unit
    if target:GetTeam() == owner:GetTeam() then
        return
    end
    if not canLifestealFromDamage(nil, event, true) then
        return
    end
    if not canLifestealFromTarget(nil, target, true) then
        return
    end
    local heal = calculateLifesteal(
        nil,
        event.damage,
        lifeStealPercent,
        target:IsHero(),
        false
    )
    applyLifesteal(
        nil,
        owner,
        heal,
        ability,
        false
    )
end
--- 处理技能吸血
local function handleSpellLifesteal(self, event, lifeStealPercent, owner)
    local attacker = event.attacker
    if attacker ~= owner then
        return
    end
    if event.damage_type == DAMAGE_TYPE_PURE then
        return
    end
    local ability = event.inflictor
    if not ability and event.damage_type == DAMAGE_TYPE_PHYSICAL then
        return
    end
    local target = event.unit
    if target:GetTeam() == owner:GetTeam() then
        return
    end
    if not canLifestealFromDamage(nil, event, false) then
        return
    end
    if not canLifestealFromTarget(nil, target, false) then
        return
    end
    local heal = calculateLifesteal(
        nil,
        event.damage,
        lifeStealPercent,
        target:IsHero(),
        true
    )
    applyLifesteal(
        nil,
        owner,
        heal,
        ability,
        true
    )
end
_G.TsLifeStealOnAttackLanded = function(____, event, lifeStealPercent, owner)
    handleAttackLifesteal(nil, event, lifeStealPercent, owner)
end
_G.TsSpellLifeSteal = function(____, event, lifeStealPercent, owner)
    handleSpellLifesteal(nil, event, lifeStealPercent, owner)
end
return ____exports
