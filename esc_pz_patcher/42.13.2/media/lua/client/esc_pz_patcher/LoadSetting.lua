local safeLog = require("esc_pz_patcher/SafeLogger")

local esc_pz_patcher = {}
local options

esc_pz_patcher.getJavaFieldNum = function(object, fieldName)
	for i = 0, getNumClassFields(object) - 1 do
		local javaField = getClassField(object, i)
		if luautils.stringEnds(tostring(javaField), "." .. fieldName) then
			return i
		end
	end
end

esc_pz_patcher.setRenderLessZombieCount = function()
	if options == nil then
		options = PZAPI.ModOptions:getOptions("esc_pz_patcher")
	end
	if options == nil then
		return
	end

	local renderLessZombieCountOption = options:getOption("RenderLessZombieCount")
	if renderLessZombieCountOption == nil then
		return
	end
	---@diagnostic disable-next-line: need-check-nil
	local renderLessZombieCount = tonumber(renderLessZombieCountOption:getValue() or 0)
	if renderLessZombieCount == 0 then
		return
	end
	-- Set default (works even if world not initialized yet)
	local success, err = pcall(function()
		---@diagnostic disable-next-line: undefined-field
		IsoWorld.setDefaultMaxRenderCount(renderLessZombieCount)
	end)
	if success then
		safeLog("[setRenderLessZombieCount] " .. tostring(renderLessZombieCount))
	else
		safeLog("[setRenderLessZombieCount] ERROR: " .. tostring(err))
	end
end

esc_pz_patcher.setDynamicChunkGridWidth = function()
	if options == nil then
		options = PZAPI.ModOptions:getOptions("esc_pz_patcher")
	end
	if options == nil then
		return
	end

	local comboBox = options:getOption("chunk_grid_size")
	---@type integer
	local selectedIndex = comboBox:getValue()
	-- Map index (1-based) to grid sizes: 0 = dynamic, 5-25 = fixed
	local gridSizes = { 0, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25 }
	---@type integer | nil
	local selectedSize = gridSizes[selectedIndex]

	if selectedSize ~= nil then
		if selectedSize == 0 then
			-- Dynamic mode: reset to auto-calculate based on screen resolution
			local success, err = pcall(function()
				---@diagnostic disable-next-line: undefined-field
				IsoChunkMap.resetDynamicChunkGridWidth()
			end)
			if success then
				safeLog("[ChunkGridConfig] Set to DYNAMIC mode (auto-detect)")
			else
				safeLog("[ChunkGridConfig] ERROR: " .. tostring(err))
			end
		else
			-- Fixed size mode: set specific grid width
			local success, err = pcall(function()
				---@diagnostic disable-next-line: undefined-field
				IsoChunkMap.setDynamicChunkGridWidth(selectedSize)
			end)
			if success then
				safeLog("[ChunkGridConfig] Set chunk grid to FIXED: " .. selectedSize .. "x" .. selectedSize)
			else
				safeLog("[ChunkGridConfig] ERROR: " .. tostring(err))
			end
		end
	end
end

return esc_pz_patcher
