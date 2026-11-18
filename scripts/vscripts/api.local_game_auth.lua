local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__StringCharCodeAt = ____lualib.__TS__StringCharCodeAt
local __TS__StringCharAt = ____lualib.__TS__StringCharAt
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api.local_game_auth.lua"
__TS__SourceMapTraceBack("api.local_game_auth.lua", {["12"] = 13,["13"] = 13,["14"] = 13,["16"] = 13,["17"] = 21,["18"] = 22,["19"] = 23,["20"] = 23,["21"] = 23,["23"] = 23,["25"] = 23,["27"] = 26,["28"] = 27,["29"] = 28,["30"] = 29,["32"] = 32,["33"] = 33,["34"] = 34,["35"] = 34,["36"] = 34,["38"] = 34,["40"] = 34,["41"] = 21,["42"] = 37,["43"] = 38,["44"] = 39,["45"] = 40,["47"] = 43,["48"] = 44,["49"] = 45,["51"] = 48,["52"] = 48,["53"] = 48,["54"] = 48,["55"] = 48,["56"] = 48,["57"] = 48,["58"] = 49,["59"] = 50,["60"] = 37,["61"] = 53,["62"] = 54,["63"] = 55,["64"] = 56,["66"] = 59,["67"] = 60,["69"] = 63,["70"] = 64,["72"] = 65,["73"] = 65,["74"] = 66,["75"] = 67,["76"] = 65,["79"] = 70,["80"] = 70,["81"] = 70,["82"] = 70,["83"] = 71,["84"] = 53,["85"] = 74,["86"] = 75,["87"] = 75,["88"] = 75,["89"] = 75,["90"] = 75,["91"] = 75,["92"] = 75,["93"] = 75,["94"] = 75,["95"] = 75,["96"] = 79,["97"] = 79,["98"] = 79,["99"] = 79,["100"] = 79,["101"] = 79,["102"] = 79,["103"] = 79,["104"] = 79,["105"] = 79,["106"] = 79,["107"] = 79,["108"] = 79,["109"] = 79,["110"] = 79,["111"] = 79,["112"] = 79,["113"] = 79,["114"] = 79,["115"] = 79,["116"] = 79,["117"] = 79,["118"] = 79,["119"] = 79,["120"] = 79,["121"] = 79,["122"] = 79,["123"] = 79,["124"] = 79,["125"] = 79,["126"] = 79,["127"] = 79,["128"] = 79,["129"] = 79,["130"] = 79,["131"] = 79,["132"] = 79,["133"] = 79,["134"] = 79,["135"] = 79,["136"] = 79,["137"] = 79,["138"] = 79,["139"] = 79,["140"] = 79,["141"] = 79,["142"] = 79,["143"] = 79,["144"] = 79,["145"] = 79,["146"] = 79,["147"] = 79,["148"] = 79,["149"] = 79,["150"] = 79,["151"] = 79,["152"] = 79,["153"] = 79,["154"] = 79,["155"] = 79,["156"] = 79,["157"] = 79,["158"] = 79,["159"] = 79,["160"] = 79,["161"] = 79,["162"] = 93,["163"] = 94,["164"] = 95,["165"] = 96,["166"] = 97,["169"] = 99,["170"] = 99,["171"] = 100,["172"] = 100,["173"] = 100,["174"] = 100,["175"] = 99,["179"] = 103,["180"] = 103,["181"] = 104,["183"] = 105,["184"] = 105,["185"] = 106,["186"] = 107,["187"] = 108,["188"] = 108,["189"] = 108,["190"] = 108,["191"] = 108,["192"] = 108,["193"] = 108,["194"] = 108,["195"] = 108,["196"] = 108,["197"] = 108,["198"] = 108,["199"] = 105,["203"] = 110,["204"] = 110,["205"] = 111,["206"] = 112,["207"] = 112,["208"] = 112,["209"] = 112,["210"] = 112,["211"] = 112,["212"] = 113,["213"] = 114,["214"] = 114,["215"] = 114,["216"] = 114,["217"] = 114,["218"] = 114,["219"] = 115,["220"] = 110,["223"] = 118,["224"] = 119,["225"] = 120,["226"] = 121,["227"] = 122,["228"] = 123,["229"] = 124,["230"] = 125,["232"] = 127,["233"] = 127,["234"] = 128,["235"] = 128,["236"] = 128,["237"] = 128,["238"] = 128,["239"] = 128,["240"] = 128,["241"] = 129,["242"] = 129,["243"] = 129,["244"] = 129,["245"] = 129,["246"] = 129,["247"] = 129,["248"] = 130,["249"] = 131,["250"] = 131,["251"] = 131,["252"] = 131,["253"] = 131,["254"] = 131,["255"] = 131,["256"] = 132,["257"] = 132,["258"] = 132,["259"] = 132,["260"] = 132,["261"] = 132,["262"] = 132,["263"] = 133,["264"] = 135,["265"] = 136,["266"] = 137,["267"] = 138,["268"] = 139,["269"] = 140,["270"] = 141,["271"] = 142,["272"] = 127,["275"] = 145,["276"] = 146,["277"] = 147,["278"] = 148,["279"] = 149,["280"] = 150,["281"] = 151,["282"] = 152,["283"] = 103,["286"] = 155,["287"] = 156,["288"] = 157,["289"] = 157,["290"] = 157,["291"] = 157,["292"] = 157,["293"] = 157,["294"] = 157,["295"] = 157,["296"] = 157,["297"] = 157,["298"] = 157,["299"] = 157,["300"] = 157,["301"] = 157,["302"] = 157,["303"] = 157,["305"] = 159,["306"] = 74,["307"] = 162,["308"] = 163,["309"] = 163,["310"] = 163,["311"] = 163,["312"] = 163,["313"] = 163,["314"] = 163,["315"] = 162,["316"] = 166,["317"] = 167,["319"] = 168,["320"] = 168,["321"] = 169,["322"] = 170,["323"] = 171,["324"] = 172,["325"] = 173,["326"] = 173,["327"] = 173,["328"] = 173,["329"] = 173,["330"] = 173,["331"] = 173,["332"] = 173,["333"] = 173,["334"] = 173,["335"] = 173,["336"] = 174,["337"] = 175,["338"] = 175,["339"] = 175,["340"] = 175,["341"] = 175,["342"] = 175,["343"] = 175,["344"] = 175,["345"] = 175,["346"] = 175,["347"] = 175,["348"] = 175,["349"] = 175,["350"] = 175,["351"] = 175,["352"] = 175,["353"] = 175,["354"] = 175,["356"] = 177,["357"] = 178,["358"] = 179,["359"] = 179,["360"] = 179,["361"] = 179,["362"] = 179,["363"] = 179,["364"] = 179,["365"] = 180,["366"] = 180,["367"] = 181,["368"] = 181,["369"] = 181,["370"] = 180,["371"] = 182,["372"] = 182,["373"] = 182,["374"] = 182,["375"] = 182,["376"] = 182,["377"] = 180,["378"] = 183,["379"] = 183,["380"] = 183,["381"] = 183,["382"] = 183,["383"] = 183,["384"] = 180,["385"] = 184,["386"] = 184,["387"] = 184,["388"] = 180,["389"] = 180,["391"] = 168,["394"] = 188,["395"] = 166,["396"] = 191,["397"] = 192,["398"] = 193,["399"] = 194,["400"] = 195,["401"] = 195,["402"] = 195,["403"] = 195,["404"] = 195,["405"] = 195,["406"] = 195,["407"] = 195,["408"] = 195,["409"] = 195,["411"] = 197,["412"] = 191,["413"] = 14,["414"] = 16,["415"] = 17,["416"] = 18});
local ____exports = {}
____exports.LocalGameAuth = __TS__Class()
local LocalGameAuth = ____exports.LocalGameAuth
LocalGameAuth.name = "LocalGameAuth"
function LocalGameAuth.prototype.____constructor(self)
end
function LocalGameAuth.GetSecret(self)
    if self.cachedSecret ~= nil then
        local ____temp_0
        if self.cachedSecret == "" then
            ____temp_0 = nil
        else
            ____temp_0 = self.cachedSecret
        end
        return ____temp_0
    end
    local ok, moduleValue = pcall(nil, require, self.SECRET_MODULE)
    if not ok then
        self.cachedSecret = self.LOCAL_GAME_API_SECRET
        return self.cachedSecret
    end
    local secret = moduleValue and moduleValue.LOCAL_GAME_API_SECRET
    self.cachedSecret = type(secret) == "string" and secret or self.LOCAL_GAME_API_SECRET
    local ____temp_3
    if self.cachedSecret == "" then
        ____temp_3 = nil
    else
        ____temp_3 = self.cachedSecret
    end
    return ____temp_3
