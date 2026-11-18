local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/event/event-item-used.lua"
__TS__SourceMapTraceBack("modules/event/event-item-used.lua", {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 3,["11"] = 3,["12"] = 3,["13"] = 3,["14"] = 3,["15"] = 2,["16"] = 6,["17"] = 6});
local ____exports = {}
____exports.EventItemUsed = __TS__Class()
local EventItemUsed = ____exports.EventItemUsed
EventItemUsed.name = "EventItemUsed"
function EventItemUsed.prototype.____constructor(self)
    ListenToGameEvent(
        "dota_item_used",
        function(____, keys) return self:OnItemUsed(keys) end,
        self
    )
end
function EventItemUsed.prototype.OnItemUsed(self, keys)
end
return ____exports
