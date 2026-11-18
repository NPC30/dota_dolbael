item_magic_abyss_staff = class({})
local PlayerProperty = require("libraries/player_property")
local MAGIC_ABYSS_STAFF_UPGRADE_ITEM = "item_qinglong"
local MAGIC_ABYSS_STAFF_MAX_LEVEL = 10
LinkLuaModifier("modifier_item_magic_abyss_staff", "items/item_magic_abyss_staff", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_magic_abyss_staff_active", "items/item_magic_abyss_staff", LUA_MODIFIER_MOTION_NONE)
function item_magic_abyss_staff:GetIntrinsicModifierName()
return "modifier_item_magic_abyss_staff"
end
function item_magic_abyss_staff:OnSpellStart()
local caster = self:GetCaster()
self:EnsureMagicAbyssStaffLevel()
local duration = self:GetSpecialValueFor("active_duration") or 4
local radius = self:GetSpecialValueFor("radius") or 500
local origin = caster:GetAbsOrigin()
caster:AddNewModifier(caster, self, "modifier_item_magic_abyss_staff_active", { duration = duration })
self:ConsumeDroppedQinglong(origin, radius)
EmitSoundOn("Hero_Oracle.FortunesEnd.Target", caster)
end
function item_magic_abyss_staff:ConsumeDroppedQinglong(origin, radius)
local caster = self:GetCaster()
if not caster or caster:IsNull() then
return
end
local current_level = self:EnsureMagicAbyssStaffLevel()
local max_level = MAGIC_ABYSS_STAFF_MAX_LEVEL
if current_level >= max_level then
return
end
local item_drops = Entities:FindAllByClassname("dota_item_drop")
local consumed_count = 0
for _, item_drop in pairs(item_drops) do
if current_level + consumed_count >= max_level then
break
end
if item_drop and not item_drop:IsNull() then
local item = item_drop:GetContainedItem()
if item and not item:IsNull() then
local distance = (item_drop:GetAbsOrigin() - origin):Length2D()
if item:GetName() == MAGIC_ABYSS_STAFF_UPGRADE_ITEM then
if distance <= radius then
item:RemoveSelf()
item_drop:RemoveSelf()
consumed_count = consumed_count + 1
end
end
end
end
end
if consumed_count <= 0 then
return
end
self:SetLevel(math.min(MAGIC_ABYSS_STAFF_MAX_LEVEL, current_level + consumed_count))
EmitSoundOn("Item.TomeOfKnowledge", caster)
end
function item_magic_abyss_staff:EnsureMagicAbyssStaffLevel()
local current_level = math.max(self:GetLevel(), 1)
if self:GetLevel() < 1 then
self:SetLevel(current_level)
end
return current_level
end
modifier_item_magic_abyss_staff = class({})
function modifier_item_magic_abyss_staff:IsHidden() return true end
function modifier_item_magic_abyss_staff:IsPurgable() return false end
function modifier_item_magic_abyss_staff:RemoveOnDeath() return false end
function modifier_item_magic_abyss_staff:OnCreated()
self.stats_modifier_name = "modifier_item_magic_abyss_staff_stats"
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_magic_abyss_staff:OnDestroy()
if IsServer() then
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
end
function modifier_item_magic_abyss_staff:DeclareFunctions()
return {
MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
}
end
function modifier_item_magic_abyss_staff:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_magic_abyss_staff:GetModifierSpellAmplify_Percentage()
local ability = self:GetAbility()
if not ability then return 0 end
local spell_amp_per_int = ability:GetSpecialValueFor("spell_amp_per_int")
if not spell_amp_per_int or spell_amp_per_int == 0 then
return 0
end
local parent = self:GetParent()
if parent:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
local current_int = parent:GetIntellect(false)
return current_int * spell_amp_per_int
else
local total_stats = parent:GetStrength() + parent:GetAgility() + parent:GetIntellect(false)
return total_stats * spell_amp_per_int / 4
end
end
modifier_item_magic_abyss_staff_active = class({})
function modifier_item_magic_abyss_staff_active:IsHidden() return false end
function modifier_item_magic_abyss_staff_active:IsPurgable() return false end
function modifier_item_magic_abyss_staff_active:IsDebuff() return false end
function modifier_item_magic_abyss_staff_active:OnCreated()
if not IsServer() then return end
local parent = self:GetParent()
local ability = self:GetAbility()
if ability then
self.convert_pct = ability:GetSpecialValueFor("convert_pct") or 10
end
local fx = ParticleManager:CreateParticle(
"particles/items3_fx/blink_overwhelming_burst.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
parent
)
self:AddParticle(fx, false, false, -1, false, false)
ParticleManager:ReleaseParticleIndex(fx)
end
function modifier_item_magic_abyss_staff_active:DeclareFunctions()
return {
MODIFIER_EVENT_ON_TAKEDAMAGE,
MODIFIER_PROPERTY_TOOLTIP,
}
end
function modifier_item_magic_abyss_staff_active:OnTooltip()
return self.convert_pct or 10
end
function modifier_item_magic_abyss_staff_active:OnTakeDamage(params)
if not IsServer() then return end
if params.original_damage < 500 then
return
end
if params.attacker ~= self:GetParent() then
return
end
if params.damage_type ~= DAMAGE_TYPE_MAGICAL then
return
end
if ability_name == "item_blade_mail" or
ability_name == "item_blade_mail_2" or
ability_name == "item_beast_armor" then
return
end
if params.inflictor then
local ability_name = params.inflictor:GetAbilityName()
if ability_name == "lich_sinister_gaze" or
string.find(ability_name, "lich_sinister_gaze") then
return
end
end
if bit.band(params.damage_flags, DOTA_DAMAGE_FLAG_REFLECTION) == DOTA_DAMAGE_FLAG_REFLECTION then
return
end
if bit.band(params.damage_flags, DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION) == DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION then
return
end
local ability = self:GetAbility()
if not ability then
return
end
local convert_pct = ability:GetSpecialValueFor("convert_pct") or 10
local pure_damage = params.original_damage * convert_pct / 100
local actual_damage = PlayerProperty.ApplyPureDamageWithReduction({
victim = params.unit,
attacker = self:GetParent(),
damage = pure_damage,
damage_type = DAMAGE_TYPE_PURE,
ability = ability,
damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_REFLECTION +
DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
})
SendOverheadEventMessage(nil, OVERHEAD_ALERT_DAMAGE, params.unit, actual_damage, nil)
end
function modifier_item_magic_abyss_staff_active:GetTexture()
return "moyuanfazhang"
end
