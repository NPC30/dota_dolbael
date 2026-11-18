LinkLuaModifier("modifier_ogre_magi_multicast_lua", "abilities/ogre_magi_multicast_lua.lua", LUA_MODIFIER_MOTION_NONE)
if ogre_magi_multicast_lua == nil then
ogre_magi_multicast_lua = class({})
end
function ogre_magi_multicast_lua:GetIntrinsicModifierName()
return "modifier_ogre_magi_multicast_lua"
end
function ogre_magi_multicast_lua:Precache(context)
PrecacheResource("particle", "particles/econ/items/ogre_magi/ogre_magi_jackpot/ogre_magi_jackpot_multicast.vpcf",
context)
end
if modifier_ogre_magi_multicast_lua == nil then
modifier_ogre_magi_multicast_lua = class({})
end
function modifier_ogre_magi_multicast_lua:DeclareFunctions()
local funcs =
{
MODIFIER_EVENT_ON_ABILITY_EXECUTED,
}
return funcs
end
function modifier_ogre_magi_multicast_lua:IsHidden() return true end
function modifier_ogre_magi_multicast_lua:IsPurgable() return false end
function modifier_ogre_magi_multicast_lua:IsPermanent() return true end
no_support_abilitys = {
invoker_quas = 1,
invoker_wex = 1,
invoker_exort = 1,
invoker_invoke = 1,
invoker_alacrity = 1,
invoker_alacrity_ad = 1,
invoker_forge_spirit = 1,
axe_culling_blade = 1,
ogre_magi_ignite = 1,
viper_viper_strike = 1,
death_prophet_carrion_swarm = 1,
obsidian_destroyer_arcane_orb = 1,
ancient_apparition_frost_seal = 1,
terrorblade_reflection = 1,
terrorblade_metamorphosis = 1,
vengefulspirit_nether_swap = 1,
terrorblade_sunder = 1,
pudge_rot = 1,
winter_wyvern_arctic_burn = 1,
kez_switch_weapons = 1,
faceless_void_time_walk = 1,
faceless_void_time_walk_reverse = 1,
rubick_spell_steal = 1,
magnataur_skewer = 1,
ember_spirit_sleight_of_fist = 1,
goku_kaioken = 1,
doom_bringer_doom = 1,
tusk_snowball = 1,
tiny_tree_channel = 1,
shredder_chakram = 1,
shredder_twisted_chakram = 1,
yukari_moon_portal = 1,
yukari_twin_trains = 1,
storm_spirit_ball_lightning = 1,
phantom_assassin_phantom_strike = 1,
earthshaker_enchant_totem = 1,
wisp_tether = 1,
dawnbreaker_celestial_hammer = 1,
nyx_assassin_burrow = 1,
nyx_assassin_unburrow = 1,
ancient_apparition_ice_blast = 1,
ancient_apparition_ice_blast_release = 1,
elder_titan_ancestral_spirit = 1,
primal_beast_onslaught = 1,
hoodwink_sharpshooter = 1,
hoodwink_sharpshooter_release = 1,
ability_defection = 1,
alchemist_chemical_rage = 1,
pudge_meat_hook_lua = 1,
kunkka_x_marks_the_spot = 1,
grimstroke_return = 1,
rubick_telekinesis = 1,
gold_consumable_converter = 1,
}
no_support_items = {
item_clarity = 1,
item_blood_grenade = 1,
item_flask = 1,
item_dust = 1,
item_bottle = 1,
item_refresher_shard = 1,
item_smoke_of_deceit = 1,
item_cheese = 1,
item_moon_shard_datadriven = 1,
item_ultimate_scepter_2 = 1,
item_consumable_gem = 1,
item_wings_of_haste = 1,
item_candy_candy = 1,
item_repair_kit = 1,
item_jump_jump_jump = 1,
item_fallen_sky = 1,
item_invis_sword = 1,
item_silver_edge = 1,
item_silver_edge_2 = 1,
item_demonicon = 1,
item_power_treads = 1,
item_magic_crit_blade = 1,
item_switchable_crit_blade = 1,
item_hawkeye_turret = 1,
item_hallowed_scepter = 1,
item_baihu = 1,
item_xuanwu = 1,
item_zhuque = 1,
item_qinglong = 1,
item_baihu_p = 1,
item_xuanwu_P = 1,
item_zhuque_p = 1,
item_qinglong_p = 1,
item_treasure_chest = 1,
item_titanium_ward_eye = 1,
item_one_sword = 1,
}
no_support_substrings = {
"mango",
"faerie_fire",
"item_ward",
"item_tango",
"tome",
"blink",
"black_king_bar",
"item_manta",
"item_force_staff",
"item_hurricane_pike",
"item_seer_stone",
"phoenix",
}
function modifier_ogre_magi_multicast_lua:OnAbilityExecuted(keys)
if keys.unit ~= self:GetParent() then
return nil
end
local ability = keys.ability
local abilityName = ability:GetName()
if ability.butterfly_triggered then
return nil
end
if ability.upgrade_triggered then
return nil
end
if no_support_abilitys[abilityName] then
print("no_support_abilitys" .. abilityName)
return nil
end
if no_support_items[abilityName] then
print("no_support_items" .. abilityName)
return nil
end
for _, s in ipairs(no_support_substrings) do
if string.find(abilityName, s) then
print("no_support_substrings" .. abilityName)
return nil
end
end
if IsAbilityBehavior(ability:GetBehavior(), DOTA_ABILITY_BEHAVIOR_CHANNELLED) then
return nil
end
if ability.multicast and ability.multicast > 1 then
return nil
end
local random_int = RandomInt(1, 100)
local multicast_2_times = self:GetAbility():GetSpecialValueFor("multicast_2_times")
local multicast_3_times = self:GetAbility():GetSpecialValueFor("multicast_3_times")
local multicast_4_times = self:GetAbility():GetSpecialValueFor("multicast_4_times")
if random_int <= multicast_4_times then
ability.multicast = 4
EmitSoundOn("Hero_OgreMagi.Fireblast.x3", keys.unit)
local particle = ParticleManager:CreateParticle(
"particles/econ/items/ogre_magi/ogre_magi_jackpot/ogre_magi_jackpot_multicast.vpcf",
PATTACH_OVERHEAD_FOLLOW,
keys.unit)
ParticleManager:SetParticleControl(particle, 1, Vector(4, 1, 1))
ParticleManager:ReleaseParticleIndex(particle)
elseif random_int <= multicast_3_times then
ability.multicast = 3
EmitSoundOn("Hero_OgreMagi.Fireblast.x2", keys.unit)
local particle = ParticleManager:CreateParticle(
"particles/econ/items/ogre_magi/ogre_magi_jackpot/ogre_magi_jackpot_multicast.vpcf",
PATTACH_OVERHEAD_FOLLOW,
keys.unit)
ParticleManager:SetParticleControl(particle, 1, Vector(3, 1, 1))
ParticleManager:ReleaseParticleIndex(particle)
elseif random_int <= multicast_2_times then
ability.multicast = 2
EmitSoundOn("Hero_OgreMagi.Fireblast.x1", keys.unit)
local particle = ParticleManager:CreateParticle(
"particles/econ/items/ogre_magi/ogre_magi_jackpot/ogre_magi_jackpot_multicast.vpcf",
PATTACH_OVERHEAD_FOLLOW,
keys.unit)
ParticleManager:SetParticleControl(particle, 1, Vector(2, 1, 1))
ParticleManager:ReleaseParticleIndex(particle)
else
ability.multicast = 1
return nil
end
local multicastDelay = self:GetAbility():GetSpecialValueFor("multicast_delay")
local target = keys.target
local pos = ability:GetCursorPosition()
ability:SetContextThink("think_multicast", function()
local cursorPositionBeforeCast = keys.unit:GetCursorPosition()
if IsHeroUncontrollable(keys.unit) then
ability.multicast = nil
return nil
end
if keys.unit:IsChanneling() then
ability.multicast = nil
return nil
end
if ability:GetMaxAbilityCharges(ability:GetLevel()) > 0 then
if ability:IsItem() then
ability:SetCurrentCharges(ability:GetCurrentCharges() + 1)
else
ability:SetCurrentAbilityCharges(ability:GetCurrentAbilityCharges() + 1)
end
end
if IsAbilityBehavior(ability:GetBehavior(), DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) then
local units = FindUnitsInRadius(keys.unit:GetTeamNumber(), pos, nil, ability:GetCastRange(pos, nil),
ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(),
ability:GetAbilityTargetFlags() + DOTA_UNIT_TARGET_FLAG_CAN_BE_SEEN,
FIND_ANY_ORDER, false)
if #units > 0 then
target = units[RandomInt(1, #units)]
pos = target:GetAbsOrigin()
end
end
ability:EndCooldown()
keys.unit:SetCursorCastTarget(target)
keys.unit:SetCursorPosition(pos)
keys.unit:CastAbilityImmediately(ability, 0)
keys.unit:SetCursorCastTarget(nil)
keys.unit:GiveMana(ability:GetManaCost(-1))
keys.unit:SetCursorPosition(cursorPositionBeforeCast)
ability.multicast = ability.multicast - 1
if ability.multicast <= 1 then
ability.multicast = nil
else
return multicastDelay
end
end, multicastDelay)
end
