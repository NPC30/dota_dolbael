local ____lualib = require("lualib_bundle")
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/abyss-boss-rewards.lua"
__TS__SourceMapTraceBack("modules/event/abyss-boss-rewards.lua", {["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 1,["17"] = 1,["18"] = 10,["19"] = 25,["20"] = 29,["23"] = 30,["24"] = 30,["25"] = 30,["26"] = 30,["28"] = 28,["29"] = 25,["30"] = 34,["31"] = 37,["32"] = 34});
local ____exports = {}
____exports.ABYSS_BOSS_REPEATABLE_REWARD_ITEMS = {
"item_skill_learning",
"item_treasure_chest",
"item_tome_of_ability_reset",
"item_tome_of_strength",
"item_tome_of_agility",
"item_tome_of_intelligence"
}
____exports.ABYSS_BOSS_ONCE_REWARD_ITEMS = {"item_qinglong", "item_baihu", "item_zhuque", "item_xuanwu"}
function ____exports.getAbyssBossRewardCandidates(self, droppedOnceRewards)
local ____array_0 = __TS__SparseArrayNew(unpack(____exports.ABYSS_BOSS_REPEATABLE_REWARD_ITEMS))
__TS__SparseArrayPush(
____array_0,
unpack(__TS__ArrayFilter(
____exports.ABYSS_BOSS_ONCE_REWARD_ITEMS,
function(____, itemName) return not droppedOnceRewards[itemName] end
))
)
return {__TS__SparseArraySpread(____array_0)}
end
function ____exports.isAbyssBossOnceRewardItem(self, itemName)
return __TS__ArrayIncludes(____exports.ABYSS_BOSS_ONCE_REWARD_ITEMS, itemName)
end
return ____exports
