function FCSyllableEntryMod_ValueTests_Entry30_3_312(obj)
   NumberValuePropertyTest(obj, "FCSyllableEntryMod", "Alignment", 3)
   NumberValuePropertyTest(obj, "FCSyllableEntryMod", "Justification", 0)
end

-- Call:
local entry = LoadMeasureEntry(30, 3, 312)
if AssureNonNil(entry, "FCSyllableEntryMod_ValueTests load entry") then
    local obj = finale.FCSyllableEntryMod()
    obj:SetNoteEntry(entry)
    if AssureTrue(obj:LoadFirst(), "FCSyllableEntryMod_ValueTests: LoadFirst") then
        FCSyllableEntryMod_ValueTests_Entry30_3_312(obj)
    end
end
