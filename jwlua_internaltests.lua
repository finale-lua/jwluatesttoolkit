function plugindef()
   -- This function and the 'finaleplugin' namespace
   -- are both reserved for the plug-in definition.
   finaleplugin.NoStore = true
   finaleplugin.RequireDocument = false
   return "Finale Lua Internal Tests", "Internal Tests", "Test internal Lua features."
end

if finenv.IsRGPLua then -- if new lua
    require('mobdebug').start()
end

-- Load the toolkit  functions needed for the tests:
require("tools/jwluatesttools")

-- Validate the current file prior to the test:

-- Load and execute the unit tests for the classes:
require("internaltests/jwluatest_internal_conversion")
require("internaltests/jwluatest_internal_utf8")

-- Output the results from the tests:
PrintTestResult()

