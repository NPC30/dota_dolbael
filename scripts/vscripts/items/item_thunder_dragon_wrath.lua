LinkLuaModifier("modifier_item_thunder_dragon_wrath_phase", "items/item_thunder_dragon_wrath", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_thunder_dragon_wrath_charge", "items/item_thunder_dragon_wrath", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_thunder_dragon_wrath_slow", "items/item_thunder_dragon_wrath", LUA_MODIFIER_MOTION_NONE)

function ThunderDragonWrathOnCreated(keys)
	if not IsServer() then return end
	local caster = keys.caster
	local ability = keys.ability
	if not caster or not ability then return end

	local hydra_modifier = caster:AddNewModifier(caster, ability, "modifier_hydras_breath", {})
	local mjollnir_modifier = caster:AddNewModifier(caster, ability, "modifier_item_mjollnir", {})
	ability.added_modifiers = ability.added_modifiers or {}

	if hydra_modifier then
		table.insert(ability.added_modifiers, hydra_modifier)
	end
	if mjollnir_modifier then
		table.insert(ability.added_modifiers, mjollnir_modifier)
	end
end

function ThunderDragonWrathOnDestroy(keys)
	if not IsServer() then return end
	local ability = keys.ability
	if not ability or not ability.added_modifiers then return end

	for _, modifier in pairs(ability.added_modifiers) do
		if modifier and not modifier:IsNull() then
			modifier:Destroy()
		end
	end
	ability.added_modifiers = nil
end

function ThunderDragonWrathOnSpellStart(keys)
	if not IsServer() then return end
	local caster = keys.caster
	local ability = keys.ability
	if not caster or not ability then return end

	caster:RemoveModifierByName("modifier_item_thunder_dragon_wrath_phase")
	caster:RemoveModifierByName("modifier_item_thunder_dragon_wrath_charge")
	caster:AddNewModifier(caster, ability, "modifier_item_thunder_dragon_wrath_phase", {
		duration = ability:GetSpecialValueFor("untargetable_duration")
	})
	caster:AddNewModifier(caster, ability, "modifier_item_thunder_dragon_wrath_charge", {
		duration = ability:GetSpecialValueFor("charge_duration")
	})
end

modifier_item_thunder_dragon_wrath_phase = class({})

function modifier_item_thunder_dragon_wrath_phase:IsHidden() return false end
function modifier_item_thunder_dragon_wrath_phase:IsDebuff() return false end
function modifier_item_thunder_dragon_wrath_phase:IsPurgable() return false end
function modifier_item_thunder_dragon_wrath_phase:RemoveOnDeath() return true end

function modifier_item_thunder_dragon_wrath_phase:OnCreated()
	if not IsServer() then return end
	ProjectileManager:ProjectileDodge(self:GetParent())
end

function modifier_item_thunder_dragon_wrath_phase:CheckState()
	return {
		[MODIFIER_STATE_UNSELECTABLE] = true,
		[MODIFIER_STATE_UNTARGETABLE] = true,
	}
end

function modifier_item_thunder_dragon_wrath_phase:GetEffectName()
	return "particles/units/heroes/hero_dark_willow/dark_willow_shadow_realm.vpcf"
end

function modifier_item_thunder_dragon_wrath_phase:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

modifier_item_thunder_dragon_wrath_charge = class({})

function modifier_item_thunder_dragon_wrath_charge:IsHidden() return false end
function modifier_item_thunder_dragon_wrath_charge:IsDebuff() return false end
function modifier_item_thunder_dragon_wrath_charge:IsPurgable() return false end
function modifier_item_thunder_dragon_wrath_charge:RemoveOnDeath() return true end

function modifier_item_thunder_dragon_wrath_charge:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
	}
end

function modifier_item_thunder_dragon_wrath_charge:GetModifierProcAttack_Feedback(keys)
	if not IsServer() or self.triggered then return end
	local parent = self:GetParent()
	local target = keys.target
	local ability = self:GetAbility()
	if keys.attacker ~= parent or not target or not ability then return end
	if target:GetTeamNumber() == parent:GetTeamNumber() or target:IsBuilding() or target:IsOther() then return end

	self.triggered = true
	local radius = ability:GetSpecialValueFor("active_radius")
	local slow_duration = ability:GetSpecialValueFor("slow_duration")
	local damage = self:GetPrimaryAttributeValue(parent)
	local enemies = FindUnitsInRadius(
		parent:GetTeamNumber(),
		target:GetAbsOrigin(),
		nil,
		radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
		FIND_ANY_ORDER,
		false
	)

	for _, enemy in pairs(enemies) do
		enemy:AddNewModifier(parent, ability, "modifier_item_thunder_dragon_wrath_slow", {
			duration = slow_duration
		})
		ApplyDamage({
			victim = enemy,
			attacker = parent,
			damage = damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			damage_flags = DOTA_DAMAGE_FLAG_BYPASSES_MAGIC_IMMUNITY,
			ability = ability,
		})
		EmitSoundOn("Item.Maelstrom.Chain_Lightning", enemy)
	end

	self:Destroy()
end

function modifier_item_thunder_dragon_wrath_charge:GetPrimaryAttributeValue(parent)
	local primary_attribute = parent:GetPrimaryAttribute()
	if primary_attribute == DOTA_ATTRIBUTE_STRENGTH then
		return parent:GetStrength()
	elseif primary_attribute == DOTA_ATTRIBUTE_AGILITY then
		return parent:GetAgility()
	elseif primary_attribute == DOTA_ATTRIBUTE_INTELLECT then
		return parent:GetIntellect(false)
	end
	return (parent:GetStrength() + parent:GetAgility() + parent:GetIntellect(false)) / 2
end

function modifier_item_thunder_dragon_wrath_charge:GetEffectName()
	return "particles/items2_fx/mjollnir_shield.vpcf"
end

function modifier_item_thunder_dragon_wrath_charge:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

modifier_item_thunder_dragon_wrath_slow = class({})

function modifier_item_thunder_dragon_wrath_slow:IsHidden() return false end
function modifier_item_thunder_dragon_wrath_slow:IsDebuff() return true end
function modifier_item_thunder_dragon_wrath_slow:IsPurgable() return true end
function modifier_item_thunder_dragon_wrath_slow:IgnoreTenacity() return true end

function modifier_item_thunder_dragon_wrath_slow:OnCreated()
	local ability = self:GetAbility()
	self.slow_pct = ability and ability:GetSpecialValueFor("slow_pct") or -100
	self.slow_movespeed = ability and ability:GetSpecialValueFor("slow_movespeed") or 100
	if self.slow_pct == 0 then self.slow_pct = -100 end
	if self.slow_movespeed == 0 then self.slow_movespeed = 100 end
end

function modifier_item_thunder_dragon_wrath_slow:OnRefresh()
	self:OnCreated()
end

function modifier_item_thunder_dragon_wrath_slow:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE,
	}
end

function modifier_item_thunder_dragon_wrath_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.slow_pct
end

function modifier_item_thunder_dragon_wrath_slow:GetModifierMoveSpeed_Absolute()
	return self.slow_movespeed
end

function modifier_item_thunder_dragon_wrath_slow:GetPriority()
	return MODIFIER_PRIORITY_SUPER_ULTRA
end

function modifier_item_thunder_dragon_wrath_slow:GetTexture()
	return "item_mjollnir"
end
