LinkLuaModifier("modifier_item_forbidden_starfall", "items/item_forbidden_starfall", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_forbidden_starfall_burn", "items/item_forbidden_starfall", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_forbidden_starfall_resistance", "items/item_forbidden_starfall", LUA_MODIFIER_MOTION_NONE)

item_forbidden_starfall = class({})

local function GetPrimaryAttributeValue(unit)
	local primary_attribute = unit:GetPrimaryAttribute()

	if primary_attribute == DOTA_ATTRIBUTE_STRENGTH then
		return unit:GetStrength()
	elseif primary_attribute == DOTA_ATTRIBUTE_AGILITY then
		return unit:GetAgility()
	elseif primary_attribute == DOTA_ATTRIBUTE_INTELLECT then
		return unit:GetIntellect(false)
	end

	return (unit:GetStrength() + unit:GetAgility() + unit:GetIntellect(false)) / 2
end

function item_forbidden_starfall:GetIntrinsicModifierName()
	return "modifier_item_forbidden_starfall"
end

function item_forbidden_starfall:GetAOERadius()
	return self:GetSpecialValueFor("impact_radius")
end

function item_forbidden_starfall:OnSpellStart()
	self.target_position = self:GetCursorPosition()
	self:GetCaster():EmitSound("DOTA_Item.MeteorHammer.Channel")
	self:DestroyChannelParticle()
	self.channel_particle = ParticleManager:CreateParticle(
		"particles/items4_fx/meteor_hammer_aoe.vpcf",
		PATTACH_WORLDORIGIN,
		self:GetCaster()
	)
	ParticleManager:SetParticleControl(self.channel_particle, 0, self.target_position)
	ParticleManager:SetParticleControl(
		self.channel_particle,
		1,
		Vector(self:GetSpecialValueFor("impact_radius"), 1, 1)
	)
	self:ApplyPreImpactDebuffs()
end

function item_forbidden_starfall:DestroyChannelParticle()
	if not self.channel_particle then
		return
	end

	ParticleManager:DestroyParticle(self.channel_particle, false)
	ParticleManager:ReleaseParticleIndex(self.channel_particle)
	self.channel_particle = nil
end

function item_forbidden_starfall:ApplyPreImpactDebuffs()
	local caster = self:GetCaster()
	local debuff_duration = self:GetSpecialValueFor("burn_duration") + self:GetSpecialValueFor("debuff_extension")
	local enemies = FindUnitsInRadius(
		caster:GetTeamNumber(),
		self.target_position,
		nil,
		self:GetSpecialValueFor("impact_radius"),
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_BUILDING,
		DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
		FIND_ANY_ORDER,
		false
	)

	for _, enemy in pairs(enemies) do
		local duration = debuff_duration * (1 - enemy:GetStatusResistance())
		enemy:AddNewModifier(caster, self, "modifier_item_veil_of_discord_debuff", { duration = duration })
		enemy:AddNewModifier(caster, self, "modifier_item_forbidden_starfall_resistance", { duration = duration })
	end
end

function item_forbidden_starfall:OnChannelFinish(interrupted)
	local caster = self:GetCaster()
	StopSoundOn("DOTA_Item.MeteorHammer.Channel", caster)
	self:DestroyChannelParticle()

	if interrupted then
		return
	end

	local target_position = self.target_position
	local land_time = self:GetSpecialValueFor("land_time")
	local meteor = ParticleManager:CreateParticle(
		"particles/items4_fx/meteor_hammer_spell.vpcf",
		PATTACH_WORLDORIGIN,
		caster
	)
	ParticleManager:SetParticleControl(meteor, 0, target_position + Vector(0, 0, 1000))
	ParticleManager:SetParticleControl(meteor, 1, target_position)
	ParticleManager:SetParticleControl(meteor, 2, Vector(land_time, 0, 0))
	ParticleManager:ReleaseParticleIndex(meteor)
	caster:EmitSound("DOTA_Item.MeteorHammer.Cast")

	Timers:CreateTimer(land_time, function()
		if self:IsNull() or caster:IsNull() then
			return
		end

		self:ImpactMeteor(caster, target_position)
	end)
end

function item_forbidden_starfall:ImpactMeteor(caster, target_position)
	EmitSoundOnLocationWithCaster(target_position, "DOTA_Item.MeteorHammer.Impact", caster)

	local enemies = FindUnitsInRadius(
		caster:GetTeamNumber(),
		target_position,
		nil,
		self:GetSpecialValueFor("impact_radius"),
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_BUILDING,
		DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
		FIND_ANY_ORDER,
		false
	)

	for _, enemy in pairs(enemies) do
		local duration = self:GetSpecialValueFor("burn_duration") * (1 - enemy:GetStatusResistance())
		local pre_impact_debuff = enemy:FindModifierByNameAndCaster(
			"modifier_item_forbidden_starfall_resistance",
			caster
		)
		if not pre_impact_debuff then
			enemy:AddNewModifier(caster, self, "modifier_item_veil_of_discord_debuff", { duration = duration })
			enemy:AddNewModifier(caster, self, "modifier_item_forbidden_starfall_resistance", { duration = duration })
		end
		enemy:AddNewModifier(caster, self, "modifier_item_forbidden_starfall_burn", { duration = duration })

		local impact_damage = self:GetSpecialValueFor("impact_damage_units")
		if enemy:IsBuilding() then
			impact_damage = self:GetSpecialValueFor("impact_damage_buildings")
		else
			enemy:AddNewModifier(caster, self, "modifier_stunned", {
				duration = self:GetSpecialValueFor("stun_duration") * (1 - enemy:GetStatusResistance()),
			})
		end

		ApplyDamage({
			victim = enemy,
			attacker = caster,
			damage = impact_damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			damage_flags = DOTA_DAMAGE_FLAG_BYPASSES_MAGIC_IMMUNITY,
			ability = self,
		})
	end
