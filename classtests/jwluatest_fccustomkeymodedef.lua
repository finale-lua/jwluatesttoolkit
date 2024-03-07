function FCCustomKeyModeDef_PropertyTests(obj)
    TablePropertyTest(obj, "FCCustomKeyModeDef", "DiatonicStepsMap", {{0, 2, 4, 5, 7, 9, 11}, {0, 5, 6, 7, 8, 10}, {0, 2, 4, 7, 9}})
    NumberPropertyTest(obj, "FCCustomKeyModeDef", "GoToKeyUnit", {1, 2, 4})
    NumberPropertyTest(obj, "FCCustomKeyModeDef", "HarmonicReference", {0, 1, 3, 7})
    BoolPropertyTest(obj, "FCCustomKeyModeDef", "HasClefAccidentalPlacements")
    NumberPropertyTest(obj, "FCCustomKeyModeDef", "MiddleKeyNumber", {48, 64, 125})
    NumberPropertyTest(obj, "FCCustomKeyModeDef", "SymbolListID", {0, 1, 3, 37})
    TablePropertyTest(obj, "FCCustomKeyModeDef", "TonalCenters", {
                {[0]=1, [1]=2, [2]=2, [3]=3, [4]=4, [5]=5, [6]=6, [7]=0},
                {[-1]=1, [-2]=2,[-3]=3, [-4]=4, [-5]=5, [-6]=6, [-7]=0},
                {[-1]=1, [-2]=2,[-3]=3, [-4]=4, [-5]=5, [-6]=6, [-7]=0, [0]=1, [1]=2, [2]=2, [3]=3, [4]=4, [5]=5, [6]=6, [7]=0}
            })
    NumberPropertyTest(obj, "FCCustomKeyModeDef", "TotalChromaticSteps", {0, 12, 31, 96, 192})
end


-- Call:
local obj = finale.FCCustomKeyModeDef()
AssureTrue(obj:Load(0x4000), "FCCustomKeyModeDef:Load()") -- 0x4000 because has a non-zero tonal center
FCCustomKeyModeDef_PropertyTests(obj)
