local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/event.lua"
__TS__SourceMapTraceBack("modules/event/event.lua", {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 9,["22"] = 9,["23"] = 9,["25"] = 10,["26"] = 11,["27"] = 12,["28"] = 13,["29"] = 14,["30"] = 15,["31"] = 16,["32"] = 9});
local ____exports = {}
local ____event_2Dbuyback = require("modules.event.event-buyback")
local EventDotaBuyback = ____event_2Dbuyback.EventDotaBuyback
local ____event_2Druntime_2Dsync = require("modules.event.event-runtime-sync")
local EventRuntimeSync = ____event_2Druntime_2Dsync.EventRuntimeSync
local ____event_2Dentity_2Dkilled = require("modules.event.event-entity-killed")
local EventEntityKilled = ____event_2Dentity_2Dkilled.EventEntityKilled
local ____event_2Dgame_2Dstate_2Dchange = require("modules.event.event-game-state-change")
local EventGameStateChange = ____event_2Dgame_2Dstate_2Dchange.EventGameStateChange
local ____event_2Ditem_2Dused = require("modules.event.event-item-used")
local EventItemUsed = ____event_2Ditem_2Dused.EventItemUsed
local ____event_2Dnpc_2Dspawned = require("modules.event.event-npc-spawned")
local EventNpcSpawned = ____event_2Dnpc_2Dspawned.EventNpcSpawned
local ____event_2Dplayer_2Dlevel_2Dup = require("modules.event.event-player-level-up")
local EventPlayerLevelUp = ____event_2Dplayer_2Dlevel_2Dup.EventPlayerLevelUp
____exports.Event = __TS__Class()
local Event = ____exports.Event
Event.name = "Event"
function Event.prototype.____constructor(self)
    self.EventNpcSpawned = __TS__New(EventNpcSpawned)
    self.EventEntityKilled = __TS__New(EventEntityKilled)
    self.EventGameStateChange = __TS__New(EventGameStateChange)
    self.EventPlayerLevelUp = __TS__New(EventPlayerLevelUp)
    self.EventDotaBuyback = __TS__New(EventDotaBuyback)
    self.EventRuntimeSync = __TS__New(EventRuntimeSync)
    self.EventItemUsed = __TS__New(EventItemUsed)
end
return ____exports