end

modifier_item_forbidden_starfall = class({})

function modifier_item_forbidden_starfall:IsHidden()
    return true
end

function modifier_item_forbidden_starfall:IsPurgable()
    return false
end

function modifier_item_forbidden_starfall:RemoveOnDeath()
    return false
end

function modifier_item_forbidden_starfall:GetAttributes()
    return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

function modifier_item_forbidden_starfall:OnCreated()
    self.stats_modifier_name = "modifier_item_forbidden_starfall_stats"
    self:OnRefresh()
end

function modifier_item_forbidden_starfall:OnRefresh()
    local ability = self:GetAbility()
    if not ability then
        if IsServer() then
            self:Destroy()
        end
        return
    end

    if IsServer() then
        RefreshItemDataDrivenModifier(_, ability, self.stats_modifier_name)
    end
end

function modifier_item_forbidden_starfall:OnDestroy()
    if not IsServer() then
        return
    end

    local ability = self:GetAbility()
    if ability then
        RefreshItemDataDrivenModifier(_, ability, self.stats_modifier_name)
    end
end

modifier_item_forbidden_starfall_burn = class({})

function modifier_item_forbidden_starfall_burn:IsDebuff()
	return true
end

function modifier_item_forbidden_starfall_burn:IsPurgable()
	return true
end

function modifier_item_forbidden_starfall_burn:OnCreated()
	self:OnRefresh()

	if IsServer() then
		self:StartIntervalThink(self.burn_interval)
		self:OnIntervalThink()
	end
end

function modifier_item_forbidden_starfall_burn:OnRefresh()
	local ability = self:GetAbility()
	if not ability then
		return
	end

	self.burn_dps_units = ability:GetSpecialValueFor("burn_dps_units")
	self.burn_dps_buildings = ability:GetSpecialValueFor("burn_dps_buildings")
	self.burn_interval = ability:GetSpecialValueFor("burn_interval")
	self.primary_attribute_dps_pct = ability:GetSpecialValueFor("primary_attribute_dps_pct")
	self.building_primary_attribute_dps_pct = ability:GetSpecialValueFor("building_primary_attribute_dps_pct")
end

function modifier_item_forbidden_starfall_burn:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_TOOLTIP,
	}
end

function modifier_item_forbidden_starfall_burn:GetModifierMoveSpeedBonus_Percentage()
	local ability = self:GetAbility()
	return ability and -ability:GetSpecialValueFor("burn_slow") or 0
end

function modifier_item_forbidden_starfall_burn:OnIntervalThink()
	local caster = self:GetCaster()
	local parent = self:GetParent()
	local ability = self:GetAbility()
	if not caster or caster:IsNull() or not ability or ability:IsNull() then
		self:Destroy()
		return
	end

	local base_damage = self.burn_dps_units
	local primary_attribute_pct = self.primary_attribute_dps_pct
	if parent:IsBuilding() then
		base_damage = self.burn_dps_buildings
		primary_attribute_pct = self.building_primary_attribute_dps_pct
	end

	local actual_damage = ApplyDamage({
		victim = parent,
		attacker = caster,
		damage = (base_damage + GetPrimaryAttributeValue(caster) * primary_attribute_pct / 100) * self.burn_interval,
		damage_type = DAMAGE_TYPE_MAGICAL,
		damage_flags = DOTA_DAMAGE_FLAG_BYPASSES_MAGIC_IMMUNITY,
		ability = ability,
	})
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, parent, actual_damage, nil)
	parent:EmitSound("DOTA_Item.MeteorHammer.Damage")
end

function modifier_item_forbidden_starfall_burn:GetModifierTooltip()
	if self:GetParent():IsBuilding() then
		return self.building_primary_attribute_dps_pct
	end

	return self.primary_attribute_dps_pct
end

function modifier_item_forbidden_starfall_burn:GetEffectName()
	return "particles/items4_fx/meteor_hammer_spell_debuff.vpcf"
end

function modifier_item_forbidden_starfall_burn:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

function modifier_item_forbidden_starfall_burn:GetTexture()
	return "meteor_hammer_2"
end

modifier_item_forbidden_starfall_resistance = class({})

function modifier_item_forbidden_starfall_resistance:IsDebuff()
	return true
end

function modifier_item_forbidden_starfall_resistance:IsPurgable()
	return true
end

function modifier_item_forbidden_starfall_resistance:OnCreated()
	self:OnRefresh()
end

function modifier_item_forbidden_starfall_resistance:OnRefresh()
	local ability = self:GetAbility()
	if not ability then
		return
	end

	self.status_resistance_reduction = ability:GetSpecialValueFor("status_resistance_reduction")
end

function modifier_item_forbidden_starfall_resistance:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
		MODIFIER_PROPERTY_TOOLTIP,
	}
end

function modifier_item_forbidden_starfall_resistance:GetModifierStatusResistanceStacking()
	return -self.status_resistance_reduction
end

function modifier_item_forbidden_starfall_resistance:GetModifierTooltip()
	return self.status_resistance_reduction
end

function modifier_item_forbidden_starfall_resistance:GetTexture()
	return "veil_of_discord"
end
