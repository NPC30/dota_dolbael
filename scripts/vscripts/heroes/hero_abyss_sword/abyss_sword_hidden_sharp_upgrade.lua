LinkLuaModifier("modifier_abyss_sword_hidden_sharp_upgrade", "heroes/hero_abyss_sword/abyss_sword_hidden_sharp_upgrade", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_abyss_sword_hidden_sharp_upgrade_interval", "heroes/hero_abyss_sword/abyss_sword_hidden_sharp_upgrade", LUA_MODIFIER_MOTION_NONE)
abyss_sword_hidden_sharp_upgrade = abyss_sword_hidden_sharp_upgrade or class({})
modifier_abyss_sword_hidden_sharp_upgrade = modifier_abyss_sword_hidden_sharp_upgrade or class({})
modifier_abyss_sword_hidden_sharp_upgrade_interval = modifier_abyss_sword_hidden_sharp_upgrade_interval or class({})
function abyss_sword_hidden_sharp_upgrade:OnSpellStart()
self.time = 0
self.attack_bounts = self:GetSpecialValueFor("attack_bounts")
self.caster = self:GetCaster()
self.duration = self:GetSpecialValueFor("duration")
self.attack_times = self:GetSpecialValueFor("attack_times")
self.caster:AddNewModifier(self.caster, self, "modifier_abyss_sword_hidden_sharp_upgrade", {
duration = self.duration,
bonus = self.attack_bounts,
times = self.attack_times,
second = self.time
})
self.caster:AddNewModifier(self.caster, self, "modifier_abyss_sword_hidden_sharp_upgrade_interval", {
duration = self:GetSpecialValueFor("channel"),
times = self.attack_times,
buff_duration = self.duration,
bonus = self.attack_bounts
})
EmitAnnouncerSoundForPlayer("npc_dota_hero_visage.vo.HiddenSharp.Cast", self.caster:GetPlayerOwnerID())
end
function abyss_sword_hidden_sharp_upgrade:GetBehavior()
if self:GetCaster():HasScepter() then
return DOTA_ABILITY_BEHAVIOR_NO_TARGET + DOTA_ABILITY_BEHAVIOR_IMMEDIATE + DOTA_ABILITY_BEHAVIOR_AUTOCAST
else
return self.BaseClass.GetBehavior(self)
end
end
function abyss_sword_hidden_sharp_upgrade:GetCastAnimation()
if not self:GetCaster():HasScepter() then
return ACT_DOTA_CHANNEL_ABILITY_1
end
end
function abyss_sword_hidden_sharp_upgrade:GetChannelTime()
local caster = self:GetCaster()
if caster:HasScepter() then
return 0
else
return self:GetSpecialValueFor("channel")
end
end
function abyss_sword_hidden_sharp_upgrade:OnChannelFinish(interrupted)
if self.caster:HasModifier("modifier_abyss_sword_hidden_sharp_upgrade_interval") then
self.caster:RemoveModifierByName("modifier_abyss_sword_hidden_sharp_upgrade_interval")
end
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:OnCreated(keys)
self.time = 0
self.tick = 0.1
self.sword_qi_elapsed = 0
self.bonus = keys.bonus
self.buff_duration = keys.buff_duration
self.times = keys.times
self.movespeed = self:GetAbility():GetSpecialValueFor("scepter_movespeed")
self.sword_qi_interval = self:GetAbility():GetSpecialValueFor("sword_qi_interval")
if self.sword_qi_interval <= 0 then
self.sword_qi_interval = 1.1
end
self.sword_qi_base_count = self:GetAbility():GetSpecialValueFor("sword_qi_base_count")
if self.sword_qi_base_count <= 0 then
self.sword_qi_base_count = 8
end
self.sword_qi_intellect_step = self:GetAbility():GetSpecialValueFor("sword_qi_intellect_step")
if self.sword_qi_intellect_step <= 0 then
self.sword_qi_intellect_step = 200
end
self.auto_sword_qi_interval = self:GetAbility():GetSpecialValueFor("auto_sword_qi_interval")
if self.auto_sword_qi_interval <= 0 then
self.auto_sword_qi_interval = 0.7
end
self.auto_sword_qi_angle = self:GetAbility():GetSpecialValueFor("auto_sword_qi_angle")
if self.auto_sword_qi_angle <= 0 then
self.auto_sword_qi_angle = 30
end
self.auto_sword_qi_base_count = self:GetAbility():GetSpecialValueFor("auto_sword_qi_base_count")
if self.auto_sword_qi_base_count <= 0 then
self.auto_sword_qi_base_count = 1
end
self.auto_sword_qi_intellect_step = self:GetAbility():GetSpecialValueFor("auto_sword_qi_intellect_step")
if self.auto_sword_qi_intellect_step <= 0 then
self.auto_sword_qi_intellect_step = 1000
end
self.sword_qi_agility_step = self:GetAbility():GetSpecialValueFor("sword_qi_agility_step")
if self.sword_qi_agility_step <= 0 then
self.sword_qi_agility_step = 500
end
self.sword_qi_interval_reduction = self:GetAbility():GetSpecialValueFor("sword_qi_interval_reduction")
if self.sword_qi_interval_reduction <= 0 then
self.sword_qi_interval_reduction = 0.1
end
self.sword_qi_max_interval_reduction = self:GetAbility():GetSpecialValueFor("sword_qi_max_interval_reduction")
if self.sword_qi_max_interval_reduction <= 0 then
self.sword_qi_max_interval_reduction = 0.5
end
if IsServer() then
self:GetCaster():AddActivityModifier("ability3")
self:GetCaster():EmitSound("Hero_Abyss_Sword.HiddenSharp.Cast")
self:ReleaseSwordQi()
self:StartIntervalThink(self.tick)
end
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:OnRefresh(keys)
self:OnCreated(keys)
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:OnDestroy()
if IsServer() then
self:ApplyHiddenSharpBonus()
self:GetCaster():ClearActivityModifiers()
end
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:ApplyHiddenSharpBonus()
self.time = self.time + self.tick
local caster = self:GetParent()
caster:AddNewModifier(caster, self:GetAbility(), "modifier_abyss_sword_hidden_sharp_upgrade", {
duration = self.buff_duration,
times = self.times,
bonus = self.bonus,
second = self.time
})
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:ReleaseSwordQi()
local caster = self:GetParent()
local sword_qi = caster:FindAbilityByName("abyss_sword_rush_night_sword_qi")
if not sword_qi or sword_qi:IsNull() or sword_qi:GetLevel() <= 0 then return end
local origin = caster:GetAbsOrigin()
local target = origin + caster:GetForwardVector()
sword_qi:CreateProjectiles(origin, target, self:GetSwordQiAngle(), self:GetSwordQiCount(caster), true)
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:GetSwordQiCount(caster)
local intellect = caster:GetIntellect(false)
if self:GetAbility():GetAutoCastState() then
return self.auto_sword_qi_base_count + math.floor(intellect / self.auto_sword_qi_intellect_step)
end
return self.sword_qi_base_count + math.floor(intellect / self.sword_qi_intellect_step)
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:GetSwordQiAngle()
if self:GetAbility():GetAutoCastState() then
return self.auto_sword_qi_angle
end
return 360
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:GetSwordQiInterval()
local base_interval = self.sword_qi_interval
if self:GetAbility():GetAutoCastState() then
base_interval = self.auto_sword_qi_interval
end
local agility = self:GetParent():GetAgility()
local reduction = math.floor(agility / self.sword_qi_agility_step) * self.sword_qi_interval_reduction
reduction = math.min(self.sword_qi_max_interval_reduction, reduction)
return math.max(0.03, base_interval - reduction)
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:OnIntervalThink()
if not IsServer() then return end
self:ApplyHiddenSharpBonus()
self.sword_qi_elapsed = self.sword_qi_elapsed + self.tick
if self.sword_qi_elapsed + 0.001 >= self:GetSwordQiInterval() then
self.sword_qi_elapsed = 0
self:ReleaseSwordQi()
end
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:CheckState()
return {
[MODIFIER_STATE_MAGIC_IMMUNE] = true
}
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:DeclareFunctions()
if self:GetCaster():HasScepter() then
return { MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE_MIN }
end
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:GetEffectName()
return "particles/custom/sword_spirit/abyss_sword_hidden_sharp_scepter.vpcf"
end
function modifier_abyss_sword_hidden_sharp_upgrade_interval:GetModifierMoveSpeed_AbsoluteMin()
return self:GetAbility():GetSpecialValueFor("scepter_movespeed")
end
function modifier_abyss_sword_hidden_sharp_upgrade:AddCustomTransmitterData()
return {
bonus = self.bonus,
second = self.second
}
end
function modifier_abyss_sword_hidden_sharp_upgrade:HandleCustomTransmitterData(keys)
self.bonus = keys.bonus
self.second = keys.second
end
function modifier_abyss_sword_hidden_sharp_upgrade:OnCreated(keys)
if IsServer() then
self.second = keys.second
self.bonus = keys.bonus * self.second
if not self:GetCaster():HasScepter() then
self:SetStackCount(keys.times)
end
end
self:SetHasCustomTransmitterData(true)
if not self.particle then
self.particle = ParticleManager:CreateParticle("particles/custom/sword_spirit/abyss_sword_hidden_sharp_buff.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
end
if self.particle then
ParticleManager:SetParticleControl(self.particle, 1, Vector(self.second * 10, 0, 0))
end
end
function modifier_abyss_sword_hidden_sharp_upgrade:OnRefresh(keys)
self:OnCreated(keys)
end
function modifier_abyss_sword_hidden_sharp_upgrade:OnDestroy()
if self.particle then
ParticleManager:DestroyParticle(self.particle, false)
ParticleManager:ReleaseParticleIndex(self.particle)
end
end
function modifier_abyss_sword_hidden_sharp_upgrade:DeclareFunctions()
local funcs
if not self:GetCaster():HasScepter() then
funcs = {
MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
MODIFIER_EVENT_ON_ATTACK_LANDED
}
else
funcs = {
MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE
}
end
return funcs
end
function modifier_abyss_sword_hidden_sharp_upgrade:GetModifierBaseDamageOutgoing_Percentage(keys)
return self.bonus
end
function modifier_abyss_sword_hidden_sharp_upgrade:OnAttackLanded(keys)
local parent = self:GetParent()
if keys.attacker == parent then
if not parent:HasModifier("modifier_abyss_sword_rush_night_sword_qi") then
self:DecrementStackCount()
if self:GetStackCount() <= 0 then
self:Destroy()
end
end
end
end
