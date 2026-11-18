function BeastShieldOnCreated(keys)
if not IsServer() then return end
local caster = keys.caster
local ability = keys.ability
if not caster or not ability then return end
caster:AddNewModifier(caster, ability, "modifier_item_eternal_shroud", {})
end
function BeastShieldOnDestroy(keys)
if not IsServer() then return end
local caster = keys.caster
if not caster then return end
caster:RemoveModifierByName("modifier_item_eternal_shroud")
end

function BeastShieldOnSpellStart(keys)
if not IsServer() then return end
local caster = keys.caster
local ability = keys.ability
if not caster or not ability then return end
local duration = ability:GetSpecialValueFor("active_duration")
EmitSoundOn("DOTA_Item.BlackKingBar.Activate", caster)
caster:AddNewModifier(caster, ability, "modifier_black_king_bar_immune", {
duration = duration,
Duration = duration
})
ability:ApplyDataDrivenModifier(caster, caster, "modifier_item_beast_shield_active", {
duration = duration
})
end
