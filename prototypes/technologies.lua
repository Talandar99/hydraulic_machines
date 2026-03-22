data:extend({
	{
		type = "technology",
		name = "diesel-automation",
		icon = "__diesel_machines__/graphics/diesel-assembling-machine/diesel-automation.png",
		icon_size = 256,
		effects = {
			{ type = "unlock-recipe", recipe = "fast-diesel-inserter" },
			{ type = "unlock-recipe", recipe = "long-handed-diesel-inserter" },
			{ type = "unlock-recipe", recipe = "diesel-inserter" },
			{ type = "unlock-recipe", recipe = "crane-bulk-diesel-inserter" },
			{ type = "unlock-recipe", recipe = "diesel-assembling-machine" },
			{ type = "unlock-recipe", recipe = "diesel-pump" },
			{ type = "unlock-recipe", recipe = "diesel-mining-drill" },
		},
		prerequisites = {
			"automation-2",
			"electric-mining-drill",
			"bulk-inserter",
			"oil-processing",
		},
		unit = {
			count_formula = "200",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
			},
			time = 30,
		},
	},
})
