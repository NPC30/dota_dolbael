local ____exports = {}
local ____hero_2Dbuild_2Dconfig = require("ai.build-item.hero-build-config")
local HeroBuilds = ____hero_2Dbuild_2Dconfig.HeroBuilds
local ____hero_2Dbuild_2Dstate = require("ai.build-item.hero-build-state")
local InitializeHeroBuild = ____hero_2Dbuild_2Dstate.InitializeHeroBuild
global.print = jest:fn()
describe(
nil,
"InitializeHeroBuild",
function()
beforeEach(
nil,
function()
jest:clearAllMocks()
end
)
it(
nil,
"测试 6: Abaddon 的实际测试",
function()
local mockHero = {GetUnitName = function() return "npc_dota_hero_abaddon" end}
local abaddonConfig = HeroBuilds.npc_dota_hero_abaddon
local result = InitializeHeroBuild(nil, mockHero, abaddonConfig)
console:log(result)
end
)
it(
nil,
"测试 7: Axe 的实际测试",
function()
local mockHero = {GetUnitName = function() return "npc_dota_hero_axe" end}
local axeConfig = HeroBuilds.npc_dota_hero_axe
local result = InitializeHeroBuild(nil, mockHero, axeConfig)
console:log(result)
end
)
end
)
return ____exports
