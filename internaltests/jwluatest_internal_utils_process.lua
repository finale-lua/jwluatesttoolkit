-- If this fails, check that finaleplugin.LoadLuaOSUtils is true in the top-level plugindef function your are invoking
local osutils = DoRequire("luaosutils")
if not osutils then return end
local process = osutils.process
if not AssureNonNil(process, "Luaosutils "..osutils._VERSION.." is not the right version.") then
    return
end

local echo_str = "This is a test."
local command_str = WinMac("cmd /c ","")..'echo '..echo_str

local output = process.execute(command_str)
AssureNonNil(output, "process.execute succeeded")
AssureNonNil(string.find(output, echo_str, 1), "process.execute echoed correct value.")

AssureTrue(process.launch(command_str), "process.launch launched echo command.")
