LinkLuaModifier( "modifier_clockwerk_auto_chainmail", "heroes/clockwerk/clockwerk_auto_chainmail.lua", LUA_MODIFIER_MOTION_NONE )
if clockwerk_auto_chainmail == nil then
clockwerk_auto_chainmail = class({})
end
function clockwerk_auto_chainmail:GetIntrinsicModifierName()
return "modifier_clockwerk_auto_chainmail"
end
if modifier_clockwerk_auto_chainmail == nil then
modifier_clockwerk_auto_chainmail = class({})
end
function modifier_clockwerk_auto_chainmail:OnCreated(params)
if IsServer() then
end
end
function modifier_clockwerk_auto_chainmail:OnRefresh(params)
if IsServer() then
end
end
function modifier_clockwerk_auto_chainmail:OnDestroy()
if IsServer() then
end
end
function modifier_clockwerk_auto_chainmail:DeclareFunctions()
return {
}
end
