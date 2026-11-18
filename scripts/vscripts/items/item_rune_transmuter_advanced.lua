item_rune_transmuter_advanced = class({})
function item_rune_transmuter_advanced:OnSpellStart()
local caster = self:GetCaster()
local rune_pools = {
{
"item_fusion_hawkeye",
"item_fusion_forbidden",
"item_fusion_brutal",
"item_fusion_beast",
"item_fusion_life",
"item_fusion_shadow",
"item_fusion_magic",
"item_fusion_agile",
},
{
"item_qinglong",
"item_zhuque",
"item_xuanwu",
"item_baihu",
},
}
local runes_to_transform = {}
local owned_rune_types = {}
for i = 0, 8 do
local item = caster:GetItemInSlot(i)
if item then
local item_name = item:GetName()
for _, pool in pairs(rune_pools) do
for _, rune_type in pairs(pool) do
if item_name == rune_type then
table.insert(runes_to_transform, {
slot = i,
item = item,
type = item_name,
pool = pool,
})
owned_rune_types[item_name] = true
break
end
end
end
end
end
if #runes_to_transform == 0 then
DisplayError(caster:GetPlayerOwnerID(), "#dota_hud_error_no_runes")
self:RefundManaCost()
self:EndCooldown()
return
end
for _, rune_data in pairs(runes_to_transform) do
local pool = rune_data.pool
local available_runes = {}
for _, rune_type in pairs(pool) do
if rune_type ~= rune_data.type and not owned_rune_types[rune_type] then
table.insert(available_runes, rune_type)
end
end
local target_rune
if #available_runes > 0 then
target_rune = available_runes[RandomInt(1, #available_runes)]
else
local different_runes = {}
for _, rune_type in pairs(pool) do
if rune_type ~= rune_data.type then
table.insert(different_runes, rune_type)
end
end
target_rune = different_runes[RandomInt(1, #different_runes)]
end
caster:RemoveItem(rune_data.item)
local new_rune = CreateItem(target_rune, caster, caster)
if new_rune then
caster:AddItem(new_rune)
owned_rune_types[target_rune] = true
end
end
EmitSoundOn("Item.TomeOfKnowledge", caster)
local particle = ParticleManager:CreateParticle(
"particles/items2_fx/hand_of_midas.vpcf",
PATTACH_ABSORIGIN_FOLLOW,
caster
)
ParticleManager:ReleaseParticleIndex(particle)
self:SpendCharge(1)
end
