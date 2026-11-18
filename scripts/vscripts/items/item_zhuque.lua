item_zhuque = class({})
LinkLuaModifier("modifier_item_zhuque_tracker", "items/item_zhuque.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_zhuque_buff", "items/item_zhuque.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_zhuque_building_buff", "items/item_zhuque.lua", LUA_MODIFIER_MOTION_NONE)
function item_zhuque:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local duration = self:GetSpecialValueFor("duration")
if caster == target then
self:EndCooldown()
self:RefundManaCost()
return
end
caster:EmitSound("Hero_DarkWillow.Shadow_Realm.Cast")
caster:AddNewModifier(caster, self, "modifier_item_zhuque_tracker", { duration = duration })
target:EmitSound("Hero_DarkWillow.Shadow_Realm")
if target:IsBuilding() then
target:AddNewModifier(caster, self, "modifier_item_zhuque_building_buff", { duration = duration })
else
target:AddNewModifier(caster, self, "modifier_item_zhuque_buff", { duration = duration })
target:AddNewModifier(caster, self, "modifier_item_zhuque_tracker", { duration = duration })
end
self:SpendCharge(1)
end
function item_zhuque:CastFilterResultTarget(target)
if target == self:GetCaster() then
return UF_FAIL_CUSTOM
end
return UnitFilter(target, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING,
DOTA_UNIT_TARGET_FLAG_NONE, self:GetCaster():GetTeamNumber())
end
function item_zhuque:GetCustomCastErrorTarget(target)
if target == self:GetCaster() then
return "#dota_hud_error_cant_cast_on_self"
end
return ""
end
modifier_item_zhuque_tracker = class({})
function modifier_item_zhuque_tracker:IsHidden() return false end
function modifier_item_zhuque_tracker:IsPurgable() return false end
function modifier_item_zhuque_tracker:IsDebuff() return false end
function modifier_item_zhuque_tracker:RemoveOnDeath()
return false
end
function modifier_item_zhuque_tracker:OnCreated(kv)
if not IsServer() then return end
self.parent = self:GetParent()
self.ability = self:GetAbility()
if not self.parent:IsRealHero() then return end
self.start_gold = self.parent:GetGold()
end
function modifier_item_zhuque_tracker:OnDestroy()
if not IsServer() then return end
if not self.parent:IsRealHero() then return end
local end_gold = self.parent:GetGold()
local gold_gained = end_gold - self.start_gold
local bonus_gold = math.floor(gold_gained * 0.2)
if bonus_gold > 0 then
self.parent:ModifyGold(bonus_gold, true, DOTA_ModifyGold_Unspecified)
SendOverheadEventMessage(self.parent, OVERHEAD_ALERT_GOLD, self.parent, bonus_gold, nil)
end
end
function modifier_item_zhuque_tracker:GetTexture()
return "zhuque"
end
modifier_item_zhuque_buff = class({})
function modifier_item_zhuque_buff:IsHidden() return false end
function modifier_item_zhuque_buff:IsPurgable() return false end
function modifier_item_zhuque_buff:IsDebuff() return false end
function modifier_item_zhuque_buff:OnCreated()
if not self:GetAbility() then
print("[DEBUG] Zhuque: OnCreated - No ability found")
return
end
if not IsServer() then return end
self.caster = self:GetCaster()
if not self.caster or self.caster:IsNull() then
print("[DEBUG] Zhuque: OnCreated - No valid caster found")
return
end
self.parent = self:GetParent()
self.ability = self:GetAbility()
print(string.format("[DEBUG] Zhuque: OnCreated - Caster: %s, Parent: %s",
self.caster:GetUnitName(), self.parent:GetUnitName()))
self.accumulated_magic_damage = 0
self.damage_release_radius = self:GetAbility():GetSpecialValueFor("damage_release_radius")
self.damage_release_interval = self:GetAbility():GetSpecialValueFor("damage_release_interval")
self.damage_release_pct = self:GetAbility():GetSpecialValueFor("damage_release_pct")
self:CalculateBonuses()
self:SetHasCustomTransmitterData(true)
if not IsServer() then
self:OnRefresh()
end
self.particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_dark_willow/dark_willow_shadow_realm.vpcf",
PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
self:AddParticle(
self.particle,
false,
false,
-1,
false,
false
)
self:StartIntervalThink(self.damage_release_interval)
end
function modifier_item_zhuque_buff:OnIntervalThink()
if not IsServer() then return end
if self.accumulated_magic_damage > 0 then
self:ReleaseAccumulatedDamage()
end
end
function modifier_item_zhuque_buff:OnDestroy()
if IsServer() then
ParticleManager:DestroyParticle(self.particle, false)
ParticleManager:ReleaseParticleIndex(self.particle)
end
end
function modifier_item_zhuque_buff:ReleaseAccumulatedDamage()
local damage_to_release = self.accumulated_magic_damage * self.damage_release_pct / 100
local enemies = FindUnitsInRadius(
self.parent:GetTeamNumber(),
self.parent:GetAbsOrigin(),
nil,
self.damage_release_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
print("releasedamage", damage_to_release)
for _, enemy in pairs(enemies) do
local damageTable = {
victim = enemy,
attacker = self.caster,
damage = damage_to_release,
damage_type = DAMAGE_TYPE_MAGICAL,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_REFLECTION,
ability = self:GetAbility()
}
ApplyDamage(damageTable)
end
local fx = ParticleManager:CreateParticle(
"particles/items3_fx/blink_overwhelming_burst.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
self.parent
)
self:AddParticle(fx, false, false, -1, false, false)
EmitSoundOn("Hero_Zuus.ArcLightning.Cast", self.parent)
self.accumulated_magic_damage = 0
ParticleManager:ReleaseParticleIndex(fx)
end
function modifier_item_zhuque_buff:TrackMagicDamage(damage)
if not IsServer() then return end
if damage and damage > 0 then
self.accumulated_magic_damage = self.accumulated_magic_damage + damage
end
end
function modifier_item_zhuque_buff:OnTakeDamage(keys)
if not IsServer() then return end
if keys.attacker == self.parent then
if bit.band(keys.damage_flags, DOTA_DAMAGE_FLAG_REFLECTION) == DOTA_DAMAGE_FLAG_REFLECTION then
return
end
if bit.band(keys.damage_flags, DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION) == DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION then
return
end
if keys.damage_type == DAMAGE_TYPE_MAGICAL then
local original_damage = keys.original_damage or keys.damage
self:TrackMagicDamage(original_damage)
end
end
end
function modifier_item_zhuque_buff:CalculateBonuses()
if not self.caster or self.caster:IsNull() then
return
end
if not self.ability or self.ability:IsNull() then
return
end
local caster_total_damage = self.caster:GetAverageTrueAttackDamage(nil) or 0
local caster_spell_amp = self.caster:GetSpellAmplification(false) or 0
local damage_ratio = self.ability:GetSpecialValueFor("damage_bonus_pct") / 100
local spell_amp_ratio = self.ability:GetSpecialValueFor("spell_amp_bonus_pct") / 100
self.spell_amp_bonus = caster_spell_amp * spell_amp_ratio * 100
self.damage_bonus = caster_total_damage * damage_ratio
end
function modifier_item_zhuque_buff:DeclareFunctions()
return {
MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
MODIFIER_EVENT_ON_TAKEDAMAGE,
}
end
function modifier_item_zhuque_buff:AddCustomTransmitterData()
return {
damage_bonus = self.damage_bonus or 0,
spell_amp_bonus = self.spell_amp_bonus or 0,
}
end
function modifier_item_zhuque_buff:HandleCustomTransmitterData(data)
self.damage_bonus = data.damage_bonus
self.spell_amp_bonus = data.spell_amp_bonus
end
function modifier_item_zhuque_buff:GetModifierSpellAmplify_Percentage()
local bonus = self.spell_amp_bonus or 0
return bonus
end
function modifier_item_zhuque_buff:GetModifierPreAttack_BonusDamage()
local bonus = self.damage_bonus or 0
return bonus
end
function modifier_item_zhuque_buff:CheckState()
return {
[MODIFIER_STATE_UNTARGETABLE_ENEMY] = true,
[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
}
end
function modifier_item_zhuque_buff:GetTexture()
return "zhuque"
end
modifier_item_zhuque_building_buff = class({})
function modifier_item_zhuque_building_buff:IsHidden() return false end
function modifier_item_zhuque_building_buff:IsPurgable() return false end
function modifier_item_zhuque_building_buff:IsDebuff() return false end
function modifier_item_zhuque_building_buff:OnCreated()
if not self:GetAbility() then return end
if not IsServer() then return end
self.caster = self:GetCaster()
self.ability = self:GetAbility()
self:CalculateDamageBonus()
self:SetHasCustomTransmitterData(true)
end
function modifier_item_zhuque_building_buff:CalculateDamageBonus()
if not self.caster or not self.ability then
return
end
local caster_total_damage = self.caster:GetAverageTrueAttackDamage(nil) or 0
local damage_ratio = self.ability:GetSpecialValueFor("damage_bonus_pct") / 100
self.damage_bonus = caster_total_damage * damage_ratio
end
function modifier_item_zhuque_building_buff:DeclareFunctions()
return {
MODIFIER_PROPERTY_BASEATTACK_BONUS_DAMAGE,
}
end
function modifier_item_zhuque_building_buff:AddCustomTransmitterData()
return {
damage_bonus = self.damage_bonus or 0,
}
end
function modifier_item_zhuque_building_buff:HandleCustomTransmitterData(data)
self.damage_bonus = data.damage_bonus
end
function modifier_item_zhuque_building_buff:GetModifierBaseAttack_BonusDamage()
return self.damage_bonus or 0
end
function modifier_item_zhuque_building_buff:GetTexture()
return "zhuque"
end
