local function add_hydraulic_shaping(target_ingredient_name)
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
	for _, recipe in pairs(data.raw.recipe) do
		if
			recipe.category ~= "smelting"
			and recipe.category ~= "crafting-with-steam"
			and recipe.ingredients
			and recipe.results
			and #recipe.ingredients == 1
			and #recipe.results == 1
		then
			local ingredient = recipe.ingredients[1]
			local name = ingredient.name or ingredient[1]

			if name == target_ingredient_name then
				recipe.additional_categories = recipe.additional_categories or {}

				local exists = false
				for _, category in ipairs(recipe.additional_categories) do
					if category == "hydraulic-shaping" then
						exists = true
						break
					end
				end

				if not exists then
					table.insert(recipe.additional_categories, "hydraulic-shaping")
				end
			end
		end
	end
end

add_hydraulic_shaping("iron-plate")
add_hydraulic_shaping("copper-plate")
add_hydraulic_shaping("steel-plate")
add_hydraulic_shaping("gold-plate")
add_hydraulic_shaping("titanium-plate")
add_hydraulic_shaping("tungsten-plate")
