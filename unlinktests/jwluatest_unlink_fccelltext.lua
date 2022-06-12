
function FCCellText_Test_Unlinkable(measure, staff, partnumber)
    local cell_texts = finale.FCCellTexts()
    if not AssureTrue(cell_texts:LoadAllInCell(finale.FCCell(measure, staff))>0, "FCCellTexts:LoadAllInCell loaded items") then return end
    for cell_text in each(cell_texts) do
        UnlinkableNumberPropertyTest(cell_text, "FCCellText", "MeasurePos", "Reload", nil, 256, partnumber, skip_finale_version)
        UnlinkableNumberPropertyTest(cell_text, "FCCellText", "VerticalPos", "Reload", nil, 12, partnumber, skip_finale_version)
    end
end

-- Call:
FCCellText_Test_Unlinkable(12, 1, 3)
