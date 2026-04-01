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
local ALL_CATEGORIES = {}
for name, _ in pairs(data.raw["module-category"]) do
	if name ~= "industrial" then
		table.insert(ALL_CATEGORIES, name)
	end
end
local function process_entity(entity)
	if not entity.allowed_module_categories then
		entity.allowed_module_categories = table.deepcopy(ALL_CATEGORIES)
	end

	if INDUSTRIAL_ONLY_LIST[entity.name] then
		local categories = entity.allowed_module_categories
		local has_industrial = false
		for i = #categories, 1, -1 do
			local cat = categories[i]
			if cat == "quality" or cat == "efficiency" then
				table.remove(categories, i)
			elseif cat == "industrial" then
				has_industrial = true
			end
		end
		if not has_industrial then
			table.insert(categories, "industrial")
		end
	end
end
for _, type in pairs({ "assembling-machine", "furnace", "mining-drill" }) do
	for _, entity in pairs(data.raw[type]) do
		process_entity(entity)
	end
end
