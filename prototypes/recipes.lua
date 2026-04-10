-- items
data.extend({
	{
		type = "recipe",
		name = "hydraulic-assembling-machine",
		enabled = false,
		ingredients = {
			{ type = "item", name = "steel-plate", amount = 15 },
			{ type = "item", name = "pipe", amount = 15 },
			{ type = "item", name = "iron-gear-wheel", amount = 7 },
			{ type = "item", name = "engine-unit", amount = 1 },
			{ type = "item", name = "refined-concrete", amount = 20 },
		},
		results = { { type = "item", name = "hydraulic-assembling-machine", amount = 1 } },
	},
	{
		type = "recipe",
		name = "hydraulic-shaper",
		category = "hydraulic-assembling",
		enabled = false,
		ingredients = {
			{ type = "item", name = "steel-plate", amount = 10 },
			{ type = "item", name = "pipe", amount = 5 },
			{ type = "item", name = "iron-gear-wheel", amount = 5 },
			{ type = "item", name = "engine-unit", amount = 3 },
			{ type = "item", name = "refined-concrete", amount = 5 },
		},
		results = { { type = "item", name = "hydraulic-shaper", amount = 1 } },
	},
})
--petochemical-processing
data:extend({
	{
		name = "hydraulic-oil-processing",
		icon = "__hydraulic_machines__/graphics/hydrauilic-oil-processing.png",
		type = "recipe",
		category = "petochemical-processing",
		enabled = false,
		energy_required = 10,
		ingredients = {
			{ type = "fluid", name = "water", amount = 50 },
			{ type = "fluid", name = "crude-oil", amount = 100 },
			{ type = "fluid", name = "petroleum-gas", amount = 50 }, --change to methane later
		},
		results = {
			{ type = "fluid", name = "residual-oil", amount = 20 },
			{ type = "fluid", name = "heavy-oil", amount = 20 },
			{ type = "fluid", name = "light-oil", amount = 30 },
			{ type = "fluid", name = "naphtha", amount = 25 },
			{ type = "fluid", name = "petroleum-gas", amount = 40 },
		},
		allow_productivity = true,
		subgroup = "fluid-recipes",
		order = "a[oil-processing]-c[petochemical-processing]",
	},
	{
		type = "recipe",
		name = "gasoline",
		category = "petochemical-processing",
		enabled = false,
		energy_required = 5,
		ingredients = {
			{ type = "fluid", name = "naphtha", amount = 10 },
			{ type = "fluid", name = "petroleum-gas", amount = 25 }, --change to methane later
			{ type = "fluid", name = "water", amount = 30 },
		},
		results = {
			{ type = "fluid", name = "gasoline", amount = 10 },
		},
		allow_productivity = true,
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-d[gasoline]",
	},
})
-------------------------------------------------------------------------------
-- chemistry
-------------------------------------------------------------------------------
data.extend({
	{
		name = "residual-oil-cracking",
		icon = "__hydraulic_machines__/graphics/residual-oil-cracking.png",
		type = "recipe",
		category = "chemistry",
		enabled = false,
		energy_required = 2,
		ingredients = {
			{ type = "fluid", name = "water", amount = 30 },
			{ type = "fluid", name = "residual-oil", amount = 40 },
		},
		results = {
			{ type = "fluid", name = "heavy-oil", amount = 30 },
		},
		allow_productivity = true,
		main_product = "",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-a[heavy-oil-cracking]",
	},
	{
		type = "recipe",
		name = "light-oil-to-naphtha-cracking",
		icon = "__hydraulic_machines__/graphics/light-oil-to-naphtha-cracking.png",
		category = "chemistry",
		enabled = false,
		energy_required = 2,
		ingredients = {
			{ type = "fluid", name = "light-oil", amount = 30 },
			{ type = "fluid", name = "water", amount = 30 },
		},
		results = {
			{ type = "fluid", name = "naphtha", amount = 20 },
		},
		allow_productivity = true,
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-b[light-oil-cracking]",
	},
	{
		name = "lubricant-from-residual-oil",
		icons = {
			{ icon = "__hydraulic_machines__/graphics/residual-oil.png", icon_size = 64 },
			{ icon = "__base__/graphics/icons/fluid/lubricant.png", icon_size = 64, shift = { 0, 16 } },
		},
		type = "recipe",
		category = "chemistry",
		enabled = false,
		energy_required = 1,
		ingredients = {
			{ type = "fluid", name = "residual-oil", amount = 10 },
		},
		results = {
			{ type = "fluid", name = "lubricant", amount = 15 },
		},
		allow_productivity = true,
		subgroup = "fluid-recipes",
		order = "c[oil-products]-a[lubricant]",
	},
	{
		name = "naphtha-cracking",
		icon = "__hydraulic_machines__/graphics/naphtha-cracking.png",
		type = "recipe",
		category = "chemistry",
		enabled = false,
		energy_required = 2,
		ingredients = {
			{ type = "fluid", name = "water", amount = 30 },
			{ type = "fluid", name = "naphtha", amount = 30 },
		},
		results = {
			{ type = "fluid", name = "petroleum-gas", amount = 15 },
		},
		allow_productivity = true,
		main_product = "",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-b[light-oil-cracking]",
	},
})
-- solid fuel recipes
data.extend({
	{
		type = "recipe",
		name = "solid-fuel-from-gasoline",
		icons = {
			{ icon = "__base__/graphics/icons/solid-fuel.png", icon_size = 64 },
			{
				icon = "__hydraulic_machines__/graphics/gasoline.png",
				icon_size = 64,
				scale = 0.3,
				shift = { -8, -8 },
			},
		},
		category = "chemistry",
		energy_required = 1,
		ingredients = {
			{ type = "fluid", name = "gasoline", amount = 6 },
		},
		results = {
			{ type = "item", name = "solid-fuel", amount = 1 },
		},
		allow_productivity = true,
		subgroup = "fluid-recipes",
		enabled = false,
		order = "b[fluid-chemistry]-cd[solid-fuel-from-naphtha]",
	},
	{
		type = "recipe",
		name = "solid-fuel-from-naphtha",
		icons = {
			{ icon = "__base__/graphics/icons/solid-fuel.png", icon_size = 64 },
			{
				icon = "__hydraulic_machines__/graphics/naphtha.png",
				icon_size = 64,
				scale = 0.3,
				shift = { -8, -8 },
			},
		},
		category = "chemistry",
		energy_required = 1,
		ingredients = {
			{ type = "fluid", name = "naphtha", amount = 15 },
		},
		results = {
			{ type = "item", name = "solid-fuel", amount = 1 },
		},
		allow_productivity = true,
		subgroup = "fluid-recipes",
		enabled = false,
		order = "b[fluid-chemistry]-cd[solid-fuel-from-naphtha]",
	},
	{
		type = "recipe",
		name = "solid-fuel-from-residual-oil",
		icons = {
			{ icon = "__base__/graphics/icons/solid-fuel.png", icon_size = 64 },
			{
				icon = "__hydraulic_machines__/graphics/residual-oil.png",
				icon_size = 64,
				scale = 0.3,
				shift = { -8, -8 },
			},
		},
		category = "chemistry",
		energy_required = 1,
		ingredients = {
			{ type = "fluid", name = "residual-oil", amount = 30 },
		},
		results = {
			{ type = "item", name = "solid-fuel", amount = 1 },
		},
		allow_productivity = true,
		subgroup = "fluid-recipes",
		enabled = false,
		order = "b[fluid-chemistry]-e[solid-fuel-from-residual-oil]",
	},
})

for _, recipe in pairs(data.raw.recipe) do
	if
		recipe.name == "residual-oil-cracking"
		or recipe.name == "light-oil-to-naphtha-cracking"
		or recipe.name == "lubricant-from-residual-oil"
		or recipe.name == "heavy-oil-cracking"
		or recipe.name == "light-oil-cracking"
		or recipe.name == "naphtha-cracking"
		or recipe.name == "lubricant"
	then
		if not recipe.additional_categories then
			recipe.additional_categories = {}
		end

		table.insert(recipe.additional_categories, "petochemical-processing")
	end
end
