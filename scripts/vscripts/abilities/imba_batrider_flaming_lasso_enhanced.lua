LinkLuaModifier("modifier_imba_batrider_flaming_lasso_enhanced", "abilities/imba_batrider_flaming_lasso_enhanced",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_imba_batrider_flaming_lasso_movespeed", "abilities/imba_batrider_flaming_lasso_enhanced",
LUA_MODIFIER_MOTION_NONE)
imba_batrider_flaming_lasso_enhanced = class({})
function imba_batrider_flaming_lasso_enhanced:OnSpellStart()
local target = self:GetCursorTarget()
self:GetCaster():EmitSound("Hero_Batrider.FlamingLasso.Cast")
target:AddNewModifier(self:GetCaster(), self, "modifier_imba_batrider_flaming_lasso_enhanced", {
duration = self:GetSpecialValueFor("duration"),
attacker_entindex = self:GetCaster():entindex()
})
if self:GetCaster():HasScepter() then
local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), target:GetAbsOrigin(), nil,
self:GetSpecialValueFor("grab_radius_scepter"), DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE +
DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_ANY_ORDER, false)
for _, enemy in pairs(enemies) do
if enemy ~= target and enemy:IsConsideredHero() then
enemy:AddNewModifier(target, self, "modifier_imba_batrider_flaming_lasso_enhanced", {
duration = self:GetSpecialValueFor("duration"),
attacker_entindex = self:GetCaster():entindex()
})
break
end
end
end
local movespeed_bonus_duration = self:GetSpecialValueFor("duration")
local movespeed_bonus_pct = self:GetSpecialValueFor("movespeed_bonus_pct")
self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_imba_batrider_flaming_lasso_movespeed",
{ duration = movespeed_bonus_duration, movespeed_pct = movespeed_bonus_pct })
end
modifier_imba_batrider_flaming_lasso_enhanced = class({})
function modifier_imba_batrider_flaming_lasso_enhanced:IsDebuff() return true end
function modifier_imba_batrider_flaming_lasso_enhanced:GetEffectName()
return "particles/units/heroes/hero_batrider/batrider_flaming_lasso_generic_smoke.vpcf"
end
function modifier_imba_batrider_flaming_lasso_enhanced:OnCreated(params)
if not IsServer() then return end
if params.attacker_entindex then
self.attacker = EntIndexToHScript(params.attacker_entindex)
else
self.attacker = self:GetCaster()
end
self.drag_distance = self:GetAbility():GetSpecialValueFor("drag_distance")
self.break_distance = self:GetAbility():GetSpecialValueFor("break_distance")
if self:GetCaster():HasScepter() then
self.damage = self:GetAbility():GetSpecialValueFor("scepter_damage")
else
self.damage = self:GetAbility():GetSpecialValueFor("damage")
end
self.distance_damage_pct = self:GetAbility():GetSpecialValueFor("distance_damage_pct")
self.z_threshold = self:GetAbility():GetSpecialValueFor("z_threshold")
self.z_damage_pct = self:GetAbility():GetSpecialValueFor("z_damage_pct")
self.fountain_kill_chance_base = self:GetAbility():GetSpecialValueFor("fountain_kill_chance_base")
self.fountain_kill_distance_multiplier = self:GetAbility():GetSpecialValueFor("fountain_kill_distance_multiplier")
self.gold_reward = self:GetAbility():GetSpecialValueFor("gold_reward")
self.counter = 0
self.interval = 0.05
self.damage_counter = 0
self.fountain_check_counter = 0
self.total_distance = 0
self.last_position = self:GetParent():GetAbsOrigin()
self.last_z_position = self:GetParent():GetAbsOrigin().z
self.chariot_max_length = self:GetAbility():GetCastRange(self:GetParent():GetAbsOrigin(),
self:GetParent())
self.vector = self:GetParent():GetAbsOrigin() - self:GetCaster():GetAbsOrigin()
self.current_position = self:GetCaster():GetAbsOrigin()
self.damage_table = {
victim = self:GetParent(),
damage = self.damage,
damage_type = self:GetAbility():GetAbilityDamageType(),
damage_flags = DOTA_DAMAGE_FLAG_NONE,
attacker = self.attacker,
ability = self:GetAbility()
}
self.pure_damage_table = {
victim = self:GetParent(),
damage = 0,
damage_type = DAMAGE_TYPE_PURE,
damage_flags = DOTA_DAMAGE_FLAG_NONE,
attacker = self.attacker,
ability = self:GetAbility()
}
self:GetParent():EmitSound("Hero_Batrider.FlamingLasso.Loop")
self.lasso_particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_batrider/batrider_flaming_lasso.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
ParticleManager:SetParticleControlEnt(self.lasso_particle, 0, self:GetCaster(), PATTACH_POINT_FOLLOW,
"lasso_attack", self:GetCaster():GetAbsOrigin(), true)
ParticleManager:SetParticleControlEnt(self.lasso_particle, 1, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc",
self:GetParent():GetAbsOrigin(), true)
self:AddParticle(self.lasso_particle, false, false, -1, false, false)
self.fountain_kill_executed = false
self:StartIntervalThink(self.interval)
end
function modifier_imba_batrider_flaming_lasso_enhanced:OnRefresh(params)
self:OnCreated(params)
end
function modifier_imba_batrider_flaming_lasso_enhanced:OnIntervalThink()
if not self:GetCaster():IsAlive() then
self:Destroy()
return
end
local current_pos = self:GetParent():GetAbsOrigin()
local current_z = current_pos.z
local distance_moved = (current_pos - self.last_position):Length2D()
local z_distance_moved = math.abs(current_z - self.last_z_position)
self.total_distance = self.total_distance + distance_moved
self.vector = self:GetParent():GetAbsOrigin() - self:GetCaster():GetAbsOrigin()
if (self:GetParent():GetAbsOrigin() - self:GetCaster():GetAbsOrigin()):Length2D() > self.drag_distance then
self:GetParent():SetAbsOrigin(GetGroundPosition(
self:GetCaster():GetAbsOrigin() + self.vector:Normalized() * self.drag_distance, nil))
end
self.last_position = current_pos
self.last_z_position = current_z
if z_distance_moved > self.z_threshold then
local z_damage = z_distance_moved * self.z_damage_pct * 0.01
self.pure_damage_table.damage = z_damage
ApplyDamage(self.pure_damage_table)
end
self.damage_counter = self.damage_counter + self.interval
if self.damage_counter >= 0.2 then
if distance_moved > 1 then
local distance_damage = distance_moved * self.distance_damage_pct * 0.01
self.damage_table.damage = distance_damage
ApplyDamage(self.damage_table)
end
self.damage_counter = 0
end
self.fountain_check_counter = self.fountain_check_counter + self.interval
if self.fountain_check_counter >= 1 then
if self:IsInFriendlyFountain(current_pos) and not self.fountain_kill_executed then
local kill_chance = self.fountain_kill_chance_base +
(self.total_distance * self.fountain_kill_distance_multiplier * 0.01)
kill_chance = math.min(kill_chance, 100)
self.fountain_kill_executed = true
local victim_name = self:GetParent():GetUnitName()
local HeroName = string.gsub(victim_name, "npc_dota_hero_", "")
if RandomFloat(0, 100) <= kill_chance then
local messages = {
"风险太高了(" .. math.floor(kill_chance) .. "%)，对不起了" .. HeroName .. "。",
HeroName .. "，对不起，你长得太磕碜了",
"撕了吧",
HeroName .. "，先*后杀!",
}
local message = messages[RandomInt(1, #messages)]
Say(self:GetCaster(), message, false)
self:GetParent():Kill(self:GetAbility(), self.attacker)
else
if (self:GetParent():IsRealHero()) then
local message = "交赎金" .. self.gold_reward .. "，" .. HeroName .. "你回家吃饭吧"
Say(self:GetCaster(), message, false)
self.attacker:ModifyGold(self.gold_reward, true, 0)
SendOverheadEventMessage(self.attacker:GetPlayerOwner(), OVERHEAD_ALERT_GOLD, self.attacker,
self.gold_reward, nil)
else
local message = "抓错人了，" .. HeroName .. "你走吧"
Say(self:GetCaster(), message, false)
end
end
end
self.fountain_check_counter = 0
end
end
function modifier_imba_batrider_flaming_lasso_enhanced:IsInFriendlyFountain(position)
local fountain_radius = 1200
local friendly_fountains = Entities:FindAllByClassname("ent_dota_fountain")
for _, fountain in pairs(friendly_fountains) do
if fountain:GetTeamNumber() == self.attacker:GetTeamNumber() then
local fountain_pos = fountain:GetAbsOrigin()
if (position - fountain_pos):Length2D() <= fountain_radius then
return true
end
end
end
return false
end
function modifier_imba_batrider_flaming_lasso_enhanced:OnDestroy()
if not IsServer() then return end
self:GetParent():StopSound("Hero_Batrider.FlamingLasso.Loop")
self:GetParent():EmitSound("Hero_Batrider.FlamingLasso.End")
FindClearSpaceForUnit(self:GetParent(), self:GetParent():GetAbsOrigin(), false)
end
function modifier_imba_batrider_flaming_lasso_enhanced:CheckState()
return {
[MODIFIER_STATE_STUNNED] = true,
[MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY] = true
}
end
function modifier_imba_batrider_flaming_lasso_enhanced:DeclareFunctions()
return { MODIFIER_PROPERTY_OVERRIDE_ANIMATION, MODIFIER_EVENT_ON_ABILITY_FULLY_CAST }
end
function modifier_imba_batrider_flaming_lasso_enhanced:GetOverrideAnimation()
return ACT_DOTA_FLAIL
end
modifier_imba_batrider_flaming_lasso_movespeed = class({})
function modifier_imba_batrider_flaming_lasso_movespeed:IsDebuff() return false end
function modifier_imba_batrider_flaming_lasso_movespeed:IsPurgable() return false end
function modifier_imba_batrider_flaming_lasso_movespeed:OnCreated(params)
if not IsServer() then return end
self.movespeed_pct = params.movespeed_pct or 0
end
function modifier_imba_batrider_flaming_lasso_movespeed:CheckState()
return {
[MODIFIER_STATE_DISARMED] = true
}
end
function modifier_imba_batrider_flaming_lasso_movespeed:DeclareFunctions()
return { MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE }
end
function modifier_imba_batrider_flaming_lasso_movespeed:GetModifierMoveSpeedBonus_Percentage()
return self.movespeed_pct
end
