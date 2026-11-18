function phantom_assassin_phantom_strike_custom:OnSpellStart()
local caster = self:GetCaster()
local target = self:GetCursorTarget()
local offset = (target:GetOrigin() - caster:GetOrigin()):Normalized() * 100
local new_position = target:GetOrigin() - offset
caster:SetAbsOrigin(new_position)
FindClearSpaceForUnit(caster, new_position, false)
if target:GetTeamNumber() ~= caster:GetTeamNumber() then
caster:AddNewModifier(caster, self, "modifier_phantom_strike_buff", {})
caster:PerformAttack(target, true, true, true, false, false, false, true)
end
end
