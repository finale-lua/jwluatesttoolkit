function FCNoteheadMod_Test_Unlinkable(measure, staff, entrynumber)
    local entry = LoadMeasureEntry(measure, staff, entrynumber)
    if AssureNonNil(entry, "LoadMeasureEntry("..measure..", "..staff..", "..entrynumber..")") then
        local noteheadmod = finale.FCNoteheadMod()
        noteheadmod:SetNoteEntry(entry)
        UnlinkableNumberPropertyTest(noteheadmod, "FCNoteheadMod", "EnharmonicFlip", "LoadFirst", nil, -24, staff_to_part[staff])
    end
end

FCNoteheadMod_Test_Unlinkable(6, 2, 127)
