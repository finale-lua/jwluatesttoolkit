-- These tests verify various math edge cases to insure compatibility between Lua versions

local success, result -- for using pcall

success, result = pcall(function() return finale.FCNumber(1/0) end)
if AssureTrue(success, "Assigning 1/0 to FCNumber: "..tostring(result)) then
    local num = result
    local expected = num.Int == 0x7fffffff or num.Int == -2147483648
    AssureTrue(expected, "Math num.Int == 0x7fffffff or num.Int == -2147483648.")
    AssureEqual(num.Float, 1/0, "Math num.Float == 1/0. (Float may be defined as 'float' instead of 'double' in the PDK Framework.)") -- Float returned "nil" before 0.67
    success, result = pcall(function() num.Int = 1/0 return num.Int end) -- this does not fail in Lua 5.2
    AssureFalse(success, "Math num.Int = 1/0 returned "..tostring(result).." but should have been a runtime error.")
end

AssureNonNil(string.find(tostring(0/0), "nan"), "Math 0/0 == nan")
AssureNonNil(string.find(tostring(1/0), "inf"), "Math 1/0 == inf")
AssureEqual(tostring(math.huge), tostring(1/0), "Math math.huge == inf")

local a=0/0
local b=0/0
local entered_loop = false
for i = a,b,1 do
    entered_loop = true
end

AssureTrue(entered_loop, "Math loop 'for i = 0/0, 0/0, 1 do' entered loop.")

if AssureNonNil(math.pow, "Math math.pow is not defined. (Check LUA_COMPAT_MATHLIB compilation flag.)") then
    AssureEqual(math.pow(27, 1/3), 3, "Math math.pow(27, 1/3) == 9)")
    AssureEqual(tostring(math.pow(-27, 1/3)), tostring(0/0), "Math math.pow(-27, 1/3) == 0/0")
end

success, result = pcall(function() return tonumber(12, 10) end) -- this does not fail in Lua 5.2
AssureFalse(success, "Math tonumber(12, 10) returned "..tostring(result))
AssureEqual(tonumber(126), 126, "Math tonumber(126) == 126")
AssureEqual(tonumber("126"), 126, "Math tonumber(\"126\") == 126")
AssureEqual(tonumber("134", 10), 134, "Math tonumber(\"134\", 10) == 134")
AssureEqual(tonumber("AbCd", 16), 0xabcd, "tonumber(\"AbCd\", 16) == 0xabcd")

