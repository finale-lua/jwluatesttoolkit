require "tools/jwluatesttools"

local str = finale.FCString()

-- These functions were not marked Lua-supported in the Framework 0.54 doc pages,
-- but they appear to be hooked up in JW Lua 0.54.

FunctionTest(str, "FCString", "InsertString") 
FunctionTest(str, "FCString", "ReplaceCategoryFonts")
FunctionTest(str, "FCString", "EndsWith")

-- SetMeasurement - centimeters
str:SetMeasurement(10000, finale.MEASUREMENTUNIT_CENTIMETERS)
str:Replace(",", ".")
AssureValue(str.LuaString, "88.19444", "SetMeasurement() - centimeters")

function assignStrValue(fcstr, value)
    local success, msg = pcall(function() fcstr.LuaString = value end)
    AssureTrue(success, "FCString.LuaString property did not accept "..tostring(value).." as a value: "..tostring(msg))
end

function setStrValue(fcstr, value)
    local success, msg = pcall(function() fcstr:SetLuaString(value) end)
    AssureTrue(success, "FCString.SetLuaString setter did not accept "..tostring(value).." as a value: "..tostring(msg))
end

assignStrValue(str, 1.335)
AssureValue(str.LuaString, "1.335", "Set from number with property")

setStrValue(str, 3.556)
AssureValue(str:GetLuaString(), "3.556", "Set from number with setter")

assignStrValue(str, "abcde")
AssureValue(str.LuaString, "abcde", "Set from string with property")

setStrValue(str, "1a4.tr")
AssureValue(str:GetLuaString(), "1a4.tr", "Set from string with setter")

if AssureNonNil(utf8, "utf8 library not available for FCString.SetCharacterAt test.") then
    setStrValue(str, "12345")
    str:SetCharacterAt(0, 0xfeb1)
    str:SetCharacterAt(1, 0xfeb2)
    str:SetCharacterAt(2, 0xfeb3)
    str:SetCharacterAt(3, 0xfeb4)
    str:SetCharacterAt(4, 0xfeb5)
    local expected_value = utf8.char(0xfeb1, 0xfeb2, 0xfeb3, 0xfeb4, 0xfeb5)
    AssureValue(str:GetLuaString(), expected_value, "Setting characters greater than 0xfeb0")
end

local testclearout = finale.FCString()
testclearout.LuaString = "valueß"
AssureEqual(testclearout.LuaString, "valueß", "Unable to set FCString.LuaString to valueß")
testclearout.LuaString = ""
AssureEqual(testclearout.LuaString, "", "Unable to clear valueß from FCString.LuaString")


