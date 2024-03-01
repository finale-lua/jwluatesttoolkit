function FCStaffStyleAssign_ValueTests_ItemNo1_0(obj)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "EndMeasure", 59)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "EndMeasurePos", 2047)
   NumberValuePropertyTest_RO(obj, "FCStaffStyleAssign", "Staff", 1)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "StartMeasure", 58)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "StartMeasurePos", 1536)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "StyleID", 3)
end


-- Call:
local obj = finale.FCStaffStyleAssign()
AssureTrue(obj:Load(1, 0), "FCStaffStyleAssign:Load(1, 0)")
FCStaffStyleAssign_ValueTests_ItemNo1_0(obj)


function FCStaffStyleAssign_ValueTests_ItemNo2_0(obj)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "EndMeasure", 61)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "EndMeasurePos", 2147483647)
   NumberValuePropertyTest_RO(obj, "FCStaffStyleAssign", "Staff", 2)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "StartMeasure", 60)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "StartMeasurePos", 0)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "StyleID", 28)
end


-- Call:
local obj = finale.FCStaffStyleAssign()
AssureTrue(obj:Load(2, 0), "FCStaffStyleAssign:Load(2, 0)")
FCStaffStyleAssign_ValueTests_ItemNo2_0(obj)


function FCStaffStyleAssign_ValueTests_ItemNo2_1(obj)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "EndMeasure", 61)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "EndMeasurePos", 2147483647)
   NumberValuePropertyTest_RO(obj, "FCStaffStyleAssign", "Staff", 2)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "StartMeasure", 60)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "StartMeasurePos", 0)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "StyleID", 29)
end


-- Call:
local obj = finale.FCStaffStyleAssign()
AssureTrue(obj:Load(2, 1), "FCStaffStyleAssign:Load(2, 1)")
FCStaffStyleAssign_ValueTests_ItemNo2_1(obj)


function FCStaffStyleAssign_ValueTests_ItemNo3_0(obj)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "EndMeasure", 61)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "EndMeasurePos", 2147483647)
   NumberValuePropertyTest_RO(obj, "FCStaffStyleAssign", "Staff", 3)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "StartMeasure", 59)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "StartMeasurePos", 0)
   NumberValuePropertyTest(obj, "FCStaffStyleAssign", "StyleID", 12)
end


-- Call:
local obj = finale.FCStaffStyleAssign()
AssureTrue(obj:Load(3, 0), "FCStaffStyleAssign:Load(3, 0)")
FCStaffStyleAssign_ValueTests_ItemNo3_0(obj)
