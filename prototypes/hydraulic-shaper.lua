require("__base__.prototypes.entity.pipecovers")
local item_sounds = require("__base__.prototypes.item_sounds")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

function shaper_pipes()
	return {
		north = {
			filename = "__hydraulic_machines__/graphics/pipe_covers/shaper/barreling-machine-pipe-N.png",
			priority = "extra-high",
			width = 71,
			height = 38,
			shift = util.by_pixel(2.25, 13.5),
			scale = 0.5,
		},
		east = {
			filename = "__hydraulic_machines__/graphics/pipe_covers/shaper/barreling-machine-pipe-E.png",
			priority = "extra-high",
			width = 42,
			height = 76,
			shift = util.by_pixel(-24.5, 1),
			scale = 0.5,
		},
		south = {
			filename = "__hydraulic_machines__/graphics/pipe_covers/shaper/barreling-machine-pipe-S.png",
			priority = "extra-high",
			width = 88,
			height = 61,
			shift = util.by_pixel(0, -31.25),
			scale = 0.5,
		},
		west = {
			filename = "__hydraulic_machines__/graphics/pipe_covers/shaper/barreling-machine-pipe-W.png",
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
		name = "hydraulic-shaping",
		type = "recipe-category",
	},
})

data:extend({
	{
		type = "item",
		name = "hydraulic-shaper",
		icon = "__hydraulic_machines__/graphics/hydraulic-shaper-icon.png",
		subgroup = "production-machine",
		group = "production",
		order = "z-a[hydraulic-shaper]",
		inventory_move_sound = item_sounds.metal_chest_inventory_move,
		pick_sound = item_sounds.metal_chest_inventory_pickup,
		drop_sound = item_sounds.metal_chest_inventory_move,
		place_result = "hydraulic-shaper",
		stack_size = 50,
		weight = 20 * kg,
	},
	{
		type = "assembling-machine",
		name = "hydraulic-shaper",
		icon = "__hydraulic_machines__/graphics/hydraulic-shaper-icon.png",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.1, result = "hydraulic-shaper" },
		fast_replaceable_group = "hydraulic-shaper",
		circuit_wire_max_distance = furnace_circuit_wire_max_distance,
		circuit_connector = circuit_connector_definitions["assembling-machine"],
		max_health = 200,
		corpse = "iron-chest-remnants",
		dying_explosion = "iron-chest-explosion",
		resistances = {
			{
				type = "fire",
				percent = 90,
			},
			{
				type = "impact",
				percent = 60,
			},
		},

		selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
		collision_box = { { -0.3, -0.3 }, { 0.3, 0.3 } },
		damaged_trigger_effect = hit_effects.entity(),
		module_slots = 1,
		--icon_draw_specification = { shift = { 0, -0.1 }, scale = 0.0 },
		icon_draw_specification = {
			shift = { 0, 0 },
			scale = 0.7,
			render_layer = "entity-info-icon-above",
		},
		allowed_effects = { "consumption", "speed", "pollution", "quality" },
		crafting_categories = { "hydraulic-shaping" },
		source_inventory_size = 1,
		crafting_speed = 6,
		energy_source = {
			type = "fluid",
			burns_fluid = true, -- fluid used as power
			emissions_per_minute = { pollution = 1 },
			light_flicker = {
				color = { 0, 0, 0, 0 }, -- to remove default burner glow
			},
			fluid_box = {
				pipe_picture = shaper_pipes(),
				pipe_covers = pipecoverspictures(),
				always_draw_covers = true,
				volume = 10,
				filter = "lubricant",
				pipe_connections = {
					{ direction = defines.direction.west, position = { 0, 0 } },
					{ direction = defines.direction.east, position = { 0, 0 } },
				},
				production_type = "input-output",
				hide_connection_info = true,
			},
		},
		energy_usage = "50kW",
		module_slots = 1,
		impact_category = "metal",
		open_sound = sounds.metallic_chest_open,
		close_sound = sounds.metallic_chest_close,
		animation_sound = sounds.logistics_chest_open,
		match_animation_speed_to_activity = true,
		opened_duration = 7, --logistic_chest_opened_duration ==7
		working_sound = {
			sound = {
				filename = "__base__/sound/electric-furnace.ogg",
				volume = 0.85,
				modifiers = volume_multiplier("main-menu", 4.2),
				advanced_volume_control = { attenuation = "exponential" },
				audible_distance_modifier = 0.7,
			},
			max_sounds_per_prototype = 4,
			fade_in_ticks = 4,
			fade_out_ticks = 20,
		},
		graphics_set = {
			animation = {
				layers = {
					{
						filename = "__hydraulic_machines__/graphics/hydraulic-shaper.png",
						priority = "high",
						width = 68,
						height = 80,
						frame_count = 32,
						line_length = 8,
						shift = util.by_pixel(0, -4),
						scale = 0.5,
					},
					{
						filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
						priority = "extra-high",
						width = 112,
						height = 46,
						repeat_count = 32,
						shift = util.by_pixel(12, 4.5),
						draw_as_shadow = true,
						scale = 0.5,
					},
				},
			},
		},
		fluid_boxes_off_when_no_fluid_recipe = true,
	},
})

data:extend({
	{
		type = "recipe",
		name = "hydraulic-shaper",
		enabled = false,
		ingredients = {
			{ type = "item", name = "iron-plate", amount = 10 },
			{ type = "item", name = "iron-gear-wheel", amount = 5 },
		},
		results = { { type = "item", name = "burner-barreling-machine", amount = 1 } },
	},
})
