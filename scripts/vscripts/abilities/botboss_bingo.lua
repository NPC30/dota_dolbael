LinkLuaModifier("modifier_botboss_bingo", "abilities/botboss_bingo", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_botboss_bingo_stack", "abilities/botboss_bingo", LUA_MODIFIER_MOTION_NONE)
botboss_bingo = class({})
function botboss_bingo:GetIntrinsicModifierName()
return "modifier_botboss_bingo"
end
modifier_botboss_bingo = class({})
function modifier_botboss_bingo:IsHidden()
return false
end
function modifier_botboss_bingo:GetStackCount()
local ability = self:GetAbility()
local base_chance = ability:GetSpecialValueFor("base_kill_chance")
local chance_per_death = ability:GetSpecialValueFor("kill_chance_per_death")
local chance_per_kill = ability:GetSpecialValueFor("kill_chance_per_kill")
local max_chance = ability:GetSpecialValueFor("max_kill_chance")
return math.min(base_chance + self.death_count * chance_per_death, max_chance) +
math.min(max_chance, self.kill_count * chance_per_kill)
end
function modifier_botboss_bingo:IsPurgable() return false end
function modifier_botboss_bingo:RemoveOnDeath() return false end
function modifier_botboss_bingo:OnCreated()
if not IsServer() then return end
self.death_count = 0
self.kill_count = 0
self:SetHasCustomTransmitterData(true)
self:SetStackCount(self:GetStackCount())
end
function modifier_botboss_bingo:AddCustomTransmitterData()
return {
death_count = self.death_count or 0,
kill_count = self.kill_count or 0
}
end
function modifier_botboss_bingo:HandleCustomTransmitterData(data)
self.death_count = data.death_count or 0
self.kill_count = data.kill_count or 0
end
function modifier_botboss_bingo:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ATTACK_LANDED,
MODIFIER_EVENT_ON_DEATH,
MODIFIER_PROPERTY_TOOLTIP,
MODIFIER_PROPERTY_TOOLTIP2
}
end
function modifier_botboss_bingo:OnAttackLanded(params)
if not IsServer() then return end
if params.attacker ~= self:GetParent() then return end
local caster = self:GetParent()
local target = params.target
if target:IsBuilding() then
return
end
local ability = self:GetAbility()
if not ability then
return
end
local modifier = target:FindModifierByNameAndCaster("modifier_botboss_bingo_stack", caster)
local stack_duration = ability:GetSpecialValueFor("stack_duration")
if not modifier then
target:AddNewModifier(caster, ability, "modifier_botboss_bingo_stack", {
duration = stack_duration
})
modifier = target:FindModifierByNameAndCaster("modifier_botboss_bingo_stack", caster)
else
modifier:SetDuration(stack_duration, true)
end
if modifier then
modifier:IncrementStackCount()
local max_stacks = ability:GetSpecialValueFor("max_stacks")
local min_stacks = ability:GetSpecialValueFor("min_stacks")
max_stacks = max(max_stacks - self.kill_count, min_stacks)
if modifier:GetStackCount() >= max_stacks then
self:TryExecute(target)
end
end
end
function modifier_botboss_bingo:OnDeath(params)
if not IsServer() then return end
if params.unit ~= self:GetParent() then return end
self.death_count = self.death_count + 1
local parent = self:GetParent()
self:SetStackCount(self:GetStackCount())
self:SendBuffRefreshToClients()
end
function modifier_botboss_bingo:TryExecute(target)
if not IsServer() then return end
if not target or target:IsNull() then return end
local ability = self:GetAbility()
local base_chance = ability:GetSpecialValueFor("base_kill_chance")
local chance_per_death = ability:GetSpecialValueFor("kill_chance_per_death")
local chance_per_kill = ability:GetSpecialValueFor("kill_chance_per_kill")
local max_chance = ability:GetSpecialValueFor("max_kill_chance")
local current_chance = math.min(base_chance + self.death_count * chance_per_death, max_chance) +
math.min(max_chance, self.kill_count * chance_per_kill)
if RollPseudoRandomPercentage(current_chance / 10, DOTA_PSEUDO_RANDOM_CUSTOM_GAME_1, self:GetParent()) then
local fx = ParticleManager:CreateParticle(
"particles/items3_fx/blink_overwhelming_burst.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
target
)
self:AddParticle(fx, false, false, -1, false, false)
target:Kill(ability, self:GetParent())
self.kill_count = self.kill_count + 1
local parent = self:GetParent()
self:SetStackCount(self:GetStackCount())
self:SendBuffRefreshToClients()
target:EmitSound("Hero_Axe.Culling_Blade_Success")
ParticleManager:ReleaseParticleIndex(fx)
else
end
end
function modifier_botboss_bingo:OnTooltip()
return self.death_count or 0
end
function modifier_botboss_bingo:OnTooltip2()
return self.kill_count or 0
end
modifier_botboss_bingo_stack = class({})
function modifier_botboss_bingo_stack:IsHidden() return false end
function modifier_botboss_bingo_stack:IsDebuff() return true end
function modifier_botboss_bingo_stack:IsPurgable() return false end
function modifier_botboss_bingo_stack:GetAttributes()
return MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_botboss_bingo_stack:OnCreated()
if not IsServer() then return end
end
function modifier_botboss_bingo_stack:DeclareFunctions()
return {
MODIFIER_PROPERTY_TOOLTIP
}
end
function modifier_botboss_bingo_stack:OnTooltip()
return self:GetStackCount()
end
