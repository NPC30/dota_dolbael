item_baihu = class({})
LinkLuaModifier("modifier_item_baihu_heal", "items/item_baihu.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_baihu_death_prevention", "items/item_baihu.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_baihu_tracker", "items/item_baihu.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_baihu_building_buff", "items/item_baihu.lua", LUA_MODIFIER_MOTION_NONE)
function item_baihu:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local duration = self:GetSpecialValueFor("duration")
if caster == target then
self:EndCooldown()
self:RefundManaCost()
return
end
caster:EmitSound("Item.Cheese.Activate")
caster:AddNewModifier(caster, self, "modifier_item_baihu_tracker", { duration = duration })
target:EmitSound("Item.Cheese.Activate")
if target:IsBuilding() then
target:AddNewModifier(caster, self, "modifier_item_baihu_building_buff", { duration = duration })
else
local instant_heal_pct = self:GetSpecialValueFor("instant_heal_pct")
local instant_heal = caster:GetMaxHealth() * instant_heal_pct / 100
target:Heal(instant_heal, self)
SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, target, instant_heal, nil)
local existing_heal = target:FindModifierByName("modifier_item_baihu_heal")
if existing_heal then
existing_heal:Destroy()
end
target:AddNewModifier(caster, self, "modifier_item_baihu_heal", { duration = duration })
target:AddNewModifier(caster, self, "modifier_item_baihu_tracker", { duration = duration })
end
self:SpendCharge(1)
end
function item_baihu:CastFilterResultTarget(target)
if target == self:GetCaster() then
return UF_FAIL_CUSTOM
end
return UnitFilter(target, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING,
DOTA_UNIT_TARGET_FLAG_NONE, self:GetCaster():GetTeamNumber())
end
function item_baihu:GetCustomCastErrorTarget(target)
if target == self:GetCaster() then
return "#dota_hud_error_cant_cast_on_self"
end
return ""
end
modifier_item_baihu_tracker = class({})
function modifier_item_baihu_tracker:IsHidden() return false end
function modifier_item_baihu_tracker:IsPurgable() return false end
function modifier_item_baihu_tracker:IsDebuff() return false end
function modifier_item_baihu_tracker:RemoveOnDeath()
return false
end
function modifier_item_baihu_tracker:OnCreated(kv)
if not IsServer() then return end
self.parent = self:GetParent()
self.ability = self:GetAbility()
if self.parent:IsRealHero() then
self.start_gold = self.parent:GetGold()
end
end
function modifier_item_baihu_tracker:OnDestroy()
if not IsServer() then return end
if self.parent:IsRealHero() then
local end_gold = self.parent:GetGold()
local gold_gained = end_gold - self.start_gold
local bonus_gold = math.floor(gold_gained * 0.2)
if bonus_gold > 0 then
self.parent:ModifyGold(bonus_gold, true, DOTA_ModifyGold_Unspecified)
SendOverheadEventMessage(self.parent, OVERHEAD_ALERT_GOLD, self.parent, bonus_gold, nil)
end
end
end
function modifier_item_baihu_tracker:GetTexture()
return "baihu"
end
modifier_item_baihu_building_buff = class({})
function modifier_item_baihu_building_buff:IsHidden() return false end
function modifier_item_baihu_building_buff:IsPurgable() return false end
function modifier_item_baihu_building_buff:IsDebuff() return false end
function modifier_item_baihu_building_buff:OnCreated(kv)
if not IsServer() then return end
if not self:GetAbility() then
self:Destroy()
return
end
self.caster = self:GetCaster()
self.parent = self:GetParent()
self.heal_interval = self:GetAbility():GetSpecialValueFor("heal_interval_building")
self.heal_pct = self:GetAbility():GetSpecialValueFor("heal_pct_building")
self:StartIntervalThink(self.heal_interval)
end
function modifier_item_baihu_building_buff:OnIntervalThink()
if not IsServer() then return end
local heal_amount = self.parent:GetMaxHealth() * self.heal_pct / 100
self.parent:Heal(heal_amount, self:GetAbility())
SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self.parent, heal_amount, nil)
end
function modifier_item_baihu_building_buff:GetTexture()
return "baihu"
end
modifier_item_baihu_heal = class({})
function modifier_item_baihu_heal:IsHidden() return false end
function modifier_item_baihu_heal:IsPurgable() return false end
function modifier_item_baihu_heal:IsDebuff() return false end
function modifier_item_baihu_heal:OnCreated(kv)
if not IsServer() then return end
if not self:GetAbility() then
self:Destroy()
return
end
self.caster = self:GetCaster()
self.parent = self:GetParent()
self.heal_interval = self:GetAbility():GetSpecialValueFor("heal_interval")
self.heal_pct = self:GetAbility():GetSpecialValueFor("interval_heal_pct")
self.damage_radius = self:GetAbility():GetSpecialValueFor("damage_radius")
self.death_prevention_duration = self:GetAbility():GetSpecialValueFor("duration")
self.max_charges = self:GetAbility():GetSpecialValueFor("death_prevention_times")
self.current_charges = self.max_charges
local existing_buff = self.parent:FindModifierByName("modifier_item_baihu_death_prevention")
if not existing_buff then
self.parent:AddNewModifier(self.caster, self:GetAbility(), "modifier_item_baihu_death_prevention",
{ duration = self.death_prevention_duration })
end
self:StartIntervalThink(self.heal_interval)
end
function modifier_item_baihu_heal:OnIntervalThink()
if not IsServer() then return end
if self.parent:IsAlive() then
local heal_amount = self.caster:GetMaxHealth() * self.heal_pct / 100
local current_health = self.parent:GetHealth()
local max_health = self.parent:GetMaxHealth()
local health_needed_to_full = max_health - current_health
local actual_heal = math.min(heal_amount, health_needed_to_full)
local excess_heal = heal_amount - actual_heal
if actual_heal > 0 then
self.parent:Heal(actual_heal, self:GetAbility())
self.parent:EmitSound("Hero_Omniknight.Purification")
SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self.parent, actual_heal, nil)
end
if excess_heal > 0 then
self:DealAOEDamage(excess_heal)
end
end
end
function modifier_item_baihu_heal:DealAOEDamage(damage)
local enemies = FindUnitsInRadius(
self.parent:GetTeamNumber(),
self.parent:GetAbsOrigin(),
nil,
self.damage_radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
local damageTable = {
victim = enemy,
attacker = self.caster,
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_REFLECTION,
ability = self:GetAbility()
}
ApplyDamage(damageTable)
end
EmitSoundOn("DOTA_Item.MeteorHammer.Cast", self.parent)
end
function modifier_item_baihu_heal:DeclareFunctions()
return {
MODIFIER_PROPERTY_MODEL_SCALE,
}
end
function modifier_item_baihu_heal:GetModifierModelScale()
return 80
end
function modifier_item_baihu_heal:GetTexture()
return "baihu"
end
modifier_item_baihu_death_prevention = class({})
function modifier_item_baihu_death_prevention:IsHidden() return false end
function modifier_item_baihu_death_prevention:IsPurgable() return false end
function modifier_item_baihu_death_prevention:IsDebuff() return false end
function modifier_item_baihu_death_prevention:DeclareFunctions()
return { MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE }
end
function modifier_item_baihu_death_prevention:OnCreated()
if IsServer() then
self.max_charges = 3
self.current_charges = self.max_charges
self:SetStackCount(self.current_charges)
self.particle = ParticleManager:CreateParticle("particles/items4_fx/combo_breaker_buff.vpcf",
PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
ParticleManager:SetParticleControlEnt(self.particle, 1, self:GetParent(), PATTACH_POINT_FOLLOW,
"attach_hitloc", self:GetParent():GetAbsOrigin(), true)
self:AddParticle(self.particle, false, false, -1, true, false)
end
end
function modifier_item_baihu_death_prevention:OnDestroy()
if IsServer() then
ParticleManager:DestroyParticle(self.particle, false)
ParticleManager:ReleaseParticleIndex(self.particle)
end
end
function modifier_item_baihu_death_prevention:GetModifierIncomingDamage_Percentage(kv)
if not IsServer() then return 0 end
if self.current_charges <= 0 then
return 0
end
local ability = self:GetAbility()
if not ability then
return 0
end
local health_threshold = ability:GetSpecialValueFor("health_threshold") or 30
health_threshold = health_threshold / 100
local current_health_pct = self:GetParent():GetHealth() / self:GetParent():GetMaxHealth()
local damage_after_pct = (self:GetParent():GetHealth() - kv.damage) / self:GetParent():GetMaxHealth()
if current_health_pct < health_threshold or damage_after_pct <= health_threshold then
self:GetParent():EmitSound("DOTA_Item.ComboBreaker")
local combo_breaker_particle = ParticleManager:CreateParticle(
"particles/items4_fx/combo_breaker.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
self:GetParent()
)
ParticleManager:ReleaseParticleIndex(combo_breaker_particle)
local caster = self:GetCaster()
local emergency_heal_pct = self:GetAbility():GetSpecialValueFor("emergency_heal_pct")
if not emergency_heal_pct then
emergency_heal_pct = 50
end
local emergency_heal = caster:GetMaxHealth() * emergency_heal_pct / 100
self:GetParent():SetHealth(emergency_heal)
self.current_charges = self.current_charges - 1
self:SetStackCount(self.current_charges)
if self.current_charges > 0 then
else
self:Destroy()
end
return -100
end
return 0
end
function modifier_item_baihu_death_prevention:GetTexture()
return "baihu"
end
