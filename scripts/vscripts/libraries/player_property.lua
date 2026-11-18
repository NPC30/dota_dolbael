local PlayerProperty = {}
local PURE_DAMAGE_REDUCTION_LEVEL_CAP = 8
local PURE_DAMAGE_REDUCTION_VALUE_PER_LEVEL = 11
local PURE_DAMAGE_REDUCTION_FULL_VALUE =
PURE_DAMAGE_REDUCTION_LEVEL_CAP * PURE_DAMAGE_REDUCTION_VALUE_PER_LEVEL
local function get_property_value(unit, property_name)
if not unit or unit:IsNull() then
return 0
end
local modifier = unit:FindModifierByName(property_name)
if not modifier then
return 0
end
return modifier.value or 0
end
function PlayerProperty.GetValue(unit, property_name)
return get_property_value(unit, property_name)
end
function PlayerProperty.IsDebuffOrMagicImmune(unit)
if not unit or unit:IsNull() then
return false
end
if unit.IsDebuffImmune and unit:IsDebuffImmune() then
return true
end
if unit.IsMagicImmune and unit:IsMagicImmune() then
return true
end
return false
end
function PlayerProperty.ApplyPureDamageWithReduction(damage_table)
if not damage_table or damage_table.damage_type ~= DAMAGE_TYPE_PURE then
return ApplyDamage(damage_table)
end
local reduction = get_property_value(damage_table.victim, "property_pure_damage_reduction")
local victim = damage_table.victim
if
reduction >= PURE_DAMAGE_REDUCTION_FULL_VALUE
and victim
and not victim:IsNull()
and PlayerProperty.IsDebuffOrMagicImmune(victim)
then
return 0
end
if reduction > 0 then
damage_table.damage = damage_table.damage * math.max(0, 100 - reduction) / 100
end
return ApplyDamage(damage_table)
end
return PlayerProperty
