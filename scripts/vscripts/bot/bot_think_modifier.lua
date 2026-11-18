modifier_bot_think_item_use = class({})
function modifier_bot_think_item_use:IsPurgable() return false end
function modifier_bot_think_item_use:IsHidden() return true end
function modifier_bot_think_item_use:RemoveOnDeath() return false end
function modifier_bot_think_item_use:OnCreated()
if IsClient() then return end
if not self then return end
local lagTime = RandomFloat(0.03, 0.6)
Timers:CreateTimer(lagTime, function()
if not self then return end
local hHero = self:GetParent()
if not hHero or hHero:IsNull() or not hHero:IsAlive() then return end
self:StartIntervalThink(0.6)
end)
end
function modifier_bot_think_item_use:OnIntervalThink()
if IsClient() then return end
if not self then return end
local hHero = self:GetParent()
if not hHero:IsAlive() then self:StartIntervalThink(-1) return end
if IsHeroUncontrollable(hHero) then return end
local hAbility1 = hHero:GetAbilityByIndex(0)
local hAbility2 = hHero:GetAbilityByIndex(1)
local hAbility3 = hHero:GetAbilityByIndex(2)
local hAbility4 = hHero:GetAbilityByIndex(3)
local hAbility5 = hHero:GetAbilityByIndex(4)
local hAbility6 = hHero:GetAbilityByIndex(5)
if hAbility1 and hAbility1:IsInAbilityPhase() then return end
if hAbility2 and hAbility2:IsInAbilityPhase() then return end
if hAbility3 and hAbility3:IsInAbilityPhase() then return end
if hAbility4 and hAbility4:IsInAbilityPhase() then return end
if hAbility5 and hAbility5:IsInAbilityPhase() then return end
if hAbility6 and hAbility6:IsInAbilityPhase() then return end
if BotItemThink:UseActiveItem(hHero) then return end
if hHero:IsSilenced() then return end
if BotAbilityThink:ThinkUseAbility(hHero) then return end
end
modifier_bot_think_strategy = class({})
function modifier_bot_think_strategy:IsPurgable() return false end
function modifier_bot_think_strategy:IsHidden() return true end
function modifier_bot_think_strategy:RemoveOnDeath() return false end
function modifier_bot_think_strategy:OnCreated()
if IsClient() then return end
if not self then return end
self.nextWardThinkTime = 0
Timers:CreateTimer(RandomFloat(0.03, 5), function()
if not self then return end
local hHero = self:GetParent()
if not hHero or hHero:IsNull() or not hHero:IsAlive() then return end
self:StartIntervalThink(5)
end)
end
function modifier_bot_think_strategy:OnIntervalThink()
if IsClient() then return end
if not self then return end
local GameTime = GameRules:GetDOTATime(false, false)
local hHero = self:GetParent()
if hHero:IsNull() then return end
if not hHero:IsAlive() then self:StartIntervalThink(-1) return end
BotThink:AddMoney(hHero)
if IsHeroUncontrollable(hHero) then return end
BotThink:ThinkSell(hHero)
BotThink:ThinkPurchase(hHero)
BotThink:ThinkConsumeItem(hHero)
if GameTime < self.nextWardThinkTime then return end
self.nextWardThinkTime = GameTime + 10
BotThink:PutWardObserver(hHero)
BotThink:PutWardSentry(hHero)
end
modifier_bot_think_ward = class({})
function modifier_bot_think_ward:IsPurgable() return false end
function modifier_bot_think_ward:IsHidden() return true end
function modifier_bot_think_ward:RemoveOnDeath() return false end
function modifier_bot_think_ward:OnCreated()
if IsClient() then return end
if not self then return end
local interval = 120
if AIGameMode.DebugMode then interval = 30 end
Timers:CreateTimer(RandomFloat(0.03, interval), function()
if not self then return end
local hHero = self:GetParent()
if not hHero or hHero:IsNull() or not hHero:IsAlive() then return end
self:StartIntervalThink(interval)
end)
end
function modifier_bot_think_ward:OnIntervalThink()
if IsClient() then return end
if not self then return end
local hHero = self:GetParent()
if hHero:IsNull() then return end
if not hHero:IsAlive() then self:StartIntervalThink(-1) return end
if IsHeroUncontrollable(hHero) then return end
BotThink:AddWardItem(hHero)
end
