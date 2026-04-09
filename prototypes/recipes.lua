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
		type = "recipe",
		name = "hydraulic-oil-processing",
		category = "petochemical-processing",
		enabled = false,
		energy_required = 10,
		ingredients = {
			{ type = "fluid", name = "water", amount = 50 },
			{ type = "fluid", name = "crude-oil", amount = 100 },
			{ type = "fluid", name = "methane", amount = 50 },
		},
		results = {
			{ type = "fluid", name = "heavy-oil", amount = 20 },
			{ type = "fluid", name = "light-oil", amount = 30 },
			{ type = "fluid", name = "petroleum-gas", amount = 40 },
			{ type = "fluid", name = "naphtha", amount = 25 },
			{ type = "fluid", name = "residual-oil", amount = 20 },
		},
		allow_productivity = true,
		icon = "__base__/graphics/icons/fluid/advanced-oil-processing.png",
		subgroup = "fluid-recipes",
		order = "a[oil-processing]-c[petochemical-processing]",
	},
	{
		type = "recipe",
		name = "naphtha-reforming",
		category = "petochemical-processing",
		enabled = false,
		energy_required = 5,
		ingredients = {
			{ type = "fluid", name = "naphtha", amount = 10 },
			{ type = "fluid", name = "methane", amount = 25 },
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
		type = "recipe",
		name = "residual-oil-cracking",
		category = "chemistry",
		additional_categories = { "cryogenics" },
		enabled = false,
		energy_required = 3,
		ingredients = {
			{ type = "fluid", name = "residual-oil", amount = 40 },
			{ type = "fluid", name = "water", amount = 30 },
		},
		results = {
			{ type = "fluid", name = "heavy-oil", amount = 30 },
		},
		allow_productivity = true,
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-a[residual-oil-cracking]",
	},
	{
		type = "recipe",
		name = "residual-oil-cracking",
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
		icon = "__base__/graphics/icons/fluid/heavy-oil-cracking.png",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-a[heavy-oil-cracking]",
	},
	{
		type = "recipe",
		name = "light-oil-to-naphtha-cracking",
		category = "chemistry",
		enabled = false,
		energy_required = 3,
		ingredients = {
			{ type = "fluid", name = "light-oil", amount = 30 },
			{ type = "fluid", name = "water", amount = 30 },
		},
		results = {
			{ type = "fluid", name = "naphtha", amount = 20 },
		},
		allow_productivity = true,
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-c[light-oil-to-naphtha]",
	},
	{
		type = "recipe",
		name = "lubricant-from-residual-oil",
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
})
