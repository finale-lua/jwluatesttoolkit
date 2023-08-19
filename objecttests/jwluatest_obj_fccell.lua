local function check_cell_key_value(measure, staff, expected_value)
    local cell = finale.FCCell(measure, staff)
    if AssureNonNil(cell.CreateCurrentVisibleKeySignature, "FCCell.CreateCurrentVisibleKeySignature") then
        local tranposed_key = cell:CreateCurrentVisibleKeySignature()
        local concert_key = cell:CreateCurrentVisibleKeySignature(true)
        AssureEqual(concert_key.ID, cell:GetKeySignature().ID, "FCCell ("..measure..", "..staff..") concert_key equals GetKeySignature")
        AssureEqual(tranposed_key.ID, expected_value, "FCCell ("..measure..", "..staff..") concert_key equals expected value ["..expected_value.."]")
    end
end

check_cell_key_value(59, 1, 252) -- expect Ab Major
check_cell_key_value(59, 3, 5) -- expect B Major
check_cell_key_value(60, 2, 0) -- expect C Major
check_cell_key_value(60, 3, 0x100 + 255) -- expect d minor
