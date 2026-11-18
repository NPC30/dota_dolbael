item_titanium_ward_eye = class({})
function item_titanium_ward_eye:OnSpellStart()
self:PlaceWards(self:GetCaster(), self:GetCursorPosition())
end

local function CastNativeWardItem(caster, item_name, cast_position)
local ward_item = CreateItem(item_name, caster:GetPlayerOwner(), caster)
if not ward_item then return false end
ward_item:SetOwner(caster)
ward_item:SetPurchaser(caster)
ward_item:SetCurrentCharges(1)
caster:SetCursorCastTarget(nil)
caster:SetCursorTargetingNothing(true)
caster:SetCursorPosition(cast_position)
ward_item:OnSpellStart()
if ward_item and not ward_item:IsNull() then
UTIL_Remove(ward_item)
end
return true
end

function item_titanium_ward_eye:PlaceWards(caster, cast_position)
if not caster or caster:IsNull() then return end
local position = GetGroundPosition(cast_position, caster)
CastNativeWardItem(caster, "item_ward_observer", position)
CastNativeWardItem(caster, "item_ward_sentry", position)
end
