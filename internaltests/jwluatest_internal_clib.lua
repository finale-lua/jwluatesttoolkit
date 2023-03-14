-- The GitHub repository for sampleclib is:
-- https://github.com/finale-lua/sample-clib

local function do_require(str)
    -- If require fails (or crashes Finale), it is likely because
    --    1. The clibs do not exist in the clib/ directory.
    --    2. The clibs are not built for the current Lua version in Finale Lua.
    --    3. The current Finale Lua plugin can't load clibs (which is what we are trying to verify with this test).
    return require(str)
end

if finenv.UI():IsOnMac() then
    package.cpath = GetRunningFolderPath()..'/clib/?.dylib;' .. package.cpath
else
    package.cpath = GetRunningFolderPath()..'/clib/?.dll;' .. package.cpath
end

local success, clib = pcall(do_require, "sampleclib")
if not AssureTrue(success, "require('sampleclib'): "..tostring(clib)) then
    return
end

AssureEqual(2, clib.plusone(1), "clib.plusone(1)") -- clib.pluaone adds 1 to input

local measures = clib.load_measures()
AssureEqual("FCMeasures", measures:ClassName(), "FCMeasures from clib")
AssureEqual(61, measures.Count, "FCMeasures from clib count")

local entry = LoadMeasureEntry(19, 2, 134)
if AssureNonNil(entry, "Entry at #19, 2, 134") then
    AssureEqual(clib.entry_duration(entry), 2048, "clib.entry_duration")
    clib.halve_duration(entry)
    AssureEqual(clib.entry_duration(entry), 1024, "clib.halve_duration")
end
