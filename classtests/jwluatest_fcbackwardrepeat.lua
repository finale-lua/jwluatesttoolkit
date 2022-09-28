function FCBackwardRepeat_PropertyTests(backwardrepeat)
   NumberPropertyTest(backwardrepeat, "FCBackwardRepeat", "Action", {finale.REPACTION_ALWAYSJUMP, finale.REPACTION_JUMPONPASS, finale.REPACTION_PLAYSECTION})
   NumberPropertyTest(backwardrepeat, "FCBackwardRepeat", "BottomBracketPosition", {-162, 0, 333})
   BoolPropertyTest(backwardrepeat, "FCBackwardRepeat", "IndividualPositioning")
   NumberPropertyTest(backwardrepeat, "FCBackwardRepeat", "LeftBracketPosition", {-161, 0, 332})
   BoolPropertyTest(backwardrepeat, "FCBackwardRepeat", "ResetOnRepeatAction")
   NumberPropertyTest(backwardrepeat, "FCBackwardRepeat", "RightBracketPosition", {-160, 0, 331})
   NumberPropertyTest(backwardrepeat, "FCBackwardRepeat", "ShowMode", {finale.REPSHOW_TOPSTAFF, finale.REPSHOW_STAFFLIST, finale.REPSHOW_ALL} )
   NumberPropertyTest(backwardrepeat, "FCBackwardRepeat", "StaffListID", {0, 2, 7})
   NumberPropertyTest(backwardrepeat, "FCBackwardRepeat", "TargetMeasure", {-5, 0, 12})
   NumberPropertyTest(backwardrepeat, "FCBackwardRepeat", "TargetTrigger", {finale.REPTARGET_NEXTENDING, finale.REPTARGET_MEASURENUM, finale.REPTARGET_FORWARDS})
   NumberPropertyTest(backwardrepeat, "FCBackwardRepeat", "TopBracketPosition", {-159, 0, 330})
   NumberPropertyTest(backwardrepeat, "FCBackwardRepeat", "TotalPasses", {0, 1, 6})
   BoolPropertyTest(backwardrepeat, "FCBackwardRepeat", "Visible")   
end


-- Call:
local backwardrepeat = finale.FCBackwardRepeat()
AssureTrue(backwardrepeat:Load(8))
FCBackwardRepeat_PropertyTests(backwardrepeat)

