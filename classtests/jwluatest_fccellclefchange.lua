function FCCellClefChange_PropertyTests(obj)
   BoolPropertyTest(obj, "FCCellClefChange", "AllowVerticalDrag")
   BoolPropertyTest(obj, "FCCellClefChange", "ClefAfterBarline")
   NumberPropertyTest(obj, "FCCellClefChange", "ClefIndex", {0, 3, 13, 15})
   NumberPropertyTest(obj, "FCCellClefChange", "ClefPercent", {-12, 0, 12, 23, 73, 100, 113})
   NumberPropertyTest(obj, "FCCellClefChange", "ClefShow", {finale.SHOWCLEF_NORMAL, finale.SHOWCLEF_HIDE, finale.SHOWCLEF_ALWAYS})
   NumberPropertyTest(obj, "FCCellClefChange", "HorizontalOffset", {-144, -60, 0, 23, 147})
   NumberPropertyTest(obj, "FCCellClefChange", "MeasurePos", {1, 23, 1024, 2048})
   NumberPropertyTest(obj, "FCCellClefChange", "VerticalOffset", {-144, -60, 0, 23, 147})
end

function FCCellClefChange_Test_Properties(measure, staff)
    local frame_hold = finale.FCCellFrameHold()
    frame_hold:ConnectCell(finale.FCCell(measure, staff))
    frame_hold:Load()
    if not AssureTrue(frame_hold:Load(), "FCCellClefChange_Test_Properties FCCellFrameHold:Load()") then return end
    if not AssureTrue(frame_hold.IsClefList, "FCCellClefChange_Test_Properties frame_hold.IsClefList") then return end
    local clef_changes = frame_hold:CreateCellClefChanges()
    for clef_change in each(clef_changes) do
        if clef_change.MeasurePos > 0 then
            FCCellClefChange_PropertyTests(clef_change)
        end
    end
end

-- Call:

FCCellClefChange_Test_Properties(6, 2)

