
function FCCellClefChange_Test_Unlinkable(measure, staff)
    local frame_hold = finale.FCCellFrameHold()
    frame_hold:ConnectCell(finale.FCCell(measure, staff))
    frame_hold:Load()
    if not AssureTrue(frame_hold:Load(), "FCCellClefChange_Test_Unlinkable FCCellFrameHold:Load()") then return end
    if not AssureTrue(frame_hold.IsClefList, "FCCellClefChange_Test_Unlinkable frame_hold.IsClefList") then return end
    local clef_changes = frame_hold:CreateCellClefChanges()
    for clef_change in each(clef_changes) do
        if clef_change.MeasurePos > 0 then
            local clef_show_increment = clef_change.ClefShow == finale.SHOWCLEF_ALWAYS and -1 or 1
            UnlinkableNumberPropertyTest(clef_change, "FCCellClefChange", "AllowVerticalDrag", "Reload", nil, -144, staff_to_part[staff], skip_finale_version)
            UnlinkableNumberPropertyTest(clef_change, "FCCellClefChange", "ClefAfterBarline", "Reload", nil, -144, staff_to_part[staff], skip_finale_version)
            UnlinkableNumberPropertyTest(clef_change, "FCCellClefChange", "ClefIndex", "Reload", nil, clef_change.ClefIndex + 1, staff_to_part[staff], skip_finale_version)
            UnlinkableNumberPropertyTest(clef_change, "FCCellClefChange", "ClefPercent", "Reload", nil, -10, staff_to_part[staff], skip_finale_version)
            UnlinkableNumberPropertyTest(clef_change, "FCCellClefChange", "ClefShow", "Reload", nil, clef_show_increment, staff_to_part[staff], skip_finale_version)
            UnlinkableNumberPropertyTest(clef_change, "FCCellClefChange", "HorizontalOffset", "Reload", nil, -144, staff_to_part[staff], skip_finale_version)
            UnlinkableNumberPropertyTest(clef_change, "FCCellClefChange", "MeasurePos", "Reload", nil, 8, staff_to_part[staff], skip_finale_version)
            UnlinkableNumberPropertyTest(clef_change, "FCCellClefChange", "VerticalOffset", "Reload", nil, 12, staff_to_part[staff], skip_finale_version)
        end
    end
end

-- Call:
if false then
    FCCellClefChange_Test_Unlinkable(6, 2)
end
