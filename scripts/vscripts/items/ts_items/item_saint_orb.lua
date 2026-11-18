local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "items/ts_items/item_saint_orb.lua"
__TS__SourceMapTraceBack("items/ts_items/item_saint_orb.lua", {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 8,["17"] = 8,["18"] = 188,["19"] = 193,["20"] = 194,["22"] = 196,["23"] = 196,["25"] = 198,["26"] = 199,["27"] = 201,["29"] = 205,["30"] = 211,["31"] = 212,["32"] = 213,["33"] = 214,["34"] = 214,["35"] = 214,["36"] = 214,["37"] = 214,["38"] = 215,["39"] = 218,["40"] = 219,["41"] = 220,["42"] = 222,["43"] = 222,["44"] = 222,["45"] = 222,["46"] = 222,["47"] = 222,["48"] = 222,["49"] = 223,["50"] = 188,["51"] = 10,["52"] = 11,["53"] = 10,["54"] = 11,["55"] = 12,["56"] = 13,["57"] = 12,["58"] = 16,["59"] = 17,["60"] = 18,["61"] = 19,["62"] = 21,["65"] = 23,["66"] = 25,["67"] = 26,["68"] = 16,["69"] = 11,["70"] = 10,["71"] = 11,["73"] = 11,["74"] = 30,["75"] = 31,["76"] = 30,["77"] = 31,["79"] = 31,["80"] = 32,["81"] = 35,["82"] = 36,["83"] = 30,["84"] = 38,["85"] = 31,["86"] = 41,["87"] = 42,["88"] = 43,["91"] = 46,["92"] = 47,["94"] = 38,["95"] = 51,["96"] = 52,["97"] = 51,["98"] = 58,["99"] = 59,["100"] = 58,["101"] = 64,["102"] = 65,["103"] = 66,["105"] = 69,["106"] = 70,["107"] = 71,["108"] = 71,["110"] = 74,["111"] = 75,["112"] = 76,["114"] = 79,["115"] = 81,["116"] = 83,["117"] = 86,["119"] = 89,["120"] = 64,["121"] = 31,["122"] = 30,["123"] = 31,["125"] = 31,["126"] = 112,["127"] = 113,["128"] = 112,["129"] = 113,["130"] = 114,["131"] = 115,["132"] = 114,["133"] = 118,["134"] = 119,["135"] = 118,["136"] = 122,["137"] = 123,["138"] = 122,["139"] = 126,["140"] = 127,["141"] = 126,["142"] = 130,["143"] = 131,["144"] = 130,["145"] = 137,["146"] = 138,["147"] = 137,["148"] = 141,["149"] = 142,["152"] = 146,["153"] = 147,["154"] = 147,["155"] = 147,["156"] = 147,["157"] = 147,["158"] = 147,["159"] = 147,["160"] = 149,["161"] = 150,["162"] = 156,["163"] = 157,["164"] = 157,["165"] = 157,["166"] = 157,["167"] = 157,["168"] = 157,["169"] = 157,["170"] = 157,["171"] = 157,["172"] = 166,["173"] = 168,["174"] = 168,["175"] = 168,["176"] = 168,["177"] = 168,["178"] = 168,["179"] = 168,["180"] = 168,["181"] = 141,["182"] = 171,["183"] = 172,["184"] = 173,["185"] = 174,["186"] = 175,["187"] = 176,["189"] = 178,["190"] = 171,["191"] = 113,["192"] = 112,["193"] = 113,["195"] = 113,["196"] = 226,["197"] = 226,["198"] = 226,["199"] = 226,["200"] = 226,["201"] = 226,["202"] = 226,["203"] = 226,["204"] = 235,["205"] = 236,["206"] = 237,["208"] = 240,["209"] = 241,["210"] = 244,["211"] = 245,["213"] = 249,["214"] = 249,["215"] = 249,["216"] = 249,["217"] = 250,["219"] = 254,["220"] = 255,["222"] = 260,["223"] = 262,["225"] = 266,["226"] = 267,["227"] = 270,["228"] = 271,["229"] = 272,["230"] = 275,["231"] = 278,["232"] = 279,["233"] = 281,["234"] = 282,["236"] = 286,["237"] = 289,["238"] = 295,["239"] = 295,["240"] = 295,["241"] = 295,["242"] = 295,["243"] = 295,["244"] = 295,["245"] = 295,["246"] = 295,["247"] = 304,["248"] = 307,["249"] = 309,["250"] = 235});
local ____exports = {}
local ____unit_2Dhelper = require("modules.helper.unit-helper")
local IsSameTeam = ____unit_2Dhelper.IsSameTeam
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerAbility = ____dota_ts_adapter.registerAbility
local registerModifier = ____dota_ts_adapter.registerModifier
local ____base_item_modifier = require("items.ts_items.base_item_modifier")
local BaseItemModifier = ____base_item_modifier.BaseItemModifier
function ____exports.GetAbsorbSpell(self, keys, parent, item)
    if not IsServer() then
        return false
    end
    if not item then
        return false
    end
    local caster = keys.ability:GetCaster()
    if IsSameTeam(nil, caster, parent) then
        return false
    end
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_templar_assassin/templar_loadout.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    local parentPos = parent:GetAbsOrigin()
    ParticleManager:SetParticleControl(particle, 0, parentPos)
    ParticleManager:SetParticleControl(particle, 1, parentPos)
    ParticleManager:SetParticleControl(
        particle,
        2,
        Vector(10, 10, 10)
    )
    ParticleManager:ReleaseParticleIndex(particle)
    local healPercent = item:GetSpecialValueFor("heal_percent")
    local healAmount = parent:GetMaxHealth() * healPercent * 0.01
    parent:Heal(healAmount, item)
    SendOverheadEventMessage(
        nil,
        OVERHEAD_ALERT_HEAL,
        parent,
        healAmount,
        nil
    )
    return true
