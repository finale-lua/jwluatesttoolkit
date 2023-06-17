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

str.LuaString = 1.335
AssureValue(str.LuaString, "1.335", "Set from number with property")

str:SetLuaString(3.556)
AssureValue(str:GetLuaString(), "3.556", "Set from number with setter")

str.LuaString = "abcde"
AssureValue(str.LuaString, "abcde", "Set from string with property")

str:SetLuaString("1a4.tr")
AssureValue(str:GetLuaString(), "1a4.tr", "Set from string with setter")
