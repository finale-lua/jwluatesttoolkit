function FCNoteEntry_ValueTests_Cell5_3(entry)
   NumberValuePropertyTest(entry, "FCNoteEntry", "ActualDuration", 1024)
   BoolValuePropertyTest(entry, "FCNoteEntry", "ArticulationFlag", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "BeamBeat", true)
   BoolValuePropertyTest(entry, "FCNoteEntry", "BeamExtensionFlag", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "CheckAccidentals", false, true) -- true: read-only
   NumberValuePropertyTest(entry, "FCNoteEntry", "ClefIndex", 3)
   BoolValuePropertyTest(entry, "FCNoteEntry", "CombineRests", true)
   BoolValuePropertyTest(entry, "FCNoteEntry", "CrossStaff", false)
   NumberValuePropertyTest(entry, "FCNoteEntry", "Duration", 1024)
   NumberValuePropertyTest_RO(entry, "FCNoteEntry", "EntryNumber", 135)
   BoolValuePropertyTest(entry, "FCNoteEntry", "FlatBeam", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "FlipTie", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "FloatingRest", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "FreezeBeam", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "FreezeStem", true)
   BoolValuePropertyTest(entry, "FCNoteEntry", "GraceNote", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "GraceNoteSlash", false)
   NumberValuePropertyTest_RO(entry, "FCNoteEntry", "LayerNumber", 1)
   BoolValuePropertyTest(entry, "FCNoteEntry", "LedgerLines", true)
   BoolValuePropertyTest(entry, "FCNoteEntry", "Legality", true)
   BoolValuePropertyTest(entry, "FCNoteEntry", "LyricFlag", false)
   NumberValuePropertyTest(entry, "FCNoteEntry", "ManualPosition", 0)
   NumberValuePropertyTest_RO(entry, "FCNoteEntry", "Measure", 5)
   NumberValuePropertyTest(entry, "FCNoteEntry", "MeasurePos", 0)
   BoolValuePropertyTest(entry, "FCNoteEntry", "NoteDetailFlag", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "PerformanceDataFlag", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "Playback", true)
   BoolValuePropertyTest(entry, "FCNoteEntry", "ReverseDownStem", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "ReverseUpStem", true)
   BoolValuePropertyTest(entry, "FCNoteEntry", "SecondaryBeamFlag", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "SmartShapeFlag", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "Spacing", true)
   BoolValuePropertyTest(entry, "FCNoteEntry", "SpecialAltsFlag", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "SplitRest", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "SplitStem", false)
   NumberValuePropertyTest_RO(entry, "FCNoteEntry", "Staff", 3)
   BoolValuePropertyTest(entry, "FCNoteEntry", "StemDetailFlag", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "StemUp", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "TupletStartFlag", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "Visible", true)
   BoolValuePropertyTest(entry, "FCNoteEntry", "Voice2", false)
   BoolValuePropertyTest(entry, "FCNoteEntry", "Voice2Launch", false)
end

-- Call:
local entry = LoadMeasureEntry(5, 3, 135)
AssureTrue(entry ~= nil, "LoadMeasureEntry(LoadMeasureEntry(5, 3, 135) for FCNoteEntry")
FCNoteEntry_ValueTests_Cell5_3(entry)


-- Scenarios:
function FCNoteEntry_Scenario_FindNote_Test(entry1, entry2)
    AssureNonNil(entry1, "FCNoteEntry_Scenario_FindNote_Test entry1")
    AssureNonNil(entry2, "FCNoteEntry_Scenario_FindNote_Test entry2")
    if not entry1 or not entry2 then return end
    local note_string = function(note)
        if not note then return nil end
        return tostring(note.Entry.EntryNumber).."."..tostring(note.NoteID)
    end
    for note1 in each(entry1) do
        local note2 = entry2:FindPitch(note1)
        AssureNonNil(note2, "FCNoteEntry:FindPitch is nil for note: "..note_string(note1))
        if note2 then
            AssureTrue(note2.NoteID == note1.NoteID, "FCNoteEntry:FindPitch wrong note returned for note: "..note_string(note1).." (got note: "..note_string(note2)..")")
        end
    end
end

local entry1, notecell1 = LoadMeasureEntryLocal(27, 1, 264)
local entry2, notecell2 = LoadMeasureEntryLocal(28, 1, 265)
local entry3, notecell3 = LoadMeasureEntryLocal(28, 1, 266)
FCNoteEntry_Scenario_FindNote_Test(entry1, entry2)
FCNoteEntry_Scenario_FindNote_Test(entry2, entry3)

