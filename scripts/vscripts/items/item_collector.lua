AutoCollector = AutoCollector or {}
AutoCollector.max_item_x = nil
function AutoCollector:OnGameStart()
Timers:CreateTimer(300, function()
Timers:CreateTimer(0, function()
CollectItems()
return 60
end)
Timers:CreateTimer(0.1, function()
ClearItemAreasTrees()
return 10
end)
end)
end
function CollectItems()
local origin = Vector(-5820, -6580, 384)
local items = Entities:FindAllByClassname("dota_item_drop")
print(string.format("[AutoCollector] 找到 %d 个地上的物品", #items))
local player_items = {}
local unowned_items = {}
local dragon_balls = {}
unowned_items.fusion = {}
unowned_items.special = {}
unowned_items.equipment = {}
for _, item_physical in pairs(items) do
local item = item_physical:GetContainedItem()
if item then
local item_name = item:GetName()
local owner = item:GetOwner()
local player_id = nil
if owner and owner:IsRealHero() then
player_id = owner:GetPlayerOwnerID()
local team = owner:GetTeam()
if team == DOTA_TEAM_BADGUYS then
player_id = nil
end
end
local category = nil
if string.find(item_name, "dragon_ball") then
table.insert(dragon_balls, item_physical)
print(string.format("[AutoCollector] 发现龙珠: %s", item_name))
elseif string.find(item_name, "fusion") then
category = "fusion"
elseif string.find(item_name, "rune_transmuter") or
string.find(item_name, "skill_talisman") or
string.find(item_name, "skill_learning") or
string.find(item_name, "ability_replacer") or
string.find(item_name, "scroll_guardian_angel") or
string.find(item_name, "item_zhuque") or
string.find(item_name, "item_baihu") or
string.find(item_name, "item_xuanwu") or
string.find(item_name, "item_qinglong") then
category = "special"
else
category = "equipment"
end
if category then
if player_id then
if not player_items[player_id] then
player_items[player_id] = {
fusion = {},
special = {},
equipment = {}
}
end
table.insert(player_items[player_id][category], item_physical)
else
table.insert(unowned_items[category], item_physical)
end
end
end
end
table.sort(dragon_balls, function(a, b)
local item_a = a:GetContainedItem()
local item_b = b:GetContainedItem()
if item_a and item_b then
return item_a:GetName() < item_b:GetName()
end
return false
end)
for player_id, items_group in pairs(player_items) do
table.sort(items_group.fusion, function(a, b)
return a:GetContainedItem():GetName() < b:GetContainedItem():GetName()
end)
table.sort(items_group.special, function(a, b)
return a:GetContainedItem():GetName() < b:GetContainedItem():GetName()
end)
table.sort(items_group.equipment, function(a, b)
return a:GetContainedItem():GetName() < b:GetContainedItem():GetName()
end)
end
table.sort(unowned_items.fusion, function(a, b)
return a:GetContainedItem():GetName() < b:GetContainedItem():GetName()
end)
table.sort(unowned_items.special, function(a, b)
return a:GetContainedItem():GetName() < b:GetContainedItem():GetName()
end)
table.sort(unowned_items.equipment, function(a, b)
return a:GetContainedItem():GetName() < b:GetContainedItem():GetName()
end)
if #dragon_balls > 0 then
local dragon_ball_origin = Vector(origin.x, origin.y, origin.z)
ArrangeDragonBalls(dragon_balls, dragon_ball_origin)
print(string.format("[AutoCollector] 龙珠排列完成，起始x=%.0f，数量=%d",
dragon_ball_origin.x, #dragon_balls))
end
local current_x = origin.x
local player_gap = 200
for player_id, items_group in pairs(player_items) do
local player_origin = Vector(current_x, origin.y, origin.z)
local player_max_items = math.max(
#items_group.fusion,
#items_group.special,
#items_group.equipment
)
ArrangePlayerItems(items_group, player_origin, player_max_items, player_id)
current_x = current_x + (player_max_items * 100) + player_gap
print(string.format("[AutoCollector] 玩家%d物品排列完成，起始x=%.0f，最大物品数=%d",
player_id, player_origin.x, player_max_items))
end
local unowned_max = math.max(
#unowned_items.fusion,
#unowned_items.special,
#unowned_items.equipment
)
local unowned_origin = Vector(current_x, origin.y, origin.z)
ArrangePlayerItems(unowned_items, unowned_origin, unowned_max, nil)
current_x = current_x + (unowned_max * 100)
AutoCollector.max_item_x = current_x
local total_players = 0
local total_items = 0
for player_id, items_group in pairs(player_items) do
total_players = total_players + 1
local player_total = #items_group.fusion +
#items_group.special + #items_group.equipment
total_items = total_items + player_total
end
local unowned_total = #unowned_items.fusion +
#unowned_items.special + #unowned_items.equipment
total_items = total_items + unowned_total + #dragon_balls
if total_items > 0 then
local message = string.format("自动收集了 %d 个物品：%d个玩家组 + 无主组 %d个物品 + 龙珠 %d个",
total_items, total_players, unowned_total, #dragon_balls)
GameRules:SendCustomMessage("<font color='#00FF00'>[自动收集] " .. message .. "</font>", 0, 0)
end
end
function ArrangeDragonBalls(dragon_balls, origin)
local start_x = origin.x + 150
local y_offset = origin.y - 100
local x_spacing = 100
for i, item_physical in pairs(dragon_balls) do
local new_pos = Vector(start_x + ((i - 1) * x_spacing), y_offset, origin.z - 130)
item_physical:SetAbsOrigin(new_pos)
local item = item_physical:GetContainedItem()
if item then
print(string.format("[AutoCollector] 龙珠 %s 排列在位置 (%.0f, %.0f)",
item:GetName(), new_pos.x, new_pos.y))
end
end
end
function OnSpellStart(event)
local caster = event.caster
CollectItems()
ClearItemAreasTrees()
local item = caster:FindItemInInventory("item_collector")
if item then
item:SpendCharge(1)
end
local message = "手动收集完成，已按玩家分组排列；定时自动收集开始，持续5分钟"
GameRules:SendCustomMessage(message, 0, 0)
local total_duration = 0
Timers:CreateTimer(60, function()
CollectItems()
total_duration = total_duration + 60
if total_duration > 300 then
return nil
end
return 60
end)
local total_duration_clear = 0
Timers:CreateTimer(10, function()
ClearItemAreasTrees()
total_duration_clear = total_duration_clear + 10
if total_duration_clear > 300 then
return nil
end
return 10
end)
end
function ArrangeItems(items, origin, row, max_items_per_row)
local start_x = origin.x + 100
local y_offset = origin.y - 200 - (row * 100)
local x_spacing = 100
for i, item_physical in pairs(items) do
local new_pos = Vector(start_x + (i * x_spacing), y_offset, origin.z - 130)
item_physical:SetAbsOrigin(new_pos)
end
end
function ArrangePlayerItems(items_group, origin, max_items_per_row, player_id)
local start_x = origin.x + 50
local y_offset_base = origin.y - 200
local x_spacing = 100
local y_spacing = 100
local categories = { "fusion", "special", "equipment" }
for i, category in ipairs(categories) do
local items = items_group[category]
local y_offset = y_offset_base - ((i - 1) * y_spacing)
for j, item_physical in pairs(items) do
local new_pos = Vector(start_x + (j * x_spacing), y_offset, origin.z - 130)
item_physical:SetAbsOrigin(new_pos)
end
end
end
function ClearItemAreasTrees()
local origin = Vector(-5820, -6580, 384)
local max_coverage_x = AutoCollector.max_item_x or (origin.x + 500)
for row = 0, 3 do
local y_offset = origin.y - 100 - (row * 100)
for x = origin.x + 100, max_coverage_x + 100, 100 do
local clear_pos = Vector(x, y_offset, origin.z - 130)
GridNav:DestroyTreesAroundPoint(clear_pos, 100, true)
end
end
print(string.format("[AutoCollector] 已清理物品放置区域的树木，范围至 x=%.0f", max_coverage_x))
end
