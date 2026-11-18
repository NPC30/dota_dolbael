local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local AbilityRegistryClass = __TS__Class()
AbilityRegistryClass.name = "AbilityRegistryClass"
function AbilityRegistryClass.prototype.____constructor(self)
self.map = __TS__New(Map)
end
function AbilityRegistryClass.prototype.register(self, spec)
local list = self.map:get(spec.abilityName)
if list then
list[#list + 1] = spec
else
self.map:set(spec.abilityName, {spec})
end
end
function AbilityRegistryClass.prototype.registerAll(self, specs)
for ____, spec in ipairs(specs) do
self:register(spec)
end
end
function AbilityRegistryClass.prototype.get(self, abilityName)
return self.map:get(abilityName)
end
function AbilityRegistryClass.prototype.getAll(self)
return self.map
end
function AbilityRegistryClass.prototype._clear(self)
self.map:clear()
end
____exports.AbilityRegistry = __TS__New(AbilityRegistryClass)
return ____exports
