if not AssureNonNil(_G.utf8, "The utf8 namepace is not nil") then return end
if not AssureNonNil(_G.utf8.len, "The utf8.len function is not nil.") then return end

local unpack = table.unpack or unpack

local function TestUtf8String(s, expected_ps, expected_cs, lax)    
    if not AssureEqual(#expected_cs, #expected_ps, "TestUtf8String input tables length: "..tostring(#expected_cs).." == "..tostring(#expected_ps)) then
        return
    end
    
    local str_len = utf8.len(s, 1, #s, lax)
    AssureEqual(str_len, #expected_ps, "TestUtf8String length: "..tostring(str_len).." == "..tostring(#expected_ps))
    
    local t = { utf8.codepoint(s, 1, #s, lax) }
    AssureEqual(str_len, #t, "TestUtf8String codepoint length: "..tostring(str_len).." == "..tostring(#t))
    local unpack_s = utf8.char(unpack(t))
    AssureEqual(s, unpack_s, "TestUtf8String codepoint unpacked: "..s.." == "..unpack_s)
    
    local ps, cs = {}, {}
    for p,c in utf8.codes(s, lax) do
        ps[#ps+1], cs[#cs+1] = p, c
    end
    for x = 1, #ps do
        AssureEqual(ps[x], expected_ps[x], "TestUtf8String position: "..tostring(ps[x]).." == "..expected_ps[x]) 
        AssureEqual(cs[x], expected_cs[x], "TestUtf8String codes: "..tostring(cs[x]).." == "..expected_cs[x]) 
        AssureEqual(t[x], expected_cs[x], "TestUtf8String codepoint result: "..tostring(t[x]).." == "..expected_cs[x]) 
    end
end

TestUtf8String("äöüßÄÖÜ", {1, 3, 5, 7, 9, 11, 13}, {228, 246, 252, 223, 196, 214, 220})
TestUtf8String("abcdefg", {1, 2, 3, 4, 5, 6, 7}, {97, 98, 99, 100, 101, 102, 103})
TestUtf8String("どう言ったかなあ", {1, 4, 7, 10, 13, 16, 19, 22}, {12393, 12358, 35328, 12387, 12383, 12363, 12394, 12354})
TestUtf8String(utf8.char(0x2CF50, 0x2CF51, 0x2CF52, 0x2CF53, 0x2CF54, 0x2CF55, 0x2CF56),
                            {1, 5, 9, 13, 17, 21, 25}, {184144, 184145, 184146, 184147, 184148, 184149, 184150})
TestUtf8String("aü言c"..utf8.char(0x2CF50).."d∫", {1, 2, 4, 7, 8, 12, 13}, {97, 252, 35328, 99, 184144, 100, 8747})
TestUtf8String(utf8.char(0x210def5).."aü言"..utf8.char(0x7fffffff), {1, 6, 7, 9, 12}, {34660085, 97, 252, 35328, 2147483647}, true)
AssureFalse(pcall(utf8.char, 0x80000000))

local s = "äöüßÄÖÜ"
AssureEqual(utf8.offset(s, 1, 1), 1, "TestUtf8Offset utf8.offset(s, 1, 1)")
AssureEqual(utf8.offset(s, 2, 1), 3, "TestUtf8Offset utf8.offset(s, 2, 1)")
AssureEqual(utf8.offset(s, 3, 1), 5, "TestUtf8Offset utf8.offset(s, 3, 1)")
AssureFalse(pcall(utf8.offset, s, 3, 2))
AssureEqual(utf8.offset(s, 3, 3), 7, "TestUtf8Offset utf8.offset(s, 3, 3)")
AssureEqual(utf8.offset(s, -1, 7), 5, "TestUtf8Offset utf8.offset(s, -1, 7)")
AssureEqual(utf8.offset(s, -2, 7), 3, "TestUtf8Offset utf8.offset(s, -2, 7)")
AssureEqual(utf8.offset(s, -3, 7), 1, "TestUtf8Offset utf8.offset(s, -3, 7)")
AssureEqual(utf8.offset(s, -1), 13, "TestUtf8Offset utf8.offset(s, -1)")
