item_baihu_p = class({})
LinkLuaModifier("modifier_item_baihu_heal", "items/item_baihu.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_baihu_death_prevention", "items/item_baihu.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_baihu_tracker", "items/item_baihu.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_baihu_building_buff", "items/item_baihu.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_baihu_p_stats", "items/item_baihu_p.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_baihu_p_high_vision", "items/item_baihu_p.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_baihu_p_true_sight_debuff", "items/item_baihu_p.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_baihu_p_true_sight_area", "items/item_baihu_p.lua", LUA_MODIFIER_MOTION_NONE)
function item_baihu_p:GetIntrinsicModifierName()
return "modifier_item_baihu_p_stats"
end
function item_baihu_p:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local cast_position = self:GetCursorPosition()
local duration = self:GetSpecialValueFor("duration")
if caster == target then
self:EndCooldown()
self:RefundManaCost()
return
end
if not target then
self:CreateTrueSightArea(cast_position)
caster:EmitSound("Item.Tango.Cast")
local high_vision_duration = self:GetSpecialValueFor("high_vision_duration")
caster:AddNewModifier(caster, self, "modifier_item_baihu_p_high_vision", { duration = high_vision_duration })
return
end
if (target:GetTeamNumber() ~= caster:GetTeamNumber()) then
self:EndCooldown()
self:RefundManaCost()
return
end
caster:EmitSound("Item.Cheese.Activate")
local caster_tracker = caster:FindModifierByName("modifier_item_baihu_tracker")
if caster_tracker then
caster_tracker:SetDuration(duration, true)
else
caster:AddNewModifier(caster, self, "modifier_item_baihu_tracker", { duration = duration })
end
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
local target_tracker = target:FindModifierByName("modifier_item_baihu_tracker")
if target_tracker then
target_tracker:SetDuration(duration, true)
else
target:AddNewModifier(caster, self, "modifier_item_baihu_tracker", { duration = duration })
end
end
local high_vision_duration = self:GetSpecialValueFor("high_vision_duration")
caster:AddNewModifier(caster, self, "modifier_item_baihu_p_high_vision", { duration = high_vision_duration })
end
function item_baihu_p:GetCastRange(vLocation, hTarget)
return self:GetSpecialValueFor("cast_range_unit")
end
function item_baihu_p:CreateTrueSightArea(position)
if not IsServer() then return end
position = GetGroundPosition(position, nil)
local dummy = CreateUnitByName("dummy_unit", position, false, nil, nil, self:GetCaster():GetTeamNumber())
local caster = self:GetCaster()
local caster_pos = caster:GetAbsOrigin()
local direction = position - caster_pos
direction.z = 0
direction = direction:Normalized()
local perpendicular = Vector(-direction.y, direction.x, 0)
local tree_num = 10
local tree_spacing = 60
local start_offset = -(tree_spacing * tree_num / 2)
if dummy then
for i = 0, tree_num do
local tree_pos = position + perpendicular * (start_offset + i * tree_spacing)
tree_pos = GetGroundPosition(tree_pos, nil)
local branches = dummy:AddItemByName("item_branches")
if branches then
dummy:SetCursorPosition(tree_pos)
dummy:CastAbilityImmediately(branches, -1)
end
Timers:CreateTimer(0.1, function()
if dummy and not dummy:IsNull() then
dummy:RemoveSelf()
end
end)
end
end
local caster = self:GetCaster()
local night_vision = caster:GetNightTimeVisionRange()
local base_range = self:GetSpecialValueFor("true_sight_base_range")
local vision_pct = self:GetSpecialValueFor("true_sight_vision_pct")
local true_sight_radius = base_range + (night_vision * vision_pct / 100)
local dummy = CreateUnitByName("dummy_unit", position, false, caster, caster, caster:GetTeamNumber())
if dummy then
dummy:AddNewModifier(caster, self, "modifier_baihu_p_true_sight_area", {
radius = true_sight_radius,
duration = 9
})
Timers:CreateTimer(9, function()
if dummy and not dummy:IsNull() then
dummy:RemoveSelf()
end
end)
end
end
function item_baihu_p:CastFilterResultTarget(target)
if target == self:GetCaster() then
return UF_FAIL_CUSTOM
end
return UnitFilter(target, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING,
DOTA_UNIT_TARGET_FLAG_NONE, self:GetCaster():GetTeamNumber())
end
function item_baihu_p:GetCustomCastErrorTarget(target)
if target == self:GetCaster() then
return "#dota_hud_error_cant_cast_on_self"
end
return ""
end
modifier_item_baihu_p_stats = class({})
function modifier_item_baihu_p_stats:IsHidden() return false end
function modifier_item_baihu_p_stats:IsPurgable() return false end
function modifier_item_baihu_p_stats:RemoveOnDeath() return false end
function modifier_item_baihu_p_stats:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_baihu_p_stats:OnCreated()
if not IsServer() then return end
self.base_range = self:GetAbility():GetSpecialValueFor("true_sight_base_range")
self.vision_pct = self:GetAbility():GetSpecialValueFor("true_sight_vision_pct")
self.radius = self.base_range
self:StartIntervalThink(1)
end
function modifier_item_baihu_p_stats:OnIntervalThink()
if not IsServer() then return end
local parent = self:GetParent()
local night_vision = parent:GetNightTimeVisionRange()
self.radius = self.base_range + (night_vision * self.vision_pct / 100)
end
function modifier_item_baihu_p_stats:IsAura() return true end
function modifier_item_baihu_p_stats:GetAuraRadius()
return self.radius
end
function modifier_item_baihu_p_stats:GetAuraSearchTeam()
return DOTA_UNIT_TARGET_TEAM_ENEMY
end
function modifier_item_baihu_p_stats:GetAuraSearchType()
return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_OTHER
end
function modifier_item_baihu_p_stats:GetAuraSearchFlags()
return DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES
end
function modifier_item_baihu_p_stats:GetModifierAura()
return "modifier_item_baihu_p_true_sight_debuff"
end
function modifier_item_baihu_p_stats:DeclareFunctions()
return {
MODIFIER_PROPERTY_HEALTH_BONUS,
}
end
function modifier_item_baihu_p_stats:GetModifierHealthBonus()
if not self:GetAbility() then return 0 end
local health_per_stat = self:GetAbility():GetSpecialValueFor("health_per_all_stats")
local parent = self:GetParent()
local total_stats = parent:GetStrength() + parent:GetAgility() + parent:GetIntellect(false)
return total_stats * health_per_stat
end
function modifier_item_baihu_p_stats:GetTexture()
return "baihukui"
end
modifier_item_baihu_p_true_sight_debuff = class({})
function modifier_item_baihu_p_true_sight_debuff:IsHidden() return true end
function modifier_item_baihu_p_true_sight_debuff:IsPurgable() return false end
function modifier_item_baihu_p_true_sight_debuff:CheckState()
return { [MODIFIER_STATE_INVISIBLE] = false }
end
function modifier_item_baihu_p_true_sight_debuff:GetPriority()
return MODIFIER_PRIORITY_HIGH
end
modifier_item_baihu_p_high_vision = class({})
function modifier_item_baihu_p_high_vision:IsHidden() return false end
function modifier_item_baihu_p_high_vision:IsPurgable() return true end
function modifier_item_baihu_p_high_vision:IsBuff() return true end
function modifier_item_baihu_p_high_vision:CheckState()
return {
[MODIFIER_STATE_ALLOW_PATHING_THROUGH_CLIFFS] = true,
[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
[MODIFIER_STATE_FORCED_FLYING_VISION] = true,
}
end
function modifier_item_baihu_p_high_vision:DeclareFunctions()
return {
MODIFIER_PROPERTY_BONUS_DAY_VISION,
MODIFIER_PROPERTY_BONUS_NIGHT_VISION,
}
end
function modifier_item_baihu_p_high_vision:GetBonusDayVision()
return 1800
end
function modifier_item_baihu_p_high_vision:GetBonusNightVision()
return 1800
end
function modifier_item_baihu_p_high_vision:GetTexture()
return "baihukui"
end
modifier_baihu_p_true_sight_area = class({})
function modifier_baihu_p_true_sight_area:IsHidden() return false end
function modifier_baihu_p_true_sight_area:IsPurgable() return false end
function modifier_baihu_p_true_sight_area:RemoveOnDeath() return true end
function modifier_baihu_p_true_sight_area:OnCreated(keys)
if not IsServer() then return end
self.radius = keys.radius or 1200
self:GetParent():SetDayTimeVisionRange(self.radius)
self:GetParent():SetNightTimeVisionRange(self.radius)
end
function modifier_baihu_p_true_sight_area:IsAura() return true end
function modifier_baihu_p_true_sight_area:GetAuraRadius()
return self.radius
end
function modifier_baihu_p_true_sight_area:GetAuraSearchTeam()
return DOTA_UNIT_TARGET_TEAM_ENEMY
end
function modifier_baihu_p_true_sight_area:GetAuraSearchType()
return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_OTHER
end
function modifier_baihu_p_true_sight_area:GetAuraSearchFlags()
return DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES
end
function modifier_baihu_p_true_sight_area:GetModifierAura()
return "modifier_item_baihu_p_true_sight_debuff"
end
function modifier_baihu_p_true_sight_area:DeclareFunctions()
return {
MODIFIER_PROPERTY_PROVIDES_FOW_POSITION,
}
end
function modifier_baihu_p_true_sight_area:GetModifierProvidesFOWPosition()
return 1
end
