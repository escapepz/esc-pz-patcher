-- local safeLog = require("esc_pz_patcher/safeLogger")
local patcher = require("esc_pz_patcher/LoadSetting")

Events.OnCreatePlayer.Add(function()
	patcher.setRenderLessZombieCount()
	patcher.setChunkLoadDebugOption()
end)

-- local core = getCore()

-- local defaultZoomLevels = core:getDefaultZoomLevels()
-- safeLog(tostring(defaultZoomLevels))

-- core:setOptionZoomLevels2x("400;300;250;225;200;175;150;125;75;50;25")
