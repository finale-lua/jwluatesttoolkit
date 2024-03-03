function FCCustomKeyModeDef_PropertyTests(obj)
    TablePropertyTest(obj, "FCCustomKeyModeDef", "DiatonicStepsMap", {{0, 2, 4, 5, 7, 9, 11}, {0, 5, 10, 13, 18, 23, 29}, {0, 2, 4, 7, 9}})
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
