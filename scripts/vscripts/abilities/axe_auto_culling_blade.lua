LinkLuaModifier("modifier_axe_auto_culling_blade", "abilities/axe_auto_culling_blade", LUA_MODIFIER_MOTION_NONE)
axe_auto_culling_blade = axe_auto_culling_blade or class({})
modifier_axe_auto_culling_blade = modifier_axe_auto_culling_blade or class({})
function axe_auto_culling_blade:OnSpellStart()
local caster = self:GetCaster()
local duration = self:GetSpecialValueFor("duration")
caster:AddNewModifier(caster, self, "modifier_axe_auto_culling_blade", { duration = duration })
caster:EmitSound("Hero_Axe.Berserkers_Call")
end
function modifier_axe_auto_culling_blade:IsHidden()
return false
end
function modifier_axe_auto_culling_blade:IsPurgable()
return false
end
function modifier_axe_auto_culling_blade:GetTexture()
return "axe_auto_culling_blade"
end
function modifier_axe_auto_culling_blade:OnCreated()
if not IsServer() then return end
local ability = self:GetAbility()
if not ability then
return
end
local caster = self:GetCaster()
self.check_interval = ability:GetSpecialValueFor("check_interval")
self.kill_modifier = caster:FindModifierByName("modifier_lion_finger_of_death_kill_counter")
self.has_autocast = ability:GetAutoCastState()
self:StartIntervalThink(self.check_interval)
self:OnIntervalThink()
end
function modifier_axe_auto_culling_blade:OnIntervalThink()
if not IsServer() then return end
self:CheckAndExecuteCulling()
end
function modifier_axe_auto_culling_blade:CheckAndExecuteCulling()
local caster = self:GetCaster()
local ability = self:GetAbility()
local culling_blade = caster:FindAbilityByName("axe_culling_blade")
if not culling_blade then
return
end
local culling_range = GetFullCastRange(caster, culling_blade)
local search_range = culling_range
local enemies = FindUnitsInRadius(
caster:GetTeam(),
caster:GetOrigin(),
nil,
search_range,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES +
DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE +
DOTA_UNIT_TARGET_FLAG_NO_INVIS,
FIND_ANY_ORDER,
false
)
local increase_damage_per_kill = ability:GetSpecialValueFor("armor_per_stack")
local base_damage = culling_blade:GetSpecialValueFor("damage")
local armor_damage = 0
if self.kill_modifier then
armor_damage = self.kill_modifier:GetStackCount() * increase_damage_per_kill
end
local spell_amp = caster:GetSpellAmplification(false)
local threshold_damage = (base_damage + armor_damage) * (1 + spell_amp)
for _, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() and enemy:IsAlive() then
local enemy_health = enemy:GetHealth()
if enemy_health <= threshold_damage then
local fx = ParticleManager:CreateParticle(
"particles/items3_fx/blink_overwhelming_burst.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
enemy
)
self:AddParticle(fx, false, false, -1, false, false)
enemy:EmitSound("Hero_Axe.Culling_Blade_Success")
if self.has_autocast then
local targetOrigin = enemy:GetAbsOrigin()
local casterOrigin = caster:GetAbsOrigin()
local direction = casterOrigin - targetOrigin
direction.z = 0
direction = direction:Normalized()
local blinkDistance = 100
local blinkPosition = targetOrigin + direction * blinkDistance
FindClearSpaceForUnit(caster, blinkPosition, true)
end
enemy:Kill(ability, caster)
if enemy:IsAlive() then
culling_blade:EndCooldown()
caster:SetCursorCastTarget(enemy)
caster:CastAbilityImmediately(culling_blade, caster:GetPlayerOwnerID())
caster:SetCursorCastTarget(nil)
end
Timers:CreateTimer(0.1, function()
if not enemy:IsAlive() then
if not self.kill_modifier then
self.kill_modifier = caster:AddNewModifier(caster, ability,
"modifier_axe_culling_blade_permanent",
{ duration = -1 })
end
self.kill_modifier:SetStackCount(self.kill_modifier:GetStackCount() + 1)
end
end)
return
end
end
end
end
function modifier_axe_auto_culling_blade:GetModifierModelScale()
return 50
end
