item_xuanwu_p = class({})
LinkLuaModifier("modifier_item_xuanwu_tracker", "items/item_xuanwu.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_xuanwu_buff", "items/item_xuanwu.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_xuanwu_building_buff", "items/item_xuanwu.lua",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_imba_aeon_disk_basic", "items/item_xuanwu_p.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_imba_aeon_disk", "items/item_xuanwu_p.lua", LUA_MODIFIER_MOTION_NONE)
function item_xuanwu_p:GetIntrinsicModifierName()
return "modifier_imba_aeon_disk_basic"
end
function item_xuanwu_p:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local duration = self:GetSpecialValueFor("duration")
local smoke_duration = self:GetSpecialValueFor("smoke_duration")
local ms = self:GetSpecialValueFor("ms")
local vis_radius = self:GetSpecialValueFor("vis_radius")
local spread_radius = self:GetSpecialValueFor("spread_radius")
if not target then
local creep = CreateUnitByName("npc_dota_creep_goodguys_melee", self:GetCursorPosition(), true, caster, caster,
caster:GetTeamNumber())
creep:SetControllableByPlayer(caster:GetPlayerID(), true)
caster:AddNewModifier(caster, self, "modifier_smoke_of_deceit",
{
duration = smoke_duration,
bonus_movement_speed = ms,
visibility_radius = vis_radius,
secondary_application_radius =
spread_radius
})
return
end
if (target:GetTeamNumber() ~= caster:GetTeamNumber()) then
self:EndCooldown()
self:RefundManaCost()
return
end
caster:EmitSound("Hero_Axe.Berserkers_Call")
caster:EmitSound("Item.SmokeOfDeceit.Activate")
local caster_tracker = caster:FindModifierByName("modifier_item_xuanwu_tracker")
if caster_tracker then
caster_tracker:SetDuration(duration, true)
else
caster:AddNewModifier(caster, self, "modifier_item_xuanwu_tracker", { duration = duration })
end
target:EmitSound("Hero_Axe.Berserkers_Call")
if target:IsBuilding() then
target:AddNewModifier(caster, self, "modifier_item_xuanwu_building_buff", { duration = duration })
else
target:AddNewModifier(caster, self, "modifier_item_xuanwu_buff", { duration = duration })
target:EmitSound("Hero_Axe.Berserkers_Call")
local target_tracker = target:FindModifierByName("modifier_item_xuanwu_tracker")
if target_tracker then
target_tracker:SetDuration(duration, true)
else
target:AddNewModifier(caster, self, "modifier_item_xuanwu_tracker", { duration = duration })
end
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
end
function item_xuanwu_p:CastFilterResultTarget(target)
if target == self:GetCaster() then
return UF_FAIL_CUSTOM
end
return UnitFilter(target, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING,
DOTA_UNIT_TARGET_FLAG_NONE, self:GetCaster():GetTeamNumber())
end
function item_xuanwu_p:GetCustomCastErrorTarget(target)
if target == self:GetCaster() then
return "#dota_hud_error_cant_cast_on_self"
end
return ""
end
modifier_imba_aeon_disk_basic = class({})
function modifier_imba_aeon_disk_basic:IsHidden() return true end
function modifier_imba_aeon_disk_basic:IsPurgable() return false end
function modifier_imba_aeon_disk_basic:RemoveOnDeath() return false end
function modifier_imba_aeon_disk_basic:GetAttributes()
return MODIFIER_ATTRIBUTE_MULTIPLE
end
function modifier_imba_aeon_disk_basic:OnCreated()
if self:GetAbility() then
self.bonus_health = self:GetAbility():GetSpecialValueFor("bonus_health")
self.bonus_mana = self:GetAbility():GetSpecialValueFor("bonus_mana")
self.health_threshold_pct = self:GetAbility():GetSpecialValueFor("health_threshold_pct")
self.buff_duration = self:GetAbility():GetSpecialValueFor("buff_duration")
self.death_tower_damage_pct = self:GetAbility():GetSpecialValueFor("death_tower_damage_pct")
end
end
function modifier_imba_aeon_disk_basic:DeclareFunctions()
return {
MODIFIER_PROPERTY_HEALTH_BONUS,
MODIFIER_PROPERTY_MANA_BONUS,
MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
MODIFIER_EVENT_ON_DEATH
}
end
function modifier_imba_aeon_disk_basic:GetModifierHealthBonus()
return self.bonus_health or 800
end
function modifier_imba_aeon_disk_basic:OnDeath(keys)
if not IsServer() then return end
local parent = self:GetParent()
if keys.unit ~= parent then return end
local ability = self:GetAbility()
if not parent or not ability then return end
local damage_pct = ability:GetSpecialValueFor("death_tower_damage_pct") or 100
local radius = ability:GetSpecialValueFor("tower_check_radius") or 1000
local towers = FindUnitsInRadius(
parent:GetTeamNumber(),
parent:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_BUILDING,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
local damage = parent:GetMaxHealth() * damage_pct / 100.0
for _, tower in ipairs(towers) do
if tower and tower:IsAlive() and not tower:IsInvulnerable() then
local damage_table = {
victim = tower,
attacker = parent,
damage = damage,
damage_type = DAMAGE_TYPE_PHYSICAL,
ability = ability,
damage_flags = DOTA_DAMAGE_FLAG_NONE,
}
ApplyDamage(damage_table)
end
end
EmitSoundOnLocationWithCaster(parent:GetAbsOrigin(), "Hero_Techies.RemoteMine.Detonate", parent)
end
function modifier_imba_aeon_disk_basic:GetModifierManaBonus()
return self.bonus_mana or 800
end
function modifier_imba_aeon_disk_basic:GetModifierIncomingDamage_Percentage(kv)
if self:GetAbility() and self:GetAbility():IsCooldownReady()
and kv.attacker ~= self:GetParent()
and not self:GetParent():HasModifier("modifier_imba_aeon_disk") then
local health_threshold = self.health_threshold_pct / 100.0
local current_health_pct = self:GetParent():GetHealth() / self:GetParent():GetMaxHealth()
local damage_after_pct = (self:GetParent():GetHealth() - kv.damage) / self:GetParent():GetMaxHealth()
if current_health_pct < health_threshold or damage_after_pct <= health_threshold then
self:GetParent():EmitSound("DOTA_Item.ComboBreaker")
self:GetParent():Purge(false, true, false, true, true)
self:GetParent():AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_imba_aeon_disk",
{ duration = self.buff_duration })
self:GetAbility():UseResources(false, true, false, false)
local baseCooldown = self:GetAbility():GetCooldown(-1)
local actualCooldown = baseCooldown * self:GetParent():GetCooldownReduction()
self:GetAbility():StartCooldown(actualCooldown)
return -100
end
end
end
modifier_imba_aeon_disk = class({})
function modifier_imba_aeon_disk:IsPurgable() return false end
function modifier_imba_aeon_disk:IsBreakable() return false end
function modifier_imba_aeon_disk:RemoveOnDeath() return false end
function modifier_imba_aeon_disk:GetTexture()
return "item_aeon_disk"
end
function modifier_imba_aeon_disk:DeclareFunctions()
return {
MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
MODIFIER_PROPERTY_TOTALDAMAGEOUTGOING_PERCENTAGE
}
end
function modifier_imba_aeon_disk:OnCreated()
if IsServer() then
local combo_breaker_particle = ParticleManager:CreateParticle("particles/items4_fx/combo_breaker_buff.vpcf",
PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
ParticleManager:SetParticleControlEnt(combo_breaker_particle, 1, self:GetParent(), PATTACH_POINT_FOLLOW,
"attach_hitloc", self:GetParent():GetAbsOrigin(), true)
self:AddParticle(combo_breaker_particle, false, false, -1, true, false)
end
end
function modifier_imba_aeon_disk:GetModifierIncomingDamage_Percentage()
return -100
end
function modifier_imba_aeon_disk:GetModifierStatusResistanceStacking()
return 80
end
function modifier_imba_aeon_disk:GetModifierTotalDamageOutgoing_Percentage()
return -50
end
