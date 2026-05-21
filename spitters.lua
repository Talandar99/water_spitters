require("__base__.prototypes.entity.biter-ai-settings")
require("__base__.prototypes.entity.spitter-animations")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

function water_spitter_spawner_idle_animation(variation, tint, captured)
	return {
		layers = {
			util.sprite_load("__base__/graphics/entity/spawner/spawner-idle", {
				frame_count = 7,
				scale = 0.5,
				animation_speed = 0.18,
				run_mode = "forward-then-backward",
				y = variation * 376 * 2,
				allow_forced_downscale = true,
				surface = "nauvis",
				usage = "enemy",
			}),
			util.sprite_load("__base__/graphics/entity/spawner/spawner-idle-mask", {
				frame_count = 7,
				scale = 0.5,
				animation_speed = 0.18,
				run_mode = "forward-then-backward",
				tint = tint,
				flags = { "mask" },
				y = variation * 230 * 2,
				allow_forced_downscale = true,
				surface = "nauvis",
				usage = "enemy",
			}),
			util.sprite_load("__base__/graphics/entity/spawner/spawner-idle-shadow", {
				frame_count = 7,
				scale = 0.5,
				animation_speed = 0.18,
				run_mode = "forward-then-backward",
				draw_as_shadow = true,
				y = variation * 358 * 2,
				allow_forced_downscale = true,
				surface = "nauvis",
				usage = "enemy",
			}),
		},
	}
end
local water_tints = {
	small = { r = 0.0, g = 0.3, b = 0.6, a = 0.5 },
	medium = { r = 0.0, g = 0.4, b = 0.6, a = 0.5 },
	big = { r = 0.0, g = 0.5, b = 0.6, a = 0.5 },
	behemoth = { r = 0.0, g = 0.6, b = 0.6, a = 0.5 },
	spawner = { r = 0.0, g = 0.6, b = 0.6, a = 0.8 },
}
local stats = {
	small = { health = 10, speed = 40, range = 14, dmg = 15 },
	medium = { health = 50, speed = 38, range = 16, dmg = 25 },
	big = { health = 200, speed = 36, range = 18, dmg = 36 },
	behemoth = { health = 1500, speed = 34, range = 20, dmg = 60 },
}

data:extend({
	{
		type = "unit",
		name = "small-water-biter",
		icon = "__base__/graphics/icons/small-spitter.png",
		flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" },
		max_health = stats.small.health,
		order = "b-b-z",
		subgroup = "enemies",
		impact_category = "organic",
		healing_per_tick = 0.02,
		collision_box = { { -0.3, -0.3 }, { 0.3, 0.3 } },
		selection_box = { { -0.5, -0.7 }, { 0.5, 0.7 } },
		damaged_trigger_effect = hit_effects.biter(),
		sticker_box = { { -0.3, -0.5 }, { 0.3, 0.1 } },
		distraction_cooldown = 300,
		min_pursue_time = 10 * 60,
		max_pursue_distance = 50,
		resistances = {
			{ type = "explosion", percent = 5 },
			{ type = "fire", percent = 30 },
			{ type = "laser", percent = 10 },
		},
		collision_mask = { layers = { ["is_object"] = true, ["train"] = true }, not_colliding_with_itself = true },
		alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
		attack_parameters = spitter_attack_parameters({
			acid_stream_name = "acid-stream-spitter-small",
			range = stats.small.range,
			min_attack_distance = 6,
			cooldown = 90,
			cooldown_deviation = 0.15,
			damage_modifier = stats.small.dmg,
			scale = 0.7,
			roarvolume = 0.6,
			range_mode = "bounding-box-to-bounding-box",
			tint1 = water_tints.small,
			tint2 = water_tints.small,
		}),

		vision_distance = 30,
		movement_speed = 0.18,
		distance_per_frame = 0.05,
		absorptions_to_join_attack = { pollution = 1 },

		--corpse = "water-biter-corpse",
		dying_explosion = "small-spitter-die",
		working_sound = sounds.spitter_calls_med(0.2, 0.53, water_tints.small, water_tints.small),
		dying_sound = sounds.spitter_dying_mid(0.65, water_tints.small, water_tints.small),
		run_animation = spitterrunanimation(0.7, water_tints.small, water_tints.small),
		ai_settings = biter_ai_settings,
		water_reflection = spitter_water_reflection(0.7),
	},
})