local entry4, notecell4 = LoadMeasureEntryLocal(32, 1, 304)
if AssureNonNil(entry4, "FCNoteEntry_Scenario_IsOnLedgerLine entry4") then
    for index = 0, entry4.Count-1 do
        local note = entry4:GetItemAt(index)
        local note_string = finale.FCString()
        note:GetString(note_string, nil, false, false)
        if index == 0 or index == (entry4.Count - 1) then
            AssureTrue(note:CalcOnLedgerLine(), "FCNoteEntry_Scenario_IsOnLedgerLine: "..note_string.LuaString)
        else
            AssureFalse(note:CalcOnLedgerLine(), "FCNoteEntry_Scenario_IsOnLedgerLine: "..note_string.LuaString)
        end
        local number_of_ledger_lines = 0
        if index == 0 then
            number_of_ledger_lines = -3
        elseif index == 1 then
            number_of_ledger_lines = -2
        elseif index == 2 then
            number_of_ledger_lines = 0
        elseif index == 3 then
            number_of_ledger_lines = 2
        elseif index == 4 then
            number_of_ledger_lines = 3
        end
        if AssureNonNil(note.CalcNumberOfLedgerLines, "FCNoteEntry_Scenario_NumberOfLedgerLines: FCNote.CalcNumberOfLedgerLines") then
            AssureValue(note:CalcNumberOfLedgerLines(), number_of_ledger_lines, "FCNoteEntry_Scenario_NumebrOfLedgerLine: "..note_string.LuaString)
        end
    end
end

