function FCTuplet_ValueTests_Entry29_2_307(tuplet)
   BoolValuePropertyTest(tuplet, "FCTuplet", "AllowHorizontalDrag", false)
   BoolValuePropertyTest(tuplet, "FCTuplet", "AlwaysFlat", false)
   BoolValuePropertyTest(tuplet, "FCTuplet", "AvoidStaff", true)
   BoolValuePropertyTest(tuplet, "FCTuplet", "BracketFullDuration", false)
   NumberValuePropertyTest(tuplet, "FCTuplet", "BracketMode", 0)
   BoolValuePropertyTest(tuplet, "FCTuplet", "BreakSlurBracket", true)
   BoolValuePropertyTest(tuplet, "FCTuplet", "CenterUsingDuration", false)
   BoolValuePropertyTest(tuplet, "FCTuplet", "EngraverTuplet", true)
   NumberValuePropertyTest(tuplet, "FCTuplet", "HorizontalOffset", 0)
   NumberValuePropertyTest(tuplet, "FCTuplet", "HorizontalShapeOffset", 0)
   BoolValuePropertyTest(tuplet, "FCTuplet", "IgnoreNumberOffset", false)
   NumberValuePropertyTest(tuplet, "FCTuplet", "LeftExtension", 0)
   NumberValuePropertyTest(tuplet, "FCTuplet", "LeftHookLength", 12)
   BoolValuePropertyTest(tuplet, "FCTuplet", "MatchHookLengths", true)
   NumberValuePropertyTest(tuplet, "FCTuplet", "NumberStyle", 1)
   NumberValuePropertyTest(tuplet, "FCTuplet", "PlacementMode", 1)
   NumberValuePropertyTest(tuplet, "FCTuplet", "ReferenceDuration", 512)
   NumberValuePropertyTest(tuplet, "FCTuplet", "ReferenceNumber", 2)
   NumberValuePropertyTest(tuplet, "FCTuplet", "RightExtension", 0)
   NumberValuePropertyTest(tuplet, "FCTuplet", "RightHookLength", 12)
   NumberValuePropertyTest(tuplet, "FCTuplet", "ShapeStyle", 1)
   NumberValuePropertyTest(tuplet, "FCTuplet", "SlopeAdjust", 0)
   NumberValuePropertyTest(tuplet, "FCTuplet", "SymbolicDuration", 512)
   NumberValuePropertyTest(tuplet, "FCTuplet", "SymbolicNumber", 3)
   BoolValuePropertyTest(tuplet, "FCTuplet", "UseBottomNote", false)
   NumberValuePropertyTest(tuplet, "FCTuplet", "VerticalOffset", 24)
   NumberValuePropertyTest(tuplet, "FCTuplet", "VerticalShapeOffset", 0)
   BoolValuePropertyTest(tuplet, "FCTuplet", "Visible", true)
end


-- Call:
local entry = LoadMeasureEntry(29, 2, 307)
if AssureNonNil(entry, "FCTuplet_ValueTests load entry") then
    local obj = finale.FCTuplet()
    obj:SetNoteEntry(entry)
    if AssureTrue(obj:LoadFirst(), "FCTuplet_ValueTests LoadFirst") then
        FCTuplet_ValueTests_Entry29_2_307(obj)
    end
end
