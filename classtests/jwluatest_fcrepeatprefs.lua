function FCRepeatPrefs_PropertyTests(repeatprefs)
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "AfterClefSpace", {-345, 0, 456})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "AfterKeySpace", {-346, 0, 457})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "AfterTimeSpace", {-347, 0, 458})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "BackToBackStyle", {finale.REPBACKTOBACK_THIN, finale.REPBACKTOBACK_MIXED, finale.REPBACKTOBACK_THICK})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "BackwardSpace", {-341, 0, 452})
   BoolPropertyTest(repeatprefs, "FCRepeatPrefs", "DotAfterNumber")
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "EndingBackHookLength", {-343, 0, 454})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "EndingBracketHeight", {-355, 0, 466})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "EndingFrontHookLength", {-375, 0, 486})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "EndingHorizontalText", {-385, 0, 496})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "EndingInsetEnd", {-415, 0, 416})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "EndingInsetStart", {-425, 0, 426})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "EndingLineThickness", {-435, 0, 436})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "EndingVerticalText", {-445, 0, 446})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "ForwardSpace", {-455, 0, 466})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "HeavyLineThickness", {-465, 0, 476})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "MaxPasses", {0, 2, 25})
   BoolPropertyTest(repeatprefs, "FCRepeatPrefs", "ShowOnTopStaffOnly")
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "ShowOnStaffListID", {0, 2, 25})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "SpaceBetweenLines", {-475, 0, 486})
   BoolPropertyTest(repeatprefs, "FCRepeatPrefs", "ThinInnerBracketReference")
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "ThinLineThickness", {-485, 0, 496})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "VerticalBottomDotAdjustment", {-495, 0, 406})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "VerticalTopDotAdjustment", {-449, 0, 459})
   NumberPropertyTest(repeatprefs, "FCRepeatPrefs", "WingStyle", {finale.REPWING_NONE, finale.REPWING_SINGLE, finale.REPWING_DOUBLE, finale.REPWING_CURVED})
end


-- Call:
local repeatprefs = finale.FCRepeatPrefs()
AssureTrue(repeatprefs:Load(1), "FCRepeatPrefs:Load()")
FCRepeatPrefs_PropertyTests(repeatprefs)
