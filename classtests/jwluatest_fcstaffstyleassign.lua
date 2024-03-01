function FCStaffStyleAssign_PropertyTests(obj)
   NumberPropertyTest(obj, "FCStaffStyleAssign", "EndMeasure", {1, 37, 54})
   NumberPropertyTest(obj, "FCStaffStyleAssign", "EndMeasurePos", {0, 127, 0x7fffffff})
   NumberPropertyTest_RO(obj, "FCStaffStyleAssign", "Staff", {1, 2, 3})
   NumberPropertyTest(obj, "FCStaffStyleAssign", "StartMeasure", {1, 37, 54})
   NumberPropertyTest(obj, "FCStaffStyleAssign", "StartMeasurePos", {0, 128, 2048})
   NumberPropertyTest(obj, "FCStaffStyleAssign", "StyleID", {1, 3, 7})
end


-- Call:
local obj = finale.FCStaffStyleAssign()
AssureTrue(obj:Load(3, 0), "FCStaffStyleAssign:Load()")
FCStaffStyleAssign_PropertyTests(obj)
