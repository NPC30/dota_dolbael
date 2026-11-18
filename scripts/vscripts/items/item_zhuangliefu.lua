item_zhuangliefu = class({})
LinkLuaModifier("modifier_item_zhuangliefu_execution", "items/item_zhuangliefu", LUA_MODIFIER_MOTION_NONE)
function item_zhuangliefu:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
local target = self:GetCursorTarget()
if not caster or caster:IsNull() or not target or target:IsNull() then return end
if target:GetTeamNumber() == caster:GetTeamNumber() then return end
if not target:IsHero() then return end
EmitSoundOn("Hero_Techies.Suicide", caster)
EmitSoundOn("Hero_Techies.Suicide", target)
local particle = ParticleManager:CreateParticle(
"particles/units/heroes/hero_techies/techies_suicide.vpcf",
PATTACH_ABSORIGIN,
target
)
ParticleManager:ReleaseParticleIndex(particle)
self:ExecuteUnit(target, caster)
self:ExecuteUnit(caster, target)
self:SpendCharge(1)
end
function item_zhuangliefu:ExecuteUnit(unit, killer)
if not unit or unit:IsNull() or not unit:IsAlive() then return end
unit:AddNewModifier(killer, self, "modifier_item_zhuangliefu_execution", { duration = 10 })
unit:Kill(self, killer)
if unit:IsAlive() then
unit:ForceKill(false)
end
end
modifier_item_zhuangliefu_execution = class({})
function modifier_item_zhuangliefu_execution:IsHidden() return true end
function modifier_item_zhuangliefu_execution:IsPurgable() return false end
function modifier_item_zhuangliefu_execution:IsPurgeException() return false end
function modifier_item_zhuangliefu_execution:IsDebuff() return true end
function modifier_item_zhuangliefu_execution:RemoveOnDeath() return true end
function modifier_item_zhuangliefu_execution:OnCreated()
if not IsServer() then return end
self.remaining_attempts = 10
self:StartIntervalThink(1)
end
function modifier_item_zhuangliefu_execution:OnIntervalThink()
if not IsServer() then return end
local parent = self:GetParent()
if not parent or parent:IsNull() or not parent:IsAlive() then
self:Destroy()
return
end
parent:ForceKill(false)
self.remaining_attempts = self.remaining_attempts - 1
if self.remaining_attempts <= 0 then
self:Destroy()
end
end
