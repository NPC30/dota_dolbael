local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____ability_2Dlottery_2Dhelper = require("modules.lottery.ability.ability-lottery-helper")
local AbilityLotteryHelper = ____ability_2Dlottery_2Dhelper.AbilityLotteryHelper
local ____lottery_2Dabilities = require("modules.lottery.ability.lottery-abilities")
local abilityTiersPassive = ____lottery_2Dabilities.abilityTiersPassive
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local PASSIVE_TOME_BLACKLIST = {"medusa_mana_shield"}
____exports.ItemPassiveSkillTome = __TS__Class()
local ItemPassiveSkillTome = ____exports.ItemPassiveSkillTome
ItemPassiveSkillTome.name = "ItemPassiveSkillTome"
__TS__ClassExtends(ItemPassiveSkillTome, BaseItem)
function ItemPassiveSkillTome.prototype.castErrorKey(self)
local caster = self:GetCaster()
if caster == nil or not caster:IsHero() then
return ""
end
local playerId = caster:GetPlayerOwnerID()
if (____exports.ItemPassiveSkillTome.usageCount:get(playerId) or 0) >= ____exports.ItemPassiveSkillTome.MAX_USAGE then
return "#dota_hud_error_passive_skill_tome_max_usage"
end
return ""
end
function ItemPassiveSkillTome.prototype.CastFilterResult(self)
local ____temp_0
if self:castErrorKey() ~= "" then
____temp_0 = UF_FAIL_CUSTOM
else
____temp_0 = UF_SUCCESS
end
return ____temp_0
end
function ItemPassiveSkillTome.prototype.GetCustomCastError(self)
return self:castErrorKey()
end
function ItemPassiveSkillTome.prototype.OnSpellStart(self)
local caster = self:GetCaster()
if not caster or not caster:IsHero() then
return
end
local hero = caster
local playerId = hero:GetPlayerOwnerID()
local result = unpack(AbilityLotteryHelper:getRandomAbilities(
abilityTiersPassive,
1,
hero,
__TS__ArraySlice(PASSIVE_TOME_BLACKLIST),
true
))
if not result then
return
end
hero:AddAbility(result.name)
____exports.ItemPassiveSkillTome.usageCount:set(
playerId,
(____exports.ItemPassiveSkillTome.usageCount:get(playerId) or 0) + 1
)
UTIL_Remove(self)
end
ItemPassiveSkillTome.MAX_USAGE = 3
ItemPassiveSkillTome.usageCount = __TS__New(Map)
ItemPassiveSkillTome = __TS__DecorateLegacy(
{registerAbility(nil, "item_passive_skill_tome")},
ItemPassiveSkillTome
)
____exports.ItemPassiveSkillTome = ItemPassiveSkillTome
return ____exports
