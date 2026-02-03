local safeLog = require("esc_pz_patcher/SafeLogger")
local patcher = require("esc_pz_patcher/LoadSetting")
local RenderLessZombieConfig = require("esc_pz_patcher/RenderLessZombieModOptions")
local ChunkGridConfig = require("esc_pz_patcher/ChunkGridModOptions")

local _is_success_RenderLessZombieConfig = false
local _is_success_ChunkGridConfig = false

local function InitModOptions()
	if not _is_success_RenderLessZombieConfig then
		local success_RenderLessZombieConfig, err_RenderLessZombieConfig = pcall(function()
			RenderLessZombieConfig()
		end)
		if not success_RenderLessZombieConfig then
			safeLog("[Init] ERROR: Failed init RenderLessZombieConfig: " .. tostring(err_RenderLessZombieConfig))
			_is_success_RenderLessZombieConfig = false
		end
		_is_success_RenderLessZombieConfig = true
	end

	if not _is_success_ChunkGridConfig then
		local success_ChunkGridConfig, err_ChunkGridConfig = pcall(function()
			ChunkGridConfig()
		end)
		if not success_ChunkGridConfig then
			safeLog("[Init] ERROR: Failed init ChunkGridConfig: " .. tostring(err_ChunkGridConfig))
			_is_success_ChunkGridConfig = false
		end
		_is_success_ChunkGridConfig = true
	end
end

InitModOptions()

Events.OnLoadSoundBanks.Add(function()
	InitModOptions()

	local success_setDynamicChunkGridWidth, err_setDynamicChunkGridWidth = pcall(function()
		PZAPI.ModOptions:load()
		patcher.setDynamicChunkGridWidth()
	end)
	if not success_setDynamicChunkGridWidth then
		safeLog("[Init] ERROR: Failed to setDynamicChunkGridWidth: " .. tostring(err_setDynamicChunkGridWidth))
	end

	local success_setRenderLessZombieCount, err_setRenderLessZombieCount = pcall(function()
		patcher.setRenderLessZombieCount()
	end)
	if not success_setRenderLessZombieCount then
		safeLog("[Init] ERROR: Failed to setRenderLessZombieCount: " .. tostring(err_setRenderLessZombieCount))
	end
end)
