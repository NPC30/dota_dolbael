local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local ____exports = {}
local ____player_2Dhelper = require("modules.helper.player-helper")
local PlayerHelper = ____player_2Dhelper.PlayerHelper
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_treasure_chest = __TS__Class()
local modifier_treasure_chest = ____exports.modifier_treasure_chest
modifier_treasure_chest.name = "modifier_treasure_chest"
__TS__ClassExtends(modifier_treasure_chest, BaseModifier)
function modifier_treasure_chest.prototype.IsHidden(self)
return true
end
function modifier_treasure_chest.prototype.IsPurgable(self)
return false
end
function modifier_treasure_chest.prototype.IsPurgeException(self)
return false
end
function modifier_treasure_chest.prototype.RemoveOnDeath(self)
return false
end
function modifier_treasure_chest.prototype.GetDisableHealthBar(self)
return true
end
function modifier_treasure_chest.prototype.CheckState(self)
return {[MODIFIER_STATE_NO_HEALTH_BAR] = true, [MODIFIER_STATE_INVULNERABLE] = true, [MODIFIER_STATE_UNSELECTABLE] = true}
end
function modifier_treasure_chest.prototype.DeclareFunctions(self)
return {MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_MAGICAL, MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_PHYSICAL, MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_PURE}
end
function modifier_treasure_chest.prototype.GetAbsoluteNoDamageMagical(self)
return 1
end
function modifier_treasure_chest.prototype.GetAbsoluteNoDamagePhysical(self)
return 1
end
function modifier_treasure_chest.prototype.GetAbsoluteNoDamagePure(self)
return 1
end
function modifier_treasure_chest.prototype.OnCreated(self)
if not IsServer() then
return
end
self:StartIntervalThink(____exports.modifier_treasure_chest.PROXIMITY_INTERVAL)
end
function modifier_treasure_chest.prototype.OnIntervalThink(self)
local chest = self:GetParent()
local heroes = FindUnitsInRadius(
chest:GetTeamNumber(),
chest:GetAbsOrigin(),
nil,
____exports.modifier_treasure_chest.PROXIMITY_RADIUS,
DOTA_UNIT_TARGET_TEAM_BOTH,
DOTA_UNIT_TARGET_HERO,
DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
FIND_CLOSEST,
false
)
local opener = __TS__ArrayFind(
heroes,
function(____, hero) return PlayerHelper:IsHumanPlayer(hero) end
)
if not opener then
return
end
GameRules.Treasure:openChest(chest, opener)
end
modifier_treasure_chest.PROXIMITY_RADIUS = 150
modifier_treasure_chest.PROXIMITY_INTERVAL = 0.2
modifier_treasure_chest = __TS__DecorateLegacy(
{registerModifier(nil, "modifiers/global/modifier_treasure_chest")},
modifier_treasure_chest
)
____exports.modifier_treasure_chest = modifier_treasure_chest
return ____exports
