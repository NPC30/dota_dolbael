local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "items/ts_items/item_heavens_halberd_v2.lua"
__TS__SourceMapTraceBack("items/ts_items/item_heavens_halberd_v2.lua", {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 7,["20"] = 6,["21"] = 10,["22"] = 11,["23"] = 12,["24"] = 15,["25"] = 20,["26"] = 21,["27"] = 22,["28"] = 23,["29"] = 24,["30"] = 25,["31"] = 27,["32"] = 30,["33"] = 31,["34"] = 32,["35"] = 33,["36"] = 35,["37"] = 36,["38"] = 39,["39"] = 39,["40"] = 39,["41"] = 39,["42"] = 39,["43"] = 39,["44"] = 39,["45"] = 39,["46"] = 39,["47"] = 39,["48"] = 39,["49"] = 52,["50"] = 53,["51"] = 53,["52"] = 53,["53"] = 53,["54"] = 53,["55"] = 53,["56"] = 53,["57"] = 53,["58"] = 53,["59"] = 53,["60"] = 64,["61"] = 65,["62"] = 66,["64"] = 10,["65"] = 5,["66"] = 4,["67"] = 5,["69"] = 5,["70"] = 73,["71"] = 74,["72"] = 73,["73"] = 74,["75"] = 74,["76"] = 75,["77"] = 78,["78"] = 79,["79"] = 73,["80"] = 89,["81"] = 90,["82"] = 92,["83"] = 93,["84"] = 94,["85"] = 95,["86"] = 96,["87"] = 97,["88"] = 98,["89"] = 99,["90"] = 74,["91"] = 89,["92"] = 104,["93"] = 105,["94"] = 105,["95"] = 105,["96"] = 105,["97"] = 105,["98"] = 105,["99"] = 104,["100"] = 108,["101"] = 109,["102"] = 110,["103"] = 108,["104"] = 113,["105"] = 114,["108"] = 115,["111"] = 118,["112"] = 123,["113"] = 123,["114"] = 123,["115"] = 123,["116"] = 123,["117"] = 124,["118"] = 125,["119"] = 126,["120"] = 128,["121"] = 129,["122"] = 129,["123"] = 129,["124"] = 129,["125"] = 129,["126"] = 129,["130"] = 113,["131"] = 142,["132"] = 143,["133"] = 143,["134"] = 143,["135"] = 143,["136"] = 143,["137"] = 143,["138"] = 143,["139"] = 143,["140"] = 143,["141"] = 143,["142"] = 142,["143"] = 155,["144"] = 156,["145"] = 155,["146"] = 159,["147"] = 160,["148"] = 159,["149"] = 163,["150"] = 164,["151"] = 163,["152"] = 167,["153"] = 168,["154"] = 167,["155"] = 171,["156"] = 172,["157"] = 171,["158"] = 175,["159"] = 176,["160"] = 175,["161"] = 74,["162"] = 73,["163"] = 74,["165"] = 74});
local ____exports = {}
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____base_item_modifier = require("items.ts_items.base_item_modifier")
local BaseItemModifier = ____base_item_modifier.BaseItemModifier
____exports.ItemHeavensHalberdV2 = __TS__Class()
local ItemHeavensHalberdV2 = ____exports.ItemHeavensHalberdV2
ItemHeavensHalberdV2.name = "ItemHeavensHalberdV2"
__TS__ClassExtends(ItemHeavensHalberdV2, BaseItem)
function ItemHeavensHalberdV2.prototype.GetIntrinsicModifierName(self)
    return "modifier_item_heavens_halberd_v2"
end
function ItemHeavensHalberdV2.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    caster:EmitSound("DOTA_Item.MeteorHammer.Cast")
    local particle = ParticleManager:CreateParticle("particles/neutral_fx/roshan_slam.vpcf", PATTACH_POINT, caster)
    local origin = caster:GetAbsOrigin()
    ParticleManager:SetParticleControl(particle, 0, origin)
    ParticleManager:SetParticleControl(particle, 1, origin)
    ParticleManager:SetParticleControl(particle, 2, origin)
    ParticleManager:SetParticleControl(particle, 3, origin)
    ParticleManager:ReleaseParticleIndex(particle)
    caster:StartGesture(ACT_DOTA_TELEPORT_END)
    local durBase = self:GetSpecialValueFor("disarm_con_base")
    local durStr = caster:GetStrength() / self:GetSpecialValueFor("disarm_con_per_str")
    local durMax = self:GetSpecialValueFor("disarm_con_max")
    local dur = math.min(durBase + durStr, durMax)
    local knockbackRange = self:GetSpecialValueFor("knockback_range")
    local knockbackDistance = self:GetSpecialValueFor("knockback_distance")
    local enemies = FindUnitsInRadius(
        caster:GetTeamNumber(),
        caster:GetAbsOrigin(),
        nil,
        knockbackRange,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        bit.bor(DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_BASIC),
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_ANY_ORDER,
        false
    )
    for ____, enemy in ipairs(enemies) do
        local knockback = {
            should_stun = 0.01,
            knockback_duration = 0.5,
            duration = 0.5,
            knockback_distance = knockbackDistance,
            knockback_height = 100,
            center_x = caster:GetAbsOrigin().x,
            center_y = caster:GetAbsOrigin().y,
            center_z = caster:GetAbsOrigin().z
        }
        enemy:AddNewModifier(enemy, self, "modifier_knockback", knockback)
        local finalDur = dur * (1 - enemy:GetStatusResistance())
        enemy:AddNewModifier(enemy, self, "modifier_heavens_halberd_debuff", {duration = finalDur})
    end
