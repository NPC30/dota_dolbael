local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/helper/hero-name-helper.lua"
__TS__SourceMapTraceBack("modules/helper/hero-name-helper.lua", {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 44,["12"] = 45,["13"] = 46,["14"] = 47,["15"] = 48,["18"] = 51,["19"] = 44,["20"] = 54,["21"] = 55,["22"] = 56,["24"] = 58,["25"] = 54,["26"] = 61,["27"] = 62,["28"] = 63,["29"] = 64,["32"] = 67,["33"] = 61,["34"] = 2,["35"] = 2,["36"] = 2,["37"] = 2,["38"] = 2,["39"] = 2,["40"] = 2,["41"] = 2,["42"] = 2});
local ____exports = {}
____exports.HeroNameHelper = __TS__Class()
local HeroNameHelper = ____exports.HeroNameHelper
HeroNameHelper.name = "HeroNameHelper"
function HeroNameHelper.prototype.____constructor(self)
end
function HeroNameHelper.GetBackendHeroName(self, hero)
    local unitName = hero:GetUnitName()
    for ____, customHero in ipairs(____exports.HeroNameHelper.CUSTOM_HERO_OVERRIDES) do
        if unitName == customHero.unitName and ____exports.HeroNameHelper:HasAnyAbility(hero, customHero.signatureAbilities) then
            return customHero.backendHeroName
        end
    end
    return unitName
end
function HeroNameHelper.IsSameBackendHero(self, hero, heroId)
    if not heroId then
        return false
    end
    return heroId == hero:GetUnitName() or heroId == ____exports.HeroNameHelper:GetBackendHeroName(hero)
end
function HeroNameHelper.HasAnyAbility(self, hero, abilityNames)
    for ____, abilityName in ipairs(abilityNames) do
        if hero:HasAbility(abilityName) then
            return true
        end
    end
    return false
end
HeroNameHelper.CUSTOM_HERO_OVERRIDES = {
    {unitName = "npc_dota_hero_dark_seer", backendHeroName = "npc_dota_hero_sword_master", signatureAbilities = {"sword_master_sweep", "sword_master_chop_kill_with_one_sword"}},
    {unitName = "npc_dota_hero_brewmaster", backendHeroName = "npc_dota_hero_jack", signatureAbilities = {"jack_presence_concealment", "jack_maria_the_ripper"}},
    {unitName = "npc_dota_hero_chen", backendHeroName = "npc_dota_hero_Goku", signatureAbilities = {"goku_kamehameha", "goku_super_saiyan"}},
    {unitName = "npc_dota_hero_visage", backendHeroName = "npc_dota_hero_abyss_sword", signatureAbilities = {"abyss_sword_hidden_sharp", "abyss_sword_hidden_sharp_upgrade", "abyss_sword_rush_night_sword_qi"}},
    {unitName = "npc_dota_hero_meepo", backendHeroName = "Miku", signatureAbilities = {"miku_hadouken", "miku_dance"}},
    {unitName = "npc_dota_hero_broodmother", backendHeroName = "npc_dota_hero_artoria", signatureAbilities = {"artoria_strike_air", "artoria_excalibur"}},
    {unitName = "npc_dota_hero_phantom_lancer", backendHeroName = "Yukari", signatureAbilities = {"ability_yukari_01", "yukari_twin_trains"}}
}
return ____exports
