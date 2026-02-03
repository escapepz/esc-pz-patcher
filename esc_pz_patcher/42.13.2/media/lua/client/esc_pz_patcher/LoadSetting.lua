local safeLog = require("esc_pz_patcher/safeLogger")

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
	local World = getWorld()
	---@diagnostic disable-next-line: unnecessary-if
	if World then
		local tmpTransform = esc_pz_patcher.getJavaFieldNum(World, "MaxRenderCount")
		if tmpTransform then
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
			---@diagnostic disable-next-line: undefined-field
			World:setMaxRenderCount(renderLessZombieCount)
		else
			getPlayer():Say(getText("IGUI_RenderLessZombie_Error"))
			safeLog("Error: Can't find MaxRenderCount field in World class")
		end
	end
end

esc_pz_patcher.setChunkLoadDebugOption = function()
	if options == nil then
		options = PZAPI.ModOptions:getOptions("esc_pz_patcher")
	end
	if options == nil then
		return
	end

	local comboBox = options:getOption("chunk_grid_size")
	local selectedIndex = comboBox:getValue()

	-- Map index (1-based) to grid sizes: 0 = dynamic, 3-13 = fixed
	local gridSizes = { 0, 5, 7, 9, 11, 13 }
	local selectedSize = gridSizes[selectedIndex]

	if selectedSize ~= nil then
		-- Disable all chunk grid options first
		DebugOptions.instance:setBoolean("World.ChunkMap.5x5", false)
		DebugOptions.instance:setBoolean("World.ChunkMap.7x7", false)
		DebugOptions.instance:setBoolean("World.ChunkMap.9x9", false)
		DebugOptions.instance:setBoolean("World.ChunkMap.11x11", false)
		DebugOptions.instance:setBoolean("World.ChunkMap.13x13", false)

		if selectedSize == 0 then
			-- Dynamic mode: all options disabled, CalcChunkWidth() will auto-calculate
			DebugOptions.instance:save()
			safeLog("[ChunkGridConfig] Set to DYNAMIC mode (auto-detect)")
		else
			-- Fixed size mode: enable selected grid option
			local optionName = "World.ChunkMap." .. selectedSize .. "x" .. selectedSize
			DebugOptions.instance:setBoolean(optionName, true)
			DebugOptions.instance:save()
			safeLog("[ChunkGridConfig] Set chunk grid to FIXED: " .. selectedSize .. "x" .. selectedSize)
		end
	end
end

return esc_pz_patcher
