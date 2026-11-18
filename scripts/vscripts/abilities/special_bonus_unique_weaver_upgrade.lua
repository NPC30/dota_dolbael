local weaver_swarm_timers = {}
function OnAbilityExecuted_Weaver(keys)
local caster = keys.caster
local ability_executed = keys.event_ability
if ability_executed:GetAbilityName() == "weaver_the_swarm" then
local caster_id = caster:GetEntityIndex()
local checkInterval = keys.AttackInterval
if weaver_swarm_timers[caster_id] then
for _, timer in pairs(weaver_swarm_timers[caster_id]) do
Timers:RemoveTimer(timer)
end
end
weaver_swarm_timers[caster_id] = {}
local marked_enemies = {}
local timer1 = Timers:CreateTimer(checkInterval, function()
DetectAndAttackEnemies(caster, ability_executed, marked_enemies)
end)
table.insert(weaver_swarm_timers[caster_id], timer1)
local timer2 = Timers:CreateTimer(checkInterval * 2, function()
DetectAndAttackEnemies(caster, ability_executed, marked_enemies)
local persistent_timer = Timers:CreateTimer(checkInterval, function()
return CheckAndAttackMarkedEnemies(caster, ability_executed, marked_enemies,
weaver_swarm_timers[caster_id])
end)
table.insert(weaver_swarm_timers[caster_id], persistent_timer)
end)
table.insert(weaver_swarm_timers[caster_id], timer2)
end
end
function OnAbilityExecuted_Weaver2(keys)
local caster = keys.caster
local ability_executed = keys.event_ability
if ability_executed:GetAbilityName() == "weaver_the_swarm" then
local caster_id = caster:GetEntityIndex()
if weaver_swarm_timers[caster_id] then
for _, timer in pairs(weaver_swarm_timers[caster_id]) do
Timers:RemoveTimer(timer)
end
end
weaver_swarm_timers[caster_id] = {}
local marked_enemies = {}
local checkInterval = keys.CheckInterval or 0.3
local check_delay = keys.CheckDelay or 1.2
local timer1 = Timers:CreateTimer(check_delay, function()
DetectAndAttackEnemies(caster, ability_executed, marked_enemies)
return nil
end)
table.insert(weaver_swarm_timers[caster_id], timer1)
local duration = ability_executed:GetSpecialValueFor("duration") or 10.0
local total_duration = 0
local ability_weaver_geminate_attack_last_cooldown_ready = true
local timer2 = Timers:CreateTimer(check_delay, function()
total_duration = total_duration + checkInterval
if total_duration >= duration then
return nil
end
if not caster:IsAlive() then
return nil
end
local ability_weaver_geminate_attack = caster:FindAbilityByName("weaver_geminate_attack")
if not ability_weaver_geminate_attack then
return
end
local extra_attack = ability_weaver_geminate_attack:GetSpecialValueFor("extra_attack") or 1
local current_cooldown_ready = ability_weaver_geminate_attack:IsCooldownReady()
if (ability_weaver_geminate_attack_last_cooldown_ready and not current_cooldown_ready) then
local has_rest_enemies = CheckAndAttackMarkedEnemies(caster, ability_executed, marked_enemies,
weaver_swarm_timers[caster_id])
if not has_rest_enemies then
return nil
end
if (extra_attack == 2) then
local timer3 = Timers:CreateTimer(0.3, function()
CheckAndAttackMarkedEnemies(caster, ability_executed, marked_enemies,
weaver_swarm_timers[caster_id])
return nil
end)
table.insert(weaver_swarm_timers[caster_id], timer3)
end
end
ability_weaver_geminate_attack_last_cooldown_ready = current_cooldown_ready
return checkInterval
end)
table.insert(weaver_swarm_timers[caster_id], timer2)
end
end
function DetectAndAttackEnemies(caster, ability, marked_list)
local radius = (ability:GetSpecialValueFor("AbilityCastRange") or 2000) + 600
local enemies = FindUnitsInRadius(caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false)
for _, enemy in pairs(enemies) do
if enemy:IsAlive() and enemy:HasModifier("modifier_weaver_swarm_debuff") then
local already_marked = false
for _, marked in pairs(marked_list) do
if marked == enemy then
already_marked = true
break
end
end
if not already_marked then
table.insert(marked_list, enemy)
caster:PerformAttack(enemy, true, true, true, false, true, false, true)
end
end
end
end
function CheckAndAttackMarkedEnemies(caster, ability, marked_list, timer_list)
local enemies_to_remove = {}
local has_valid_enemies = false
if not caster:IsAlive() then
return false
end
for i, enemy in pairs(marked_list) do
if enemy:IsAlive() and enemy:HasModifier("modifier_weaver_swarm_debuff") then
caster:PerformAttack(enemy, true, true, true, false, true, false, true)
has_valid_enemies = true
else
table.insert(enemies_to_remove, i)
end
end
for i = #enemies_to_remove, 1, -1 do
table.remove(marked_list, enemies_to_remove[i])
end
if not has_valid_enemies or #marked_list == 0 then
for _, timer in pairs(timer_list) do
Timers:RemoveTimer(timer)
end
for i = #timer_list, 1, -1 do
timer_list[i] = nil
end
return false
else
return true
end
end
function OnAbilityExecuted_Luna(keys)
local ability_executed = keys.event_ability
local caster = keys.caster
if ability_executed:GetAbilityName() == "luna_lucent_beam" then
local upgrade_ability = caster:FindAbilityByName("special_bonus_unique_luna_upgrade")
local has_autocast = upgrade_ability:GetAutoCastState()
local target = keys.target
if has_autocast then
caster:PerformAttack(target, true, true, true, false, true, false, true)
else
caster:PerformAttack(target, true, true, true, false, false, false, true)
end
elseif ability_executed:GetAbilityName() == "luna_eclipse" then
local target_pos = ability_executed:GetCursorPosition()
local upgrade_ability = caster:FindAbilityByName("special_bonus_unique_luna_upgrade")
local has_autocast = upgrade_ability:GetAutoCastState()
local eclipse_ability = caster:FindAbilityByName("luna_eclipse")
local radius = eclipse_ability:GetSpecialValueFor("radius")
local beam_interval = eclipse_ability:GetSpecialValueFor("beam_interval")
local hit_count = eclipse_ability:GetSpecialValueFor("beams")
local ability_duration = eclipse_ability:GetSpecialValueFor("AbilityDuration")
local attacks_made = 0
local elapsed_time = 0
Timers:CreateTimer(function()
if attacks_made >= hit_count or elapsed_time >= ability_duration then
return nil
end
if target_pos.x == 0 and target_pos.y == 0 and target_pos.z == 0 then
target_pos = caster:GetAbsOrigin()
end
local enemies = FindUnitsInRadius(caster:GetTeamNumber(),
target_pos,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false)
if #enemies > 0 then
local random_enemy = enemies[RandomInt(1, #enemies)]
if random_enemy:IsAlive() then
if has_autocast then
caster:PerformAttack(random_enemy, true, true, true, false, true, false, true)
else
caster:PerformAttack(random_enemy, true, true, true, false, false, false, true)
end
attacks_made = attacks_made + 1
end
end
elapsed_time = elapsed_time + beam_interval
return beam_interval
end)
end
end
function OnAbilityExecuted_LegionCommander(keys)
local ability_executed = keys.event_ability
local ability = keys.ability
local caster = keys.caster
if ability_executed:GetAbilityName() == "legion_commander_duel" then
local target = keys.target
if target then
local duration = ability_executed:GetSpecialValueFor("duration") or 7.0
target:AddNewModifier(caster, ability, "modifier_item_nullifier_mute", { duration = duration })
target:AddNewModifier(caster, ability, "modifier_break", { duration = duration })
end
elseif ability_executed:GetAbilityName() == "legion_commander_overwhelming_odds" then
local eclipse_ability = caster:FindAbilityByName("legion_commander_overwhelming_odds")
local radius = eclipse_ability:GetSpecialValueFor("radius")
local extra_damage_per_unit = caster:GetAverageTrueAttackDamage(nil)
local enemies = FindUnitsInRadius(
caster:GetTeamNumber(),
caster:GetAbsOrigin(),
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
local hero_count = 0
for _, enemy in pairs(enemies) do
if enemy:IsHero() then
hero_count = hero_count + 1
end
end
local total_damage = hero_count * extra_damage_per_unit
for _, enemy in pairs(enemies) do
ApplyDamage({
victim = enemy,
attacker = caster,
damage = total_damage,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = eclipse_ability
})
end
end
end
function OnAbilityExecuted_Omni(keys)
local ability_executed = keys.event_ability
local caster = keys.caster
if ability_executed:GetAbilityName() == "omniknight_purification" then
local target = keys.target
local radius = ability_executed:GetSpecialValueFor("radius") or 500
local damage_amount = caster:GetStrength() * keys.str_damage_pct / 100
local heal_amount = damage_amount * (1 + caster:GetSpellAmplification(false))
Timers:CreateTimer(keys.delay, function()
target:Heal(heal_amount, ability_executed)
SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, target, heal_amount, nil)
local enemies = FindUnitsInRadius(caster:GetTeamNumber(),
target:GetAbsOrigin(),
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
damage = damage_amount,
damage_type = DAMAGE_TYPE_PURE,
ability = ability_executed
})
end
end)
end
end
function OnAttackLanded_Omni(keys)
local ability = keys.caster:FindAbilityByName("omniknight_hammer_of_purity")
Timers:CreateTimer(keys.delay, function()
if not keys.target:IsAlive() then
ability:EndCooldown()
return nil
end
return nil
end)
end
function OnAbilityExecuted_Oracle(keys)
local ability_executed = keys.event_ability
local caster = keys.caster
if ability_executed:GetAbilityName() == "oracle_rain_of_destiny" then
local target_pos = ability_executed:GetCursorPosition()
local radius = ability_executed:GetSpecialValueFor("radius") or 800
local duration = ability_executed:GetSpecialValueFor("duration") or 10.0
local total_duration = 0
local purifying_flames_ability = caster:FindAbilityByName("oracle_purifying_flames")
local cast_point = purifying_flames_ability:GetCastPoint()
purifying_flames_ability:SetOverrideCastPoint(0.0)
Timers:CreateTimer(0.05, function()
total_duration = total_duration + (keys.check_interval or 1.0)
if total_duration >= duration then
return nil
end
local enemies = FindUnitsInRadius(caster:GetTeamNumber(),
target_pos,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
if #enemies > 0 then
local int_duration = 0
Timers:CreateTimer(0, function()
int_duration = int_duration + (keys.damage_interval or 0.3)
if int_duration >= keys.check_interval then
return nil
end
for i = 1, 2 do
local index = RandomInt(1, #enemies)
purifying_flames_ability:EndCooldown()
if caster:IsChanneling() then
return
end
caster:SetCursorCastTarget(enemies[index])
caster:CastAbilityImmediately(purifying_flames_ability, caster:GetPlayerOwnerID())
end
caster:SetCursorCastTarget(nil)
return keys.damage_interval or 0.3
end)
end
return keys.check_interval or 2.0
end)
purifying_flames_ability:SetOverrideCastPoint(cast_point)
elseif ability_executed:GetAbilityName() == "oracle_purifying_flames" then
local target = keys.target
if target and target:GetTeamNumber() ~= caster:GetTeamNumber() then
Timers:CreateTimer(0.05, function()
ApplyDamage({
victim = target,
attacker = caster,
damage = caster:GetIntellect(false),
damage_type = DAMAGE_TYPE_MAGICAL,
ability = ability_executed
})
target:Purge(true, false, false, false, false)
return nil
end)
end
end
end
function OnAbilityExecuted_Snapfire(keys)
local ability_executed = keys.event_ability
local caster = keys.caster
if ability_executed:GetAbilityName() == "snapfire_gobble_up" then
print("[OnAbilityExecuted_Snapfire] snapfire_gobble_up")
local target = keys.target
local caster = keys.caster
local rate = keys.rate or 0.5
local duration = keys.duration or 10.0
if not target then return end
local attack_damage = target:GetAverageTrueAttackDamage(nil) * rate
local attack_speed = target:GetAttackSpeed(false) * 100 *
rate
local attack_range = target:Script_GetAttackRange() * rate
local spell_amp = (target:GetSpellAmplification(false) + 1) * rate * 100
local armor = target:GetPhysicalArmorValue(false) * rate
local health = target:GetMaxHealth() * rate
caster:AddNewModifier(caster, ability_executed, "modifier_snapfire_gobble_up_buff",
{
duration = duration,
attack_damage = attack_damage,
attack_speed = attack_speed,
attack_range = attack_range,
spell_amp = spell_amp,
armor = armor,
health = health
})
elseif
ability_executed:GetAbilityName() == "snapfire_spit_creep" then
print("[OnAbilityExecuted_Snapfire] snapfire_wolves")
local target_pos = ability_executed:GetCursorPosition()
local radius = ability_executed:GetSpecialValueFor("impact_radius") or 500
local damage_amount = math.min(caster:GetMaxHealth() * (keys.heath_rate or 0.5),
caster:GetAverageTrueAttackDamage(nil) * (keys.attack_rate or 5))
local distance = (caster:GetAbsOrigin() - target_pos):Length2D()
local speed = ability_executed:GetSpecialValueFor("projectile_speed") or 2100
local delay = distance / speed
Timers:CreateTimer(delay, function()
local enemies = FindUnitsInRadius(caster:GetTeamNumber(),
target_pos,
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
damage = damage_amount,
damage_type = DAMAGE_TYPE_MAGICAL,
ability = ability_executed
})
end
end)
end
end
LinkLuaModifier("modifier_snapfire_gobble_up_buff", "abilities/special_bonus_unique_weaver_upgrade.lua",
LUA_MODIFIER_MOTION_NONE)
modifier_snapfire_gobble_up_buff = class({})
function modifier_snapfire_gobble_up_buff:IsHidden() return false end
function modifier_snapfire_gobble_up_buff:IsPurgable() return false end
function modifier_snapfire_gobble_up_buff:IsDebuff() return false end
function modifier_snapfire_gobble_up_buff:DeclareFunctions()
return {
MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
MODIFIER_PROPERTY_HEALTH_BONUS,
}
end
function modifier_snapfire_gobble_up_buff:OnCreated(kv)
if not IsServer() then return end
self.attack_damage = kv.attack_damage or 0
self.attack_speed = kv.attack_speed or 0
self.attack_range = kv.attack_range or 0
self.spell_amp = kv.spell_amp or 0
self.armor = kv.armor or 0
self.health = kv.health or 0
self:SetHasCustomTransmitterData(true)
end
function modifier_snapfire_gobble_up_buff:AddCustomTransmitterData()
return {
attack_damage = self.attack_damage,
attack_speed = self.attack_speed,
attack_range = self.attack_range,
spell_amp = self.spell_amp,
armor = self.armor,
health = self.health,
}
end
function modifier_snapfire_gobble_up_buff:HandleCustomTransmitterData(data)
self.attack_damage = data.attack_damage
self.attack_speed = data.attack_speed
self.attack_range = data.attack_range
self.spell_amp = data.spell_amp
self.armor = data.armor
self.health = data.health
end
function modifier_snapfire_gobble_up_buff:GetModifierPreAttack_BonusDamage()
return self.attack_damage
end
function modifier_snapfire_gobble_up_buff:GetModifierAttackSpeedBonus_Constant()
return self.attack_speed
end
function modifier_snapfire_gobble_up_buff:GetModifierAttackRangeBonus()
return self.attack_range
end
function modifier_snapfire_gobble_up_buff:GetModifierSpellAmplify_Percentage()
return self.spell_amp
end
function modifier_snapfire_gobble_up_buff:GetModifierPhysicalArmorBonus()
return self.armor
end
function modifier_snapfire_gobble_up_buff:GetModifierHealthBonus()
return self.health
end
local function IsLinaUpgradeSuppressedByExtraCast(ability_executed)
if ability_executed.lina_upgrade_active then
return true
end
if ability_executed.chilie_allow_lina_upgrade_once then
ability_executed.chilie_allow_lina_upgrade_once = nil
return false
end
if ability_executed.upgrade_triggered and ability_executed.upgrade_triggered > 0 then
return true
end
if ability_executed.chilie_trigger_active then
return true
end
return false
end
function OnAbilityExecuted_Lina(keys)
local ability_executed = keys.event_ability
local caster = keys.caster
if ability_executed:GetAbilityName() == "lina_laguna_blade" then
if not caster:FindModifierByName("modifier_lina_flame_cloak") then
return nil
end
if IsLinaUpgradeSuppressedByExtraCast(ability_executed) then
return nil
end
local target = keys.target
local extra_target_num = 1 + math.floor(caster:GetIntellect(false) / (keys.int_vavle or 500))
local cast_point = ability_executed:GetCastPoint() or 0.1
ability_executed:SetOverrideCastPoint(0.0)
if (extra_target_num > (keys.maxnum or 8)) then
extra_target_num = keys.maxnum or 8
end
Timers:CreateTimer(keys.delay or 0.05, function()
ability_executed.lina_upgrade_active = true
ability_executed.upgrade_triggered = extra_target_num
local enemies = FindUnitsInRadius(caster:GetTeamNumber(),
target:GetAbsOrigin(),
nil,
keys.radius or 300,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
local delay = 0
if (#enemies > 0) then
for i = 1, extra_target_num do
delay = (i) * (keys.delay or 0.05)
Timers:CreateTimer(delay, function()
local index = RandomInt(1, #enemies)
ability_executed:EndCooldown()
caster:SetCursorCastTarget(enemies[index])
caster:CastAbilityImmediately(ability_executed, caster:GetPlayerOwnerID())
caster:SetCursorCastTarget(nil)
end)
end
end
Timers:CreateTimer(delay + 0.05, function()
ability_executed.lina_upgrade_active = nil
if not ability_executed.chilie_trigger_active then
ability_executed.upgrade_triggered = nil
end
return nil
end)
return nil
end)
ability_executed:SetOverrideCastPoint(cast_point)
elseif ability_executed:GetAbilityName() == "lina_light_strike_array" then
if not caster:FindModifierByName("modifier_lina_flame_cloak") then
return nil
end
if IsLinaUpgradeSuppressedByExtraCast(ability_executed) then
return nil
end
local target_pos = ability_executed:GetCursorPosition()
local extra_target_num = 1 + math.floor(caster:GetIntellect(false) / (keys.int_valve or 500))
if (extra_target_num > (keys.maxnum or 8)) then
extra_target_num = keys.maxnum or 8
end
local cast_point = ability_executed:GetCastPoint() or 0.1
ability_executed:SetOverrideCastPoint(0.0)
Timers:CreateTimer(keys.delay or 0.05, function()
ability_executed.lina_upgrade_active = true
ability_executed.upgrade_triggered = extra_target_num
for _ = 1, extra_target_num do
local random_pos = target_pos + RandomVector(keys.radius * 1.5 or 450)
print("[OnAbilityExecuted_Lina] random_pos", random_pos)
ability_executed:EndCooldown()
caster:SetCursorPosition(random_pos)
caster:CastAbilityImmediately(ability_executed, caster:GetPlayerOwnerID())
end
ability_executed.lina_upgrade_active = nil
if not ability_executed.chilie_trigger_active then
ability_executed.upgrade_triggered = nil
end
Timers:CreateTimer(0.05, function()
return nil
end)
return nil
end)
ability_executed:SetOverrideCastPoint(cast_point)
end
end
function OnAbilityExecuted_Storm_Spirit(keys)
local ability_executed = keys.event_ability
local caster = keys.caster
if ability_executed:GetAbilityName() == "storm_spirit_static_remnant" then
if ability_executed.upgrade_triggered and ability_executed.upgrade_triggered > 0 then
return nil
end
local target_pos = ability_executed:GetCursorPosition()
local extra_target_num = caster:GetIntellect(false) / (keys.int_valve or 100)
if (extra_target_num > (keys.maxnum or 10)) then
extra_target_num = keys.maxnum or 10
end
ability_executed.upgrade_triggered = extra_target_num
local num = 0
Timers:CreateTimer(keys.delay or 0.1, function()
num = num + 1
ability_executed:EndCooldown()
caster:SetCursorPosition(target_pos)
caster:CastAbilityImmediately(ability_executed, caster:GetPlayerOwnerID())
if num >= extra_target_num then
ability_executed.upgrade_triggered = nil
return nil
end
return keys.delay or 0.1
end)
end
end
function OnAbilityExecuted_Enigma(keys)
local ability_executed = keys.event_ability
local caster = keys.caster
if ability_executed:GetAbilityName() == "enigma_midnight_pulse" then
local target_pos = ability_executed:GetCursorPosition()
local radius = ability_executed:GetSpecialValueFor("radius") or 800
local eidolons_enigma = FindUnitsInRadius(caster:GetTeamNumber(),
target_pos,
nil,
radius,
DOTA_UNIT_TARGET_TEAM_FRIENDLY,
DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
for i, eidolon in pairs(eidolons_enigma) do
if eidolon:GetUnitName() == "npc_dota_dire_eidolon" or eidolon:GetUnitName() == "npc_dota_greater_eidolon" or eidolon:GetUnitName() == "npc_dota_eidolon" or eidolon:GetUnitName() == "npc_dota_lesser_eidolon" then
local delay = 0 + (i - 1) * 0.1
Timers:CreateTimer(delay, function()
if not eidolon:IsAlive() then
return nil
end
local enemies = FindUnitsInRadius(caster:GetTeamNumber(),
eidolon:GetAbsOrigin(),
nil,
keys.radius or 200,
DOTA_UNIT_TARGET_TEAM_ENEMY,
DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
DOTA_UNIT_TARGET_FLAG_NONE,
FIND_ANY_ORDER,
false
)
local damage_amount = (eidolon:GetMaxHealth() or eidolon:GetHealth()) - 900
for _, enemy in pairs(enemies) do
ApplyDamage({
victim = enemy,
attacker = caster,
damage = damage_amount,
damage_type = DAMAGE_TYPE_PURE,
ability = ability_executed
})
end
EmitSoundOn("Hero_Techies.RemoteMine.Detonate", eidolon)
eidolon:Destroy()
return nil
end)
end
end
end
end
