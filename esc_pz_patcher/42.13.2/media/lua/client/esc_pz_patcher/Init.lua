local safeLog = require("esc_pz_patcher/SafeLogger")
local patcher = require("esc_pz_patcher/LoadSetting")
local RenderLessZombieConfig = require("esc_pz_patcher/RenderLessZombieModOptions")
local ChunkGridConfig = require("esc_pz_patcher/ChunkGridModOptions")

Events.OnLoadSoundBanks.Add(function()
	local success_RenderLessZombieConfig, err_RenderLessZombieConfig = pcall(function()
		RenderLessZombieConfig()
	end)
	if not success_RenderLessZombieConfig then
		safeLog("[Init] ERROR: Failed init RenderLessZombieConfig: " .. tostring(err_RenderLessZombieConfig))
	end

	local success_ChunkGridConfig, err_ChunkGridConfig = pcall(function()
		ChunkGridConfig()
	end)
	if not success_ChunkGridConfig then
		safeLog("[Init] ERROR: Failed init ChunkGridConfig: " .. tostring(err_ChunkGridConfig))
	end

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
