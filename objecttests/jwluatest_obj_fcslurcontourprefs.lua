function FCSlurContourPrefs_ValueTests_ItemNo1(prefs)
    AssureEqual(prefs:CalcHeight(1234), 82, "FCSlurContourPrefs:CalcHeight")
    AssureEqual(prefs:CalcInset(522), 471, "FCSlurContourPrefs:CalcInset")
    NumberValuePropertyTest(prefs, "FCSlurContourPrefs", "ExtraLongHeight", 80)
    NumberValuePropertyTest(prefs, "FCSlurContourPrefs", "ExtraLongInset", 369)
    NumberValuePropertyTest(prefs, "FCSlurContourPrefs", "ExtraLongSpan", 1152)
    NumberValuePropertyTest(prefs, "FCSlurContourPrefs", "LongHeight", 72)
    NumberValuePropertyTest(prefs, "FCSlurContourPrefs", "LongInset", 410)
    NumberValuePropertyTest(prefs, "FCSlurContourPrefs", "LongSpan", 864)
    NumberValuePropertyTest(prefs, "FCSlurContourPrefs", "MediumHeight", 60)
    NumberValuePropertyTest(prefs, "FCSlurContourPrefs", "MediumInset", 512)
    NumberValuePropertyTest(prefs, "FCSlurContourPrefs", "MediumSpan", 288)
    NumberValuePropertyTest(prefs, "FCSlurContourPrefs", "ShortHeight", 16)
    NumberValuePropertyTest(prefs, "FCSlurContourPrefs", "ShortInset", 614)
    NumberValuePropertyTest(prefs, "FCSlurContourPrefs", "ShortSpan", 36)
end


-- Call:
local smartshape_prefs = finale.FCSmartShapePrefs()
if not AssureNonNil(smartshape_prefs.CreateSlurContourPrefs, "FCSmartShapePrefs.CreateSlurContourPrefs") then
    return
end
AssureTrue(smartshape_prefs:Load(1), "FCSmartShapePrefs:Load(1)")
local slur_prefs = smartshape_prefs:CreateSlurContourPrefs()
if AssureNonNil(slur_prefs, "FCSmartShapePrefs.CreateSlurContourPrefs") then
    FCSlurContourPrefs_ValueTests_ItemNo1(slur_prefs)
end