local function check_beamed_group(entry, expected_entrynums)
    if not AssureNonNil(entry.NextInBeamedGroup, "This version of RGP Lua does not include FCNoteEntry.NextInBeamedGroup. Beam iteration skipped.") then
        return
    end
    if not AssureNonNil(entry, "Nil entry passed to check_beamed_group for iterating beam.") then
        return
    end
    local is_beamed = #expected_entrynums > 0
    local is_unbeamed = entry:CalcUnbeamedNote()
    AssureEqual(is_unbeamed, not is_beamed, "Iterating beam from entry " .. entry.EntryNumber .. " beamed status is not correct.")
    if is_unbeamed then return end
    if not AssureNonNil(entry, "Nil expected_entrynums passed to check_beamed_group for iterating beam.") then
        return
    end
    local x = 0
    local next = entry
    while next do
        x = x + 1
        AssureEqual(next.EntryNumber, expected_entrynums[x], "Check next entry number in beamed group iteration for entry " .. entry.EntryNumber .. ".")
        next = next:NextInBeamedGroup()
    end
    AssureEqual(x, #expected_entrynums, "Check number of entries in beamed group expected for entry " .. entry.EntryNumber .. ".")
end

local region = finale.FCMusicRegion()
region.StartMeasure = 33
region.StartStaff = 3
region:SetStartMeasurePosLeft()
region.EndMeasure = 33
region.EndStaff = 3
region:SetEndMeasurePosRight()
local beam_starts = {323, 323, 323, 326, 333, 333, 333, 326, 327, 328, 328, 327, 327, 332}
local beam_iters = {{323, 324, 325}, {324, 325}, {325}, {326, 336}, {333, 334, 335}, {334, 335}, {335}, {336}, {327, 330, 331}, {328, 329}, {329}, {330, 331}, {331}, {}} 
local beam_ends = {false, false, true, false, false, false, true, true, false, false, true, false, true, false}
local unbeamed = {false, false, false, false, false, false, false, false, false, false, false, false, false, true}
local beam_counts = {1, 2, 2, 1, 2, 2, 2, 2, 1, 3, 3, 1, 1, 1}
local flippables = {true, false, false, true, true, false, false, false, true, false, false, false, false, true}
local x = 0
for entry in eachentry(region) do
    x = x + 1
    AssureEqual(entry:CalcBeamCount(), beam_counts[x], "Beam count for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    local unbeamed_note = entry:CalcUnbeamedNote()
    local beam_start = entry:CalcBeamStartEntry()
    if unbeamed_note then
        AssureEqual(beam_start, nil, "Beam start for entry " .. entry.EntryNumber .. " is nil. (x = " .. x .. ")")
        beam_start = entry
    end
    if AssureNonNil(beam_start, "Beam start for entry " .. entry.EntryNumber .. " is non nil. (x = " .. x .. ")") then
        AssureEqual(beam_start.EntryNumber, beam_starts[x], "Beam start for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    end
    AssureEqual(entry:CalcBeamedGroupEnd(), beam_ends[x], "Beam group end status for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    AssureEqual(entry:CalcUnbeamedNote(), unbeamed[x], "Note not beamed status for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    AssureEqual(entry:CalcFlippable(), flippables[x], "Note flippable status for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    check_beamed_group(entry, beam_iters[x])
end
AssureEqual(x, #beam_starts, "Correct number of entries tested for beams bar 33.")

region = finale.FCMusicRegion()
region.StartMeasure = 34
region.StartStaff = 1
region:SetStartMeasurePosLeft()
region.EndMeasure = 34
region.EndStaff = 1
region:SetEndMeasurePosRight()
beam_starts = {337, 338, 339, 340, 341, 342, 342, 344, 344, 346, 347, 347}
beam_ends = {false, false, false, false, false, false, true, false, true, false, false, true}
unbeamed = {true, true, true, true, true, false, false, false, false, true, false, false}
beam_counts = {2, 2, 2, 2, 0, 1, 1, 3, 3, 3, 1, 1}
flippables = {false, false, false, true, true, true, false, false, false, true, false, false}
local x = 0
for entry in eachentry(region) do
    x = x + 1
    AssureEqual(entry:CalcBeamCount(), beam_counts[x], "Beam count for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    local unbeamed_note = entry:CalcUnbeamedNote()
    local beam_start = entry:CalcBeamStartEntry()
    if unbeamed_note then
        AssureEqual(beam_start, nil, "Beam start for entry " .. entry.EntryNumber .. " is nil. (x = " .. x .. ")")
        beam_start = entry
    end
    if AssureNonNil(beam_start, "Beam start for entry " .. entry.EntryNumber .. " is non nil. (x = " .. x .. ")") then
        AssureEqual(beam_start.EntryNumber, beam_starts[x], "Beam start for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    end
    AssureEqual(entry:CalcBeamedGroupEnd(), beam_ends[x], "Beam group end status for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    AssureEqual(entry:CalcUnbeamedNote(), unbeamed[x], "Note not beamed status for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    AssureEqual(entry:CalcFlippable(), flippables[x], "Note flippable status for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
end
AssureEqual(x, #beam_starts, "Correct number of entries tested for beams bar 34.")


region = finale.FCMusicRegion()
region.StartMeasure = 35
region.StartStaff = 2
region:SetStartMeasurePosLeft()
region.EndMeasure = 35
region.EndStaff = 2
region:SetEndMeasurePosRight()
beam_starts = {351, 352, 353, 353, 353, 353, 357, 358, 359, 360}
beam_ends = {false, false, false, false, false, true, false, false, false, false}
unbeamed = {true, true, false, false, false, false, true, true, true, true}
beam_counts = {1, 1, 2, 2, 2, 2, 1, 1, 1, 1}
flippables = {false, true, true, false, false, false, true, false, false, true}
local x = 0
for entry in eachentry(region) do
    x = x + 1
    AssureEqual(entry:CalcBeamCount(), beam_counts[x], "Beam count for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    local unbeamed_note = entry:CalcUnbeamedNote()
    local beam_start = entry:CalcBeamStartEntry()
    if unbeamed_note then
        AssureEqual(beam_start, nil, "Beam start for entry " .. entry.EntryNumber .. " is nil. (x = " .. x .. ")")
        beam_start = entry
    end
    if AssureNonNil(beam_start, "Beam start for entry " .. entry.EntryNumber .. " is non nil. (x = " .. x .. ")") then
        AssureEqual(beam_start.EntryNumber, beam_starts[x], "Beam start for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    end
    AssureEqual(entry:CalcBeamedGroupEnd(), beam_ends[x], "Beam group end status for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    AssureEqual(entry:CalcUnbeamedNote(), unbeamed[x], "Note not beamed status for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    AssureEqual(entry:CalcFlippable(), flippables[x], "Note flippable status for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
end
AssureEqual(x, #beam_starts, "Correct number of entries tested for beams bar 35.")


local prefs = finale.FCMiscDocPrefs()
AssureTrue(prefs:Load(1), "Loading prefs for checking beams over rests.")
prefs.ExtendBeamsOverRests = true
AssureTrue(prefs:Save(), "Saving prefs for checking beams over rests.")
region:RebeamMusic()

beam_starts = {351, 351, 353, 353, 353, 353, 357, 357, 357, 357}
beam_ends = {false, true, false, false, false, true, false, false, false, true}
unbeamed = {false, false, false, false, false, false, false, false, false, false}
beam_counts = {1, 1, 2, 2, 2, 2, 1, 1, 1, 1}
flippables = {true, false, true, false, false, false, true, false, false, false}
local x = 0
for entry in eachentry(region) do
    x = x + 1
    AssureEqual(entry:CalcBeamCount(), beam_counts[x], "Beam count for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    local unbeamed_note = entry:CalcUnbeamedNote()
    local beam_start = entry:CalcBeamStartEntry()
    if unbeamed_note then
        AssureEqual(beam_start, nil, "Beam start for entry " .. entry.EntryNumber .. " is nil. (x = " .. x .. ")")
        beam_start = entry
    end
    if AssureNonNil(beam_start, "Beam start for entry " .. entry.EntryNumber .. " is non nil. (x = " .. x .. ")") then
        AssureEqual(beam_start.EntryNumber, beam_starts[x], "Beam start for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    end
    AssureEqual(entry:CalcBeamedGroupEnd(), beam_ends[x], "Beam group end status for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    AssureEqual(entry:CalcUnbeamedNote(), unbeamed[x], "Note not beamed status for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
    AssureEqual(entry:CalcFlippable(), flippables[x], "Note flippable status for entry " .. entry.EntryNumber .. ". (x = " .. x .. ")")
end
AssureEqual(x, #beam_starts, "Correct number of entries tested for beams bar 35 with beams over rests.")

prefs.ExtendBeamsOverRests = false
AssureTrue(prefs:Save(), "Saving prefs for restoring beams not to extend over rests.")
region:RebeamMusic()
