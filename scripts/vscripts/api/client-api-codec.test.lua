local ____lualib = require("lualib_bundle")
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/client-api-codec.test.lua"
__TS__SourceMapTraceBack("api/client-api-codec.test.lua", {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 5,["19"] = 5,["20"] = 4,["21"] = 4,["22"] = 8,["23"] = 8,["24"] = 8,["25"] = 8,["26"] = 9,["27"] = 10,["28"] = 10,["29"] = 10,["30"] = 10,["31"] = 11,["32"] = 11,["33"] = 11,["34"] = 11,["35"] = 12,["36"] = 12,["37"] = 12,["38"] = 12,["39"] = 13,["40"] = 13,["41"] = 13,["42"] = 13,["43"] = 14,["44"] = 14,["45"] = 14,["46"] = 14,["47"] = 8,["48"] = 8,["49"] = 3,["50"] = 3});
local ____exports = {}
local ____client_2Dapi_2Dcodec = require("api.client-api-codec")
local ClientApiCodec = ____client_2Dapi_2Dcodec.ClientApiCodec
describe(
    nil,
    "ClientApiCodec",
    function()
        it:each({"", "plain ascii", "玩家结算 🎮"})(
            nil,
            "round-trips %s",
            function(____, value)
                expect(
                    nil,
                    ClientApiCodec:Decode(ClientApiCodec:Encode(value))
                ):toBe(value)
            end
        )
        it(
            nil,
            "uses URL-safe unpadded base64 and deterministic chunks",
            function()
                local encoded = ClientApiCodec:Encode("ÿþý")
                expect(
                    nil,
                    __TS__StringIncludes(encoded, "+")
                ):toBe(false)
                expect(
                    nil,
                    __TS__StringIncludes(encoded, "/")
                ):toBe(false)
                expect(
                    nil,
                    __TS__StringIncludes(encoded, "=")
                ):toBe(false)
                expect(
                    nil,
                    ClientApiCodec:Chunk("abcdefgh", 3)
                ):toEqual({"abc", "def", "gh"})
                expect(
                    nil,
                    ClientApiCodec:Chunk("", 3)
                ):toEqual({""})
            end
        )
    end
)
return ____exports
