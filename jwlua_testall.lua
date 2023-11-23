function plugindef()
   -- This function and the 'finaleplugin' namespace
   -- are both reserved for the plug-in definition.
   finaleplugin.NoStore = true
   finaleplugin.ExecuteExternalCode = true
   finaleplugin.ExecuteHttpsCalls = true
   return "Finale Lua - All Tests", "All Tests", "Run all the Finale Lua tests. Requires the debug file template."
end

if finenv.IsRGPLua and not finenv.ConsoleIsAvailable then -- if new lua
    require('mobdebug').start()
end

-- Load the toolkit functions needed for the tests:
require("tools/jwluatesttools")

-- Validate the current file prior to the test:
if not CheckForOfficialTestTemplate() then return end

-- The following have to be fixed up, at least in pre-26.2 Finale,
-- because apparently the rollback does not catch all preferences
-- changes

local repeat_prefs = finale.FCRepeatPrefs()
AssureTrue(repeat_prefs:Load(1), "unable to load repeat prefs for caching current value of ShowOnStaffListID")
local curr_staff_list_id = repeat_prefs.ShowOnStaffListID

-- Load the toolkit functions needed for the tests.
-- Make sure to run jwlua_filetests first, to assure that the file contents is intact.
require("jwlua_filetests")
require("jwlua_consttests")
require("jwlua_classtests")
require("jwlua_unlinktests")
require("jwlua_internaltests")

repeat_prefs.ShowOnStaffListID = curr_staff_list_id
AssureTrue(repeat_prefs:Save(), "unable to save repeat prefs for caching current value of ShowOnStaffListID")

print("All tests complete.")

-- No need to output the result, since that's already been done