-- ======================================================================
-- Medium Copper Spitter
-- ======================================================================
data:extend({
	{
		type = "unit",
		name = "medium-water-biter",
		icon = "__base__/graphics/icons/medium-spitter.png",
		flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" },
		max_health = stats.medium.health,
		order = "b-b-z",
		subgroup = "enemies",
		impact_category = "organic",
		healing_per_tick = 0.03,
		collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
		selection_box = { { -0.6, -0.9 }, { 0.6, 0.9 } },
		damaged_trigger_effect = hit_effects.biter(),
		sticker_box = { { -0.3, -0.6 }, { 0.3, 0.2 } },
		distraction_cooldown = 300,
		min_pursue_time = 10 * 60,
		max_pursue_distance = 50,
		resistances = {
			{ type = "explosion", percent = 10 },
			{ type = "fire", percent = 40 },
			{ type = "laser", percent = 20 },
		},
		collision_mask = { layers = { ["is_object"] = true, ["train"] = true }, not_colliding_with_itself = true },
		alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
		attack_parameters = spitter_attack_parameters({
			acid_stream_name = "acid-stream-spitter-medium",
			range = stats.medium.range,
			min_attack_distance = 6,
			cooldown = 90,
			damage_modifier = stats.medium.dmg,
			scale = 1.0,
			roarvolume = 0.7,
			range_mode = "bounding-box-to-bounding-box",
			tint1 = water_tints.medium,
			tint2 = water_tints.medium,
		}),
		vision_distance = 30,
		movement_speed = 0.16,
		distance_per_frame = 0.05,
		absorptions_to_join_attack = { pollution = 5 },
		dying_explosion = "medium-spitter-die",
		working_sound = sounds.spitter_calls_med(0.3, 0.53, water_tints.medium, water_tints.medium),
		dying_sound = sounds.spitter_dying_mid(0.65, water_tints.medium, water_tints.medium),
		run_animation = spitterrunanimation(1.0, water_tints.medium, water_tints.medium),
		ai_settings = biter_ai_settings,
		water_reflection = spitter_water_reflection(1.0),
	},
})

-- ======================================================================
-- Big Copper Spitter
-- ======================================================================
data:extend({
	{
		type = "unit",
		name = "big-water-biter",
		icon = "__base__/graphics/icons/big-spitter.png",
		flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" },
		max_health = stats.big.health,
		order = "b-b-z",
		subgroup = "enemies",
		impact_category = "organic",
		healing_per_tick = 0.04,
		collision_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
		selection_box = { { -0.7, -1.0 }, { 0.7, 1.0 } },
		damaged_trigger_effect = hit_effects.biter(),
		sticker_box = { { -0.4, -0.7 }, { 0.4, 0.2 } },
		distraction_cooldown = 300,
		min_pursue_time = 10 * 60,
		max_pursue_distance = 50,
		resistances = {
			{ type = "physical", percent = 5 },
			{ type = "explosion", percent = 15 },
			{ type = "fire", percent = 50 },
			{ type = "laser", percent = 30 },
		},
		collision_mask = { layers = { ["is_object"] = true, ["train"] = true }, not_colliding_with_itself = true },
		alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
		attack_parameters = spitter_attack_parameters({
			acid_stream_name = "acid-stream-spitter-big",
			range = stats.big.range,
			min_attack_distance = 6,
			cooldown = 80,
			damage_modifier = stats.big.dmg,
			scale = 1.3,
			roarvolume = 0.8,
			range_mode = "bounding-box-to-bounding-box",
			tint1 = water_tints.big,
			tint2 = water_tints.big,
		}),
		vision_distance = 30,
		movement_speed = 0.15,
		distance_per_frame = 0.05,
		absorptions_to_join_attack = { pollution = 10 },
		dying_explosion = "big-spitter-die",
		working_sound = sounds.spitter_calls_med(0.35, 0.53, water_tints.big, water_tints.big),
		dying_sound = sounds.spitter_dying_big(0.65, water_tints.big, water_tints.big),
		run_animation = spitterrunanimation(1.3, water_tints.big, water_tints.big),
		ai_settings = biter_ai_settings,
		water_reflection = spitter_water_reflection(1.3),
	},
})

