local safeLog = require("esc_pz_patcher/SafeLogger")

local function getMaxRenderCount(_playerIndex)
	local _player = getSpecificPlayer(_playerIndex)
	local success, result = pcall(function()
		---@diagnostic disable-next-line: undefined-field
		local world = IsoWorld.instance
		---@diagnostic disable-next-line: unnecessary-if
		if world then
			---@diagnostic disable-next-line: undefined-field
			return world:getMaxRenderCount()
		end
		return nil
	end)

	if success and result then
		local msg = "Current MaxRenderCount: " .. tostring(result)
		safeLog(msg)
		---@diagnostic disable-next-line: unnecessary-if
		if _player then
			_player:setHaloNote(msg)
		else
			safeLog("[getMaxRenderCount] _player is nil")
		end
		return result
	else
		local msg = "ERROR: Failed to get MaxRenderCount or world instance is nil"
		safeLog(msg)
		---@diagnostic disable-next-line: unnecessary-if
		if _player then
			_player:setHaloNote(msg)
		else
			safeLog("[getMaxRenderCount] _player is nil")
		end
	end
end

local function getDynamicChunkGridWidth(_playerIndex)
	local _player = getSpecificPlayer(_playerIndex)
	local success, result = pcall(function()
		---@diagnostic disable-next-line: undefined-field
		return IsoWorld.getDynamicChunkGridWidth()
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

local function setRenderLessZombieCount(_playerIndex, _value)
	local _player = getSpecificPlayer(_playerIndex)
	local success, err = pcall(function()
		---@diagnostic disable-next-line: undefined-field
		IsoWorld.setDefaultMaxRenderCount(_value)
		local options = PZAPI.ModOptions:getOptions("esc_pz_patcher")
		if options then
			local renderLessZombieCountOption = options:getOption("RenderLessZombieCount") --- @as umbrella.ModOptions.TextEntry
			---@diagnostic disable-next-line: unnecessary-if
			if renderLessZombieCountOption then
				renderLessZombieCountOption:setValue(tostring(_value))
				PZAPI.ModOptions:save()
			end
		end
	end)

	if success then
		local msg = "Set RenderLessZombieCount to: " .. tostring(_value)
		safeLog(msg)
		---@diagnostic disable-next-line: unnecessary-if
		if _player then
			_player:setHaloNote(msg)
		else
			safeLog("[setRenderLessZombieCount] _player is nil")
		end
	else
		local msg = "ERROR: Failed to set RenderLessZombieCount: " .. tostring(err)
		safeLog(msg)
		---@diagnostic disable-next-line: unnecessary-if
		if _player then
			_player:setHaloNote(msg)
		else
			safeLog("[setRenderLessZombieCount] _player is nil")
		end
	end
end

local function onFillMenu(playerIndex, context, worldObjects, test)
	-- Create main "System Metrics" menu
	local mainOption = context:addOption("System Metrics", worldObjects)
	local subMenu = context:getNew(context)
	context:addSubMenu(mainOption, subMenu)

	-- Add info options to the sub-menu
	subMenu:addOption("Get MaxRenderCount", playerIndex, getMaxRenderCount)
	subMenu:addOption("Get DynamicChunkGridWidth", playerIndex, getDynamicChunkGridWidth)

	-- Create "Set RenderLessZombieCount" submenu
	local setZombieOption = context:addOption("Set RenderLessZombieCount", worldObjects)
	local setZombieSubMenu = context:getNew(context)
	context:addSubMenu(setZombieOption, setZombieSubMenu)

	-- Add value options to the submenu
	local values = { 10, 50, 100, 200, 300, 510 }
	for _, value in ipairs(values) do
		setZombieSubMenu:addOption(tostring(value), playerIndex, setRenderLessZombieCount, value)
	end
end

Events.OnFillWorldObjectContextMenu.Add(onFillMenu)

return {
	getMaxRenderCount = getMaxRenderCount,
	getDynamicChunkGridWidth = getDynamicChunkGridWidth,
}
