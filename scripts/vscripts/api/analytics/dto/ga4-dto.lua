local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/analytics/dto/ga4-dto.lua"
__TS__SourceMapTraceBack("api/analytics/dto/ga4-dto.lua", {["7"] = 5,["8"] = 6,["9"] = 7,["10"] = 8,["11"] = 9,["12"] = 10});
local ____exports = {}
--- 服务器类型枚举
-- 标识游戏运行在哪个服务器上
____exports.SERVER_TYPE = SERVER_TYPE or ({})
____exports.SERVER_TYPE.WINDY = "WINDY"
____exports.SERVER_TYPE.TEST = "TEST"
____exports.SERVER_TYPE.TENVTEN = "TENVTEN"
____exports.SERVER_TYPE.LOCAL = "LOCAL"
____exports.SERVER_TYPE.UNKNOWN = "UNKNOWN"
return ____exports
