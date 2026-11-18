item_qinglong = class({})
LinkLuaModifier("modifier_item_qinglong_tracker", "items/item_qinglong.lua",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_qinglong_buff", "items/item_qinglong.lua",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_qinglong_building_buff", "items/item_qinglong.lua",
LUA_MODIFIER_MOTION_NONE)
function item_qinglong:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local duration = self:GetSpecialValueFor("duration")
local weiguang_duration = duration * 2
caster:EmitSound("Hero_OgreMagi.Bloodlust.Cast")
caster:EmitSound("Item.GlimmerCape.Activate")
caster:AddNewModifier(caster, self, "modifier_item_qinglong_tracker", { duration = duration })
target:EmitSound("Hero_OgreMagi.Bloodlust.Target")
if target:IsBuilding() then
target:AddNewModifier(caster, self, "modifier_item_qinglong_building_buff", { duration = duration })
else
target:AddNewModifier(caster, self, "modifier_item_qinglong_buff", { duration = duration })
target:AddNewModifier(caster, self, "modifier_item_qinglong_tracker", { duration = duration })
end
if IsServer() then
caster:AddNewModifier(caster, self, "modifier_item_glimmer_cape_fade", { duration = weiguang_duration })
caster:AddNewModifier(caster, self, "modifier_item_glimmer_cape", { duration = weiguang_duration })
end
self:SpendCharge(1)
end
function item_qinglong:CastFilterResultTarget(target)
if target == self:GetCaster() then
return UF_FAIL_CUSTOM
end
return UnitFilter(target, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING,
DOTA_UNIT_TARGET_FLAG_NONE,
self:GetCaster():GetTeamNumber())
end
function item_qinglong:GetCustomCastErrorTarget(target)
if target == self:GetCaster() then
return "#dota_hud_error_cant_cast_on_self"
end
return ""
end
modifier_item_qinglong_tracker = class({})
function modifier_item_qinglong_tracker:IsHidden() return false end
function modifier_item_qinglong_tracker:IsPurgable() return false end
function modifier_item_qinglong_tracker:IsDebuff() return false end
function modifier_item_qinglong_tracker:RemoveOnDeath()
return false
end
function modifier_item_qinglong_tracker:OnCreated(kv)
if not IsServer() then return end
self.parent = self:GetParent()
self.ability = self:GetAbility()
if self.parent:IsRealHero() then
self.start_gold = self.parent:GetGold() or 0
else
self.start_gold = 0
end
self.gold_from_kills = 0
print(string.format("[DEBUG] Battle Fury tracker started for %s, initial gold: %d",
self.parent:GetUnitName(), self.start_gold))
end
function modifier_item_qinglong_tracker:OnDestroy()
if not IsServer() then return end
if self.parent:IsRealHero() then
local end_gold = self.parent:GetGold() or 0
local gold_gained = end_gold - self.start_gold
local bonus_gold = math.floor(gold_gained * 0.2)
if bonus_gold > 0 then
print(string.format("[DEBUG] Battle Fury ended for %s, gold gained: %d, bonus: %d",
self.parent:GetUnitName(), gold_gained, bonus_gold))
self.parent:ModifyGold(bonus_gold, true, DOTA_ModifyGold_Unspecified)
SendOverheadEventMessage(self.parent, OVERHEAD_ALERT_GOLD, self.parent, bonus_gold, nil)
end
end
end
function modifier_item_qinglong_tracker:GetTexture()
return "qinglong"
end
modifier_item_qinglong_buff = class({})
function modifier_item_qinglong_buff:IsHidden() return false end
function modifier_item_qinglong_buff:IsPurgable() return false end
function modifier_item_qinglong_buff:IsDebuff() return false end
function modifier_item_qinglong_buff:OnCreated()
if not self:GetAbility() then return end
if not IsServer() then return end
self.caster = self:GetCaster()
self.attack_speed_bonus = self:GetAbility():GetSpecialValueFor("attack_speed_bonus")
self.attack_range_bonus = self:GetAbility():GetSpecialValueFor("attack_range_bonus")
self.bat_reduction = self:GetAbility():GetSpecialValueFor("bat_reduction")
self.particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_ogre_magi/ogre_magi_bloodlust_buff.vpcf", PATTACH_ABSORIGIN_FOLLOW,
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
function modifier_item_qinglong_buff:OnDestroy()
if IsServer() then
ParticleManager:DestroyParticle(self.particle, false)
ParticleManager:ReleaseParticleIndex(self.particle)
end
end
function modifier_item_qinglong_buff:DeclareFunctions()
return {
MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
MODIFIER_PROPERTY_BASE_ATTACK_TIME_CONSTANT,
MODIFIER_EVENT_ON_ATTACK_LANDED
}
end
function modifier_item_qinglong_buff:OnAttackLanded(params)
if not IsServer() then return end
if params.attacker ~= self:GetParent() then return end
if params.target:GetTeamNumber() == self:GetParent():GetTeamNumber() then return end
if params.target:IsBuilding() then
return
end
if self.caster then
local damage = self.caster:GetIntellect(false)
local damageTable = {
victim = params.target,
attacker = self.caster,
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
damage_flags = DOTA_DAMAGE_FLAG_REFLECTION,
ability = self:GetAbility()
}
ApplyDamage(damageTable)
SendOverheadEventMessage(
nil,
OVERHEAD_ALERT_BONUS_SPELL_DAMAGE,
params.target,
damage,
nil
)
end
end
function modifier_item_qinglong_buff:GetModifierAttackSpeedBonus_Constant()
return self.attack_speed_bonus
end
function modifier_item_qinglong_buff:GetModifierAttackRangeBonus()
return self.attack_range_bonus
end
function modifier_item_qinglong_buff:GetModifierBaseAttackTimeConstant()
return self.bat_reduction
end
function modifier_item_qinglong_buff:GetTexture()
return "qinglong"
end
modifier_item_qinglong_building_buff = class({})
function modifier_item_qinglong_building_buff:IsHidden() return false end
function modifier_item_qinglong_building_buff:IsPurgable() return false end
function modifier_item_qinglong_building_buff:IsDebuff() return false end
function modifier_item_qinglong_building_buff:OnCreated()
if not self:GetAbility() then return end
if not IsServer() then return end
self.caster = self:GetCaster()
self.attack_speed_bonus = self:GetAbility():GetSpecialValueFor("attack_speed_bonus")
self.attack_range_bonus = self:GetAbility():GetSpecialValueFor("attack_range_bonus")
self.particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_ogre_magi/ogre_magi_bloodlust_buff.vpcf", PATTACH_ABSORIGIN_FOLLOW,
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
function modifier_item_qinglong_building_buff:DeclareFunctions()
return {
MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
MODIFIER_EVENT_ON_ATTACK_LANDED
}
end
function modifier_item_qinglong_building_buff:OnDestroy()
if IsServer() then
ParticleManager:DestroyParticle(self.particle, false)
ParticleManager:ReleaseParticleIndex(self.particle)
end
end
function modifier_item_qinglong_building_buff:OnAttackLanded(params)
if not IsServer() then return end
if params.attacker ~= self:GetParent() then return end
if params.target:GetTeamNumber() == self:GetParent():GetTeamNumber() then return end
if self.caster then
local damage = self.caster:GetIntellect(false)
local damageTable = {
victim = params.target,
attacker = self.caster,
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
damage_flags = DOTA_DAMAGE_FLAG_REFLECTION,
ability = self:GetAbility()
}
ApplyDamage(damageTable)
SendOverheadEventMessage(
nil,
OVERHEAD_ALERT_BONUS_SPELL_DAMAGE,
params.target,
damage,
nil
)
end
end
function modifier_item_qinglong_building_buff:GetModifierAttackSpeedBonus_Constant()
return self.attack_speed_bonus
end
function modifier_item_qinglong_building_buff:GetModifierAttackRangeBonus()
return self.attack_range_bonus
end
function modifier_item_qinglong_building_buff:GetTexture()
return "qinglong"
end
