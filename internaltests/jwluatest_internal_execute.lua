
local retvals = {12, "a string", false, function() end} -- this must match the list in tools/test_return_value.lua

if not AssureNonNil(finenv.CreateLuaScriptItemsFromFilePath, "finenv.CreateLuaScriptItemsFromFilePath exists.") then
    return
end

local function FCLuaScriptItem_TestReturnValue(item, expected_value, expected_success)
    if AssureNonNil(item.AutomaticallyReportErrors) then 
        item.AutomaticallyReportErrors = false
    end
    local success, msg, msgtype = finenv.ExecuteLuaScriptItem(item)
    AssureEqual(msgtype, finenv.MessageResultType.SCRIPT_RESULT, "finenv.ExecuteLuaScriptItem msgtype")
    if expected_success then
        AssureTrue(success, "finenv.ExecuteLuaScriptItem result: " .. tostring(msg))
        if AssureNonNil(msg, "finenv.ExecuteLuaScriptItem msg") then
            AssureEqual(msg:sub(1, 8), expected_value:sub(1, 8), "finenv.ExecuteLuaScriptItem")
        end
    else
        AssureFalse(success, "finenv.ExecuteLuaScriptItem result: " .. tostring(msg))
    end
end

local script_path
local items

-- Check return values from executed script
script_path = GetRunningFolderPath() .. "/tools/test_return_value.lua"
items = finenv.CreateLuaScriptItemsFromFilePath(script_path)
AssureTrue(items.Count > 0, "CreateLuaScriptItemsFromFilePath for test_return_value.lua has no items")
-- test_return_value.lua uses a global variable (and RetainLuaState) to send the expected values back in succession
for x = 1, 4 do
    FCLuaScriptItem_TestReturnValue(items:GetItemAt(0), tostring(retvals[x]), true)
end

local binary_appendix_scripts =
{
    script_with_hidden_appendix2 = {succeed_false = false, succeed_true = true},
    script_with_hidden_appendix2_forcetrue = {succeed_false = true, succeed_true = true},
    script_with_hidden_appendix2_forcefalse = {succeed_false = false, succeed_true = false}
}

-- Check scripts with binary appendix
for name, attr in pairs(binary_appendix_scripts) do
    script_path = GetRunningFolderPath() .. "/tools/" .. name .. ".lua"
    items = finenv.CreateLuaScriptItemsFromFilePath(script_path)
    if AssureTrue(items.Count > 0, "CreateLuaScriptItemsFromFilePath for " .. name .. ".lua has no items") then
        local item = items:GetItemAt(0)
        AssureEqual(item.LoadAsString, attr.succeed_false, "Initial value for LoadString: " .. name .. ".lua")
        item.LoadAsString = false
        FCLuaScriptItem_TestReturnValue(item, "ee", attr.succeed_false)
        item.LoadAsString = true
        FCLuaScriptItem_TestReturnValue(item, "ee", attr.succeed_true)
    end
end
