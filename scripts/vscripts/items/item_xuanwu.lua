item_xuanwu = class({})
LinkLuaModifier("modifier_item_xuanwu_tracker", "items/item_xuanwu.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_xuanwu_buff", "items/item_xuanwu.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_xuanwu_building_buff", "items/item_xuanwu.lua",
LUA_MODIFIER_MOTION_NONE)
function item_xuanwu:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local duration = self:GetSpecialValueFor("duration")
local smoke_duration = self:GetSpecialValueFor("smoke_duration")
local ms = self:GetSpecialValueFor("ms")
local vis_radius = self:GetSpecialValueFor("vis_radius")
local spread_radius = self:GetSpecialValueFor("spread_radius")
if caster == target then
self:EndCooldown()
self:RefundManaCost()
return
end
caster:EmitSound("Hero_Axe.Berserkers_Call")
caster:EmitSound("Item.SmokeOfDeceit.Activate")
caster:AddNewModifier(caster, self, "modifier_item_xuanwu_tracker", { duration = duration })
target:EmitSound("Hero_Axe.Berserkers_Call")
if target:IsBuilding() then
target:AddNewModifier(caster, self, "modifier_item_xuanwu_building_buff", { duration = duration })
else
target:AddNewModifier(caster, self, "modifier_item_xuanwu_buff", { duration = duration })
target:EmitSound("Hero_Axe.Berserkers_Call")
target:AddNewModifier(caster, self, "modifier_item_xuanwu_tracker", { duration = duration })
end
if IsServer() then
target:Purge(false, true, false, false, false)
caster:AddNewModifier(caster, self, "modifier_smoke_of_deceit",
{
duration = smoke_duration,
bonus_movement_speed = ms,
visibility_radius = vis_radius,
secondary_application_radius =
spread_radius
})
end
self:SpendCharge(1)
end
function item_xuanwu:CastFilterResultTarget(target)
if target == self:GetCaster() then
return UF_FAIL_CUSTOM
end
return UnitFilter(target, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING,
DOTA_UNIT_TARGET_FLAG_NONE,
self:GetCaster():GetTeamNumber())
end
function item_xuanwu:GetCustomCastErrorTarget(target)
if target == self:GetCaster() then
return "#dota_hud_error_cant_cast_on_self"
end
return ""
end
modifier_item_xuanwu_tracker = class({})
function modifier_item_xuanwu_tracker:IsHidden() return false end
function modifier_item_xuanwu_tracker:IsPurgable() return false end
function modifier_item_xuanwu_tracker:IsDebuff() return false end
function modifier_item_xuanwu_tracker:RemoveOnDeath()
return false
end
function modifier_item_xuanwu_tracker:OnCreated(kv)
if not IsServer() then return end
self.parent = self:GetParent()
self.ability = self:GetAbility()
if not self.parent:IsRealHero() then return end
self.start_gold = self.parent:GetGold()
self.gold_from_kills = 0
end
function modifier_item_xuanwu_tracker:OnDestroy()
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
function modifier_item_xuanwu_tracker:GetTexture()
return "xuanwu"
end
modifier_item_xuanwu_buff = class({})
function modifier_item_xuanwu_buff:IsHidden() return false end
function modifier_item_xuanwu_buff:IsPurgable() return false end
function modifier_item_xuanwu_buff:IsDebuff() return false end
function modifier_item_xuanwu_buff:OnCreated()
if not self:GetAbility() then return end
if IsServer() then
self:GetParent():Purge(false, true, false, true, true)
end
self.magic_resistance_bonus = self:GetAbility():GetSpecialValueFor("magic_resistance_bonus")
self.armor_bonus = self:GetAbility():GetSpecialValueFor("armor_bonus")
self.damage_reduction = self:GetAbility():GetSpecialValueFor("damage_reduction")
self.status_resistance = self:GetAbility():GetSpecialValueFor("status_resistance")
self.stored_damage = 0
self.damage_reflect_pct = self:GetAbility():GetSpecialValueFor("damage_reflect") / 100
if not IsServer() then return end
self:StartIntervalThink(2.0)
self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_omniknight/omniknight_repel_buff.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
self:GetParent())
self:AddParticle(
self.particle,
false,
false,
-1,
false,
false
)
end
function modifier_item_xuanwu_buff:DeclareFunctions()
return {
MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
MODIFIER_PROPERTY_MODEL_SCALE,
MODIFIER_EVENT_ON_TAKEDAMAGE
}
end
function modifier_item_xuanwu_buff:GetModifierModelScale()
return 60
end
function modifier_item_xuanwu_buff:OnIntervalThink()
if not IsServer() then return end
self:ReleaseStoredDamage()
end
function modifier_item_xuanwu_buff:OnTakeDamage(keys)
if not IsServer() then return end
local parent = self:GetParent()
local caster = self:GetCaster()
if keys.unit == parent and keys.damage_type == DAMAGE_TYPE_MAGICAL then
local damage_to_store = keys.original_damage * self.damage_reflect_pct
self.stored_damage = self.stored_damage + damage_to_store
end
end
function modifier_item_xuanwu_buff:OnDestroy()
if not IsServer() then return end
ParticleManager:DestroyParticle(self.particle, false)
ParticleManager:ReleaseParticleIndex(self.particle)
self:ReleaseStoredDamage()
end
function modifier_item_xuanwu_buff:ReleaseStoredDamage()
if self.stored_damage <= 0 then return end
local parent = self:GetParent()
local caster = self:GetCaster()
local radius = 1000
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
parent:GetOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
local damage_table = {
victim = enemy,
attacker = caster,
damage = self.stored_damage,
damage_type = DAMAGE_TYPE_MAGICAL,
damage_flags = DOTA_DAMAGE_FLAG_REFLECTION,
ability = self:GetAbility()
}
ApplyDamage(damage_table)
SendOverheadEventMessage(nil, OVERHEAD_ALERT_DAMAGE, enemy,
math.floor(self.stored_damage), nil)
end
local fx = ParticleManager:CreateParticle(
"particles/items3_fx/blink_overwhelming_burst.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
parent
)
self:AddParticle(fx, false, false, -1, false, false)
EmitSoundOn("Hero_Axe.Berserkers_Call", parent)
self.stored_damage = 0
ParticleManager:ReleaseParticleIndex(fx)
end
function modifier_item_xuanwu_buff:OnDeath(keys)
if not IsServer() then return end
local parent = self:GetParent()
if keys.unit == parent then
self:ReleaseStoredDamage()
end
end
function modifier_item_xuanwu_buff:GetModifierMagicalResistanceBonus()
return self.magic_resistance_bonus
end
function modifier_item_xuanwu_buff:GetModifierPhysicalArmorBonus()
return self.armor_bonus
end
function modifier_item_xuanwu_buff:GetModifierIncomingDamage_Percentage()
return self.damage_reduction
end
function modifier_item_xuanwu_buff:GetModifierStatusResistanceStacking()
return self.status_resistance
end
function modifier_item_xuanwu_buff:GetTexture()
return "xuanwu"
end
modifier_item_xuanwu_building_buff = class({})
function modifier_item_xuanwu_building_buff:IsHidden() return false end
function modifier_item_xuanwu_building_buff:IsPurgable() return false end
function modifier_item_xuanwu_building_buff:IsDebuff() return false end
function modifier_item_xuanwu_building_buff:OnCreated()
if not self:GetAbility() then return end
self.magic_resistance_bonus = self:GetAbility():GetSpecialValueFor("magic_resistance_bonus") * 1.5
self.armor_bonus = self:GetAbility():GetSpecialValueFor("armor_bonus") * 1.5
self.damage_reduction = self:GetAbility():GetSpecialValueFor("damage_reduction")
if not IsServer() then return end
self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_omniknight/omniknight_repel_buff.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
self:GetParent())
self:AddParticle(
self.particle,
false,
false,
-1,
false,
false
)
end
function modifier_item_xuanwu_building_buff:OnDestroy()
if IsServer() then
ParticleManager:DestroyParticle(self.particle, false)
ParticleManager:ReleaseParticleIndex(self.particle)
end
end
function modifier_item_xuanwu_building_buff:DeclareFunctions()
return {
MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
}
end
function modifier_item_xuanwu_building_buff:GetModifierMagicalResistanceBonus()
return self.magic_resistance_bonus
end
function modifier_item_xuanwu_building_buff:GetModifierPhysicalArmorBonus()
return self.armor_bonus
end
function modifier_item_xuanwu_building_buff:GetModifierIncomingDamage_Percentage()
return self.damage_reduction
end
function modifier_item_xuanwu_building_buff:GetTexture()
return "xuanwu"
end
