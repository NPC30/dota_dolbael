local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSlice = ____lualib.__TS__StringSlice
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__NumberIsFinite = ____lualib.__TS__NumberIsFinite
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__Number = ____lualib.__TS__Number
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__ParseFloat = ____lualib.__TS__ParseFloat
local __TS__NumberIsNaN = ____lualib.__TS__NumberIsNaN
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "api/api-client.lua"
__TS__SourceMapTraceBack("api/api-client.lua", {["17"] = 2,["18"] = 2,["19"] = 3,["20"] = 3,["21"] = 6,["22"] = 7,["23"] = 8,["24"] = 9,["25"] = 10,["26"] = 27,["27"] = 27,["28"] = 27,["30"] = 27,["31"] = 39,["32"] = 40,["33"] = 39,["34"] = 43,["35"] = 44,["36"] = 43,["37"] = 47,["38"] = 48,["39"] = 48,["41"] = 49,["42"] = 47,["43"] = 54,["44"] = 55,["45"] = 56,["46"] = 54,["47"] = 59,["48"] = 60,["49"] = 61,["50"] = 59,["51"] = 64,["52"] = 65,["53"] = 64,["54"] = 68,["55"] = 69,["58"] = 72,["59"] = 68,["60"] = 75,["61"] = 76,["62"] = 75,["63"] = 84,["64"] = 85,["65"] = 84,["66"] = 88,["67"] = 89,["68"] = 90,["70"] = 93,["71"] = 88,["72"] = 96,["73"] = 97,["74"] = 98,["75"] = 96,["76"] = 101,["77"] = 102,["78"] = 103,["79"] = 101,["80"] = 106,["81"] = 107,["82"] = 108,["83"] = 109,["85"] = 112,["86"] = 106,["87"] = 115,["88"] = 120,["91"] = 124,["92"] = 125,["93"] = 126,["94"] = 126,["95"] = 126,["96"] = 126,["97"] = 127,["98"] = 128,["99"] = 128,["100"] = 130,["101"] = 131,["102"] = 131,["103"] = 131,["105"] = 127,["106"] = 115,["107"] = 140,["108"] = 141,["109"] = 142,["110"] = 143,["112"] = 146,["113"] = 147,["115"] = 150,["116"] = 151,["118"] = 154,["119"] = 140,["120"] = 157,["121"] = 158,["122"] = 159,["123"] = 160,["125"] = 163,["126"] = 157,["127"] = 166,["128"] = 167,["129"] = 166,["130"] = 170,["131"] = 171,["132"] = 170,["133"] = 178,["134"] = 183,["135"] = 184,["137"] = 186,["138"] = 188,["139"] = 188,["140"] = 188,["142"] = 188,["144"] = 187,["145"] = 189,["146"] = 190,["148"] = 192,["149"] = 196,["150"] = 197,["151"] = 199,["152"] = 199,["153"] = 200,["154"] = 200,["155"] = 200,["157"] = 201,["158"] = 201,["159"] = 201,["161"] = 202,["162"] = 202,["163"] = 202,["165"] = 200,["167"] = 203,["168"] = 203,["169"] = 203,["171"] = 204,["172"] = 204,["173"] = 204,["175"] = 205,["176"] = 205,["177"] = 205,["179"] = 203,["181"] = 198,["182"] = 206,["183"] = 206,["184"] = 206,["185"] = 206,["186"] = 207,["187"] = 208,["188"] = 208,["189"] = 208,["190"] = 208,["191"] = 212,["192"] = 178,["193"] = 215,["194"] = 216,["195"] = 217,["196"] = 218,["197"] = 219,["198"] = 220,["199"] = 221,["201"] = 224,["202"] = 225,["203"] = 226,["204"] = 227,["205"] = 228,["206"] = 229,["207"] = 231,["208"] = 232,["210"] = 236,["211"] = 236,["212"] = 236,["213"] = 236,["214"] = 236,["215"] = 236,["216"] = 236,["217"] = 236,["218"] = 239,["220"] = 242,["221"] = 242,["222"] = 242,["223"] = 242,["224"] = 242,["225"] = 242,["226"] = 242,["227"] = 242,["228"] = 215,["229"] = 245,["230"] = 253,["231"] = 245,["232"] = 274,["233"] = 275,["234"] = 275,["235"] = 275,["236"] = 275,["237"] = 275,["238"] = 275,["239"] = 275,["240"] = 275,["241"] = 275,["242"] = 275,["243"] = 275,["244"] = 275,["245"] = 275,["246"] = 275,["247"] = 276,["248"] = 274,["249"] = 279,["250"] = 280,["251"] = 279,["252"] = 283,["253"] = 291,["255"] = 292,["256"] = 292,["257"] = 293,["258"] = 292,["262"] = 295,["263"] = 295,["264"] = 296,["265"] = 295,["268"] = 298,["269"] = 300,["270"] = 283,["271"] = 303,["272"] = 304,["273"] = 305,["274"] = 306,["277"] = 310,["278"] = 311,["279"] = 312,["280"] = 312,["281"] = 312,["282"] = 312,["285"] = 315,["286"] = 316,["287"] = 317,["288"] = 318,["289"] = 318,["290"] = 318,["291"] = 318,["294"] = 322,["295"] = 323,["296"] = 324,["297"] = 325,["298"] = 326,["299"] = 326,["300"] = 326,["301"] = 326,["303"] = 326,["305"] = 326,["309"] = 330,["310"] = 330,["311"] = 330,["312"] = 330,["313"] = 316,["314"] = 303,["315"] = 334,["317"] = 338,["318"] = 339,["319"] = 340,["320"] = 341,["321"] = 342,["322"] = 344,["323"] = 345,["324"] = 345,["325"] = 345,["326"] = 345,["327"] = 351,["328"] = 352,["329"] = 353,["332"] = 356,["333"] = 358,["334"] = 359,["335"] = 360,["338"] = 363,["339"] = 364,["340"] = 365,["341"] = 366,["344"] = 369,["345"] = 370,["346"] = 370,["347"] = 370,["348"] = 370,["350"] = 372,["351"] = 373,["352"] = 372,["354"] = 334,["355"] = 377,["356"] = 378,["359"] = 381,["360"] = 382,["361"] = 383,["362"] = 383,["363"] = 384,["364"] = 384,["365"] = 384,["366"] = 386,["367"] = 386,["368"] = 386,["369"] = 386,["370"] = 390,["371"] = 391,["372"] = 392,["373"] = 393,["374"] = 394,["375"] = 395,["378"] = 398,["379"] = 399,["380"] = 400,["381"] = 400,["382"] = 400,["383"] = 400,["384"] = 401,["386"] = 403,["387"] = 404,["389"] = 409,["391"] = 412,["392"] = 412,["394"] = 412,["399"] = 384,["400"] = 384,["401"] = 383,["402"] = 418,["403"] = 377,["404"] = 421,["405"] = 452,["406"] = 422,["409"] = 425,["410"] = 426,["411"] = 427,["412"] = 428,["413"] = 429,["414"] = 430,["415"] = 431,["416"] = 433,["417"] = 434,["420"] = 437,["421"] = 438,["424"] = 441,["425"] = 442,["426"] = 443,["428"] = 447,["430"] = 448,["431"] = 448,["433"] = 448,["436"] = 433,["437"] = 452,["438"] = 453,["441"] = 457,["442"] = 457,["443"] = 458,["444"] = 458,["445"] = 459,["447"] = 460,["448"] = 460,["450"] = 460,["452"] = 462,["453"] = 462,["454"] = 462,["455"] = 462,["456"] = 463,["459"] = 466,["460"] = 467,["462"] = 477,["463"] = 477,["464"] = 477,["465"] = 477,["466"] = 481,["467"] = 482,["468"] = 483,["469"] = 487,["471"] = 489,["474"] = 492,["475"] = 493,["477"] = 462,["478"] = 462,["479"] = 497,["482"] = 500,["483"] = 501,["484"] = 502,["485"] = 503,["487"] = 511,["490"] = 515,["491"] = 516,["492"] = 516,["493"] = 516,["494"] = 519,["495"] = 520,["498"] = 523,["499"] = 524,["500"] = 531,["501"] = 516,["502"] = 516,["504"] = 452,["505"] = 536,["506"] = 421,["507"] = 539,["508"] = 544,["509"] = 545,["510"] = 546,["511"] = 547,["512"] = 550,["513"] = 551,["514"] = 551,["515"] = 551,["516"] = 551,["518"] = 559,["519"] = 560,["520"] = 561,["521"] = 562,["522"] = 563,["523"] = 564,["524"] = 565,["525"] = 565,["526"] = 565,["527"] = 565,["528"] = 569,["529"] = 570,["530"] = 571,["531"] = 575,["533"] = 578,["534"] = 578,["535"] = 578,["536"] = 578,["537"] = 578,["538"] = 578,["539"] = 578,["541"] = 581,["542"] = 581,["543"] = 581,["544"] = 581,["545"] = 581,["546"] = 581,["547"] = 581,["548"] = 539,["549"] = 584,["550"] = 591,["551"] = 592,["552"] = 593,["553"] = 594,["554"] = 595,["555"] = 596,["556"] = 597,["557"] = 598,["559"] = 600,["560"] = 601,["562"] = 607,["563"] = 608,["564"] = 609,["567"] = 612,["568"] = 613,["569"] = 614,["570"] = 615,["571"] = 616,["573"] = 618,["574"] = 619,["575"] = 619,["576"] = 619,["577"] = 619,["579"] = 621,["580"] = 622,["581"] = 621,["582"] = 584,["583"] = 28,["584"] = 29,["585"] = 30,["586"] = 34,["587"] = 37,["588"] = 52});
local ____exports = {}
local ____api_2Elocal_game_auth = require("api.local_game_auth")
local LocalGameAuth = ____api_2Elocal_game_auth.LocalGameAuth
local ____client_2Dapi_2Dtransport = require("api.client-api-transport")
local ClientApiTransport = ____client_2Dapi_2Dtransport.ClientApiTransport
____exports.HttpMethod = HttpMethod or ({})
____exports.HttpMethod.GET = "GET"
____exports.HttpMethod.POST = "POST"
____exports.HttpMethod.PUT = "PUT"
____exports.HttpMethod.DELETE = "DELETE"
____exports.ApiClient = __TS__Class()
local ApiClient = ____exports.ApiClient
ApiClient.name = "ApiClient"
function ApiClient.prototype.____constructor(self)
end
function ApiClient.SetSimulateHttpUnavailableForTools(self, enabled)
    self.simulateHttpUnavailableForTools = enabled
