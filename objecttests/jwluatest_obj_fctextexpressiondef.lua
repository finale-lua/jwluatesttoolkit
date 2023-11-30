function FCTextExpressionDef_ValueTests_ItemNo1(exprdef)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "BreakMMRest", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "CategoryID", 1)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "ExecutableShapeID", 0)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "HideMeasureNumbers", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalAlignmentPoint", 13)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalJustification", finale.EXPRJUSTIFY_LEFT)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalOffset", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalOffset", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackPass", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackType", finale.EXPPLAYTYPE_KEYVELOCITY)
   if AssureNonNil(exprdef.GetPlaybackKeyVelocity) then
       AssureTrue(exprdef:GetPlaybackKeyVelocity() == 127, "FCTextExpressionDef:GetPlaybackKeyVelocity() == 127")
   end
   NumberValuePropertyTest_RO(exprdef, "FCTextExpressionDef", "TextID", 14)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryFont", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryPos", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseEnclosure", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseExecutableShape", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalAlignmentPoint", 9)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalBaselineOffset", 16)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalEntryOffset", -72)
end

-- Call:
local exprdef = finale.FCTextExpressionDef()
AssureTrue(exprdef:Load(1))
FCTextExpressionDef_ValueTests_ItemNo1(exprdef)



function FCTextExpressionDef_ValueTests_ItemNo2(exprdef)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "BreakMMRest", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "CategoryID", 1)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "ExecutableShapeID", 0)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "HideMeasureNumbers", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalAlignmentPoint", 13)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalJustification", finale.EXPRJUSTIFY_CENTER)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalOffset", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "RehearsalMarkStyle", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackPass", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackType", finale.EXPPLAYTYPE_KEYVELOCITY)
   if AssureNonNil(exprdef.GetPlaybackKeyVelocity) then
       AssureTrue(exprdef:GetPlaybackKeyVelocity() == 114, "FCTextExpressionDef:GetPlaybackKeyVelocity() == 114")
   end
   NumberValuePropertyTest_RO(exprdef, "FCTextExpressionDef", "TextID", 15)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryFont", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryPos", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseEnclosure", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseExecutableShape", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalAlignmentPoint", 9)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalBaselineOffset", 16)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalEntryOffset", -72)
end


-- Call:
local exprdef = finale.FCTextExpressionDef()
AssureTrue(exprdef:Load(2))
FCTextExpressionDef_ValueTests_ItemNo2(exprdef)




function FCTextExpressionDef_ValueTests_ItemNo3(exprdef)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "BreakMMRest", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "CategoryID", 1)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "ExecutableShapeID", 0)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "HideMeasureNumbers", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalAlignmentPoint", 13)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalJustification", finale.EXPRJUSTIFY_RIGHT)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalOffset", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackPass", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackType", finale.EXPPLAYTYPE_KEYVELOCITY)
   if AssureNonNil(exprdef.GetPlaybackKeyVelocity) then
       AssureTrue(exprdef:GetPlaybackKeyVelocity() == 101, "FCTextExpressionDef:GetPlaybackKeyVelocity() == 101")
   end
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "RehearsalMarkStyle", 0)
   NumberValuePropertyTest_RO(exprdef, "FCTextExpressionDef", "TextID", 16)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryFont", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryPos", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseEnclosure", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseExecutableShape", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalAlignmentPoint", 9)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalBaselineOffset", 16)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalEntryOffset", -72)
end


-- Call:
local exprdef = finale.FCTextExpressionDef()
AssureTrue(exprdef:Load(3))
FCTextExpressionDef_ValueTests_ItemNo3(exprdef)

function FCTextExpressionDef_ValueTests_ItemNo18(exprdef)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "BreakMMRest", true)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "CategoryID", 2)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "ExecutableShapeID", 0)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "HideMeasureNumbers", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalAlignmentPoint", 9)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalJustification", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalOffset", 1)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackPass", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackType", finale.EXPPLAYTYPE_TEMPO)
   if AssureNonNil(exprdef.GetPlaybackTempoValue) then
       AssureTrue(exprdef:GetPlaybackTempoValue() == 40, "FCTextExpressionDef:GetPlaybackTempoValue() == 40")
   end
   if AssureNonNil(exprdef.GetPlaybackTempoDuration) then
       AssureTrue(exprdef:GetPlaybackTempoDuration() == 1024, "FCTextExpressionDef:GetPlaybackTempoDuration() == 1024")
   end
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "RehearsalMarkStyle", 0)
   NumberValuePropertyTest_RO(exprdef, "FCTextExpressionDef", "TextID", 31)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryFont", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryPos", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseEnclosure", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseExecutableShape", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalAlignmentPoint", 3)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalBaselineOffset", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalEntryOffset", 0)
end


-- Call:
local exprdef = finale.FCTextExpressionDef()
AssureTrue(exprdef:Load(18), "FCTextExpressionDef:Load(18)")
FCTextExpressionDef_ValueTests_ItemNo18(exprdef)


function FCTextExpressionDef_ValueTests_ItemNo46(exprdef)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "BreakMMRest", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "CategoryID", 5)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "ExecutableShapeID", 0)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "HideMeasureNumbers", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalAlignmentPoint", 11)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalJustification", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalOffset", 4)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackPass", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackType", finale.EXPPLAYTYPE_TRANSPOSE)
   if AssureNonNil(exprdef.GetPlaybackTransposition) then
       AssureTrue(exprdef:GetPlaybackTransposition() == 12, "FCTextExpressionDef:GetPlaybackTransposition() == 12")
   end
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "RehearsalMarkStyle", 0)
   NumberValuePropertyTest_RO(exprdef, "FCTextExpressionDef", "TextID", 59)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryFont", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryPos", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseEnclosure", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseExecutableShape", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalAlignmentPoint", 4)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalBaselineOffset", -16)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalEntryOffset", 36)