-- ======================================================================
-- Behemoth Copper Spitter
-- ======================================================================
data:extend({
	{
		type = "unit",
		name = "behemoth-water-biter",
		icon = "__base__/graphics/icons/behemoth-spitter.png",
		flags = { "placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable" },
		max_health = stats.behemoth.health,
		order = "b-b-z",
		subgroup = "enemies",
		impact_category = "organic",
		healing_per_tick = 0.05,
		collision_box = { { -0.6, -0.6 }, { 0.6, 0.6 } },
		selection_box = { { -1.0, -1.2 }, { 1.0, 1.2 } },
		damaged_trigger_effect = hit_effects.biter(),
		sticker_box = { { -0.5, -0.8 }, { 0.5, 0.2 } },
		distraction_cooldown = 300,
		min_pursue_time = 10 * 60,
		max_pursue_distance = 50,
		resistances = {
			{ type = "physical", percent = 10 },
			{ type = "explosion", percent = 30 },
			{ type = "fire", percent = 60 },
			{ type = "laser", percent = 40 },
		},
		collision_mask = { layers = { ["is_object"] = true, ["train"] = true }, not_colliding_with_itself = true },
		alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
		attack_parameters = spitter_attack_parameters({
			acid_stream_name = "acid-stream-spitter-behemoth",
			range = stats.behemoth.range,
			min_attack_distance = 6,
			cooldown = 70,
			damage_modifier = stats.behemoth.dmg,
			scale = 1.6,
			roarvolume = 1.0,
			range_mode = "bounding-box-to-bounding-box",
			tint1 = water_tints.behemoth,
			tint2 = water_tints.behemoth,
		}),
		vision_distance = 30,
		movement_speed = 0.14,
		distance_per_frame = 0.05,
		absorptions_to_join_attack = { pollution = 20 },
		dying_explosion = "behemoth-spitter-die",
		working_sound = sounds.spitter_calls_med(0.4, 0.53, water_tints.behemoth, water_tints.behemoth),
		dying_sound = sounds.spitter_dying_big(0.65, water_tints.behemoth, water_tints.behemoth),
		run_animation = spitterrunanimation(1.6, water_tints.behemoth, water_tints.behemoth),
		ai_settings = biter_ai_settings,
		water_reflection = spitter_water_reflection(1.6),
	},
})

-- ----------------------------------------------------------------------
-- Corpse
-- ----------------------------------------------------------------------

--add_spitter_die_animation(0.7, { r = 1, g = 1, b = 1 }, { r = 1, g = 1, b = 1 }, {
--	type = "corpse",
--	name = "water-biter-corpse",
--	icon = "__base__/graphics/icons/medium-spitter-corpse.png",
--	selectable_in_game = false,
--	selection_box = { { -1, -1 }, { 1, 1 } },
--	subgroup = "corpses",
--	order = "c[corpse]-b[spitter]-z[white]",
--	hidden_in_factoriopedia = true,
--	flags = { "placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map" },
--})

-- ----------------------------------------------------------------------
-- Spawner
-- ----------------------------------------------------------------------

