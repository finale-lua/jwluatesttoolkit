-- This file regression tests scenarios that have been fixed to be sure they do not return

-- Scenario 1: saving an empty frame (Layer 2) causes the same layer on the next measure to
--  recalculate tie ends. See written measure 50-51 (#52-53), staff 2.
local function get_tie_end(measure, staff, entnum)
    local entry, ne = LoadMeasureEntryLocal(measure, staff, entnum)
    if AssureNonNil(entry, "LoadMeasureEntryLocal(" .. measure .. ", " .. staff .. ", " .. entnum .. ") for testing tie-end flipping scenario") then
        for note in each(entry) do
            return note.TieBackwards
        end
    end
    return nil
end
AssureTrue(get_tie_end(53, 2, 455), "get_tie_end before tie-end flipping scenario")
-- FCNoteEntryCell
local ne = finale.FCNoteEntryCell(52, 2)
AssureTrue(ne:Load(), "Load FCNoteEntryCell(52, 52) for testing tie-end flipping scenario")
AssureTrue(ne:Save(), "Save FCNoteEntryCell(52, 52) for testing tie-end flipping scenario")
AssureTrue(get_tie_end(53, 2, 455), "get_tie_end after tie-end flipping scenario with FCNoteEntryCell")
-- FCNoteEntryLayer
local nel = finale.FCNoteEntryLayer(1, 2, 50, 52)
AssureTrue(nel:Load(), "Load FCNoteEntryLayer(1, 2, 50, 52) for testing tie-end flipping scenario")
AssureTrue(nel:Save(), "Save FCNoteEntryLayer(1, 2, 50, 52) for testing tie-end flipping scenario")
AssureTrue(get_tie_end(53, 2, 455), "get_tie_end after tie-end flipping scenario with FCNoteEntryLayer")


