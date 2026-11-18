local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__DecorateLegacy = ____lualib.__TS__DecorateLegacy
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
_G.__TS__currentFile = "ai/item/fusion-rune-manager.lua"
__TS__SourceMapTraceBack("ai/item/fusion-rune-manager.lua", {["10"] = 2,["11"] = 2,["12"] = 13,["13"] = 13,["14"] = 13,["15"] = 13,["16"] = 13,["17"] = 13,["18"] = 13,["19"] = 13,["20"] = 13,["21"] = 13,["22"] = 24,["23"] = 25,["24"] = 24,["26"] = 24,["27"] = 43,["28"] = 44,["29"] = 46,["30"] = 46,["31"] = 46,["32"] = 48,["33"] = 48,["34"] = 50,["35"] = 51,["36"] = 51,["37"] = 51,["38"] = 51,["39"] = 51,["40"] = 51,["41"] = 51,["42"] = 51,["43"] = 59,["45"] = 63,["47"] = 46,["48"] = 46,["49"] = 67,["50"] = 43,["51"] = 73,["52"] = 77,["53"] = 78,["54"] = 80,["55"] = 73,["56"] = 87,["57"] = 88,["58"] = 90,["59"] = 91,["62"] = 96,["63"] = 98,["64"] = 99,["67"] = 103,["68"] = 104,["69"] = 106,["70"] = 107,["71"] = 108,["72"] = 109,["73"] = 112,["74"] = 113,["76"] = 117,["77"] = 117,["78"] = 117,["81"] = 127,["84"] = 119,["85"] = 120,["86"] = 121,["87"] = 122,["88"] = 125,["94"] = 117,["95"] = 117,["96"] = 131,["97"] = 87,["98"] = 137,["99"] = 138,["100"] = 140,["101"] = 140,["102"] = 140,["103"] = 141,["104"] = 142,["105"] = 145,["106"] = 146,["107"] = 148,["108"] = 149,["109"] = 140,["110"] = 140,["111"] = 137,["112"] = 156,["113"] = 160,["114"] = 161,["115"] = 164,["116"] = 165,["118"] = 166,["119"] = 166,["120"] = 167,["121"] = 166,["124"] = 170,["125"] = 171,["126"] = 171,["127"] = 170,["128"] = 175,["129"] = 176,["130"] = 177,["131"] = 178,["132"] = 179,["133"] = 179,["134"] = 180,["135"] = 180,["136"] = 181,["137"] = 181,["138"] = 182,["139"] = 182,["141"] = 184,["142"] = 185,["143"] = 188,["144"] = 189,["146"] = 192,["147"] = 192,["148"] = 193,["149"] = 194,["150"] = 192,["153"] = 197,["154"] = 198,["155"] = 198,["156"] = 197,["157"] = 202,["158"] = 203,["159"] = 205,["160"] = 205,["161"] = 205,["162"] = 207,["163"] = 209,["164"] = 210,["165"] = 211,["166"] = 212,["167"] = 213,["171"] = 221,["172"] = 222,["173"] = 223,["174"] = 225,["175"] = 225,["176"] = 225,["177"] = 226,["178"] = 227,["179"] = 229,["180"] = 230,["181"] = 230,["182"] = 230,["183"] = 230,["184"] = 230,["185"] = 235,["186"] = 225,["187"] = 225,["188"] = 238,["190"] = 205,["191"] = 205,["192"] = 244,["194"] = 156,["195"] = 27,["196"] = 27,["197"] = 27,["198"] = 27,["199"] = 27,["200"] = 27,["201"] = 27,["202"] = 27,["203"] = 27,["204"] = 27,["205"] = 38,["206"] = 24,["207"] = 25});
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local runeNames = {
    item_fusion_hawkeye = {zh = "鹰眼符文", en = "Hawkeye Fusion"},
    item_fusion_forbidden = {zh = "禁忌符文", en = "Forbidden Fusion"},
    item_fusion_brutal = {zh = "暴虐符文", en = "Brutal Fusion"},
    item_fusion_beast = {zh = "兽化符文", en = "Beast Fusion"},
    item_fusion_life = {zh = "生命符文", en = "Life Fusion"},
    item_fusion_shadow = {zh = "暗影符文", en = "Shadow Fusion"},
    item_fusion_magic = {zh = "魔化符文", en = "Magic Fusion"},
    item_fusion_agile = {zh = "灵动符文", en = "Agile Fusion"}
}
____exports.FusionRuneManager = __TS__Class()
local FusionRuneManager = ____exports.FusionRuneManager
FusionRuneManager.name = "FusionRuneManager"
function FusionRuneManager.prototype.____constructor(self)
end
function FusionRuneManager.LoadRuneConfigs(self)
    self.runeConfigs = {}
    __TS__ArrayForEach(
        self.RUNE_ITEM_NAMES,
        function(____, itemName)
            local ____opt_0 = LoadKeyValues("scripts/npc/npc_items_custom.txt")
            local itemKV = ____opt_0 and ____opt_0[itemName]
            if itemKV then
                local ____self_runeConfigs_2 = self.runeConfigs
                ____self_runeConfigs_2[#____self_runeConfigs_2 + 1] = {
                    itemName = itemName,
                    initialStockTimeSeconds = (__TS__ParseInt(itemKV.ItemInitialStockTime) or 720) - 60,
                    stockTimeSeconds = __TS__ParseInt(itemKV.ItemStockTime) or 240,
                    initialStock = __TS__ParseInt(itemKV.ItemStockInitial) or 0,
                    maxStock = __TS__ParseInt(itemKV.ItemStockMax) or 3
                }
                print(((((((("[FusionRune] Loaded config for " .. itemName) .. ": initial=") .. tostring(itemKV.ItemInitialStockTime)) .. "s (actual: ") .. tostring((__TS__ParseInt(itemKV.ItemInitialStockTime) or 720) - 60)) .. "s), interval=") .. tostring(itemKV.ItemStockTime)) .. "s")
            else
                print("[FusionRune] Warning: Could not load config for " .. itemName)
            end
        end
    )
    print(("[FusionRune] Loaded " .. tostring(#self.runeConfigs)) .. " rune configurations")
end
function FusionRuneManager.GetHighDifficultyConfig(self)
    local multiplier = GameRules.Option.direGoldXpMultiplier
    local midmode = GameRules.Option.midOnlyMode
    return {shouldAddExtra = multiplier >= 40 or multiplier >= 20 or midmode, shouldAddInitialStock = multiplier >= 100}
end
function FusionRuneManager.InitializeFusion(self)
    local gameMode = GameRules:GetGameModeEntity()
    if not gameMode then
        print("[FusionRune] GameMode entity not found!")
        return
    end
    self:LoadRuneConfigs()
    if #self.runeConfigs == 0 then
        print("[FusionRune] No rune configs loaded!")
        return
    end
    local multiplier = GameRules.Option.direGoldXpMultiplier
    local difficultyConfig = self:GetHighDifficultyConfig()
    print("[FusionRune] Initializing fusion rune stock system...")
    print("[FusionRune] Difficulty multiplier: " .. tostring(multiplier))
    print("[FusionRune] High difficulty extra refresh: " .. tostring(difficultyConfig.shouldAddExtra))
    print("[FusionRune] Extra initial stock (>100x): " .. tostring(difficultyConfig.shouldAddInitialStock))
    if difficultyConfig.shouldAddInitialStock then
        self:AddExtraInitialStock()
    end
    __TS__ArrayForEach(
        self.runeConfigs,
        function(____, rune)
            do
                local function ____catch(____error)
                    print((("[FusionRune] Error setting up " .. rune.itemName) .. ": ") .. tostring(____error))
                end
                local ____try, ____hasReturned = pcall(function()
                    print(("[FusionRune] " .. rune.itemName) .. ":")
                    print((("  - Initial stock: " .. tostring(rune.initialStock)) .. ", Max stock: ") .. tostring(rune.maxStock))
                    print(("  - Initial time: " .. tostring(rune.initialStockTimeSeconds)) .. "s")
                    print(("  - Stock interval: " .. tostring(rune.stockTimeSeconds)) .. "s")
                    self:SetupExtraStockRefresh(rune, difficultyConfig)
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
    )
    print(("[FusionRune] Initialized " .. tostring(#self.runeConfigs)) .. " fusion runes")
end
function FusionRuneManager.AddExtraInitialStock(self)
    print("[FusionRune] Adding extra initial stock for >100x multiplier...")
    __TS__ArrayForEach(
        self.RUNE_ITEM_NAMES,
        function(____, itemName)
            local runeInfo = runeNames[itemName]
            local runeName = runeInfo and ((tostring(runeInfo.zh) .. " (") .. tostring(runeInfo.en)) .. ")" or itemName
            GameRules:IncreaseItemStock(DOTA_TEAM_GOODGUYS, itemName, 1, -1)
            GameRules:IncreaseItemStock(DOTA_TEAM_BADGUYS, itemName, 1, -1)
            print("[FusionRune] Added extra initial stock for " .. runeName)
            GameRules:SendCustomMessage(runeName .. "已为100倍难度玩家额外增加初始库存", 1, 0)
        end
    )
end
function FusionRuneManager.SetupExtraStockRefresh(self, rune, difficultyConfig)
    local runeInfo = runeNames[rune.itemName]
    local runeName = runeInfo and ((tostring(runeInfo.zh) .. " (") .. tostring(runeInfo.en)) .. ")" or rune.itemName
    local kvTimeSequence = {}
    kvTimeSequence[#kvTimeSequence + 1] = rune.initialStockTimeSeconds
    do
        local i = 1
        while i < 20 do
            kvTimeSequence[#kvTimeSequence + 1] = rune.initialStockTimeSeconds + i * rune.stockTimeSeconds
            i = i + 1
        end
    end
    print(((("[FusionRune] " .. rune.itemName) .. ": KV time sequence: ") .. table.concat(
        __TS__ArraySlice(kvTimeSequence, 0, 5),
        ", "
    )) .. "...")
    if difficultyConfig.shouldAddExtra then
        local multiplier = GameRules.Option.direGoldXpMultiplier
        local midmode = GameRules.Option.midOnlyMode
        local timeMultiplier = 1
        if multiplier >= 100 then
            timeMultiplier = timeMultiplier * 0.5
        elseif multiplier >= 40 then
            timeMultiplier = timeMultiplier * 0.6
        elseif multiplier >= 20 then
            timeMultiplier = timeMultiplier * 0.8
        elseif midmode then
            timeMultiplier = timeMultiplier * 0.8
        end
        local scaledInitialTime = rune.initialStockTimeSeconds * timeMultiplier
        local scaledInterval = rune.stockTimeSeconds * timeMultiplier
        local dynamicTimeSequence = {}
        local currentTime = scaledInitialTime
        do
            local i = 0
            while i < 20 do
                dynamicTimeSequence[#dynamicTimeSequence + 1] = currentTime
                currentTime = currentTime + scaledInterval
                i = i + 1
            end
        end
        print(((("[FusionRune] " .. rune.itemName) .. ": Dynamic time sequence: ") .. table.concat(
            __TS__ArraySlice(dynamicTimeSequence, 0, 5),
            ", "
        )) .. "...")
        local threshold = scaledInterval / 2
        local extraRefreshCount = 0
        __TS__ArrayForEach(
            dynamicTimeSequence,
            function(____, dynamicTime)
                local tooClose = false
                for ____, kvTime in ipairs(kvTimeSequence) do
                    local timeDiff = math.abs(dynamicTime - kvTime)
                    if timeDiff < threshold then
                        tooClose = true
                        print(((((((((("[FusionRune] " .. rune.itemName) .. ": Skipping dynamic time ") .. tostring(dynamicTime)) .. "s (too close to KV time ") .. tostring(kvTime)) .. "s, diff: ") .. tostring(timeDiff)) .. "s < threshold: ") .. tostring(threshold)) .. "s)")
                        break
                    end
                end
                if not tooClose then
                    extraRefreshCount = extraRefreshCount + 1
                    local refreshIndex = extraRefreshCount
                    Timers:CreateTimer(
                        dynamicTime,
                        function()
                            GameRules:IncreaseItemStock(DOTA_TEAM_GOODGUYS, rune.itemName, 1, -1)
                            GameRules:IncreaseItemStock(DOTA_TEAM_BADGUYS, rune.itemName, 1, -1)
                            print(((((("[FusionRune] " .. rune.itemName) .. ": Extra stock #") .. tostring(refreshIndex)) .. " at ") .. tostring(dynamicTime)) .. "s")
                            GameRules:SendCustomMessage(
                                ((runeName .. "已为高难度玩家单独增配/refreshed (Extra #") .. tostring(refreshIndex)) .. ")",
                                1,
                                0
                            )
                            return nil
                        end
                    )
                    print(((((("[FusionRune] " .. rune.itemName) .. ": Scheduled extra refresh #") .. tostring(refreshIndex)) .. " at ") .. tostring(dynamicTime)) .. "s")
                end
            end
        )
        print(((("[FusionRune] " .. rune.itemName) .. ": Scheduled ") .. tostring(extraRefreshCount)) .. " extra refreshes")
    end
end
FusionRuneManager.RUNE_ITEM_NAMES = {
    "item_fusion_hawkeye",
    "item_fusion_forbidden",
    "item_fusion_brutal",
    "item_fusion_beast",
    "item_fusion_life",
    "item_fusion_shadow",
    "item_fusion_magic",
    "item_fusion_agile"
}
FusionRuneManager.runeConfigs = {}
FusionRuneManager = __TS__DecorateLegacy({reloadable}, FusionRuneManager)
____exports.FusionRuneManager = FusionRuneManager
return ____exports
