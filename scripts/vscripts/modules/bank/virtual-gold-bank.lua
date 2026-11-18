local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/bank/virtual-gold-bank.lua"
__TS__SourceMapTraceBack("modules/bank/virtual-gold-bank.lua", {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["18"] = 6,["19"] = 7,["20"] = 8,["21"] = 9,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 14,["26"] = 15,["27"] = 13,["28"] = 13,["29"] = 11,["30"] = 19,["32"] = 20,["33"] = 20,["35"] = 21,["36"] = 23,["37"] = 23,["39"] = 25,["40"] = 26,["41"] = 26,["43"] = 28,["44"] = 29,["45"] = 30,["46"] = 32,["47"] = 33,["49"] = 36,["50"] = 38,["51"] = 39,["52"] = 41,["56"] = 20,["59"] = 19,["60"] = 49,["61"] = 50,["62"] = 51,["63"] = 52,["64"] = 49,["65"] = 58,["66"] = 64,["67"] = 65,["68"] = 67,["69"] = 68,["70"] = 58,["71"] = 78,["72"] = 84,["73"] = 85,["74"] = 87,["75"] = 88,["76"] = 91,["77"] = 92,["78"] = 94,["79"] = 78,["80"] = 101,["81"] = 102,["82"] = 103,["83"] = 104,["84"] = 104,["85"] = 104,["86"] = 104,["87"] = 104,["88"] = 101,["89"] = 113,["90"] = 114,["91"] = 113,["92"] = 120,["93"] = 121,["94"] = 122,["95"] = 120,["96"] = 4,["97"] = 5});
local ____exports = {}
local ____player = require("api.player")
local MemberLevel = ____player.MemberLevel
local Player = ____player.Player
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
____exports.VirtualGoldBank = __TS__Class()
local VirtualGoldBank = ____exports.VirtualGoldBank
VirtualGoldBank.name = "VirtualGoldBank"
function VirtualGoldBank.prototype.____constructor(self)
    self.playerVirtualGold = __TS__New(Map)
    self.playerTransferredBackTotal = __TS__New(Map)
    self.CHECK_INTERVAL = 1
    self.GOLD_THRESHOLD = 85000
    Timers:CreateTimer(
        self.CHECK_INTERVAL,
        function()
            self:balanceVirtualGold()
            return self.CHECK_INTERVAL
        end
    )
end
function VirtualGoldBank.prototype.balanceVirtualGold(self)
    do
        local i = 0
        while i < DOTA_MAX_TEAM_PLAYERS do
            do
                local playerID = i
                if not PlayerResource:IsValidPlayerID(playerID) then
                    goto __continue5
                end
                local hero = PlayerResource:GetSelectedHeroEntity(playerID)
                if not hero then
                    goto __continue5
                end
                local currentGold = hero:GetGold()
                local virtualGold = self.playerVirtualGold:get(playerID) or 0
                local isPremiumMember = self:isPremiumMember(playerID)
                if not isPremiumMember then
                    goto __continue5
                end
                if currentGold > self.GOLD_THRESHOLD then
                    self:transferToVirtualBank(playerID, hero, currentGold, virtualGold)
                elseif currentGold < self.GOLD_THRESHOLD and virtualGold > 0 then
                    self:transferFromVirtualBank(playerID, hero, currentGold, virtualGold)
                end
            end
            ::__continue5::
            i = i + 1
        end
    end
end
function VirtualGoldBank.prototype.isPremiumMember(self, playerID)
    local steamAccountId = PlayerResource:GetSteamAccountID(playerID)
    local memberLevel = Player:GetMemberLevel(steamAccountId)
    return memberLevel == MemberLevel.PREMIUM
end
function VirtualGoldBank.prototype.transferToVirtualBank(self, playerID, hero, currentGold, virtualGold)
    local excess = currentGold - self.GOLD_THRESHOLD
    hero:ModifyGold(-excess, false, DOTA_ModifyGold_Unspecified)
    self.playerVirtualGold:set(playerID, virtualGold + excess)
    self:updateVirtualGoldUI(playerID)
end
function VirtualGoldBank.prototype.transferFromVirtualBank(self, playerID, hero, currentGold, virtualGold)
    local needed = self.GOLD_THRESHOLD - currentGold
    local transferAmount = math.min(needed, virtualGold)
    hero:ModifyGold(transferAmount, false, DOTA_ModifyGold_Unspecified)
    self.playerVirtualGold:set(playerID, virtualGold - transferAmount)
    local currentTransferTotal = self.playerTransferredBackTotal:get(playerID) or 0
    self.playerTransferredBackTotal:set(playerID, currentTransferTotal + transferAmount)
    self:updateVirtualGoldUI(playerID)
end
function VirtualGoldBank.prototype.updateVirtualGoldUI(self, playerID)
    local virtualGold = self.playerVirtualGold:get(playerID) or 0
    local transferredBackTotal = self.playerTransferredBackTotal:get(playerID) or 0
    CustomNetTables:SetTableValue(
        "player_virtual_gold",
        tostring(playerID),
        {virtual_gold = virtualGold, transferred_back_total = transferredBackTotal}
    )
end
function VirtualGoldBank.prototype.getVirtualGold(self, playerID)
    return self.playerVirtualGold:get(playerID) or 0
end
function VirtualGoldBank.prototype.setVirtualGold(self, playerID, amount)
    self.playerVirtualGold:set(playerID, amount)
    self:updateVirtualGoldUI(playerID)
end
VirtualGoldBank = __TS__DecorateLegacy({reloadable}, VirtualGoldBank)
____exports.VirtualGoldBank = VirtualGoldBank
return ____exports
