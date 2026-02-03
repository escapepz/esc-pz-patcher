local patcher = require("esc_pz_patcher/LoadSetting")

local function ExampleConfig()
	local options = PZAPI.ModOptions:getOptions("esc_pz_patcher")

	if options == nil then
		options = PZAPI.ModOptions:create("esc_pz_patcher", "ESC PZ Patcher")
	end

	options:addTitle(getText("UI_options_RenderLessZombies_title"))

	options:addTextEntry(
		"RenderLessZombieCount",
		getText("UI_options_RenderLessZombieCount"),
		"100",
		getText("UI_options_RenderLessZombieCount_tooltip")
	)

	options.apply = function()
		patcher.setRenderLessZombieCount()
	end
end

ExampleConfig()
