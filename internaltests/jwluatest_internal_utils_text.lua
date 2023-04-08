-- If this fails, check that finaleplugin.LoadLuaOSUtils is true in the top-level plugindef function your are invoking
local osutils = DoRequire("luaosutils")
if not osutils then return end
local text = osutils.text
if not AssureNonNil(text, "Luaosutils "..osutils._VERSION.." is not the right version.") then
    return
end

local utf8_codepage = 65001
local shiftjs_codepage = 932
local windows_1252 = 1252
local msdos_latin1 = 850

--[[
function parseString(inputString)
    local outputString = ""
    for i = 1, #inputString do
        local c = inputString:sub(i, i)
        if string.byte(c) < 128 then
            outputString = outputString .. c
        else
            outputString = outputString .. string.format("\\x%02X", string.byte(c))
        end
    end
    return outputString
end
]]

-- Change this as needed to match your Windows setting. This could potentially be changed to use locale values from the
-- PDK Framework to make a better hardcoded prediction.
local win_default_codepage = windows_1252

AssureEqual(text.get_utf8_codepage(), utf8_codepage, "text.get_utf8_codepage() == 65001")

AssureEqual(text.get_default_codepage(), WinMac(win_default_codepage, utf8_codepage),
        "text.get_utf8_codepage() == "..tostring(WinMac(win_default_codepage, utf8_codepage)))

local konnichiwa_utf8 = "今日は"
local konnichiwa_shiftjs = "\141\161\147\250\130\205"

AssureEqual(text.convert_encoding(konnichiwa_utf8, text.get_utf8_codepage(), shiftjs_codepage), konnichiwa_shiftjs, "text.encode Japanese utf8 to shiftjs equal.")
AssureEqual(text.convert_encoding(konnichiwa_shiftjs, shiftjs_codepage), konnichiwa_utf8, "text.encode Japanese shiftjs to utf8 equal.")

local spchars_utf8 = "ƒüåé-fuae"
local spchars_1252 = "\x83\xFC\xE5\xE9-fuae"
local spchars_lat1 = "\x9F\x81\x86\x82-fuae"

AssureEqual(text.convert_encoding(spchars_utf8, text.get_utf8_codepage(), windows_1252), spchars_1252, "text.encode spchars utf8 to 1252 equal.")
AssureEqual(text.convert_encoding(spchars_1252, windows_1252, text.get_utf8_codepage()), spchars_utf8, "text.encode spchars 1252 to utf8 equal.")

AssureEqual(text.convert_encoding(spchars_utf8, text.get_utf8_codepage(), msdos_latin1), spchars_lat1, "text.encode spchars utf8 to 850 equal.")
AssureEqual(text.convert_encoding(spchars_lat1, msdos_latin1, text.get_utf8_codepage()), spchars_utf8, "text.encode spchars 850 to utf8 equal.")