data:extend({
	{
		type = "unit-spawner",
		name = "water-biter-spawner",
		icon = "__base__/graphics/icons/spitter-spawner.png",
		flags = { "placeable-player", "placeable-enemy", "not-repairable" },
		max_health = 400,
		order = "b-d-z",
		subgroup = "enemies",
		resistances = {
			{ type = "physical", decrease = 2, percent = 15 },
			{ type = "explosion", decrease = 5, percent = 10 },
			{ type = "fire", decrease = 3, percent = 60 },
		},

		healing_per_tick = 0.02,

		collision_mask = {
			layers = { ["ground_tile"] = true, ["is_object"] = true, ["trigger_target"] = true },
		},
		--collision_mask = { layers = { water_tile = true } },
		collision_box = { { -2.2, -2.2 }, { 2.2, 2.2 } },
		selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
		damaged_trigger_effect = hit_effects.biter(),
		impact_category = "organic",
		corpse = "water-biter-spawner-corpse",
		dying_explosion = "spitter-spawner-die",
		max_count_of_owned_units = 7,
		max_friends_around_to_spawn = 5,
		absorptions_per_second = { pollution = { absolute = 20, proportional = 0.01 } },
		graphics_set = {
			animations = {
				water_spitter_spawner_idle_animation(0, water_tints.spawner),
				water_spitter_spawner_idle_animation(1, water_tints.spawner),
				water_spitter_spawner_idle_animation(2, water_tints.spawner),
				water_spitter_spawner_idle_animation(3, water_tints.spawner),
			},
		},

		result_units = {
			{ "small-water-biter", { { 0.0, 0.3 }, { 0.5, 0.0 } } },
			{ "medium-water-biter", { { 0.3, 0.0 }, { 0.6, 0.5 }, { 0.7, 0.1 }, { 0.75, 0.0 } } },
			{ "big-water-biter", { { 0.6, 0.0 }, { 0.85, 0.4 }, { 0.9, 0.0 } } },
			{ "behemoth-water-biter", { { 0.8, 0.0 }, { 0.9, 1.0 }, { 0.98, 0.4 } } },
		},

		spawning_cooldown = { 360, 150 },
		spawning_radius = 10,
		spawning_spacing = 3,
		max_spawn_shift = 0,
		max_richness_for_spawn_shift = 100,
		--autoplace = enemy_autoplace.enemy_spawner_autoplace("enemy_autoplace_base(0, 8)"),

		autoplace = {
			control = "water-biter-base",
			order = "b[enemy]-a[spawner]",
			force = "enemy",
			--probability_expression = "enemy_autoplace_base(0, 1)*0.02",
			probability_expression = "enemy_autoplace_base(0, 1)*0.01",
			richness_expression = 1,
		},
		call_for_help_radius = 60,
	},
})

-- ----------------------------------------------------------------------
-- Corpse
-- ----------------------------------------------------------------------

data:extend({
	{
		type = "corpse",
		name = "water-biter-spawner-corpse",
		flags = { "placeable-neutral", "placeable-off-grid", "not-on-map" },
		icon = "__base__/graphics/icons/spitter-spawner-corpse.png",
		collision_box = { { -2, -2 }, { 2, 2 } },
		selection_box = { { -2, -2 }, { 2, 2 } },
		selectable_in_game = false,
		dying_speed = 0.015,
		time_before_removed = 15 * 60 * 60,
		subgroup = "corpses",
		order = "c[corpse]-c[water-biter-spawner]",
		animation = {
			spawner_die_animation(0, spitter_spawner_tint),
			spawner_die_animation(1, spitter_spawner_tint),
			spawner_die_animation(2, spitter_spawner_tint),
			spawner_die_animation(3, spitter_spawner_tint),
		},
	},
})
-- ----------------------------------------------------------------------
-- autoplace-control
-- ----------------------------------------------------------------------

data:extend({
	{
		type = "autoplace-control",
		name = "water-biter-base",
		localised_name = { "entity-name.water-biter-spawner" },
		richness = false,
		order = "b[enemy]-z[white]",
		category = "enemy",
		hidden = true,
	},
})

-- ----------------------------------------------------------------------
-- Water Spitter custom textures
-- ----------------------------------------------------------------------

local water_spitter_units = {
	small = "small-water-biter",
	medium = "medium-water-biter",
	big = "big-water-biter",
	behemoth = "behemoth-water-biter",
}

local water_spitter_scales = {
	small = 0.4,
	medium = 0.7,
	big = 1.0,
	behemoth = 1.25,
}

local water_spitter_speeds = {
	small = 0.6,
	medium = 0.48,
	big = 0.37,
	behemoth = 0.3,
}

