local dropTable = nil
local TauntMessages = {
boss_kill_player = {
schinese = {
"侥幸侥幸", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?",
"哎哟,不小心", "队友呢,队友呢?", "有点轻松", "路过路过?", "嘎嘣脆", "找踢呢",
"你瞅啥", "让你看了吗", "这就没了？", "差一点点哦", "跑快点啊", "啧啧啧", "你看你m呢",
"欸，你不要似啊", "你怎么好像有点似了", "抓住一个", "呵呵!", "你搁那瞎几把晃悠啥啊看得我眼晕", "什么玩意儿花里胡哨的",
"我就散个步", "这就倒了?", "菜就多练啊", "还得练啊小老弟儿", "毫无压力", "啥啊，55扎扎的", "答应我，别送行吗",
"以后见你一次打你一次", "你好像优点菜啊兄弟", "你这么菜你队友不会怪你吧giegie"
},
english = {
"Lucky shot", "Oops, my bad", "Where's your team?",
"Too easy", "Just passing by", "Crispy", "Looking for trouble?",
"What are you looking at", "Did I say you could watch?",
"That's it?", "So close", "Run faster", "Tsk tsk tsk",
"Caught one", "Hehe!", "Just taking a walk", "Already down?",
"Practice more", "Still need practice, buddy", "No pressure",
"Stop feeding"
}
},
boss_rampage = {
schinese = {
"?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?",
"?", "蛆一样", "蛆一样", "蛆一样", "蛆一样？", "蛆一样？", "蛆一样？", "蛆一样？", "蛆一样", "蛆一样", "蛆一样", "蛆一样", "蛆一样", "蛆一样", "蛆一样",
"蛆一样",
"蛆", "蛆", "蛆", "蛆", "蛆", "蛆？", "蛆？", "蛆？", "蛆、", "蛆?", "蛆?", "蛆?", "蛆", "蛆", "蛆",
"爬", "爬", "爬", "爬", "爬", "爬?", "爬", "爬", "爬", "爬", "爬", "爬",
"?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?",
"你不会急眼了把？", "大家看他好急啊，他好气呀", "撒一把米在键盘上，鸡都玩的比你溜", "你玩游戏的这个时间，还不如多看几集喜羊羊", "你比美团还能送", "哥哥上手吧，别用脚玩了",
"你一直不杀人，是信佛吗？", "我要开直播", "两只耳朵中间夹着的是回族的禁忌吗", "逗？", "您是人机吗？",
"还有谁?", "就这?", "?", "送?", "送,接着送", "有点子寂寞哟", "太简单了", "哎哟，我以为减速带呢",
"弟弟", "一个能打的都没有",
"喜欢虐AI是吧？", "无聊", "没意思", "杀得我都累了", "排队送是吧", "能不能认真点？", "这就是你们的全部实力？", "再来十个也没用", "是不是没吃饭？", "打不动我啊",
"放弃吧别蹦跶了",
"小手儿扇忽扇忽的慢点啊，都快给我扇感冒了", "嘚吧嘚吧的干啥呢", "刚才好像不小心拍似了只蚊子，不会是你吧", "刚才脚边好像有只跳蚤蹦跶，踩似了，不会是你吧",
"集体送福利？", "血皮掉了一点，好怕", "坏了坏了人类保护署给我打电话了", "优秀优秀", "再送超鬼了", "你还还手啊，这样搞得我很没有成就感知道吗", "是不是该充钱了？",
"刚才有什么东西很快的似了一下",
"刚才好像有个虫子被我碾似了，不会是你吧",
"刚才有点太快了没看清，你能再似一次吗", "小胳膊小腿抡得挺欢，就是没瞅见我掉血啊", "叮叮当当地打半天，我还以为谁在敲锣呢", "这伤害刚好给我醒醒盹，谢了啊", "跑这么快，是急着去领复活奖励吗",
"刚才是不是有片叶子飘过去似了？不会是你吧哥哥", "刚才好像不小心踩似了一条蛆，不会是你吧",
"啊不行了不行了，挠的太痒了", "小腿儿捣腾的倒是挺快", "跑啊你怎么不跑了，哦你好像有点似了呢", "跑啊你怎么不跑了，是不是有点似了",
"怎么不继续刮了啊兄弟，还挺舒服的 哦，你看起来气色不大好——好像有点似了", "你看起来气色不大好，是不是好像有点似了",
"再来一波就通关了（我）", "还有高手？", "爽，好爽啊", "你不是很能打么？", "杀你们都嫌浪费时间",
"建议直接投降省时间", "来多少嘎多少", "就你们这实力真是老太婆进被窝 给爷整笑了", "排的也不够整齐啊，送就要有送的样子，向右看齐！",
"这就是所谓的大佬？笑了", "刮呀刮，刮个大气球", "再送下去我都满级了", "能不能换点新花样？", "下波我站着让你们打", "菜到我都不想动手",
"排队送人头，服务真周到", "你们这是在给我挠痒痒吗", "连杀记录又刷新咯", "刮痧大队集合了？", "速通失败警告"
},
english = {
"Getting mad?", "Look how angry they are",
"Even a chicken on the keyboard plays better",
"You deliver better than food delivery",
"Use your hands, not your feet",
"Who's next?", "Is that all?", "Keep feeding",
"Getting lonely here", "Too easy", "Noob",
"No one can fight", "Like bullying AI?", "Boring",
"Getting tired of killing", "Lining up to feed?",
"Can you be serious?", "Is this your full power?",
"Ten more won't help", "Did you eat?", "Can't hurt me",
"Give up already", "Group feeding?", "Lost a bit of HP, scary",
"Excellent", "Keep feeding for beyond godlike",
"Should you pay to win?", "One more wave and I win",
"Any pros?", "Can't stop", "Just surrender to save time",
"Kill as many as you send", "So-called pros? LOL",
"Keep feeding and I'll max level",
"Queueing to feed, nice service", "New kill streak record, thanks"
}
},
player_kill_boss = {
schinese = {
"哦ho", "大意了，没有闪", "有点意思", "什么情况", "卧槽", "不是，我说", "什么鬼", "啥",
"阴啊", "哎呀", "卡", "就你是吧", "可以可以", "这波我的", "Hey!", "fk",
"！", "！", "wtf", "SHIT", "！", "不对不对", "我他马", "屮", "我记住你了", "尼玛"
},
english = {
"Oh ho", "Careless, no flash", "Interesting",
"What happened", "WTF", "Wait, I mean", "What the",
"Huh", "Sneaky", "Ouch", "Lag", "Underestimated",
"Nice nice", "My bad", "Hey!", "fk", "wtf",
"SHIT", "Wait wait", "Messed up"
}
},
player_rampage_boss = {
schinese = {
"不行不行,我得刷会儿野", "人都没看清就被秒了",
"畜牲!", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?",
"你特么", "后里希！", "马泽法克！", "我特么", "错了错了,别打了", "哥,别打了,哥",
"好好好,这么玩是吧", "我服了", "大佬别充了，服了服了", "我真是", "哪天AI崛起了第一个干你",
"真的服了", "牛b", "投了投了", "我不服！", "我一定要杀了你", "巴噶！", "sob！", "你这狗东西",
"他妈的我好气啊！", "打不过打不过", "这什么玩意儿", "离谱！", "畜牲！",
"这尼玛", "咱们不是挚爱亲朋吗", "我要r你，就今晚", "我要r你的大爷",
"我r啊！", "下把第一个杀你！", "你走夜路小心点！", "尼格玛德！", "我淦啊！", "看着我的眼睛，告诉我，你是畜牲吗",
"太离谱了", "这还怎么玩", "不讲武德是吧", "年轻人，讲讲武德啊", "耗子尾汁啊", "我劝你们耗子尾汁啊",
"不玩了不玩了", "你这伤害开了吧", "见面就秒还玩个屁", "能不能给条活路", "你踏马别截图发群里行吗",
"报警了", "放过孩子吧", "这游戏平衡吗？", "你也就打打ai的水平了", "停手吧", "狗东西", "喂，110吗",
"SB！(上班)", "DSB！(都上班)", "NM！(牛马)",
"CNM！(纯牛马)", "NMB！(你忙吧)", "WCNM！(我纯牛马)", "CNM！(纯牛马)", "TMD！(挺忙的)", "NTMD！(你挺忙的)",
"*!", "啥啥啥这都是啥", "炸房吧毁灭吧", "你真不是好东西", "看着我的眼睛，告诉我，你是好东西吗",
"再杀我删游戏了", "别杀了，给AI留点面子", "有种你就杀我一百次", "我怀疑你开了", "打不过就加入行不行",
"再杀报警了", "我心态崩了，真的", "这游戏的Boss太难了（指我）", "给条活路行不行，大哥", "我怀疑你充了八万", "服了"
},
english = {
"No no, I need to farm", "Instant kill before I see anything",
"Beast!", "You damn", "Holy sh*t!", "WTF!", "I swear",
"Wrong wrong, stop hitting", "Bro, stop, bro",
"OK OK, playing like this huh", "I give up",
"Stop paying to win, I surrender", "I really",
"When AI rises, you're first", "Really give up",
"Stop stop", "I surrender", "I won't accept this!",
"I'll kill you", "Baka!", "You bastard",
"I'm so angry!", "Can't win", "What damage is this",
"Ridiculous", "WTF", "Too ridiculous", "How to play this",
"No honor", "Young man, show some honor",
"Not playing anymore", "You're cheating right",
"Instant kill, can't play", "Give me a chance",
"My items aren't ready", "Calling the police",
"Leave the kid alone", "Is this game balanced?",
"I quit", "Stop it", "Bastard", "Hello, 911?",
"Just destroy the game", "Kill me again and I uninstall",
"Stop, give AI some face", "Kill me 100 times if you dare",
"I think you're cheating", "Can't beat them, join them?",
"Kill again and I report", "My mental is broken, really",
"This game's Boss is too hard (me)", "Give me a chance, bro",
"I think you paid 80k", "Give up"
}
}
}
local BossKillStreak = 0
local PlayerKillBossStreak = 0
local function SendTauntMessage(messageType, playerID, victimName, bossHeroName, bossHero)
local language = "schinese"
if playerID then
local languageData = CustomNetTables:GetTableValue("player_language", tostring(playerID))
if languageData and languageData.lang then
language = languageData.lang
end
end
local messages = TauntMessages[messageType] and TauntMessages[messageType][language]
if not messages or #messages == 0 then
messages = TauntMessages[messageType] and TauntMessages[messageType]["schinese"]
end
if messages and #messages > 0 then
local randomIndex = RandomInt(1, #messages)
local message = messages[randomIndex]
local messageLength = string.len(message)
local delay = math.min(math.max(0.8, messageLength * 0.2), 4.0)
Timers:CreateTimer(delay, function()
local finalMessage = message
if victimName then
finalMessage = "<font color='#FFD700'>@" .. victimName .. "</font> " .. message
end
local bossLabel = "BotBoss"
if bossHeroName then
bossLabel = "BotBoss(<font color='#FFD700'>" .. bossHeroName .. "</font>)"
end
local formattedMessage = "<font color='#FF0000'>" .. bossLabel .. ": " .. finalMessage .. "</font>"
if bossHero and not bossHero:IsNull() then
NoFormatMessage = "@" .. victimName .. " " .. message
Say(bossHero, NoFormatMessage, false)
else
GameRules:SendCustomMessage(formattedMessage, 0, 0)
end
end)
end
end
local function CreateItemLocal(sItemName, hEntity)
local item = CreateItem(sItemName, nil, nil)
local pos = hEntity:GetAbsOrigin()
CreateItemOnPositionSync(pos, item)
local pos_launch = pos + RandomVector(RandomFloat(150, 200))
item:LaunchLoot(false, 200, 0.75, pos_launch, nil)
end
local function RollDrops(hHero)
if not dropTable then
dropTable = LoadKeyValues("scripts/kv/item_drops.kv")
end
for item_name, chance in pairs(dropTable) do
for i = 0, 8 do
local hItem = hHero:GetItemInSlot(i)
if hItem then
local hItem_name = hItem:GetName()
if item_name == hItem_name then
if RollPercentage(chance) then
UTIL_RemoveImmediate(hItem)
if item_name == "item_excalibur" then
CreateItemLocal(item_name, hHero)
end
if item_name == "item_rapier_MAX" then
CreateItemLocal(item_name, hHero)
end
end
end
end
end
end
end
local function RecordBarrackKilled(hEntity)
local team = hEntity:GetTeamNumber()
if DOTA_TEAM_GOODGUYS == team then
AIGameMode.barrackPushedBad = AIGameMode.barrackPushedBad + 1
print("barrackPushedBad ", AIGameMode.barrackPushedBad)
elseif DOTA_TEAM_BADGUYS == team then
AIGameMode.barrackPushedGood = AIGameMode.barrackPushedGood + 1
print("barrackPushedGood ", AIGameMode.barrackPushedGood)
end
end
local function RecordTowerKilled(hEntity)
local team = hEntity:GetTeamNumber()
local sName = hEntity:GetUnitName()
if string.find(sName, "tower1") then
if DOTA_TEAM_GOODGUYS == team then
AIGameMode.tower1PushedBad = AIGameMode.tower1PushedBad + 1
print("tower1PushedBad ", AIGameMode.tower1PushedBad)
elseif DOTA_TEAM_BADGUYS == team then
AIGameMode.tower1PushedGood = AIGameMode.tower1PushedGood + 1
print("tower1PushedGood ", AIGameMode.tower1PushedGood)
end
elseif string.find(sName, "tower2") then
if DOTA_TEAM_GOODGUYS == team then
AIGameMode.tower2PushedBad = AIGameMode.tower2PushedBad + 1
print("tower2PushedBad ", AIGameMode.tower2PushedBad)
elseif DOTA_TEAM_BADGUYS == team then
AIGameMode.tower2PushedGood = AIGameMode.tower2PushedGood + 1
print("tower2PushedGood ", AIGameMode.tower2PushedGood)
end
elseif string.find(sName, "tower3") then
if DOTA_TEAM_GOODGUYS == team then
AIGameMode.tower3PushedBad = AIGameMode.tower3PushedBad + 1
print("tower3PushedBad ", AIGameMode.tower3PushedBad)
if AIGameMode.tower3PushedBad == 1 then
local towers = Entities:FindAllByClassname("npc_dota_tower")
for _, tower in pairs(towers) do
if string.find(tower:GetUnitName(), "npc_dota_goodguys_tower4") then
local towerSplitShot = tower:AddAbility("tower_split_shot")
if towerSplitShot then
towerSplitShot:SetLevel(1)
towerSplitShot:ToggleAbility()
end
end
end
local forts = Entities:FindAllByClassname("npc_dota_fort")
for _, fort in pairs(forts) do
if string.find(fort:GetUnitName(), "npc_dota_goodguys_fort") then
local towerSplitShot = fort:AddAbility("tower_split_shot")
if towerSplitShot then
towerSplitShot:SetLevel(3)
towerSplitShot:ToggleAbility()
end
end
end
end
elseif DOTA_TEAM_BADGUYS == team then
AIGameMode.tower3PushedGood = AIGameMode.tower3PushedGood + 1
print("tower3PushedGood ", AIGameMode.tower3PushedGood)
if AIGameMode.tower3PushedGood == 1 then
local towers = Entities:FindAllByClassname("npc_dota_tower")
for _, tower in pairs(towers) do
if string.find(tower:GetUnitName(), "npc_dota_badguys_tower4") then
local towerSplitShot = tower:AddAbility("tower_split_shot")
if towerSplitShot then
towerSplitShot:SetLevel(1)
towerSplitShot:ToggleAbility()
end
end
end
local forts = Entities:FindAllByClassname("npc_dota_fort")
for _, fort in pairs(forts) do
if string.find(fort:GetUnitName(), "npc_dota_badguys_fort") then
local towerSplitShot = fort:AddAbility("tower_split_shot")
if towerSplitShot then
towerSplitShot:SetLevel(2)
towerSplitShot:ToggleAbility()
end
end
end
end
end
elseif string.find(sName, "tower4") then
if DOTA_TEAM_GOODGUYS == team then
AIGameMode.tower4PushedBad = AIGameMode.tower4PushedBad + 1
print("tower4PushedBad ", AIGameMode.tower4PushedBad)
elseif DOTA_TEAM_BADGUYS == team then
AIGameMode.tower4PushedGood = AIGameMode.tower4PushedGood + 1
print("tower4PushedGood ", AIGameMode.tower4PushedGood)
end
end
end
local function GetPlayerName(playerId)
local playerName = nil
local steamAccountID = PlayerResource:GetSteamAccountID(playerId)
if steamAccountID > 0 then
local key = tostring(steamAccountID)
local playerData = CustomNetTables:GetTableValue("player_table", key)
if playerData then
if playerData.playerName then
playerName = playerData.playerName
end
end
end
if not playerName or playerName == "" then
playerName = PlayerResource:GetPlayerName(playerId)
end
if not playerName or playerName == "" then
local hero = PlayerResource:GetSelectedHeroEntity(playerId)
if hero then
local heroName = hero:GetUnitName()
playerName = string.gsub(heroName, "npc_dota_hero_", "")
end
end
return playerName
end
local function HeroKilled(keys)
local hHero = EntIndexToHScript(keys.entindex_killed)
local attacker = EntIndexToHScript(keys.entindex_attacker)
local playerId = hHero:GetPlayerID()
local attackerPlayer = attacker:GetPlayerOwner()
local attackerPlayerID = -1
if attackerPlayer then
attackerPlayerID = attackerPlayer:GetPlayerID()
end
local isBoss = hHero.isBoss or false
local attackerIsBoss = attacker.isBoss or false
if attackerIsBoss and not isBoss then
BossKillStreak = BossKillStreak + 1
PlayerKillBossStreak = 0
local victimName = GetPlayerName(playerId)
local bossHeroName = attacker:GetUnitName()
bossHeroName = string.gsub(bossHeroName, "npc_dota_hero_", "")
if not attacker.bossKillCount then
attacker.bossKillCount = 0
attacker.bossBaseScale = attacker:GetModelScale() or 1.0
end
attacker.bossKillCount = attacker.bossKillCount + 1
local speakProbability = math.min(30 + BossKillStreak * 10, 100)
local randomValue = RandomInt(1, 100)
if randomValue <= speakProbability then
if BossKillStreak >= 2 then
SendTauntMessage("boss_rampage", playerId, victimName, bossHeroName, attacker)
else
SendTauntMessage("boss_kill_player", playerId, victimName, bossHeroName, attacker)
end
end
end
if not attackerIsBoss and isBoss and attackerPlayer then
PlayerKillBossStreak = PlayerKillBossStreak + 1
BossKillStreak = 0
local killerName = GetPlayerName(attackerPlayerID)
local bossHeroName = hHero:GetUnitName()
bossHeroName = string.gsub(bossHeroName, "npc_dota_hero_", "")
if not hHero.bossDeathCount then
hHero.bossDeathCount = 0
hHero.bossBaseScale = hHero:GetModelScale() or 1.0
end
hHero.bossDeathCount = hHero.bossDeathCount + 1
local scaleReduction = hHero.bossDeathCount * 0.05
local newScale = math.max(hHero.bossBaseScale * 0.5, hHero.bossBaseScale - scaleReduction)
hHero:SetModelScale(newScale)
local newLevel = math.min(math.floor(hHero.bossDeathCount / 2), 30)
local bossAbility = hHero:FindAbilityByName("boss_death_power")
if bossAbility then
bossAbility:SetLevel(newLevel)
end
local speakProbability = math.min(30 + PlayerKillBossStreak * 10, 100)
local randomValue = RandomInt(1, 100)
if randomValue <= speakProbability then
if PlayerKillBossStreak >= 2 then
SendTauntMessage("player_rampage_boss", attackerPlayerID, killerName, bossHeroName, hHero)
else
SendTauntMessage("player_kill_boss", attackerPlayerID, killerName, bossHeroName, hHero)
end
end
end
local iLevel = hHero:GetLevel()
local GameTime = GameRules:GetDOTATime(false, false)
local bossMultiplier = 1
if isBoss then
local botMultiplier = AIGameMode.fBotGoldXpMultiplier or 1
if botMultiplier >= 60 then
bossMultiplier = 3
elseif botMultiplier >= 20 then
bossMultiplier = 2.5
else
bossMultiplier = 2
end
end
if attackerPlayer and IsGoodTeamPlayer(attackerPlayerID) and IsBadTeamPlayer(playerId) then
local gold = 0
if iLevel <= 30 then
gold = 5 + iLevel * 0.5
elseif iLevel <= 50 then
gold = 20 + (iLevel - 30) * 1
else
gold = 40
end
gold = math.ceil(gold * bossMultiplier)
for playerID = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
if attackerPlayerID ~= playerID and PlayerResource:IsValidPlayerID(playerID) and
PlayerResource:IsValidPlayer(playerID) and
PlayerResource:GetSelectedHeroEntity(playerID) and IsGoodTeamPlayer(playerID) then
GameRules:ModifyGoldFiltered(playerID, gold, true, DOTA_ModifyGold_HeroKill)
local playerHero = PlayerResource:GetSelectedHeroEntity(playerID)
SendOverheadEventMessage(playerHero, OVERHEAD_ALERT_GOLD, playerHero,
gold * AIGameMode:GetPlayerGoldXpMultiplier(playerID), playerHero)
end
end
end
if attackerPlayer and IsGoodTeamPlayer(attackerPlayerID) and IsBadTeamPlayer(playerId) then
if AIGameMode.BotRecordSuccessiveDeathTable[playerId] then
AIGameMode.BotRecordSuccessiveDeathTable[playerId] = AIGameMode.BotRecordSuccessiveDeathTable[playerId] + 1
else
AIGameMode.BotRecordSuccessiveDeathTable[playerId] = 1
end
end
if attackerPlayer and IsBadTeamPlayer(attackerPlayerID) and IsGoodTeamPlayer(playerId) then
AIGameMode.BotRecordSuccessiveDeathTable[attackerPlayerID] = 0
end
if attackerPlayer and IsGoodTeamPlayer(attackerPlayerID) and IsBadTeamPlayer(playerId) and
AIGameMode.BotRecordSuccessiveDeathTable[playerId] and AIGameMode.BotRecordSuccessiveDeathTable[playerId] >= 3 then
local deathCount = AIGameMode.BotRecordSuccessiveDeathTable[playerId]
local gold = 0
local xp = 0
if GameTime <= 5 * 60 then
gold = 20
xp = 40
elseif GameTime <= 10 * 60 then
gold = 30
xp = 60
else
gold = 40
xp = 80
end
local killerLevel = attacker:GetLevel()
gold = gold + killerLevel * 6
xp = xp + killerLevel * 4
if iLevel >= 50 then
xp = 0
end
local extraFactor = math.max(1, deathCount - 2)
local playerTeamKill = PlayerResource:GetTeamKills(PlayerResource:GetTeam(attackerPlayerID))
local AITeamKill = PlayerResource:GetTeamKills(PlayerResource:GetTeam(playerId))
local teamKillFactor = playerTeamKill / (AITeamKill + 3) - 1
local totalFactor = extraFactor + teamKillFactor
totalFactor = math.max(totalFactor, 0)
totalFactor = math.min(totalFactor, 10)
totalFactor = totalFactor * (AIGameMode.playerNumber) / 10
gold = math.ceil(gold * totalFactor)
xp = math.ceil(xp * AIGameMode:GetPlayerGoldXpMultiplier(playerId) * totalFactor)
if PlayerResource:IsValidPlayerID(playerId) and PlayerResource:IsValidPlayer(playerId) and
PlayerResource:GetSelectedHeroEntity(playerId) then
GameRules:ModifyGoldFiltered(playerId, gold, true, DOTA_ModifyGold_CreepKill)
hHero:AddExperience(xp, DOTA_ModifyXP_CreepKill, false, false)
end
end
end
function AIGameMode:OnEntityKilled(keys)
local hEntity = EntIndexToHScript(keys.entindex_killed)
if hEntity:IsRealHero() and hEntity:IsReincarnating() == false then
HeroKilled(keys)
RollDrops(EntIndexToHScript(keys.entindex_killed))
end
if hEntity:GetClassname() == "npc_dota_barracks" then
RecordBarrackKilled(hEntity)
end
if hEntity:GetClassname() == "npc_dota_tower" then
RecordTowerKilled(hEntity)
end
end