end
____exports.ItemSaintOrb = __TS__Class()
local ItemSaintOrb = ____exports.ItemSaintOrb
ItemSaintOrb.name = "ItemSaintOrb"
__TS__ClassExtends(ItemSaintOrb, BaseItem)
function ItemSaintOrb.prototype.GetIntrinsicModifierName(self)
    return "modifier_item_saint_orb_passive"
end
function ItemSaintOrb.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    local duration = self:GetSpecialValueFor("duration")
    if not target then
        return
    end
    target:EmitSound("Item.LotusOrb.Target")
    target:AddNewModifier(caster, self, "modifier_item_saint_orb_buff", {duration = duration})
    target:AddNewModifier(caster, self, "modifier_item_lotus_orb_active", {duration = duration})
end
ItemSaintOrb = __TS__DecorateLegacy(
    {registerAbility(nil, "item_saint_orb")},
    ItemSaintOrb
)
____exports.ItemSaintOrb = ItemSaintOrb
____exports.ModifierItemSaintOrbPassive = __TS__Class()
local ModifierItemSaintOrbPassive = ____exports.ModifierItemSaintOrbPassive
ModifierItemSaintOrbPassive.name = "ModifierItemSaintOrbPassive"
__TS__ClassExtends(ModifierItemSaintOrbPassive, BaseItemModifier)
function ModifierItemSaintOrbPassive.prototype.____constructor(self, ...)
    BaseItemModifier.prototype.____constructor(self, ...)
    self.statsModifierName = "modifier_item_saint_orb_stats"
    self.blockCooldown = 0
    self.lastBlockTime = 0
end
function ModifierItemSaintOrbPassive.prototype.OnCreated(self)
    BaseItemModifier.prototype.OnCreated(self)
    if IsServer() then
        local ability = self:GetAbility()
        if not ability then
            return
        end
        self.blockCooldown = ability:GetSpecialValueFor("block_cooldown")
        self.lastBlockTime = 0
    end
end
function ModifierItemSaintOrbPassive.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_ABSORB_SPELL}
end
function ModifierItemSaintOrbPassive.prototype.CheckState(self)
    return {[MODIFIER_STATE_UNSLOWABLE] = true}
end
function ModifierItemSaintOrbPassive.prototype.GetAbsorbSpell(self, keys)
    if not IsServer() then
        return 0
    end
    local parent = self:GetParent()
    local item = self:GetAbility()
    if not item then
        return 0
    end
    local currentTime = GameRules:GetGameTime()
    if currentTime - self.lastBlockTime < self.blockCooldown then
        return 0
    end
    local absorbResult = ____exports.GetAbsorbSpell(nil, keys, parent, item)
    if absorbResult then
        self.lastBlockTime = currentTime
        parent:EmitSound("DOTA_Item.LinkensSphere.Activate")
    end
    return absorbResult and 1 or 0
