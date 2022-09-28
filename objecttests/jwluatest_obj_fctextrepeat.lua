
function FCTextRepeat_ValueTests_ItemNo2_0(textrepeat)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "Action", finale.REPACTION_NEVERJUMP)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "AutoUpdateTarget", false)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "HorizontalPos", 46)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "ID", 7)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "IndividualPositioning", false)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "JumpIfIgnore", false)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "ResetOnRepeat", false)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "ShowMode", finale.REPSHOW_ALL)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "StaffListID", 0)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "Target", 0)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "TargetTrigger", finale.REPTARGET_MEASURENUM)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "TotalPasses", 0)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "VerticalPos", 40)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "Visible", true)
end


-- Call:
local textrepeat = finale.FCTextRepeat()
AssureTrue(textrepeat:Load(2, 0))
FCTextRepeat_ValueTests_ItemNo2_0(textrepeat)



function FCTextRepeat_ValueTests_ItemNo3_0(textrepeat)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "Action", finale.REPACTION_STOPONPASS)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "AutoUpdateTarget", false)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "HorizontalPos", -267)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "ID", 6)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "IndividualPositioning", true)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "JumpIfIgnore", false)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "ResetOnRepeat", false)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "ShowMode", finale.REPSHOW_TOPSTAFF)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "StaffListID", 0)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "Target", 0)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "TargetTrigger", finale.REPTARGET_UNDEFINED)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "TotalPasses", 1)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "VerticalPos", 49)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "Visible", true)
end


-- Call:
local textrepeat = finale.FCTextRepeat()
AssureTrue(textrepeat:Load(3, 0))
FCTextRepeat_ValueTests_ItemNo3_0(textrepeat)



function FCTextRepeat_ValueTests_ItemNo14_0(textrepeat)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "Action", finale.REPACTION_ALWAYSJUMP)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "AutoUpdateTarget", true)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "HorizontalPos", 97)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "ID", 9)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "IndividualPositioning", false)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "JumpIfIgnore", true)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "ResetOnRepeat", false)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "ShowMode", finale.REPSHOW_ALL)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "StaffListID", 0)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "Target", 3)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "TargetTrigger", finale.REPTARGET_MEASURENUM)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "TotalPasses", 0)
   NumberValuePropertyTest(textrepeat, "FCTextRepeat", "VerticalPos", 19)
   BoolValuePropertyTest(textrepeat, "FCTextRepeat", "Visible", false)
end


-- Call:
local textrepeat = finale.FCTextRepeat()
AssureTrue(textrepeat:Load(14, 0))
FCTextRepeat_ValueTests_ItemNo14_0(textrepeat)
