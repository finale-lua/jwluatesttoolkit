function FCEndingRepeat_PropertyTests(endingrepeat)
   NumberPropertyTest(endingrepeat, "FCEndingRepeat", "HorizontalLeftBracketPosition", {-342, 0, 453})
   NumberPropertyTest(endingrepeat, "FCEndingRepeat", "HorizontalRightBracketPosition", {-343, 0, 454})
   NumberPropertyTest(endingrepeat, "FCEndingRepeat", "HorizontalTextPosition", {-344, 0, 455})
   BoolPropertyTest(endingrepeat, "FCEndingRepeat", "IndividualPositioning")
   NumberPropertyTest_RO(endingrepeat, "FCEndingRepeat", "PassNumbersCount")
   NumberPropertyTest(endingrepeat, "FCEndingRepeat", "ShowMode", {finale.REPSHOW_ALL, finale.REPSHOW_TOPSTAFF, finale.REPSHOW_STAFFLIST})
   BoolPropertyTest(endingrepeat, "FCEndingRepeat", "SkipOnIgnore")
   NumberPropertyTest(endingrepeat, "FCEndingRepeat", "StaffListID", {0, 2, 8})
   NumberPropertyTest(endingrepeat, "FCEndingRepeat", "TargetMeasure", {-5, -1, 0, 1, 10})   
   NumberPropertyTest(endingrepeat, "FCEndingRepeat", "TargetTrigger", {finale.REPTARGET_MEASURENUM,
           finale.REPTARGET_NEVERSKIPENDING, finale.REPTARGET_FORWARDS, finale.REPTARGET_NEXTENDING})
   NumberPropertyTest(endingrepeat, "FCEndingRepeat", "VerticalLeftBracketPosition", {-345, 0, 456})
   NumberPropertyTest(endingrepeat, "FCEndingRepeat", "VerticalRightBracketPosition", {-346, 0, 457})
   NumberPropertyTest(endingrepeat, "FCEndingRepeat", "VerticalTextPosition", {-347, 0, 458})   
   NumberPropertyTest(endingrepeat, "FCEndingRepeat", "VerticalTopBracketPosition", {-348, 0, 459})
   BoolPropertyTest(endingrepeat, "FCEndingRepeat", "Visible")
end

-- Call:
local endingrepeat = finale.FCEndingRepeat()
AssureTrue(endingrepeat:Load(4), "FCEndingRepeat:Load()")
FCEndingRepeat_PropertyTests(endingrepeat)
