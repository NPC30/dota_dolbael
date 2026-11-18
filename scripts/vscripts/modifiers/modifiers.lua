function CDOTA_Modifier_Lua:CheckUnique(bCreated)
local hParent = self:GetParent()
if bCreated then
local mod = hParent:FindAllModifiersByName(self:GetName())
if #mod >= 2 then
self:SetStackCount(1)
return true
else
self:SetStackCount(0)
return false
end
else
if self:GetStackCount() == 0 then
local mod = hParent:FindModifierByName(self:GetName())
if mod then
mod:SetStackCount(0)
end
end
return nil
end
end
function CDOTA_Modifier_Lua:CheckUniqueValue(value, tSuperiorModifierNames)
local hParent = self:GetParent()
if tSuperiorModifierNames then
for _,sSuperiorMod in pairs(tSuperiorModifierNames) do
if hParent:HasModifier(sSuperiorMod) then
return 0
end
end
end
if bit.band(self:GetAttributes(), MODIFIER_ATTRIBUTE_MULTIPLE) == MODIFIER_ATTRIBUTE_MULTIPLE then
if self:GetStackCount() == 1 then
return 0
end
end
return value
end
function CDOTA_Modifier_Lua:CheckMotionControllers()
local parent = self:GetParent()
local modifier_priority = self:GetMotionControllerPriority()
local is_motion_controller = false
local motion_controller_priority
local found_modifier_handler
local non_imba_motion_controllers =
{"modifier_brewmaster_storm_cyclone",
"modifier_dark_seer_vacuum",
"modifier_eul_cyclone",
"modifier_earth_spirit_rolling_boulder_caster",
"modifier_huskar_life_break_charge",
"modifier_invoker_tornado",
"modifier_item_forcestaff_active",
"modifier_rattletrap_hookshot",
"modifier_phoenix_icarus_dive",
"modifier_shredder_timber_chain",
"modifier_slark_pounce",
"modifier_spirit_breaker_charge_of_darkness",
"modifier_tusk_walrus_punch_air_time",
"modifier_earthshaker_enchant_totem_leap"}
local modifiers = parent:FindAllModifiers()
for _,modifier in pairs(modifiers) do
if self ~= modifier then
if modifier.IsMotionController then
if modifier:IsMotionController() then
found_modifier_handler = modifier
is_motion_controller = true
motion_controller_priority = modifier:GetMotionControllerPriority()
break
end
end
for _,non_imba_motion_controller in pairs(non_imba_motion_controllers) do
if modifier:GetName() == non_imba_motion_controller then
found_modifier_handler = modifier
is_motion_controller = true
motion_controller_priority = DOTA_MOTION_CONTROLLER_PRIORITY_HIGHEST
break
end
end
end
end
if is_motion_controller and motion_controller_priority then
if motion_controller_priority > modifier_priority then
return false
elseif motion_controller_priority == modifier_priority then
if found_modifier_handler:GetCreationTime() >= self:GetCreationTime() then
return false
else
found_modifier_handler:Destroy()
return true
end
else
parent:InterruptMotionControllers(true)
found_modifier_handler:Destroy()
return true
end
else
return true
end
end
