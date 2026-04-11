data:extend({
	{
		type = "technology",
		name = "rubber",
		icon = "__hydraulic_machines__/graphics/rubber/rubber-technology.png",
		icon_size = 512,
		effects = {
			{ type = "unlock-recipe", recipe = "basic-residual-oil-processing" },
			{ type = "unlock-recipe", recipe = "residual-oil-cracking" },
			{ type = "unlock-recipe", recipe = "lubricant-from-residual-oil" },
			{ type = "unlock-recipe", recipe = "solid-fuel-from-residual-oil" },
			{ type = "unlock-recipe", recipe = "rubber" },
		},
		prerequisites = {
			"advanced-oil-processing",
			"production-science-pack",
		},
		unit = {
			count = 200,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 30,
		},
		order = "d-a",
	},
	{
		type = "technology",
		name = "hydraulic-automation",
		icon = "__hydraulic_machines__/graphics/hydraulic-automation.png",
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "hydraulic-assembling-machine" },
			{ type = "unlock-recipe", recipe = "hydraulic-shaper" },
		},
		prerequisites = {
			"automation-2",
			"engine",
			"production-science-pack",
			"chemical-science-pack",
			"lubricant",
			"oil-processing",
			"rubber",
		},
		unit = {
			count = 500,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 30,
		},
	},
	{
		type = "technology",
		name = "hydraulic-petrochemistry",
		icon = "__hydraulic_machines__/graphics/hydraulic-petrochemical-plant/hydraulic-petrochemical-plant-technology.png",
		icon_size = 700,
		effects = {
			{ type = "unlock-recipe", recipe = "hydraulic-petrochemical-plant" },
			{ type = "unlock-recipe", recipe = "hydraulic-oil-processing" },
			{ type = "unlock-recipe", recipe = "light-oil-to-naphtha-cracking" },
			{ type = "unlock-recipe", recipe = "naphtha-cracking" },
			{ type = "unlock-recipe", recipe = "gasoline" },
			{ type = "unlock-recipe", recipe = "solid-fuel-from-naphtha" },
			{ type = "unlock-recipe", recipe = "solid-fuel-from-gasoline" },
		},
		prerequisites = {
			"hydraulic-automation",
			"rubber",
			"advanced-oil-processing",
		},
		unit = {
			count = 2000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 60,
		},
		order = "d-b",
	},
})

data:extend({
	{
		type = "technology",
		name = "industrial-module",
		icon = "__hydraulic_machines__/graphics/industrial-module/technology/industrial-module-1.png",
		icon_size = 256,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "industrial-module",
			},
		},
		prerequisites = { "modules", "productivity-module", "production-science-pack", "hydraulic-automation" },
		unit = {
			count = 250,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 30,
		},
		upgrade = true,
	},
	{
		type = "technology",
		name = "industrial-module-2",
		icon = "__hydraulic_machines__/graphics/industrial-module/technology/industrial-module-2.png",
		icon_size = 256,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "industrial-module-2",
			},
		},
		prerequisites = { "productivity-module-2", "processing-unit", "industrial-module" },
		unit = {
			count = 500,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 60,
		},
		upgrade = true,
	},
	{
		type = "technology",
		name = "industrial-module-3",
		icon = "__hydraulic_machines__/graphics/industrial-module/technology/industrial-module-3.png",
		icon_size = 256,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "industrial-module-3",
			},
		},
		prerequisites = { "productivity-module-3", "production-science-pack", "industrial-module-2" },
		unit = {
			count = 1000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 60,
		},
		upgrade = true,
	},
})
table.insert(data.raw["technology"]["lubrication-tower"].prerequisites, "hydraulic-automation")
