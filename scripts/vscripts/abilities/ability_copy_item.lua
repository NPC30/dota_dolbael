ability_copy_item = class({})
function ability_copy_item:OnSpellStart()
local caster = self:GetCaster()
print("[ability_copy_item] OnSpellStart - Caster:", caster:GetUnitName())
self.channel_start_time = GameRules:GetGameTime()
self.channel_duration = self:GetSpecialValueFor("channel_duration")
local spotlight_particle = ParticleManager:CreateParticle(
"particles/generic_gameplay/generic_hit_spotlight.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
caster
)
ParticleManager:ReleaseParticleIndex(spotlight_particle)
print("[ability_copy_item] Channel started, duration:", self.channel_duration)
end
function ability_copy_item:OnChannelFinish(bInterrupted)
local caster = self:GetCaster()
local channel_time = GameRules:GetGameTime() - self.channel_start_time
print("[ability_copy_item] OnChannelFinish - Interrupted:", bInterrupted, "Channel time:", channel_time)
if bInterrupted or not caster:IsAlive() then
print("[ability_copy_item] Failed - Interrupted or caster dead")
return
end
if channel_time < self.channel_duration then
print("[ability_copy_item] Failed - Channel time too short:", channel_time, "< required:", self.channel_duration)
return
end
print("[ability_copy_item] Success - Starting item copy")
local radius = self:GetSpecialValueFor("search_radius")
local heroes = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_NOT_ILLUSIONS + DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
FIND_ANY_ORDER,
false
)
print("[ability_copy_item] Found heroes in radius:", #heroes)
local available_items = {}
for _, hero in pairs(heroes) do
if hero ~= caster then
for i = 0, 8 do
local item = hero:GetItemInSlot(i)
if item and not item:IsNull() then
table.insert(available_items, item:GetName())
print("[ability_copy_item] Found item:", item:GetName(), "on hero:", hero:GetUnitName())
end
end
end
end
print("[ability_copy_item] Total available items:", #available_items)
if #available_items > 0 then
local random_item = available_items[RandomInt(1, #available_items)]
print("[ability_copy_item] Selected random item:", random_item)
local new_item = CreateItem(random_item, caster, caster)
if new_item then
new_item:SetShareability(ITEM_FULLY_SHAREABLE)
caster:AddItem(new_item)
print("[ability_copy_item] Successfully copied item:", random_item)
local item_cost = new_item:GetCost()
local message = ""
if item_cost < 100 then
message = "我TM偷到了绝世神兵,快TM都跪下求我!"
elseif item_cost < 1000 then
message = "发财了发财了,看我看我"
elseif item_cost < 10000 then
message = "有点东西,但不多"
elseif item_cost < 30000 then
message = "搞到了一点便宜的小装备"
else
message = "唉,垃圾垃圾,什么垃圾技能"
end
Say(caster, message, false)
EmitSoundOn("DOTA_Item.PickUp", caster)
else
local message = "杠，毛都没有一根"
Say(caster, message, false)
print("[ability_copy_item] Failed to create item:", random_item)
end
else
print("[ability_copy_item] No items available to copy")
end
end
