
function FCEndingRepeat_Test_Unlinkable(measure, partnumber)
    local obj = finale.FCEndingRepeat()
    UnlinkableNumberPropertyTest(obj, "FCEndingRepeat", "HorizontalLeftBracketPosition", "Load", measure, -24, partnumber)
    UnlinkableNumberPropertyTest(obj, "FCEndingRepeat", "HorizontalRightBracketPosition", "Load", measure, 24, partnumber)
    UnlinkableNumberPropertyTest(obj, "FCEndingRepeat", "HorizontalTextPosition", "Load", measure, 24, partnumber)
    UnlinkableNumberPropertyTest(obj, "FCEndingRepeat", "VerticalLeftBracketPosition", "Load", measure, -24, partnumber)
    UnlinkableNumberPropertyTest(obj, "FCEndingRepeat", "VerticalRightBracketPosition", "Load", measure, 24, partnumber)
    UnlinkableNumberPropertyTest(obj, "FCEndingRepeat", "VerticalTopBracketPosition", "Load", measure, 24, partnumber)
    UnlinkableNumberPropertyTest(obj, "FCEndingRepeat", "VerticalTextPosition", "Load", measure, -24, partnumber)
    UnlinkableNumberPropertyTest(obj, "FCEndingRepeat", "Visible", "Load", measure, -24, partnumber)
end

-- Call:
FCEndingRepeat_Test_Unlinkable(5, staff_to_part[3])
