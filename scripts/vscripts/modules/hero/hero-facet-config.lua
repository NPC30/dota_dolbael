local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/hero/hero-facet-config.lua"
__TS__SourceMapTraceBack("modules/hero/hero-facet-config.lua", {["8"] = 1,["9"] = 1,["10"] = 1,["12"] = 1,["13"] = 52,["14"] = 53,["15"] = 52,["16"] = 57,["17"] = 58,["18"] = 59,["19"] = 60,["20"] = 61,["21"] = 57,["22"] = 3,["23"] = 3,["24"] = 3,["25"] = 3,["26"] = 3,["27"] = 3,["28"] = 3,["29"] = 3,["30"] = 3,["31"] = 3,["32"] = 3,["33"] = 3,["34"] = 3,["35"] = 3,["36"] = 3,["37"] = 3,["38"] = 3,["39"] = 3,["40"] = 3,["41"] = 3,["42"] = 3,["43"] = 3,["44"] = 3,["45"] = 3,["46"] = 3,["47"] = 3,["48"] = 3,["49"] = 3,["50"] = 3,["51"] = 3,["52"] = 3,["53"] = 3,["54"] = 3,["55"] = 3,["56"] = 3,["57"] = 3,["58"] = 3,["59"] = 3,["60"] = 3,["61"] = 3,["62"] = 3,["63"] = 3,["64"] = 3,["65"] = 3,["66"] = 3,["67"] = 3,["68"] = 3});
local ____exports = {}
____exports.HeroFacetConfig = __TS__Class()
local HeroFacetConfig = ____exports.HeroFacetConfig
HeroFacetConfig.name = "HeroFacetConfig"
function HeroFacetConfig.prototype.____constructor(self)
end
function HeroFacetConfig.getHeroFacetIds(self, heroName)
    return self.heroFacetMap:get(heroName) or ({1})
end
function HeroFacetConfig.getRandomFacetId(self, heroName)
    local facetIds = self:getHeroFacetIds(heroName)
    local randomIndex = math.floor(math.random() * #facetIds)
    local selectedFacetId = facetIds[randomIndex + 1]
    return selectedFacetId
end
HeroFacetConfig.heroFacetMap = __TS__New(Map, {
    {"npc_dota_hero_abaddon", {1, 3}},
    {"npc_dota_hero_axe", {1, 2}},
    {"npc_dota_hero_bane", {1, 2}},
    {"npc_dota_hero_bounty_hunter", {1, 2}},
    {"npc_dota_hero_bloodseeker", {1, 3}},
    {"npc_dota_hero_bristleback", {2, 3}},
    {"npc_dota_hero_chaos_knight", {2, 3, 4}},
    {"npc_dota_hero_crystal_maiden", {3, 4}},
    {"npc_dota_hero_dazzle", {1, 2}},
    {"npc_dota_hero_death_prophet", {2, 3}},
    {"npc_dota_hero_dragon_knight", {1, 2, 3}},
    {"npc_dota_hero_drow_ranger", {1, 2}},
    {"npc_dota_hero_earthshaker", {1, 3}},
    {"npc_dota_hero_jakiro", {3, 4}},
    {"npc_dota_hero_juggernaut", {1, 2}},
    {"npc_dota_hero_kunkka", {1, 2}},
    {"npc_dota_hero_lich", {1, 2}},
    {"npc_dota_hero_lina", {1, 2}},
    {"npc_dota_hero_lion", {1, 2}},
    {"npc_dota_hero_luna", {2, 3}},
    {"npc_dota_hero_medusa", {1, 3, 4}},
    {"npc_dota_hero_meepo", {0}},
    {"npc_dota_hero_necrolyte", {1, 2}},
    {"npc_dota_hero_nevermore", {1, 2}},
    {"npc_dota_hero_ogre_magi", {1, 2}},
    {"npc_dota_hero_omniknight", {1, 2}},
    {"npc_dota_hero_oracle", {1, 2}},
    {"npc_dota_hero_phantom_assassin", {2, 3}},
    {"npc_dota_hero_pudge", {1, 3}},
    {"npc_dota_hero_riki", {1, 2}},
    {"npc_dota_hero_sand_king", {3, 4}},
    {"npc_dota_hero_shadow_shaman", {2, 3}},
    {"npc_dota_hero_skywrath_mage", {1, 2}},
    {"npc_dota_hero_sniper", {1, 2}},
    {"npc_dota_hero_spectre", {1, 2}},
    {"npc_dota_hero_sven", {1, 2}},
    {"npc_dota_hero_tinker", {1, 2}},
    {"npc_dota_hero_tiny", {1, 2}},
    {"npc_dota_hero_vengefulspirit", {1, 2}},
    {"npc_dota_hero_viper", {1, 2}},
    {"npc_dota_hero_warlock", {1, 2}},
    {"npc_dota_hero_windrunner", {4, 5}},
    {"npc_dota_hero_witch_doctor", {3, 4}},
    {"npc_dota_hero_skeleton_king", {1, 2}},
    {"npc_dota_hero_zuus", {1, 2}}
})
return ____exports
