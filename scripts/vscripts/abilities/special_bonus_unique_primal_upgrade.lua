LinkLuaModifier("modifier_special_bonus_unique_primal_upgrade",
"abilities/special_bonus_unique_primal_upgrade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_special_bonus_unique_primal_upgrade_dash",
"abilities/special_bonus_unique_primal_upgrade", LUA_MODIFIER_MOTION_HORIZONTAL)
special_bonus_unique_primal_upgrade = class({})
local function ForceDropRandomInventoryItem(unit)
if not unit or unit:IsNull() then
return false
end
local slots_with_items = {}
for slot = 0, 5 do
local item = unit:GetItemInSlot(slot)
if item and not item:IsNull() then
table.insert(slots_with_items, item)
end
end
if #slots_with_items <= 0 then
return false
end
local item = slots_with_items[RandomInt(1, #slots_with_items)]
local item_name = item:GetName()
local charges = item:GetCurrentCharges()
local drop_pos = unit:GetAbsOrigin()
unit:RemoveItem(item)
local dropped_item = CreateItem(item_name, nil, nil)
if not dropped_item or dropped_item:IsNull() then
return false
end
if charges and charges > 0 then
dropped_item:SetCurrentCharges(charges)
end
CreateItemOnPositionSync(drop_pos, dropped_item)
return true
end
local function AddPrimalDropTarget(targets, seen, unit)
if not unit or unit:IsNull() or not unit:IsAlive() then return end
local entity_index = unit:entindex()
if seen[entity_index] then return end
seen[entity_index] = true
table.insert(targets, unit)
end
function special_bonus_unique_primal_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_primal_upgrade"
end
function special_bonus_unique_primal_upgrade:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
local duration = self:GetSpecialValueFor("dash_duration") or 2
caster:AddNewModifier(caster, self, "modifier_special_bonus_unique_primal_upgrade_dash", { duration = duration })
end
modifier_special_bonus_unique_primal_upgrade = class({})
function modifier_special_bonus_unique_primal_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_primal_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_primal_upgrade:IsDebuff() return false end
function modifier_special_bonus_unique_primal_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_START,
}
end
function modifier_special_bonus_unique_primal_upgrade:OnAbilityStart(keys)
if not IsServer() then return end
local parent = self:GetParent()
if keys.unit ~= parent then
return
end
local selfability = self:GetAbility()
local ability = keys.ability
local abilityName = ability:GetAbilityName()
if abilityName == "primal_beast_pulverize" then
local duration = 5
ApplyItemDataDrivenModifier(_, parent, "modifier_invulnerable_buff", { duration = duration })
local strength_coefficient = selfability:GetSpecialValueFor("strength_coefficient") or 100
self.max_stacks = selfability:GetSpecialValueFor("max_stacks") or 100
local grab_radius = selfability:GetSpecialValueFor("radius") or 600
local caster_strength = parent:GetStrength()
local extra_targets = math.floor(caster_strength / strength_coefficient)
local target = keys.target or ability:GetCursorTarget()
self.target = target
self.affected_units = {}
if target and extra_targets > 0 then
local units = FindUnitsInRadius(parent:GetTeamNumber(),
target:GetAbsOrigin(),
nil,
grab_radius,
selfability:GetAbilityTargetTeam(),
selfability:GetAbilityTargetType(),
selfability:GetAbilityTargetFlags(),
FIND_ANY_ORDER,
false)
local affected_count = 0
for _, unit in pairs(units) do
if unit ~= target and affected_count < extra_targets then
unit:AddNewModifier(parent, ability, "modifier_primal_beast_pulverize", { duration = duration })
table.insert(self.affected_units, {
unit = unit,
original_pos = unit:GetAbsOrigin()
})
affected_count = affected_count + 1
end
end
else
end
self:StartIntervalThink(0.7)
self.check_ability = ability
end
end
function modifier_special_bonus_unique_primal_upgrade:OnIntervalThink()
if not IsServer() then return end
if not self.check_ability or self.check_ability:IsNull() then
self:StartIntervalThink(-1)
return
end
if not self.check_ability:IsChanneling() and not self.check_ability:IsInAbilityPhase() then
self:GetParent():RemoveModifierByName("modifier_invulnerable_buff")
if self.affected_units then
for _, data in pairs(self.affected_units) do
if data.unit and not data.unit:IsNull() and data.unit:IsAlive() then
data.unit:RemoveModifierByName("modifier_primal_beast_pulverize")
FindClearSpaceForUnit(data.unit, data.original_pos, false)
end
end
self.affected_units = nil
end
self:StartIntervalThink(-1)
else
local parent = self:GetParent()
local aoe_buff = parent:FindModifierByName("modifier_primal_beast_pulverize_aoe_buff")
local alive_list = {}
local seen_targets = {}
AddPrimalDropTarget(alive_list, seen_targets, self.target)
if self.affected_units then
for _, data in pairs(self.affected_units) do
AddPrimalDropTarget(alive_list, seen_targets, data.unit)
end
end
local alive_enemies = #alive_list
if alive_enemies > 0 then
local drop_chance = self:GetAbility():GetSpecialValueFor("item_drop_chance") or 0.3
for _, unit in pairs(alive_list) do
local roll = RandomInt(1, 100)
if roll <= drop_chance then
if ForceDropRandomInventoryItem(unit) then
print(string.format("敌人%s被捶爆了！", unit:GetUnitName()))
end
end
end
if aoe_buff then
local current_stacks = aoe_buff:GetStackCount()
local new_stack = math.min(self.max_stacks, current_stacks + alive_enemies)
aoe_buff:SetStackCount(new_stack)
end
end
end
end
modifier_special_bonus_unique_primal_upgrade_dash = class({})
function modifier_special_bonus_unique_primal_upgrade_dash:IsHidden() return false end
function modifier_special_bonus_unique_primal_upgrade_dash:IsPurgable() return false end
function modifier_special_bonus_unique_primal_upgrade_dash:IsDebuff() return false end
function modifier_special_bonus_unique_primal_upgrade_dash:OnCreated()
if not IsServer() then return end
local parent = self:GetParent()
self.direction = parent:GetForwardVector():Normalized()
if self.direction:Length2D() < 0.01 then
self.direction = Vector(1, 0, 0)
end
self.speed = parent:GetIdealSpeed() * 1.25
if self.speed <= 0 then
self.speed = 300
end
if self:ApplyHorizontalMotionController() == false then
self:Destroy()
end
end
function modifier_special_bonus_unique_primal_upgrade_dash:UpdateHorizontalMotion(me, dt)
if not IsServer() then return end
local pos = me:GetAbsOrigin()
local newPos = pos + self.direction * self.speed * dt
me:SetAbsOrigin(GetGroundPosition(newPos, me))
end
function modifier_special_bonus_unique_primal_upgrade_dash:CheckState()
return {
[MODIFIER_STATE_UNSELECTABLE] = true,
[MODIFIER_STATE_UNTARGETABLE] = true,
}
end
