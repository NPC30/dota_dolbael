ability_defection = class({})
function ability_defection:OnSpellStart()
if not IsServer() then return end
local caster = self:GetCaster()
local playerID = caster:GetPlayerOwnerID()
_G.DefectionTeamState = _G.DefectionTeamState or {}
_G.DefectionOriginalTeam = _G.DefectionOriginalTeam or {}
_G.DefectionKillCount = _G.DefectionKillCount or {}
_G.DefectionWarningShown = _G.DefectionWarningShown or {}
if not _G.DefectionOriginalTeam[playerID] then
_G.DefectionOriginalTeam[playerID] = caster:GetTeam()
end
if not _G.DefectionKillCount[playerID] then
_G.DefectionKillCount[playerID] = 0
end
local currentTeam = _G.DefectionTeamState[playerID] or caster:GetTeam()
local killCount = _G.DefectionKillCount[playerID]
local newTeam
if killCount > 2 then
if currentTeam == DOTA_TEAM_NEUTRALS then
newTeam = DOTA_TEAM_BADGUYS
elseif currentTeam == DOTA_TEAM_BADGUYS then
newTeam = DOTA_TEAM_NEUTRALS
else
newTeam = DOTA_TEAM_BADGUYS
end
if not _G.DefectionWarningShown[playerID] then
GameRules:SendCustomMessage(
"有人已经被AI蛊惑，他击杀了超过3名人类玩家，将永远无法回归人类阵营! Someone has killed more than 3 human players, he will never return",
0,
0)
_G.DefectionWarningShown[playerID] = true
end
else
local teamCycle = {
[DOTA_TEAM_GOODGUYS] = DOTA_TEAM_BADGUYS,
[DOTA_TEAM_BADGUYS] = DOTA_TEAM_NEUTRALS,
[DOTA_TEAM_NEUTRALS] = DOTA_TEAM_GOODGUYS,
}
newTeam = teamCycle[currentTeam]
if not newTeam then
newTeam = DOTA_TEAM_BADGUYS
end
end
if newTeam == DOTA_TEAM_NEUTRALS then
self:RemoveTPItems(caster)
end
if currentTeam == DOTA_TEAM_NEUTRALS and newTeam == DOTA_TEAM_GOODGUYS then
Timers:CreateTimer(2.0, function()
self:RestoreTPItems(caster)
caster:SetTeam(newTeam)
_G.DefectionTeamState[playerID] = newTeam
caster:RemoveModifierByName("modifier_defection")
caster:AddNewModifier(caster, self, "modifier_defection", {})
end)
return
end
if currentTeam == DOTA_TEAM_NEUTRALS and newTeam == DOTA_TEAM_BADGUYS then
self:RestoreTPItems(caster)
end
caster:SetTeam(newTeam)
_G.DefectionTeamState[playerID] = newTeam
caster:RemoveModifierByName("modifier_defection")
caster:AddNewModifier(caster, self, "modifier_defection", {})
end
function ability_defection:RemoveTPItems(hero)
_G.DefectionRemovedTP = _G.DefectionRemovedTP or {}
local playerID = hero:GetPlayerOwnerID()
_G.DefectionRemovedTP[playerID] = {}
for i = 0, 8 do
local item = hero:GetItemInSlot(i)
if item then
local itemName = item:GetAbilityName()
if itemName == "item_tpscroll" or
itemName == "item_travel_boots" or
itemName == "item_travel_boots_2" then
table.insert(_G.DefectionRemovedTP[playerID], itemName)
hero:RemoveItem(item)
end
end
end
local tpSlotItem = hero:GetItemInSlot(DOTA_ITEM_TP_SCROLL)
if tpSlotItem then
local itemName = tpSlotItem:GetAbilityName()
if itemName == "item_tpscroll" or
itemName == "item_travel_boots" or
itemName == "item_travel_boots_2" then
table.insert(_G.DefectionRemovedTP[playerID], itemName)
hero:RemoveItem(tpSlotItem)
end
end
end
function ability_defection:RestoreTPItems(hero)
_G.DefectionRemovedTP = _G.DefectionRemovedTP or {}
local playerID = hero:GetPlayerOwnerID()
if _G.DefectionRemovedTP[playerID] then
for _, itemName in pairs(_G.DefectionRemovedTP[playerID]) do
hero:AddItemByName(itemName)
end
_G.DefectionRemovedTP[playerID] = {}
end
end
