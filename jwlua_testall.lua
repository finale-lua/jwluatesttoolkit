function plugindef()   -- This function and the 'finaleplugin' namespace   -- are both reserved for the plug-in definition.   finaleplugin.NoStore = true   return "Finale Lua - All Tests", "All Tests", "Run all the Finale Lua tests. Requires the debug file template."end

if finenv.IsRGPLua then -- if new lua
    require('mobdebug').start()
end

-- Load the toolkit  functions needed for the tests:
require("tools/jwluatesttools")

-- Validate the current file prior to the test:
if not CheckForOfficialTestTemplate() then return end

local os_string = " for macOS"
if finenv.UI():IsOnWindows() then
    os_string = " for Windows"
end
local fin_version = tostring((finenv.FinaleVersion > 10000) and (finenv.FinaleVersion - 10000) or finenv.FinaleVersion)
local minor_version = bit32.band(finenv.RawFinaleVersion, 0x00f00000)
if minor_version ~= 0 then
    fin_version = fin_version .. "." .. tostring(bit32.rshift(minor_version, 20))
end
print("Lua Plugin Version "..finenv.StringVersion)
print("Running on Finale "..fin_version..os_string)

-- Load the toolkit  functions needed for the tests.
-- Make sure to run jwlua_filetests first, to assure that the file contents is intact.
require("jwlua_filetests")
require("jwlua_consttests")
require("jwlua_classtests")
require("jwlua_unlinktests")
require("jwlua_internaltests")

-- No need to output the result, since that's already been done
