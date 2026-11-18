if _G.MindControlTracker == nil then
_G.MindControlTracker = {
botControlCounts = {},
GetControlCount = function(self, bot)
local index = bot:GetEntityIndex()
return self.botControlCounts[index] or 0
end,
IncrementControlCount = function(self, bot)
local index = bot:GetEntityIndex()
self.botControlCounts[index] = (self.botControlCounts[index] or 0) + 1
return self.botControlCounts[index]
end,
ResetControlCount = function(self, bot)
local index = bot:GetEntityIndex()
self.botControlCounts[index] = 0
end
}
end
function OnSpellStart(keys)
local caster = keys.caster
local target = keys.target
local ability = keys.ability
end
modifier_mind_control = class({})
function modifier_mind_control:IsHidden()
return false
end
function modifier_mind_control:IsPurgable()
return false
end
function modifier_mind_control:RemoveOnDeath()
return true
end
function modifier_mind_control:IsDebuff()
return true
end
function modifier_mind_control:DeclareFunctions()
return {
MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
}
end
function modifier_mind_control:GetModifierIncomingDamage_Percentage()
local reduction = -90
if self:GetAbility() then
reduction = self:GetAbility():GetSpecialValueFor("damage_reduction")
end
return reduction
end
function modifier_mind_control:GetModifierStatusResistanceStacking()
local resistance = -90
if self:GetAbility() then
resistance = self:GetAbility():GetSpecialValueFor("status_resistance")
end
return resistance
end
function modifier_mind_control:OnCreated(params)
if not IsServer() then return end
local parent = self:GetParent()
local caster = self:GetCaster()
if not parent:IsRealHero() or IsHumanPlayer(parent:GetPlayerOwnerID()) then
self:Destroy()
return
end
local baseDuration = self:GetAbility():GetSpecialValueFor("duration")
local controlCount = _G.MindControlTracker:GetControlCount(parent)
local duration = math.max(3, baseDuration - controlCount)
_G.MindControlTracker:IncrementControlCount(parent)
print(string.format("[MindControl] Bot controlled %d times, duration: %.1f -> %.1f",
controlCount, baseDuration, duration))
self.originalPlayerID = parent:GetPlayerOwnerID()
self.originalTeam = parent:GetTeam()
self.controllerPlayerID = caster:GetPlayerOwnerID()
self.controllerTeam = caster:GetTeam()
self.originalDayVision = parent:GetDayTimeVisionRange()
self.originalNightVision = parent:GetNightTimeVisionRange()
print("[MindControl] Original player ID: " .. tostring(self.originalPlayerID))
print("[MindControl] Controller player ID: " .. tostring(self.controllerPlayerID))
print("[MindControl] Original team: " .. tostring(self.originalTeam))
print("[MindControl] Controller team: " .. tostring(self.controllerTeam))
local parent_name = parent:GetUnitName() or parent:GetName()
local HeroName = string.gsub(parent_name, "npc_dota_hero_", "")
local message = "！" .. duration .. "年之期已到，" .. HeroName .. " 出手吧!"
Say(caster, message, false)
self:DisableAI(parent)
parent:Stop()
parent:Interrupt()
parent:SetTeam(self.controllerTeam)
parent:SetPlayerID(self.controllerPlayerID)
parent:SetControllableByPlayer(self.controllerPlayerID, true)
Timers:CreateTimer(0.03, function()
if not parent or parent:IsNull() then return end
parent:SetControllableByPlayer(self.controllerPlayerID, true)
parent:SetDayTimeVisionRange(400)
parent:SetNightTimeVisionRange(400)
end)
Timers:CreateTimer(0.1, function()
if not parent or parent:IsNull() then return end
local enemies = FindUnitsInRadius(
parent:GetTeamNumber(),
parent:GetAbsOrigin(),
nil,
parent:GetAttackRange() + 300,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE,
FIND_CLOSEST,
false
)
if #enemies > 0 then
local target = enemies[1]
ExecuteOrderFromTable({
UnitIndex = parent:GetEntityIndex(),
OrderType = DOTA_UNIT_ORDER_ATTACK_TARGET,
TargetIndex = target:GetEntityIndex(),
Queue = false
})
end
end)
self.particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_templar_assassin/templar_assassin_refraction.vpcf",
PATTACH_OVERHEAD_FOLLOW,
parent
)
self:AddParticle(self.particle, false, false, -1, false, false)
Timers:CreateTimer(0.1, function()
if not parent or parent:IsNull() then return end
for i = 0, 8 do
local item = parent:GetItemInSlot(i)
if item then
item:SetActivated(true)
print("[MindControl] Activated item in slot " .. i .. ": " .. item:GetAbilityName())
end
end
end)
self:StartIntervalThink(0.5)
Timers:CreateTimer(duration, function()
if not self:IsNull() then
self:Destroy()
end
end)
end
function modifier_mind_control:OnIntervalThink()
if not IsServer() then return end
local parent = self:GetParent()
if not parent or parent:IsNull() then return end
for i = 0, 8 do
local item = parent:GetItemInSlot(i)
if item and not item:IsActivated() then
item:SetActivated(true)
print("[MindControl] Re-activated item: " .. item:GetAbilityName())
end
end
end
function modifier_mind_control:OnDestroy()
if not IsServer() then return end
local parent = self:GetParent()
if not parent or parent:IsNull() then return end
parent:Stop()
parent:Interrupt()
parent:SetDayTimeVisionRange(self.originalDayVision or 1800)
parent:SetNightTimeVisionRange(self.originalNightVision or 800)
parent:SetTeam(self.originalTeam)
parent:SetPlayerID(self.originalPlayerID)
parent:SetControllableByPlayer(self.originalPlayerID, true)
for i = 0, 8 do
local item = parent:GetItemInSlot(i)
if item then
item:SetActivated(true)
end
end
ParticleManager:DestroyParticle(self.particle, false)
ParticleManager:ReleaseParticleIndex(self.particle)
Timers:CreateTimer(0.5, function()
if not parent or parent:IsNull() then return end
parent:Stop()
self:EnableAI(parent)
end)
end
function modifier_mind_control:CheckState()
return {
[MODIFIER_STATE_DEBUFF_IMMUNE] = true,
}
end
function modifier_mind_control:DisableAI(hero)
self.removedModifiers = {}
local luaModifiers = {
"modifier_bot_think_strategy",
"modifier_bot_think_ward"
}
for _, modName in pairs(luaModifiers) do
if hero:HasModifier(modName) then
hero:RemoveModifierByName(modName)
table.insert(self.removedModifiers, modName)
end
end
local tsModifiers = {
"BotBaseAIModifier",
"LionAIModifier",
"ViperAIModifier",
"LunaAIModifier",
"SniperAIModifier",
"MedusaAIModifier",
"DrowRangerAIModifier",
"SkeletonAIModifier",
"ShadowShamanAIModifier"
}
for _, modName in pairs(tsModifiers) do
if hero:HasModifier(modName) then
hero:RemoveModifierByName(modName)
table.insert(self.removedModifiers, modName)
end
end
end
function modifier_mind_control:EnableAI(hero)
if GameRules.AI then
local tsModifiers = {
"BotBaseAIModifier",
"LionAIModifier",
"ViperAIModifier",
"LunaAIModifier",
"SniperAIModifier",
"MedusaAIModifier",
"DrowRangerAIModifier",
"SkeletonAIModifier",
"ShadowShamanAIModifier"
}
for _, modName in pairs(tsModifiers) do
if hero:HasModifier(modName) then
hero:RemoveModifierByName(modName)
end
end
Timers:CreateTimer(0.05, function()
if not hero or hero:IsNull() then return end
hero:SetBotDifficulty(4)
GameRules.AI:EnableAI(hero)
end)
end
if self.removedModifiers then
for _, modName in pairs(self.removedModifiers) do
if not hero:HasModifier(modName) then
hero:AddNewModifier(hero, nil, modName, {})
end
end
end
end
