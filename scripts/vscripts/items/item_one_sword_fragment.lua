item_one_sword_fragment = class({})
local ONE_SWORD_ITEM = "item_one_sword"
local DRAGON_BALL_ITEMS = {
"item_dragon_ball_1",
"item_dragon_ball_2",
"item_dragon_ball_3",
"item_dragon_ball_4",
"item_dragon_ball_5",
"item_dragon_ball_6",
"item_dragon_ball_7"
}
local DRAGON_BALL_SET = {}
for _, item_name in pairs(DRAGON_BALL_ITEMS) do
DRAGON_BALL_SET[item_name] = true
end
function item_one_sword_fragment:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
if not caster or caster:IsNull() then
self:EndCooldown()
return
end
local radius = self:GetSpecialValueFor("radius")
if radius <= 0 then
radius = 600
end
local found = self:FindDroppedDragonBalls(caster:GetAbsOrigin(), radius)
for _, item_name in pairs(DRAGON_BALL_ITEMS) do
if not found[item_name] then
self:EndCooldown()
return
end
end
for _, item_name in pairs(DRAGON_BALL_ITEMS) do
local record = found[item_name]
if record.item and not record.item:IsNull() then
record.item:RemoveSelf()
end
if record.drop and not record.drop:IsNull() then
record.drop:RemoveSelf()
end
end
self:RemoveSelf()
caster:AddItemByName(ONE_SWORD_ITEM)
EmitSoundOn("Item.TomeOfKnowledge", caster)
end
function item_one_sword_fragment:FindDroppedDragonBalls(origin, radius)
local found = {}
local item_drops = Entities:FindAllByClassname("dota_item_drop")
for _, item_drop in pairs(item_drops) do
if item_drop and not item_drop:IsNull() then
local item = item_drop:GetContainedItem()
if item and not item:IsNull() then
local item_name = item:GetName()
if DRAGON_BALL_SET[item_name] and not found[item_name] then
local distance = (item_drop:GetAbsOrigin() - origin):Length2D()
if distance <= radius then
found[item_name] = {
drop = item_drop,
item = item
}
end
end
end
end
end
return found
end
