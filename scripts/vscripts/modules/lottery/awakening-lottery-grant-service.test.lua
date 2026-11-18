local ____lualib = require("lualib_bundle")
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/awakening-lottery-grant-service.test.lua"
__TS__SourceMapTraceBack("modules/lottery/awakening-lottery-grant-service.test.lua", {["9"] = 124,["10"] = 8,["11"] = 8,["12"] = 124,["13"] = 125,["14"] = 126,["15"] = 127,["16"] = 127,["17"] = 129,["18"] = 130,["19"] = 127,["20"] = 127,["21"] = 127,["22"] = 134,["23"] = 135,["24"] = 127,["25"] = 137,["26"] = 138,["27"] = 127,["28"] = 127,["30"] = 143,["31"] = 144,["32"] = 145,["33"] = 145,["34"] = 145,["35"] = 148,["36"] = 149,["37"] = 150,["38"] = 151,["39"] = 145,["40"] = 145,["41"] = 145,["42"] = 145,["43"] = 145,["44"] = 157,["45"] = 158,["46"] = 145,["47"] = 145,["49"] = 1,["50"] = 1,["51"] = 1,["52"] = 1,["53"] = 4,["54"] = 4,["55"] = 4,["56"] = 4,["57"] = 10,["58"] = 10,["59"] = 10,["60"] = 10,["61"] = 11,["62"] = 13,["63"] = 13,["64"] = 13,["65"] = 14,["66"] = 15,["67"] = 16,["68"] = 19,["69"] = 16,["70"] = 13,["71"] = 13,["72"] = 25,["73"] = 25,["74"] = 25,["75"] = 25,["76"] = 27,["77"] = 27,["78"] = 27,["79"] = 27,["80"] = 28,["81"] = 29,["82"] = 31,["83"] = 42,["84"] = 42,["85"] = 42,["86"] = 42,["87"] = 43,["88"] = 43,["89"] = 43,["90"] = 43,["91"] = 43,["92"] = 44,["93"] = 45,["94"] = 46,["95"] = 27,["96"] = 27,["97"] = 52,["98"] = 52,["99"] = 52,["100"] = 52,["101"] = 53,["102"] = 54,["103"] = 55,["104"] = 65,["106"] = 65,["108"] = 67,["109"] = 67,["110"] = 67,["111"] = 67,["112"] = 74,["113"] = 75,["114"] = 75,["115"] = 75,["116"] = 75,["117"] = 76,["118"] = 52,["119"] = 52,["120"] = 79,["121"] = 79,["122"] = 79,["123"] = 79,["124"] = 80,["125"] = 81,["126"] = 83,["127"] = 94,["128"] = 95,["129"] = 79,["130"] = 79,["131"] = 98,["132"] = 98,["133"] = 98,["134"] = 98,["135"] = 99,["136"] = 100,["137"] = 101,["138"] = 111,["139"] = 112,["140"] = 114,["141"] = 120,["142"] = 98,["143"] = 98,["144"] = 10,["145"] = 10});
local ____exports = {}
local createAbility, createHero
local ____awakening_2Dlottery_2Dgrant_2Dservice = require("modules.lottery.awakening-lottery-grant-service")
local AwakeningLotteryGrantService = ____awakening_2Dlottery_2Dgrant_2Dservice.AwakeningLotteryGrantService
function createAbility(self)
    local level = 0
    local toggleState = false
    return {
        GetLevel = function() return level end,
        SetLevel = function(____, value)
            level = value
        end,
        SetHidden = jest:fn(),
        GetToggleState = function() return toggleState end,
        SetToggleState = function(____, value)
            toggleState = value
        end,
        ToggleAbility = jest:fn(function()
            toggleState = not toggleState
        end)
    }
end
function createHero(self, abilities)
    local abilityPoints = 0
    return {
        HasAbility = function(____, name) return abilities:has(name) end,
        FindAbilityByName = function(____, name) return abilities:get(name) end,
        AddAbility = function(____, name)
            local ability = createAbility(nil)
            abilities:set(name, ability)
            return ability
        end,
        RemoveAbility = function(____, name) return abilities:delete(name) end,
        HasModifier = jest:fn(function() return false end),
        RemoveModifierByName = jest:fn(),
        GetAbilityPoints = function() return abilityPoints end,
        SetAbilityPoints = function(____, value)
            abilityPoints = value
        end
    }
