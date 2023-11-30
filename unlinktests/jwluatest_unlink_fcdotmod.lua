
function FCDotMod_Test_Unlinkable(measure, staff, entrynumber, partnumber)
    local entry = LoadMeasureEntry(measure, staff, entrynumber)
    if AssureNonNil(entry, "LoadMeasureEntry("..measure..", "..staff..", "..entrynumber..")") then
        for note in each(entry) do
            local dot_mod = finale.FCDotMod()
            dot_mod:SetNoteEntry(entry)
            -- this code creates the dot mod if it doesn't exist.
            -- it works around what appears to be a problem stating with Finale 27.3 that if you create them
            -- after switching to part view, unlinking InterDotSpacing has a problem. None of the others have this problem.
            if interdot_spacing_unlink_check then
                local create_it = finale.FCDotMod()
                create_it:SetNoteEntry(entry)
                if not create_it:LoadAt(note) then
                    AssureTrue(create_it:SaveAt(note), "Create FCDotMod ahead of tests.")
                end
            end
            UnlinkableNumberPropertyTest(dot_mod, "FCDotMod", "HorizontalPos", "LoadAt", note, 12, partnumber, skip_finale_version)
            UnlinkableNumberPropertyTest(dot_mod, "FCDotMod", "InterDotSpacing", "LoadAt", note, 2, partnumber, skip_finale_version)
            UnlinkableNumberPropertyTest(dot_mod, "FCDotMod", "VerticalPos", "LoadAt", note, -12, partnumber, skip_finale_version)
        end
    end
end

-- Call:
FCDotMod_Test_Unlinkable(2, 1, 271, 3)
