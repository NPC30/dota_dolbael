local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ArrayAt = ____lualib.__TS__ArrayAt
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/ability-replace/ability-replace.test.lua"
__TS__SourceMapTraceBack("modules/lottery/ability-replace/ability-replace.test.lua", {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 5,["14"] = 5,["15"] = 5,["16"] = 5,["17"] = 12,["18"] = 12,["19"] = 12,["20"] = 13,["21"] = 13,["22"] = 12,["23"] = 12,["24"] = 19,["25"] = 19,["26"] = 19,["27"] = 20,["28"] = 20,["29"] = 19,["30"] = 19,["31"] = 26,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 32,["36"] = 32,["37"] = 32,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 32,["45"] = 32,["46"] = 103,["47"] = 103,["48"] = 103,["49"] = 103,["50"] = 104,["51"] = 105,["52"] = 106,["53"] = 107,["54"] = 108,["55"] = 109,["56"] = 110,["57"] = 112,["58"] = 112,["59"] = 112,["60"] = 113,["61"] = 114,["62"] = 127,["63"] = 127,["64"] = 127,["65"] = 127,["66"] = 127,["67"] = 127,["68"] = 127,["69"] = 127,["70"] = 136,["71"] = 136,["72"] = 136,["73"] = 136,["74"] = 136,["75"] = 136,["76"] = 136,["77"] = 136,["78"] = 136,["79"] = 136,["80"] = 136,["81"] = 136,["82"] = 136,["83"] = 136,["84"] = 150,["85"] = 152,["86"] = 152,["87"] = 152,["88"] = 152,["89"] = 157,["90"] = 157,["91"] = 157,["92"] = 157,["93"] = 161,["94"] = 162,["95"] = 163,["96"] = 163,["97"] = 163,["98"] = 163,["99"] = 163,["100"] = 172,["101"] = 174,["102"] = 175,["103"] = 175,["104"] = 175,["105"] = 175,["106"] = 175,["107"] = 175,["108"] = 181,["109"] = 183,["110"] = 184,["111"] = 188,["112"] = 189,["113"] = 189,["114"] = 188,["115"] = 191,["116"] = 112,["117"] = 112,["118"] = 194,["119"] = 194,["120"] = 194,["121"] = 195,["122"] = 194,["123"] = 194,["124"] = 198,["125"] = 198,["126"] = 198,["127"] = 198,["128"] = 199,["129"] = 199,["130"] = 199,["131"] = 199,["132"] = 201,["133"] = 202,["134"] = 203,["135"] = 204,["136"] = 206,["137"] = 208,["139"] = 208,["141"] = 208,["143"] = 209,["144"] = 209,["146"] = 209,["148"] = 210,["149"] = 210,["151"] = 210,["153"] = 211,["154"] = 211,["156"] = 211,["157"] = 198,["158"] = 198,["159"] = 214,["160"] = 214,["161"] = 214,["162"] = 214,["163"] = 215,["164"] = 215,["165"] = 215,["166"] = 215,["167"] = 217,["168"] = 218,["169"] = 219,["170"] = 221,["171"] = 222,["172"] = 223,["173"] = 224,["174"] = 214,["175"] = 214,["176"] = 227,["177"] = 227,["178"] = 227,["179"] = 227,["180"] = 228,["181"] = 234,["182"] = 234,["183"] = 234,["184"] = 234,["185"] = 236,["186"] = 237,["187"] = 227,["188"] = 227,["189"] = 242,["190"] = 242,["191"] = 242,["192"] = 242,["193"] = 243,["194"] = 243,["195"] = 243,["196"] = 243,["197"] = 243,["198"] = 243,["199"] = 243,["200"] = 250,["201"] = 252,["202"] = 252,["203"] = 252,["204"] = 252,["205"] = 254,["206"] = 256,["207"] = 257,["208"] = 261,["209"] = 262,["210"] = 263,["211"] = 264,["213"] = 264,["215"] = 264,["217"] = 265,["218"] = 265,["220"] = 265,["221"] = 242,["222"] = 242,["223"] = 268,["224"] = 268,["225"] = 268,["226"] = 268,["227"] = 269,["228"] = 270,["229"] = 270,["230"] = 270,["231"] = 270,["232"] = 270,["233"] = 270,["234"] = 270,["235"] = 270,["236"] = 278,["237"] = 278,["238"] = 278,["239"] = 278,["240"] = 278,["241"] = 278,["242"] = 278,["243"] = 278,["244"] = 278,["245"] = 278,["246"] = 278,["247"] = 278,["248"] = 290,["249"] = 290,["250"] = 290,["251"] = 290,["252"] = 295,["253"] = 301,["254"] = 301,["255"] = 301,["256"] = 301,["257"] = 305,["258"] = 307,["259"] = 308,["260"] = 312,["261"] = 313,["262"] = 314,["263"] = 315,["264"] = 315,["265"] = 268,["266"] = 268,["267"] = 103,["268"] = 103});
local ____exports = {}
local ____ability_2Dreplace_2Dhelper = require("modules.lottery.ability-replace.ability-replace-helper")
local AbilityReplaceHelper = ____ability_2Dreplace_2Dhelper.AbilityReplaceHelper
local ____lottery_2Dhelper = require("modules.lottery.lottery-helper")
local LotteryHelper = ____lottery_2Dhelper.LotteryHelper
local ____net_2Dtable_2Dhelper = require("modules.helper.net-table-helper")
local NetTableHelper = ____net_2Dtable_2Dhelper.NetTableHelper
jest:mock(
    "../../../api/player",
    function() return {MemberLevel = {NORMAL = 1, PREMIUM = 2}} end
)
jest:mock(
    "../../helper/net-table-helper",
    function() return {NetTableHelper = {
        GetMember = jest:fn():mockReturnValue({enable = false, level = 1}),
        GetLotteryStatus = jest:fn():mockReturnValue({})
    }} end
)
jest:mock(
    "../../helper/player-helper",
    function() return {PlayerHelper = {
        IsHumanPlayer = jest:fn():mockReturnValue(true),
        ForEachPlayer = jest:fn()
    }} end
)
jest:mock(
    "../lottery-helper",
    function() return {LotteryHelper = {getRandomAbilities = jest:fn()}} end
)
jest:mock(
    "./ability-replace-helper",
    function() return {AbilityReplaceHelper = {
        getRemovableAbilities = jest:fn(),
        isEligibleAbility = jest:fn():mockReturnValue(true),
        GetInnateKVValue = jest:fn():mockReturnValue(nil),
        IsInnateKVValue = jest:fn():mockReturnValue(false),
        replaceLotteryStatusAbility = jest:fn():mockReturnValue(false),
        cleanupRemovedAbilityModifiers = jest:fn()
    }} end
)
describe(
    nil,
    "AbilityReplace",
    function()
        local playerId = 0
        local AbilityReplaceClass
        local abilityReplace
        local mockHero
        local mockAbility
        local mockCustomNetTables
        local mockPlayer
        beforeEach(
            nil,
            function()
                NetTableHelper.GetLotteryStatus:mockReturnValue({})
                local removableAbilities = {{name = "old_ability", level = 1, type = "abilityActive"}, {name = "other_ability", level = 1, type = "abilityActive"}}
                mockAbility = {
                    GetAbilityName = jest:fn():mockReturnValue("old_ability"),
                    GetLevel = jest:fn():mockReturnValue(1),
                    GetBehavior = jest:fn():mockReturnValue(0),
                    IsHidden = jest:fn():mockReturnValue(false),
                    IsItem = jest:fn():mockReturnValue(false),
                    SetLevel = jest:fn()
                }
                mockHero = {
                    GetAbilityCount = jest:fn():mockReturnValue(1),
                    GetAbilityByIndex = jest:fn():mockReturnValue(mockAbility),
                    FindAbilityByName = jest:fn():mockReturnValue(mockAbility),
                    GetAbilityPoints = jest:fn():mockReturnValue(2),
                    SetAbilityPoints = jest:fn(),
                    GetTeamNumber = jest:fn():mockReturnValue(2),
                    GetPlayerOwnerID = jest:fn():mockReturnValue(playerId),
                    RemoveAbility = jest:fn(),
                    AddAbility = jest:fn():mockReturnValue(mockAbility),
                    IsRealHero = jest:fn():mockReturnValue(true),
                    IsNull = jest:fn():mockReturnValue(false),
                    HasModifier = jest:fn():mockReturnValue(false)
                }
                mockPlayer = {}
                mockCustomNetTables = {
                    SetTableValue = jest:fn(),
                    GetTableValue = jest:fn()
                }
                global.CustomGameEventManager = {
                    RegisterListener = jest:fn(),
                    Send_ServerToPlayer = jest:fn()
                }
                global._G = {}
                _G._G = global._G
                global.GameRules = {
                    Lottery = {getMaxRefreshCount = jest:fn():mockReturnValue(1)},
                    Option = {abyssMode = false},
                    SendCustomMessage = jest:fn()
                }
                _G.GameRules = global.GameRules
                global.CustomNetTables = mockCustomNetTables
                global.PlayerResource = {
                    GetSelectedHeroEntity = jest:fn():mockReturnValue(mockHero),
                    GetSteamAccountID = jest:fn():mockReturnValue(123),
                    GetPlayerName = jest:fn():mockReturnValue("Target Player"),
                    GetPlayer = jest:fn():mockReturnValue(mockPlayer)
                }
                global.EntIndexToHScript = jest:fn()
                AbilityReplaceHelper.getRemovableAbilities:mockReturnValue(removableAbilities)
                LotteryHelper.getRandomAbilities:mockReturnValueOnce({{name = "new_ability", level = 1}}):mockReturnValue({{name = "another_ability", level = 1}})
                jest:isolateModules(function()
                    local ____require_result_0 = require("modules.lottery.ability-replace.ability-replace")
                    AbilityReplaceClass = ____require_result_0.AbilityReplace
                end)
                abilityReplace = __TS__New(AbilityReplaceClass)
            end
        )
        afterEach(
            nil,
            function()
                jest:clearAllMocks()
            end
        )
        it(
            nil,
            "keeps refresh exhausted after reselecting removed ability",
            function()
                expect(
                    nil,
                    abilityReplace:InitAbilityReplace(playerId)
                ):toBe(true)
                local pending = abilityReplace.pendingByPlayer[tostring(playerId)]
                pending.currentRefreshCount = 1
                pending.maxRefreshCount = 1
                pending.isRefreshed = true
                abilityReplace:selectRemovedAbility(playerId, "old_ability")
                local ____opt_1 = __TS__ArrayAt(mockCustomNetTables.SetTableValue.mock.calls, -1)
                if ____opt_1 ~= nil then
                    ____opt_1 = ____opt_1[2]
                end
                local lastPublish = ____opt_1
                local ____opt_result_5
                if lastPublish ~= nil then
                    ____opt_result_5 = lastPublish.currentRefreshCount
                end
                expect(nil, ____opt_result_5):toBe(1)
                local ____opt_result_8
                if lastPublish ~= nil then
                    ____opt_result_8 = lastPublish.maxRefreshCount
                end
                expect(nil, ____opt_result_8):toBe(1)
                local ____opt_result_11
                if lastPublish ~= nil then
                    ____opt_result_11 = lastPublish.isRefreshed
                end
                expect(nil, ____opt_result_11):toBe(true)
            end
        )
        it(
            nil,
            "locks removed ability selection after first pick",
            function()
                expect(
                    nil,
                    abilityReplace:InitAbilityReplace(playerId)
                ):toBe(true)
                abilityReplace:selectRemovedAbility(playerId, "old_ability")
                abilityReplace:selectRemovedAbility(playerId, "old_ability")
                abilityReplace:selectRemovedAbility(playerId, "other_ability")
                local pending = abilityReplace.pendingByPlayer[tostring(playerId)]
                expect(nil, pending.selectedRemovedAbilityName):toBe("old_ability")
                expect(nil, pending.candidates):toEqual({{name = "new_ability", level = 1}})
                expect(nil, LotteryHelper.getRandomAbilities):toHaveBeenCalledTimes(1)
            end
        )
        it(
            nil,
            "excludes only abilities belonging to the current player awakening bundle",
            function()
                NetTableHelper.GetLotteryStatus:mockReturnValue({activeAbilityBundle = {grantedAbilities = {{abilityName = "old_ability"}}}})
                expect(
                    nil,
                    abilityReplace:InitAbilityReplace(playerId)
                ):toBe(true)
                local pending = abilityReplace.pendingByPlayer[tostring(playerId)]
                expect(nil, pending.removableAbilities):toEqual({{name = "other_ability", level = 1, type = "abilityActive"}})
            end
        )
        it(
            nil,
            "resets selected ability level to zero and refunds points in skill reset mode",
            function()
                local mockItem = {
                    IsNull = jest:fn():mockReturnValue(false),
                    GetAbilityName = jest:fn():mockReturnValue("item_skill_reset"),
                    SpendCharge = jest:fn(),
                    GetCurrentCharges = jest:fn():mockReturnValue(0),
                    RemoveSelf = jest:fn()
                }
                global.EntIndexToHScript = jest:fn():mockReturnValue(mockItem)
                expect(
                    nil,
                    abilityReplace:InitSkillReset(playerId, 321)
                ):toBe(true)
                abilityReplace:selectRemovedAbility(playerId, "old_ability")
                expect(nil, mockAbility.SetLevel):toHaveBeenCalledWith(0)
                expect(nil, AbilityReplaceHelper.cleanupRemovedAbilityModifiers):toHaveBeenCalledWith(mockHero, "old_ability")
                expect(nil, mockHero.SetAbilityPoints):toHaveBeenCalledWith(3)
                expect(nil, mockItem.SpendCharge):toHaveBeenCalledWith(1)
                expect(nil, mockItem.RemoveSelf):toHaveBeenCalled()
                local ____opt_12 = __TS__ArrayAt(mockCustomNetTables.SetTableValue.mock.calls, -1)
                if ____opt_12 ~= nil then
                    ____opt_12 = ____opt_12[2]
                end
                local lastPublish = ____opt_12
                local ____opt_result_16
                if lastPublish ~= nil then
                    ____opt_result_16 = lastPublish.mode
                end
                expect(nil, ____opt_result_16):toBe("replace")
            end
        )
        it(
            nil,
            "transfers selected ability to target hero and removes the item",
            function()
                local targetPlayerId = 1
                local transferredAbility = {
                    GetAbilityName = jest:fn():mockReturnValue("old_ability"),
                    GetLevel = jest:fn():mockReturnValue(1),
                    GetBehavior = jest:fn():mockReturnValue(0),
                    IsHidden = jest:fn():mockReturnValue(false),
                    IsItem = jest:fn():mockReturnValue(false),
                    SetLevel = jest:fn()
                }
                local targetHero = {
                    GetAbilityCount = jest:fn():mockReturnValue(0),
                    GetAbilityByIndex = jest:fn(),
                    FindAbilityByName = jest:fn():mockReturnValue(nil),
                    GetAbilityPoints = jest:fn():mockReturnValue(0),
                    SetAbilityPoints = jest:fn(),
                    GetTeamNumber = jest:fn():mockReturnValue(2),
                    GetPlayerOwnerID = jest:fn():mockReturnValue(targetPlayerId),
                    AddAbility = jest:fn():mockReturnValue(transferredAbility),
                    IsRealHero = jest:fn():mockReturnValue(true),
                    IsNull = jest:fn():mockReturnValue(false)
                }
                local mockItem = {
                    IsNull = jest:fn():mockReturnValue(false),
                    RemoveSelf = jest:fn()
                }
                global.EntIndexToHScript = jest:fn():mockReturnValueOnce(targetHero):mockReturnValueOnce(targetHero):mockReturnValueOnce(mockItem)
                expect(
                    nil,
                    abilityReplace:InitSkillTransfer(playerId, 888, 321)
                ):toBe(true)
                abilityReplace:selectRemovedAbility(playerId, "old_ability")
                expect(nil, mockHero.RemoveAbility):toHaveBeenCalledWith("old_ability")
                expect(nil, AbilityReplaceHelper.cleanupRemovedAbilityModifiers):toHaveBeenCalledWith(mockHero, "old_ability")
                expect(nil, targetHero.AddAbility):toHaveBeenCalledWith("old_ability")
                expect(nil, transferredAbility.SetLevel):toHaveBeenCalledWith(1)
                expect(nil, mockItem.RemoveSelf):toHaveBeenCalled()
                local ____opt_17 = global.CustomGameEventManager
                expect(nil, ____opt_17 and ____opt_17.Send_ServerToPlayer):toHaveBeenCalled()
            end
        )
    end
)
return ____exports
