-- Chunk Grid Width Configuration via ModOptions
-- Allows players to select chunk grid size without debug mode
local patcher = require("esc_pz_patcher/LoadSetting")

local function ChunkGridConfig()
	-- Create ModOptions UI
	local options = PZAPI.ModOptions:getOptions("esc_pz_patcher")

	if options == nil then
		options = PZAPI.ModOptions:create("esc_pz_patcher", "ESC PZ Patcher")
	end

	-- Add title section
	options:addTitle(
		getTextOrNull("UI_options_ChunkGridConfig_title") or getTextMediaEN("UI_options_ChunkGridConfig_title")
	)

	-- Add description
	options:addDescription(
		getTextOrNull("UI_options_ChunkGridConfig_description")
			or getTextMediaEN("UI_options_ChunkGridConfig_description")
	)

	-- ComboBox for chunk grid selection
	local comboBox = options:addComboBox("chunk_grid_size", "Chunk Grid Size")
	comboBox:addItem("Dynamic (4K+)", true) -- Default selected
	comboBox:addItem("5x5 (Low Performance)")
	comboBox:addItem("7x7 (Balanced)")
	comboBox:addItem("9x9 (Standard)")
	comboBox:addItem("11x11 (High Performance)")
	comboBox:addItem("13x13 (Maximum)")
	comboBox:addItem("15x15 (Ultra)")
	comboBox:addItem("17x17 (Ultra PRO)")
	comboBox:addItem("19x19 (Vanilla MAX!)")
	comboBox:addItem("21x21 (Overkill?!)")
	comboBox:addItem("23x23 (Madness??!)")
	comboBox:addItem("25x25 (Legendary???)")

	-- Performance stats info
	options:addDescription(
		getTextOrNull("UI_options_ChunkGridConfig_info_description")
			or getTextMediaEN("UI_options_ChunkGridConfig_info_description")
	)

	-- Apply function - called when player clicks Apply
	options.apply = function()
		patcher.setDynamicChunkGridWidth()
		patcher.setRenderLessZombieCount()
	end
end

return ChunkGridConfig
