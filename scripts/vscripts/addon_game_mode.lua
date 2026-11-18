local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "addon_game_mode.lua"
__TS__SourceMapTraceBack("addon_game_mode.lua", {["6"] = 1,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 5,["11"] = 5,["12"] = 6,["13"] = 6,["14"] = 7,["15"] = 8,["16"] = 8,["17"] = 10,["18"] = 10,["19"] = 10,["20"] = 11,["21"] = 12,["22"] = 15,["25"] = 19,["28"] = 17,["35"] = 22,["36"] = 23,["37"] = 24,["39"] = 26,["40"] = 27,["41"] = 28,["42"] = 10,["43"] = 10,["44"] = 10,["45"] = 10});
local ____exports = {}
require("utils.index")
require("register_modifiers")
local ____register_modifiers = require("register_modifiers")
local linkAll = ____register_modifiers.linkAll
local ____modules = require("modules.index")
local ActivateModules = ____modules.ActivateModules
local ____standalone_2Dserver = require("modules.standalone.standalone-server")
local StandaloneServer = ____standalone_2Dserver.StandaloneServer
require("utils.lifesteal")
local ____precache = require("utils.precache")
local Precache = ____precache.default
__TS__ObjectAssign(
    getfenv(),
    {
        Activate = function()
            local cheatGameRules = GameRules
            if cheatGameRules.SetCheatCommandsEnabled ~= nil then
                do
                    local function ____catch(____error)
                        print("[AddonGameMode] SetCheatCommandsEnabled failed: " .. tostring(____error))
                    end
                    local ____try, ____hasReturned = pcall(function()
                        cheatGameRules:SetCheatCommandsEnabled(false)
                    end)
                    if not ____try then
                        ____catch(____hasReturned)
                    end
                end
            end
            linkAll(nil)
            if AIGameMode == nil then
                dofile("ai_game_mode")
            end
            ActivateModules(nil)
            AIGameMode:InitGameMode()
            -- CODEX_STANDALONE_BOOTSTRAP_BEGIN
            -- A Valve Arcade lobby normally performs this transition. A directly
            -- connected dedicated server has no lobby, so enter setup after the
            -- first real client has finished joining.
            if IsDedicatedServer() then
                local didEnterSetup = false
                GameRules:GetGameModeEntity():SetThink(
                    function()
                        if didEnterSetup then
                            return nil
                        end
                        if GameRules:State_Get() == DOTA_GAMERULES_STATE_INIT
                            and PlayerResource:GetPlayerCount() > 0 then
                            didEnterSetup = true
                            print("[StandaloneServer] Entering custom game setup")
                            GameRules:ResetToCustomGameSetup()
                            return nil
                        end
                        return 0.25
                    end,
                    "StandaloneServerEnterCustomSetup",
                    0.25
                )
            end
            -- CODEX_STANDALONE_BOOTSTRAP_END
            StandaloneServer:Initialize()
        end,
        Precache = Precache
    }
)
return ____exports
