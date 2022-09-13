
function FCSeparateMeasureNumber_Test_Unlinkable(measure, staff)
    local sep_num = finale.FCSeparateMeasureNumber()
    sep_num:ConnectCell(finale.FCCell(measure, staff))
    local measnum_region = finale.FCMeasureNumberRegion()
    AssureTrue(measnum_region:Load(1), "FCSeparateMeasureNumber_Test_Unlinkable FCMeasureNumberRegion:Load(1) loaded.")
    -- Due to complications in how SaveNew works, we have to create it here before calling UnlinkableNumberPropertyTest
    local loaded_here = sep_num:LoadFirst()
    if not loaded_here then
        sep_num = finale.FCSeparateMeasureNumber()
        sep_num:ConnectCell(finale.FCCell(measure, staff))
        sep_num:AssignMeasureNumberRegion(measnum_region)
        AssureTrue(sep_num:SaveNew(), "FCSeparateMeasureNumber_Test_Unlinkable SaveNew()")
    end
    -- IsAlternateNumber and UseEnclosure are not unlinkable by design
    UnlinkableNumberPropertyTest(sep_num, "FCSeparateMeasureNumber", "HideOverride", "LoadFirst", nil, 1, staff_to_part[staff], skip_finale_version)
    UnlinkableNumberPropertyTest(sep_num, "FCSeparateMeasureNumber", "HorizontalPosition", "LoadFirst", nil, 256, staff_to_part[staff], skip_finale_version)
    -- UnlinkableNumberPropertyTest(sep_num, "FCSeparateMeasureNumber", "IsAlternateNumber", "LoadFirst", nil, 1, staff_to_part[staff], skip_finale_version)
    UnlinkableNumberPropertyTest(sep_num, "FCSeparateMeasureNumber", "ShowOverride", "LoadFirst", nil, 1, staff_to_part[staff], skip_finale_version)
    -- UnlinkableNumberPropertyTest(sep_num, "FCSeparateMeasureNumber", "UseEnclosure", "LoadFirst", nil, 1, staff_to_part[staff], skip_finale_version)
    UnlinkableNumberPropertyTest(sep_num, "FCSeparateMeasureNumber", "VerticalPosition", "LoadFirst", nil, 12, staff_to_part[staff], skip_finale_version)
    if not loaded_here then
        sep_num:DeleteData()
    end
end

-- Call:
FCSeparateMeasureNumber_Test_Unlinkable(12, 3)
FCSeparateMeasureNumber_Test_Unlinkable(13, 2)
