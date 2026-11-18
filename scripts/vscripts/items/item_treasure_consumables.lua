LinkLuaModifier("modifier_item_treasure_tianshen", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_root", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_burst", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_speed", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_cooldown", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_wall_auto_use", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_wall_grant", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_bash", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_bash_stun", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_perm_strength", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_perm_agility", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_perm_intellect", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_perm_health", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_perm_base_attack_pct", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_perm_damage", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_perm_armor", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_treasure_perm_movespeed", "items/item_treasure_consumables.lua", LUA_MODIFIER_MOTION_NONE)
local function SpendTreasureCharge(item)
if item then
item:SpendCharge(1)
end
end
local function GetEnemyHeroes(caster)
return FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
50000,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
FIND_ANY_ORDER,
false
)
end
local function ReduceCurrentCooldowns(caster, pct)
for i = 0, 23 do
local ability = caster:GetAbilityByIndex(i)
if ability and not ability:IsNull() and ability:IsCooldownReady() == false then
local remaining = ability:GetCooldownTimeRemaining()
ability:EndCooldown()
ability:StartCooldown(remaining * (100 - pct) / 100)
end
end
for i = 0, 8 do
local item = caster:GetItemInSlot(i)
if item and not item:IsNull() and item:IsCooldownReady() == false then
local remaining = item:GetCooldownTimeRemaining()
item:EndCooldown()
item:StartCooldown(remaining * (100 - pct) / 100)
end
end
end
local function CreateGoldBag(name, amount)
_G[name] = class({})
_G[name].OnSpellStart = function(self)
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
caster:ModifyGold(amount, true, DOTA_ModifyGold_Unspecified)
SendOverheadEventMessage(caster, OVERHEAD_ALERT_GOLD, caster, amount, nil)
EmitSoundOn("General.Coins", caster)
SpendTreasureCharge(self)
end
end
CreateGoldBag("item_treasure_gold_bag_1000", 1000)
CreateGoldBag("item_treasure_gold_bag_2000", 2000)
CreateGoldBag("item_treasure_gold_bag_4000", 4000)
local function CreatePermanentConsumable(name, modifier_name)
_G[name] = class({})
_G[name].OnSpellStart = function(self)
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
if self:GetLevel() < 1 then
self:SetLevel(1)
end
local bonus = self:GetSpecialValueFor("bonus")
if bonus <= 0 then return end
local modifier = caster:FindModifierByName(modifier_name)
if not modifier then
modifier = caster:AddNewModifier(caster, self, modifier_name, {})
end
if modifier and not modifier:IsNull() then
modifier:SetStackCount(modifier:GetStackCount() + bonus)
modifier:ForceRefresh()
end
EmitSoundOnClient("Item.TomeOfKnowledge", caster)
SpendTreasureCharge(self)
end
end
CreatePermanentConsumable("item_treasure_perm_strength_10", "modifier_item_treasure_perm_strength")
CreatePermanentConsumable("item_treasure_perm_strength_20", "modifier_item_treasure_perm_strength")
CreatePermanentConsumable("item_treasure_perm_strength_50", "modifier_item_treasure_perm_strength")
CreatePermanentConsumable("item_treasure_perm_agility_10", "modifier_item_treasure_perm_agility")
CreatePermanentConsumable("item_treasure_perm_agility_20", "modifier_item_treasure_perm_agility")
CreatePermanentConsumable("item_treasure_perm_agility_50", "modifier_item_treasure_perm_agility")
CreatePermanentConsumable("item_treasure_perm_intellect_10", "modifier_item_treasure_perm_intellect")
CreatePermanentConsumable("item_treasure_perm_intellect_20", "modifier_item_treasure_perm_intellect")
CreatePermanentConsumable("item_treasure_perm_intellect_50", "modifier_item_treasure_perm_intellect")
CreatePermanentConsumable("item_treasure_perm_health_1000", "modifier_item_treasure_perm_health")
CreatePermanentConsumable("item_treasure_perm_health_2000", "modifier_item_treasure_perm_health")
CreatePermanentConsumable("item_treasure_perm_health_5000", "modifier_item_treasure_perm_health")
CreatePermanentConsumable("item_treasure_perm_base_attack_pct_10", "modifier_item_treasure_perm_base_attack_pct")
CreatePermanentConsumable("item_treasure_perm_base_attack_pct_20", "modifier_item_treasure_perm_base_attack_pct")
CreatePermanentConsumable("item_treasure_perm_base_attack_pct_50", "modifier_item_treasure_perm_base_attack_pct")
CreatePermanentConsumable("item_treasure_perm_damage_100", "modifier_item_treasure_perm_damage")
CreatePermanentConsumable("item_treasure_perm_damage_200", "modifier_item_treasure_perm_damage")
CreatePermanentConsumable("item_treasure_perm_damage_500", "modifier_item_treasure_perm_damage")
CreatePermanentConsumable("item_treasure_perm_armor_10", "modifier_item_treasure_perm_armor")
CreatePermanentConsumable("item_treasure_perm_armor_20", "modifier_item_treasure_perm_armor")
CreatePermanentConsumable("item_treasure_perm_armor_50", "modifier_item_treasure_perm_armor")
CreatePermanentConsumable("item_treasure_perm_movespeed_30", "modifier_item_treasure_perm_movespeed")
CreatePermanentConsumable("item_treasure_perm_movespeed_60", "modifier_item_treasure_perm_movespeed")
CreatePermanentConsumable("item_treasure_perm_movespeed_100", "modifier_item_treasure_perm_movespeed")
local function CreatePermanentModifier(name, texture, property, getter)
_G[name] = class({})
_G[name].IsHidden = function() return true end
_G[name].IsPurgable = function() return false end
_G[name].RemoveOnDeath = function() return false end
_G[name].IsPermanent = function() return true end
_G[name].GetTexture = function() return texture end
_G[name].GetAttributes = function()
return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end
_G[name].DeclareFunctions = function()
return { property, MODIFIER_PROPERTY_TOOLTIP }
end
_G[name][getter] = function(self)
return self:GetStackCount()
end
_G[name].OnTooltip = function(self)
return self:GetStackCount()
end
end
CreatePermanentModifier(
"modifier_item_treasure_perm_strength",
"item_tome_of_strength",
MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
"GetModifierBonusStats_Strength"
)
CreatePermanentModifier(
"modifier_item_treasure_perm_agility",
"item_tome_of_agility",
MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
"GetModifierBonusStats_Agility"
)
CreatePermanentModifier(
"modifier_item_treasure_perm_intellect",
"item_tome_of_intelligence",
MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
"GetModifierBonusStats_Intellect"
)
CreatePermanentModifier(
"modifier_item_treasure_perm_health",
"heart",
MODIFIER_PROPERTY_HEALTH_BONUS,
"GetModifierHealthBonus"
)
CreatePermanentModifier(
"modifier_item_treasure_perm_base_attack_pct",
"greater_crit",
MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
"GetModifierBaseDamageOutgoing_Percentage"
)
CreatePermanentModifier(
"modifier_item_treasure_perm_damage",
"rapier",
MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
"GetModifierPreAttack_BonusDamage"
)
CreatePermanentModifier(
"modifier_item_treasure_perm_armor",
"platemail",
MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
"GetModifierPhysicalArmorBonus"
)
CreatePermanentModifier(
"modifier_item_treasure_perm_movespeed",
"boots",
MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
"GetModifierMoveSpeedBonus_Constant"
)
item_treasure_tianshen = class({})
function item_treasure_tianshen:OnSpellStart()
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
local duration = self:GetSpecialValueFor("duration")
caster:AddNewModifier(caster, self, "modifier_black_king_bar_immune", { duration = duration, Duration = duration })
caster:AddNewModifier(caster, self, "modifier_item_treasure_tianshen", { duration = duration })
caster:EmitSound("DOTA_Item.BlackKingBar.Activate")
SpendTreasureCharge(self)
end
modifier_item_treasure_tianshen = class({})
function modifier_item_treasure_tianshen:IsHidden() return false end
function modifier_item_treasure_tianshen:IsPurgable() return false end
function modifier_item_treasure_tianshen:GetTexture() return "black_king_bar" end
local function CreateMieTalisman(name)
_G[name] = class({})
_G[name].OnSpellStart = function(self)
local caster = self:GetCaster()
local target = self:GetCursorTarget()
if not caster or caster:IsNull() or not target or target:IsNull() then return end
if target:GetTeamNumber() == caster:GetTeamNumber() then return end
local damage = self:GetSpecialValueFor("damage")
ApplyDamage({
victim = target,
attacker = caster,
damage = damage,
damage_type = DAMAGE_TYPE_PURE,
damage_flags = DOTA_DAMAGE_FLAG_FORCE_SPELL_AMPLIFICATION,
ability = self
})
local particle = ParticleManager:CreateParticle(
"particles/items_fx/dagon.vpcf",
PATTACH_CUSTOMORIGIN,
caster
)
ParticleManager:SetParticleControlEnt(particle, 0, caster, PATTACH_POINT_FOLLOW, "attach_attack1",
caster:GetAbsOrigin(), true)
ParticleManager:SetParticleControlEnt(particle, 1, target, PATTACH_POINT_FOLLOW, "attach_hitloc",
target:GetAbsOrigin(), true)
ParticleManager:ReleaseParticleIndex(particle)
target:EmitSound("DOTA_Item.Dagon.Activate")
SpendTreasureCharge(self)
end
end
CreateMieTalisman("item_treasure_mie_small")
CreateMieTalisman("item_treasure_mie_medium")
CreateMieTalisman("item_treasure_mie_large")
item_treasure_fu = class({})
function item_treasure_fu:OnSpellStart()
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
local duration = self:GetSpecialValueFor("duration")
for _, enemy in pairs(GetEnemyHeroes(caster)) do
if enemy and not enemy:IsNull() and enemy:IsAlive() then
enemy:AddNewModifier(caster, self, "modifier_item_treasure_root", { duration = duration })
enemy:EmitSound("Hero_Treant.Overgrowth.Target")
end
end
SpendTreasureCharge(self)
end
modifier_item_treasure_root = class({})
function modifier_item_treasure_root:IsHidden() return false end
function modifier_item_treasure_root:IsPurgable() return false end
function modifier_item_treasure_root:IsDebuff() return true end
function modifier_item_treasure_root:CheckState()
return {
[MODIFIER_STATE_ROOTED] = true
}
end
function modifier_item_treasure_root:GetTexture() return "treant_overgrowth" end
item_treasure_ju = class({})
function item_treasure_ju:OnSpellStart()
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
local position = self:GetCursorPosition()
local enemies = GetEnemyHeroes(caster)
local count = math.max(#enemies, 1)
for index, enemy in pairs(enemies) do
if enemy and not enemy:IsNull() and enemy:IsAlive() then
local angle = 2 * math.pi * (index - 1) / count
local offset = Vector(math.cos(angle), math.sin(angle), 0) * 96
FindClearSpaceForUnit(enemy, position + offset, true)
enemy:Stop()
enemy:EmitSound("Portal.Hero_Disappear")
end
end
SpendTreasureCharge(self)
end
item_treasure_wall = class({})
function item_treasure_wall:GetIntrinsicModifierName()
return "modifier_item_treasure_wall_auto_use"
end
function item_treasure_wall:OnSpellStart()
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
local added_new = 0
local fence = caster:FindAbilityByName("disruptor_kinetic_fence2")
if not fence then
fence = caster:AddAbility("disruptor_kinetic_fence2")
added_new = 1
caster._treasure_wall_added_ability = true
end
if not fence or fence:IsNull() then return end
fence:SetLevel(1)
fence:SetHidden(false)
fence:EndCooldown()
caster:AddNewModifier(caster, self, "modifier_item_treasure_wall_grant", {
duration = self:GetSpecialValueFor("grant_duration"),
added_new = added_new
})
caster:EmitSound("Hero_Disruptor.KineticField")
SpendTreasureCharge(self)
end
modifier_item_treasure_wall_auto_use = class({})
function modifier_item_treasure_wall_auto_use:IsHidden() return true end
function modifier_item_treasure_wall_auto_use:IsPurgable() return false end
function modifier_item_treasure_wall_auto_use:RemoveOnDeath() return false end
function modifier_item_treasure_wall_auto_use:OnCreated()
if not IsServer() then return end
Timers:CreateTimer(0, function()
local item = self:GetAbility()
local parent = self:GetParent()
if not item or item:IsNull() or item._treasure_wall_auto_used then return end
if not parent or parent:IsNull() or not parent:IsRealHero() then return end
if item:GetCaster() ~= parent then return end
item._treasure_wall_auto_used = true
item:OnSpellStart()
end)
end
modifier_item_treasure_wall_grant = class({})
function modifier_item_treasure_wall_grant:IsHidden() return false end
function modifier_item_treasure_wall_grant:IsPurgable() return false end
function modifier_item_treasure_wall_grant:GetTexture() return "disruptor_kinetic_fence" end
function modifier_item_treasure_wall_grant:OnCreated(kv)
if not IsServer() then return end
self.added_new = tonumber(kv.added_new or 0) == 1
end
function modifier_item_treasure_wall_grant:DeclareFunctions()
return { MODIFIER_EVENT_ON_ABILITY_EXECUTED }
end
function modifier_item_treasure_wall_grant:OnAbilityExecuted(params)
if not IsServer() then return end
if self.used then return end
local parent = self:GetParent()
if params.unit ~= parent then return end
local ability = params.ability
if not ability or ability:IsNull() or ability:GetAbilityName() ~= "disruptor_kinetic_fence2" then return end
self.used = true
local duration = ability:GetSpecialValueFor("duration")
parent._treasure_wall_cleanup_token = (parent._treasure_wall_cleanup_token or 0) + 1
local cleanup_token = parent._treasure_wall_cleanup_token
if parent._treasure_wall_added_ability then
Timers:CreateTimer(duration + 0.5, function()
if not parent or parent:IsNull() then return end
if parent._treasure_wall_cleanup_token ~= cleanup_token then return end
local fence = parent:FindAbilityByName("disruptor_kinetic_fence2")
if fence and not fence:IsNull() then
parent:RemoveAbility("disruptor_kinetic_fence2")
end
parent._treasure_wall_added_ability = nil
end)
end
Timers:CreateTimer(0.1, function()
if self and not self:IsNull() then
self:Destroy()
end
end)
end
function modifier_item_treasure_wall_grant:OnDestroy()
if not IsServer() then return end
local parent = self:GetParent()
if not parent or parent:IsNull() then return end
local fence = parent:FindAbilityByName("disruptor_kinetic_fence2")
if not fence or fence:IsNull() then return end
fence:SetHidden(true)
end
item_treasure_burst = class({})
function item_treasure_burst:OnSpellStart()
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
caster:AddNewModifier(caster, self, "modifier_item_treasure_burst", { duration = self:GetSpecialValueFor("duration") })
caster:EmitSound("DOTA_Item.Mjollnir.Activate")
SpendTreasureCharge(self)
end
modifier_item_treasure_burst = class({})
function modifier_item_treasure_burst:IsHidden() return false end
function modifier_item_treasure_burst:IsPurgable() return false end
function modifier_item_treasure_burst:GetTexture() return "arc_warden_spark_wraith" end
function modifier_item_treasure_burst:OnCreated()
self.radius = self:GetAbility():GetSpecialValueFor("radius")
self.max_chain = self:GetAbility():GetSpecialValueFor("max_chain")
end
function modifier_item_treasure_burst:DeclareFunctions()
return { MODIFIER_EVENT_ON_DEATH }
end
function modifier_item_treasure_burst:OnDeath(params)
if not IsServer() then return end
local parent = self:GetParent()
local unit = params.unit
if not unit or unit:IsNull() or not unit:IsRealHero() then return end
if params.attacker ~= parent and params.inflictor ~= self:GetAbility() then return end
self.chain_count = (self.chain_count or 0) + 1
if self.chain_count > self.max_chain then return end
local damage = unit:GetMaxHealth()
local enemies = FindUnitsInRadius(
parent:GetTeamNumber(),
unit:GetAbsOrigin(),
nil,
self.radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
FIND_ANY_ORDER,
false
)
local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_techies/techies_suicide.vpcf", PATTACH_ABSORIGIN, unit)
ParticleManager:ReleaseParticleIndex(particle)
EmitSoundOn("Hero_Techies.Suicide", unit)
for _, enemy in pairs(enemies) do
if enemy ~= unit and enemy:IsAlive() then
ApplyDamage({
victim = enemy,
attacker = parent,
damage = damage,
damage_type = DAMAGE_TYPE_MAGICAL,
damage_flags = DOTA_DAMAGE_FLAG_NONE,
ability = self:GetAbility()
})
end
end
end
item_treasure_speed = class({})
function item_treasure_speed:OnSpellStart()
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
caster:AddNewModifier(caster, self, "modifier_item_treasure_speed", { duration = self:GetSpecialValueFor("duration") })
caster:EmitSound("Rune.Haste")
SpendTreasureCharge(self)
end
modifier_item_treasure_speed = class({})
function modifier_item_treasure_speed:IsHidden() return false end
function modifier_item_treasure_speed:IsPurgable() return false end
function modifier_item_treasure_speed:GetTexture() return "rune_haste" end
function modifier_item_treasure_speed:OnCreated()
self.bonus_ms = self:GetAbility():GetSpecialValueFor("bonus_ms")
end
function modifier_item_treasure_speed:DeclareFunctions()
return {
MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
MODIFIER_PROPERTY_IGNORE_MOVESPEED_LIMIT
}
end
function modifier_item_treasure_speed:GetModifierMoveSpeedBonus_Constant()
return self.bonus_ms
end
function modifier_item_treasure_speed:GetModifierIgnoreMovespeedLimit()
return 1
end
item_treasure_invis = class({})
function item_treasure_invis:OnSpellStart()
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
caster:AddNewModifier(caster, self, "modifier_item_glimmer_cape_fade", { duration = self:GetSpecialValueFor("duration") })
caster:EmitSound("Item.GlimmerCape.Activate")
SpendTreasureCharge(self)
end
item_treasure_cooldown = class({})
function item_treasure_cooldown:OnSpellStart()
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
local pct = self:GetSpecialValueFor("cooldown_pct")
ReduceCurrentCooldowns(caster, pct)
caster:AddNewModifier(caster, self, "modifier_item_treasure_cooldown", { duration = self:GetSpecialValueFor("duration") })
caster:EmitSound("DOTA_Item.Refresher.Activate")
SpendTreasureCharge(self)
end
modifier_item_treasure_cooldown = class({})
function modifier_item_treasure_cooldown:IsHidden() return false end
function modifier_item_treasure_cooldown:IsPurgable() return false end
function modifier_item_treasure_cooldown:GetTexture() return "octarine_core" end
function modifier_item_treasure_cooldown:OnCreated()
self.cooldown_pct = self:GetAbility():GetSpecialValueFor("cooldown_pct")
end
function modifier_item_treasure_cooldown:DeclareFunctions()
return { MODIFIER_PROPERTY_COOLDOWN_PERCENTAGE }
end
function modifier_item_treasure_cooldown:GetModifierPercentageCooldown()
return self.cooldown_pct
end
item_treasure_bash = class({})
function item_treasure_bash:OnSpellStart()
local caster = self:GetCaster()
if not caster or caster:IsNull() then return end
caster:AddNewModifier(caster, self, "modifier_item_treasure_bash", { duration = self:GetSpecialValueFor("duration") })
caster:EmitSound("DOTA_Item.SkullBasher")
SpendTreasureCharge(self)
end
modifier_item_treasure_bash = class({})
function modifier_item_treasure_bash:IsHidden() return false end
function modifier_item_treasure_bash:IsPurgable() return false end
function modifier_item_treasure_bash:GetTexture() return "slardar_bash" end
function modifier_item_treasure_bash:OnCreated()
self.stun_duration = self:GetAbility():GetSpecialValueFor("stun_duration")
end
function modifier_item_treasure_bash:DeclareFunctions()
return { MODIFIER_EVENT_ON_ATTACK_LANDED }
end
function modifier_item_treasure_bash:OnAttackLanded(params)
if not IsServer() then return end
local parent = self:GetParent()
local target = params.target
if params.attacker ~= parent or parent:IsIllusion() then return end
if not target or target:IsNull() or target:IsBuilding() or target:IsOther() then return end
target:AddNewModifier(parent, self:GetAbility(), "modifier_item_treasure_bash_stun", { duration = self.stun_duration })
target:EmitSound("Hero_Slardar.Bash")
end
modifier_item_treasure_bash_stun = class({})
function modifier_item_treasure_bash_stun:IsHidden() return false end
function modifier_item_treasure_bash_stun:IsPurgable() return false end
function modifier_item_treasure_bash_stun:IsDebuff() return true end
function modifier_item_treasure_bash_stun:CheckState()
return {
[MODIFIER_STATE_STUNNED] = true
}
end
function modifier_item_treasure_bash_stun:GetEffectName()
return "particles/generic_gameplay/generic_stunned.vpcf"
end
function modifier_item_treasure_bash_stun:GetEffectAttachType()
return PATTACH_OVERHEAD_FOLLOW
end
