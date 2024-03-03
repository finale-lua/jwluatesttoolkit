function FCCustomKeyModeDef_PropertyTests(obj)
   NumberPropertyTest(obj, "FCCustomKeyModeDef", "GoToKeyUnit", {1, 2, 4})
   NumberPropertyTest(obj, "FCCustomKeyModeDef", "HarmonicReference", {0, 1, 3, 7})
   BoolPropertyTest(obj, "FCCustomKeyModeDef", "HasClefAccidentalPlacements")
   NumberPropertyTest(obj, "FCCustomKeyModeDef", "MiddleKeyNumber", {48, 64, 125})
   NumberPropertyTest(obj, "FCCustomKeyModeDef", "TotalChromaticSteps", {0, 12, 31, 96, 192})
end


-- Call:
local obj = finale.FCCustomKeyModeDef()
AssureTrue(obj:Load(2), "FCCustomKeyModeDef:Load()")
FCCustomKeyModeDef_PropertyTests(obj)
