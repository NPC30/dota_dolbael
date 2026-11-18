item_forbidden_staff = class({})
local FORBIDDEN_STAFF_TALISMAN_ITEMS = {
item_zhuque = true,
}
local FORBIDDEN_STAFF_MAX_LEVEL = 10
local FORBIDDEN_STAFF_MAX_BASIC_TARGETS = 12
local FORBIDDEN_STAFF_DROP_CACHE_TTL = 2.0
local FORBIDDEN_STAFF_WARD_TARGET_TYPE = DOTA_UNIT_TARGET_OTHER or DOTA_UNIT_TARGET_ALL
_G.ForbiddenStaffZhuqueDropCache = _G.ForbiddenStaffZhuqueDropCache or { next_refresh_time = 0, drops = {} }
LinkLuaModifier("modifier_item_forbidden_staff", "items/item_forbidden_staff", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_forbidden_staff_sheep", "items/item_forbidden_staff", LUA_MODIFIER_MOTION_NONE)
function item_forbidden_staff:GetIntrinsicModifierName()
return "modifier_item_forbidden_staff"
end
function item_forbidden_staff:GetAOERadius()
return self:GetSpecialValueFor("radius")
end
function item_forbidden_staff:OnSpellStart()
local caster = self:GetCaster()
self:EnsureForbiddenStaffLevel()
local radius = self:GetSpecialValueFor("radius")
local target_point = self:GetCursorPosition()
if self:GetAutoCastState() then
self:ConsumeDroppedTalismans(target_point, radius)
return
end
local enemies, hero_count = self:FindOptimizedTargets(caster, target_point, radius)
EmitSoundOn("Hero_Silencer.Curse.Cast", self:GetParent())
local damage_targets = {}
local damage = self:GetStaffDamage(caster)
for _, enemy in pairs(enemies) do
if not enemy:IsMagicImmune() and not enemy:TriggerSpellAbsorb(self) then
self:ApplyNecrolyteDebuff(enemy)
damage_targets[#damage_targets + 1] = enemy
end
end
self:ApplyDelayedDamageBatch(damage_targets, damage)
self:ApplyAreaLightningEffect(target_point, radius)
self:DestroyWardsOptimized(caster, target_point, radius)
EmitSoundOn("DOTA_Item.MeteorHammer.Impact", caster)
if hero_count <= 0 then
self:ConsumeDroppedTalismans(target_point, radius)
end
end
function item_forbidden_staff:FindOptimizedTargets(caster, target_point, radius)
local heroes = FindUnitsInRadius(
caster:GetTeamNumber(),
target_point,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
FIND_ANY_ORDER,
false
)
local creeps = FindUnitsInRadius(
caster:GetTeamNumber(),
target_point,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
FIND_CLOSEST,
false
)
local targets = {}
for _, hero in pairs(heroes) do
targets[#targets + 1] = hero
end
local basic_count = 0
for _, creep in pairs(creeps) do
if basic_count >= FORBIDDEN_STAFF_MAX_BASIC_TARGETS then
break
end
targets[#targets + 1] = creep
basic_count = basic_count + 1
end
return targets, #heroes
end
function item_forbidden_staff:DestroyWardsOptimized(caster, target_point, radius)
local wards = FindUnitsInRadius(
caster:GetOpposingTeamNumber(),
target_point,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_BOTH,
FORBIDDEN_STAFF_WARD_TARGET_TYPE,
DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
FIND_ANY_ORDER,
false
)
for _, ward in pairs(wards) do
local ward_name = ward:GetUnitName()
if ward_name == "npc_dota_observer_wards" or ward_name == "npc_dota_sentry_wards" then
ward:Kill(nil, caster)
end
end
end
function item_forbidden_staff:ConsumeDroppedTalismans(target_point, radius)
local caster = self:GetCaster()
if not caster or caster:IsNull() then
return
end
local current_level = self:EnsureForbiddenStaffLevel()
if current_level >= FORBIDDEN_STAFF_MAX_LEVEL then
return
end
local item_drops = self:GetCachedZhuqueDrops()
local consumed_count = 0
for _, item_drop in pairs(item_drops) do
if current_level + consumed_count >= FORBIDDEN_STAFF_MAX_LEVEL then
break
end
if item_drop and not item_drop:IsNull() then
local item = item_drop:GetContainedItem()
if item and not item:IsNull() then
local distance = (item_drop:GetAbsOrigin() - target_point):Length2D()
if FORBIDDEN_STAFF_TALISMAN_ITEMS[item:GetName()] and distance <= radius then
item:RemoveSelf()
item_drop:RemoveSelf()
consumed_count = consumed_count + 1
end
end
end
end
if consumed_count <= 0 then
return
end
self:UpgradeForbiddenStaff(consumed_count)
EmitSoundOn("Item.TomeOfKnowledge", caster)
end
function item_forbidden_staff:GetCachedZhuqueDrops()
local cache = _G.ForbiddenStaffZhuqueDropCache
local now = GameRules:GetGameTime()
if cache.next_refresh_time and now < cache.next_refresh_time then
local alive = {}
for _, drop in pairs(cache.drops or {}) do
if drop and not drop:IsNull() then
alive[#alive + 1] = drop
end
end
cache.drops = alive
return alive
end
local all_drops = Entities:FindAllByClassname("dota_item_drop")
local zhuque_drops = {}
for _, item_drop in pairs(all_drops) do
if item_drop and not item_drop:IsNull() then
local item = item_drop:GetContainedItem()
if item and not item:IsNull() and FORBIDDEN_STAFF_TALISMAN_ITEMS[item:GetName()] then
zhuque_drops[#zhuque_drops + 1] = item_drop
end
end
end
cache.drops = zhuque_drops
cache.next_refresh_time = now + FORBIDDEN_STAFF_DROP_CACHE_TTL
return zhuque_drops
end
function item_forbidden_staff:UpgradeForbiddenStaff(levels_to_add)
local current_level = self:EnsureForbiddenStaffLevel()
local target_level = math.min(FORBIDDEN_STAFF_MAX_LEVEL, current_level + levels_to_add)
if target_level <= current_level then
return
end
self:SetLevel(target_level)
end
function item_forbidden_staff:EnsureForbiddenStaffLevel()
local current_level = math.max(self:GetLevel(), 1)
if self:GetLevel() < 1 then
self:SetLevel(current_level)
end
return current_level
end
function item_forbidden_staff:GetStaffDamage(caster)
local blast_att_multiplier = self:GetSpecialValueFor("necrolyte_att_multiplier")
local all_att = caster:GetStrength() + caster:GetAgility() + caster:GetIntellect(false)
return all_att * blast_att_multiplier + self:GetSpecialValueFor("lightning_damage")
end
function item_forbidden_staff:ApplyNecrolyteDebuff(target)
local caster = self:GetCaster()
local int_reduction_rate = self:GetSpecialValueFor("int_reduction_rate")
local int_reduction = 0
if target:IsHero() then
local intellect = target:GetIntellect(false)
int_reduction = -math.floor(intellect * int_reduction_rate / 100)
end
local duration = self:GetSpecialValueFor("sheep_duration") * (1 - target:GetStatusResistance())
target:AddNewModifier(caster, self, "modifier_item_forbidden_staff_sheep", {
duration = duration,
int_reduction = int_reduction,
})
if target:IsHero() then
EmitSoundOn("DOTA_Item.Sheepstick.Activate", target)
end
end
function item_forbidden_staff:ApplyDelayedDamageBatch(targets, damage)
local caster = self:GetCaster()
Timers:CreateTimer(0.03, function()
for _, target in pairs(targets) do
if target and not target:IsNull() then
ApplyDamage({
victim = target,
attacker = caster,
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = self,
})
end
end
end)
end
function item_forbidden_staff:ApplyAreaLightningEffect(target_point, radius)
local effect_radius = radius + 200
local particle = ParticleManager:CreateParticle(
"particles/items4_fx/meteor_hammer_spell.vpcf",
PATTACH_WORLDORIGIN,
nil
)
ParticleManager:SetParticleControl(particle, 0, target_point + Vector(0, 0, 100))
ParticleManager:SetParticleControl(particle, 1, target_point)
ParticleManager:SetParticleControl(particle, 2, Vector(0.1, 0, 0))
ParticleManager:SetParticleControl(particle, 3, Vector(effect_radius, effect_radius, effect_radius))
ParticleManager:ReleaseParticleIndex(particle)
end
modifier_item_forbidden_staff = class({})
function modifier_item_forbidden_staff:IsHidden() return true end
function modifier_item_forbidden_staff:IsPurgable() return false end
function modifier_item_forbidden_staff:RemoveOnDeath() return false end
function modifier_item_forbidden_staff:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_forbidden_staff:OnCreated()
self:OnRefresh()
end
function modifier_item_forbidden_staff:OnRefresh()
if IsServer() then
local ability = self:GetAbility()
local parent = self:GetParent()
if ability and not ability:IsNull() and parent and not parent:IsNull() then
parent:RemoveModifierByName("modifier_item_gungir")
parent:AddNewModifier(parent, ability, "modifier_item_gungir", {})
end
end
end
function modifier_item_forbidden_staff:OnDestroy()
if IsServer() then
local parent = self:GetParent()
Timers:CreateTimer(0, function()
if parent and not parent:IsNull() and not parent:HasModifier("modifier_item_forbidden_staff") then
parent:RemoveModifierByName("modifier_item_gungir")
end
end)
end
end
function modifier_item_forbidden_staff:DeclareFunctions()
return {}
end
modifier_item_forbidden_staff_sheep = class({})
function modifier_item_forbidden_staff_sheep:IsHidden() return false end
function modifier_item_forbidden_staff_sheep:IsDebuff() return true end
function modifier_item_forbidden_staff_sheep:IsPurgable() return true end
function modifier_item_forbidden_staff_sheep:GetTexture()
return "jinjifachui"
end
function modifier_item_forbidden_staff_sheep:OnCreated(kv)
if not IsServer() then return end
self.int_reduction = kv.int_reduction or 0
local model_list = { "models/props_gameplay/pig.vmdl", "models/props_gameplay/sheep01.vmdl" }
self.model_file = model_list[RandomInt(1, #model_list)]
if self:GetAbility() then
self.sheep_movement_speed = self:GetAbility():GetSpecialValueFor("sheep_movement_speed") or 140
end
end
function modifier_item_forbidden_staff_sheep:CheckState()
return {
[MODIFIER_STATE_SILENCED] = true,
[MODIFIER_STATE_MUTED] = true,
[MODIFIER_STATE_DISARMED] = true,
[MODIFIER_STATE_HEXED] = true,
}
end
function modifier_item_forbidden_staff_sheep:DeclareFunctions()
return {
MODIFIER_PROPERTY_MOVESPEED_BASE_OVERRIDE,
MODIFIER_PROPERTY_MODEL_CHANGE,
MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
}
end
function modifier_item_forbidden_staff_sheep:GetModifierBonusStats_Intellect(params)
return self.int_reduction
end
function modifier_item_forbidden_staff_sheep:GetModifierMoveSpeedOverride()
return self.sheep_movement_speed or 140
end
function modifier_item_forbidden_staff_sheep:GetModifierModelChange()
return self.model_file
end
