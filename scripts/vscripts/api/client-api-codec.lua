local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringCharAt = ____lualib.__TS__StringCharAt
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__StringCharCodeAt = ____lualib.__TS__StringCharCodeAt
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/client-api-codec.lua"
__TS__SourceMapTraceBack("api/client-api-codec.lua", {["10"] = 3,["11"] = 3,["12"] = 3,["14"] = 3,["15"] = 7,["16"] = 8,["17"] = 9,["19"] = 10,["20"] = 10,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 14,["30"] = 14,["31"] = 15,["32"] = 15,["33"] = 15,["34"] = 15,["35"] = 15,["36"] = 15,["37"] = 15,["38"] = 16,["39"] = 16,["40"] = 16,["41"] = 16,["42"] = 16,["43"] = 16,["44"] = 16,["45"] = 17,["46"] = 17,["47"] = 17,["48"] = 17,["49"] = 17,["50"] = 17,["51"] = 17,["52"] = 17,["54"] = 18,["55"] = 18,["56"] = 18,["57"] = 18,["58"] = 18,["60"] = 10,["63"] = 20,["64"] = 7,["65"] = 23,["66"] = 24,["67"] = 25,["68"] = 26,["70"] = 27,["71"] = 27,["73"] = 28,["74"] = 28,["75"] = 28,["76"] = 28,["77"] = 28,["78"] = 28,["79"] = 29,["80"] = 29,["82"] = 30,["83"] = 30,["84"] = 30,["85"] = 30,["86"] = 31,["87"] = 32,["88"] = 33,["89"] = 34,["90"] = 34,["91"] = 34,["92"] = 34,["96"] = 27,["99"] = 37,["100"] = 23,["101"] = 40,["102"] = 41,["104"] = 42,["105"] = 42,["106"] = 43,["107"] = 42,["110"] = 45,["111"] = 40,["112"] = 48,["113"] = 49,["115"] = 50,["116"] = 50,["118"] = 51,["119"] = 52,["120"] = 53,["121"] = 54,["123"] = 56,["124"] = 57,["125"] = 58,["126"] = 59,["127"] = 59,["128"] = 59,["129"] = 59,["130"] = 59,["131"] = 59,["132"] = 59,["133"] = 59,["134"] = 59,["135"] = 59,["136"] = 59,["137"] = 60,["138"] = 61,["139"] = 61,["140"] = 61,["141"] = 61,["142"] = 61,["143"] = 61,["144"] = 61,["145"] = 61,["146"] = 61,["147"] = 61,["148"] = 61,["149"] = 61,["150"] = 61,["151"] = 61,["152"] = 61,["153"] = 61,["154"] = 61,["155"] = 61,["157"] = 63,["158"] = 64,["159"] = 65,["160"] = 65,["161"] = 65,["162"] = 65,["163"] = 65,["164"] = 65,["165"] = 65,["166"] = 66,["167"] = 66,["168"] = 67,["169"] = 67,["170"] = 67,["171"] = 66,["172"] = 68,["173"] = 68,["174"] = 68,["175"] = 68,["176"] = 68,["177"] = 68,["178"] = 66,["179"] = 69,["180"] = 69,["181"] = 69,["182"] = 69,["183"] = 69,["184"] = 69,["185"] = 66,["186"] = 70,["187"] = 70,["188"] = 70,["189"] = 66,["190"] = 66,["194"] = 50,["197"] = 74,["198"] = 48,["199"] = 77,["200"] = 78,["201"] = 79,["202"] = 80,["203"] = 80,["205"] = 81,["207"] = 83,["209"] = 84,["210"] = 84,["211"] = 85,["212"] = 85,["213"] = 85,["214"] = 85,["215"] = 86,["216"] = 87,["217"] = 88,["218"] = 88,["219"] = 88,["220"] = 88,["221"] = 88,["222"] = 88,["223"] = 88,["224"] = 88,["225"] = 88,["226"] = 88,["227"] = 88,["228"] = 89,["229"] = 90,["230"] = 90,["231"] = 90,["232"] = 90,["233"] = 90,["234"] = 90,["235"] = 90,["236"] = 90,["237"] = 90,["238"] = 90,["239"] = 90,["240"] = 90,["241"] = 90,["242"] = 90,["243"] = 90,["244"] = 90,["245"] = 90,["246"] = 90,["247"] = 90,["248"] = 90,["249"] = 90,["250"] = 91,["251"] = 93,["252"] = 93,["253"] = 93,["254"] = 93,["255"] = 94,["256"] = 94,["257"] = 94,["258"] = 93,["259"] = 93,["260"] = 94,["261"] = 94,["262"] = 94,["263"] = 93,["264"] = 93,["265"] = 95,["266"] = 95,["267"] = 95,["268"] = 93,["269"] = 93,["270"] = 95,["271"] = 95,["272"] = 95,["273"] = 93,["274"] = 93,["275"] = 96,["276"] = 96,["277"] = 96,["278"] = 92,["279"] = 93,["280"] = 93,["281"] = 93,["283"] = 98,["284"] = 99,["286"] = 101,["287"] = 102,["288"] = 102,["289"] = 102,["290"] = 102,["291"] = 103,["292"] = 103,["293"] = 103,["294"] = 103,["298"] = 106,["299"] = 77,["300"] = 109,["301"] = 110,["302"] = 109,["303"] = 5});
local ____exports = {}
____exports.ClientApiCodec = __TS__Class()
local ClientApiCodec = ____exports.ClientApiCodec
ClientApiCodec.name = "ClientApiCodec"
function ClientApiCodec.prototype.____constructor(self)
end
function ClientApiCodec.Encode(self, input)
    local bytes = self:StringToBytes(input)
    local output = ""
    do
        local i = 0
        while i < #bytes do
            local first = bytes[i + 1]
            local second = i + 1 < #bytes and bytes[i + 1 + 1] or 0
            local third = i + 2 < #bytes and bytes[i + 2 + 1] or 0
            local value = bit.bor(
                bit.bor(
                    bit.lshift(first, 16),
                    bit.lshift(second, 8)
                ),
                third
            )
            output = output .. __TS__StringCharAt(
                self.BASE64URL_ALPHABET,
                bit.band(
                    bit.rshift(value, 18),
                    63
                )
            )
            output = output .. __TS__StringCharAt(
                self.BASE64URL_ALPHABET,
                bit.band(
                    bit.rshift(value, 12),
                    63
                )
            )
            if i + 1 < #bytes then
                output = output .. __TS__StringCharAt(
                    self.BASE64URL_ALPHABET,
                    bit.band(
                        bit.rshift(value, 6),
                        63
                    )
                )
            end
            if i + 2 < #bytes then
                output = output .. __TS__StringCharAt(
                    self.BASE64URL_ALPHABET,
                    bit.band(value, 63)
                )
            end
            i = i + 3
        end
    end
    return output
