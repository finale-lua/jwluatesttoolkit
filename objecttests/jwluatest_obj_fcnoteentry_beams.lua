--
-- BEAM IDENTIFICATION TESTS
--

local function check_beamed_group(entry, expected_entrynums)
    if not AssureNonNil(entry.NextInBeamedGroup, "This version of RGP Lua does not include FCNoteEntry.NextInBeamedGroup. Beam iteration skipped.") then
        return
    end
    if not AssureNonNil(entry, "Nil entry passed to check_beamed_group for iterating beam.") then
        return
    end
    if not AssureEqual(type(expected_entrynums), "table", "Expected beam entry numbers table was empty.") then
        return
    end
    if not AssureNonNil(entry, "Nil expected_entrynums passed to check_beamed_group for iterating beam.") then
        return
    end
    local x = 0
    local next = entry:NextInBeamedGroup()
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
local beam_iters = {{324, 325}, {325}, {}, {336}, {334, 335}, {335}, {}, {}, {330, 331}, {329}, {}, {331}, {}, {}} 
local beam_ends = {false, false, true, false, false, false, true, true, false, false, true, false, true, false}
local unbeamed = {false, false, false, false, false, false, false, false, false, false, false, false, false, true}
local beam_counts = {1, 2, 2, 1, 2, 2, 2, 2, 1, 3, 3, 1, 1, 1}
local flippables = {true, false, false, true, true, false, false, false, true, true, false, false, false, true}
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
beam_iters = {{}, {}, {}, {}, {}, {343}, {}, {345}, {}, {}, {348}, {}}
beam_ends = {false, false, false, false, false, false, true, false, true, false, false, true}
unbeamed = {true, true, true, true, true, false, false, false, false, true, false, false}
beam_counts = {2, 2, 2, 2, 0, 1, 1, 3, 3, 3, 1, 1}
flippables = {false, false, false, true, true, true, false, true, false, true, true, false}
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
AssureEqual(x, #beam_starts, "Correct number of entries tested for beams bar 34.")


region = finale.FCMusicRegion()
region.StartMeasure = 35
region.StartStaff = 2
region:SetStartMeasurePosLeft()
region.EndMeasure = 35
region.EndStaff = 2
region:SetEndMeasurePosRight()
beam_starts = {351, 352, 353, 353, 353, 353, 357, 358, 359, 360}
beam_iters = {{}, {}, {354, 355, 356}, {355, 356}, {356}, {}, {}, {}, {}, {}}
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
    check_beamed_group(entry, beam_iters[x])
end
AssureEqual(x, #beam_starts, "Correct number of entries tested for beams bar 35.")


local prefs = finale.FCMiscDocPrefs()
AssureTrue(prefs:Load(1), "Loading prefs for checking beams over rests.")
prefs.ExtendBeamsOverRests = true
AssureTrue(prefs:Save(), "Saving prefs for checking beams over rests.")
region:RebeamMusic()

beam_starts = {351, 351, 353, 353, 353, 353, 357, 357, 357, 357}
beam_iters = {{352}, {}, {354, 355, 356}, {355, 356}, {356}, {}, {358, 359, 360}, {359, 360}, {360}, {}}
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
    check_beamed_group(entry, beam_iters[x])
end
AssureEqual(x, #beam_starts, "Correct number of entries tested for beams bar 35 with beams over rests.")

prefs.ExtendBeamsOverRests = false
AssureTrue(prefs:Save(), "Saving prefs for restoring beams not to extend over rests.")
region:RebeamMusic()

region = finale.FCMusicRegion()
region.StartMeasure = 34
region.StartStaff = 3
region:SetStartMeasurePosLeft()
region.EndMeasure = 34
region.EndStaff = 3
region:SetEndMeasurePosRight()
beam_starts = {361, 362, 363, 364, 365, 366, 367}
beam_iters = {{}, {}, {}, {}, {}, {}, {}}
beam_ends = {false, false, false, false, false, false, false}
unbeamed = {true, true, true, true, true, true, true}
beam_counts = {2, 2, 2, 2, 1, 1, 0}
flippables = {false, false, false, false, false, false, false}
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
AssureEqual(x, #beam_starts, "Correct number of entries tested for beams bar 34 only rests.")

prefs.ExtendBeamsOverRests = true
AssureTrue(prefs:Save(), "Saving prefs for checking beams over rests.")
region:RebeamMusic()

beam_starts = {361, 362, 363, 364, 365, 366, 367}
beam_iters = {{}, {}, {}, {}, {}, {}, {}}
beam_ends = {false, false, false, false, false, false, false}
unbeamed = {true, true, true, true, true, true, true}
beam_counts = {2, 2, 2, 2, 1, 1, 0}
flippables = {false, false, false, false, false, false, false}
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
AssureEqual(x, #beam_starts, "Correct number of entries tested for beams bar 34 only rests.")

prefs.ExtendBeamsOverRests = false
AssureTrue(prefs:Save(), "Saving prefs for restoring beams not to extend over rests.")
region:RebeamMusic()

region = finale.FCMusicRegion()
region.StartMeasure = 61
region.StartStaff = 1
region:SetStartMeasurePosLeft()
region.EndMeasure = 61
region.EndStaff = 1
region:SetEndMeasurePosRight()
beam_starts = {368, 380, 380, 382, 382, 380, 385, 368, 375, 375, 375, 368, 379, 371, 372, 372, 374, 378}
beam_iters = {{369, 370}, {381, 384}, {384}, {383}, {}, {}, {}, {370}, {376, 377}, {377}, {}, {}, {}, {}, {373}, {}, {}, {}}
beam_ends = {false, false, false, false, true, true, false, false, false, false, true, true, false, false, false, true, false, false}
unbeamed = {false, false, false, false, false, false, true, false, false, false, false, false, true, true, false, false, true, true}
beam_counts = {1, 3, 3, 4, 4, 3, 3, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 0}
flippables = {true, true, false, true, false, false, false, false, true, false, false ,false, false, false, true, false, false, false}
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
AssureEqual(x, #beam_starts, "Correct number of entries tested for beams bar 61.")

prefs.ExtendBeamsOverRests = true
AssureTrue(prefs:Save(), "Saving prefs for checking beams over rests.")
region:RebeamMusic()

beam_starts = {368, 380, 380, 382, 382, 380, 380, 368, 375, 375, 375, 368, 368, 371, 371, 371, 371, 378}
beam_iters = {{369, 370, 379}, {381, 384, 385}, {384, 385}, {383}, {}, {385}, {}, {370, 379}, {376, 377}, {377}, {}, {379}, {}, {372, 373, 374}, {373, 374}, {374}, {}, {}}
beam_ends = {false, false, false, false, true, false, true, false, false, false, true, false, true, false, false, false, true, false}
unbeamed = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true}
beam_counts = {1, 3, 3, 4, 4, 3, 3, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 0}
flippables = {true, true, false, true, false, false, false, false, true, false, false ,false, false, true, false, false, false, false}
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
AssureEqual(x, #beam_starts, "Correct number of entries tested for beams bar 61.")

prefs.ExtendBeamsOverRests = false
AssureTrue(prefs:Save(), "Saving prefs for restoring beams not to extend over rests.")
region:RebeamMusic()

region = finale.FCMusicRegion()
region.StartMeasure = 61
region.StartStaff = 2
region:SetStartMeasurePosLeft()
region.EndMeasure = 61
region.EndStaff = 2
region:SetEndMeasurePosRight()
beam_starts = {386, 387, 387, 389, 390, 390, 392, 393, 394, 394, 394, 394, 398, 399}
beam_iters = {{}, {388}, {}, {}, {391}, {}, {}, {}, {395, 396, 397}, {396, 397}, {397}, {}, {}, {}}
beam_ends = {false, false, true, false, false, true, false, false, false, false, false, true, false, false}
unbeamed = {true, false, false, true, false, false, true, true, false, false, false, false, true, true}
beam_counts = {3, 3, 3, 3, 1, 1, 0, 1, 3, 3, 3, 3, 1, 0}
flippables = {false, true, false, false, true, false, false, false, true, false, false ,false, true, true}
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
AssureEqual(x, #beam_starts, "Correct number of entries tested for beams bar 61.")
