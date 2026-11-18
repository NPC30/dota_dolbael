LinkLuaModifier("modifier_special_bonus_unique_antimage_upgrade", "abilities/special_bonus_unique_antimage_upgrade",
LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_special_bonus_unique_antimage_mana_lock", "abilities/special_bonus_unique_antimage_upgrade",
LUA_MODIFIER_MOTION_NONE)
special_bonus_unique_antimage_upgrade = class({})
function special_bonus_unique_antimage_upgrade:GetIntrinsicModifierName()
return "modifier_special_bonus_unique_antimage_upgrade"
end
modifier_special_bonus_unique_antimage_upgrade = class({})
function modifier_special_bonus_unique_antimage_upgrade:IsHidden() return true end
function modifier_special_bonus_unique_antimage_upgrade:IsPurgable() return false end
function modifier_special_bonus_unique_antimage_upgrade:RemoveOnDeath() return false end
function modifier_special_bonus_unique_antimage_upgrade:DeclareFunctions()
return {
MODIFIER_EVENT_ON_ABILITY_EXECUTED,
MODIFIER_EVENT_ON_ATTACK_LANDED,
}
end
function modifier_special_bonus_unique_antimage_upgrade:OnAttackLanded(keys)
if not IsServer() then return end
local parent = self:GetParent()
if keys.attacker ~= parent then return end
local target = keys.target
if not target or target:IsNull() or not target:IsAlive() then return end
if target:GetTeamNumber() == parent:GetTeamNumber() then return end
if target:GetMaxMana() <= 0 then return end
local ability = self:GetAbility()
if not ability or ability:IsNull() then return end
target:AddNewModifier(parent, ability, "modifier_special_bonus_unique_antimage_mana_lock", {})
end
function modifier_special_bonus_unique_antimage_upgrade:OnAbilityExecuted(keys)
if not IsServer() then return end
local parent = self:GetParent()
if keys.target ~= parent then return end
local parent_has_counterspell = parent:FindModifierByName("modifier_antimage_counterspell")
if not parent_has_counterspell then return end
local caster = keys.unit
if caster:GetTeamNumber() == parent:GetTeamNumber() then return end
if parent:IsAlive() and caster and not caster:IsNull() and caster:IsAlive() then
local attack_delay = 0.08
Timers:CreateTimer(attack_delay, function()
parent:PerformAttack(caster, true, true, true, false, true, false, true)
return nil
end)
end
end
modifier_special_bonus_unique_antimage_mana_lock = class({})
function modifier_special_bonus_unique_antimage_mana_lock:IsHidden() return false end
function modifier_special_bonus_unique_antimage_mana_lock:IsDebuff() return true end
function modifier_special_bonus_unique_antimage_mana_lock:IsPurgable() return false end
function modifier_special_bonus_unique_antimage_mana_lock:OnCreated()
if not IsServer() then return end
local ability = self:GetAbility()
self.duration = ability and ability:GetSpecialValueFor("mana_lock_duration") or 5
self.threshold_pct = ability and ability:GetSpecialValueFor("mana_void_threshold_pct") or 5
self.expire_time = GameRules:GetGameTime() + self.duration
self.recorded_mana = self:GetParent():GetMana()
self.mana_void_cast = false
self:StartIntervalThink(1.0)
end
function modifier_special_bonus_unique_antimage_mana_lock:OnRefresh()
if not IsServer() then return end
local ability = self:GetAbility()
self.duration = ability and ability:GetSpecialValueFor("mana_lock_duration") or 5
self.threshold_pct = ability and ability:GetSpecialValueFor("mana_void_threshold_pct") or 5
self.expire_time = GameRules:GetGameTime() + self.duration
self.recorded_mana = math.min(self.recorded_mana or self:GetParent():GetMana(), self:GetParent():GetMana())
end
function modifier_special_bonus_unique_antimage_mana_lock:OnIntervalThink()
if not IsServer() then return end
if GameRules:GetGameTime() >= self.expire_time then
self:Destroy()
return
end
local parent = self:GetParent()
if not parent or parent:IsNull() or not parent:IsAlive() then
self:Destroy()
return
end
local current_mana = parent:GetMana()
if current_mana > self.recorded_mana then
parent:SetMana(self.recorded_mana)
current_mana = self.recorded_mana
else
self.recorded_mana = current_mana
end
if self.mana_void_cast then return end
local caster = self:GetCaster()
if not caster or caster:IsNull() or not caster:IsAlive() then return end
if parent:GetTeamNumber() == caster:GetTeamNumber() then return end
if parent:GetMaxMana() <= 0 then return end
if current_mana > parent:GetMaxMana() * self.threshold_pct / 100 then return end
local mana_void = caster:FindAbilityByName("antimage_mana_void")
if not mana_void or mana_void:IsNull() then return end
if mana_void:GetLevel() <= 0 then return end
if mana_void:GetCooldownTimeRemaining() <= 0 and caster:GetMana() >= mana_void:GetManaCost(mana_void:GetLevel() - 1) then
self.mana_void_cast = true
caster:CastAbilityOnTarget(parent, mana_void, caster:GetPlayerOwnerID())
end
end
