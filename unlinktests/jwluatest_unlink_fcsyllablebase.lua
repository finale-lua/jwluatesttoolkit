function FCSyllableBase_Test_Unlinkable(measure, staff, entrynumber)
    local entry = LoadMeasureEntry(measure, staff, entrynumber)
    if AssureNonNil(entry, "LoadMeasureEntry("..measure..", "..staff..", "..entrynumber..")") then
        local obj = finale.FCVerseSyllable()
        obj:SetNoteEntry(entry)
        -- Commented properties are not unlinkable
        UnlinkableNumberPropertyTest(obj, "FCVerseSyllable", "FloatingHorizontalOffset", "LoadFirst", nil, -24, staff_to_part[staff]) 
        UnlinkableNumberPropertyTest(obj, "FCVerseSyllable", "HorizontalOffset", "LoadFirst", nil, 24, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(obj, "FCVerseSyllable", "IncludeLyricNumber", "LoadFirst", nil, 24, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(obj, "FCVerseSyllable", "RawTextNumber", "LoadFirst", nil, 1, staff_to_part[staff])
        --UnlinkableNumberPropertyTest(obj, "FCVerseSyllable", "SyllableNumber", "LoadFirst", nil, 1, staff_to_part[staff]) 
        UnlinkableNumberPropertyTest(obj, "FCVerseSyllable", "VerticalOffset", "LoadFirst", nil, -24, staff_to_part[staff])
        --UnlinkableNumberPropertyTest(obj, "FCVerseSyllable", "WordExtensionID", "LoadFirst", nil, 1, staff_to_part[staff])
    end
end


-- Call:
FCSyllableBase_Test_Unlinkable(30, 3, 312)