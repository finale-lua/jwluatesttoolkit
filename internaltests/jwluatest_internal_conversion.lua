-- These tests check discrepancies in math conversions between Lua 5.2 and Lua 5.4

-- Lua 5.4 by default throws error if assigning non-integer number to integer
-- Lua 5.2 truncates fractions.

function InternalConversion_TestNumberToInt(num)
    local number = finale.FCNumber(0)
    local success, message = pcall(function() number.Int = num end)
    AssureTrue(success, "Assign 5.1 to Int: "..tostring(message))
    AssureEqual(number.Int, math.floor(num), "InternalConversion_TestNumberToInt from int")
    success, message = pcall(function() number.Float = num end)
    AssureTrue(success, "Assign 5.1 to Float: "..tostring(message))
    AssureEqual(number.Int, math.floor(num), "InternalConversion_TestNumberToInt from float")
end

InternalConversion_TestNumberToInt(1.0)
InternalConversion_TestNumberToInt(5.1)
InternalConversion_TestNumberToInt(10.2)
InternalConversion_TestNumberToInt(3.3)
InternalConversion_TestNumberToInt(147.4)
InternalConversion_TestNumberToInt(12.5)
InternalConversion_TestNumberToInt(7.6)
InternalConversion_TestNumberToInt(123.7)
InternalConversion_TestNumberToInt(11.8)
InternalConversion_TestNumberToInt(16.9)
InternalConversion_TestNumberToInt(4.9999999999)
