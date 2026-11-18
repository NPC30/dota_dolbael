local ____lualib = require("lualib_bundle")
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/abyss-boss-rewards.test.lua"
__TS__SourceMapTraceBack("modules/event/abyss-boss-rewards.test.lua", {["8"] = 1,["9"] = 2,["10"] = 3,["11"] = 4,["12"] = 7,["13"] = 7,["14"] = 7,["15"] = 7,["16"] = 8,["17"] = 8,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 16,["23"] = 17,["24"] = 18,["27"] = 16,["29"] = 8,["30"] = 8,["31"] = 23,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 24,["36"] = 31,["37"] = 23,["38"] = 23,["39"] = 34,["40"] = 34,["41"] = 34,["42"] = 34,["43"] = 35,["44"] = 36,["45"] = 37,["46"] = 38,["47"] = 39,["48"] = 34,["49"] = 34,["50"] = 42,["51"] = 42,["52"] = 42,["53"] = 42,["54"] = 43,["55"] = 42,["56"] = 42,["57"] = 7,["58"] = 7});
local ____exports = {}
local ____abyss_2Dboss_2Drewards = require("modules.event.abyss-boss-rewards")
local ABYSS_BOSS_ONCE_REWARD_ITEMS = ____abyss_2Dboss_2Drewards.ABYSS_BOSS_ONCE_REWARD_ITEMS
local ABYSS_BOSS_REPEATABLE_REWARD_ITEMS = ____abyss_2Dboss_2Drewards.ABYSS_BOSS_REPEATABLE_REWARD_ITEMS
local getAbyssBossRewardCandidates = ____abyss_2Dboss_2Drewards.getAbyssBossRewardCandidates
describe(
nil,
"abyss boss rewards",
function()
it(
nil,
"includes repeatable rewards and not-yet-dropped four saint rewards",
function()
local candidates = getAbyssBossRewardCandidates(nil, {item_qinglong = true, item_baihu = false, item_zhuque = false, item_xuanwu = true})
local ____self_1 = expect(nil, candidates)
local ____self_1_toEqual_2 = ____self_1.toEqual
local ____array_0 = __TS__SparseArrayNew(unpack(ABYSS_BOSS_REPEATABLE_REWARD_ITEMS))
__TS__SparseArrayPush(____array_0, "item_baihu", "item_zhuque")
____self_1_toEqual_2(
____self_1,
{__TS__SparseArraySpread(____array_0)}
)
end
)
it(
nil,
"keeps repeatable rewards available after all four saint rewards have dropped",
function()
local candidates = getAbyssBossRewardCandidates(nil, {item_qinglong = true, item_baihu = true, item_zhuque = true, item_xuanwu = true})
expect(nil, candidates):toEqual(ABYSS_BOSS_REPEATABLE_REWARD_ITEMS)
end
)
it(
nil,
"includes attribute tomes as repeatable rewards without luoshu or gold bag",
function()
expect(nil, ABYSS_BOSS_REPEATABLE_REWARD_ITEMS):toContain("item_tome_of_strength")
expect(nil, ABYSS_BOSS_REPEATABLE_REWARD_ITEMS):toContain("item_tome_of_agility")
expect(nil, ABYSS_BOSS_REPEATABLE_REWARD_ITEMS):toContain("item_tome_of_intelligence")
expect(nil, ABYSS_BOSS_REPEATABLE_REWARD_ITEMS)["not"]:toContain("item_tome_of_luoshu")
expect(nil, ABYSS_BOSS_REPEATABLE_REWARD_ITEMS)["not"]:toContain("item_bag_of_gold")
end
)
it(
nil,
"tracks all four saint rewards as once-only rewards",
function()
expect(nil, ABYSS_BOSS_ONCE_REWARD_ITEMS):toEqual({"item_qinglong", "item_baihu", "item_zhuque", "item_xuanwu"})
end
)
end
)
return ____exports
