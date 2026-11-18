LinkLuaModifier("modifier_arc_warden_scepter2_fixed", "abilities/arc_warden_scepter2_fixed", LUA_MODIFIER_MOTION_NONE)
arc_warden_scepter2_fixed = class({})
function arc_warden_scepter2_fixed:OnSpellStart()
local caster = self:GetCaster()
local allowed_runes = {
DOTA_RUNE_DOUBLEDAMAGE,
DOTA_RUNE_HASTE,
DOTA_RUNE_INVISIBILITY,
DOTA_RUNE_REGENERATION,
DOTA_RUNE_BOUNTY,
DOTA_RUNE_ARCANE
}
local random_index = RandomInt(1, #allowed_runes)
local selected_rune = allowed_runes[random_index]
local rune = CreateRune(caster:GetAbsOrigin(), selected_rune)
if rune then
EmitSoundOnLocationForAllies(caster:GetAbsOrigin(), "Rune.Spawn", caster)
if caster:GetPlayerOwner() then
caster:GetPlayerOwner():MakeHeroGlow()
end
end
end