end
function ApiClient.IsSimulatingHttpUnavailableForTools(self)
    return IsInToolsMode() and self.simulateHttpUnavailableForTools
end
function ApiClient.CreateHttpRequest(self, method, url)
    if self:IsSimulatingHttpUnavailableForTools() then
        return nil
    end
    return CreateHTTPRequestScriptVM(method, url)
end
function ApiClient.GetServerAuthKey(self, _host)
    local keyVersion = "v2"
    return GetDedicatedServerKeyV3(keyVersion)
end
function ApiClient.IsLocalhost(self)
    local apiKey = self:GetServerAuthKey()
    return apiKey == ____exports.ApiClient.LOCAL_APIKEY and not IsInToolsMode()
end
function ApiClient.ShouldLogApiOutput(self, silent)
    return not silent and IsInToolsMode()
end
function ApiClient.DebugLog(self, message, silent)
    if not self:ShouldLogApiOutput(silent) then
        return
    end
    print(message)
end
function ApiClient.IsLocalGameEnd(self, apiParameter, serverAuthKey)
    return serverAuthKey == ____exports.ApiClient.LOCAL_APIKEY and not IsInToolsMode() and apiParameter.method == ____exports.HttpMethod.POST and apiParameter.path == "/game/end"
end
function ApiClient.IsGameEndRequest(self, apiParameter)
    return apiParameter.method == ____exports.HttpMethod.POST and apiParameter.path == "/game/end"
