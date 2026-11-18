LinkLuaModifier("modifier_item_jump_jump_jump_meteor_form", "items/item_jump_jump_jump.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_jump_jump_jump_meteor_burn", "items/item_jump_jump_jump.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_jump_jump_jump_meteor_stun", "items/item_jump_jump_jump.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_arcane_blink_buff", "items/item_jump_jump_jump.lua", LUA_MODIFIER_MOTION_NONE)
function OnSpellStart(keys)
local caster = keys.caster
local ability = keys.ability
local target_loc = ability:GetCursorPosition()
caster:EmitSound("DOTA_Item.BlinkDagger.Activate")
local blink_pfx = ParticleManager:CreateParticle("particles/items_fx/blink_dagger_start.vpcf", PATTACH_CUSTOMORIGIN,
caster)
ParticleManager:ReleaseParticleIndex(blink_pfx)
FindClearSpaceForUnit(caster, target_loc, true)
ProjectileManager:ProjectileDodge(caster)
caster:EmitSound("Hero_Zuus.LightningBolt")
local blink_end_pfx = ParticleManager:CreateParticle("particles/items_fx/blink_dagger_end.vpcf", PATTACH_ABSORIGIN,
caster)
ParticleManager:ReleaseParticleIndex(blink_end_pfx)
local meteor_land_time = ability:GetSpecialValueFor("meteor_fall_time")
local buff_duration = ability:GetSpecialValueFor("buff_duration") +
meteor_land_time
local meteor_pfx = ParticleManager:CreateParticle("particles/items4_fx/meteor_hammer_spell.vpcf", PATTACH_WORLDORIGIN,
caster)
ParticleManager:SetParticleControl(meteor_pfx, 0, target_loc + Vector(0, 0, 1000))
ParticleManager:SetParticleControl(meteor_pfx, 1, target_loc)
ParticleManager:SetParticleControl(meteor_pfx, 2, Vector(meteor_land_time, 0, 0))
ParticleManager:ReleaseParticleIndex(meteor_pfx)
caster:Purge(false, true, false, false, false)
caster:AddNewModifier(caster, ability, "modifier_item_arcane_blink_buff", { duration = buff_duration })
caster:AddNewModifier(caster, ability, "modifier_item_swift_blink_buff", { duration = buff_duration })
caster:AddNewModifier(caster, ability, "modifier_item_jump_jump_jump_meteor_form", { duration = meteor_land_time })
end
