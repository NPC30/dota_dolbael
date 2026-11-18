local ____lualib = require("lualib_bundle")
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "utils/precache.lua"
__TS__SourceMapTraceBack("utils/precache.lua", {["8"] = 49,["9"] = 3,["10"] = 3,["11"] = 3,["12"] = 3,["13"] = 49,["14"] = 50,["15"] = 50,["16"] = 50,["17"] = 51,["18"] = 52,["19"] = 53,["21"] = 55,["23"] = 50,["24"] = 50,["26"] = 60,["27"] = 61,["28"] = 61,["29"] = 61,["30"] = 62,["31"] = 61,["32"] = 61,["34"] = 65,["35"] = 66,["36"] = 67,["37"] = 68,["38"] = 69,["39"] = 70,["40"] = 71,["43"] = 76,["44"] = 77,["45"] = 78,["46"] = 78,["47"] = 78,["48"] = 79,["49"] = 78,["50"] = 78,["52"] = 82,["53"] = 82,["54"] = 82,["55"] = 83,["56"] = 83,["57"] = 83,["58"] = 83,["59"] = 83,["60"] = 82,["61"] = 82,["64"] = 88,["65"] = 89,["66"] = 89,["67"] = 89,["68"] = 90,["69"] = 89,["70"] = 89,["72"] = 95,["73"] = 96,["74"] = 97,["75"] = 98,["76"] = 99,["77"] = 100,["81"] = 106,["82"] = 108,["83"] = 108,["84"] = 108,["85"] = 109,["86"] = 110,["87"] = 108,["88"] = 108,["89"] = 113,["90"] = 113,["91"] = 113,["92"] = 114,["93"] = 115,["94"] = 113,["95"] = 113,["96"] = 122,["97"] = 122,["98"] = 122,["99"] = 123,["100"] = 122,["101"] = 122,["103"] = 6,["104"] = 7,["105"] = 9,["106"] = 18,["107"] = 28,["108"] = 36,["109"] = 44,["110"] = 45});
local ____exports = {}
local precacheEveryResourceInKV, precacheResource, precacheResString, precacheUnits, precacheItems, precacheEverythingFromTable, precacheHeroAbilities
local ____precache_2Ddata = require("utils.precache-data")
local abilityModelNameList = ____precache_2Ddata.abilityModelNameList
local heroNameListParticles = ____precache_2Ddata.heroNameListParticles
local heroNameListSound = ____precache_2Ddata.heroNameListSound
function precacheEveryResourceInKV(kvFileList, context)
    __TS__ArrayForEach(
        kvFileList,
        function(____, file)
            local kvTable = LoadKeyValues(file)
            if kvTable then
                precacheEverythingFromTable(kvTable, context)
            else
                print("[Precache] Error: Failed to load KV file: " .. file)
            end
        end
    )
end
function precacheResource(resourceList, context)
    __TS__ArrayForEach(
        resourceList,
        function(____, resource)
            precacheResString(resource, context)
        end
    )
end
function precacheResString(res, context)
    if __TS__StringEndsWith(res, ".vpcf") then
        PrecacheResource("particle", res, context)
    elseif __TS__StringEndsWith(res, ".vsndevts") then
        PrecacheResource("soundfile", res, context)
    elseif __TS__StringEndsWith(res, ".vmdl") then
        PrecacheResource("model", res, context)
    end
end
function precacheUnits(unitNamesList, context)
    if context ~= nil then
        __TS__ArrayForEach(
            unitNamesList,
            function(____, unitName)
                PrecacheUnitByNameSync(unitName, context)
            end
        )
    else
        __TS__ArrayForEach(
            unitNamesList,
            function(____, unitName)
                PrecacheUnitByNameAsync(
                    unitName,
                    function()
                    end
                )
            end
        )
    end
end
function precacheItems(itemList, context)
    __TS__ArrayForEach(
        itemList,
        function(____, itemName)
            PrecacheItemByNameSync(itemName, context)
        end
    )
end
function precacheEverythingFromTable(kvTable, context)
    for k, v in pairs(kvTable) do
        if type(v) == "table" then
            precacheEverythingFromTable(v, context)
        elseif type(v) == "string" then
            precacheResString(v, context)
        end
    end
end
function precacheHeroAbilities(context)
    __TS__ArrayForEach(
        heroNameListParticles,
        function(____, heroName)
            local hero = __TS__StringReplace(heroName, "npc_dota_", "")
            PrecacheResource("particle_folder", "particles/units/heroes/" .. hero, context)
        end
    )
    __TS__ArrayForEach(
        heroNameListSound,
        function(____, heroName)
            local hero = __TS__StringReplace(heroName, "npc_dota_hero_", "")
            PrecacheResource("soundfile", ("soundevents/game_sounds_heroes/game_sounds_" .. hero) .. ".vsndevts", context)
        end
    )
    __TS__ArrayForEach(
        abilityModelNameList,
        function(____, modelName)
            PrecacheResource("model", modelName, context)
        end
    )
end
function ____exports.default(context)
    print("[Precache] Start precache...")
    precacheResource({}, context)
    precacheEveryResourceInKV({"scripts/npc/npc_items_custom.txt", "scripts/npc/npc_abilities_custom.txt", "scripts/npc/npc_abilities_custom_lottery.txt"}, context)
    precacheUnits({}, context)
    precacheItems({}, context)
    precacheHeroAbilities(context)
    print("[Precache] Precache finished.")
end
return ____exports
