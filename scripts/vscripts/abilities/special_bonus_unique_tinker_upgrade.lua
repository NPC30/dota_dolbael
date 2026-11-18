LinkLuaModifier("modifier_special_bonus_unique_tinker_upgrade",
"abilities/special_bonus_unique_tinker_upgrade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_special_bonus_unique_tinker_upgrade_spell_amp",
"abilities/special_bonus_unique_tinker_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_tinker_upgrade = class({})
local TINKER_PUPPET_DEBUG = false
local TINKER_PUPPET_REMOVE_DELAY = 2.0
local function PuppetDebug(caster, puppet_id, message)
if not TINKER_PUPPET_DEBUG then return end
local caster_name = "nil"
if caster and not caster:IsNull() then
caster_name = caster:GetUnitName()
end
print(string.format("[TinkerPuppet:%s][%s] %s", tostring(puppet_id), caster_name, message))
end
function special_bonus_unique_tinker_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_tinker_upgrade"
end
function special_bonus_unique_tinker_upgrade:OnSpellStart()
if not IsServer() then return end
CreateTinkerLaserPuppet(self:GetCaster(), self, self:GetCursorPosition())
end
modifier_special_bonus_unique_tinker_upgrade = class({})
function modifier_special_bonus_unique_tinker_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_tinker_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_tinker_upgrade:RemoveOnDeath() return false end
function modifier_special_bonus_unique_tinker_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_DEATH
}
end
local function CopyBuffIfPresent(caster, dummy, modifier_name)
if caster:HasModifier(modifier_name) then
dummy:AddNewModifier(caster, nil, modifier_name, { duration = -1 })
end
end
local function CopyFirstSelectedItemIfPresent(caster, dummy, item_names)
for _, item_name in ipairs(item_names) do
local item = caster:FindItemInInventory(item_name)
if item and not item:IsNull() then
local copied = dummy:AddItemByName(item_name)
if copied then
copied:SetCurrentCharges(item:GetCurrentCharges())
copied:SetLevel(item:GetLevel())
end
return item_name
end
end
return nil
end
local function CopyAbilityIfPresent(caster, dummy, ability_name)
local source = caster:FindAbilityByName(ability_name)
if not source or source:IsNull() or source:GetLevel() <= 0 then return end
local copied = dummy:AddAbility(ability_name)
if copied then
copied:SetLevel(math.min(source:GetLevel(), copied:GetMaxLevel()))
end
end
local function RemovePuppetFromList(caster, puppet)
if not caster or caster:IsNull() or not caster._tinker_laser_puppets then return end
local alive = {}
for _, unit in pairs(caster._tinker_laser_puppets) do
if unit and not unit:IsNull() and unit ~= puppet and unit:IsAlive() and not unit._tinker_puppet_destroyed then
table.insert(alive, unit)
end
end
caster._tinker_laser_puppets = alive
end
local function DestroyPuppet(caster, puppet)
local puppet_id = puppet and puppet._tinker_puppet_id or "unknown"
PuppetDebug(caster, puppet_id, "destroy start")
RemovePuppetFromList(caster, puppet)
if not puppet or puppet:IsNull() then
PuppetDebug(caster, puppet_id, "destroy skipped: puppet invalid")
return
end
if puppet._tinker_puppet_destroyed then
PuppetDebug(caster, puppet_id, "destroy skipped: already marked")
return
end
puppet._tinker_puppet_destroyed = true
puppet:Stop()
puppet:Interrupt()
puppet:AddNoDraw()
puppet:SetAbsOrigin(Vector(0, 0, -10000))
puppet:AddNewModifier(caster, nil, "modifier_kill", { duration = TINKER_PUPPET_REMOVE_DELAY })
PuppetDebug(caster, puppet_id, "destroy marked")
Timers:CreateTimer(TINKER_PUPPET_REMOVE_DELAY, function()
PuppetDebug(caster, puppet_id, "destroy done")
return nil
end)
end
function CreateTinkerLaserPuppet(caster, ability, pos)
if not IsServer() then return end
if not caster or caster:IsNull() or not ability or ability:IsNull() then return end
local laser = caster:FindAbilityByName("tinker_laser")
if not laser or laser:IsNull() or laser:GetLevel() <= 0 then return end
caster._tinker_laser_puppet_seq = (caster._tinker_laser_puppet_seq or 0) + 1
local puppet_id = caster._tinker_laser_puppet_seq
PuppetDebug(caster, puppet_id, "active cast detected")
caster._tinker_laser_puppets = caster._tinker_laser_puppets or {}
local alive = {}
for _, unit in pairs(caster._tinker_laser_puppets) do
if unit and not unit:IsNull() and unit:IsAlive() and not unit._tinker_puppet_destroyed then
table.insert(alive, unit)
end
end
caster._tinker_laser_puppets = alive
local max_puppets = ability:GetSpecialValueFor("max_puppets")
while #caster._tinker_laser_puppets >= max_puppets do
local old = table.remove(caster._tinker_laser_puppets, 1)
DestroyPuppet(caster, old)
end
if not pos then
pos = caster:GetAbsOrigin()
end
local dummy = CreateUnitByName("dummy_unit_hero", pos, false, caster, caster, caster:GetTeamNumber())
if not dummy or dummy:IsNull() then
PuppetDebug(caster, puppet_id, "create failed")
return
end
dummy._tinker_puppet_id = puppet_id
PuppetDebug(caster, puppet_id, "created dummy_unit_hero")
dummy:SetOwner(caster)
dummy:SetControllableByPlayer(caster:GetPlayerID(), true)
dummy:SetMana(9999)
dummy:SetModel("models/heroes/tinker/tinker_turret.vmdl")
dummy:SetOriginalModel("models/heroes/tinker/tinker_turret.vmdl")
dummy:SetModelScale(0.65)
PuppetDebug(caster, puppet_id, "basic setup done")
CopyBuffIfPresent(caster, dummy, "modifier_item_ultimate_scepter")
CopyBuffIfPresent(caster, dummy, "modifier_item_ultimate_scepter_consumed")
CopyBuffIfPresent(caster, dummy, "modifier_item_ultimate_scepter_2_consumed")
CopyBuffIfPresent(caster, dummy, "modifier_item_aghanims_shard")
PuppetDebug(caster, puppet_id, "copied aghanim modifiers")
dummy:AddNewModifier(caster, ability, "modifier_special_bonus_unique_tinker_upgrade_spell_amp", {
spell_amp = caster:GetSpellAmplification(false)
})
PuppetDebug(caster, puppet_id, "spell amp modifier added")
local dummy_laser = dummy:AddAbility("tinker_laser")
if dummy_laser then
dummy_laser:SetLevel(math.min(laser:GetLevel(), dummy_laser:GetMaxLevel()))
PuppetDebug(caster, puppet_id, "tinker_laser added level=" .. tostring(dummy_laser:GetLevel()))
else
PuppetDebug(caster, puppet_id, "tinker_laser add failed")
end
local dummy_laser_talent = dummy:AddAbility("special_bonus_unique_tinker_4")
if dummy_laser_talent then
dummy_laser_talent:SetLevel(1)
PuppetDebug(caster, puppet_id, "special_bonus_unique_tinker_4 added")
else
PuppetDebug(caster, puppet_id, "special_bonus_unique_tinker_4 add failed")
end
CopyAbilityIfPresent(caster, dummy, "special_bonus_unique_tinker")
PuppetDebug(caster, puppet_id, "special_bonus_unique_tinker inherited if present")
local inherited_item = CopyFirstSelectedItemIfPresent(caster, dummy, { "item_gungir_3", "item_forbidden_staff" })
PuppetDebug(caster, puppet_id, "selected item inherited=" .. tostring(inherited_item))
table.insert(caster._tinker_laser_puppets, dummy)
PuppetDebug(caster, puppet_id, "registered puppet count=" .. tostring(#caster._tinker_laser_puppets))
local duration = ability:GetSpecialValueFor("puppet_duration")
local laser_level = math.max(laser:GetLevel() - 1, 0)
local interval_floor = ability:GetSpecialValueFor("laser_interval_extra")
local interval = math.max(laser:GetCooldown(laser_level) * caster:GetCooldownReduction() - 1, interval_floor)
local cast_range = laser:GetCastRange(caster:GetAbsOrigin(), nil)
PuppetDebug(caster, puppet_id, "timer prepared interval=" .. tostring(interval) .. " cast_range=" .. tostring(cast_range))
Timers:CreateTimer(0.5, function()
if not dummy or dummy:IsNull() then
PuppetDebug(caster, puppet_id, "timer stop: dummy null")
return nil
end
if dummy and dummy._tinker_puppet_destroyed then
PuppetDebug(caster, puppet_id, "timer stop: destroyed flag")
return nil
end
if not caster or caster:IsNull() or not caster:IsAlive() then
PuppetDebug(caster, puppet_id, "timer stop: caster invalid/dead")
DestroyPuppet(caster, dummy)
return nil
end
if not dummy:IsAlive() then
PuppetDebug(caster, puppet_id, "timer stop: dummy invalid/dead")
return nil
end
if not dummy_laser or dummy_laser:IsNull() then
PuppetDebug(caster, puppet_id, "timer stop: laser invalid")
return nil
end
local enemies = FindUnitsInRadius(
dummy:GetTeamNumber(),
dummy:GetAbsOrigin(),
nil,
cast_range,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_CLOSEST,
false
)
if #enemies > 0 then
PuppetDebug(caster, puppet_id, "casting laser target=" .. enemies[1]:GetUnitName())
dummy_laser:EndCooldown()
dummy:SetMana(9999)
dummy:CastAbilityOnTarget(enemies[1], dummy_laser, caster:GetPlayerOwnerID())
else
PuppetDebug(caster, puppet_id, "no target")
end
return interval
end)
Timers:CreateTimer(duration, function()
DestroyPuppet(caster, dummy)
return nil
end)
end
function modifier_special_bonus_unique_tinker_upgrade:OnDeath(params)
if not IsServer() then return end
local caster = self:GetParent()
if not caster._tinker_laser_puppets then return end
for _, puppet in pairs(caster._tinker_laser_puppets) do
if params.unit == puppet then
DestroyPuppet(caster, puppet)
return
end
end
end
modifier_special_bonus_unique_tinker_upgrade_spell_amp = class({})
function modifier_special_bonus_unique_tinker_upgrade_spell_amp:IsHidden() return true end
function modifier_special_bonus_unique_tinker_upgrade_spell_amp:IsPurgable() return false end
function modifier_special_bonus_unique_tinker_upgrade_spell_amp:RemoveOnDeath() return false end
function modifier_special_bonus_unique_tinker_upgrade_spell_amp:OnCreated(kv)
self.spell_amp = (tonumber(kv.spell_amp) or 0) * 100
end
function modifier_special_bonus_unique_tinker_upgrade_spell_amp:DeclareFunctions()
return {
MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE
}
end
function modifier_special_bonus_unique_tinker_upgrade_spell_amp:GetModifierSpellAmplify_Percentage()
return self.spell_amp
end
