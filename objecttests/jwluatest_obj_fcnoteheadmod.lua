function FCNoteheadMod_ValueTests_Entry6_2_125(nmod)
   NumberValuePropertyTest(nmod, "FCNoteheadMod", "CustomChar", 0)
   BoolValuePropertyTest(nmod, "FCNoteheadMod", "EnharmonicFlip", false)
   StringValuePropertyTest(nmod, "FCNoteheadMod", "FontName", "Jazz")
   NumberValuePropertyTest(nmod, "FCNoteheadMod", "FontSize", 26)
   NumberValuePropertyTest(nmod, "FCNoteheadMod", "HorizontalPos", 12)
   NumberValuePropertyTest(nmod, "FCNoteheadMod", "Resize", 82)
   BoolValuePropertyTest_RO(nmod, "FCNoteheadMod", "UseCustomChar", false)
   BoolValuePropertyTest(nmod, "FCNoteheadMod", "UseCustomFont", true)
   BoolValuePropertyTest(nmod, "FCNoteheadMod", "UseCustomVerticalPos", true)
   NumberValuePropertyTest(nmod, "FCNoteheadMod", "VerticalPos", 11)
end


-- Call:
local noteheadmod = finale.FCNoteheadMod()
local entry = LoadMeasureEntry(6, 2, 125)
if AssureNonNil(entry) then
    noteheadmod:SetNoteEntry(entry)
    local note = entry:GetItemAt(0)
    AssureNonNil(note)
    AssureTrue(noteheadmod:LoadAt(note), "Entry125_LoadAt(note)")
    FCNoteheadMod_ValueTests_Entry6_2_125(noteheadmod)
end


function FCNoteheadMod_ValueTests_Entry6_2_126(noteheadmod)
   NumberValuePropertyTest(noteheadmod, "FCNoteheadMod", "CustomChar", 208)
   BoolValuePropertyTest(noteheadmod, "FCNoteheadMod", "EnharmonicFlip", false)
   StringValuePropertyTest(noteheadmod, "FCNoteheadMod", "FontName", "")
   NumberValuePropertyTest(noteheadmod, "FCNoteheadMod", "FontSize", 0)
   NumberValuePropertyTest(noteheadmod, "FCNoteheadMod", "HorizontalPos", 0)
   NumberValuePropertyTest(noteheadmod, "FCNoteheadMod", "Resize", 100)
   BoolValuePropertyTest(noteheadmod, "FCNoteheadMod", "UseCustomFont", false)
   BoolValuePropertyTest(noteheadmod, "FCNoteheadMod", "UseCustomVerticalPos", false)
   NumberValuePropertyTest(noteheadmod, "FCNoteheadMod", "VerticalPos", 0)
end


-- Call:
local noteheadmod = finale.FCNoteheadMod()
local entry = LoadMeasureEntry(6, 2, 126)
if AssureNonNil(entry) then
    noteheadmod:SetNoteEntry(entry)
    local note = entry:GetItemAt(0)
    AssureNonNil(note)
    AssureTrue(noteheadmod:LoadAt(note), "Entry126_LoadAt(note)")    
    FCNoteheadMod_ValueTests_Entry6_2_126(noteheadmod)
end


function FCNoteheadMod_ValueTests_Entry6_2_130(noteheadmod)
   NumberValuePropertyTest(noteheadmod, "FCNoteheadMod", "CustomChar", 0)
   BoolValuePropertyTest(noteheadmod, "FCNoteheadMod", "EnharmonicFlip", true)
   StringValuePropertyTest(noteheadmod, "FCNoteheadMod", "FontName", "")
   NumberValuePropertyTest(noteheadmod, "FCNoteheadMod", "FontSize", 0)
   NumberValuePropertyTest(noteheadmod, "FCNoteheadMod", "HorizontalPos", 0)
   NumberValuePropertyTest(noteheadmod, "FCNoteheadMod", "Resize", 100)
   BoolValuePropertyTest_RO(noteheadmod, "FCNoteheadMod", "UseCustomChar", false)
   BoolValuePropertyTest(noteheadmod, "FCNoteheadMod", "UseCustomFont", false)
   BoolValuePropertyTest(noteheadmod, "FCNoteheadMod", "UseCustomVerticalPos", false)
   NumberValuePropertyTest(noteheadmod, "FCNoteheadMod", "VerticalPos", 0)
end


-- Call:
local noteheadmod = finale.FCNoteheadMod()
local entry = LoadMeasureEntry(6, 2, 130)
if AssureNonNil(entry) then
    noteheadmod:SetNoteEntry(entry)
    local note = entry:GetItemAt(0)
    AssureNonNil(note)
    AssureTrue(noteheadmod:LoadAt(note), "Entry130_LoadAt(note)")
    FCNoteheadMod_ValueTests_Entry6_2_130(noteheadmod)
end


