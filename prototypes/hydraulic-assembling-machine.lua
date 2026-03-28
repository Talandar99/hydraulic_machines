require("__base__.prototypes.entity.pipecovers")
local item_sounds = require("__base__.prototypes.item_sounds")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

function hydraulicassemblingmachinepipes()
	return {
		north = {
			filename = "__hydraulic_machines__/graphics/hydraulic-assembling-machine/assembling-machine-3-pipe-N.png",
			priority = "extra-high",
			width = 71,
			height = 38,
			shift = util.by_pixel(2.25, 13.5),
			scale = 0.5,
		},
		east = {
			filename = "__hydraulic_machines__/graphics/hydraulic-assembling-machine/assembling-machine-3-pipe-E.png",
			priority = "extra-high",
			width = 42,
			height = 76,
			shift = util.by_pixel(-24.5, 1),
			scale = 0.5,
		},
		south = {
			filename = "__hydraulic_machines__/graphics/hydraulic-assembling-machine/assembling-machine-3-pipe-S.png",
			priority = "extra-high",
			width = 88,
			height = 61,
			shift = util.by_pixel(0, -31.25),
			scale = 0.5,
		},
		west = {
			filename = "__hydraulic_machines__/graphics/hydraulic-assembling-machine/assembling-machine-3-pipe-W.png",
			priority = "extra-high",
			width = 39,
			height = 73,
			shift = util.by_pixel(25.75, 1.25),
			scale = 0.5,
		},
	}
end

data:extend({
	{
		name = "hydraulic-assembling",
		type = "recipe-category",
	},
})
data:extend({

	{
		type = "item",
		name = "hydraulic-assembling-machine",
		icon = "__hydraulic_machines__/graphics/hydraulic-assembling-machine/hydraulic-assembling-machine-icon.png",
		subgroup = "production-machine",
		color_hint = { text = "2" },
		order = "b[hydraulic-assembling-machine]",
		inventory_move_sound = item_sounds.mechanical_inventory_move,
		pick_sound = item_sounds.mechanical_inventory_pickup,
		drop_sound = item_sounds.mechanical_inventory_move,
		--default_import_location = "hydraulic_machines",
		weight = 50 * kg,
		place_result = "hydraulic-assembling-machine",
		stack_size = 50,
	},

	{
		type = "assembling-machine",
		name = "hydraulic-assembling-machine",
		icon = "__hydraulic_machines__/graphics/hydraulic-assembling-machine/hydraulic-assembling-machine-icon.png",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.2, result = "hydraulic-assembling-machine" },
		max_health = 350,
		corpse = "assembling-machine-3-remnants",
		dying_explosion = "assembling-machine-3-explosion",
		icon_draw_specification = { shift = { 0, -0.3 } },
		icons_positioning = {
			{ inventory_index = defines.inventory.crafter_modules, max_icons_per_row = 5, scale = 0.4 },
		},
		circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
		circuit_connector = circuit_connector_definitions["assembling-machine"],
		alert_icon_shift = util.by_pixel(0, -12),
		resistances = {
			{
				type = "fire",
				percent = 70,
			},
		},
		fluid_boxes = {
			{
				production_type = "input",
				pipe_picture = assembler2pipepictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections = {
					{ flow_direction = "input", direction = defines.direction.north, position = { 0, -1 } },
				},
				secondary_draw_orders = { north = -1 },
			},
			{
				production_type = "output",
				pipe_picture = assembler2pipepictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections = {
					{ flow_direction = "output", direction = defines.direction.south, position = { 0, 1 } },
				},
				secondary_draw_orders = { north = -1 },
			},
		},
		fluid_boxes_off_when_no_fluid_recipe = true,
		collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		damaged_trigger_effect = hit_effects.entity(),
		fast_replaceable_group = "assembling-machine",
		graphics_set = {
			animation_progress = 0.5,
			animation = {
				layers = {
					{
						filename = "__hydraulic_machines__/graphics/hydraulic-assembling-machine/hydraulic-assembling-machine.png",
						priority = "high",
						width = 214,
						height = 237,
						frame_count = 32,
						line_length = 8,
						shift = util.by_pixel(0, -0.75),
						scale = 0.5,
					},
					{
						filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
						priority = "high",
						width = 260,
						height = 162,
						frame_count = 32,
						line_length = 8,
						draw_as_shadow = true,
						shift = util.by_pixel(28, 4),
						scale = 0.5,
					},
				},
			},
		},
		open_sound = sounds.machine_open,
		close_sound = sounds.machine_close,
		impact_category = "metal",
		working_sound = {
			sound = {
				filename = "__base__/sound/assembling-machine-t2-1.ogg",
				volume = 0.45,
				audible_distance_modifier = 0.5,
			},
			fade_in_ticks = 4,
			fade_out_ticks = 20,
		},
		crafting_categories = {
			"basic-crafting",
			"crafting",
			"advanced-crafting",
			"crafting-with-fluid",
			--"electronics",
			--"electronics-with-fluid",
			--"pressing",
			--"metallurgy-or-assembling",
			--"organic-or-hand-crafting",
			--"organic-or-assembling",
			--"electronics-or-assembling",
			--"cryogenics-or-assembling",
			--"crafting-with-fluid-or-metallurgy",
			--"barreling",
		},

		crafting_speed = 1.25,
		energy_source = {
			type = "fluid",
			burns_fluid = true, -- fluid used as power
			emissions_per_minute = { pollution = 1 },
			light_flicker = {
				color = { 0, 0, 0, 0 }, -- to remove default burner glow
			},
			fluid_box = {
				pipe_picture = hydraulicassemblingmachinepipes(),
				pipe_covers = pipecoverspictures(),
				always_draw_covers = true,
				volume = 10,
				filter = "lubricant",
				pipe_connections = {
					{ direction = defines.direction.west, position = { -1, 0 } },
					{ direction = defines.direction.east, position = { 1, 0 } },
				},
				production_type = "input-output",
			},
		},
		energy_usage = "100kW",
		module_slots = 5,
		allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
		allowed_module_categories = { "industrial", "speed", "productivity" },
	},
})
