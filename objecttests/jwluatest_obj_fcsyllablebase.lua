function FCSyllableBase_ValueTests_Entry30_3_312(obj)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "FloatingHorizontalOffset", 0)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "HorizontalOffset", 16)
   BoolValuePropertyTest(obj, "FCVerseSyllable", "IncludeLyricNumber", false)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "RawTextNumber", 1)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "SyllableNumber", 1)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "VerticalOffset", 0)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "WordExtensionID", 0)
   local str = finale.FCString()
   AssureEqual(obj:CalcStringPos(), 0, "FCVerseSyllable.CalcStringPos == 0")
   AssureEqual(obj:CalcNextStringPos(), 48, "FCVerseSyllable.CalcNextStringPos == 48")
   if AssureTrue(obj:GetText(str), "FCVerseSyllable.GetText") then
       AssureEqual(str.LuaString, "test", "FCVerseSyllable.GetText == \"test\"")       
   end
   if AssureTrue(obj:GetRawText(str), "FCVerseSyllable.GetRawText") then
       AssureEqual(str.LuaString, "^font(Times New Roman,8192)^size(12)^nfx(0)test ", "FCVerseSyllable.GetRawText == \"test\"")       
   end
   local font = obj:CreateFontInfo()
   if AssureNonNil(font, "FCVerseSyllable CreateFontInfo not nil.") then
       AssureEqual(font.Name, "Times New Roman", "FCVerseSyllable font is Times New Roman")
       AssureEqual(font.Size, 12, "FCVerseSyllable font size is 12")
       AssureFalse(font.Bold, "FCVerseSyllable font is not bold")
   end
end

-- Call:
local entry = LoadMeasureEntry(30, 3, 312)
if AssureNonNil(entry, "FCSyllableBase_PropertyTests load entry 312") then
    local obj = finale.FCVerseSyllable()
    obj:SetNoteEntry(entry)
    if AssureTrue(obj:LoadFirst(), "FCSyllableBase_PropertyTests: LoadFirst") then
        FCSyllableBase_ValueTests_Entry30_3_312(obj)
    end
end

function FCSyllableBase_ValueTests_Entry31_2_318(obj)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "FloatingHorizontalOffset", 0)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "HorizontalOffset", 0)
   BoolValuePropertyTest(obj, "FCVerseSyllable", "IncludeLyricNumber", false)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "RawTextNumber", 1)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "SyllableNumber", 4)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "VerticalOffset", 0)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "WordExtensionID", 0)
   local str = finale.FCString()
   AssureEqual(obj:CalcStringPos(), 62, "FCVerseSyllable.CalcStringPos == 62")
   AssureEqual(obj:CalcNextStringPos(), 65, "FCVerseSyllable.CalcNextStringPos == 65")
   if AssureTrue(obj:GetText(str), "FCVerseSyllable.GetText") then
       AssureEqual(str.LuaString, "こん", "FCVerseSyllable.GetText == \"こん\"")       
   end
   if AssureTrue(obj:GetRawText(str), "FCVerseSyllable.GetRawText") then
       AssureEqual(str.LuaString, "こん ", "FCVerseSyllable.GetRawText == \"こん\"")       
   end
   local font = obj:CreateFontInfo()
   if AssureNonNil(font, "FCVerseSyllable CreateFontInfo not nil.") then
       AssureEqual(font.Name, "Times New Roman", "FCVerseSyllable font is Times New Roman")
       AssureEqual(font.Size, 12, "FCVerseSyllable font size is 12")
       AssureTrue(font.Bold, "FCVerseSyllable font is bold")
   end
end

-- Call:
local entry = LoadMeasureEntry(31, 2, 318)
if AssureNonNil(entry, "FCSyllableBase_PropertyTests load entry 318") then
    local obj = finale.FCVerseSyllable()
    obj:SetNoteEntry(entry)
    if AssureTrue(obj:LoadFirst(), "FCSyllableBase_PropertyTests: LoadFirst") then
        FCSyllableBase_ValueTests_Entry31_2_318(obj)
    end
end

function FCSyllableBase_ValueTests_Entry31_2_319(obj)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "FloatingHorizontalOffset", 0)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "HorizontalOffset", 0)
   BoolValuePropertyTest(obj, "FCVerseSyllable", "IncludeLyricNumber", false)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "RawTextNumber", 1)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "SyllableNumber", 5)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "VerticalOffset", 0)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "WordExtensionID", 0)
   local str = finale.FCString()
   AssureEqual(obj:CalcStringPos(), 65, "FCVerseSyllable.CalcStringPos == 65")
   AssureEqual(obj:CalcNextStringPos(), 67, "FCVerseSyllable.CalcNextStringPos == 67")
   if AssureTrue(obj:GetText(str), "FCVerseSyllable.GetText") then
       AssureEqual(str.LuaString, "に", "FCVerseSyllable.GetText == \"に\"")       
   end
   if AssureTrue(obj:GetRawText(str), "FCVerseSyllable.GetRawText") then
       AssureEqual(str.LuaString, "に-", "FCVerseSyllable.GetRawText == \"に\"")       
   end
   local font = obj:CreateFontInfo()
   if AssureNonNil(font, "FCVerseSyllable CreateFontInfo not nil.") then
       AssureEqual(font.Name, "Times New Roman", "FCVerseSyllable font is Times New Roman")
       AssureEqual(font.Size, 12, "FCVerseSyllable font size is 12")
       AssureTrue(font.Bold, "FCVerseSyllable font is bold")
   end
end


-- Call:
local entry = LoadMeasureEntry(31, 2, 319)
if AssureNonNil(entry, "FCSyllableBase_PropertyTests load entry 319") then
    local obj = finale.FCVerseSyllable()
    obj:SetNoteEntry(entry)
    if AssureTrue(obj:LoadFirst(), "FCSyllableBase_PropertyTests: LoadFirst") then
        FCSyllableBase_ValueTests_Entry31_2_319(obj)
    end
end