local function create_run_animation(scale, speed, tint)
	return {
		layers = {
			{
				direction_count = 16,
				filenames = {
					"__water_spitters__/graphics/spitter-run-1.png",
					"__water_spitters__/graphics/spitter-run-2.png",
					"__water_spitters__/graphics/spitter-run-3.png",
					"__water_spitters__/graphics/spitter-run-4.png",
				},
				frame_count = 21,
				height = 248,
				line_length = 6,
				lines_per_file = 15,
				scale = scale,
				animation_speed = speed,
				shift = { 0, -0.240625 },
				slice = 6,
				surface = "nauvis",
				usage = "enemy",
				width = 312,
			},

			{
				direction_count = 16,
				filenames = {
					"__water_spitters__/graphics/spitter-run-mask-1.png",
					"__water_spitters__/graphics/spitter-run-mask-2.png",
					"__water_spitters__/graphics/spitter-run-mask-3.png",
					"__water_spitters__/graphics/spitter-run-mask-4.png",
				},
				frame_count = 21,
				height = 248,
				line_length = 6,
				lines_per_file = 15,
				scale = scale,
				animation_speed = speed,
				shift = { 0, -0.240625 },
				slice = 6,
				surface = "nauvis",
				usage = "enemy",
				width = 312,
				tint = tint,
			},
		},
	}
end

local function create_attack_animation(scale, tint)
	return {
		layers = {
			{
				direction_count = 16,
				filenames = {
					"__water_spitters__/graphics/spitter-attack-1.png",
					"__water_spitters__/graphics/spitter-attack-2.png",
					"__water_spitters__/graphics/spitter-attack-3.png",
				},
				frame_count = 14,
				height = 248,
				line_length = 6,
				lines_per_file = 15,
				scale = scale * 0.9,
				animation_speed = 0.4,
				shift = { 0, -0.240625 },
				slice = 6,
				surface = "nauvis",
				usage = "enemy",
				width = 312,
			},

			{
				direction_count = 16,
				filenames = {
					"__water_spitters__/graphics/spitter-attack-mask-1.png",
					"__water_spitters__/graphics/spitter-attack-mask-2.png",
					"__water_spitters__/graphics/spitter-attack-mask-3.png",
				},
				frame_count = 14,
				height = 248,
				line_length = 6,
				lines_per_file = 15,
				scale = scale * 0.9,
				animation_speed = 0.4,
				shift = { 0, -0.240625 },
				slice = 6,
				surface = "nauvis",
				usage = "enemy",
				width = 312,
				tint = tint,
			},
		},
	}
end

for size, unit_name in pairs(water_spitter_units) do
	local unit = data.raw["unit"][unit_name]

	unit.run_animation = create_run_animation(water_spitter_scales[size], water_spitter_speeds[size], water_tints[size])

	unit.attack_parameters.animation = create_attack_animation(water_spitter_scales[size], water_tints[size])
end

-- ----------------------------------------------------------------------
-- Spawner texture
-- ----------------------------------------------------------------------

data.raw["unit-spawner"]["water-biter-spawner"].graphics_set = {
	animations = {
		{
			layers = {
				{
					filenames = {
						"__water_spitters__/graphics/spitter-nest-idle.png",
					},
					frame_count = 4,
					scale = 0.5,
					animation_speed = 0.12,
					run_mode = "forward-then-backward",
					surface = "nauvis",
					usage = "enemy",
					width = 1040,
					height = 752,
					line_length = 4,
					lines_per_file = 4,
					x = 0,
					y = 0,
				},
			},
		},
	},
}

-- ----------------------------------------------------------------------
-- Icons
-- ----------------------------------------------------------------------

data.raw["unit"]["small-water-biter"].icon = "__water_spitters__/graphics/icons/spitter-small.png"

data.raw["unit"]["medium-water-biter"].icon = "__water_spitters__/graphics/icons/spitter-medium.png"

data.raw["unit"]["big-water-biter"].icon = "__water_spitters__/graphics/icons/spitter-big.png"

data.raw["unit"]["behemoth-water-biter"].icon = "__water_spitters__/graphics/icons/spitter-behemoth.png"

data.raw["unit-spawner"]["water-biter-spawner"].icon = "__water_spitters__/graphics/icons/spitter-nest.png"

