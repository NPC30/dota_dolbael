LinkLuaModifier("modifier_special_bonus_unique_kunkka_upgrade",
"abilities/special_bonus_unique_kunkka_upgrade", LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_kunkka_upgrade = class({})
function special_bonus_unique_kunkka_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_kunkka_upgrade"
end
modifier_special_bonus_unique_kunkka_upgrade = class({})
function modifier_special_bonus_unique_kunkka_upgrade:IsHidden()
return false
end
function modifier_special_bonus_unique_kunkka_upgrade:IsDebuff()
return false
end
function modifier_special_bonus_unique_kunkka_upgrade:IsPurgable()
return false
end
function modifier_special_bonus_unique_kunkka_upgrade:RemoveOnDeath()
return false
end
function modifier_special_bonus_unique_kunkka_upgrade:OnCreated()
if not IsServer() then return end
self.parent = self:GetParent()
self.ability = self:GetAbility()
self.bonusdamage = 0
self.bonus_attacks_used = 0
self.is_bonus_consuming = false
local interval = self.ability and self.ability:GetSpecialValueFor("rage_tick_interval") or 1.0
if interval <= 0 then interval = 1.0 end
self:GetAbilityValues()
self.rage_points = 0
self:StartIntervalThink(interval)
end
function modifier_special_bonus_unique_kunkka_upgrade:OnRefresh()
if not IsServer() then return end
self.ability = self:GetAbility()
self:GetAbilityValues()
end
function modifier_special_bonus_unique_kunkka_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_INTERVAL_THINK,
MODIFIER_EVENT_ON_ABILITY_EXECUTED,
MODIFIER_EVENT_ON_TAKEDAMAGE,
MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
MODIFIER_EVENT_ON_ATTACK_LANDED,
MODIFIER_PROPERTY_TOOLTIP,
}
end
function modifier_special_bonus_unique_kunkka_upgrade:GetAbilityValues()
local ab = self.ability or self:GetAbility()
if not ab then
self.max_r = 500
self.rps = 5
self.roc = 20
self.roa = 1
self.rage_pct = 1
self.torrent_extra_base = 1
self.torrent_extra_strength_step = 200
self.torrent_extra_max = 5
self.torrent_extra_delay = 0.5
return
end
self.max_r = ab:GetSpecialValueFor("max_rage")
if not self.max_r or self.max_r <= 0 then self.max_r = 999 end
self.rps = ab:GetSpecialValueFor("rage_per_second")
self.roc = ab:GetSpecialValueFor("rage_on_cast")
self.roa = ab:GetSpecialValueFor("rage_on_attacked")
self.torrent_extra_base = ab:GetSpecialValueFor("torrent_extra_base")
if not self.torrent_extra_base or self.torrent_extra_base <= 0 then self.torrent_extra_base = 1 end
self.torrent_extra_strength_step = ab:GetSpecialValueFor("torrent_extra_strength_step")
if not self.torrent_extra_strength_step or self.torrent_extra_strength_step <= 0 then
self.torrent_extra_strength_step = 200
end
self.torrent_extra_max = ab:GetSpecialValueFor("torrent_extra_max")
if not self.torrent_extra_max or self.torrent_extra_max <= 0 then self.torrent_extra_max = 5 end
self.torrent_extra_delay = ab:GetSpecialValueFor("torrent_extra_delay")
if not self.torrent_extra_delay or self.torrent_extra_delay <= 0 then self.torrent_extra_delay = 0.5 end
if not self.roa or self.roa <= 0 then self.roa = 1 end
if not self.rage_pct or self.rage_pct <= 0 then self.rage_pct = 1 end
end
function modifier_special_bonus_unique_kunkka_upgrade:AddRage(amount)
if not IsServer() then return end
local parent = self.parent or self:GetParent()
local cur = self.rage_points or 0
self.rage_points = math.min(self.max_r, cur + amount)
local ad = parent:GetAverageTrueAttackDamage(nil)
local base_dmg = math.max(0, ad - self.bonusdamage)
local bonusdamage = math.floor(base_dmg * self.rage_points * self.rage_pct / 100)
self.bonusdamage = bonusdamage
self:SetStackCount(bonusdamage)
end
function modifier_special_bonus_unique_kunkka_upgrade:OnIntervalThink()
if not IsServer() then return end
local parent = self.parent or self:GetParent()
if not parent or parent:IsNull() or not parent:IsAlive() then return end
self:AddRage(self.rps)
end
function modifier_special_bonus_unique_kunkka_upgrade:OnAbilityExecuted(params)
if not IsServer() then return end
local parent = self.parent or self:GetParent()
if params.unit ~= parent then return end
local ab = params.ability
if ab:IsItem() then return end
self:AddRage(self.roc)
if ab.upgrade_triggered and ab.upgrade_triggered > 0 then return end
if ab:GetAbilityName() == "kunkka_torrent" then
self:CastExtraTorrents(ab)
end
end
function modifier_special_bonus_unique_kunkka_upgrade:CastExtraTorrents(torrent_ability)
if not IsServer() then return end
local parent = self.parent or self:GetParent()
if not parent or parent:IsNull() or not parent:IsAlive() then return end
if torrent_ability.upgrade_triggered and torrent_ability.upgrade_triggered > 0 then return end
local target_pos = torrent_ability:GetCursorPosition()
local radius = torrent_ability:GetAOERadius()
if not radius or radius < 0 then radius = 0 end
local strength_step = self.torrent_extra_strength_step or 200
local max_count = self.torrent_extra_max or 5
local extra_count = (self.torrent_extra_base or 1) + math.floor(parent:GetStrength() / strength_step)
if extra_count > max_count then extra_count = max_count end
if extra_count <= 0 then return end
local cast_point = torrent_ability:GetCastPoint() or 0.1
torrent_ability:SetOverrideCastPoint(0.0)
torrent_ability.upgrade_triggered = extra_count
for i = 1, extra_count do
Timers:CreateTimer((self.torrent_extra_delay or 0.5) * i, function()
if not parent or parent:IsNull() or not parent:IsAlive() then
torrent_ability.upgrade_triggered = nil
torrent_ability:SetOverrideCastPoint(cast_point)
return nil
end
torrent_ability:EndCooldown()
parent:SetCursorPosition(target_pos + RandomVector(radius))
parent:CastAbilityImmediately(torrent_ability, parent:GetPlayerOwnerID())
if i >= extra_count then
torrent_ability.upgrade_triggered = nil
torrent_ability:SetOverrideCastPoint(cast_point)
end
return nil
end)
end
end
function modifier_special_bonus_unique_kunkka_upgrade:GetModifierPreAttack_BonusDamage()
return self:GetStackCount()
end
function modifier_special_bonus_unique_kunkka_upgrade:OnAttackLanded(params)
if not IsServer() then return end
local parent = self.parent or self:GetParent()
local attacker = params.attacker
if params.target == parent and attacker and attacker:IsRealHero() then
self:AddRage(self.roa)
return
end
if attacker ~= parent then return end
if (self.rage_points or 0) > 0 or self:GetStackCount() > 0 then
if not self.is_bonus_consuming then
self.is_bonus_consuming = true
self.bonus_attacks_used = 0
end
self.bonus_attacks_used = (self.bonus_attacks_used or 0) + 1
if self.bonus_attacks_used >= 2 then
self.rage_points = 0
self.bonusdamage = 0
self.bonus_attacks_used = 0
self.is_bonus_consuming = false
self:SetStackCount(0)
end
end
end
function modifier_special_bonus_unique_kunkka_upgrade:GetModifierToolTip()
return self.rage_points or 0
end
