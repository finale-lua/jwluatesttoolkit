
function FCTuplet_Test_Unlinkable(measure, staff, entrynumber)
    local entry = LoadMeasureEntry(measure, staff, entrynumber)
    if AssureNonNil(entry, "LoadMeasureEntry("..measure..", "..staff..", "..entrynumber..")") then
        local tuplet = finale.FCTuplet()
        tuplet:SetNoteEntry(entry)
        -- Commented properties are not unlinkable
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "AllowHorizontalDrag", "LoadFirst", nil, 24, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "AlwaysFlat", "LoadFirst", nil, 24, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "AvoidStaff", "LoadFirst", nil, 24, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "BracketFullDuration", "LoadFirst", nil, 24, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "BracketMode", "LoadFirst", nil, 1, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "BreakSlurBracket", "LoadFirst", nil, 24, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "CenterUsingDuration", "LoadFirst", nil, 24, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "EngraverTuplet", "LoadFirst", nil, 24, staff_to_part[staff]) 
        UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "HorizontalOffset", "LoadFirst", nil, -24, staff_to_part[staff]) 
        UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "HorizontalShapeOffset", "LoadFirst", nil, 24, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "IgnoreNumberOffset", "LoadFirst", nil, 24, staff_to_part[staff]) 
        UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "LeftExtension", "LoadFirst", nil, 24, staff_to_part[staff])
        UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "LeftHookLength", "LoadFirst", nil, 24, staff_to_part[staff])
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "MatchHookLengths", "LoadFirst", nil, 24, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "NumberStyle", "LoadFirst", nil, 1, staff_to_part[staff]) 
        UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "PlacementMode", "LoadFirst", nil, 1, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "ReferenceDuration", "LoadFirst", nil, 128, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "ReferenceNumber", "LoadFirst", nil, 1, staff_to_part[staff]) 
        UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "RightExtension", "LoadFirst", nil, -24, staff_to_part[staff])
        UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "RightHookLength", "LoadFirst", nil, -24, staff_to_part[staff])
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "ShapeStyle", "LoadFirst", nil, 1, staff_to_part[staff]) 
        UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "SlopeAdjust", "LoadFirst", nil, -24, staff_to_part[staff])
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "SymbolicDuration", "LoadFirst", nil, 128, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "SymbolicNumber", "LoadFirst", nil, 1, staff_to_part[staff]) 
        --UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "UseBottomNote", "LoadFirst", nil, 24, staff_to_part[staff]) 
        UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "VerticalOffset", "LoadFirst", nil, 24, staff_to_part[staff])         
        UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "VerticalShapeOffset", "LoadFirst", nil, -24, staff_to_part[staff]) 
        UnlinkableNumberPropertyTest(tuplet, "FCTuplet", "Visible", "LoadFirst", nil, -24, staff_to_part[staff]) 
    end
end


-- Call:
FCTuplet_Test_Unlinkable(29, 2, 307)