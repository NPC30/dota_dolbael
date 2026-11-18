item_zhuque_p = class({})
LinkLuaModifier("modifier_item_zhuque_tracker", "items/item_zhuque.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_zhuque_buff", "items/item_zhuque.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_zhuque_building_buff", "items/item_zhuque.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_zhuque_p_stats", "items/item_zhuque_p.lua", LUA_MODIFIER_MOTION_NONE)
function item_zhuque_p:GetIntrinsicModifierName()
return "modifier_item_zhuque_p_stats"
end
function item_zhuque_p:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local duration = self:GetSpecialValueFor("duration")
local active_duration = self:GetSpecialValueFor("active_duration")
if target == nil then
self:PlaceWards(caster)
caster:AddNewModifier(caster, self, "modifier_item_zhuque_p_active_buff", { duration = active_duration })
return
end
if (target:GetTeamNumber() ~= caster:GetTeamNumber()) then
self:EndCooldown()
self:RefundManaCost()
return
end
if caster == target then
print("[DEBUG] Zhuque Staff: Cannot cast on self")
self:EndCooldown()
self:RefundManaCost()
return
end
caster:EmitSound("Hero_DarkWillow.Shadow_Realm.Cast")
local caster_tracker = caster:FindModifierByName("modifier_item_zhuque_tracker")
if caster_tracker then
caster_tracker:SetDuration(duration, true)
else
caster:AddNewModifier(caster, self, "modifier_item_zhuque_tracker", { duration = duration })
end
target:EmitSound("Hero_DarkWillow.Shadow_Realm")
if target:IsBuilding() then
target:AddNewModifier(caster, self, "modifier_item_zhuque_building_buff", { duration = duration })
else
target:AddNewModifier(caster, self, "modifier_item_zhuque_buff", { duration = duration })
local target_tracker = target:FindModifierByName("modifier_item_zhuque_tracker")
if target_tracker then
target_tracker:SetDuration(duration, true)
else
target:AddNewModifier(caster, self, "modifier_item_zhuque_tracker", { duration = duration })
end
end
caster:AddNewModifier(caster, self, "modifier_item_zhuque_p_active_buff", { duration = active_duration })
print("[DEBUG] Zhuque Staff: Applied to target " .. target:GetUnitName() .. " by " .. caster:GetUnitName())
end
function item_zhuque_p:PlaceWards(caster)
local cast_position = self:GetCursorPosition()
local duration = self:GetSpecialValueFor("ward_duration") or 300
local observer_ward = CreateUnitByName("npc_dota_observer_wards", cast_position, true, caster, caster,
caster:GetTeamNumber())
observer_ward:SetControllableByPlayer(caster:GetPlayerID(), true)
observer_ward:SetOwner(caster)
observer_ward:SetContextThink("ward_lifetime", function()
if observer_ward and not observer_ward:IsNull() then
observer_ward:ForceKill(false)
end
end, duration)
observer_ward:AddNewModifier(caster, nil, "modifier_item_buff_ward", { duration = duration })
local false_position = cast_position + Vector(10, 10, 0)
local sentry_ward = CreateUnitByName("npc_dota_sentry_wards", false_position, true, caster, caster,
caster:GetTeamNumber())
sentry_ward:SetControllableByPlayer(caster:GetPlayerID(), true)
sentry_ward:SetOwner(caster)
sentry_ward:SetContextThink("ward_lifetime", function()
if sentry_ward and not sentry_ward:IsNull() then
sentry_ward:ForceKill(false)
end
end, duration)
sentry_ward:AddNewModifier(caster, nil, "modifier_item_buff_ward", { duration = duration })
sentry_ward:AddNewModifier(caster, nil, "modifier_item_ward_true_sight", {
true_sight_range = 1050,
duration = duration
})
caster:EmitSound("DOTA_Item.ObserverWard.Activate")
end
function item_zhuque_p:CastFilterResultTarget(target)
if target == self:GetCaster() then
return UF_FAIL_CUSTOM
end
return UnitFilter(target, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING,
DOTA_UNIT_TARGET_FLAG_NONE, self:GetCaster():GetTeamNumber())
end
function item_zhuque_p:GetCustomCastErrorTarget(target)
if target == self:GetCaster() then
return "#dota_hud_error_cant_cast_on_self"
end
return ""
end
LinkLuaModifier("modifier_item_zhuque_p_active_buff", "items/item_zhuque_p.lua", LUA_MODIFIER_MOTION_NONE)
modifier_item_zhuque_p_active_buff = class({})
function modifier_item_zhuque_p_active_buff:IsHidden() return false end
function modifier_item_zhuque_p_active_buff:IsPurgable() return true end
function modifier_item_zhuque_p_active_buff:IsBuff() return true end
function modifier_item_zhuque_p_active_buff:OnCreated()
if not self:GetAbility() then return end
self.ms_pct = self:GetAbility():GetSpecialValueFor("active_ms_pct") or 60
end
function modifier_item_zhuque_p_active_buff:DeclareFunctions()
return {
MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
MODIFIER_PROPERTY_IGNORE_MOVESPEED_LIMIT,
}
end
function modifier_item_zhuque_p_active_buff:GetModifierMoveSpeedBonus_Percentage()
return self.ms_pct
end
function modifier_item_zhuque_p_active_buff:GetModifierIgnoreMovespeedLimit()
return 1
end
function modifier_item_zhuque_p_active_buff:CheckState()
return {
[MODIFIER_STATE_ALLOW_PATHING_THROUGH_CLIFFS] = true,
[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
[MODIFIER_STATE_FLYING] = true,
}
end
function modifier_item_zhuque_p_active_buff:GetTexture()
return "zhuquezhang"
end
modifier_item_zhuque_p_stats = class({})
function modifier_item_zhuque_p_stats:IsHidden() return true end
function modifier_item_zhuque_p_stats:IsPurgable() return false end
function modifier_item_zhuque_p_stats:RemoveOnDeath() return false end
function modifier_item_zhuque_p_stats:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_zhuque_p_stats:DeclareFunctions()
return {
MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
}
end
function modifier_item_zhuque_p_stats:OnCreated()
if not self:GetAbility() then return end
self.ms_pct = self:GetAbility():GetSpecialValueFor("passive_ms_bonus") or 60
self.damage_pct = self:GetAbility():GetSpecialValueFor("passive_base_damage_bonus") or 100
self.damage_bonus = self:GetAbility():GetSpecialValueFor("passive_damage_bonus") or 500
self.amp_bonus = self:GetAbility():GetSpecialValueFor("passive_amp_bonus") or 50
end
function modifier_item_zhuque_p_stats:GetModifierSpellAmplify_Percentage()
return self.amp_bonus
end
function modifier_item_zhuque_p_stats:GetModifierPreAttack_BonusDamage()
return self.damage_bonus
end
function modifier_item_zhuque_p_stats:GetModifierBaseDamageOutgoing_Percentage()
return self.damage_pct
end
function modifier_item_zhuque_p_stats:GetModifierMoveSpeedBonus_Constant()
return self.ms_pct
end
