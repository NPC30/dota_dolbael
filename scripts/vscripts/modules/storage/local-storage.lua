local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack("?", {["7"] = 1,["8"] = 1,["9"] = 16,["10"] = 16,["11"] = 16,["13"] = 16,["14"] = 20,["15"] = 21,["16"] = 22,["17"] = 24,["18"] = 25,["19"] = 26,["20"] = 27,["21"] = 28,["22"] = 29,["23"] = 30,["24"] = 31,["25"] = 32,["26"] = 33,["27"] = 34,["28"] = 35,["29"] = 36,["30"] = 37,["32"] = 40,["33"] = 40,["34"] = 41,["35"] = 42,["36"] = 43,["37"] = 44,["38"] = 40,["41"] = 46,["42"] = 49,["43"] = 50,["44"] = 51,["45"] = 52,["46"] = 53,["47"] = 54,["49"] = 57,["50"] = 20,["51"] = 61,["52"] = 62,["53"] = 63,["54"] = 65,["55"] = 66,["57"] = 69,["58"] = 70,["60"] = 71,["61"] = 71,["62"] = 72,["63"] = 73,["64"] = 73,["65"] = 73,["66"] = 73,["67"] = 73,["68"] = 71,["71"] = 80,["72"] = 81,["73"] = 81,["74"] = 81,["75"] = 80,["76"] = 80,["77"] = 80,["78"] = 80,["79"] = 80,["80"] = 80,["81"] = 80,["82"] = 80,["83"] = 80,["84"] = 80,["85"] = 80,["86"] = 80,["87"] = 80,["88"] = 80,["89"] = 80,["90"] = 96,["91"] = 96,["92"] = 96,["93"] = 96,["94"] = 96,["95"] = 96,["96"] = 80,["97"] = 80,["98"] = 105,["99"] = 61,["100"] = 109,["101"] = 110,["102"] = 111,["103"] = 113,["104"] = 114,["105"] = 115,["106"] = 116,["107"] = 118,["108"] = 109,["109"] = 122,["110"] = 123,["111"] = 124,["112"] = 126,["113"] = 127,["115"] = 130,["116"] = 130,["117"] = 130,["118"] = 130,["119"] = 130,["120"] = 130,["121"] = 122,["122"] = 17});
local ____exports = {}
local ____player = require("api.player")
local MemberLevel = ____player.MemberLevel
____exports.LocalStorage = __TS__Class()
local LocalStorage = ____exports.LocalStorage
LocalStorage.name = "LocalStorage"
function LocalStorage.prototype.____constructor(self)
end
function LocalStorage.SavePlayerData(self, steamId, playerData)
local filename = ("player_" .. tostring(steamId)) .. ".txt"
local kv = __TS__New(KeyValues)
kv:SetString("id", playerData.id)
kv:SetInt("matchCount", playerData.matchCount)
kv:SetInt("winCount", playerData.winCount)
kv:SetInt("disconnectCount", playerData.disconnectCount)
kv:SetInt("seasonPointTotal", playerData.seasonPointTotal)
kv:SetInt("seasonLevel", playerData.seasonLevel)
kv:SetInt("seasonCurrrentLevelPoint", playerData.seasonCurrrentLevelPoint)
kv:SetInt("seasonNextLevelPoint", playerData.seasonNextLevelPoint)
kv:SetInt("memberPointTotal", playerData.memberPointTotal)
kv:SetInt("memberLevel", playerData.memberLevel)
kv:SetInt("memberCurrentLevelPoint", playerData.memberCurrentLevelPoint)
kv:SetInt("memberNextLevelPoint", playerData.memberNextLevelPoint)
kv:SetInt("totalLevel", playerData.totalLevel)
kv:SetInt("useableLevel", playerData.useableLevel)
do
local i = 0
while i < #playerData.properties do
local prop = playerData.properties[i + 1]
local propKey = "property_" .. tostring(i)
kv:SetString(propKey .. "_name", prop.name)
kv:SetInt(propKey .. "_level", prop.level)
i = i + 1
end
end
kv:SetInt("properties_count", #playerData.properties)
if playerData.playerSetting then
kv:SetBool("setting_isRememberAbilityKey", playerData.playerSetting.isRememberAbilityKey)
kv:SetString("setting_activeAbilityKey", playerData.playerSetting.activeAbilityKey)
kv:SetString("setting_passiveAbilityKey", playerData.playerSetting.passiveAbilityKey)
kv:SetBool("setting_activeAbilityQuickCast", playerData.playerSetting.activeAbilityQuickCast)
kv:SetBool("setting_passiveAbilityQuickCast", playerData.playerSetting.passiveAbilityQuickCast)
end
kv:SaveToFile(self.STORAGE_PATH .. filename)
end
function LocalStorage.LoadPlayerData(self, steamId)
local filename = ("player_" .. tostring(steamId)) .. ".txt"
local kv = __TS__New(KeyValues)
if not kv:LoadFromFile(self.STORAGE_PATH .. filename) then
return nil
end
local properties = {}
local propCount = kv:GetInt("properties_count", 0)
do
local i = 0
while i < propCount do
local propKey = "property_" .. tostring(i)
properties[#properties + 1] = {
steamId = steamId,
name = kv:GetString(propKey .. "_name", ""),
level = kv:GetInt(propKey .. "_level", 0)
}
i = i + 1
end
end
local playerData = {
id = kv:GetString(
"id",
tostring(steamId)
),
matchCount = kv:GetInt("matchCount", 0),
winCount = kv:GetInt("winCount", 0),
disconnectCount = kv:GetInt("disconnectCount", 0),
seasonPointTotal = kv:GetInt("seasonPointTotal", 0),
seasonLevel = kv:GetInt("seasonLevel", 1),
seasonCurrrentLevelPoint = kv:GetInt("seasonCurrrentLevelPoint", 0),
seasonNextLevelPoint = kv:GetInt("seasonNextLevelPoint", 100),
memberPointTotal = kv:GetInt("memberPointTotal", 0),
memberLevel = kv:GetInt("memberLevel", 1),
memberCurrentLevelPoint = kv:GetInt("memberCurrentLevelPoint", 0),
memberNextLevelPoint = kv:GetInt("memberNextLevelPoint", 1000),
totalLevel = kv:GetInt("totalLevel", 1),
useableLevel = kv:GetInt("useableLevel", 1),
properties = properties,
playerSetting = {
isRememberAbilityKey = kv:GetBool("setting_isRememberAbilityKey", false),
activeAbilityKey = kv:GetString("setting_activeAbilityKey", "Q"),
passiveAbilityKey = kv:GetString("setting_passiveAbilityKey", "W"),
activeAbilityQuickCast = kv:GetBool("setting_activeAbilityQuickCast", false),
passiveAbilityQuickCast = kv:GetBool("setting_passiveAbilityQuickCast", false)
}
}
return playerData
end
function LocalStorage.SaveMemberData(self, steamId, memberData)
local filename = ("member_" .. tostring(steamId)) .. ".txt"
local kv = __TS__New(KeyValues)
kv:SetInt("steamId", memberData.steamId)
kv:SetBool("enable", memberData.enable)
kv:SetString("expireDateString", memberData.expireDateString)
kv:SetInt("level", memberData.level)
kv:SaveToFile(self.STORAGE_PATH .. filename)
end
function LocalStorage.LoadMemberData(self, steamId)
local filename = ("member_" .. tostring(steamId)) .. ".txt"
local kv = __TS__New(KeyValues)
if not kv:LoadFromFile(self.STORAGE_PATH .. filename) then
return nil
end
return {
steamId = kv:GetInt("steamId", steamId),
enable = kv:GetBool("enable", false),
expireDateString = kv:GetString("expireDateString", ""),
level = kv:GetInt("level", MemberLevel.NORMAL)
}
end
LocalStorage.STORAGE_PATH = "scripts/vscripts/storage/"
return ____exports
