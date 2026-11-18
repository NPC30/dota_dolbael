item_qinglong_p = class({})
LinkLuaModifier("modifier_item_qinglong_tracker", "items/item_qinglong.lua",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_qinglong_buff", "items/item_qinglong.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_qinglong_building_buff", "items/item_qinglong.lua",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_qinglong_p_spell_amp", "items/item_qinglong_p.lua",
LUA_MODIFIER_MOTION_NONE)
function item_qinglong_p:GetIntrinsicModifierName()
return "modifier_item_qinglong_p_spell_amp"
end
function item_qinglong_p:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local duration = self:GetSpecialValueFor("duration") or 9
local weiguang_duration = duration * 2
if not target then
local blink_start_particle = ParticleManager:CreateParticle(
"particles/items_fx/blink_dagger_start.vpcf", PATTACH_ABSORIGIN, caster)
ParticleManager:ReleaseParticleIndex(blink_start_particle)
FindClearSpaceForUnit(caster, self:GetCursorPosition(), true)
caster:EmitSound("DOTA_Item.BlinkDagger.Activate")
local blink_end_particle = ParticleManager:CreateParticle(
"particles/items_fx/blink_dagger_end.vpcf", PATTACH_ABSORIGIN, caster)
ParticleManager:ReleaseParticleIndex(blink_end_particle)
caster:AddNewModifier(caster, self, "modifier_item_glimmer_cape_fade", { duration = weiguang_duration })
return
end
if (target:GetTeamNumber() ~= caster:GetTeamNumber()) then
self:EndCooldown()
self:RefundManaCost()
return
end
caster:EmitSound("Hero_OgreMagi.Bloodlust.Cast")
caster:EmitSound("Item.GlimmerCape.Activate")
local caster_tracker = caster:FindModifierByName("modifier_item_qinglong_tracker")
if caster_tracker then
caster_tracker:SetDuration(duration, true)
else
caster:AddNewModifier(caster, self, "modifier_item_qinglong_tracker", { duration = duration })
end
target:EmitSound("Hero_OgreMagi.Bloodlust.Target")
if target:IsBuilding() then
target:AddNewModifier(caster, self, "modifier_item_qinglong_building_buff", { duration = duration })
else
target:AddNewModifier(caster, self, "modifier_item_qinglong_buff", { duration = duration })
local target_tracker = target:FindModifierByName("modifier_item_qinglong_tracker")
if target_tracker then
target_tracker:SetDuration(duration, true)
else
target:AddNewModifier(caster, self, "modifier_item_qinglong_tracker", { duration = duration })
end
end
if IsServer() then
caster:AddNewModifier(caster, self, "modifier_item_glimmer_cape_fade", { duration = weiguang_duration })
end
end
function item_qinglong_p:CastFilterResultTarget(target)
if target == self:GetCaster() then
return UF_FAIL_CUSTOM
end
return UnitFilter(target, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BUILDING,
DOTA_UNIT_TARGET_FLAG_NONE, self:GetCaster():GetTeamNumber())
end
function item_qinglong_p:GetCustomCastErrorTarget(target)
if target == self:GetCaster() then
return "#dota_hud_error_cant_cast_on_self"
end
return ""
end
modifier_item_qinglong_p_spell_amp = class({})
function modifier_item_qinglong_p_spell_amp:IsHidden() return true end
function modifier_item_qinglong_p_spell_amp:IsPurgable() return false end
function modifier_item_qinglong_p_spell_amp:RemoveOnDeath() return false end
function modifier_item_qinglong_p_spell_amp:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_qinglong_p_spell_amp:OnCreated()
self.stats_modifier_name = "modifier_item_qinglong_p_stats"
if not self:GetAbility() then self:Destroy() end
self.spell_amp_per_int = self:GetAbility():GetSpecialValueFor("spell_amp_per_int")
if not IsServer() then return end
for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
mod:GetAbility():SetSecondaryCharges(_)
end
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
function modifier_item_qinglong_p_spell_amp:DeclareFunctions()
return { MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE }
end
function modifier_item_qinglong_p_spell_amp:GetModifierSpellAmplify_Percentage()
if self:GetParent():HasModifier("modifier_item_magic_abyss_staff") then
return 0
end
if self:GetParent():HasModifier("modifier_item_magic_crit_blade") then
return 0
end
if self:GetParent():HasModifier("modifier_item_magic_phantom_crit_blade") then
return 0
end
if self:GetAbility() and self:GetAbility():GetSecondaryCharges() == 1 then
local parent = self:GetParent()
if parent:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
local current_int = parent:GetIntellect(false)
return current_int * self.spell_amp_per_int
elseif parent:GetTeamNumber() == DOTA_TEAM_BADGUYS then
local total_stats = parent:GetStrength() + parent:GetAgility() + parent:GetIntellect(false)
return total_stats * self.spell_amp_per_int / 3
end
end
end
function modifier_item_qinglong_p_spell_amp:OnDestroy()
if not IsServer() then return end
for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
mod:GetAbility():SetSecondaryCharges(_)
end
RefreshItemDataDrivenModifier(_, self:GetAbility(), self.stats_modifier_name)
end
