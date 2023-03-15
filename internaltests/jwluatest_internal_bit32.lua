-- These tests check discrepancies in math conversions between Lua 5.2 and Lua 5.4

-- Import the bit32 library
-- (Finale gets it by default, so test that it already exists)
--local bit32 = require("bit32")

local NumberTableToHexString = function(t, delim)
    local tstr = {}
    for i, num in ipairs(t) do
        tstr[i] = string.format("0x%X", math.abs(num))
    end
    return table.concat(tstr, delim)
end

-- Test the bit32 library
local tests = {
    {name = "band", input = {0x5A, 0x3F}, expected_output = 0x1A},
    {name = "band", input = {}, expected_output = 0xffffffff},
    {name = "band", input = {0xffffffff}, expected_output = 0xffffffff},
    {name = "band", input = {0x0f, 0xf1}, expected_output = 0x01},
    {name = "band", input = {0xff, 0x0f, 0xf2}, expected_output = 0x02},
    {name = "band", input = {-1, -2}, expected_output = 0xFFFFFFFE},
    
    {name = "bor", input = {0x5A, 0x3F}, expected_output = 0x7F},
    {name = "bor", input = {}, expected_output = 0},
    {name = "bor", input = {0xffffffff}, expected_output = 0xffffffff},
    {name = "bor", input = {0x0f, 0xf0}, expected_output = 0xff},
    {name = "bor", input = {0xff, 0x0f, 0xf0}, expected_output = 0xff},
    {name = "bor", input = {-1, -12}, expected_output = 0xFFFFFFFF},
    
    {name = "bxor", input = {0x5A, 0x3F}, expected_output = 0x65},
    {name = "bxor", input = {}, expected_output = 0},
    {name = "bxor", input = {0xffffffff}, expected_output = 0xffffffff},
    {name = "bxor", input = {0x0f, 0xf0}, expected_output = 0xff},
    {name = "bxor", input = {-1, 1}, expected_output = 0xFFFFFFFE},
    
    {name = "btest", input = {0x5A, 0x3F}, expected_output = true},
    {name = "btest", input = {}, expected_output = true},
    {name = "btest", input = {0xffffffff}, expected_output = true},
    {name = "btest", input = {0x0f, 0xf0}, expected_output = false},
    {name = "btest", input = {0xff, 0x0f, 0xf2}, expected_output = true},
    {name = "btest", input = {0xff, 0x0f, 0xf2, 0x1}, expected_output = false},
    
    {name = "bnot", input = {0x5A}, expected_output = 0xFFFFFFA5},
    {name = "bnot", input = {-3}, expected_output = 2},
    
    {name = "lshift", input = {0x5A, 2}, expected_output = 0x168},
    {name = "lshift", input = {0xFFFFFFFF, 32}, expected_output = 0},
    {name = "lshift", input = {-13, 2}, expected_output = 0xFFFFFFCC},
    
    {name = "rshift", input = {0x5A, 2}, expected_output = 0x16},
    {name = "rshift", input = {0xFFFFFFFF, 32}, expected_output = 0},
    {name = "rshift", input = {-12, 1}, expected_output = 0x7FFFFFFA},
    
    {name = "arshift", input = {0x80000000, 1}, expected_output = 0xC0000000},
    {name = "arshift", input = {0x80000000, 37}, expected_output = 0xFFFFFFFF},
    {name = "arshift", input = {0x5A, 2}, expected_output = 0x16},
    {name = "arshift", input = {-12, 1}, expected_output = 0xFFFFFFFA},
    
    {name = "extract", input = {0x5A, 2, 4}, expected_output = 0x06},
    {name = "extract", input = {-13, 2, 4}, expected_output = 0x0C},
    
    {name = "replace", input = {0x5A, 0x0F, 2, 4}, expected_output = 0x7E},
    {name = "replace", input = {-12, 0x0F, 2, 4}, expected_output = 0xFFFFFFFC},
    
    {name = "lrotate", input = {0x5A, 4}, expected_output = 0x5A0},
    {name = "lrotate", input = {-3, 4}, expected_output = 0xFFFFFFDF},
    {name = "lrotate", input = {-123, -4}, expected_output = 0x5FFFFFF8},
    {name = "lrotate", input = {0x5A, 123}, expected_output = 0xD0000002},
    
    {name = "rrotate", input = {0x5A, 4}, expected_output = 0xA0000005},
    {name = "rrotate", input = {-247, 4}, expected_output = 0x9FFFFFF0},
    {name = "rrotate", input = {-2, -4}, expected_output = 0xFFFFFFEF},
    {name = "rrotate", input = {0x5A, 2123}, expected_output = 0xB400000},
}

for _, test in ipairs(tests) do
    local func_name = "bit32.".. test.name .. "(" .. table.concat(test.input, ", ") .. ")"
    local success, result = pcall(bit32[test.name], table.unpack(test.input))
    if AssureTrue(success, func_name.."): " .. tostring(result)) then
        if not AssureEqual(result, test.expected_output, func_name) then
            if type(result) == "number" then
                print("     expected: " .. string.format("0x%0X", test.expected_output) .. " got: " .. string.format("0x%0X", result))
            end
        end
    end
end
