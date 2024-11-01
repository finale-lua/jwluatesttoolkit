require "tools/jwluatesttools"

local str = finale.FCString()

-- These functions were not marked Lua-supported in the Framework 0.54 doc pages,
-- but they appear to be hooked up in JW Lua 0.54.

FunctionTest(str, "FCString", "InsertString") 
FunctionTest(str, "FCString", "ReplaceCategoryFonts")
FunctionTest(str, "FCString", "EndsWith")
FunctionTest(str, "FCString", "TruncateAt")
FunctionTest(str, "FCString", "ExtractFileExtension")
FunctionTest(str, "FCString", "SplitToPathAndFile")
FunctionTest(str, "FCString", "SplitAt")

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
codepoint, nextx = test_append:GetCodePointAt(-1)
AssureEqual(codepoint, utf8.codepoint("𝓂"), "Retrieving codepoint -1 (low surrogate of '𝓂')")
AssureEqual(nextx, 11, "Next index retrieving codepoint codepoint -1 (low surrogate of '𝓂')")

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
success, msg = pcall(function() test_append:InsertString(finale.FCString("test"), 2) end)
AssureFalse(success, "Error fail FCString:InsertString(finale.FCString('test'), 2) with malformed UTF16")

test_delete = finale.FCString()
test_delete.LuaString = "𝒸𝒽𝒶 𝓇𝓂1"
AssureFalse(test_delete:DeleteCodePointAt(test_delete.Length), "FCString:DeleteCodePointAt too big (" .. test_delete.Length .. ")")
AssureFalse(test_delete:DeleteCodePointAt(-2), "FCString:DeleteCodePointAt too small (-2)")
AssureTrue(test_delete:DeleteCodePointAt(11), "FCString:DeleteCodePointAt 11")
AssureEqual(test_delete.LuaString, "𝒸𝒽𝒶 𝓇𝓂", "value of FCString:DeleteCodePointAt 11")
AssureTrue(test_delete:DeleteCodePointAt(-1), "FCString:DeleteCodePointAt -1 (==10)")
AssureEqual(test_delete.LuaString, "𝒸𝒽𝒶 𝓇", "value of FCString:DeleteCodePointAt -1 (==10)")
AssureTrue(test_delete:DeleteCodePointAt(2), "FCString:DeleteCodePointAt 2")
AssureEqual(test_delete.LuaString, "𝒸𝒶 𝓇", "value of FCString:DeleteCodePointAt 2")
AssureTrue(test_delete:DeleteCodePointsAt(1, 2), "FCString:DeleteCodePointsAt 1, 2")
AssureEqual(test_delete.LuaString, " 𝓇", "FCString:DeleteCodePointsAt 1, 2")

test_delete:Clear()
test_delete:AppendCharacter(0xdc01) -- invalid low surrogate
test_delete:AppendCharacter(0x20) -- space
test_delete:AppendCharacter(0xd801) -- invalid high surrogate
test_delete:AppendLuaString("1")
test_delete:AppendCharacter(0xdc01) -- invalid low surrogate
test_delete:AppendLuaString("23")

-- should fail because 0 is unpaired low surrogate
AssureFalse(test_delete:DeleteCodePointAt(0), "FCString:DeleteCodePointAt 0")
-- should fail because 0 is unpaired low surrogate
AssureFalse(test_delete:DeleteCodePointsAt(0, 3),  "FCString:DeleteCodePointsAt 0, 3")
-- should succeed even though it contains unpaired low surrogate because start is "1" and end is "2"
AssureTrue(test_delete:DeleteCodePointsAt(3, 3), "FCString:DeleteCodePointsAt 3, 3")
-- should succeed even though then next value is an unpaired high surrogate because it is " "
AssureTrue(test_delete:DeleteCodePointsAt(1, 1), "FCString:DeleteCodePointsAt 1, 1") -- deleteing space 

local test_replace = finale.FCString("12223")
test_replace:Replace("2", "/")
AssureEqual(test_replace.LuaString, "1///3", "FCString::Replace ('2', '/')")

test_replace.LuaString = "𝒸𝒽𝒽𝒶 𝒽𝓇𝓂"
test_replace:Replace("𝒽", "/")
AssureEqual(test_replace.LuaString, "𝒸//𝒶 /𝓇𝓂", "FCString::Replace ('𝒽', '/')")

