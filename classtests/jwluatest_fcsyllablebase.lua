function FCSyllableBase_PropertyTests(obj)
   NumberPropertyTest(obj, "FCVerseSyllable", "FloatingHorizontalOffset", {-144, 0, 144})
   NumberPropertyTest(obj, "FCVerseSyllable", "HorizontalOffset", {-144, 0, 144})
   BoolPropertyTest(obj, "FCVerseSyllable", "IncludeLyricNumber")
   NumberPropertyTest(obj, "FCVerseSyllable", "RawTextNumber", {0, 2 , 5})
   NumberPropertyTest(obj, "FCVerseSyllable", "SyllableNumber", {0, 2, 45})
   NumberPropertyTest(obj, "FCVerseSyllable", "VerticalOffset", {-144, 0, 144})
   NumberPropertyTest(obj, "FCVerseSyllable", "WordExtensionID", {0, 1, 12})
end

-- Call:
local entry = LoadMeasureEntry(30, 3, 312)
if AssureNonNil(entry, "FCSyllableBase_PropertyTests load entry") then
    local obj = finale.FCVerseSyllable()
    obj:SetNoteEntry(entry)
    if AssureTrue(obj:LoadFirst(), "FCSyllableBase_PropertyTests: LoadFirst") then
        FCSyllableBase_PropertyTests(obj)
    end
end
