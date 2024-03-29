function FCClefDef_ValueTests_ItemNo2(obj)
   NumberValuePropertyTest(obj, "FCClefDef", "BaselineOffset", 0)
   NumberValuePropertyTest_RO(obj, "FCClefDef", "ClefIndex", 2)
   NumberValuePropertyTest(obj, "FCClefDef", "ClefPosition", -2)
   BoolValuePropertyTest(obj, "FCClefDef", "IsShape", false)
   NumberValuePropertyTest(obj, "FCClefDef", "ShapeID", 0)
   NumberValuePropertyTest(obj, "FCClefDef", "Symbol", 66)
   BoolValuePropertyTest(obj, "FCClefDef", "UseCustomFont", false)
   NumberValuePropertyTest(obj, "FCClefDef", "VerticalAdjust", -2)
end


-- Call:
local obj = finale.FCClefDef()
AssureTrue(obj:Load(2), "FCClefDef:Load(2)")
FCClefDef_ValueTests_ItemNo2(obj)


function FCClefDef_ValueTests_ItemNo17(obj)
   NumberValuePropertyTest(obj, "FCClefDef", "BaselineOffset", 0)
   NumberValuePropertyTest_RO(obj, "FCClefDef", "ClefIndex", 17)
   NumberValuePropertyTest(obj, "FCClefDef", "ClefPosition", 0)
   BoolValuePropertyTest(obj, "FCClefDef", "IsShape", true)
   NumberValuePropertyTest(obj, "FCClefDef", "ShapeID", 3)
   NumberValuePropertyTest(obj, "FCClefDef", "Symbol", 0)
   BoolValuePropertyTest(obj, "FCClefDef", "UseCustomFont", false)
   NumberValuePropertyTest(obj, "FCClefDef", "VerticalAdjust", -10)
end


-- Call:
local obj = finale.FCClefDef()
AssureTrue(obj:Load(17), "FCClefDef:Load(17)")
FCClefDef_ValueTests_ItemNo17(obj)
