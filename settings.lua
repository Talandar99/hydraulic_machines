if mods["planetaris-arig"] then
	data:extend({
		{
			type = "bool-setting",
			name = "industrial-module-arig-press",
			setting_type = "startup",
			default_value = true,
			order = "hydraulic-machines-arig",
		},
	})
end

if mods["lignumis"] then
	data:extend({
		{
			type = "bool-setting",
			name = "industrial-module-lignumis-lumber-mill",
			setting_type = "startup",
			default_value = true,
			order = "hydraulic-machines-lignumis",
		},
	})
end
