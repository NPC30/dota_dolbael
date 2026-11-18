modifier_player_reno = class({})
function modifier_player_reno:IsHidden()
return true
end
function modifier_player_reno:IsPurgable()
return false
end
function modifier_player_reno:RemoveOnDeath()
return false
end
function modifier_player_reno:DeclareFunctions()
return {
MODIFIER_PROPERTY_TOOLTIP,
}
end
function modifier_player_reno:OnTooltip()
return 2
end
