local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ObjectFromEntries = ____lualib.__TS__ObjectFromEntries
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/player-rebirth.test.lua"
__TS__SourceMapTraceBack("api/player-rebirth.test.lua", {["8"] = 27,["9"] = 27,["10"] = 28,["11"] = 28,["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 2,["16"] = 2,["17"] = 1,["18"] = 1,["19"] = 8,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 8,["25"] = 8,["26"] = 15,["27"] = 15,["28"] = 15,["29"] = 16,["30"] = 16,["31"] = 16,["32"] = 15,["33"] = 15,["34"] = 15,["35"] = 15,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 24,["41"] = 24,["42"] = 24,["43"] = 24,["44"] = 25,["45"] = 25,["46"] = 25,["47"] = 25,["48"] = 30,["49"] = 30,["50"] = 30,["51"] = 30,["52"] = 31,["53"] = 31,["54"] = 31,["55"] = 31,["56"] = 36,["57"] = 38,["58"] = 38,["59"] = 38,["60"] = 39,["61"] = 40,["62"] = 40,["63"] = 40,["64"] = 40,["65"] = 42,["66"] = 42,["67"] = 42,["68"] = 40,["69"] = 40,["70"] = 40,["71"] = 47,["72"] = 38,["73"] = 38,["74"] = 50,["75"] = 51,["76"] = 52,["77"] = 50,["78"] = 55,["79"] = 56,["80"] = 56,["81"] = 56,["82"] = 56,["83"] = 57,["84"] = 57,["86"] = 58,["87"] = 55,["88"] = 61,["89"] = 62,["90"] = 65,["91"] = 61,["92"] = 68,["93"] = 68,["94"] = 68,["95"] = 68,["96"] = 69,["97"] = 77,["98"] = 78,["99"] = 68,["100"] = 68,["101"] = 81,["102"] = 81,["103"] = 81,["104"] = 84,["105"] = 85,["106"] = 93,["107"] = 81,["108"] = 81,["109"] = 96,["110"] = 96,["111"] = 96,["112"] = 99,["113"] = 100,["114"] = 100,["115"] = 100,["116"] = 100,["117"] = 100,["118"] = 100,["119"] = 100,["120"] = 107,["121"] = 107,["122"] = 107,["123"] = 108,["124"] = 108,["125"] = 108,["126"] = 107,["127"] = 109,["128"] = 109,["129"] = 111,["130"] = 111,["131"] = 111,["132"] = 109,["133"] = 107,["134"] = 107,["135"] = 107,["136"] = 115,["137"] = 115,["139"] = 96,["140"] = 96,["141"] = 118,["142"] = 118,["143"] = 118,["144"] = 118,["145"] = 119,["146"] = 132,["147"] = 133,["148"] = 134,["149"] = 135,["150"] = 118,["151"] = 118,["152"] = 138,["153"] = 138,["154"] = 138,["155"] = 138,["156"] = 139,["157"] = 149,["158"] = 138,["159"] = 138,["160"] = 152,["161"] = 152,["162"] = 152,["163"] = 152,["164"] = 153,["165"] = 157,["166"] = 152,["167"] = 152,["168"] = 160,["169"] = 160,["170"] = 160,["171"] = 160,["172"] = 161,["173"] = 170,["174"] = 170,["175"] = 170,["176"] = 170,["177"] = 170,["178"] = 160,["179"] = 160,["180"] = 177,["181"] = 177,["182"] = 177,["183"] = 177,["184"] = 178,["185"] = 183,["186"] = 177,["187"] = 177,["188"] = 186,["189"] = 186,["190"] = 186,["191"] = 186,["192"] = 187,["193"] = 192,["194"] = 186,["195"] = 186,["196"] = 195,["197"] = 195,["198"] = 195,["199"] = 195,["200"] = 196,["201"] = 200,["202"] = 200,["203"] = 200,["204"] = 200,["205"] = 201,["206"] = 201,["207"] = 201,["208"] = 201,["209"] = 195,["210"] = 195,["211"] = 204,["212"] = 204,["213"] = 204,["214"] = 204,["215"] = 205,["216"] = 210,["217"] = 204,["218"] = 204,["219"] = 213,["220"] = 213,["221"] = 213,["222"] = 213,["223"] = 214,["224"] = 227,["225"] = 230,["226"] = 233,["227"] = 233,["228"] = 236,["229"] = 236,["230"] = 236,["231"] = 238,["232"] = 239,["233"] = 240,["234"] = 240,["235"] = 213,["236"] = 213,["237"] = 30,["238"] = 30});
local ____exports = {}
local ____property_controller = require("modules.property.property_controller")
local PropertyController = ____property_controller.PropertyController
local ____player = require("api.player")
local Player = ____player.Player
jest:mock(
    "../modules/property/property_controller",
    function() return {PropertyController = {
        LevelupHeroProperty = jest:fn(),
        RemoveAllPlayerProperty = jest:fn()
    }} end
)
jest:mock(
    "../modules/helper/player-helper",
    function() return {PlayerHelper = {
        FindHeroBySteeamAccountId = jest:fn(),
        ForEachPlayer = jest:fn()
    }} end
)
jest:mock(
    "./api-client",
    function() return {
        ApiClient = {
            DebugLog = jest:fn(),
            sendToBackupHost = jest:fn()
        },
        HttpMethod = {}
    } end
)
jest:mock(
    "./player-language",
    function() return {PlayerLanguage = {}} end
)
jest:mock(
    "./player-task",
    function() return {PlayerTask = {LoadPlayerTasksOnce = jest:fn()}} end
)
jest:mock(
    "./showcase",
    function() return {Showcase = {LoadShowcaseOnce = jest:fn()}} end
)
describe(
    nil,
    "Player rebirth properties",
    function()
        local hero = {
            GetPlayerOwnerID = function() return 0 end,
            GetUnitName = function() return "npc_dota_hero_axe" end
        }
        local levelupMock = PropertyController.LevelupHeroProperty
        beforeEach(
            nil,
            function()
                jest:clearAllMocks()
                __TS__ObjectAssign(
                    _G,
                    {
                        PlayerResource = {GetSteamAccountID = function() return 123 end},
                        CustomNetTables = {
                            GetTableValue = jest:fn(),
                            SetTableValue = jest:fn()
                        }
                    }
                )
                Player.playerList = {}
            end
        )
        local function applyPlayer(self, player)
            Player.playerList = {__TS__ObjectAssign({id = "123", properties = {}}, player)}
            Player:SetPlayerProperty(hero)
        end
        local function expectApplied(self, name, level, forceEnable)
            local expectedArgs = {
                hero,
                expect:objectContaining({name = name, level = level})
            }
            if forceEnable ~= nil then
                expectedArgs[#expectedArgs + 1] = forceEnable
            end
            expect(nil, levelupMock):toHaveBeenCalledWith(unpack(expectedArgs))
        end
        local function upsertPlayer(self, player)
            local playerClass = Player
            playerClass:UpsertPlayerData(__TS__ObjectAssign({id = "123", properties = {}}, player))
        end
        it(
            nil,
            "applies backend effective levels when reset leaves no raw property rows",
            function()
                applyPlayer(nil, {propertyRawLevels = {}, rebirth = {count = 2, propertyEffectiveLevels = {property_cooldown_percentage = 2}}})
                expect(nil, PropertyController.RemoveAllPlayerProperty):toHaveBeenCalledWith(123)
                expectApplied(nil, "property_cooldown_percentage", 2)
            end
        )
        test:each({{1, 3}, {8, 10}})(
            nil,
            "uses raw cooldown %i and authoritative effective level %i",
            function(____, rawLevel, effectiveLevel)
                applyPlayer(nil, {propertyRawLevels = {{steamId = 123, name = "property_cooldown_percentage", level = rawLevel}}, rebirth = {count = 2, propertyEffectiveLevels = {property_cooldown_percentage = effectiveLevel}}})
                expectApplied(nil, "property_cooldown_percentage", effectiveLevel)
            end
        )
        test:each({{2, 10}, {3, 11}})(
            nil,
            "keeps common level-8 properties effective after rebirth %i",
            function(____, count, effectiveLevel)
                local names = {
                    "property_cooldown_percentage",
                    "property_movespeed_bonus_constant",
                    "property_stats_strength_bonus",
                    "property_stats_agility_bonus",
                    "property_stats_intellect_bonus"
                }
                applyPlayer(
                    nil,
                    {
                        propertyRawLevels = __TS__ArrayMap(
                            names,
                            function(____, name) return {steamId = 123, name = name, level = 8} end
                        ),
                        rebirth = {
                            count = count,
                            propertyEffectiveLevels = __TS__ObjectFromEntries(__TS__ArrayMap(
                                names,
                                function(____, name) return {name, effectiveLevel} end
                            ))
                        }
                    }
                )
                for ____, name in ipairs(names) do
                    expectApplied(nil, name, effectiveLevel)
                end
            end
        )
        it(
            nil,
            "grants all direct abilities after refunded raw levels become zero",
            function()
                applyPlayer(nil, {propertyRawLevels = {}, rebirth = {count = 3, abilities = {moveSpeedLimitBreak = true, enemyCounter = true, flying = true, extraSlot = true}}})
                expectApplied(nil, "property_ignore_movespeed_limit", 1, true)
                expectApplied(nil, "property_cannot_miss", 8, true)
                expectApplied(nil, "property_flying", 8, true)
                expectApplied(nil, "property_can_use_backpack_items", 16, true)
            end
        )
        it(
            nil,
            "uses effective level 16 for a legacy extra slot when its ability field is absent",
            function()
                applyPlayer(nil, {propertyRawLevels = {}, rebirth = {count = 3, abilities = {flying = true}, singleAttributeEffectiveMax = 11, propertyEffectiveLevels = {property_can_use_backpack_items = 16}}})
                expectApplied(nil, "property_can_use_backpack_items", 16, true)
            end
        )
        it(
            nil,
            "keeps a manually assigned 16-point extra slot without rebirth fields",
            function()
                applyPlayer(nil, {properties = {{steamId = 123, name = "property_can_use_backpack_items", level = 16}}})
                expectApplied(nil, "property_can_use_backpack_items", 16, true)
            end
        )
        it(
            nil,
            "treats explicit false ability fields as authoritative",
            function()
                applyPlayer(nil, {propertyRawLevels = {{steamId = 123, name = "property_can_use_backpack_items", level = 16}}, rebirth = {count = 3, abilities = {extraSlot = false}, propertyEffectiveLevels = {property_can_use_backpack_items = 16}}})
                expect(nil, levelupMock)["not"]:toHaveBeenCalledWith(
                    hero,
                    expect:objectContaining({name = "property_can_use_backpack_items"}),
                    expect:anything()
                )
            end
        )
        it(
            nil,
            "ignores direct rebirth switches at count zero but keeps legacy manual activation",
            function()
                applyPlayer(nil, {properties = {{steamId = 123, name = "property_can_use_backpack_items", level = 16}}, rebirth = {count = 0, abilities = {extraSlot = true}}})
                expectApplied(nil, "property_can_use_backpack_items", 16, true)
            end
        )
        it(
            nil,
            "does not grant a direct ability from an invalid count-zero response",
            function()
                applyPlayer(nil, {propertyRawLevels = {}, rebirth = {count = 0, abilities = {extraSlot = true}}})
                expect(nil, levelupMock)["not"]:toHaveBeenCalled()
            end
        )
        it(
            nil,
            "returns the normalized rebirth count for newbie buff selection",
            function()
                Player.playerList = {{id = "123", properties = {}, rebirth = {count = 9}}}
                expect(
                    nil,
                    Player:GetRebirthCount(123)
                ):toBe(3)
                expect(
                    nil,
                    Player:GetRebirthCount(456)
                ):toBe(0)
            end
        )
        it(
            nil,
            "keeps the old properties plus base-bonus fallback when new fields are absent",
            function()
                applyPlayer(nil, {properties = {{steamId = 123, name = "property_attack_damage_pct", level = 8}}, rebirth = {count = 2}})
                expectApplied(nil, "property_attack_damage_pct", 10)
            end
        )
        it(
            nil,
            "refreshes raw and effective levels when an old property endpoint omits new fields",
            function()
                Player.playerList = {{id = "123", properties = {}, propertyRawLevels = {{steamId = 123, name = "property_cooldown_percentage", level = 8}}, rebirth = {count = 2, abilities = {flying = true}, propertyEffectiveLevels = {property_cooldown_percentage = 10}}}}
                upsertPlayer(nil, {properties = {{steamId = 123, name = "property_cooldown_percentage", level = 1}}})
                expect(nil, Player.playerList[1].propertyRawLevels):toEqual({{steamId = 123, name = "property_cooldown_percentage", level = 1}})
                local ____opt_0 = Player.playerList[1].rebirth
                expect(nil, ____opt_0 and ____opt_0.propertyEffectiveLevels):toEqual({property_cooldown_percentage = 3})
                local ____opt_4 = Player.playerList[1].rebirth
                local ____opt_2 = ____opt_4 and ____opt_4.abilities
                expect(nil, ____opt_2 and ____opt_2.flying):toBe(true)
                upsertPlayer(nil, {properties = {}})
                expect(nil, Player.playerList[1].propertyRawLevels):toEqual({})
                local ____opt_6 = Player.playerList[1].rebirth
                expect(nil, ____opt_6 and ____opt_6.propertyEffectiveLevels):toEqual({property_cooldown_percentage = 2})
            end
        )
    end
)
return ____exports
