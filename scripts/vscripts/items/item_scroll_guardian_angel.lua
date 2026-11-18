item_scroll_guardian_angel = class({})
LinkLuaModifier("modifier_item_scroll_guardian_angel_watch", "items/item_scroll_guardian_angel.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_scroll_guardian_angel_building", "items/item_scroll_guardian_angel.lua", LUA_MODIFIER_MOTION_NONE)
local function FindTeamBuildings(team)
local buildings = {}
local classes = {
"npc_dota_tower",
"npc_dota_barracks",
"npc_dota_fort",
"npc_dota_healer"
}
for _, class_name in pairs(classes) do
local entities = Entities:FindAllByClassname(class_name) or {}
for _, building in pairs(entities) do
if building and not building:IsNull() and building:GetTeamNumber() == team then
table.insert(buildings, building)
end
end
end
return buildings
end
function item_scroll_guardian_angel:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
local duration = self:GetSpecialValueFor("watch_duration")
local existing = caster:FindModifierByName("modifier_item_scroll_guardian_angel_watch")
if existing then
existing:SetDuration(duration, true)
else
caster:AddNewModifier(caster, self, "modifier_item_scroll_guardian_angel_watch", { duration = duration })
end
caster:EmitSound("Hero_Omniknight.GuardianAngel.Cast")
self:SpendCharge(1)
end
modifier_item_scroll_guardian_angel_watch = class({})
function modifier_item_scroll_guardian_angel_watch:IsHidden() return false end
function modifier_item_scroll_guardian_angel_watch:IsPurgable() return false end
function modifier_item_scroll_guardian_angel_watch:RemoveOnDeath() return false end
function modifier_item_scroll_guardian_angel_watch:GetTexture() return "scroll_guardian_angel" end
function modifier_item_scroll_guardian_angel_watch:DeclareFunctions()
return { MODIFIER_EVENT_ON_DEATH }
end
function modifier_item_scroll_guardian_angel_watch:OnDeath(params)
if not IsServer() then return end
local unit = params.unit
local parent = self:GetParent()
if not unit or unit:IsNull() or not unit:IsBuilding() then return end
if unit:GetTeamNumber() ~= parent:GetTeamNumber() then return end
local ability = self:GetAbility()
local invulnerable_duration = ability and ability:GetSpecialValueFor("invulnerable_duration") or 10
for _, building in pairs(FindTeamBuildings(parent:GetTeamNumber())) do
if building:IsAlive() then
building:AddNewModifier(parent, ability, "modifier_item_scroll_guardian_angel_building", {
duration = invulnerable_duration
})
building:EmitSound("Hero_Omniknight.GuardianAngel")
end
end
self:Destroy()
end
modifier_item_scroll_guardian_angel_building = class({})
function modifier_item_scroll_guardian_angel_building:IsHidden() return false end
function modifier_item_scroll_guardian_angel_building:IsPurgable() return false end
function modifier_item_scroll_guardian_angel_building:GetTexture() return "scroll_guardian_angel" end
function modifier_item_scroll_guardian_angel_building:OnCreated()
local ability = self:GetAbility()
self.bonus_armor = ability and ability:GetSpecialValueFor("bonus_armor") or 99999
self.bonus_magic_resistance = ability and ability:GetSpecialValueFor("bonus_magic_resistance") or 99
end
function modifier_item_scroll_guardian_angel_building:OnRefresh()
self:OnCreated()
end
function modifier_item_scroll_guardian_angel_building:DeclareFunctions()
return {
MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS
}
end
function modifier_item_scroll_guardian_angel_building:GetModifierPhysicalArmorBonus()
return self.bonus_armor
end
function modifier_item_scroll_guardian_angel_building:GetModifierMagicalResistanceBonus()
return self.bonus_magic_resistance
end