-- ----------------------------------------------------------------------
-- captive-biter-spawner
-- ----------------------------------------------------------------------
--data:extend({
--	{
--		type = "assembling-machine",
--		name = "captive-water-biter-spawner",
--		icon = "__space-age__/graphics/icons/captive-biter-spawner.png",
--		subgroup = "agriculture",
--		flags = { "placeable-neutral", "placeable-player", "player-creation", "not-repairable", "not-deconstructable" },
--		collision_box = { { -2.2, -2.2 }, { 2.2, 2.2 } },
--		selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
--		create_ghost_on_death = false,
--		max_health = 350,
--		show_recipe_icon = false,
--		impact_category = "organic",
--		production_health_effect = {
--			not_producing = -1 / 60, -- 5 hp per second
--			producing = 1 / 60, -- 5 hp per second
--		},
--		ignore_output_full = true,
--		alert_icon_shift = util.by_pixel(0, -12),
--		icon_draw_specification = { shift = { 0, -0.3 } },
--		created_effect = {
--			type = "direct",
--			action_delivery = {
--				type = "instant",
--				source_effects = {
--					type = "create-explosion",
--					entity_name = "captive-spawner-explosion-1",
--				},
--			},
--		},
--		dying_explosion = "captive-spawner-explosion-2",
--		dying_trigger_effect = {
--			type = "create-entity",
--			entity_name = "water-biter-spawner",
--			as_enemy = true,
--			ignore_no_enemies_mode = true,
--			protected = true,
--		},
--		resistances = {
--			{
--				type = "fire",
--				percent = 70,
--			},
--		},
--		surface_conditions = {
--			{
--				property = "pressure",
--				min = 1000,
--				max = 1000,
--			},
--		},
--		fast_replaceable_group = "captive-biter-spawner",
--		graphics_set = {
--			animation = {
--				layers = {
--					util.sprite_load("__space-age__/graphics/entity/captive-spawner/captive-anim", {
--						frame_count = 32,
--						scale = 0.5,
--						animation_speed = 0.4,
--					}),
--					util.sprite_load("__space-age__/graphics/entity/captive-spawner/captive-shadow", {
--						frame_count = 32,
--						scale = 0.5,
--						animation_speed = 0.4,
--						draw_as_shadow = true,
--					}),
--				},
--			},
--			working_visualisations = {
--				{
--					fadeout = true,
--					animation = util.sprite_load("__space-age__/graphics/entity/captive-spawner/captive-fluids", {
--						frame_count = 32,
--						scale = 0.5,
--						tint = { 0.25, 0.44, 0, 1 },
--						animation_speed = 0.4,
--					}),
--				},
--			},
--		},
--		open_sound = sounds.mech_small_open,
--		close_sound = sounds.mech_small_close,
--		working_sound = {
--			sound = { category = "enemy", filename = "__base__/sound/creatures/spawner.ogg", volume = 0.6 },
--			sound_accents = {
--				{
--					sound = {
--						variations = sound_variations(
--							"__space-age__/sound/entity/spawner/spawner-respirator-push",
--							3,
--							0.3
--						),
--						audible_distance_modifier = 0.6,
--					},
--					frame = 1,
--				},
--				{
--					sound = {
--						variations = sound_variations(
--							"__space-age__/sound/entity/spawner/spawner-respirator-pull",
--							3,
--							0.3
--						),
--						audible_distance_modifier = 0.6,
--					},
--					frame = 17,
--				},
--			},
--		},
--		crafting_categories = { "captive-spawner-process" },
--		fixed_recipe = "biter-egg",
--		crafting_speed = 1,
--		energy_source = {
--			type = "burner",
--			fuel_categories = { "food" },
--			effectivity = 1,
--			fuel_inventory_size = 1,
--			emissions_per_minute = { pollution = -1 },
--			burner_usage = "food",
--			light_flicker = {
--				minimum_intensity = 0,
--				maximum_intensity = 0,
--				derivation_change_frequency = 0,
--				derivation_change_deviation = 0,
--				border_fix_speed = 0,
--				minimum_light_size = 0,
--				light_intensity_to_size_coefficient = 0,
--				color = { 0, 0, 0, 1 },
--			},
--		},
--		energy_usage = "100kW",
--		module_slots = 0,
--		allowed_effects = {},
--		collision_mask = { layers = { ["ground_tile"] = true, ["object"] = true } },
--		enable_logistic_control_behavior = false,
--	},
--})
