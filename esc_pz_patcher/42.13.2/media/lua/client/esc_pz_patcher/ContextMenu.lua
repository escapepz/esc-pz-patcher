local safeLog = require("esc_pz_patcher/SafeLogger")
local patcher = require("esc_pz_patcher/LoadSetting")

local _IsoChunkMap = IsoChunkMap
local _IsoWorld = IsoWorld

local function getMaxRenderCount(_playerIndex)
	local _player = getSpecificPlayer(_playerIndex)
	local success, result = pcall(function()
		return _IsoChunkMap.getMaxRenderCount()
	end)

	if success then
		local msg = "Current MaxRenderCount: " .. tostring(result)
		safeLog(msg)
		---@diagnostic disable-next-line: unnecessary-if
		if _player then
			_player:setHaloNote(msg)
		else
			safeLog("[getDynamicChunkGridWidth] _player is nil")
		end
		return result
	else
		local msg = "ERROR: Failed to get MaxRenderCount: " .. tostring(result)
		safeLog(msg)
		---@diagnostic disable-next-line: unnecessary-if
		if _player then
			_player:setHaloNote(msg)
		else
			safeLog("[getDynamicChunkGridWidth] _player is nil")
		end
	end
end

local function getDynamicChunkGridWidth(_playerIndex)
	local _player = getSpecificPlayer(_playerIndex)
	local success, result = pcall(function()
		return _IsoWorld.getDynamicChunkGridWidth()
	end)

	if success then
		local msg = "Current DynamicChunkGridWidth: " .. tostring(result)
		safeLog(msg)
		---@diagnostic disable-next-line: unnecessary-if
		if _player then
			_player:setHaloNote(msg)
		else
			safeLog("[getDynamicChunkGridWidth] _player is nil")
		end
		return result
	else
		local msg = "ERROR: Failed to get DynamicChunkGridWidth: " .. tostring(result)
		safeLog(msg)
		---@diagnostic disable-next-line: unnecessary-if
		if _player then
			_player:setHaloNote(msg)
		else
			safeLog("[getDynamicChunkGridWidth] _player is nil")
		end
	end
end

local function onFillMenu(playerIndex, context, worldObjects, test)
	-- 1. Create a top-level option that will host the sub-menu
	local mainOption = context:addOption("System Metrics", worldObjects)

	-- 2. Create the new sub-menu object
	local subMenu = ISContextMenu:getNew(context)

	-- 3. Link the sub-menu to your main option
	context:setSubMenu(mainOption, subMenu)

	-- 4. Add options to the sub-menu instead of the main 'context'
	subMenu:addOption("Get MaxRenderCount", playerIndex, getMaxRenderCount)
	subMenu:addOption("Get DynamicChunkGridWidth", playerIndex, getDynamicChunkGridWidth)
end

Events.OnFillWorldObjectContextMenu.Add(onFillMenu)

return {
	getMaxRenderCount = getMaxRenderCount,
	getDynamicChunkGridWidth = getDynamicChunkGridWidth,
}
