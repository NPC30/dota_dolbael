LinkLuaModifier("modifier_item_beast_armor_passive", "items/item_beast_armor.lua", LUA_MODIFIER_MOTION_NONE)
function BeastArmorOnCreated(keys)
if not IsServer() then return end
local caster = keys.caster
local ability = keys.ability
if not caster or not ability then return end
caster:AddNewModifier(caster, ability, "modifier_item_beast_armor_passive", {})
caster:AddNewModifier(caster, ability, "modifier_item_blade_mail", {})
ability.beast_armor_radiance_modifier = nil
end
function BeastArmorOnDestroy(keys)
if not IsServer() then return end
local caster = keys.caster
if not caster then return end
caster:RemoveModifierByName("modifier_item_beast_armor_passive")
caster:RemoveModifierByName("modifier_item_blade_mail")
local ability = keys.ability
if ability and ability.beast_armor_radiance_modifier and not ability.beast_armor_radiance_modifier:IsNull() then
ability.beast_armor_radiance_modifier:Destroy()
ability.beast_armor_radiance_modifier = nil
end
end
function OnSpellStart(keys)
local caster = keys.caster
local ability = keys.ability
if not caster or not ability then return end
local duration = ability:GetSpecialValueFor("active_duration")
local radius = ability:GetSpecialValueFor("blast_radius")
local damage = ability:GetSpecialValueFor("blast_damage")
EmitSoundOn("DOTA_Item.BladeMail.Activate", caster)
caster:AddNewModifier(caster, ability, "modifier_item_blade_mail_reflect", { duration = duration })
caster:AddNewModifier(caster, ability, "modifier_item_lotus_orb_active", { duration = duration })
local particle = ParticleManager:CreateParticle("particles/items2_fx/shivas_guard_active.vpcf",
PATTACH_ABSORIGIN_FOLLOW, caster)
ParticleManager:SetParticleControl(particle, 0, caster:GetAbsOrigin())
ParticleManager:SetParticleControl(particle, 1, Vector(radius, radius, radius))
ParticleManager:ReleaseParticleIndex(particle)
EmitSoundOn("DOTA_Item.ShivasGuard.Activate", caster)
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for _, enemy in pairs(enemies) do
ApplyDamage({
victim = enemy,
attacker = caster,
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = ability
})
ability:ApplyDataDrivenModifier(caster, enemy, "modifier_item_beast_armor_debuff", {
duration = duration * (1 - enemy:GetStatusResistance())
})
local particle = ParticleManager:CreateParticle("particles/items2_fx/shivas_guard_impact.vpcf",
PATTACH_ABSORIGIN_FOLLOW, enemy)
ParticleManager:ReleaseParticleIndex(particle)
end
end
modifier_item_beast_armor_passive = class({})
function modifier_item_beast_armor_passive:IsHidden() return true end
function modifier_item_beast_armor_passive:IsPurgable() return false end
function modifier_item_beast_armor_passive:RemoveOnDeath() return true end
function modifier_item_beast_armor_passive:GetAttributes()
return MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
function modifier_item_beast_armor_passive:CheckState()
return {
[MODIFIER_STATE_UNSLOWABLE] = true
}
end
function modifier_item_beast_armor_passive:OnCreated()
if IsServer() then
if not self:GetAbility() then return end
local ability = self:GetAbility()
self.block_cooldown = ability:GetSpecialValueFor("block_cooldown")
self.last_block_time = 0
end
end
function modifier_item_beast_armor_passive:DeclareFunctions()
return {
MODIFIER_PROPERTY_ABSORB_SPELL,
}
end
function modifier_item_beast_armor_passive:GetAbsorbSpell(params)
if not IsServer() then return 0 end
local caster = params.ability:GetCaster()
if not IsEnemy(caster, self:GetParent()) then return 0 end
local current_time = GameRules:GetGameTime()
if current_time - self.last_block_time < self.block_cooldown then
return 0
end
self.last_block_time = current_time
local particle = ParticleManager:CreateParticle("particles/items_fx/immunity_sphere.vpcf", PATTACH_ABSORIGIN_FOLLOW,
self:GetParent())
ParticleManager:ReleaseParticleIndex(particle)
EmitSoundOn("DOTA_Item.LinkensSphere.Activate", self:GetParent())
return 1
end
