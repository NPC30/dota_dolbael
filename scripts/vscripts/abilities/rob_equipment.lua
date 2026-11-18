rob_equipment = class({})
LinkLuaModifier("modifier_rob_equipment_thinker", "abilities/rob_equipment", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_rob_equipment_track_kill", "abilities/rob_equipment", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_rob_equipment_speed_slow", "abilities/rob_equipment", LUA_MODIFIER_MOTION_NONE)
function rob_equipment:GetIntrinsicModifierName()
return "modifier_rob_equipment_track_kill"
end
function rob_equipment:GetRobStackModifier(caster)
if not caster or caster:IsNull() then return nil end
return caster:FindModifierByName("modifier_rob_equipment_track_kill")
end
function rob_equipment:GetRobSuccessCount(caster)
local modifier = self:GetRobStackModifier(caster)
if not modifier or modifier:IsNull() then return 0 end
return modifier:GetStackCount()
end
function rob_equipment:GetRobChanceGrowth(caster)
local chance_growth = self:GetSpecialValueFor("track_kill_chance_per_success")
if not chance_growth or chance_growth <= 0 then chance_growth = 1 end
return self:GetRobSuccessCount(caster) * chance_growth
end
function rob_equipment:AddRobSuccess(caster)
local modifier = self:GetRobStackModifier(caster)
if not modifier or modifier:IsNull() then return end
modifier:SetStackCount(modifier:GetStackCount() + 1)
end
function rob_equipment:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
if not target or target:IsNull() then return end
local distance = (caster:GetAbsOrigin() - target:GetAbsOrigin()):Length2D()
if distance <= 300 then
self:RefundManaCost()
self:EndCooldown()
return
end
caster:AddNewModifier(caster, self, "modifier_rob_equipment_thinker", {
duration = self:GetSpecialValueFor("duration"),
target_entindex = target:entindex()
})
caster:AddNewModifier(caster, self, "modifier_pangolier_gyroshell", {
duration = self:GetSpecialValueFor("duration"), forward_move_speed = 3000
})
caster:EmitSound("Hero_Pangolier.Gyroshell.Loop")
caster:EmitSound("Hero_Pangolier.Gyroshell.Start")
end
function rob_equipment:StealRandomItem(caster, target)
if not caster or caster:IsNull() or not target or target:IsNull() then return false end
local items = {}
for i = 0, 5 do
local item = target:GetItemInSlot(i)
if item and not item:IsNull() and not item:IsRecipe() then
table.insert(items, item)
end
end
if #items <= 0 then return false end
local stolen_item = items[RandomInt(1, #items)]
local item_name = stolen_item:GetName()
target:RemoveItem(stolen_item)
local new_item = CreateItem(item_name, caster, caster)
new_item:SetShareability(ITEM_FULLY_SHAREABLE)
caster:AddItem(new_item)
return true
end
modifier_rob_equipment_track_kill = class({})
function modifier_rob_equipment_track_kill:IsHidden() return false end
function modifier_rob_equipment_track_kill:IsPurgable() return false end
function modifier_rob_equipment_track_kill:RemoveOnDeath() return false end
function modifier_rob_equipment_track_kill:DeclareFunctions()
return {
MODIFIER_EVENT_ON_DEATH,
}
end
function modifier_rob_equipment_track_kill:OnDeath(keys)
if not IsServer() then return end
local parent = self:GetParent()
local ability = self:GetAbility()
if not parent or parent:IsNull() or not ability or ability:IsNull() then return end
if keys.attacker ~= parent then return end
local victim = keys.unit
if not victim or victim:IsNull() or victim:GetTeamNumber() == parent:GetTeamNumber() then return end
if not victim:HasModifier("modifier_bounty_hunter_track") then return end
local base_chance = ability:GetSpecialValueFor("track_kill_base_chance")
if not base_chance or base_chance <= 0 then base_chance = 10 end
local chance_max = ability:GetSpecialValueFor("track_kill_chance_max")
if not chance_max or chance_max <= 0 then chance_max = 30 end
local total_chance = math.min(base_chance + ability:GetRobChanceGrowth(parent), chance_max)
if RandomFloat(0, 100) > total_chance then return end
if ability:StealRandomItem(parent, victim) then
ability:AddRobSuccess(parent)
end
end
modifier_rob_equipment_thinker = class({})
function modifier_rob_equipment_thinker:IsHidden() return false end
function modifier_rob_equipment_thinker:IsPurgable() return false end
function modifier_rob_equipment_thinker:OnCreated(kv)
if not IsServer() then return end
self.caster = self:GetCaster()
self.target = EntIndexToHScript(kv.target_entindex)
self.ability = self:GetAbility()
if not self.target or self.target:IsNull() then
self:Destroy()
return
end
self.start_pos = self.caster:GetAbsOrigin()
self.last_in_range = false
self.min_distance_to_target = 9999
self.rush_distance = 0
self.last_pos = self.caster:GetAbsOrigin()
self.slow_applied = false
self.steal_window_start = nil
self.startspeed = 0
self.steal_range = 0
self.interval = self.ability:GetSpecialValueFor("check_interval")
self:StartIntervalThink(self.interval)
local particle = ParticleManager:CreateParticle("particles/generic_gameplay/generic_has_quest.vpcf",
PATTACH_OVERHEAD_FOLLOW, self.target)
ParticleManager:SetParticleControl(particle, 1, Vector(self:GetDuration(), 0, 0))
self.particle = particle
end
function modifier_rob_equipment_thinker:OnIntervalThink()
if not self.target or self.target:IsNull() or not self.caster or self.caster:IsNull() then
self:Destroy()
return
end
local current_pos = self.caster:GetAbsOrigin()
local distance_to_last = (current_pos - self.last_pos):Length2D()
self.rush_distance = self.rush_distance + math.min(10000 * self.interval, distance_to_last)
self.steal_range = self.ability:GetSpecialValueFor("steal_range")
local escape_distance = self.ability:GetSpecialValueFor("escape_distance")
local escape_window = self.ability:GetSpecialValueFor("escape_window")
local distance_to_target = (current_pos - self.target:GetAbsOrigin()):Length2D()
local current_in_range = distance_to_target <= self.steal_range
self.min_distance_to_target = math.min(self.min_distance_to_target, distance_to_target)
self.min_distance_to_target = self.min_distance_to_target
if (self.last_in_range and not current_in_range) and not self.slow_applied then
self.slow_applied = true
self.startspeed = self.caster:GetIdealSpeed()
self.steal_window_start = GameRules:GetGameTime()
local message = "你踏马松手！"
Say(self.caster, message, false)
print(self.slow_applied, self.steal_window_start)
local slow_duration = self.ability:GetSpecialValueFor("steal_speed_slow_duration")
self.caster:AddNewModifier(self.caster, self.ability, "modifier_rob_equipment_speed_slow",
{ duration = slow_duration })
local extend_duration = 3.5
self:SetDuration(extend_duration, true)
end
if self.slow_applied and self.steal_window_start then
local time_elapsed = GameRules:GetGameTime() - self.steal_window_start
local distance_from_proximity_start = (current_pos - self.target:GetAbsOrigin()):Length2D()
if time_elapsed <= escape_window then
if distance_from_proximity_start >= escape_distance then
local steal_successful = self:TryStealItem()
self:Destroy()
return
end
else
local message = "TMD跑不掉了！"
Say(self.caster, message, false)
self:Destroy()
return
end
end
self.last_in_range = current_in_range
self.last_pos = current_pos
end
function modifier_rob_equipment_thinker:TryStealItem()
local base_chance = self.ability:GetSpecialValueFor("base_chance")
local speed_per_100 = self.ability:GetSpecialValueFor("speed_bonus_per_100")
local current_speed = self.caster:GetIdealSpeed()
local speed_bonus = ((current_speed + self.startspeed) / 2) * speed_per_100 / 100
local min_distance_coefficient = self.ability:GetSpecialValueFor("min_distance_coefficient") or 150
local min_distance_bonus = 0
if self.min_distance_to_target >= 0 then
min_distance_bonus = (self.steal_range - self.min_distance_to_target) * min_distance_coefficient / 100
end
local rush_distance_coefficient = self.ability:GetSpecialValueFor("rush_distance_coefficient") or 2.0
local rush_bonus = self.rush_distance * rush_distance_coefficient / 1000
local total_chance = base_chance + speed_bonus + min_distance_bonus + rush_bonus + self.ability:GetRobChanceGrowth(self.caster)
local roll = RandomFloat(0, 100)
if roll <= total_chance then
return self:ExecuteSteal()
else
local message
if (min_distance_bonus > rush_bonus) then
message = "TMD太匆忙了（蓄力距离" .. math.floor(self.rush_distance) .. "米）"
else
message = "TMD没抓牢（距离目标" .. math.floor(self.min_distance_to_target) .. "米）"
end
Say(self.caster, message, false)
return false
end
end
function modifier_rob_equipment_thinker:ExecuteSteal()
if not self.caster or self.caster:IsNull() then
return false
end
if not self.caster:IsAlive() or self.caster.isBuyBack then
return false
end
local victim_name = self.target:GetUnitName()
local HeroName = string.gsub(victim_name, "npc_dota_hero_", "")
local messages = {
HeroName .. "，拿来吧你!",
HeroName .. "，手劲儿不行啊小火鸡",
HeroName .. "，哈哈哈哈哈好宝贝啊好宝贝",
HeroName .. "，你的就是我的！",
}
local message = messages[RandomInt(1, #messages)]
Say(self.caster, message, false)
return self:StealRandomItem()
end
function modifier_rob_equipment_thinker:StealRandomItem()
if not self.ability or self.ability:IsNull() then return false end
local stolen = self.ability:StealRandomItem(self.caster, self.target)
if stolen then
self.ability:AddRobSuccess(self.caster)
end
return stolen
end
function modifier_rob_equipment_thinker:GetModifierModelChange()
return "models/heroes/pangolier/pangolier_gyroshell2.vmdl"
end
function modifier_rob_equipment_thinker:OnDestroy()
if not IsServer() then return end
if self.particle then
ParticleManager:DestroyParticle(self.particle, true)
ParticleManager:ReleaseParticleIndex(self.particle)
end
end
modifier_rob_equipment_speed_slow = class({})
function modifier_rob_equipment_speed_slow:IsDebuff() return false end
function modifier_rob_equipment_speed_slow:IsHidden() return false end
function modifier_rob_equipment_speed_slow:IsPurgable() return false end
function modifier_rob_equipment_speed_slow:CheckState()
return { [MODIFIER_STATE_ROOTED] = true }
end
