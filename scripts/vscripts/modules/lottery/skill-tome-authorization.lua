local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "modules/lottery/skill-tome-authorization.lua"
__TS__SourceMapTraceBack("modules/lottery/skill-tome-authorization.lua", {["6"] = 1,["7"] = 7,["8"] = 8,["9"] = 7,["10"] = 11,["11"] = 12,["12"] = 13,["13"] = 15,["14"] = 11,["15"] = 25,["16"] = 26,["17"] = 27,["18"] = 31,["19"] = 25,["20"] = 37,["21"] = 37,["22"] = 37,["24"] = 37,["25"] = 38,["26"] = 39,["27"] = 40,["28"] = 41,["30"] = 43,["31"] = 44,["32"] = 38,["33"] = 47,["34"] = 48,["35"] = 47,["36"] = 51,["37"] = 52,["38"] = 51,["39"] = 55,["40"] = 56,["41"] = 57,["44"] = 60,["45"] = 61,["48"] = 65,["49"] = 66,["50"] = 67,["51"] = 55,["52"] = 70,["53"] = 75,["54"] = 76,["57"] = 79,["59"] = 81,["60"] = 81,["62"] = 82,["63"] = 83,["64"] = 84,["66"] = 86,["67"] = 87,["69"] = 89,["70"] = 90,["74"] = 81,["77"] = 93,["78"] = 70,["79"] = 96,["80"] = 97,["83"] = 100,["84"] = 101,["85"] = 96,["86"] = 104,["87"] = 108,["88"] = 109,["91"] = 112,["92"] = 113,["93"] = 121,["94"] = 122,["95"] = 123,["96"] = 104});
local ____exports = {}
local PROTECTED_SKILL_TOME_ITEMS = {item_tome_of_ability_reset = true, item_tome_of_ability_replace = true, item_skill_learning = true}
local function getLuaGlobal(self)
    return _G
end
local function getAllowedSkillTomeUses(self)
    local luaGlobal = getLuaGlobal(nil)
    luaGlobal.AllowedSkillTomeUses = luaGlobal.AllowedSkillTomeUses or ({})
    return luaGlobal.AllowedSkillTomeUses
end
local function getAuthorizationStatsTable(self)
    local luaGlobal = getLuaGlobal(nil)
    luaGlobal.SkillTomeAuthorizationStats = luaGlobal.SkillTomeAuthorizationStats or ({})
    return luaGlobal.SkillTomeAuthorizationStats
end
____exports.SkillTomeAuthorization = __TS__Class()
local SkillTomeAuthorization = ____exports.SkillTomeAuthorization
SkillTomeAuthorization.name = "SkillTomeAuthorization"
function SkillTomeAuthorization.prototype.____constructor(self)
end
function SkillTomeAuthorization.initialize(self)
    local luaGlobal = getLuaGlobal(nil)
    if luaGlobal.SkillTomeAuthorizationEnabled == nil then
        luaGlobal.SkillTomeAuthorizationEnabled = false
    end
    getAllowedSkillTomeUses(nil)
    getAuthorizationStatsTable(nil)
end
function SkillTomeAuthorization.isProtectedItem(self, itemName)
    return PROTECTED_SKILL_TOME_ITEMS[itemName] == true
end
function SkillTomeAuthorization.recordAuthorizedGrant(self, itemName)
    self:incrementStat(itemName, "authorized")
end
function SkillTomeAuthorization.authorizeItem(self, item, itemName)
    self:initialize()
    if not item or item:IsNull() then
        return
    end
    local resolvedName = itemName or item:GetAbilityName()
    if not self:isProtectedItem(resolvedName) then
        return
    end
    getAllowedSkillTomeUses(nil)[item:entindex()] = true
    self:recordAuthorizedGrant(resolvedName)
    print((("[SkillTomeAuthorization] authorized " .. resolvedName) .. ", entindex=") .. tostring(item:entindex()))
end
function SkillTomeAuthorization.authorizeHeroItem(self, hero, item, itemName)
    if not itemName or not self:isProtectedItem(itemName) then
        self:authorizeItem(item, itemName)
        return
    end
    self:authorizeItemInstance(item, itemName)
    do
        local slot = 0
        while slot <= 16 do
            do
                local inventoryItem = hero:GetItemInSlot(slot)
                if not inventoryItem or inventoryItem:IsNull() then
                    goto __continue15
                end
                if inventoryItem:GetAbilityName() ~= itemName then
                    goto __continue15
                end
                self:authorizeItemInstance(inventoryItem, itemName)
                self:recordAuthorizedGrant(itemName)
                return
            end
            ::__continue15::
            slot = slot + 1
        end
    end
    self:recordAuthorizedGrant(itemName)
end
function SkillTomeAuthorization.authorizeItemInstance(self, item, itemName)
    if not item or item:IsNull() then
        return
    end
    getAllowedSkillTomeUses(nil)[item:entindex()] = true
    print((("[SkillTomeAuthorization] authorized " .. itemName) .. ", entindex=") .. tostring(item:entindex()))
end
function SkillTomeAuthorization.incrementStat(self, itemName, field)
    self:initialize()
    if not self:isProtectedItem(itemName) then
        return
    end
    local ____table = getAuthorizationStatsTable(nil)
    local stats = ____table[itemName] or ({authorized = 0, used = 0, consumed = 0, unauthorized = 0})
    stats[field] = stats[field] + 1
    ____table[itemName] = stats
    print((((((((("[SkillTomeAuthorization] stats " .. itemName) .. " authorized=") .. tostring(stats.authorized)) .. " used=") .. tostring(stats.used)) .. " consumed=") .. tostring(stats.consumed)) .. " unauthorized=") .. tostring(stats.unauthorized))
end
return ____exports