local test_format_char = finale.FCString()
test_format_char:FormatCharacterNumber(247)
AssureEqual(test_format_char.LuaString, "247", "FCString:FormatCharacterNumber(247)")
test_format_char:FormatCharacterNumber(0xef3d)
AssureEqual(test_format_char.LuaString, "U+EF3D", "FCString:FormatCharacterNumber(0xef3d)")
test_format_char:FormatCharacterNumber(0x1efc5)
AssureEqual(test_format_char.LuaString, "U+1EFC5", "FCString:FormatCharacterNumber(0x1efc5)")
test_format_char:FormatCharacterNumber(0xffffffff)
AssureEqual(test_format_char.LuaString, "U+FFFFFFFF", "FCString:FormatCharacterNumber(0xffffffff)")
success, msg = pcall(function() test_format_char:FormatCharacterNumber(-1) end)
AssureFalse(success, "FCString:FormatCharacterNumber(-1)")

local test_ischar = finale.FCString("12𝒽3𝓇𝓂")
AssureTrue(test_ischar:IsCharacter(1, utf8.codepoint("2")), "FCString:IsCharacter(1, '2')")
AssureFalse(test_ischar:IsCharacter(3, utf8.codepoint("2")), "FCString:IsCharacter(3, '2')")
AssureFalse(test_ischar:IsCharacter(0, utf8.codepoint("𝒽")), "FCString:IsCharacter(0, '𝒽')")
AssureTrue(test_ischar:IsCharacter(2, utf8.codepoint("𝒽")), "FCString:IsCharacter(2, '𝒽')")
AssureTrue(test_ischar:IsCharacter(3, utf8.codepoint("𝒽")), "FCString:IsCharacter(3, '𝒽')")

local test_getinteger = finale.FCString("1𝒽123")
AssureEqual(test_getinteger:GetInteger(), 1, "FCString:GetInteger()")
AssureEqual(test_getinteger:GetInteger(1), 0, "FCString:GetInteger(1)")
AssureEqual(test_getinteger:GetInteger(2), 0, "FCString:GetInteger(2)")
AssureEqual(test_getinteger:GetInteger(3), 123, "FCString:GetInteger(3)")
AssureEqual(test_getinteger:GetInteger(4), 23, "FCString:GetInteger(4)")
AssureEqual(test_getinteger:GetInteger(5), 3, "FCString:GetInteger(5)")
AssureEqual(test_getinteger:GetInteger(6), 0, "FCString:GetInteger(6)")
AssureEqual(test_getinteger:GetInteger(-2), 0, "FCString:GetInteger(-2)")

local test_substring = finale.FCString("0𝒸𝒽123𝒶 𝓇𝓂")
local substr = finale.FCString()
AssureFalse(test_substring:MakeSubString(-1, 2, substr), "FCString:MakeSubString -2, 2")
AssureFalse(test_substring:MakeSubString(15, 1, substr), "FCString:MakeSubString -2, 2")
AssureTrue(test_substring:MakeSubString(0, 1, substr), "FCString:MakeSubString 0, 1")
AssureEqual(substr.LuaString, "0",  "is equal: FCString:MakeSubString 0, 1")
AssureTrue(test_substring:MakeSubString(0, 2, substr), "FCString:MakeSubString 0, 2")
AssureEqual(substr.LuaString, "0𝒸",  "is equal: FCString:MakeSubString 0, 2")
AssureTrue(test_substring:MakeSubString(2, 1, substr), "FCString:MakeSubString 1, 2")
AssureEqual(substr.LuaString, "𝒸",  "is equal: FCString:MakeSubString 1, 2")
AssureTrue(test_substring:MakeSubString(2, 2, substr), "FCString:MakeSubString 2, 2")
AssureEqual(substr.LuaString, "𝒸𝒽",  "is equal: FCString:MakeSubString 2, 2")
AssureTrue(test_substring:MakeSubString(8, 5, substr), "FCString:MakeSubString 8, 5")
AssureEqual(substr.LuaString, "𝒶 𝓇",  "is equal: FCString:MakeSubString 8, 5")
AssureTrue(test_substring:MakeSubString(14, 5, substr), "FCString:MakeSubString 14, 5")
AssureEqual(substr.LuaString, "𝓂",  "is equal: FCString:MakeSubString 14, 5")

