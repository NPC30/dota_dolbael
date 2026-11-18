local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/item/item-lottery.test.lua"
__TS__SourceMapTraceBack("modules/lottery/item/item-lottery.test.lua", {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 6,["16"] = 6,["17"] = 6,["18"] = 6,["19"] = 6,["20"] = 6,["21"] = 6,["22"] = 15,["23"] = 15,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 15,["28"] = 15,["29"] = 25,["30"] = 25,["31"] = 25,["32"] = 25,["33"] = 31,["34"] = 31,["35"] = 31,["36"] = 31,["37"] = 31,["38"] = 31,["39"] = 31,["40"] = 40,["41"] = 40,["42"] = 40,["43"] = 40,["44"] = 75,["45"] = 75,["46"] = 75,["47"] = 75,["48"] = 76,["49"] = 77,["50"] = 78,["51"] = 79,["52"] = 81,["53"] = 81,["54"] = 81,["55"] = 82,["56"] = 82,["57"] = 82,["58"] = 82,["59"] = 82,["60"] = 82,["61"] = 82,["62"] = 90,["63"] = 90,["64"] = 90,["65"] = 90,["66"] = 95,["67"] = 98,["68"] = 99,["69"] = 99,["70"] = 99,["71"] = 99,["72"] = 103,["73"] = 103,["74"] = 103,["75"] = 103,["76"] = 103,["77"] = 103,["78"] = 103,["79"] = 103,["80"] = 111,["81"] = 112,["82"] = 113,["83"] = 114,["84"] = 118,["85"] = 81,["86"] = 81,["87"] = 121,["88"] = 121,["89"] = 121,["90"] = 122,["91"] = 121,["92"] = 121,["93"] = 125,["94"] = 125,["95"] = 125,["96"] = 125,["97"] = 126,["98"] = 127,["99"] = 133,["100"] = 138,["101"] = 144,["102"] = 125,["103"] = 125,["104"] = 147,["105"] = 147,["106"] = 147,["107"] = 147,["108"] = 148,["109"] = 150,["110"] = 156,["111"] = 147,["112"] = 147,["113"] = 159,["114"] = 159,["115"] = 159,["116"] = 159,["117"] = 160,["118"] = 160,["119"] = 160,["120"] = 160,["121"] = 160,["122"] = 160,["123"] = 160,["124"] = 160,["125"] = 160,["126"] = 160,["127"] = 173,["128"] = 174,["129"] = 178,["130"] = 179,["131"] = 185,["132"] = 159,["133"] = 159,["134"] = 191,["135"] = 191,["136"] = 191,["137"] = 191,["138"] = 192,["139"] = 193,["140"] = 200,["141"] = 205,["142"] = 206,["143"] = 207,["144"] = 209,["145"] = 209,["146"] = 209,["147"] = 209,["148"] = 209,["149"] = 219,["150"] = 220,["151"] = 191,["152"] = 191,["153"] = 75,["154"] = 75});
local ____exports = {}
local ____item_2Dlottery = require("modules.lottery.item.item-lottery")
local ItemLottery = ____item_2Dlottery.ItemLottery
local ____item_2Dlottery_2Dhelper = require("modules.lottery.item.item-lottery-helper")
local ItemLotteryHelper = ____item_2Dlottery_2Dhelper.ItemLotteryHelper
local ItemLotteryPool = ____item_2Dlottery_2Dhelper.ItemLotteryPool
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____api_2Dclient = require("api.api-client")
local ApiClient = ____api_2Dclient.ApiClient
jest:mock(
    "../../../api/api-client",
    function() return {
        ApiClient = {sendWithRetry = jest:fn()},
        HttpMethod = {POST = "POST"}
    } end
)
jest:mock(
    "../../../api/player",
    function() return {
        MemberLevel = {NORMAL = 1, PREMIUM = 2},
        Player = {GetMemberLevel = jest:fn()}
    } end
)
jest:mock(
    "../../helper/player-helper",
    function() return {PlayerHelper = {IsHumanPlayer = jest:fn()}} end
)
jest:mock(
    "./item-lottery-helper",
    function() return {
        ItemLotteryPool = {DEFAULT = "default"},
        ItemLotteryHelper = {getRandomItems = jest:fn()}
    } end
)
jest:mock(
    "../../treasure/treasure-backend",
    function() return {TREASURE_BACKEND_HOST = "https://wx.renoomgai.top/api"} end
)
describe(
    nil,
    "ItemLottery",
    function()
        local playerId = 0
        local itemLottery
        local mockHero
        local mockCustomNetTables
        beforeEach(
            nil,
            function()
                mockHero = {
                    AddItem = jest:fn(),
                    AddNewModifier = jest:fn(),
                    GetItemInSlot = jest:fn():mockReturnValue(nil),
                    GetPlayerOwner = jest:fn():mockReturnValue({}),
                    GetPlayerOwnerID = jest:fn():mockReturnValue(playerId)
                }
                mockCustomNetTables = {
                    GetTableValue = jest:fn(),
                    SetTableValue = jest:fn()
                }
                global.CustomGameEventManager = {RegisterListener = jest:fn()}
                global.CustomNetTables = mockCustomNetTables
                global.PlayerResource = {
                    GetSelectedHeroEntity = jest:fn():mockReturnValue(mockHero),
                    GetSteamAccountID = jest:fn():mockReturnValue(123)
                }
                global.CreateItem = jest:fn():mockReturnValue({
                    name = "item_blink",
                    SetPurchaser = jest:fn(),
                    SetOwner = jest:fn(),
                    IsNull = jest:fn():mockReturnValue(false),
                    GetAbilityName = jest:fn():mockReturnValue("item_blink"),
                    entindex = jest:fn():mockReturnValue(1)
                })
                global._G = {}
                global.print = jest:fn()
                PlayerHelper.IsHumanPlayer:mockReturnValue(true)
                ItemLotteryHelper.getRandomItems:mockReturnValue({{name = "item_blink", level = 1}})
                itemLottery = __TS__New(ItemLottery)
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
            "grants only once when duplicate pick events see stale net table state",
            function()
                itemLottery:onTriggered(mockHero, ItemLotteryPool.DEFAULT)
                mockCustomNetTables.GetTableValue:mockReturnValue({candidates = {{name = "item_blink", level = 1}}, isRefreshed = false, poolType = ItemLotteryPool.DEFAULT})
                itemLottery:pickItem(playerId, {PlayerID = playerId, name = "item_blink", level = 1})
                itemLottery:pickItem(playerId, {PlayerID = playerId, name = "item_blink", level = 1})
                expect(nil, mockHero.AddItem):toHaveBeenCalledTimes(1)
            end
        )
        it(
            nil,
            "does not grant forged items that are not in the server pending candidates",
            function()
                itemLottery:onTriggered(mockHero, ItemLotteryPool.DEFAULT)
                itemLottery:pickItem(playerId, {PlayerID = playerId, name = "item_rapier", level = 1})
                expect(nil, mockHero.AddItem)["not"]:toHaveBeenCalled()
            end
        )
        it(
            nil,
            "initializes skill learning item when granted from item lottery",
            function()
                local skillLearningItem = {
                    SetPurchaser = jest:fn(),
                    SetOwner = jest:fn(),
                    IsNull = jest:fn():mockReturnValue(false),
                    GetAbilityName = jest:fn():mockReturnValue("item_skill_learning"),
                    entindex = jest:fn():mockReturnValue(2),
                    GetStoredAbility = jest:fn(),
                    GetRandomLotteryAbility = jest:fn():mockReturnValue({name = "life_stealer_ghoul_frenzy", level = 1}),
                    SetStoredAbility = jest:fn()
                }
                global.CreateItem = jest:fn():mockReturnValue(skillLearningItem)
                ItemLotteryHelper.getRandomItems:mockReturnValue({{name = "item_skill_learning", level = 3}})
                itemLottery:onTriggered(mockHero, ItemLotteryPool.DEFAULT)
                itemLottery:pickItem(playerId, {PlayerID = playerId, name = "item_skill_learning", level = 3})
                expect(nil, skillLearningItem.SetStoredAbility):toHaveBeenCalledWith({ability_name = "life_stealer_ghoul_frenzy", ability_level = 1})
            end
        )
        it(
            nil,
            "keeps a claimed choice retryable when the local item cannot be created",
            function()
                global.CreateItem = jest:fn():mockReturnValue(nil)
                itemLottery:onTriggeredPrepared(mockHero, {{name = "item_blink", level = 1}}, ItemLotteryPool.DEFAULT, "treasure-1")
                local event = {PlayerID = playerId, name = "item_blink", level = 1}
                itemLottery:pickItem(playerId, event)
                local firstRequest = ApiClient.sendWithRetry.mock.calls[1][0]
                firstRequest:successFunc("{\"code\":200}")
                expect(nil, mockCustomNetTables.SetTableValue):toHaveBeenLastCalledWith(
                    "lottery_item",
                    tostring(playerId),
                    expect:objectContaining({candidates = {{name = "item_blink", level = 1}}, isClaiming = false, openId = "treasure-1"})
                )
                itemLottery:pickItem(playerId, event)
                expect(nil, ApiClient.sendWithRetry):toHaveBeenCalledTimes(2)
            end
        )
    end
)
return ____exports