end
ItemHeavensHalberdV2 = __TS__DecorateLegacy(
    {registerAbility(nil, "item_heavens_halberd_v2")},
    ItemHeavensHalberdV2
)
____exports.ItemHeavensHalberdV2 = ItemHeavensHalberdV2
____exports.ModifierItemHeavensHalberdV2 = __TS__Class()
local ModifierItemHeavensHalberdV2 = ____exports.ModifierItemHeavensHalberdV2
ModifierItemHeavensHalberdV2.name = "ModifierItemHeavensHalberdV2"
__TS__ClassExtends(ModifierItemHeavensHalberdV2, BaseItemModifier)
function ModifierItemHeavensHalberdV2.prototype.____constructor(self, ...)
    BaseItemModifier.prototype.____constructor(self, ...)
    self.statsModifierName = "modifier_item_heavens_halberd_v2_stats"
    self.disarmed = true
    self.cd = 5
end
function ModifierItemHeavensHalberdV2.prototype.OnCreated(self)
    self.ability = self:GetAbility()
    self.bonusEvasion = self.ability:GetSpecialValueFor("bonus_evasion")
    self.hpRegenAmp = self.ability:GetSpecialValueFor("hp_regen_amp")
    self.attch = self.ability:GetSpecialValueFor("attch")
    self.disarm = self.ability:GetSpecialValueFor("disarm")
    self.statusResistance = self.ability:GetSpecialValueFor("status_resistance")
    self.spellResist = self.ability:GetSpecialValueFor("spell_resist")
    self.spellLifesteal = self.ability:GetSpecialValueFor("spell_lifesteal")
    self.mpRe = self.ability:GetSpecialValueFor("mana_re")
    BaseItemModifier.prototype.OnCreated(self)
end
function ModifierItemHeavensHalberdV2.prototype.OnTakeDamage(self, event)
    TsSpellLifeSteal(
        nil,
        event,
        self.spellLifesteal,
        self:GetParent()
    )
end
function ModifierItemHeavensHalberdV2.prototype.OnIntervalThink(self)
    self.disarmed = true
    self:StartIntervalThink(-1)
end
function ModifierItemHeavensHalberdV2.prototype.OnAttackLanded(self, event)
    if not IsServer() then
        return
    end
    if not self.disarmed then
        return
    end
    if event.attacker == self:GetParent() and not event.attacker:IsIllusion() and not event.target:IsBuilding() and not event.target:IsMagicImmune() then
        if RollPseudoRandomPercentage(
            self.attch,
            0,
            self.ability:GetCaster()
        ) then
            if self.disarmed then
                self.disarmed = false
                self:StartIntervalThink(self.cd)
                local duration = self.disarm * (1 - event.target:GetStatusResistance())
                event.target:AddNewModifier(
                    self:GetParent(),
                    self.ability,
                    "modifier_heavens_halberd_debuff",
                    {duration = duration}
                )
            end
        end
    end
end
function ModifierItemHeavensHalberdV2.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_EVASION_CONSTANT,
        MODIFIER_PROPERTY_HP_REGEN_AMPLIFY_PERCENTAGE,
        MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET,
        MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
        MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
        MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
        MODIFIER_EVENT_ON_ATTACK_LANDED,
        MODIFIER_EVENT_ON_TAKEDAMAGE
    }
end
function ModifierItemHeavensHalberdV2.prototype.GetModifierEvasion_Constant(self)
    return self.bonusEvasion
end
function ModifierItemHeavensHalberdV2.prototype.GetModifierHPRegenAmplify_Percentage(self)
    return self.hpRegenAmp
end
function ModifierItemHeavensHalberdV2.prototype.GetModifierConstantManaRegen(self)
    return self.mpRe
end
function ModifierItemHeavensHalberdV2.prototype.GetModifierHealAmplify_PercentageTarget(self)
    return self.hpRegenAmp
end
function ModifierItemHeavensHalberdV2.prototype.GetModifierStatusResistanceStacking(self)
    return self.statusResistance
end
function ModifierItemHeavensHalberdV2.prototype.GetModifierMagicalResistanceBonus(self)
    return self.spellResist
end
ModifierItemHeavensHalberdV2 = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_item_heavens_halberd_v2")},
    ModifierItemHeavensHalberdV2
)
____exports.ModifierItemHeavensHalberdV2 = ModifierItemHeavensHalberdV2
return ____exports
