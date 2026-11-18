local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/game-end/game-end-point.test.lua"
__TS__SourceMapTraceBack("modules/event/game-end/game-end-point.test.lua", {["6"] = 3,["7"] = 3,["8"] = 5,["9"] = 6,["10"] = 5,["11"] = 9,["12"] = 9,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 10,["18"] = 11,["19"] = 10,["20"] = 10,["21"] = 15,["22"] = 15,["23"] = 15,["25"] = 15,["26"] = 16,["27"] = 17,["28"] = 18,["29"] = 19,["30"] = 20,["31"] = 21,["32"] = 22,["33"] = 23,["34"] = 24,["35"] = 25,["36"] = 26,["37"] = 27,["38"] = 28,["39"] = 29,["40"] = 30,["41"] = 31,["42"] = 32,["43"] = 33,["44"] = 15,["45"] = 15,["46"] = 37,["47"] = 37,["48"] = 37,["49"] = 37,["50"] = 38,["51"] = 38,["52"] = 38,["53"] = 38,["54"] = 39,["55"] = 40,["56"] = 41,["57"] = 38,["58"] = 38,["59"] = 44,["60"] = 44,["61"] = 44,["62"] = 44,["63"] = 45,["64"] = 45,["65"] = 45,["66"] = 45,["67"] = 45,["68"] = 45,["69"] = 45,["70"] = 45,["71"] = 53,["72"] = 54,["73"] = 44,["74"] = 44,["75"] = 57,["76"] = 57,["77"] = 57,["78"] = 57,["79"] = 58,["80"] = 58,["81"] = 58,["82"] = 58,["83"] = 58,["84"] = 58,["85"] = 58,["86"] = 58,["87"] = 58,["88"] = 67,["89"] = 68,["90"] = 57,["91"] = 57,["92"] = 71,["93"] = 71,["94"] = 71,["95"] = 71,["96"] = 72,["97"] = 72,["98"] = 72,["99"] = 72,["100"] = 72,["101"] = 72,["102"] = 72,["103"] = 72,["104"] = 80,["105"] = 81,["106"] = 71,["107"] = 71,["108"] = 84,["109"] = 84,["110"] = 84,["111"] = 84,["112"] = 85,["113"] = 88,["114"] = 92,["115"] = 92,["116"] = 92,["117"] = 92,["118"] = 93,["119"] = 93,["120"] = 93,["121"] = 93,["122"] = 84,["123"] = 84,["124"] = 37,["125"] = 37,["126"] = 99,["127"] = 99,["128"] = 99,["129"] = 99,["130"] = 100,["131"] = 100,["132"] = 100,["133"] = 100,["134"] = 101,["135"] = 101,["136"] = 101,["137"] = 101,["138"] = 101,["139"] = 101,["140"] = 101,["141"] = 101,["142"] = 110,["143"] = 110,["144"] = 110,["145"] = 110,["146"] = 100,["147"] = 100,["148"] = 113,["149"] = 113,["150"] = 113,["151"] = 113,["152"] = 114,["153"] = 114,["154"] = 114,["155"] = 114,["156"] = 114,["157"] = 114,["158"] = 114,["159"] = 114,["160"] = 123,["161"] = 123,["162"] = 123,["163"] = 123,["164"] = 113,["165"] = 113,["166"] = 128,["167"] = 128,["168"] = 128,["169"] = 128,["170"] = 129,["171"] = 133,["172"] = 133,["173"] = 133,["174"] = 133,["175"] = 128,["176"] = 128,["177"] = 136,["178"] = 136,["179"] = 136,["180"] = 136,["181"] = 137,["182"] = 144,["183"] = 144,["184"] = 144,["185"] = 144,["186"] = 136,["187"] = 136,["188"] = 147,["189"] = 147,["190"] = 147,["191"] = 147,["192"] = 148,["193"] = 155,["194"] = 155,["195"] = 155,["196"] = 155,["197"] = 147,["198"] = 147,["199"] = 99,["200"] = 99,["201"] = 159,["202"] = 159,["203"] = 159,["204"] = 159,["205"] = 160,["206"] = 160,["207"] = 160,["208"] = 160,["209"] = 161,["210"] = 162,["211"] = 160,["212"] = 160,["213"] = 165,["214"] = 165,["215"] = 165,["216"] = 165,["217"] = 166,["218"] = 167,["219"] = 165,["220"] = 165,["221"] = 170,["222"] = 170,["223"] = 170,["224"] = 170,["225"] = 171,["226"] = 172,["227"] = 170,["228"] = 170,["229"] = 175,["230"] = 175,["231"] = 175,["232"] = 175,["233"] = 176,["234"] = 177,["235"] = 175,["236"] = 175,["237"] = 180,["238"] = 180,["239"] = 180,["240"] = 180,["241"] = 181,["242"] = 181,["243"] = 181,["244"] = 181,["245"] = 182,["246"] = 182,["247"] = 182,["248"] = 182,["249"] = 183,["250"] = 183,["251"] = 183,["252"] = 183,["253"] = 184,["254"] = 184,["255"] = 184,["256"] = 184,["257"] = 180,["258"] = 180,["259"] = 187,["260"] = 187,["261"] = 187,["262"] = 187,["263"] = 188,["264"] = 189,["265"] = 187,["266"] = 187,["267"] = 192,["268"] = 192,["269"] = 192,["270"] = 192,["271"] = 193,["272"] = 193,["273"] = 193,["274"] = 193,["275"] = 194,["276"] = 194,["277"] = 194,["278"] = 194,["279"] = 195,["280"] = 195,["281"] = 195,["282"] = 195,["283"] = 192,["284"] = 192,["285"] = 159,["286"] = 159,["287"] = 199,["288"] = 199,["289"] = 199,["290"] = 199,["291"] = 200,["292"] = 200,["293"] = 200,["294"] = 200,["295"] = 201,["296"] = 206,["297"] = 207,["298"] = 200,["299"] = 200,["300"] = 210,["301"] = 210,["302"] = 210,["303"] = 210,["304"] = 211,["305"] = 216,["306"] = 217,["307"] = 210,["308"] = 210,["309"] = 220,["310"] = 220,["311"] = 220,["312"] = 220,["313"] = 221,["314"] = 226,["315"] = 227,["316"] = 220,["317"] = 220,["318"] = 230,["319"] = 230,["320"] = 230,["321"] = 230,["322"] = 231,["323"] = 236,["324"] = 237,["325"] = 230,["326"] = 230,["327"] = 240,["328"] = 240,["329"] = 240,["330"] = 240,["331"] = 241,["332"] = 246,["333"] = 247,["334"] = 240,["335"] = 240,["336"] = 199,["337"] = 199,["338"] = 251,["339"] = 251,["340"] = 251,["341"] = 251,["342"] = 252,["343"] = 252,["344"] = 252,["345"] = 252,["346"] = 253,["347"] = 258,["348"] = 258,["349"] = 258,["350"] = 258,["351"] = 252,["352"] = 252,["353"] = 261,["354"] = 261,["355"] = 261,["356"] = 261,["357"] = 262,["358"] = 262,["359"] = 262,["360"] = 262,["361"] = 270,["362"] = 270,["363"] = 270,["364"] = 270,["365"] = 278,["366"] = 278,["367"] = 278,["368"] = 278,["369"] = 261,["370"] = 261,["371"] = 251,["372"] = 251,["373"] = 289,["374"] = 289,["375"] = 289,["376"] = 289,["377"] = 290,["378"] = 294,["379"] = 294,["380"] = 294,["381"] = 294,["382"] = 295,["383"] = 295,["384"] = 295,["385"] = 295,["386"] = 294,["387"] = 294,["388"] = 298,["389"] = 298,["390"] = 298,["391"] = 298,["392"] = 299,["393"] = 299,["394"] = 299,["395"] = 299,["396"] = 298,["397"] = 298,["398"] = 289,["399"] = 289,["400"] = 303,["401"] = 303,["402"] = 303,["403"] = 303,["404"] = 305,["405"] = 305,["406"] = 305,["407"] = 305,["408"] = 305,["409"] = 305,["410"] = 305,["411"] = 305,["412"] = 305,["413"] = 305,["414"] = 305,["415"] = 305,["416"] = 305,["417"] = 305,["418"] = 305,["419"] = 305,["420"] = 321,["421"] = 321,["422"] = 321,["423"] = 321,["424"] = 322,["425"] = 323,["426"] = 324,["427"] = 321,["428"] = 321,["429"] = 327,["430"] = 327,["431"] = 327,["432"] = 327,["433"] = 328,["434"] = 329,["435"] = 330,["436"] = 327,["437"] = 327,["438"] = 333,["439"] = 333,["440"] = 333,["441"] = 333,["442"] = 334,["443"] = 335,["444"] = 336,["445"] = 333,["446"] = 333,["447"] = 339,["448"] = 339,["449"] = 339,["450"] = 339,["451"] = 340,["452"] = 341,["453"] = 342,["454"] = 339,["455"] = 339,["456"] = 345,["457"] = 345,["458"] = 345,["459"] = 345,["460"] = 346,["461"] = 347,["462"] = 348,["463"] = 345,["464"] = 345,["465"] = 351,["466"] = 351,["467"] = 351,["468"] = 351,["469"] = 352,["470"] = 353,["471"] = 354,["472"] = 351,["473"] = 351,["474"] = 357,["475"] = 357,["476"] = 357,["477"] = 357,["478"] = 358,["479"] = 359,["480"] = 360,["481"] = 357,["482"] = 357,["483"] = 363,["484"] = 363,["485"] = 363,["486"] = 363,["487"] = 364,["488"] = 365,["489"] = 366,["490"] = 363,["491"] = 363,["492"] = 369,["493"] = 369,["494"] = 369,["495"] = 369,["496"] = 370,["497"] = 371,["498"] = 372,["499"] = 369,["500"] = 369,["501"] = 375,["502"] = 375,["503"] = 375,["504"] = 375,["505"] = 376,["506"] = 377,["507"] = 378,["508"] = 375,["509"] = 375,["510"] = 381,["511"] = 381,["512"] = 381,["513"] = 381,["514"] = 382,["515"] = 383,["516"] = 384,["517"] = 381,["518"] = 381,["519"] = 387,["520"] = 387,["521"] = 387,["522"] = 387,["523"] = 388,["524"] = 389,["525"] = 390,["526"] = 387,["527"] = 387,["528"] = 393,["529"] = 393,["530"] = 393,["531"] = 393,["532"] = 394,["533"] = 399,["534"] = 400,["535"] = 393,["536"] = 393,["537"] = 403,["538"] = 403,["539"] = 403,["540"] = 403,["541"] = 404,["542"] = 409,["543"] = 410,["544"] = 403,["545"] = 403,["546"] = 413,["547"] = 413,["548"] = 413,["549"] = 413,["550"] = 414,["551"] = 420,["552"] = 421,["553"] = 413,["554"] = 413,["555"] = 424,["556"] = 424,["557"] = 424,["558"] = 424,["559"] = 425,["560"] = 432,["561"] = 433,["562"] = 424,["563"] = 424,["564"] = 436,["565"] = 436,["566"] = 436,["567"] = 436,["568"] = 437,["569"] = 441,["570"] = 442,["571"] = 436,["572"] = 436,["573"] = 445,["574"] = 445,["575"] = 445,["576"] = 445,["577"] = 446,["578"] = 450,["579"] = 451,["580"] = 445,["581"] = 445,["582"] = 454,["583"] = 454,["584"] = 454,["585"] = 454,["586"] = 455,["587"] = 455,["588"] = 455,["589"] = 455,["590"] = 455,["591"] = 455,["592"] = 455,["593"] = 463,["594"] = 464,["595"] = 454,["596"] = 454,["597"] = 303,["598"] = 303,["599"] = 9,["600"] = 9});
local ____exports = {}
local ____game_2Dend_2Dpoint = require("modules.event.game-end.game-end-point")
local GameEndPoint = ____game_2Dend_2Dpoint.GameEndPoint
function ____exports.IsInToolsMode(self)
    return true