end
function ClientApiCodec.Decode(self, input)
    local bytes = {}
    local accumulator = 0
    local bits = 0
    do
        local i = 0
        while i < #input do
            do
                local value = (string.find(
                    self.BASE64URL_ALPHABET,
                    __TS__StringCharAt(input, i),
                    nil,
                    true
                ) or 0) - 1
                if value < 0 then
                    goto __continue8
                end
                accumulator = bit.bor(
                    bit.lshift(accumulator, 6),
                    value
                )
                bits = bits + 6
                if bits >= 8 then
                    bits = bits - 8
                    bytes[#bytes + 1] = bit.band(
                        bit.rshift(accumulator, bits),
                        255
                    )
                end
            end
            ::__continue8::
            i = i + 1
        end
    end
    return self:BytesToString(bytes)
end
function ClientApiCodec.Chunk(self, input, chunkSize)
    local chunks = {}
    do
        local offset = 0
        while offset < #input do
            chunks[#chunks + 1] = __TS__StringSubstring(input, offset, offset + chunkSize)
            offset = offset + chunkSize
        end
    end
    return #chunks > 0 and chunks or ({""})
end
function ClientApiCodec.StringToBytes(self, input)
    local bytes = {}
    do
        local i = 0
        while i < #input do
            do
                local code = __TS__StringCharCodeAt(input, i)
                if self:IsLuaRuntime() then
                    bytes[#bytes + 1] = code
                    goto __continue14
                end
                if code < 128 then
                    bytes[#bytes + 1] = code
                elseif code < 2048 then
                    __TS__ArrayPush(
                        bytes,
                        bit.bor(
                            192,
                            bit.rshift(code, 6)
                        ),
                        bit.bor(
                            128,
                            bit.band(code, 63)
                        )
                    )
                elseif code < 55296 or code >= 57344 then
                    __TS__ArrayPush(
                        bytes,
                        bit.bor(
                            224,
                            bit.rshift(code, 12)
                        ),
                        bit.bor(
                            128,
                            bit.band(
                                bit.rshift(code, 6),
                                63
                            )
                        ),
                        bit.bor(
                            128,
                            bit.band(code, 63)
                        )
                    )
                else
                    i = i + 1
                    local next = __TS__StringCharCodeAt(input, i)
                    local point = 65536 + bit.bor(
                        bit.lshift(
                            bit.band(code, 1023),
                            10
                        ),
                        bit.band(next, 1023)
                    )
                    __TS__ArrayPush(
                        bytes,
                        bit.bor(
                            240,
                            bit.rshift(point, 18)
                        ),
                        bit.bor(
                            128,
                            bit.band(
                                bit.rshift(point, 12),
                                63
                            )
                        ),
                        bit.bor(
                            128,
                            bit.band(
                                bit.rshift(point, 6),
                                63
                            )
                        ),
                        bit.bor(
                            128,
                            bit.band(point, 63)
                        )
                    )
                end
            end
            ::__continue14::
            i = i + 1
        end
    end
    return bytes
end
function ClientApiCodec.BytesToString(self, bytes)
    if self:IsLuaRuntime() then
        local raw = ""
        for ____, byte in ipairs(bytes) do
            raw = raw .. string.char(byte)
        end
        return raw
    end
    local output = ""
    do
        local i = 0
        while i < #bytes do
            local ____bytes_1 = bytes
            local ____i_0 = i
            i = ____i_0 + 1
            local first = ____bytes_1[____i_0 + 1]
            local point = first
            if bit.band(first, 224) == 192 and i < #bytes then
                local ____bit_lshift_result_4 = bit.lshift(
                    bit.band(first, 31),
                    6
                )
                local ____bytes_3 = bytes
                local ____i_2 = i
                i = ____i_2 + 1
                point = bit.bor(
                    ____bit_lshift_result_4,
                    bit.band(____bytes_3[____i_2 + 1], 63)
                )
            elseif bit.band(first, 240) == 224 and i + 1 < #bytes then
                local ____bit_lshift_result_7 = bit.lshift(
                    bit.band(first, 15),
                    12
                )
                local ____bytes_6 = bytes
                local ____i_5 = i
                i = ____i_5 + 1
                local ____bit_bor_result_10 = bit.bor(
                    ____bit_lshift_result_7,
                    bit.lshift(
                        bit.band(____bytes_6[____i_5 + 1], 63),
                        6
                    )
                )
                local ____bytes_9 = bytes
                local ____i_8 = i
                i = ____i_8 + 1
                point = bit.bor(
                    ____bit_bor_result_10,
                    bit.band(____bytes_9[____i_8 + 1], 63)
                )
            elseif bit.band(first, 248) == 240 and i + 2 < #bytes then
                local ____bit_lshift_result_13 = bit.lshift(
                    bit.band(first, 7),
                    18
                )
                local ____bytes_12 = bytes
                local ____i_11 = i
                i = ____i_11 + 1
                local ____bit_bor_result_16 = bit.bor(
                    ____bit_lshift_result_13,
                    bit.lshift(
                        bit.band(____bytes_12[____i_11 + 1], 63),
                        12
                    )
                )
                local ____bytes_15 = bytes
                local ____i_14 = i
                i = ____i_14 + 1
                local ____bit_bor_result_19 = bit.bor(
                    ____bit_bor_result_16,
                    bit.lshift(
                        bit.band(____bytes_15[____i_14 + 1], 63),
                        6
                    )
                )
                local ____bytes_18 = bytes
                local ____i_17 = i
                i = ____i_17 + 1
                point = bit.bor(
                    ____bit_bor_result_19,
                    bit.band(____bytes_18[____i_17 + 1], 63)
                )
            end
            if point <= 65535 then
                output = output .. string.char(point)
            else
                local adjusted = point - 65536
                output = output .. string.char(bit.bor(
                    55296,
                    bit.rshift(adjusted, 10)
                ))
                output = output .. string.char(bit.bor(
                    56320,
                    bit.band(adjusted, 1023)
                ))
            end
        end
    end
    return output
end
function ClientApiCodec.IsLuaRuntime(self)
    return type(_VERSION) == "string"
end
ClientApiCodec.BASE64URL_ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"
return ____exports
