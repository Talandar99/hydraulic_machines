data:extend({
	{
		type = "technology",
		name = "hydraulic-automation",
		icon = "__hydraulic_machines__/graphics/hydraulic-automation.png",
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "hydraulic-assembling-machine" },
		},
		prerequisites = {
			"automation-2",
			"electric-mining-drill",
			"production-science-pack",
			"chemical-science-pack",
			"lubricant",
			"bulk-inserter",
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