end


-- Call:
local exprdef = finale.FCTextExpressionDef()
AssureTrue(exprdef:Load(46), "FCTextExpressionDef:Load(46)")
FCTextExpressionDef_ValueTests_ItemNo46(exprdef)



function FCTextExpressionDef_ValueTests_ItemNo70(exprdef)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "BreakMMRest", true)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "CategoryID", 6)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "ExecutableShapeID", 0)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "HideMeasureNumbers", true)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalAlignmentPoint", 12)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalJustification", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalOffset", 100)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackPass", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackType", finale.EXPPLAYTYPE_NONE)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "RehearsalMarkStyle", finale.REHMARKSTYLE_NUMBER)
   NumberValuePropertyTest_RO(exprdef, "FCTextExpressionDef", "TextID", 83)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryFont", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryPos", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseEnclosure", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseExecutableShape", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalAlignmentPoint", 5)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalBaselineOffset", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalEntryOffset", 0)
end


-- Call:
local exprdef = finale.FCTextExpressionDef()
AssureTrue(exprdef:Load(70), "FCTextExpressionDef:Load(70)")
FCTextExpressionDef_ValueTests_ItemNo70(exprdef)



function FCTextExpressionDef_ValueTests_ItemNo72(exprdef)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "BreakMMRest", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "CategoryID", 5)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "ExecutableShapeID", 0)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "HideMeasureNumbers", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalAlignmentPoint", 11)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalJustification", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalOffset", 4)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackPass", 2)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackType", finale.EXPPLAYTYPE_SWING)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "RehearsalMarkStyle", 0)
   NumberValuePropertyTest_RO(exprdef, "FCTextExpressionDef", "TextID", 93)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryFont", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryPos", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseEnclosure", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseExecutableShape", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalAlignmentPoint", 4)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalBaselineOffset", -16)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalEntryOffset", 36)
end


-- Call:
local exprdef = finale.FCTextExpressionDef()
AssureTrue(exprdef:Load(72), "FCTextExpressionDef:Load(72)")
FCTextExpressionDef_ValueTests_ItemNo72(exprdef)


function FCTextExpressionDef_ValueTests_ItemNo73(exprdef)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "BreakMMRest", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "CategoryID", 4)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "ExecutableShapeID", 0)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "HideMeasureNumbers", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalAlignmentPoint", 10)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalJustification", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalOffset", 3)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackPass", 3)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackType", finale.EXPPLAYTYPE_PITCHWHEEL)
   if AssureNonNil(exprdef.GetPitchWheelValue) then
       AssureTrue(exprdef:GetPitchWheelValue() == 7000, "FCTextExpressionDef:GetPitchWheelValue() == 7000")
   end
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "RehearsalMarkStyle", 0)
   NumberValuePropertyTest_RO(exprdef, "FCTextExpressionDef", "TextID", 94)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryFont", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryPos", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseEnclosure", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseExecutableShape", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalAlignmentPoint", 1)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalBaselineOffset", 1)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalEntryOffset", -36)
end


-- Call:
local exprdef = finale.FCTextExpressionDef()
AssureTrue(exprdef:Load(73), "FCTextExpressionDef:Load(73)")
FCTextExpressionDef_ValueTests_ItemNo73(exprdef)



function FCTextExpressionDef_ValueTests_ItemNo74(exprdef)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "BreakMMRest", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "CategoryID", 4)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "ExecutableShapeID", 0)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "HideMeasureNumbers", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalAlignmentPoint", 10)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalJustification", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalOffset", 3)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackPass", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackType", finale.EXPPLAYTYPE_HUMANPLAYBACKON)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "RehearsalMarkStyle", 0)
   NumberValuePropertyTest_RO(exprdef, "FCTextExpressionDef", "TextID", 95)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryFont", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryPos", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseEnclosure", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseExecutableShape", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalAlignmentPoint", 1)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalBaselineOffset", 1)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalEntryOffset", -36)
end


-- Call:
local exprdef = finale.FCTextExpressionDef()
AssureTrue(exprdef:Load(74), "FCTextExpressionDef:Load(74)")
FCTextExpressionDef_ValueTests_ItemNo74(exprdef)


function FCTextExpressionDef_ValueTests_ItemNo75(exprdef)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "BreakMMRest", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "CategoryID", 4)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "ExecutableShapeID", 0)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "HideMeasureNumbers", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalAlignmentPoint", 10)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalJustification", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "HorizontalOffset", 3)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackPass", 0)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "PlaybackType", finale.EXPPLAYTYPE_HUMANPLAYBACKOFF)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "RehearsalMarkStyle", 0)
   NumberValuePropertyTest_RO(exprdef, "FCTextExpressionDef", "TextID", 96)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryFont", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryPos", true)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseEnclosure", false)
   BoolValuePropertyTest(exprdef, "FCTextExpressionDef", "UseExecutableShape", false)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalAlignmentPoint", 1)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalBaselineOffset", 1)
   NumberValuePropertyTest(exprdef, "FCTextExpressionDef", "VerticalEntryOffset", -36)
end


-- Call:
local exprdef = finale.FCTextExpressionDef()
AssureTrue(exprdef:Load(75), "FCTextExpressionDef:Load(75)")
FCTextExpressionDef_ValueTests_ItemNo75(exprdef)