end
jest:mock(
    "./ability-replace/ability-replace-helper",
    function() return {AbilityReplaceHelper = {cleanupRemovedAbilityModifiers = jest:fn()}} end
)
jest:mock(
    "./lottery-ability-grant-helper",
    function() return {LotteryAbilityGrantHelper = {ApplyGrantSideEffects = jest:fn()}} end
)
describe(
    nil,
    "AwakeningLotteryGrantService",
    function()
        local sent = {}
        beforeAll(
            nil,
            function()
                local testGlobal = _G
                testGlobal.PlayerResource = {GetPlayer = jest:fn(function() return {id = 0} end)}
                testGlobal.CustomGameEventManager = {Send_ServerToPlayer = jest:fn(function(____, _player, eventName, payload)
                    sent[#sent + 1] = {eventName = eventName, payload = payload}
                end)}
            end
        )
        beforeEach(
            nil,
            function() return __TS__ArraySplice(sent, 0) end
        )
        it(
            nil,
            "grants dependencies in order and records the hotkey policy",
            function()
                local abilities = __TS__New(Map)
                local hero = createHero(nil, abilities)
                local state = AwakeningLotteryGrantService:Grant(hero, {name = "axe_auto_culling_blade", level = 3, source = "awakening", entryId = "ability:axe_auto_culling_blade"}, 0)
                expect(
                    nil,
                    {__TS__Spread(abilities:keys())}
                ):toEqual({"axe_culling_blade", "axe_auto_culling_blade"})
                local ____opt_0 = abilities:get("axe_culling_blade")
                expect(
                    nil,
                    ____opt_0 and ____opt_0:GetLevel()
                ):toBe(1)
                expect(nil, state and state.hotkeyAbilityName):toBe("axe_auto_culling_blade")
                expect(nil, state and state.extraHotkeys):toEqual({{abilityName = "axe_culling_blade", key = "5"}})
                expect(nil, sent):toContainEqual({eventName = "bind_ability_to_key", payload = {ability_name = "axe_culling_blade", key = "5"}})
            end
        )
        it(
            nil,
            "removes created bundle abilities and refunds only learned primary levels",
            function()
                local abilities = __TS__New(Map)
                local hero = createHero(nil, abilities)
                local state = AwakeningLotteryGrantService:Grant(hero, {name = "axe_auto_culling_blade", level = 3, source = "awakening", entryId = "ability:axe_auto_culling_blade"}, 0)
                local ____opt_6 = abilities:get("axe_auto_culling_blade")
                if ____opt_6 ~= nil then
                    ____opt_6:SetLevel(2)
                end
                expect(
                    nil,
                    AwakeningLotteryGrantService:Cleanup(hero, state, 0)
                ):toBe(2)
                expect(nil, abilities.size):toBe(0)
                expect(
                    nil,
                    hero:GetAbilityPoints()
                ):toBe(2)
                expect(nil, sent):toContainEqual({eventName = "unbind_ability_from_key", payload = {key = "5"}})
            end
        )
        it(
            nil,
            "uses the selected active ability as the native primary hotkey",
            function()
                local abilities = __TS__New(Map)
                local hero = createHero(nil, abilities)
                local state = AwakeningLotteryGrantService:Grant(hero, {name = "spectre_desolate_curse", level = 3, source = "awakening", entryId = "ability:spectre_desolate_curse"}, 0)
                expect(nil, state and state.hotkeyAbilityName):toBe("spectre_desolate_curse")
                expect(nil, state and state.extraHotkeys):toEqual({})
            end
        )
        it(
            nil,
            "turns off toggle abilities before removing them",
            function()
                local abilities = __TS__New(Map)
                local hero = createHero(nil, abilities)
                local state = AwakeningLotteryGrantService:Grant(hero, {name = "medusa_split_shot2", level = 3, source = "awakening", entryId = "ability:medusa_split_shot2"}, 0)
                local ability = abilities:get("medusa_split_shot2")
                ability:SetToggleState(true)
                AwakeningLotteryGrantService:Cleanup(hero, state, 0)
                expect(nil, ability.ToggleAbility):toHaveBeenCalledTimes(1)
            end
        )
    end
)
return ____exports
