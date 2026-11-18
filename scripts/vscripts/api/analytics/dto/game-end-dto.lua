local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/analytics/dto/game-end-dto.lua"
__TS__SourceMapTraceBack("api/analytics/dto/game-end-dto.lua", {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 3,["13"] = 3,["14"] = 12,["15"] = 12,["16"] = 12,["18"] = 12,["19"] = 37,["20"] = 37,["21"] = 37,["22"] = 37,["23"] = 48,["24"] = 48,["25"] = 48,["26"] = 48,["27"] = 61,["28"] = 61,["29"] = 61,["30"] = 61});
local ____exports = {}
local ____event_2Dbase_2Ddto = require("api.analytics.dto.event-base-dto")
local EventBaseDto = ____event_2Dbase_2Ddto.EventBaseDto
____exports.GameEndGameOptionsDto = __TS__Class()
local GameEndGameOptionsDto = ____exports.GameEndGameOptionsDto
GameEndGameOptionsDto.name = "GameEndGameOptionsDto"
function GameEndGameOptionsDto.prototype.____constructor(self)
end
____exports.GameEndPlayerDto = __TS__Class()
local GameEndPlayerDto = ____exports.GameEndPlayerDto
GameEndPlayerDto.name = "GameEndPlayerDto"
function GameEndPlayerDto.prototype.____constructor(self)
end
____exports.GameEndDto = __TS__Class()
local GameEndDto = ____exports.GameEndDto
GameEndDto.name = "GameEndDto"
__TS__ClassExtends(GameEndDto, EventBaseDto)
____exports.GameEndPlayerDto2 = __TS__Class()
local GameEndPlayerDto2 = ____exports.GameEndPlayerDto2
GameEndPlayerDto2.name = "GameEndPlayerDto2"
__TS__ClassExtends(GameEndPlayerDto2, ____exports.GameEndPlayerDto)
____exports.GameEndDto2 = __TS__Class()
local GameEndDto2 = ____exports.GameEndDto2
GameEndDto2.name = "GameEndDto2"
__TS__ClassExtends(GameEndDto2, EventBaseDto)
return ____exports
