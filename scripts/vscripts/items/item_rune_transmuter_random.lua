item_rune_transmuter_random = class({})
function item_rune_transmuter_random:OnSpellStart()
local caster = self:GetCaster()
local rune_types = {
"item_fusion_hawkeye",
"item_fusion_forbidden",
"item_fusion_brutal",
"item_fusion_beast",
"item_fusion_life",
"item_fusion_shadow",
"item_fusion_magic",
"item_fusion_agile",
"item_xuanwu",
"item_zhuque",
"item_baihu",
"item_qinglong",
"item_xuanwu_p",
"item_zhuque_p",
"item_baihu_p",
"item_qinglong_p",
}
local runes_to_transform = {}
local owned_rune_types = {}
for i = 0, 8 do
local item = caster:GetItemInSlot(i)
if item then
local item_name = item:GetName()
for _, rune_type in pairs(rune_types) do
if item_name == rune_type then
table.insert(runes_to_transform, { slot = i, item = item, type = item_name })
owned_rune_types[item_name] = true
break
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
caster:RemoveItem(rune_data.item)
local new_rune = CreateItem(rune_data.type, caster, caster)
if new_rune then
caster:AddItem(new_rune)
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
