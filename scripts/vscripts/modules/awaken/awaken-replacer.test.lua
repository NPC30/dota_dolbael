local ____lualib = require("lualib_bundle")
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ArrayFindIndex = ____lualib.__TS__ArrayFindIndex
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local ____exports = {}
local ____awaken_2Dreplacer = require("modules.awaken.awaken-replacer")
local applyAwakenByHero = ____awaken_2Dreplacer.applyAwakenByHero
local canAwaken = ____awaken_2Dreplacer.canAwaken
local executeReplacement = ____awaken_2Dreplacer.executeReplacement
local isAwakened = ____awaken_2Dreplacer.isAwakened
local function createFakeHero(self, opts)
local abilities = opts.abilities or ({})
local abilityPoints = opts.abilityPoints or 0
local addOrder = {}
local function makeAbility(____, entry)
return {
GetAbilityName = function() return entry.name end,
GetLevel = function() return entry.level end,
GetMaxLevel = function() return 25 end,
SetLevel = function(____, lvl)
entry.level = lvl
end
}
end
local hero = {
GetUnitName = function() return opts.unitName or "npc_dota_hero_pudge" end,
IsHero = function() return true end,
GetAbilityPoints = function() return abilityPoints end,
SetAbilityPoints = function(____, p)
abilityPoints = p
end,
GetAbilityByIndex = function(____, i)
local entry = abilities[i + 1]
return entry ~= nil and makeAbility(nil, entry) or nil
end,
FindAbilityByName = function(____, name)
local entry = __TS__ArrayFind(
abilities,
function(____, a) return a.name == name end
)
return entry ~= nil and makeAbility(nil, entry) or nil
end,
RemoveAbility = function(____, name)
local idx = __TS__ArrayFindIndex(
abilities,
function(____, a) return a.name == name end
)
if idx >= 0 then
__TS__ArraySplice(abilities, idx, 1)
end
end,
AddAbility = function(____, name)
local entry = {name = name, level = 0}
abilities[#abilities + 1] = entry
addOrder[#addOrder + 1] = name
return makeAbility(nil, entry)
end
}
return {
hero = hero,
abilities = abilities,
addOrder = addOrder,
getPoints = function() return abilityPoints end
}
end
describe(
nil,
"executeReplacement",
function()
it(
nil,
"分支1 纯新增：直接加技能不动原有技能",
function()
local f = createFakeHero(nil, {abilities = {{name = "foo", level = 2}}})
executeReplacement(nil, f.hero, {heroName = "npc_dota_hero_pudge", newAbility = "break_speed_limit", newLevel = 0})
expect(
nil,
__TS__ArrayMap(
f.abilities,
function(____, a) return a.name end
)
):toEqual({"foo", "break_speed_limit"})
end
)
it(
nil,
"分支3 替换：移除旧技能、加新技能",
function()
local f = createFakeHero(nil, {abilities = {{name = "pudge_meat_hook", level = 3}}})
executeReplacement(nil, f.hero, {heroName = "npc_dota_hero_pudge", targetAbility = "pudge_meat_hook", newAbility = "pudge_meat_hook_lua", newLevel = 0})
expect(
nil,
__TS__ArrayMap(
f.abilities,
function(____, a) return a.name end
)
):toEqual({"pudge_meat_hook_lua"})
end
)
it(
nil,
"分支2 插入：原技能被移除后以原等级加回，新技能先入槽",
function()
local f = createFakeHero(nil, {abilities = {{name = "slot0", level = 1}, {name = "slot1", level = 1}, {name = "slot2", level = 1}, {name = "oldUlt", level = 2}}, abilityPoints = 0})
executeReplacement(nil, f.hero, {heroName = "npc_dota_hero_pudge", targetSlot = 3, newAbility = "newInserted", newLevel = 0})
expect(nil, f.addOrder):toEqual({"newInserted", "oldUlt"})
local ____opt_0 = __TS__ArrayFind(
f.abilities,
function(____, a) return a.name == "oldUlt" end
)
expect(nil, ____opt_0 and ____opt_0.level):toBe(2)
expect(
nil,
f:getPoints()
):toBe(2)
end
)
it(
nil,
"分支2 跳过 generic_hidden 空槽，走替换逻辑直接加新技能",
function()
local f = createFakeHero(nil, {abilities = {{name = "generic_hidden", level = 0}}, abilityPoints = 0})
executeReplacement(nil, f.hero, {heroName = "npc_dota_hero_pudge", targetSlot = 0, newAbility = "newInserted", newLevel = 0})
expect(
nil,
__TS__ArraySome(
f.abilities,
function(____, a) return a.name == "newInserted" end
)
):toBe(true)
end
)
it(
nil,
"inheritLevelFrom：插入到关联技能所在槽位时，新技能继承该技能当前等级",
function()
local f = createFakeHero(nil, {abilities = {{name = "slot0", level = 1}, {name = "slot1", level = 1}, {name = "slot2", level = 1}, {name = "axe_culling_blade", level = 3}}})
executeReplacement(nil, f.hero, {
heroName = "npc_dota_hero_axe",
targetSlot = 3,
newAbility = "axe_auto_culling_blade",
newLevel = 0,
inheritLevelFrom = "axe_culling_blade"
})
local ____opt_2 = __TS__ArrayFind(
f.abilities,
function(____, a) return a.name == "axe_auto_culling_blade" end
)
expect(nil, ____opt_2 and ____opt_2.level):toBe(3)
local ____opt_4 = __TS__ArrayFind(
f.abilities,
function(____, a) return a.name == "axe_culling_blade" end
)
expect(nil, ____opt_4 and ____opt_4.level):toBe(3)
end
)
it(
nil,
"inheritLevelFrom：纯新增分支继承关联技能等级",
function()
local f = createFakeHero(nil, {abilities = {{name = "linkedUlt", level = 4}}})
executeReplacement(nil, f.hero, {heroName = "npc_dota_hero_pudge", newAbility = "newPassive", newLevel = 0, inheritLevelFrom = "linkedUlt"})
local ____opt_6 = __TS__ArrayFind(
f.abilities,
function(____, a) return a.name == "newPassive" end
)
expect(nil, ____opt_6 and ____opt_6.level):toBe(4)
end
)
end
)
describe(
nil,
"applyAwakenByHero",
function()
it(
nil,
"命中配置的英雄返回 true 并应用替换",
function()
local f = createFakeHero(nil, {unitName = "npc_dota_hero_pudge", abilities = {{name = "pudge_meat_hook", level = 1}}})
local result = applyAwakenByHero(nil, f.hero)
expect(nil, result):toBe(true)
expect(
nil,
__TS__ArraySome(
f.abilities,
function(____, a) return a.name == "pudge_meat_hook_lua" end
)
):toBe(true)
end
)
it(
nil,
"未配置的英雄返回 false 且不改动技能",
function()
local f = createFakeHero(nil, {unitName = "npc_dota_hero_tinker", abilities = {{name = "tinker_laser", level = 1}}})
local result = applyAwakenByHero(nil, f.hero)
expect(nil, result):toBe(false)
expect(
nil,
__TS__ArrayMap(
f.abilities,
function(____, a) return a.name end
)
):toEqual({"tinker_laser"})
end
)
it(
nil,
"已觉醒的英雄重复使用：返回 false 且不重复添加技能",
function()
local f = createFakeHero(nil, {unitName = "npc_dota_hero_pudge", abilities = {{name = "pudge_meat_hook", level = 1}}})
expect(
nil,
applyAwakenByHero(nil, f.hero)
):toBe(true)
local afterFirst = __TS__ArrayMap(
f.abilities,
function(____, a) return a.name end
)
expect(
nil,
applyAwakenByHero(nil, f.hero)
):toBe(false)
expect(
nil,
__TS__ArrayMap(
f.abilities,
function(____, a) return a.name end
)
):toEqual(afterFirst)
expect(
nil,
#__TS__ArrayFilter(
f.abilities,
function(____, a) return a.name == "pudge_meat_hook_lua" end
)
):toBe(1)
end
)
end
)
describe(
nil,
"canAwaken",
function()
it(
nil,
"配置表内的英雄返回 true",
function()
local f = createFakeHero(nil, {unitName = "npc_dota_hero_pudge"})
expect(
nil,
canAwaken(nil, f.hero)
):toBe(true)
end
)
it(
nil,
"未配置的英雄返回 false",
function()
local f = createFakeHero(nil, {unitName = "npc_dota_hero_tinker"})
expect(
nil,
canAwaken(nil, f.hero)
):toBe(false)
end
)
end
)
describe(
nil,
"isAwakened",
function()
it(
nil,
"未配置的英雄返回 false",
function()
local f = createFakeHero(nil, {unitName = "npc_dota_hero_tinker"})
expect(
nil,
isAwakened(nil, f.hero)
):toBe(false)
end
)
it(
nil,
"支持但未觉醒返回 false",
function()
local f = createFakeHero(nil, {unitName = "npc_dota_hero_pudge", abilities = {{name = "pudge_meat_hook", level = 1}}})
expect(
nil,
isAwakened(nil, f.hero)
):toBe(false)
end
)
it(
nil,
"觉醒后返回 true",
function()
local f = createFakeHero(nil, {unitName = "npc_dota_hero_pudge", abilities = {{name = "pudge_meat_hook", level = 1}}})
applyAwakenByHero(nil, f.hero)
expect(
nil,
isAwakened(nil, f.hero)
):toBe(true)
end
)
end
)
return ____exports