end
ModifierItemSaintOrbPassive = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_item_saint_orb_passive")},
    ModifierItemSaintOrbPassive
)
____exports.ModifierItemSaintOrbPassive = ModifierItemSaintOrbPassive
____exports.ModifierItemSaintOrbBuff = __TS__Class()
local ModifierItemSaintOrbBuff = ____exports.ModifierItemSaintOrbBuff
ModifierItemSaintOrbBuff.name = "ModifierItemSaintOrbBuff"
__TS__ClassExtends(ModifierItemSaintOrbBuff, BaseModifier)
function ModifierItemSaintOrbBuff.prototype.IsDebuff(self)
    return false
end
function ModifierItemSaintOrbBuff.prototype.IsHidden(self)
    return false
end
function ModifierItemSaintOrbBuff.prototype.IsPurgable(self)
    return false
end
function ModifierItemSaintOrbBuff.prototype.IsPurgeException(self)
    return false
end
function ModifierItemSaintOrbBuff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_ABSORB_SPELL}
end
function ModifierItemSaintOrbBuff.prototype.GetTexture(self)
    return "item_saint_orb"
end
function ModifierItemSaintOrbBuff.prototype.OnCreated(self)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    parent:Purge(
        false,
        true,
        false,
        false,
        false
    )
    local position = parent:GetAbsOrigin()
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_templar_assassin/templar_assassin_refraction.vpcf", PATTACH_CUSTOMORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControl(particle, 0, position)
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        parent,
        PATTACH_ABSORIGIN_FOLLOW,
        "attach_hitloc",
        parent:GetAbsOrigin(),
        true
    )
    ParticleManager:SetParticleControl(particle, 5, position)
    self:AddParticle(
        particle,
        false,
        false,
        20,
        false,
        false
    )
end
function ModifierItemSaintOrbBuff.prototype.GetAbsorbSpell(self, keys)
    local parent = self:GetParent()
    local item = self:GetAbility()
    local absorbResult = ____exports.GetAbsorbSpell(nil, keys, parent, item)
    if absorbResult then
        self:Destroy()
    end
    return absorbResult and 1 or 0
end
ModifierItemSaintOrbBuff = __TS__DecorateLegacy(
    {registerModifier(nil, "modifier_item_saint_orb_buff")},
    ModifierItemSaintOrbBuff
)
____exports.ModifierItemSaintOrbBuff = ModifierItemSaintOrbBuff
local reflectExceptions = {
    "rubick_spell_steal",
    "shadow_shaman_shackles",
    "legion_commander_duel",
    "phantom_assassin_phantom_strike",
    "riki_blink_strike",
    "morphling_replicate"
}
function ____exports.ReflectSpellToCaster(self, keys, parent)
    if not IsServer() then
        return false
    end
    local ability = keys.ability
    local caster = ability:GetCaster()
    if IsSameTeam(nil, caster, parent) then
        return false
    end
    if not ability or __TS__ArrayIncludes(
        reflectExceptions,
        ability:GetAbilityName()
    ) then
        return false
    end
    if not parent:IsAlive() then
        return false
    end
    if parent.reflected_spell then
        parent:RemoveAbilityByHandle(parent.reflected_spell)
    end
    local sourceAbility = ability
    local reflectedAbility = parent:AddAbility(sourceAbility:GetAbilityName())
    reflectedAbility:SetLevel(sourceAbility:GetLevel())
    reflectedAbility:SetStolen(true)
    reflectedAbility:SetHidden(true)
    parent:SetCursorCastTarget(sourceAbility:GetCaster())
    local castResult = reflectedAbility:CastAbility()
    parent:SetCursorCastTarget(nil)
    if castResult then
        parent:GiveMana(sourceAbility:GetManaCost(-1))
    end
    parent.reflected_spell = reflectedAbility
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_antimage/antimage_spellshield_reflect.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControlEnt(
        particle,
        1,
        parent,
        PATTACH_POINT_FOLLOW,
        "attach_hitloc",
        parent:GetAbsOrigin(),
        true
    )
    ParticleManager:ReleaseParticleIndex(particle)
    parent:EmitSound("Item.LotusOrb.Activate")
    return castResult
end
return ____exports
