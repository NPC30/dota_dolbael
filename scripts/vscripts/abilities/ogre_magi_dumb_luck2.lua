LinkLuaModifier("modifier_ogre_magi_dumb_luck2", "abilities/ogre_magi_dumb_luck2.lua", LUA_MODIFIER_MOTION_NONE)
if ogre_magi_dumb_luck2 == nil then
ogre_magi_dumb_luck2 = class({})
end
function ogre_magi_dumb_luck2:GetIntrinsicModifierName()
return "modifier_ogre_magi_dumb_luck2"
end
if modifier_ogre_magi_dumb_luck2 == nil then
modifier_ogre_magi_dumb_luck2 = class({})
end
function modifier_ogre_magi_dumb_luck2:OnCreated(params)
if IsServer() then
end
end
function modifier_ogre_magi_dumb_luck2:OnRefresh(params)
if IsServer() then
end
end
function modifier_ogre_magi_dumb_luck2:OnDestroy()
if IsServer() then
end
end
function modifier_ogre_magi_dumb_luck2:DeclareFunctions()
return {
}
end