test_substring:Clear()
test_substring:AppendCharacter(0xdc01) -- invalid low surrogate
test_substring:AppendCharacter(0x20) -- space
test_substring:AppendCharacter(0xd801) -- invalid high surrogate
test_substring:AppendLuaString("1")
test_substring:AppendCharacter(0xdc01) -- invalid low surrogate
test_substring:AppendLuaString("23")
AssureFalse(test_substring:MakeSubString(0, 1, substr), "malformed FCString:MakeSubString 0, 1")
AssureFalse(test_substring:MakeSubString(1, 2, substr), "malformed FCString:MakeSubString 1, 2")
AssureTrue(test_substring:MakeSubString(3, 1, substr), "malformed FCString:MakeSubString 3, 1")
AssureEqual(substr.LuaString, "1", "malformed FCString:MakeSubString 3, 1")
AssureFalse(test_substring:MakeSubString(4, 1, substr), "malformed FCString:MakeSubString 4, 1")

-- extension tests

local function TestExtension(str, expected_value)
    local extension_test = finale.FCString(str)
    extension_test:ExtractFileExtension()
    AssureEqualStrings(extension_test.LuaString, expected_value, "FCString::ExtractFileExtension from " .. str)
end

TestExtension("path/to/file.xml", "xml")
TestExtension("path/to/file.musicxml", "musicxml")
TestExtension("path/to/a.dsflksdjflskdjf132", "dsflksdjflskdjf132")
TestExtension("path/to/file.", "")
TestExtension("path/to/.file", "file")

-- split tests

local function TestSplitToPathAndFile(str, expected_path, expected_file)
    local split_test = finale.FCString(str)
    local path = finale.FCString()
    local file = finale.FCString()
    AssureTrue(split_test:SplitToPathAndFile(path, file), "FCString::SplitToPathAndFile(path, file)")
    AssureEqualStrings(path.LuaString, expected_path, "FCString::SplitToPathAndFile(path, file)")
    AssureEqualStrings(file.LuaString, expected_file, "FCString::SplitToPathAndFile(path, file)")    
    AssureTrue(split_test:SplitToPathAndFile(path, nil), "FCString::SplitToPathAndFile(path, nil)")
    AssureEqualStrings(path.LuaString, expected_path, "FCString::SplitToPathAndFile(path, nil)")
    AssureTrue(split_test:SplitToPathAndFile(nil, file), "FCString::SplitToPathAndFile(nil, file)")
    AssureEqualStrings(file.LuaString, expected_file, "FCString::SplitToPathAndFile(nil, file)")    
end

TestSplitToPathAndFile("path/name/filename", "path/name/", "filename")
TestSplitToPathAndFile("path/name/", "path/name/", "")
TestSplitToPathAndFile("filename", "", "filename")

local function TestSplitAt(str)
    local split_test = finale.FCString(str)
    local left = finale.FCString()
    local right = finale.FCString()
    AssureFalse(split_test:SplitAt(-2, left, right, false), "FCString::SplitAt(-2)")
    AssureFalse(split_test:SplitAt(split_test.Length, left, right, false), "FCString::SplitAt(split_test.Length)")
    for i = -1, split_test.Length - 1 do
        AssureTrue(split_test:SplitAt(i, left, right, true), "FCString::SplitAt(" .. i .. ", true)")
        print(i, true, split_test, left, right)
        AssureEqualStrings(left.LuaString, str:sub(1, math.max(0, i + 1)), "FCString::SplitAt(" .. i .. ", true)")
        AssureEqualStrings(right.LuaString, str:sub(math.max(0, i + 1) + 1), "FCString::SplitAt(" .. i .. ", true)")
        print(i, false, split_test, left, right)
        AssureTrue(split_test:SplitAt(i, left, right, false), "FCString::SplitAt(" .. i .. ", false)")
        AssureEqualStrings(left.LuaString, str:sub(1, math.max(0, i + 1) - 1), "FCString::SplitAt(" .. i .. ", false)")
        AssureEqualStrings(right.LuaString, str:sub(math.max(0, i + 1) + 1), "FCString::SplitAt(" .. i .. ", false)")
    end
end

TestSplitAt("a-c")

-- truncation test

local trucate_string = finale.FCString()
trucate_string.LuaString = "test"
AssureFalse(trucate_string:TruncateAt(trucate_string.Length), "FCString::TruncateAt(trucate_string.Length)")
AssureFalse(trucate_string:TruncateAt(-1), "FCString::TruncateAt(-1)")
AssureTrue(trucate_string:TruncateAt(1), "FCString::TruncateAt(1)")
AssureEqualStrings(trucate_string.LuaString, "t", "FCString::TruncateAt")