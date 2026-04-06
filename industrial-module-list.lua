-----------------------------------
-- config
-----------------------------------
local INDUSTRIAL_ONLY_LIST = {
	-- hydraulic machines
	["hydraulic-assembling-machine"] = true,
	["hydraulic-shaper"] = true,
	-- diesel machines
	["diesel-assembling-machine"] = true,
	["diesel-mining-drill"] = true,
	-- pelagos
	["calciner"] = true,
	["diesel-dragon"] = true,
	-- advanced oil rig mod
	["advanced-oil-rig"] = true,
	-- canal excavator mod
	["canex-excavator"] = true,
}

if mods["planetaris-arig"] and settings.startup["industrial-module-arig-press"].value then
	if settings.startup["press-is-steam-powered"].value then
		INDUSTRIAL_ONLY_LIST["planetaris-press"] = true
	end
end

if mods["lignumis"] and settings.startup["industrial-module-lignumis-lumber-mill"].value then
	if not settings.startup["lignumis-electric-lumber-mill"].value then
		INDUSTRIAL_ONLY_LIST["lumber-mill"] = true
	end
end

if mods["burner_foundry"] then
	INDUSTRIAL_ONLY_LIST["foundry"] = true
end

if mods["diesel_foundry"] then
	INDUSTRIAL_ONLY_LIST["diesel-foundry"] = true
end

-----------------------------------
local DEFAULT_CATEGORIES = {
	"efficiency",
	"productivity",
	"quality",
	"speed",
}

local ENTITY_TYPES = {
	"assembling-machine",
	"furnace",
	"lab",
	"mining-drill",
	"rocket-silo",
	"beacon",
}

local function has_any_categories(entity)
	return entity.allowed_module_categories ~= nil and next(entity.allowed_module_categories) ~= nil
end

-- add default
for _, type_name in pairs(ENTITY_TYPES) do
	for _, entity in pairs(data.raw[type_name]) do
		if not has_any_categories(entity) then
			entity.allowed_module_categories = table.deepcopy(DEFAULT_CATEGORIES)
		end
	end
end

for _, type_name in pairs(ENTITY_TYPES) do
	for _, entity in pairs(data.raw[type_name]) do
		if INDUSTRIAL_ONLY_LIST[entity.name] then
			local categories = entity.allowed_module_categories
			local has_industrial = false

			for i = #categories, 1, -1 do
				local cat = categories[i]

				if cat == "efficiency" then
					table.remove(categories, i)
				end

				if cat == "quality" then
					table.remove(categories, i)
				end

				if cat == "industrial" then
					has_industrial = true
				end
			end

			if not has_industrial then
				table.insert(categories, "industrial")
			end
		end
	end
end