end
function ApiClient.DescribeServerAuthKey(self, serverAuthKey)
    if __TS__StringStartsWith(serverAuthKey, "Invalid_") then
        return serverAuthKey
    end
    return ("[dedicated key redacted, length=" .. tostring(#serverAuthKey)) .. "]"
end
function ApiClient.GetGameEndPhase(self, apiParameter)
    local body = apiParameter.body
    return (body and body.isAbyssProgress) == true and "progress" or "final"
end
function ApiClient.GetGameEndWave(self, apiParameter)
    local body = apiParameter.body
    return body and body.abyssWave or "none"
end
function ApiClient.DescribeResponseBody(self, body)
    local maxLength = 512
    if #body <= maxLength then
        return body
    end
    return ((__TS__StringSlice(body, 0, maxLength) .. "...[truncated,length=") .. tostring(#body)) .. "]"
end
function ApiClient.LogGameEndRequestDiagnostics(self, apiParameter, serverAuthKey, isLocalGame)
    if not self:IsGameEndRequest(apiParameter) then
        return
    end
    local body = apiParameter.body
    local players = body and body.players or ({})
    local zeroSteamIdCount = #__TS__ArrayFilter(
        players,
        function(____, player) return player.steamId == 0 end
    )
    local ____print_14 = print
    local ____temp_11 = self:GetGameEndPhase(apiParameter)
    local ____temp_12 = self:GetGameEndWave(apiParameter)
    local ____temp_13 = body and body.matchId or "none"
    local ____temp_10 = body and body.isAbyssProgress
    if ____temp_10 == nil then
        ____temp_10 = "none"
    end
    ____print_14((((((((((((((((("[GameEndAPI] request: phase=" .. ____temp_11) .. ", wave=") .. tostring(____temp_12)) .. ", matchId=") .. ____temp_13) .. ", isAbyssProgress=") .. tostring(____temp_10)) .. ", playerCount=") .. tostring(#players)) .. ", zeroSteamIdCount=") .. tostring(zeroSteamIdCount)) .. ", toolsMode=") .. tostring(IsInToolsMode())) .. ", GetDedicatedServerKeyV3('v2')=") .. self:DescribeServerAuthKey(serverAuthKey)) .. ", localHmac=") .. tostring(isLocalGame))
end
function ApiClient.GetCurrentUnixTimeFromSystem(self)
    local systemTimeMS = GetSystemTimeMS()
    if not __TS__NumberIsFinite(systemTimeMS) then
        return nil
    end
    if systemTimeMS > 1000000000000 then
        return math.floor(systemTimeMS / 1000)
    end
    if systemTimeMS > 1000000000 then
        return math.floor(systemTimeMS)
    end
    return nil
end
function ApiClient.GetFallbackLocalKeyTimestamp(self)
    local localTimestamp = self:GetCurrentUnixTimeFromLocalDateTime()
    if localTimestamp ~= nil then
        return localTimestamp
    end
    return 0
end
function ApiClient.GetLocalGameEndTimestamp(self)
    return self:GetCurrentUnixTimeFromSystem() or self:GetFallbackLocalKeyTimestamp()
end
function ApiClient.IsTreasureRequest(self, apiParameter)
    return apiParameter.method == ____exports.HttpMethod.POST and (apiParameter.path == "/game/treasure/prepare" or apiParameter.path == "/game/treasure/claim")
end
function ApiClient.SetTreasureAuthHeaders(self, request, apiParameter, serverAuthKey)
    if not self:IsTreasureRequest(apiParameter) then
        return true
    end
    local timestamp = self:GetLocalGameEndTimestamp()
    local ____temp_15
    if serverAuthKey == ____exports.ApiClient.LOCAL_APIKEY then
        ____temp_15 = LocalGameAuth:GetSecret()
    else
        ____temp_15 = serverAuthKey
    end
    local signingKey = ____temp_15
    if not signingKey or timestamp <= 0 then
        return false
    end
    local nonce = (((tostring(timestamp) .. "_") .. tostring(RandomInt(100000000, 999999999))) .. "_") .. tostring(RandomInt(100000000, 999999999))
    local body = apiParameter.body or ({})
    local canonicalPath = "/api" .. apiParameter.path
    local ____temp_22
    if apiParameter.path == "/game/treasure/prepare" then
        local ____body_steamId_16 = body.steamId
        if ____body_steamId_16 == nil then
            ____body_steamId_16 = ""
        end
        local ____body_matchId_17 = body.matchId
        if ____body_matchId_17 == nil then
            ____body_matchId_17 = ""
        end
        local ____body_heroName_18 = body.heroName
        if ____body_heroName_18 == nil then
            ____body_heroName_18 = ""
        end
        ____temp_22 = (((((((((tostring(timestamp) .. "|") .. nonce) .. "|") .. canonicalPath) .. "|") .. tostring(____body_steamId_16)) .. "|") .. tostring(____body_matchId_17)) .. "|") .. tostring(____body_heroName_18)
    else
        local ____body_steamId_19 = body.steamId
        if ____body_steamId_19 == nil then
            ____body_steamId_19 = ""
        end
        local ____body_openId_20 = body.openId
        if ____body_openId_20 == nil then
            ____body_openId_20 = ""
        end
        local ____body_selectedRewardCode_21 = body.selectedRewardCode
        if ____body_selectedRewardCode_21 == nil then
            ____body_selectedRewardCode_21 = ""
        end
        ____temp_22 = (((((((((tostring(timestamp) .. "|") .. nonce) .. "|") .. canonicalPath) .. "|") .. tostring(____body_steamId_19)) .. "|") .. tostring(____body_openId_20)) .. "|") .. tostring(____body_selectedRewardCode_21)
    end
    local canonical = ____temp_22
    request:SetHTTPRequestHeaderValue(
        "x-game-timestamp",
        tostring(timestamp)
    )
    request:SetHTTPRequestHeaderValue("x-game-nonce", nonce)
    request:SetHTTPRequestHeaderValue(
        "x-game-signature",
        LocalGameAuth:HmacSha256Hex(signingKey, canonical)
    )
    return true
end
function ApiClient.GetCurrentUnixTimeFromLocalDateTime(self)
    local date = GetSystemDate()
    local time = GetSystemTime()
    local dateParts = __TS__StringSplit(date, "/")
    local timeParts = __TS__StringSplit(time, ":")
    if #dateParts ~= 3 or #timeParts ~= 3 then
        return nil
    end
    local month = __TS__Number(dateParts[1])
    local day = __TS__Number(dateParts[2])
    local year = __TS__Number(dateParts[3])
    local hour = __TS__Number(timeParts[1])
    local minute = __TS__Number(timeParts[2])
    local second = __TS__Number(timeParts[3])
    if year < 100 then
        year = year + 2000
    end
    if not self:IsValidDateTimePart(
        year,
        month,
        day,
        hour,
        minute,
        second
    ) or day > self:GetDaysInMonth(year, month) then
        return nil
    end
    return self:UtcTimestampFromParts(
        year,
        month,
        day,
        hour - 8,
        minute,
        second
    )
end
function ApiClient.IsValidDateTimePart(self, year, month, day, hour, minute, second)
    return __TS__NumberIsFinite(year) and __TS__NumberIsFinite(month) and __TS__NumberIsFinite(day) and __TS__NumberIsFinite(hour) and __TS__NumberIsFinite(minute) and __TS__NumberIsFinite(second) and year >= 2020 and year <= 2100 and month >= 1 and month <= 12 and day >= 1 and hour >= 0 and hour <= 23 and minute >= 0 and minute <= 59 and second >= 0 and second <= 59
end
function ApiClient.GetDaysInMonth(self, year, month)
    local days = {
        31,
        self:IsLeapYear(year) and 29 or 28,
        31,
        30,
        31,
        30,
        31,
        31,
        30,
        31,
        30,
        31
    }
    return days[month]
end
function ApiClient.IsLeapYear(self, year)
    return year % 4 == 0 and year % 100 ~= 0 or year % 400 == 0
end
function ApiClient.UtcTimestampFromParts(self, year, month, day, hour, minute, second)
    local days = 0
    do
        local y = 1970
        while y < year do
            days = days + (self:IsLeapYear(y) and 366 or 365)
            y = y + 1
        end
    end
    do
        local m = 1
        while m < month do
            days = days + self:GetDaysInMonth(year, m)
            m = m + 1
        end
    end
    days = days + (day - 1)
    return days * 86400 + hour * 3600 + minute * 60 + second
end
function ApiClient.FetchCurrentUnixTime(self, callback)
    local systemTimestamp = self:GetCurrentUnixTimeFromSystem()
    if systemTimestamp ~= nil then
        callback(nil, systemTimestamp)
        return
    end
    local request = self:CreateHttpRequest("GET", "https://cloudflare.com/cdn-cgi/trace")
    if not request then
        callback(
            nil,
            self:GetFallbackLocalKeyTimestamp()
        )
        return
    end
    request:SetHTTPRequestNetworkActivityTimeout(5)
    request:Send(function(result)
        if result.StatusCode < 200 or result.StatusCode >= 300 then
            callback(
                nil,
                self:GetFallbackLocalKeyTimestamp()
            )
            return
        end
        local lines = __TS__StringSplit(result.Body, "\n")
        for ____, line in ipairs(lines) do
            if __TS__StringStartsWith(line, "ts=") then
                local timestamp = math.floor(__TS__ParseFloat(__TS__StringSubstring(line, 3)))
                local ____callback_24 = callback
                local ____isNaN_result_23
                if __TS__NumberIsNaN(__TS__Number(timestamp)) then
                    ____isNaN_result_23 = nil
                else
                    ____isNaN_result_23 = timestamp
                end
                ____callback_24(nil, ____isNaN_result_23)
                return
            end
        end
        callback(
            nil,
            self:GetFallbackLocalKeyTimestamp()
        )
    end)
end
function ApiClient.send(self, apiParameter, callbackFunc)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local method = apiParameter.method
        local path = apiParameter.path
        local querys = apiParameter.querys
        local body = apiParameter.body
        local timeoutSeconds = apiParameter.timeoutSeconds or ____exports.ApiClient.TIMEOUT_SECONDS
        local host = apiParameter.hostOverride or ____exports.ApiClient.HOST_NAME
        ____exports.ApiClient:DebugLog(
            ((((((("[ApiClient] " .. method) .. " ") .. host) .. path) .. " with querys ") .. json.encode(querys)) .. " body ") .. json.encode(body),
            apiParameter.silent
        )
        local request = self:CreateHttpRequest(method, host .. path)
        if not request then
            callbackFunc(nil, {StatusCode = 0, Body = "http request unavailable"})
            return ____awaiter_resolve(nil)
        end
        local apiKey = self:GetServerAuthKey(host)
        if querys then
            for key in pairs(querys) do
                request:SetHTTPRequestGetOrPostParameter(key, querys[key])
            end
        end
        request:SetHTTPRequestNetworkActivityTimeout(timeoutSeconds)
        request:SetHTTPRequestHeaderValue("x-api-key", apiKey)
        if not self:SetTreasureAuthHeaders(request, apiParameter, apiKey) then
            callbackFunc(nil, {StatusCode = 401, Body = "treasure auth unavailable"})
            return ____awaiter_resolve(nil)
        end
        if body then
            request:SetHTTPRequestRawPostBody(
                "application/json",
                json.encode(body)
            )
        end
        request:Send(function(result)
            callbackFunc(nil, result)
        end)
    end)
end
function ApiClient.sendWithRetry(self, apiParameter)
    if ClientApiTransport:TrySendApiRequest(apiParameter) then
        return
    end
    local retryCount = 0
    local maxRetryTimes = apiParameter.retryTimes or ____exports.ApiClient.RETRY_TIMES
    local retry
    retry = function()
        self:send(
            apiParameter,
            function(____, result)
                ____exports.ApiClient:DebugLog(
                    "[ApiClient] return with status code: " .. tostring(result.StatusCode),
                    apiParameter.silent
                )
                if result.StatusCode >= 200 and result.StatusCode < 300 then
                    ____exports.ApiClient:DebugLog("[ApiClient] success: " .. result.Body, apiParameter.silent)
                    apiParameter:successFunc(result.Body)
                elseif result.StatusCode == 401 then
                    if apiParameter.failureFunc then
                        apiParameter:failureFunc(result.Body)
                    end
                else
                    retryCount = retryCount + 1
                    if retryCount < maxRetryTimes then
                        ____exports.ApiClient:DebugLog(
                            "[ApiClient] getWithRetry retry " .. tostring(retryCount),
                            apiParameter.silent
                        )
                        retry(nil)
                    else
                        if result.StatusCode <= 0 then
                            print((("[ApiClient] server transport unavailable, fallback=client, method=" .. apiParameter.method) .. ", path=") .. apiParameter.path)
                        end
                        if result.StatusCode > 0 or not ClientApiTransport:TrySendApiRequest(apiParameter, true) then
                            local ____this_26
                            ____this_26 = apiParameter
                            local ____opt_25 = ____this_26.failureFunc
                            if ____opt_25 ~= nil then
                                ____opt_25(____this_26, result.Body)
                            end
                        end
                    end
                end
            end
        )
    end
    retry(nil)
end
function ApiClient.sendToBackupHost(self, apiParameter)
    local retry
    if ClientApiTransport:TrySendApiRequest(apiParameter) then
        return
    end
    local backupHost = ____exports.ApiClient.BACK_HOST_NAME
    local attempt = 0
    local activeAttempt = 0
    local completed = false
    local maxRetryTimes = apiParameter.retryTimes or ____exports.ApiClient.RETRY_TIMES
    local timeoutSeconds = apiParameter.timeoutSeconds or ____exports.ApiClient.TIMEOUT_SECONDS
    local useWatchdog = self:IsGameEndRequest(apiParameter)
    local function finishFailure(____, failureBody, transportFailure)
        if completed then
            return
        end
        if attempt < maxRetryTimes then
            retry(nil)
            return
        end
        completed = true
        if transportFailure then
            print((("[ApiClient] server transport unavailable, fallback=client, method=" .. apiParameter.method) .. ", path=") .. apiParameter.path)
        end
        if not transportFailure or not ClientApiTransport:TrySendApiRequest(apiParameter, true) then
            local ____this_28
            ____this_28 = apiParameter
            local ____opt_27 = ____this_28.failureFunc
            if ____opt_27 ~= nil then
                ____opt_27(____this_28, failureBody)
            end
        end
    end
    retry = function()
        if completed then
            return
        end
        attempt = attempt + 1
        local attemptNumber = attempt
        activeAttempt = activeAttempt + 1
        local currentAttempt = activeAttempt
        local attemptFinished = false
        local ____this_30
        ____this_30 = apiParameter
        local ____opt_29 = ____this_30.attemptFunc
        if ____opt_29 ~= nil then
            ____opt_29(____this_30, attemptNumber, maxRetryTimes)
        end
        local accepted = self:sendToHost(
            apiParameter,
            backupHost,
            function(____, result)
                if completed then
                    return
                end
                if self:IsGameEndRequest(apiParameter) then
                    print((((((((((("[GameEndAPI] response: phase=" .. self:GetGameEndPhase(apiParameter)) .. ", wave=") .. tostring(self:GetGameEndWave(apiParameter))) .. ", attempt=") .. tostring(attemptNumber)) .. "/") .. tostring(maxRetryTimes)) .. ", status=") .. tostring(result.StatusCode)) .. ", body=") .. self:DescribeResponseBody(result.Body))
                end
                ____exports.ApiClient:DebugLog(
                    "[ApiClient-back] backup return with status code: " .. tostring(result.StatusCode),
                    apiParameter.silent
                )
                if result.StatusCode >= 200 and result.StatusCode < 300 then
                    completed = true
                    ____exports.ApiClient:DebugLog("[ApiClient-back] backup success: " .. result.Body, apiParameter.silent)
                    apiParameter:successFunc(result.Body)
                else
                    if attemptFinished or currentAttempt ~= activeAttempt then
                        return
                    end
                    attemptFinished = true
                    finishFailure(nil, result.Body, result.StatusCode <= 0)
                end
            end
        )
        if completed or attemptFinished then
            return
        end
        if not accepted then
            attemptFinished = true
            if self:IsGameEndRequest(apiParameter) then
                print((((((("[GameEndAPI] send-rejected: phase=" .. self:GetGameEndPhase(apiParameter)) .. ", wave=") .. tostring(self:GetGameEndWave(apiParameter))) .. ", attempt=") .. tostring(attemptNumber)) .. "/") .. tostring(maxRetryTimes))
            end
            finishFailure(nil, "request send rejected", true)
            return
        end
        if useWatchdog then
            Timers:CreateTimer({
                endTime = timeoutSeconds + 2,
                useGameTime = false,
                callback = function()
                    if completed or attemptFinished or currentAttempt ~= activeAttempt then
                        return
                    end
                    attemptFinished = true
                    print((((((("[GameEndAPI] timeout: phase=" .. self:GetGameEndPhase(apiParameter)) .. ", wave=") .. tostring(self:GetGameEndWave(apiParameter))) .. ", attempt=") .. tostring(attemptNumber)) .. "/") .. tostring(maxRetryTimes))
                    finishFailure(nil, "request callback timeout", true)
                end
            })
        end
    end
    retry(nil)
end
function ApiClient.sendToHost(self, apiParameter, host, callbackFunc)
    local method = apiParameter.method
    local path = apiParameter.path
    local querys = apiParameter.querys
    local body = apiParameter.body
    if not self:IsGameEndRequest(apiParameter) then
        ____exports.ApiClient:DebugLog(
            ((((((("[DEBUGAPI] " .. method) .. " ") .. host) .. path) .. " with querys ") .. json.encode(querys)) .. " body ") .. json.encode(body),
            apiParameter.silent
        )
    end
    local serverAuthKey = self:GetServerAuthKey(host)
    local isLocalGameEnd = self:IsLocalGameEnd(apiParameter, serverAuthKey)
    self:LogGameEndRequestDiagnostics(apiParameter, serverAuthKey, isLocalGameEnd)
    if isLocalGameEnd then
        local localBody = body
        localBody.localKeyTimestamp = self:GetLocalGameEndTimestamp()
        ____exports.ApiClient:DebugLog(
            (("[ApiClient-back] local game/end signing: matchId=" .. localBody.matchId) .. ", localKeyTimestamp=") .. tostring(localBody.localKeyTimestamp),
            apiParameter.silent
        )
        local localApiKey = LocalGameAuth:SignGameEnd(localBody)
        if localApiKey == nil then
            ____exports.ApiClient:DebugLog("[ApiClient-back] local game/end skipped: missing LOCAL_GAME_API_SECRET", apiParameter.silent)
            return false
        end
        return self:sendPreparedToHost(
            apiParameter,
            host,
            localApiKey,
            true,
            callbackFunc
        )
    end
    return self:sendPreparedToHost(
        apiParameter,
        host,
        serverAuthKey,
        false,
        callbackFunc
    )
end
function ApiClient.sendPreparedToHost(self, apiParameter, host, apiKey, isLocalGame, callbackFunc)
    local method = apiParameter.method
    local path = apiParameter.path
    local querys = apiParameter.querys
    local body = apiParameter.body
    local timeoutSeconds = apiParameter.timeoutSeconds or ____exports.ApiClient.TIMEOUT_SECONDS
    local request = self:CreateHttpRequest(method, host .. path)
    if not request then
        return false
    end
    if isLocalGame then
        ____exports.ApiClient:DebugLog(((("[ApiClient-back] local game/end sending: " .. method) .. " ") .. host) .. path, apiParameter.silent)
    end
    if querys then
        for key in pairs(querys) do
            request:SetHTTPRequestGetOrPostParameter(key, querys[key])
        end
    end
    request:SetHTTPRequestNetworkActivityTimeout(timeoutSeconds)
    request:SetHTTPRequestAbsoluteTimeoutMS((timeoutSeconds + 1) * 1000)
    request:SetHTTPRequestHeaderValue("x-api-key", apiKey)
    if isLocalGame then
        request:SetHTTPRequestHeaderValue("x-local-game", "true")
    end
    if body then
        request:SetHTTPRequestRawPostBody(
            "application/json",
            json.encode(body)
        )
    end
    return request:Send(function(result)
        callbackFunc(nil, result)
    end)
end
ApiClient.TIMEOUT_SECONDS = 10
ApiClient.RETRY_TIMES = 3
ApiClient.BACK_HOST_NAME = "https://wx.renoomgai.top/api"
ApiClient.HOST_NAME = "https://windy10v10ai.com/api"
ApiClient.simulateHttpUnavailableForTools = true
ApiClient.LOCAL_APIKEY = "Invalid_NotOnDedicatedServer"
return ____exports
