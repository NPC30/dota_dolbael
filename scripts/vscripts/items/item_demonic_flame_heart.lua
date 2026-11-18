local LOG_PREFIX = "[DemonicFlameHeart]"

print(LOG_PREFIX .. " script loaded")

local function IsValidHandle(handle)
	return handle and not handle:IsNull()
end

local function IsDebugEnabled(ability)
	if not IsValidHandle(ability) then
		return true
	end
	return ability:GetSpecialValueFor("debug_log") > 0
end

local function DebugLog(ability, message)
	if IsDebugEnabled(ability) then
		print(LOG_PREFIX .. " " .. message)
	end
end

local function UnitName(unit)
	if not IsValidHandle(unit) then
		return "nil"
	end
	return unit:GetUnitName()
end

local function DamageFlags(ability)
	DebugLog(ability, "damage flags: no_amp=" .. tostring(DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION)
		.. ", no_lifesteal=" .. tostring(DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL))
	return (DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION or 0)
		+ (DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL or 0)
end

function DemonicFlameHeartOnSpellStart(keys)
	keys = keys or {}
	local ability = keys.ability
	DebugLog(ability, "active entered: server=" .. tostring(IsServer())
		.. ", caster=" .. UnitName(keys.caster)
		.. ", target=" .. UnitName(keys.target)
		.. ", ability_valid=" .. tostring(IsValidHandle(ability)))
	if not IsServer() then
		DebugLog(ability, "active aborted: not server")
		return
	end

	local caster = keys.caster
	local target = keys.target
	if IsValidHandle(ability) then
		caster = caster or ability:GetCaster()
		target = target or ability:GetCursorTarget()
	end
	DebugLog(ability, "active resolved: caster=" .. UnitName(caster) .. ", target=" .. UnitName(target))
	if not IsValidHandle(caster) or not IsValidHandle(target) or not IsValidHandle(ability) then
		DebugLog(ability, "active aborted: invalid caster, target, or ability")
		return
	end

	local damage_pct = ability:GetSpecialValueFor("active_damage_self_max_health_pct")
	local damage = caster:GetMaxHealth() * damage_pct / 100
	local target_health_before = target:GetHealth()
	DebugLog(ability, "active applying: caster_max_hp=" .. tostring(caster:GetMaxHealth())
		.. ", pct=" .. tostring(damage_pct)
		.. ", calculated=" .. tostring(damage)
		.. ", target_hp_before=" .. tostring(target_health_before))
	local actual_damage = ApplyDamage({
		victim = target,
		attacker = caster,
		damage = damage,
		damage_type = DAMAGE_TYPE_PURE,
		damage_flags = DamageFlags(ability),
		ability = ability,
	}) or 0
	DebugLog(ability, "active result: actual_damage=" .. tostring(actual_damage)
		.. ", target_hp_after=" .. tostring(target:GetHealth()))

	local lifesteal = math.min(actual_damage, target_health_before)
	if lifesteal > 0 and caster:IsAlive() then
		caster:Heal(lifesteal, ability)
		SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, caster, lifesteal, nil)
		DebugLog(ability, "active heal: amount=" .. tostring(lifesteal)
			.. ", caster_hp_after=" .. tostring(caster:GetHealth()))
	end

	EmitSoundOn("DOTA_Item.Satanic.Activate", caster)
	local particle = ParticleManager:CreateParticle(
		"particles/items2_fx/satanic_buff.vpcf",
		PATTACH_ABSORIGIN_FOLLOW,
		caster
	)
	ParticleManager:ReleaseParticleIndex(particle)
end

function DemonicFlameHeartAuraThink(keys)
	keys = keys or {}
	local ability = keys.ability
	DebugLog(ability, "aura entered: server=" .. tostring(IsServer())
		.. ", caster=" .. UnitName(keys.caster)
		.. ", target=" .. UnitName(keys.target)
		.. ", ability_valid=" .. tostring(IsValidHandle(ability)))
	if not IsServer() then
		DebugLog(ability, "aura aborted: not server")
		return
	end

	local caster = keys.caster
	local target = keys.target
	if not IsValidHandle(caster) or not IsValidHandle(target) or not IsValidHandle(ability) then
		DebugLog(ability, "aura aborted: invalid caster, target, or ability")
		return
	end
	if not caster:IsAlive() or not target:IsAlive() or target:IsBuilding() or target:IsOther() then
		DebugLog(ability, "aura aborted: caster_alive=" .. tostring(caster:IsAlive())
			.. ", target_alive=" .. tostring(target:IsAlive())
			.. ", building=" .. tostring(target:IsBuilding())
			.. ", other=" .. tostring(target:IsOther()))
		return
	end

	local multiplier = 1
	if caster:HasModifier("modifier_item_demonic_flame_heart_active") then
		multiplier = ability:GetSpecialValueFor("active_multiplier")
	end

	local damage_pct = ability:GetSpecialValueFor("aura_damage_max_health_pct")
	local self_damage_pct = ability:GetSpecialValueFor("aura_damage_self_max_health_pct")
	local interval = ability:GetSpecialValueFor("aura_damage_interval")
	local base_damage = ability:GetSpecialValueFor("aura_base_damage")
	local target_pct_damage = target:GetMaxHealth() * damage_pct / 100 * interval
	local self_pct_damage = caster:GetMaxHealth() * self_damage_pct / 100 * interval
	local pct_damage = target_pct_damage + self_pct_damage
	local damage = base_damage + pct_damage * multiplier
	local target_health_before = target:GetHealth()
	DebugLog(ability, "aura applying: target_max_hp=" .. tostring(target:GetMaxHealth())
		.. ", caster_max_hp=" .. tostring(caster:GetMaxHealth())
		.. ", base_damage=" .. tostring(base_damage)
		.. ", pct=" .. tostring(damage_pct)
		.. ", self_pct=" .. tostring(self_damage_pct)
		.. ", interval=" .. tostring(interval)
		.. ", multiplier=" .. tostring(multiplier)
		.. ", target_pct_damage=" .. tostring(target_pct_damage)
		.. ", self_pct_damage=" .. tostring(self_pct_damage)
		.. ", pct_damage=" .. tostring(pct_damage)
		.. ", calculated=" .. tostring(damage)
		.. ", target_hp_before=" .. tostring(target_health_before))
	local actual_damage = ApplyDamage({
		victim = target,
		attacker = caster,
		damage = damage,
		damage_type = DAMAGE_TYPE_PURE,
		damage_flags = DamageFlags(ability),
		ability = ability,
	}) or 0
	DebugLog(ability, "aura result: actual_damage=" .. tostring(actual_damage)
		.. ", target_hp_after=" .. tostring(target:GetHealth()))
end