end
describe(
    nil,
    "GameEndPoint",
    function()
        beforeEach(
            nil,
            function()
                _G.IsInToolsMode = function() return true end
            end
        )
        local function createBasePlayer(____, overrides)
            if overrides == nil then
                overrides = {}
            end
            return __TS__ObjectAssign({
                heroName = "npc_dota_hero_axe",
                steamId = 123456,
                playerId = 1,
                teamId = 2,
                isDisconnected = false,
                level = 1,
                gold = 0,
                kills = 0,
                deaths = 0,
                assists = 0,
                damage = 0,
                damageTaken = 0,
                healing = 0,
                lastHits = 0,
                towerKills = 0,
                score = 0,
                battlePoints = 0,
                facetId = 1
            }, overrides)
        end
        describe(
            nil,
            "GameEndPoint.CalculatePlayerScore",
            function()
                it(
                    nil,
                    "应该正确计算无数据玩家的分数",
                    function()
                        local player = createBasePlayer(nil)
                        local score = GameEndPoint:CalculatePlayerScore(player)
                        expect(nil, score):toBe(0)
                    end
                )
                it(
                    nil,
                    "应该正确计算单人玩家的分数",
                    function()
                        local player = createBasePlayer(nil, {
                            kills = 120,
                            deaths = 5,
                            damage = 2000000,
                            damageTaken = 100000,
                            healing = 1000,
                            towerKills = 9
                        })
                        local score = GameEndPoint:CalculatePlayerScore(player)
                        expect(nil, score):toBe(36)
                    end
                )
                it(
                    nil,
                    "应该正确计算团队玩家的分数",
                    function()
                        local player = createBasePlayer(nil, {
                            kills = 50,
                            deaths = 10,
                            assists = 100,
                            damage = 1000000,
                            damageTaken = 100000,
                            healing = 20000,
                            towerKills = 2
                        })
                        local score = GameEndPoint:CalculatePlayerScore(player)
                        expect(nil, score):toBe(40)
                    end
                )
                it(
                    nil,
                    "应该正确计算超高数据玩家的分数",
                    function()
                        local player = createBasePlayer(nil, {
                            kills = 300,
                            assists = 10,
                            damage = 100000000,
                            damageTaken = 10000000,
                            healing = 2000000,
                            towerKills = 11
                        })
                        local score = GameEndPoint:CalculatePlayerScore(player)
                        expect(nil, score):toBe(138)
                    end
                )
                it(
                    nil,
                    "承伤分500万以内保持原分，超过后只折扣超出部分",
                    function()
                        local atLimit = createBasePlayer(nil, {damageTaken = 5000000})
                        local aboveLimit = createBasePlayer(nil, {damageTaken = 15000000})
                        expect(
                            nil,
                            GameEndPoint:CalculatePlayerScore(atLimit)
                        ):toBe(22)
                        expect(
                            nil,
                            GameEndPoint:CalculatePlayerScore(aboveLimit)
                        ):toBeLessThan(math.floor(math.sqrt(15000000) / 100 + 0.5))
                    end
                )
            end
        )
        describe(
            nil,
            "GameEndPoint.CalculateAbyssPlayerScore",
            function()
                it(
                    nil,
                    "深渊模式应该更早折减高击杀和高承伤",
                    function()
                        local player = createBasePlayer(nil, {
                            kills = 400,
                            assists = 400,
                            damage = 15000000,
                            damageTaken = 5000000,
                            healing = 2000000,
                            towerKills = 1
                        })
                        expect(
                            nil,
                            GameEndPoint:CalculateAbyssPlayerScore(player, 100)
                        ):toBeCloseTo(57.72, 2)
                    end
                )
                it(
                    nil,
                    "高分段应该降低击杀、伤害、承伤和治疗的累积收益",
                    function()
                        local player = createBasePlayer(nil, {
                            kills = 500,
                            assists = 500,
                            damage = 100000000,
                            damageTaken = 30000000,
                            healing = 5000000,
                            towerKills = 11
                        })
                        expect(
                            nil,
                            GameEndPoint:CalculateAbyssPlayerScore(player, 100)
                        ):toBeLessThan(GameEndPoint:CalculatePlayerScore(player))
                    end
                )
                it(
                    nil,
                    "深渊模式死亡扣分更高",
                    function()
                        local player = createBasePlayer(nil, {deaths = 4})
                        expect(
                            nil,
                            GameEndPoint:CalculateAbyssPlayerScore(player)
                        ):toBe(-3)
                    end
                )
                it(
                    nil,
                    "深渊样本数据应该按当前折减体系计算",
                    function()
                        local player = createBasePlayer(nil, {kills = 755, deaths = 2, damage = 200740000, damageTaken = 8620000})
                        expect(
                            nil,
                            GameEndPoint:CalculateAbyssPlayerScore(player, 100)
                        ):toBeCloseTo(57.48, 2)
                    end
                )
                it(
                    nil,
                    "深渊单人模式应该移除治疗分且层数分不额外加成",
                    function()
                        local player = createBasePlayer(nil, {kills = 506, deaths = 4, damage = 38000000, damageTaken = 1590000})
                        expect(
                            nil,
                            GameEndPoint:CalculateAbyssPlayerScore(player, 69, true)
                        ):toBeCloseTo(40.92, 2)
                    end
                )
            end
        )
        describe(
            nil,
            "GameEndPoint.GetGameTimePoints",
            function()
                it(
                    nil,
                    "10分钟游戏得分",
                    function()
                        local points = GameEndPoint:GetGameTimePoints(600)
                        expect(nil, points):toBe(9)
                    end
                )
                it(
                    nil,
                    "30分钟游戏得分",
                    function()
                        local points = GameEndPoint:GetGameTimePoints(1800)
                        expect(nil, points):toBe(16)
                    end
                )
                it(
                    nil,
                    "60分钟游戏得分",
                    function()
                        local points = GameEndPoint:GetGameTimePoints(3600)
                        expect(nil, points):toBe(23)
                    end
                )
                it(
                    nil,
                    "深渊模式时间分更高",
                    function()
                        local points = GameEndPoint:GetAbyssGameTimePoints(840)
                        expect(nil, points):toBeCloseTo(14, 1)
                    end
                )
                it(
                    nil,
                    "深渊模式25分钟后继续增加时间分并在50分钟封顶",
                    function()
                        expect(
                            nil,
                            GameEndPoint:GetAbyssGameTimePoints(1500)
                        ):toBe(25)
                        expect(
                            nil,
                            GameEndPoint:GetAbyssGameTimePoints(2250)
                        ):toBeCloseTo(37.5, 1)
                        expect(
                            nil,
                            GameEndPoint:GetAbyssGameTimePoints(3000)
                        ):toBe(50)
                        expect(
                            nil,
                            GameEndPoint:GetAbyssGameTimePoints(3600)
                        ):toBe(50)
                    end
                )
                it(
                    nil,
                    "深渊单人模式治疗分池挪给时间分",
                    function()
                        local points = GameEndPoint:GetAbyssGameTimePoints(1500, true)
                        expect(nil, points):toBe(33)
                    end
                )
                it(
                    nil,
                    "深渊单人模式25分钟后继续增加时间分并在50分钟封顶",
                    function()
                        expect(
                            nil,
                            GameEndPoint:GetAbyssGameTimePoints(2250, true)
                        ):toBeCloseTo(49.5, 1)
                        expect(
                            nil,
                            GameEndPoint:GetAbyssGameTimePoints(3000, true)
                        ):toBe(66)
                        expect(
                            nil,
                            GameEndPoint:GetAbyssGameTimePoints(3600, true)
                        ):toBe(66)
                    end
                )
            end
        )
        describe(
            nil,
            "GameEndPoint.GetParticipationRateMultiplier",
            function()
                it(
                    nil,
                    "团队杀为0的情况获得完整时间分",
                    function()
                        local player = createBasePlayer(nil, {kills = 0, deaths = 0, assists = 0})
                        local multiplier = GameEndPoint:GetParticipationRateMultiplier(player, 0)
                        expect(nil, multiplier):toBe(1)
                    end
                )
                it(
                    nil,
                    "参战率低于5%的玩家应该获得0分",
                    function()
                        local player = createBasePlayer(nil, {kills = 2, deaths = 1, assists = 2})
                        local multiplier = GameEndPoint:GetParticipationRateMultiplier(player, 100)
                        expect(nil, multiplier):toBe(0)
                    end
                )
                it(
                    nil,
                    "参战率低于10%的玩家应该获得一半时间分",
                    function()
                        local player = createBasePlayer(nil, {kills = 2, deaths = 1, assists = 7})
                        local multiplier = GameEndPoint:GetParticipationRateMultiplier(player, 100)
                        expect(nil, multiplier):toBe(0.5)
                    end
                )
                it(
                    nil,
                    "参战率正好等于10%的玩家应该获得完整时间分",
                    function()
                        local player = createBasePlayer(nil, {kills = 5, deaths = 1, assists = 5})
                        local multiplier = GameEndPoint:GetParticipationRateMultiplier(player, 100)
                        expect(nil, multiplier):toBe(1)
                    end
                )
                it(
                    nil,
                    "参战率高于10%的玩家应该获得完整时间分",
                    function()
                        local player = createBasePlayer(nil, {kills = 20, deaths = 8, assists = 50})
                        local multiplier = GameEndPoint:GetParticipationRateMultiplier(player, 100)
                        expect(nil, multiplier):toBe(1)
                    end
                )
            end
        )
        describe(
            nil,
            "GameEndPoint.GetAbyssActivityTimeMultiplier",
            function()
                it(
                    nil,
                    "深渊挂机玩家时间分系数为0",
                    function()
                        local player = createBasePlayer(nil, {kills = 0, deaths = 0})
                        expect(
                            nil,
                            GameEndPoint:GetAbyssActivityTimeMultiplier(player)
                        ):toBe(0)
                    end
                )
                it(
                    nil,
                    "深渊低击杀死亡次数在3次以内线性降低时间分",
                    function()
                        expect(
                            nil,
                            GameEndPoint:GetAbyssActivityTimeMultiplier(createBasePlayer(nil, {kills = 1, deaths = 0}))
                        ):toBeCloseTo(1 / 3, 4)
                        expect(
                            nil,
                            GameEndPoint:GetAbyssActivityTimeMultiplier(createBasePlayer(nil, {kills = 1, deaths = 1}))
                        ):toBeCloseTo(2 / 3, 4)
                        expect(
                            nil,
                            GameEndPoint:GetAbyssActivityTimeMultiplier(createBasePlayer(nil, {kills = 2, deaths = 1}))
                        ):toBe(1)
                    end
                )
            end
        )
        describe(
            nil,
            "GameEndPoint.GetDifficultyMultiplier",
            function()
                local defaultOption = {midOnlyMode = false}
                it(
                    nil,
                    "RD7难度应该使用N7倍率",
                    function()
                        expect(
                            nil,
                            GameEndPoint:GetDifficultyMultiplier(8, false, defaultOption)
                        ):toBe(2.5)
                    end
                )
                it(
                    nil,
                    "RD8难度应该使用更高倍率",
                    function()
                        expect(
                            nil,
                            GameEndPoint:GetDifficultyMultiplier(9, false, defaultOption)
                        ):toBe(2.6)
                    end
                )
            end
        )
        describe(
            nil,
            "GameEndPoint.GetCustomModeMultiplier",
            function()
                local defaultOption = {
                    radiantGoldXpMultiplier = 1.5,
                    direGoldXpMultiplier = 2,
                    radiantPlayerNumber = 10,
                    direPlayerNumber = 10,
                    towerPower = 200,
                    startingGoldPlayer = 3000,
                    startingGoldBot = 3000,
                    respawnTimePercentage = 100,
                    maxLevel = 50,
                    sameHeroSelection = false,
                    enablePlayerAttribute = true,
                    fixedAbility = "none",
                    extraPassiveAbilities = false,
                    gameDifficulty = 0
                }
                it(
                    nil,
                    "默认选项应该返回1",
                    function()
                        local option = defaultOption
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(0.9)
                    end
                )
                it(
                    nil,
                    "天辉金钱经验倍率=1.2",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {radiantGoldXpMultiplier = 1.2})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(1)
                    end
                )
                it(
                    nil,
                    "天辉金钱经验倍率>=2时",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {radiantGoldXpMultiplier = 2})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(0.3)
                    end
                )
                it(
                    nil,
                    "天辉金钱经验倍率>=5时",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {radiantGoldXpMultiplier = 5})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(0)
                    end
                )
                it(
                    nil,
                    "夜魇金钱经验倍率>=20时",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {direGoldXpMultiplier = 20})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(2.1)
                    end
                )
                it(
                    nil,
                    "夜魇金钱经验倍率>=10时",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {direGoldXpMultiplier = 10})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(1.6)
                    end
                )
                it(
                    nil,
                    "夜魇金钱经验倍率>=5时",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {direGoldXpMultiplier = 5})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(1.2)
                    end
                )
                it(
                    nil,
                    "夜魇玩家数量为5时应该返回0.5",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {direPlayerNumber = 5})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(0.5)
                    end
                )
                it(
                    nil,
                    "复活时间百分比<=10时应该返回0.6",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {respawnTimePercentage = 10})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(0.6)
                    end
                )
                it(
                    nil,
                    "防御塔倍率<=150时",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {towerPower = 150})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(0.9)
                    end
                )
                it(
                    nil,
                    "防御塔倍率>=600时",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {towerPower = 600})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(1.1)
                    end
                )
                it(
                    nil,
                    "不启用玩家属性应该返回1.2",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {enablePlayerAttribute = false})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(1.1)
                    end
                )
                it(
                    nil,
                    "玩家金钱>=5000时应该-0.1",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {direGoldXpMultiplier = 10, startingGoldPlayer = 5000})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(1.5)
                    end
                )
                it(
                    nil,
                    "电脑金钱<=1000时应该-0.1",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {direGoldXpMultiplier = 10, startingGoldBot = 1000})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(1.5)
                    end
                )
                it(
                    nil,
                    "N6难度多个条件组合",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {radiantGoldXpMultiplier = 1.5, direGoldXpMultiplier = 10, towerPower = 350})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(1.9)
                    end
                )
                it(
                    nil,
                    "最高难度倍率",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {radiantGoldXpMultiplier = 1, direGoldXpMultiplier = 20, towerPower = 400, enablePlayerAttribute = false})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(2.8)
                    end
                )
                it(
                    nil,
                    "勾选额外技能时，降低倍率",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {extraPassiveAbilities = true})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(0.9)
                    end
                )
                it(
                    nil,
                    "固定技能时，降低倍率",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {fixedAbility = "medusa_split_shot"})
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBe(0.8)
                    end
                )
                it(
                    nil,
                    "最低倍率不低于0",
                    function()
                        local option = __TS__ObjectAssign({}, defaultOption, {
                            radiantGoldXpMultiplier = 5,
                            direGoldXpMultiplier = 10,
                            direPlayerNumber = 5,
                            towerPower = 150,
                            extraPassiveAbilities = true
                        })
                        local multiplier = GameEndPoint:GetCustomModeMultiplier(option)
                        expect(nil, multiplier):toBeGreaterThanOrEqual(0)
                    end
                )
            end
        )
    end
)
return ____exports
