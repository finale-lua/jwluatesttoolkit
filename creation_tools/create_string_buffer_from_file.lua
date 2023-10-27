function plugindef()
   -- This function and the 'finaleplugin' namespace
   -- are both reserved for the plug-in definition.
   finaleplugin.RequireDocument = false
   finaleplugin.NoStore = true
   finaleplugin.Author = "Robert Patterson"
   finaleplugin.CategoryTags = "Debug, Development, Diagnose, UI"
   return "Create String Buffer From File", "Create String Buffer From File", "Creates a string buffer from a selected file."
end

local file_dialog = finale.FCFileOpenDialog(finenv.UI())
if not file_dialog:Execute() then
    return
end

local file_name = finale.FCString()
file_dialog:GetFileName(file_name)
local file = io.open(file_name.LuaString, "rb")
if not file then
    finenv.UI():AlertError("Cannot open file "..file_name.LuaString..".", "")
    return
end

local result_string = 'local buffer = "'
local next_byte = file:read(1)
local counter = 0
local line_length = 40
while next_byte do
    result_string = result_string .. string.format("\\%d", next_byte:byte())
    counter = counter + 1
    if counter >= line_length then
        result_string = result_string .. '"\nbuffer = buffer.."'
        counter = 0
    end
    next_byte = file:read(1)
end

result_string = result_string .. '"\n'

if finenv.UI():TextToClipboard(result_string) then
    finenv.UI():AlertInfo("Code has been copied to the clipboard.", "Test Created")
end












