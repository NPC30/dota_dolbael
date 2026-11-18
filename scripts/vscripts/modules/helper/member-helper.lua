local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____player = require("api.player")
local MemberLevel = ____player.MemberLevel
local Player = ____player.Player
local ____modifier_2Dhelper = require("modules.helper.modifier-helper")
local ModifierHelper = ____modifier_2Dhelper.ModifierHelper
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local MEMBER_NORMAL_MODIFIER = "modifier_global_member_normal"
local MEMBER_PREMIUM_MODIFIER = "modifier_global_member_premium"
____exports.MemberHelper = __TS__Class()
local MemberHelper = ____exports.MemberHelper
MemberHelper.name = "MemberHelper"
function MemberHelper.prototype.____constructor(self)
end
function MemberHelper.ApplyMemberModifier(self, hero)
if not PlayerHelper:IsHumanPlayer(hero) then
return
end
local steamAccountId = PlayerResource:GetSteamAccountID(hero:GetPlayerID())
local memberLevel = Player:GetMemberLevel(steamAccountId)
if memberLevel == MemberLevel.NORMAL and not hero:HasModifier(MEMBER_NORMAL_MODIFIER) then
ModifierHelper:applyGlobalModifier(hero, MEMBER_NORMAL_MODIFIER)
elseif memberLevel == MemberLevel.PREMIUM and not hero:HasModifier(MEMBER_PREMIUM_MODIFIER) then
ModifierHelper:applyGlobalModifier(hero, MEMBER_PREMIUM_MODIFIER)
end
end
return ____exports
