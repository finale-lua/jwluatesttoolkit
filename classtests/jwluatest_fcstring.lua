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

local test_append = finale.FCString()
test_append:AppendCharacter(utf8.codepoint("𝒸"))
AssureEqual(test_append.LuaString, "𝒸", "Value after appending '𝒸'") 
local success, msg = pcall (function() test_append:AppendCharacter(0x121234) end)
AssureFalse(success, "Attempt to append 0x121234 (invalid codepoint) to FCString.")
test_append.LuaString = "𝒸𝒽𝒶 𝓇𝓂"
local codepoint, nextx = test_append:GetCodePointAt(2)
AssureEqual(codepoint, utf8.codepoint("𝒽"), "Retrieving codepoint 2 ('𝒽')")
AssureEqual(nextx, 4, "Next index retrieving codepoint 2 ('𝒽')")
codepoint, nextx = test_append:GetCodePointAt(6)
AssureEqual(codepoint, utf8.codepoint(" "), "Retrieving codepoint 6 (' ')")
AssureEqual(nextx, 7, "Next index retrieving codepoint 6 (' ')")
codepoint, nextx = test_append:GetCodePointAt(8)
AssureEqual(codepoint, utf8.codepoint("𝓇"), "Retrieving codepoint 8 (low surrogate of '𝓇')")
AssureEqual(nextx, 9, "Next index retrieving codepoint codepoint 8 (low surrogate of '𝓇')")

test_append.LuaString = "𝒸𝒽𝒶 𝓇𝓂"
test_append:InsertString(finale.FCString("123"), 4)
AssureEqual(test_append.LuaString, "𝒸𝒽123𝒶 𝓇𝓂", "Inserting '123' at correct surrogate boundary")
test_append.LuaString = "𝒸𝒽𝒶 𝓇𝓂"
test_append:InsertString(finale.FCString("123"), 5)
AssureEqual(test_append.LuaString, "𝒸𝒽𝒶123 𝓇𝓂", "Inserting '123' at wrong surrogate boundary")
test_append.LuaString = "𝒸𝒽𝒶 𝓇𝓂"
test_append:InsertString(finale.FCString("123"), 125)
AssureEqual(test_append.LuaString, "𝒸𝒽𝒶 𝓇𝓂123", "Inserting '123' at end")

test_append:Clear()
test_append:AppendCharacter(0xdc01) -- invalid low surrogate
test_append:AppendCharacter(0x20) -- space
test_append:AppendCharacter(0xd801) -- invalid high surrogate
test_append:AppendLuaString("1")
test_append:AppendCharacter(0xdc01) -- invalid low surrogate
test_append:AppendLuaString("23")
success, msg = pcall(function() codepoint, nextx = test_append:GetCodePointAt(0) end)
AssureFalse(success, "Error fail retrieving codepoint 0 in malformed UTF16 (stranded low surrogate)")
codepoint, nextx = test_append:GetCodePointAt(1)
AssureEqual(codepoint, utf8.codepoint(" "), "Retrieving codepoint 1 in malformed UTF16 (' ')")
AssureEqual(nextx, 2, "Next index retrieving codepoint 1 in malformed UTF16 (' ')")
success, msg = pcall(function() codepoint, nextx = test_append:GetCodePointAt(2) end)
AssureFalse(success, "Error fail retrieving codepoint 2 in malformed UTF16 (stranded high surrogate)")
codepoint, nextx = test_append:GetCodePointAt(3)
AssureEqual(codepoint, utf8.codepoint("1"), "Retrieving codepoint 4 in malformed UTF16 ('1')")
AssureEqual(nextx, 4, "Next index retrieving codepoint 4 in malformed UTF16 ('1')")
success, msg = pcall(function() codepoint, nextx = test_append:GetCodePointAt(4) end)
AssureFalse(success, "Error fail retrieving codepoint 5 in malformed UTF16 (stranded low surrogate)")



