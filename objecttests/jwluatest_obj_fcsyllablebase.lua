function FCSyllableBase_ValueTests_Entry30_3_312(obj)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "FloatingHorizontalOffset", 0)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "HorizontalOffset", 16)
   BoolValuePropertyTest(obj, "FCVerseSyllable", "IncludeLyricNumber", false)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "RawTextNumber", 1)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "SyllableNumber", 1)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "VerticalOffset", 0)
   NumberValuePropertyTest(obj, "FCVerseSyllable", "WordExtensionID", 0)
end


-- Call:
local entry = LoadMeasureEntry(30, 3, 312)
if AssureNonNil(entry, "FCSyllableBase_PropertyTests load entry") then
    local obj = finale.FCVerseSyllable()
    obj:SetNoteEntry(entry)
    if AssureTrue(obj:LoadFirst(), "FCSyllableBase_PropertyTests: LoadFirst") then
        FCSyllableBase_ValueTests_Entry30_3_312(obj)
    end
end
