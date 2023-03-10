function FCNoteheadMod_PropertyTests(noteheadmod)
   NumberPropertyTest(noteheadmod, "FCNoteheadMod", "CustomChar", {0, 64, 516})
   BoolPropertyTest(noteheadmod, "FCNoteheadMod", "EnharmonicFlip")
   StringPropertyTest(noteheadmod, "FCNoteheadMod", "FontName", {"Maestro", "Jazz", "Broadway"})
   NumberPropertyTest(noteheadmod, "FCNoteheadMod", "FontSize", {0, 24, 36})
   NumberPropertyTest(noteheadmod, "FCNoteheadMod", "HorizontalPos", {-258, 0, 258})
   NumberPropertyTest(noteheadmod, "FCNoteheadMod", "Resize", {0, 80, 270})
   BoolPropertyTest_RO(noteheadmod, "FCNoteheadMod", "UseCustomChar")
   BoolPropertyTest(noteheadmod, "FCNoteheadMod", "UseCustomFont")
   BoolPropertyTest(noteheadmod, "FCNoteheadMod", "UseCustomVerticalPos")
   NumberPropertyTest(noteheadmod, "FCNoteheadMod", "VerticalPos", {-257, 0, 257})
end

-- Call:
local entry = LoadMeasureEntry(6, 2, 125)
if AssureNonNil(entry, "Entry for fcnoteheadmod class test.") then
    local mods = finale.FCNoteheadMods(entry)
    if AssureTrue(mods:LoadAll() > 0, "FCNoteheadMods:LoadAll() > 0") then
        FCNoteheadMod_PropertyTests(mods:GetItemAt(0))
    end
end

