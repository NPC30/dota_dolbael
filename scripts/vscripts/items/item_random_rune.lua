item_random_rune = class({})
function item_random_rune:OnSpellStart()
local caster = self:GetCaster()
if not caster or caster:IsNull() then
return
end
local rune_types = {
"item_qinglong",
"item_xuanwu",
"item_zhuque",
"item_baihu",
"item_fusion_hawkeye",
"item_fusion_forbidden",
"item_fusion_brutal",
"item_fusion_beast",
"item_fusion_life",
"item_fusion_shadow",
"item_fusion_magic",
"item_fusion_agile",
}
local target_rune = rune_types[RandomInt(1, #rune_types)]
local new_rune = CreateItem(target_rune, caster, caster)
if new_rune then
caster:AddItem(new_rune)
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
