local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modifiers/global/fort_think.lua"
__TS__SourceMapTraceBack("modifiers/global/fort_think.lua", {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 6,["20"] = 8,["21"] = 9,["22"] = 4,["23"] = 11,["24"] = 12,["25"] = 11,["26"] = 15,["27"] = 16,["28"] = 15,["29"] = 19,["30"] = 20,["31"] = 19,["32"] = 23,["33"] = 24,["34"] = 23,["35"] = 27,["36"] = 28,["37"] = 27,["38"] = 31,["39"] = 32,["40"] = 31,["41"] = 35,["42"] = 36,["43"] = 35,["44"] = 39,["45"] = 40,["46"] = 39,["47"] = 43,["48"] = 45,["49"] = 46,["52"] = 51,["53"] = 53,["54"] = 54,["55"] = 54,["60"] = 54,["61"] = 56,["63"] = 43,["64"] = 64,["65"] = 65,["68"] = 69,["69"] = 72,["70"] = 76,["71"] = 76,["72"] = 76,["73"] = 77,["74"] = 78,["75"] = 79,["76"] = 79,["77"] = 79,["78"] = 79,["79"] = 80,["81"] = 82,["82"] = 76,["83"] = 76,["84"] = 64,["85"] = 86,["86"] = 88,["87"] = 89,["88"] = 90,["90"] = 86,["91"] = 5,["92"] = 4,["93"] = 5,["95"] = 5});
local ____exports = {}
local ____game_2Dend = require("modules.event.game-end.game-end")
local GameEnd = ____game_2Dend.GameEnd
local ____dota_ts_adapter = require("utils.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.modifier_fort_think = __TS__Class()
local modifier_fort_think = ____exports.modifier_fort_think
modifier_fort_think.name = "modifier_fort_think"
__TS__ClassExtends(modifier_fort_think, BaseModifier)
function modifier_fort_think.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.gameEndTriggered = false
    self.gameEndThresholdHealth = 1
    self.gameEndDelay = 3
end
function modifier_fort_think.prototype.IsHidden(self)
    return true
end
function modifier_fort_think.prototype.IsPurgable(self)
    return false
end
function modifier_fort_think.prototype.IsPurgeException(self)
    return false
end
function modifier_fort_think.prototype.IsDebuff(self)
    return false
end
function modifier_fort_think.prototype.RemoveOnDeath(self)
    return false
end
function modifier_fort_think.prototype.AllowIllusionDuplicate(self)
    return false
end
function modifier_fort_think.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MIN_HEALTH, MODIFIER_EVENT_ON_TAKEDAMAGE}
end
function modifier_fort_think.prototype.GetMinHealth(self)
    return 1
end
function modifier_fort_think.prototype.OnTakeDamage(self, event)
    local parent = self:GetParent()
    if event.unit ~= parent then
        return
    end
    if parent and parent:GetHealth() <= self.gameEndThresholdHealth then
        local parentTeam = parent:GetTeamNumber()
        local ____temp_0
        if parentTeam == DOTA_TEAM_GOODGUYS then
            ____temp_0 = DOTA_TEAM_BADGUYS
        else
            ____temp_0 = DOTA_TEAM_GOODGUYS
        end
        local winnerTeamId = ____temp_0
        self:TriggerGameEnd(winnerTeamId)
    end
end
function modifier_fort_think.prototype.TriggerGameEnd(self, winnerTeamId)
    if self.gameEndTriggered then
        return
    end
    self.gameEndTriggered = true
    GameEnd:OnGameEnd(winnerTeamId)
    self.gameEndTimer = Timers:CreateTimer(
        self.gameEndDelay,
        function()
            local parent = self:GetParent()
            if parent and IsValidEntity(parent) then
                print(
                    "Kill",
                    parent:GetUnitName()
                )
                parent:ForceKill(false)
            end
            return nil
        end
    )
end
function modifier_fort_think.prototype.OnDestroy(self)
    if self.gameEndTimer then
        Timers:RemoveTimer(self.gameEndTimer)
        self.gameEndTimer = nil
    end
end
modifier_fort_think = __TS__DecorateLegacy(
    {registerModifier(nil)},
    modifier_fort_think
)
____exports.modifier_fort_think = modifier_fort_think
return ____exports
