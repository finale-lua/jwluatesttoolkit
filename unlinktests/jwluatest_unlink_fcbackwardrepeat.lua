
function FCBackwardRepeat_Test_Unlinkable(measure, partnumber)
    local obj = finale.FCBackwardRepeat()
    UnlinkableNumberPropertyTest(obj, "FCBackwardRepeat", "TopBracketPosition", "Load", measure, 24, partnumber)
    UnlinkableNumberPropertyTest(obj, "FCBackwardRepeat", "BottomBracketPosition", "Load", measure, -24, partnumber)
    UnlinkableNumberPropertyTest(obj, "FCBackwardRepeat", "RightBracketPosition", "Load", measure, -24, partnumber)
    UnlinkableNumberPropertyTest(obj, "FCBackwardRepeat", "Visible", "Load", measure, -24, partnumber)
    
    -- LeftBracketPosition appears not always to unlink, so allow it to short-circuit the unlink test through the latest Finale version
    -- The Finale version must be updated in UnlinkWithProperty each time a new version of Finale comes out.
    -- This allows us to identify any that MakeMusic might have fixed.
    if measure == 8 then
        UnlinkWithProperty(obj, "FCBackwardRepeat", "TopBracketPosition", "Load", measure, 24, partnumber)
    end
    UnlinkableNumberPropertyTest(obj, "FCBackwardRepeat", "LeftBracketPosition", "Load", measure, 24, partnumber) -- keep this item first
end

-- Call:
FCBackwardRepeat_Test_Unlinkable(8, staff_to_part[1])
FCBackwardRepeat_Test_Unlinkable(9, staff_to_part[2])
FCBackwardRepeat_Test_Unlinkable(10, staff_to_part[3])