end
function LocalGameAuth.SignGameEnd(self, gameEnd)
    local secret = self:GetSecret()
    if not secret then
        return nil
    end
    local timestamp = gameEnd.localKeyTimestamp
    if timestamp == nil then
        return nil
    end
    local steamIds = table.concat(
        __TS__ArrayMap(
            gameEnd.players,
            function(____, player) return tostring(player.steamId) end
        ),
        ","
    )
    local payload = (((((tostring(gameEnd.matchId) .. "|") .. tostring(timestamp)) .. "|") .. tostring(gameEnd.winnerTeamId)) .. "|") .. steamIds
    return self:HmacSha256Hex(secret, payload)
end
function LocalGameAuth.HmacSha256Hex(self, key, message)
    local keyBytes = self:StringToBytes(key)
    if #keyBytes > self.SHA256_BLOCK_SIZE then
        keyBytes = self:Sha256Bytes(keyBytes)
    end
    while #keyBytes < self.SHA256_BLOCK_SIZE do
        keyBytes[#keyBytes + 1] = 0
    end
    local outerKeyPad = {}
    local innerKeyPad = {}
    do
        local i = 0
        while i < self.SHA256_BLOCK_SIZE do
            outerKeyPad[#outerKeyPad + 1] = bit.bxor(keyBytes[i + 1], 92)
            innerKeyPad[#innerKeyPad + 1] = bit.bxor(keyBytes[i + 1], 54)
            i = i + 1
        end
    end
    local innerHash = self:Sha256Bytes(__TS__ArrayConcat(
        innerKeyPad,
        self:StringToBytes(message)
    ))
    return self:BytesToHex(self:Sha256Bytes(__TS__ArrayConcat(outerKeyPad, innerHash)))
end
function LocalGameAuth.Sha256Bytes(self, bytes)
    local h = {
        1779033703,
        3144134277,
        1013904242,
        2773480762,
        1359893119,
        2600822924,
        528734635,
        1541459225
    }
    local k = {
        1116352408,
        1899447441,
        3049323471,
        3921009573,
        961987163,
        1508970993,
        2453635748,
        2870763221,
        3624381080,
        310598401,
        607225278,
        1426881987,
        1925078388,
        2162078206,
        2614888103,
        3248222580,
        3835390401,
        4022224774,
        264347078,
        604807628,
        770255983,
        1249150122,
        1555081692,
        1996064986,
        2554220882,
        2821834349,
        2952996808,
        3210313671,
        3336571891,
        3584528711,
        113926993,
        338241895,
        666307205,
        773529912,
        1294757372,
        1396182291,
        1695183700,
        1986661051,
        2177026350,
        2456956037,
        2730485921,
        2820302411,
        3259730800,
        3345764771,
        3516065817,
        3600352804,
        4094571909,
        275423344,
        430227734,
        506948616,
        659060556,
        883997877,
        958139571,
        1322822218,
        1537002063,
        1747873779,
        1955562222,
        2024104815,
        2227730452,
        2361852424,
        2428436474,
        2756734187,
        3204031479,
        3329325298
    }
    local bitLength = #bytes * 8
    local data = __TS__ArraySlice(bytes)
    data[#data + 1] = 128
    while #data % 64 ~= 56 do
        data[#data + 1] = 0
    end
    do
        local i = 7
        while i >= 0 do
            data[#data + 1] = bit.band(
                math.floor(bitLength / 2 ^ (i * 8)),
                255
            )
            i = i - 1
        end
    end
    do
        local offset = 0
        while offset < #data do
            local w = {}
            do
                local i = 0
                while i < 16 do
                    local j = offset + i * 4
                    w[i + 1] = bit.rshift(
                        bit.bor(
                            bit.bor(
                                bit.bor(
                                    bit.lshift(data[j + 1], 24),
                                    bit.lshift(data[j + 1 + 1], 16)
                                ),
                                bit.lshift(data[j + 2 + 1], 8)
                            ),
                            data[j + 3 + 1]
                        ),
                        0
                    )
                    i = i + 1
                end
            end
            do
                local i = 16
                while i < 64 do
                    local s0 = bit.bxor(
                        bit.bxor(
                            self:RightRotate(w[i - 15 + 1], 7),
                            self:RightRotate(w[i - 15 + 1], 18)
                        ),
                        bit.rshift(w[i - 15 + 1], 3)
                    )
                    local s1 = bit.bxor(
                        bit.bxor(
                            self:RightRotate(w[i - 2 + 1], 17),
                            self:RightRotate(w[i - 2 + 1], 19)
                        ),
                        bit.rshift(w[i - 2 + 1], 10)
                    )
                    w[i + 1] = bit.rshift(w[i - 16 + 1] + s0 + w[i - 7 + 1] + s1, 0)
                    i = i + 1
                end
            end
            local a = h[1]
            local b = h[2]
            local c = h[3]
            local d = h[4]
            local e = h[5]
            local f = h[6]
            local g = h[7]
            local hh = h[8]
            do
                local i = 0
                while i < 64 do
                    local s1 = bit.bxor(
                        bit.bxor(
                            self:RightRotate(e, 6),
                            self:RightRotate(e, 11)
                        ),
                        self:RightRotate(e, 25)
                    )
                    local ch = bit.bxor(
                        bit.band(e, f),
                        bit.band(
                            bit.bnot(e),
                            g
                        )
                    )
                    local temp1 = bit.rshift(hh + s1 + ch + k[i + 1] + w[i + 1], 0)
                    local s0 = bit.bxor(
                        bit.bxor(
                            self:RightRotate(a, 2),
                            self:RightRotate(a, 13)
                        ),
                        self:RightRotate(a, 22)
                    )
                    local maj = bit.bxor(
                        bit.bxor(
                            bit.band(a, b),
                            bit.band(a, c)
                        ),
                        bit.band(b, c)
                    )
                    local temp2 = bit.rshift(s0 + maj, 0)
                    hh = g
                    g = f
                    f = e
                    e = bit.rshift(d + temp1, 0)
                    d = c
                    c = b
                    b = a
                    a = bit.rshift(temp1 + temp2, 0)
                    i = i + 1
                end
            end
            h[1] = bit.rshift(h[1] + a, 0)
            h[2] = bit.rshift(h[2] + b, 0)
            h[3] = bit.rshift(h[3] + c, 0)
            h[4] = bit.rshift(h[4] + d, 0)
            h[5] = bit.rshift(h[5] + e, 0)
            h[6] = bit.rshift(h[6] + f, 0)
            h[7] = bit.rshift(h[7] + g, 0)
            h[8] = bit.rshift(h[8] + hh, 0)
            offset = offset + 64
        end
    end
    local result = {}
    for ____, word in ipairs(h) do
        __TS__ArrayPush(
            result,
            bit.band(
                bit.rshift(word, 24),
                255
            ),
            bit.band(
                bit.rshift(word, 16),
                255
            ),
            bit.band(
                bit.rshift(word, 8),
                255
            ),
            bit.band(word, 255)
        )
    end
    return __TS__ArraySlice(result, 0, self.SHA256_OUTPUT_SIZE)
end
function LocalGameAuth.RightRotate(self, value, bits)
    return bit.rshift(
        bit.bor(
            bit.rshift(value, bits),
            bit.lshift(value, 32 - bits)
        ),
        0
    )
end
function LocalGameAuth.StringToBytes(self, input)
    local bytes = {}
    do
        local i = 0
        while i < #input do
            local code = __TS__StringCharCodeAt(input, i)
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
            i = i + 1
        end
    end
    return bytes
end
function LocalGameAuth.BytesToHex(self, bytes)
    local hex = "0123456789abcdef"
    local output = ""
    for ____, byte in ipairs(bytes) do
        output = output .. __TS__StringCharAt(
            hex,
            bit.band(
                bit.rshift(byte, 4),
                15
            )
        ) .. __TS__StringCharAt(
            hex,
            bit.band(byte, 15)
        )
    end
    return output
end
LocalGameAuth.SECRET_MODULE = "local_game_secret"
LocalGameAuth.LOCAL_GAME_API_SECRET = "e16bc81b4064ecc4271194bc5d1801bdfc4dc8ad1e2e52b504e984690a347b1d"
LocalGameAuth.SHA256_BLOCK_SIZE = 64
LocalGameAuth.SHA256_OUTPUT_SIZE = 32
return ____exports
