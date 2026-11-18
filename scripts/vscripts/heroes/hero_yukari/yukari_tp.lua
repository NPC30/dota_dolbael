yukari_tp = class({})
LinkLuaModifier( "modifier_yukari_tp", "modifiers/hero_yukari/modifier_yukari_tp", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_yukari_tp_2", "modifiers/hero_yukari/modifier_yukari_tp_2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_yukari_umb", "heroes/hero_yukari/yukari_tp", LUA_MODIFIER_MOTION_NONE )
function yukari_tp:GetIntrinsicModifierName()
return "modifier_yukari_umb"
end
function yukari_tp:OnUpgrade()
local ability = self:GetCaster():FindAbilityByName("yukari_mass_tp")
if ability and ability:GetLevel() < self:GetLevel() then
ability:SetLevel(self:GetLevel())
end
end
function yukari_tp:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local damage = self:GetSpecialValueFor( "damage_x" )
if target:TriggerSpellAbsorb( self ) then return end
local duration = self:GetSpecialValueFor( "prison_duration" )
target:AddNewModifier(
caster,
self,
"modifier_yukari_tp_2",
{ duration = 0.1 }
)
target:AddNewModifier(
caster,
self,
"modifier_yukari_tp",
{ duration = duration }
)
local sound_cast = "yukari.portal"
EmitSoundOn( sound_cast, caster )
end
modifier_yukari_umb = class ({})
function modifier_yukari_umb:IsHidden() return true end
function modifier_yukari_umb:IsDebuff() return false end
function modifier_yukari_umb:IsPurgable() return false end
function modifier_yukari_umb:IsPurgeException() return false end
function modifier_yukari_umb:RemoveOnDeath() return false end
function modifier_yukari_umb:OnCreated()
if IsServer() then
self:StartIntervalThink(FrameTime())
end
end
function modifier_yukari_umb:OnRefresh()
if IsServer() then
end
end
function modifier_yukari_umb:OnIntervalThink()
hideability = self:GetParent():FindAbilityByName("yukari_moon_portal")
if hideability and not hideability:IsActivated() then
hideability:SetActivated(true)
end
if IsServer() then
local umbrella_girl = self:GetParent():FindAbilityByName("ability_thdots_yukari04")
if umbrella_girl and not umbrella_girl:IsNull() then
if self:GetParent():HasScepter() then
if umbrella_girl:IsHidden() then
umbrella_girl:SetHidden(false)
end
else
if not umbrella_girl:IsHidden() then
umbrella_girl:SetHidden(true)
end
end
end
end
end
