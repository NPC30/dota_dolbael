modifier_abyss_overflow_stats = class({})
function modifier_abyss_overflow_stats:IsHidden()
return true
end
function modifier_abyss_overflow_stats:IsPurgable()
return false
end
function modifier_abyss_overflow_stats:RemoveOnDeath()
return false
end
function modifier_abyss_overflow_stats:IsPermanent()
return true
end
function modifier_abyss_overflow_stats:GetAttributes()
return MODIFIER_ATTRIBUTE_PERMANENT
end
function modifier_abyss_overflow_stats:OnCreated(kv)
if not IsServer() then
return
end
self.strength = tonumber(kv.strength) or 0
self.agility = tonumber(kv.agility) or 0
self.intellect = tonumber(kv.intellect) or 0
end
function modifier_abyss_overflow_stats:OnRefresh(kv)
if not IsServer() then
return
end
self.strength = (self.strength or 0) + (tonumber(kv.strength) or 0)
self.agility = (self.agility or 0) + (tonumber(kv.agility) or 0)
self.intellect = (self.intellect or 0) + (tonumber(kv.intellect) or 0)
end
function modifier_abyss_overflow_stats:DeclareFunctions()
return {
MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
}
end
function modifier_abyss_overflow_stats:GetModifierBonusStats_Strength()
return self.strength or 0
end
function modifier_abyss_overflow_stats:GetModifierBonusStats_Agility()
return self.agility or 0
end
function modifier_abyss_overflow_stats:GetModifierBonusStats_Intellect()
return self.intellect or 0
end
