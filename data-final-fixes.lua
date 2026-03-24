local function add_hydraulic_shaping(target_ingredient_name)
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
