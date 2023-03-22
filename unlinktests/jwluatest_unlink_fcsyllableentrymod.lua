function FCSyllableEntryMod_Test_Unlinkable(measure, staff, entrynumber)
    local entry = LoadMeasureEntry(measure, staff, entrynumber)
    if AssureNonNil(entry, "LoadMeasureEntry("..measure..", "..staff..", "..entrynumber..")") then
        local obj = finale.FCSyllableEntryMod()
        obj:SetNoteEntry(entry)
        -- Commented properties are not unlinkable
        --UnlinkableNumberPropertyTest(obj, "FCSyllableEntryMod", "Alignment", "LoadFirst", nil, -1, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(obj, "FCSyllableEntryMod", "Justification", "LoadFirst", nil, 1, staff_to_part[staff]) 
    end
end


-- Call:
FCSyllableEntryMod_Test_Unlinkable(30, 3, 312)