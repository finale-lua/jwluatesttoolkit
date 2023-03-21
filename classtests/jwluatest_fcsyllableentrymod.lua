function FCSyllableEntryMod_PropertyTests(obj)
   NumberPropertyTest(obj, "FCSyllableEntryMod", "Alignment", {finale.SYLLALIGN_CENTER, finale.SYLLALIGN_DEFAULT,
                            finale.SYLLALIGN_LEFT, finale.SYLLALIGN_RIGHT})
   NumberPropertyTest(obj, "FCSyllableEntryMod", "Justification", {finale.SYLLJUST_CENTER, finale.SYLLJUST_DEFAULT,
                            finale.SYLLJUST_LEFT, finale.SYLLJUST_RIGHT})
end


-- Call:
local entry = LoadMeasureEntry(30, 3, 312)
if AssureNonNil(entry, "FCSyllableEntryMod_PropertyTests load entry") then
    local obj = finale.FCSyllableEntryMod()
    obj:SetNoteEntry(entry)
    if AssureTrue(obj:LoadFirst(), "FCSyllableEntryMod_PropertyTests: LoadFirst") then
        FCSyllableEntryMod_PropertyTests(obj)
    end
end
