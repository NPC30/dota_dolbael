LinkLuaModifier( "modifier_pudge_meat_hook_lua", "heroes/hero_pudge/pudge_meat_hook_lua.lua.lua", LUA_MODIFIER_MOTION_NONE )
if pudge_meat_hook_lua == nil then
pudge_meat_hook_lua = class({})
end
function pudge_meat_hook_lua:GetIntrinsicModifierName()
return "modifier_pudge_meat_hook_lua"
end
if modifier_pudge_meat_hook_lua == nil then
modifier_pudge_meat_hook_lua = class({})
end
function modifier_pudge_meat_hook_lua:OnCreated(params)
if IsServer() then
end
end
function modifier_pudge_meat_hook_lua:OnRefresh(params)
if IsServer() then
end
end
function modifier_pudge_meat_hook_lua:OnDestroy()
if IsServer() then
end
end
function modifier_pudge_meat_hook_lua:DeclareFunctions()
return {
}
end
