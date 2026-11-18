local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/action/cached-item-state.lua"
__TS__SourceMapTraceBack("ai/action/cached-item-state.lua", {["11"] = 10,["12"] = 10,["13"] = 10,["15"] = 10,["16"] = 17,["17"] = 19,["18"] = 19,["20"] = 21,["21"] = 22,["22"] = 23,["23"] = 24,["24"] = 25,["25"] = 26,["27"] = 29,["29"] = 30,["30"] = 30,["32"] = 31,["33"] = 32,["34"] = 32,["36"] = 34,["37"] = 35,["38"] = 36,["40"] = 38,["41"] = 38,["44"] = 30,["47"] = 41,["48"] = 45,["49"] = 17,["50"] = 48,["51"] = 51,["52"] = 51,["54"] = 53,["55"] = 54,["56"] = 55,["58"] = 57,["59"] = 58,["60"] = 59,["61"] = 60,["64"] = 63,["65"] = 48,["66"] = 66,["67"] = 67,["68"] = 66,["69"] = 70,["70"] = 71,["71"] = 72,["72"] = 73,["73"] = 74,["74"] = 75,["76"] = 78,["77"] = 79,["78"] = 80,["79"] = 81,["81"] = 84,["82"] = 85,["83"] = 86,["84"] = 87,["86"] = 90,["87"] = 91,["88"] = 92,["89"] = 93,["91"] = 96,["92"] = 97,["93"] = 70,["94"] = 100,["95"] = 101,["96"] = 100,["97"] = 104,["98"] = 105,["99"] = 106,["100"] = 107,["101"] = 108,["102"] = 109,["103"] = 110,["106"] = 104,["107"] = 115,["108"] = 116,["109"] = 117,["110"] = 118,["111"] = 119,["112"] = 119,["113"] = 119,["114"] = 119,["115"] = 115,["116"] = 125,["117"] = 126,["118"] = 127,["119"] = 128,["121"] = 131,["122"] = 132,["124"] = 135,["125"] = 136,["126"] = 137,["128"] = 140,["129"] = 125,["130"] = 143,["131"] = 144,["132"] = 145,["134"] = 147,["135"] = 147,["136"] = 147,["137"] = 147,["138"] = 143,["139"] = 153,["140"] = 154,["141"] = 153,["142"] = 157,["143"] = 158,["144"] = 157,["145"] = 161,["146"] = 162,["147"] = 162,["148"] = 162,["149"] = 163,["150"] = 163,["151"] = 163,["152"] = 163,["153"] = 164,["154"] = 165,["155"] = 166,["156"] = 167,["159"] = 161,["160"] = 172,["161"] = 173,["162"] = 172,["163"] = 11,["164"] = 12,["165"] = 13,["166"] = 14,["167"] = 15});
local ____exports = {}
____exports.CachedItemState = __TS__Class()
local CachedItemState = ____exports.CachedItemState
CachedItemState.name = "CachedItemState"
function CachedItemState.prototype.____constructor(self)
end
function CachedItemState.GetItemsMap(self, hero, refreshInterval)
    if refreshInterval == nil then
        refreshInterval = self.InventoryRefreshInterval
    end
    local heroId = hero:entindex()
    local now = GameRules:GetGameTime()
    local cached = self.inventoryByHero:get(heroId)
    if cached ~= nil and now < cached.nextRefreshTime then
        self:CompactItemsMap(cached.itemsMap)
        return cached.itemsMap
    end
    local itemsMap = __TS__New(Map)
    do
        local slot = 0
        while slot <= 14 do
            do
                local item = hero:GetItemInSlot(slot)
                if not self:IsValidItem(item) then
                    goto __continue5
                end
                local itemName = item:GetName()
                if not itemsMap:has(itemName) then
                    itemsMap:set(itemName, {})
                end
                local ____temp_0 = itemsMap:get(itemName)
                ____temp_0[#____temp_0 + 1] = item
            end
            ::__continue5::
            slot = slot + 1
        end
    end
    self.inventoryByHero:set(heroId, {nextRefreshTime = now + refreshInterval, itemsMap = itemsMap})
    return itemsMap
end
function CachedItemState.FindItem(self, hero, itemName, includeStash)
    if includeStash == nil then
        includeStash = true
    end
    local items = self:GetItemsMap(hero):get(itemName)
    if items == nil then
        return nil
    end
    for ____, item in ipairs(items) do
        local slot = item:GetItemSlot()
        if includeStash or slot <= DOTA_ITEM_SLOT_9 then
            return item
        end
    end
    return nil
end
function CachedItemState.HasItem(self, hero, itemName)
    return self:GetItemsMap(hero):has(itemName)
end
function CachedItemState.FindUsableItem(self, hero, itemName)
    local key = self:GetHeroItemKey(hero, itemName)
    local now = GameRules:GetGameTime()
    local cooldown = self.cooldownByHeroItem:get(key)
    if cooldown ~= nil and now < cooldown.nextCheckTime then
        return nil
    end
    local item = self:FindItem(hero, itemName, false)
    if not item then
        self:SetNextItemCheck(key, now + self.InventoryRefreshInterval)
        return nil
    end
    local itemSlot = item:GetItemSlot()
    if itemSlot >= DOTA_ITEM_SLOT_7 and itemSlot <= DOTA_ITEM_SLOT_9 then
        self:SetNextItemCheck(key, now + self.InventoryRefreshInterval)
        return nil
    end
    local nextCheckDelay = self:GetNextUsableCheckDelay(hero, item)
    if nextCheckDelay > 0 then
        self:SetNextItemCheck(key, now + nextCheckDelay)
        return nil
    end
    self:SetNextItemCheck(key, now + self.minCooldownCheckInterval)
    return item
end
function CachedItemState.InvalidateHero(self, hero)
    self.inventoryByHero:delete(hero:entindex())
end
function CachedItemState.ClearHero(self, hero)
    local heroId = hero:entindex()
    self.inventoryByHero:delete(heroId)
    local keyPrefix = tostring(heroId) .. ":"
    for ____, key in __TS__Iterator(self.cooldownByHeroItem:keys()) do
        if __TS__StringStartsWith(key, keyPrefix) then
            self.cooldownByHeroItem:delete(key)
        end
    end
end
function CachedItemState.MarkItemUsed(self, hero, itemName, item)
    self:InvalidateHero(hero)
    local now = GameRules:GetGameTime()
    local cooldownRemaining = item and item:GetCooldownTimeRemaining() or 0
    self:SetNextItemCheck(
        self:GetHeroItemKey(hero, itemName),
        now + self:ClampCooldownDelay(cooldownRemaining)
    )
end
function CachedItemState.GetNextUsableCheckDelay(self, hero, item)
    local cooldownRemaining = item:GetCooldownTimeRemaining()
    if cooldownRemaining > 0 then
        return self:ClampCooldownDelay(cooldownRemaining)
    end
    if item:GetAbilityChargeRestoreTime(-1) > 0 and item:GetCurrentCharges() == 0 then
        return self.maxCooldownCheckInterval
    end
    local manaCost = item:GetManaCost(-1)
    if manaCost > hero:GetMana() then
        return self.minCooldownCheckInterval
    end
    return 0
end
function CachedItemState.ClampCooldownDelay(self, cooldownRemaining)
    if cooldownRemaining <= 0 then
        return self.minCooldownCheckInterval
    end
    return math.min(
        self.maxCooldownCheckInterval,
        math.max(self.minCooldownCheckInterval, cooldownRemaining)
    )
end
function CachedItemState.SetNextItemCheck(self, key, nextCheckTime)
    self.cooldownByHeroItem:set(key, {nextCheckTime = nextCheckTime})
end
function CachedItemState.GetHeroItemKey(self, hero, itemName)
    return (tostring(hero:entindex()) .. ":") .. itemName
end
function CachedItemState.CompactItemsMap(self, itemsMap)
    for ____, ____value in __TS__Iterator(itemsMap) do
        local itemName = ____value[1]
        local items = ____value[2]
        local validItems = __TS__ArrayFilter(
            items,
            function(____, item) return self:IsValidItem(item) end
        )
        if #validItems == 0 then
            itemsMap:delete(itemName)
        elseif #validItems ~= #items then
            itemsMap:set(itemName, validItems)
        end
    end
end
function CachedItemState.IsValidItem(self, item)
    return item ~= nil and not item:IsNull()
end
CachedItemState.InventoryRefreshInterval = 2
CachedItemState.minCooldownCheckInterval = 0.25
CachedItemState.maxCooldownCheckInterval = 2
CachedItemState.inventoryByHero = __TS__New(Map)
CachedItemState.cooldownByHeroItem = __TS__New(Map)
return ____exports
