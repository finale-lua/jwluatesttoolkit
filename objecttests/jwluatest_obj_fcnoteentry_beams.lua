--
-- BEAM IDENTIFICATION TESTS
--

local function check_beamed_group(entry, expected_entrynums, expected_reverse_entrynums)
    if not AssureNonNil(entry.NextInBeamedGroup, "This version of RGP Lua does not include FCNoteEntry.NextInBeamedGroup. Beam iteration skipped.") then
        return
    end
    if not AssureNonNil(entry, "Nil entry passed to check_beamed_group for iterating beam.") then
        return
    end
    if not AssureEqual(type(expected_entrynums), "table", "Expected beam entry numbers table was empty.") then
        return
    end
    if not AssureEqual(type(expected_reverse_entrynums), "table", "Expected reverse beam entry numbers table was empty.") then
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
    x = 0
    local prev = entry:PreviousInBeamedGroup()
    while prev do
        x = x + 1
        AssureEqual(prev.EntryNumber, expected_reverse_entrynums[x], "Check previous entry number in beamed group iteration for entry " .. entry.EntryNumber .. ".")
        prev = prev:PreviousInBeamedGroup()
    end
    AssureEqual(x, #expected_reverse_entrynums, "Check number of entries in reverse beamed group expected for entry " .. entry.EntryNumber .. ".")
end

local function check_beams(meas, staff, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, for_extend_over_rests)
    local region = finale.FCMusicRegion()
    region.StartMeasure = meas
    region.StartStaff = staff
    region:SetStartMeasurePosLeft()
    region.EndMeasure = meas
    region.EndStaff = staff
    region:SetEndMeasurePosRight()
    local function set_extend_over_rests(state)        
        local prefs = finale.FCMiscDocPrefs()
        AssureTrue(prefs:Load(1), "Loading prefs for setting beams over rests " .. tostring(state) .. ".")
        prefs.ExtendBeamsOverRests = state
        AssureTrue(prefs:Save(), "Saving prefs for setting beams over rests " .. tostring(state) .. ".")
        region:RebeamMusic()
    end
    if for_extend_over_rests then
        set_extend_over_rests(true)
    end
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
        check_beamed_group(entry, beam_iters[x], beam_irevs[x])
    end
    AssureEqual(x, #beam_starts, "Correct number of entries tested for measure " .. region.StartMeasure .. " staff " .. region.StartStaff .. ".")
    if for_extend_over_rests then
        set_extend_over_rests(false)
    end
end

local beam_starts = {323, 323, 323, 326, 333, 333, 333, 326, 327, 328, 328, 327, 327, 332}
local beam_iters = {{324, 325}, {325}, {}, {336}, {334, 335}, {335}, {}, {}, {330, 331}, {329}, {}, {331}, {}, {}}
local beam_irevs = {{}, {323}, {324, 323}, {}, {}, {333}, {334, 333}, {326}, {}, {}, {328}, {327}, {330, 327}, {}}
local beam_ends = {false, false, true, false, false, false, true, true, false, false, true, false, true, false}
local unbeamed = {false, false, false, false, false, false, false, false, false, false, false, false, false, true}
local beam_counts = {1, 2, 2, 1, 2, 2, 2, 2, 1, 3, 3, 1, 1, 1}
local flippables = {true, false, false, true, true, false, false, false, true, true, false, false, false, true}
check_beams(33, 3, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, false)

beam_starts = {337, 338, 339, 340, 341, 342, 342, 344, 344, 346, 347, 347}
beam_iters = {{}, {}, {}, {}, {}, {343}, {}, {345}, {}, {}, {348}, {}}
beam_irevs = {{}, {}, {}, {}, {}, {}, {342}, {}, {344}, {}, {}, {347}}
beam_ends = {false, false, false, false, false, false, true, false, true, false, false, true}
unbeamed = {true, true, true, true, true, false, false, false, false, true, false, false}
beam_counts = {2, 2, 2, 2, 0, 1, 1, 3, 3, 3, 1, 1}
flippables = {false, false, false, true, true, true, false, true, false, true, true, false}
check_beams(34, 1, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, false)

beam_starts = {351, 352, 353, 353, 353, 353, 357, 358, 359, 360}
beam_iters = {{}, {}, {354, 355, 356}, {355, 356}, {356}, {}, {}, {}, {}, {}}
beam_irevs = {{}, {}, {}, {353}, {354, 353}, {355, 354, 353}, {}, {}, {}, {}}
beam_ends = {false, false, false, false, false, true, false, false, false, false}
unbeamed = {true, true, false, false, false, false, true, true, true, true}
beam_counts = {1, 1, 2, 2, 2, 2, 1, 1, 1, 1}
flippables = {false, true, true, false, false, false, true, false, false, true}
check_beams(35, 2, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, false)

beam_starts = {351, 351, 353, 353, 353, 353, 357, 357, 357, 357}
beam_iters = {{352}, {}, {354, 355, 356}, {355, 356}, {356}, {}, {358, 359, 360}, {359, 360}, {360}, {}}
beam_irevs = {{}, {351}, {}, {353}, {354, 353}, {355, 354, 353}, {}, {357}, {358, 357}, {359, 358, 357}}
beam_ends = {false, true, false, false, false, true, false, false, false, true}
unbeamed = {false, false, false, false, false, false, false, false, false, false}
beam_counts = {1, 1, 2, 2, 2, 2, 1, 1, 1, 1}
flippables = {true, false, true, false, false, false, true, false, false, false}
check_beams(35, 2, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, true)

beam_starts = {361, 362, 363, 364, 365, 366, 367}
beam_iters = {{}, {}, {}, {}, {}, {}, {}}
beam_irevs = {{}, {}, {}, {}, {}, {}, {}}
beam_ends = {false, false, false, false, false, false, false}
unbeamed = {true, true, true, true, true, true, true}
beam_counts = {2, 2, 2, 2, 1, 1, 0}
flippables = {false, false, false, false, false, false, false}
check_beams(34, 3, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, false)

beam_starts = {361, 362, 363, 364, 365, 366, 367}
beam_iters = {{}, {}, {}, {}, {}, {}, {}}
beam_irevs = {{}, {}, {}, {}, {}, {}, {}}
beam_ends = {false, false, false, false, false, false, false}
unbeamed = {true, true, true, true, true, true, true}
beam_counts = {2, 2, 2, 2, 1, 1, 0}
flippables = {false, false, false, false, false, false, false}
check_beams(34, 3, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, true)

beam_starts = {368, 380, 380, 382, 382, 380, 385, 368, 375, 375, 375, 368, 379, 371, 372, 372, 374, 378}
beam_iters = {{369, 370}, {381, 384}, {384}, {383}, {}, {}, {}, {370}, {376, 377}, {377}, {}, {}, {}, {}, {373}, {}, {}, {}}
beam_irevs = {{}, {}, {380}, {}, {382}, {381, 380}, {}, {368}, {}, {375}, {376, 375}, {369, 368}, {}, {}, {}, {372}, {}, {}}
beam_ends = {false, false, false, false, true, true, false, false, false, false, true, true, false, false, false, true, false, false}
unbeamed = {false, false, false, false, false, false, true, false, false, false, false, false, true, true, false, false, true, true}
beam_counts = {1, 3, 3, 4, 4, 3, 3, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 0}
flippables = {true, true, false, true, false, false, false, false, true, false, false ,false, false, false, true, false, false, false}
check_beams(61, 1, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, false)

beam_starts = {368, 380, 380, 382, 382, 380, 380, 368, 375, 375, 375, 368, 368, 371, 371, 371, 371, 378}
beam_iters = {{369, 370, 379}, {381, 384, 385}, {384, 385}, {383}, {}, {385}, {}, {370, 379}, {376, 377}, {377}, {}, {379}, {}, {372, 373, 374}, {373, 374}, {374}, {}, {}}
beam_irevs = {{}, {}, {380}, {}, {382}, {381, 380}, {384, 381, 380}, {368}, {}, {375}, {376, 375}, {369, 368}, {370, 369, 368}, {}, {371}, {372, 371}, {373, 372, 371}, {}}
beam_ends = {false, false, false, false, true, false, true, false, false, false, true, false, true, false, false, false, true, false}
unbeamed = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true}
beam_counts = {1, 3, 3, 4, 4, 3, 3, 2, 3, 3, 3, 3, 3, 2, 2, 2, 2, 0}
flippables = {true, true, false, true, false, false, false, false, true, false, false ,false, false, true, false, false, false, false}
check_beams(61, 1, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, true)

beam_starts = {386, 387, 387, 389, 390, 390, 392, 393, 394, 394, 394, 394, 398, 399}
beam_iters = {{}, {388}, {}, {}, {391}, {}, {}, {}, {395, 396, 397}, {396, 397}, {397}, {}, {}, {}}
beam_irevs = {{}, {}, {387}, {}, {}, {390}, {}, {}, {}, {394}, {395, 394}, {396, 395, 394}, {}, {}}
beam_ends = {false, false, true, false, false, true, false, false, false, false, false, true, false, false}
unbeamed = {true, false, false, true, false, false, true, true, false, false, false, false, true, true}
beam_counts = {3, 3, 3, 3, 1, 1, 0, 1, 3, 3, 3, 3, 1, 0}
flippables = {false, true, false, false, true, false, false, false, true, false, false ,false, true, true}
check_beams(61, 2, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, false)

beam_starts = {386, 386, 386, 386, 390, 390, 392, 393, 394, 394, 394, 394, 393, 399}
beam_iters = {{387, 388, 389}, {388, 389}, {389}, {}, {391}, {}, {}, {398}, {395, 396, 397}, {396, 397}, {397}, {}, {}, {}}
beam_irevs = {{}, {386}, {387, 386}, {388, 387, 386}, {}, {390}, {}, {}, {}, {394}, {395, 394}, {396, 395, 394}, {393}, {}}
beam_ends = {false, false, false, true, false, true, false, false, false, false, false, true, true, false}
unbeamed = {false, false, false, false, false, false, true, false, false, false, false, false, false, true}
beam_counts = {3, 3, 3, 3, 1, 1, 0, 1, 3, 3, 3, 3, 1, 0}
flippables = {true, false, false, false, true, false, false, true, true, false, false ,false, false, true}
check_beams(61, 2, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, true)

-- Test Voiced Part
if not AssureNonNil(finale.FCPartStaffVoicing, "FCPartStaffVoicing beam tests skipped because this version does not support it.") then
    return
end
local part = finale.FCPart(1) -- should be Voiced Part Staff 3
AssureTrue(part:SwitchTo(), "FCPartStaffVoicing was not able to bring part 1 into edit focus for beam tests.")

beam_starts = {400, 401, 401, 401, 405, 406, 407, 408, 409, 410, 411, 411}
beam_iters = {{}, {402, 403}, {403}, {}, {}, {}, {}, {}, {}, {}, {412}, {}}
beam_irevs = {{}, {}, {401}, {402, 401}, {}, {}, {}, {}, {}, {}, {}, {411}}
beam_ends = {false, false, false, true, false, false, false, false, false, false, false, true}
unbeamed = {true, false, false, false, true, true, true, true, true, true, false, false}
beam_counts = {1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2}
flippables = {false, true, false, false, true, false, false, false, false, false, true, false}
check_beams(43, 3, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, false)

beam_starts = {400, 400, 400, 400, 405, 405, 405, 405, 409, 409, 409, 409}
beam_iters = {{401, 402, 403}, {402, 403}, {403}, {}, {406, 407, 408}, {407, 408}, {408}, {}, {410, 411, 412}, {411, 412}, {412}, {}}
beam_irevs = {{}, {400}, {401, 400}, {402, 401, 400}, {}, {405}, {406, 405}, {407, 406, 405}, {}, {409}, {410, 409}, {411, 410, 409}}
beam_ends = {false, false, false, true, false, false, false, true, false, false, false, true}
unbeamed = {false, false, false, false, false, false, false, false, false, false, false, false}
beam_counts = {1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2}
flippables = {true, false, false, false, true, false, false, false, true, false, false, false}
check_beams(43, 3, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, true)

AssureTrue(part:SwitchBack(), "FCPartStaffVoicing was not able to switch edit focus back to Score after beam tests.")

-- test for beams in the midst of hidden beams and stems at the staff level:

beam_starts = {413, 414, 415, 416, 417, 418}
beam_iters = {{}, {}, {}, {}, {}, {}}
beam_irevs = {{}, {}, {}, {}, {}, {}}
beam_ends = {false, false, false, false, false, false}
unbeamed = {true, true, true, true, true, true}
beam_counts = {1, 1, 1, 1, 0, 0}
flippables = {true, true, true, true, true, false}
check_beams(60, 3, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, true)
check_beams(60, 3, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, false)


beam_starts = {423, 424, 421, 421, 426, 427, 428, 428}
beam_iters = {{}, {}, {425}, {}, {}, {}, {429}, {}}
beam_irevs = {{}, {}, {}, {421}, {}, {}, {}, {428}}
beam_ends = {false, false, false, true, false, false, false, true}
unbeamed = {true, true, false, false, true, true, false, false}
beam_counts = {1, 1, 1, 1, 1, 1, 1, 1}
flippables = {false, true, true, false, true, true, true, false}
check_beams(61, 3, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, true)
check_beams(61, 3, beam_starts, beam_iters, beam_irevs, beam_ends, unbeamed, beam_counts, flippables, false)
