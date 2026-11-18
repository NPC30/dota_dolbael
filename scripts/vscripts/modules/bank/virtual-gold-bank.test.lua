local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/bank/virtual-gold-bank.test.lua"
__TS__SourceMapTraceBack("modules/bank/virtual-gold-bank.test.lua", {["6"] = 23,["7"] = 23,["8"] = 24,["9"] = 24,["10"] = 25,["11"] = 25,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 3,["16"] = 3,["17"] = 3,["18"] = 3,["19"] = 3,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 64,["25"] = 64,["26"] = 64,["27"] = 64,["28"] = 65,["29"] = 66,["30"] = 67,["31"] = 68,["32"] = 69,["33"] = 71,["34"] = 72,["35"] = 74,["36"] = 74,["37"] = 74,["38"] = 76,["39"] = 79,["40"] = 79,["41"] = 79,["42"] = 79,["43"] = 79,["44"] = 84,["45"] = 87,["46"] = 87,["47"] = 87,["48"] = 87,["49"] = 87,["50"] = 92,["51"] = 95,["52"] = 98,["53"] = 101,["54"] = 104,["55"] = 107,["56"] = 114,["57"] = 117,["58"] = 122,["59"] = 124,["60"] = 74,["61"] = 74,["62"] = 127,["63"] = 127,["64"] = 127,["65"] = 128,["66"] = 127,["67"] = 127,["68"] = 131,["69"] = 131,["70"] = 131,["71"] = 131,["72"] = 132,["73"] = 132,["74"] = 132,["75"] = 132,["76"] = 133,["77"] = 134,["78"] = 136,["79"] = 137,["80"] = 139,["81"] = 146,["82"] = 147,["83"] = 147,["84"] = 147,["85"] = 147,["86"] = 148,["87"] = 148,["88"] = 148,["89"] = 148,["90"] = 148,["91"] = 132,["92"] = 132,["93"] = 155,["94"] = 155,["95"] = 155,["96"] = 155,["97"] = 156,["98"] = 157,["99"] = 158,["100"] = 160,["101"] = 161,["102"] = 155,["103"] = 155,["104"] = 131,["105"] = 131,["106"] = 169,["107"] = 169,["108"] = 169,["109"] = 169,["110"] = 170,["111"] = 170,["112"] = 170,["113"] = 170,["114"] = 171,["115"] = 172,["116"] = 174,["117"] = 175,["118"] = 177,["119"] = 184,["120"] = 185,["121"] = 185,["122"] = 185,["123"] = 185,["124"] = 186,["125"] = 186,["126"] = 186,["127"] = 186,["128"] = 186,["129"] = 170,["130"] = 170,["131"] = 193,["132"] = 193,["133"] = 193,["134"] = 193,["135"] = 194,["136"] = 195,["137"] = 197,["138"] = 198,["139"] = 200,["140"] = 207,["141"] = 208,["142"] = 208,["143"] = 208,["144"] = 208,["145"] = 209,["146"] = 209,["147"] = 209,["148"] = 209,["149"] = 209,["150"] = 193,["151"] = 193,["152"] = 216,["153"] = 216,["154"] = 216,["155"] = 216,["156"] = 217,["157"] = 218,["158"] = 220,["159"] = 221,["160"] = 223,["161"] = 230,["162"] = 235,["163"] = 235,["164"] = 235,["165"] = 235,["166"] = 236,["167"] = 236,["168"] = 236,["169"] = 236,["170"] = 236,["171"] = 216,["172"] = 216,["173"] = 243,["174"] = 243,["175"] = 243,["176"] = 243,["177"] = 244,["178"] = 245,["179"] = 246,["180"] = 248,["181"] = 249,["182"] = 243,["183"] = 243,["184"] = 169,["185"] = 169,["186"] = 257,["187"] = 257,["188"] = 257,["189"] = 257,["190"] = 258,["191"] = 258,["192"] = 258,["193"] = 258,["194"] = 259,["195"] = 260,["196"] = 262,["197"] = 262,["198"] = 262,["199"] = 262,["200"] = 258,["201"] = 258,["202"] = 265,["203"] = 265,["204"] = 265,["205"] = 265,["206"] = 266,["207"] = 266,["208"] = 266,["209"] = 266,["210"] = 265,["211"] = 265,["212"] = 269,["213"] = 269,["214"] = 269,["215"] = 269,["216"] = 270,["217"] = 271,["218"] = 273,["219"] = 273,["220"] = 273,["221"] = 273,["222"] = 273,["223"] = 269,["224"] = 269,["225"] = 257,["226"] = 257,["227"] = 64,["228"] = 64});
local ____exports = {}
local ____analytics = require("api.analytics.analytics")
local Analytics = ____analytics.Analytics
local ____player = require("api.player")
local MemberLevel = ____player.MemberLevel
local ____virtual_2Dgold_2Dbank = require("modules.bank.virtual-gold-bank")
local VirtualGoldBank = ____virtual_2Dgold_2Dbank.VirtualGoldBank
local mockGetMemberLevel = jest:fn()
jest:mock(
    "../../api/player",
    function() return {
        MemberLevel = {NORMAL = 1, PREMIUM = 2},
        Player = {GetMemberLevel = function(____, steamId) return mockGetMemberLevel(nil, steamId) end}
    } end
)
jest:mock(
    "../../api/analytics/analytics",
    function() return {Analytics = {PLAYER_LANGUAGES = {players = {}, matchId = "", version = ""}}} end
)
describe(
    nil,
    "VirtualGoldBank",
    function()
        local virtualGoldBank
        local mockHero
        local mockPlayerResource
        local mockCustomNetTables
        local mockGameRules
        local PLAYER_ID = 0
        local STEAM_ACCOUNT_ID = 123456
        beforeEach(
            nil,
            function()
                mockGetMemberLevel:mockReturnValue(MemberLevel.PREMIUM)
                mockPlayerResource = {
                    GetSteamAccountID = jest:fn():mockReturnValue(STEAM_ACCOUNT_ID),
                    IsValidPlayerID = jest:fn():mockReturnValue(true),
                    GetSelectedHeroEntity = jest:fn()
                }
                global.PlayerResource = mockPlayerResource
                mockHero = {
                    GetGold = jest:fn():mockReturnValue(0),
                    ModifyGold = jest:fn(),
                    IsAlive = jest:fn():mockReturnValue(true)
                }
                mockPlayerResource.GetSelectedHeroEntity:mockReturnValue(mockHero)
                mockCustomNetTables = {SetTableValue = jest:fn()}
                global.CustomNetTables = mockCustomNetTables
                mockGameRules = {SendCustomMessage = jest:fn()}
                global.GameRules = mockGameRules
                Analytics.PLAYER_LANGUAGES = {players = {}, matchId = "", version = ""}
                global.print = jest:fn()
                global.Timers = {CreateTimer = jest:fn():mockReturnValue(0)}
                global.setmetatable = jest:fn()
                virtualGoldBank = __TS__New(VirtualGoldBank)
            end
        )
        afterEach(
            nil,
            function()
                jest:clearAllMocks()
            end
        )
        describe(
            nil,
            "transferToVirtualBank",
            function()
                it(
                    nil,
                    "should transfer excess gold to virtual bank for premium member",
                    function()
                        local currentGold = 95000
                        local virtualGold = 5000
                        virtualGoldBank:setVirtualGold(PLAYER_ID, virtualGold)
                        mockHero.GetGold:mockReturnValue(currentGold)
                        virtualGoldBank:transferToVirtualBank(PLAYER_ID, mockHero, currentGold, virtualGold)
                        expect(nil, mockHero.ModifyGold):toHaveBeenCalledWith(-15000, false, DOTA_ModifyGold_Unspecified)
                        expect(
                            nil,
                            virtualGoldBank:getVirtualGold(PLAYER_ID)
                        ):toBe(20000)
                        expect(nil, mockCustomNetTables.SetTableValue):toHaveBeenCalledWith(
                            "player_virtual_gold",
                            tostring(PLAYER_ID),
                            {virtual_gold = 20000, transferred_back_total = 0}
                        )
                    end
                )
                it(
                    nil,
                    "should not transfer gold for non-premium member",
                    function()
                        mockGetMemberLevel:mockReturnValue(MemberLevel.NORMAL)
                        local currentGold = 95000
                        local virtualGold = 5000
                        virtualGoldBank:setVirtualGold(PLAYER_ID, virtualGold)
                        mockHero.GetGold:mockReturnValue(currentGold)
                    end
                )
            end
        )
        describe(
            nil,
            "transferFromVirtualBank",
            function()
                it(
                    nil,
                    "should transfer gold from virtual bank to hero for premium member",
                    function()
                        local currentGold = 75000
                        local virtualGold = 20000
                        virtualGoldBank:setVirtualGold(PLAYER_ID, virtualGold)
                        mockHero.GetGold:mockReturnValue(currentGold)
                        virtualGoldBank:transferFromVirtualBank(PLAYER_ID, mockHero, currentGold, virtualGold)
                        expect(nil, mockHero.ModifyGold):toHaveBeenCalledWith(5000, false, DOTA_ModifyGold_Unspecified)
                        expect(
                            nil,
                            virtualGoldBank:getVirtualGold(PLAYER_ID)
                        ):toBe(15000)
                        expect(nil, mockCustomNetTables.SetTableValue):toHaveBeenCalledWith(
                            "player_virtual_gold",
                            tostring(PLAYER_ID),
                            {virtual_gold = 15000, transferred_back_total = 5000}
                        )
                    end
                )
                it(
                    nil,
                    "should transfer only needed amount when virtual gold exceeds needed",
                    function()
                        local currentGold = 70000
                        local virtualGold = 50000
                        virtualGoldBank:setVirtualGold(PLAYER_ID, virtualGold)
                        mockHero.GetGold:mockReturnValue(currentGold)
                        virtualGoldBank:transferFromVirtualBank(PLAYER_ID, mockHero, currentGold, virtualGold)
                        expect(nil, mockHero.ModifyGold):toHaveBeenCalledWith(10000, false, DOTA_ModifyGold_Unspecified)
                        expect(
                            nil,
                            virtualGoldBank:getVirtualGold(PLAYER_ID)
                        ):toBe(40000)
                        expect(nil, mockCustomNetTables.SetTableValue):toHaveBeenCalledWith(
                            "player_virtual_gold",
                            tostring(PLAYER_ID),
                            {virtual_gold = 40000, transferred_back_total = 10000}
                        )
                    end
                )
                it(
                    nil,
                    "should transfer all virtual gold when needed exceeds virtual gold",
                    function()
                        local currentGold = 60000
                        local virtualGold = 5000
                        virtualGoldBank:setVirtualGold(PLAYER_ID, virtualGold)
                        mockHero.GetGold:mockReturnValue(currentGold)
                        virtualGoldBank:transferFromVirtualBank(PLAYER_ID, mockHero, currentGold, virtualGold)
                        expect(nil, mockHero.ModifyGold):toHaveBeenCalledWith(virtualGold, false, DOTA_ModifyGold_Unspecified)
                        expect(
                            nil,
                            virtualGoldBank:getVirtualGold(PLAYER_ID)
                        ):toBe(0)
                        expect(nil, mockCustomNetTables.SetTableValue):toHaveBeenCalledWith(
                            "player_virtual_gold",
                            tostring(PLAYER_ID),
                            {virtual_gold = 0, transferred_back_total = 5000}
                        )
                    end
                )
                it(
                    nil,
                    "should not transfer gold for non-premium member",
                    function()
                        mockGetMemberLevel:mockReturnValue(MemberLevel.NORMAL)
                        local currentGold = 75000
                        local virtualGold = 20000
                        virtualGoldBank:setVirtualGold(PLAYER_ID, virtualGold)
                        mockHero.GetGold:mockReturnValue(currentGold)
                    end
                )
            end
        )
        describe(
            nil,
            "getVirtualGold and setVirtualGold",
            function()
                it(
                    nil,
                    "should get virtual gold for player",
                    function()
                        local amount = 15000
                        virtualGoldBank:setVirtualGold(PLAYER_ID, amount)
                        expect(
                            nil,
                            virtualGoldBank:getVirtualGold(PLAYER_ID)
                        ):toBe(amount)
                    end
                )
                it(
                    nil,
                    "should return 0 for player with no virtual gold",
                    function()
                        expect(
                            nil,
                            virtualGoldBank:getVirtualGold(PLAYER_ID)
                        ):toBe(0)
                    end
                )
                it(
                    nil,
                    "should update UI when setting virtual gold",
                    function()
                        local amount = 20000
                        virtualGoldBank:setVirtualGold(PLAYER_ID, amount)
                        expect(nil, mockCustomNetTables.SetTableValue):toHaveBeenCalledWith(
                            "player_virtual_gold",
                            tostring(PLAYER_ID),
                            {virtual_gold = amount, transferred_back_total = 0}
                        )
                    end
                )
            end
        )
    end
)
return ____exports
