data:extend({
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
			"electric-mining-drill",
			"production-science-pack",
			"chemical-science-pack",
			"lubricant",
			"oil-processing",
		},
		unit = {
			count_formula = "500",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 30,
		},
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
