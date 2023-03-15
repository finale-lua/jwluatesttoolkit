function plugindef()
    finaleplugin.RequireDocument = false
    finaleplugin.LoadLuaSocket = true
    finaleplugin.IgnoreReturnValue = true
    finaleplugin.IncludeInPluginMenu = false
end

finenv.RetainLuaState = true

local retvals = {12, "a string", false, function() end} -- this must match the list in jwluatest_internal_execute.lua
local function retvalx(x)
    return retvals[x%4 + 1]
end

x = x and x + 1 or 0

return retvalx(x), retvalx(x+1), retvalx(x+2), retvalx(x+3), retvalx(x+4)

