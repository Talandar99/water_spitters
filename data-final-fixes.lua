local planet = data.raw.planet and data.raw.planet["nauvis"]
local mgs = planet.map_gen_settings or {}
mgs.autoplace_settings = mgs.autoplace_settings or {}
mgs.autoplace_settings["entity"] = mgs.autoplace_settings["entity"] or { settings = {} }
mgs.autoplace_settings["entity"].settings["water-biter-spawner"] = mgs.autoplace_settings["entity"].settings["water-biter-spawner"]
	or {}

planet.map_gen_settings = mgs
