-- Storage array for all of our options
local config = {
    keyBind = nil,
    checkBox = nil,
    textEntry = nil,
    multiBox = nil,
    comboBox = nil,
    colorPick = nil,
    slider = nil,
    button = nil
}
local function getJavaFieldNum(object, fieldName)
    for i = 0, getNumClassFields(object) - 1 do
        local javaField = getClassField(object, i)
        if luautils.stringEnds(tostring(javaField), '.' .. fieldName) then
            return i
        end
    end
end

-- Hello! In this example, I'll be showing you all of the new Native ModOptions that is available to us!
-- I've tried to document all of the available options, and I recommend enabling the mod to check it out in action.
-- Settings are saved at: Zomboid\Lua\modOptions.ini
-- For translations, you can use `getText()` for each of the below options as well.  For this example, I opted to not.
local function ExampleConfig()
    -- Create the options object! This is required when adding the new Mod Options
    --- "UNIQUEID" should be replaced with your own unique ID. Possibly best to just use your mod's ID
    -- create(UID, name)   
    local options = PZAPI.ModOptions:create("esc_pz_patcher", "ESC PZ Patcher")

    -- Add a title.
    ---- Not required, just adds larger text in the middle. Can be used to denote a different "section"
    ---- Can be used any time
    -- addTitle(title)
    options:addTitle(getText("UI_options_RenderLessZombies_title"))

    -- addTextEntry(ID, name, value, _tooltip)
    config.textEntry = options:addTextEntry("2", getText("UI_options_RenderLessZombieCount"), "100",
        getText("UI_options_RenderLessZombieCount_tooltip")) -- NOTE:
    --- You DO NOT have to store the items like I have.
    --- You can retrieve your `options` object at anytime by doing: 
    ------ local options = PZAPI.ModOptions:getOptions("UNIQUEID")
    --- You can retrieve each individual option by doing:
    ------ local option = options:getOption(ID)
    ------- Where "ID" is the ID of the option you want to get.
    -------- In the above exmple, doing options:getOption("5") would return the colorPicker
    options.apply = function(self)

        local World = getWorld()
        if World then

            local tmpTransform = getJavaFieldNum(World, "MaxRenderCount")
            if tmpTransform then
                local options = PZAPI.ModOptions:getOptions("RenderLessZombie")
                local Count = options:getOption("2")
                Count = Count:getValue()
                Count = tonumber(Count)
                World:setMaxRenderCount(Count)
            end
        end
    end
end

ExampleConfig()
