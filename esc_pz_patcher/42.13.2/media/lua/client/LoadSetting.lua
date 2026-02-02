local function getJavaFieldNum(object, fieldName)
    for i = 0, getNumClassFields(object) - 1 do
        local javaField = getClassField(object, i)
        if luautils.stringEnds(tostring(javaField), '.' .. fieldName) then
            return i
        end
    end
end

local function Set()
    local World = getWorld()
    if World then
        local tmpTransform = getJavaFieldNum(World, "MaxRenderCount")
        if tmpTransform then
            local options = PZAPI.ModOptions:getOptions("RenderLessZombie")
            local Count = options:getOption("2")
            Count = Count:getValue()
            Count = tonumber(Count)
            World:setMaxRenderCount(Count)
        else
            getPlayer():Say(getText("IGUI_RenderLessZombie_Error"))
            print("Error: Can't find MaxRenderCount field in World class")

        end

    end
end

Events.OnCreatePlayer.Add(Set)
