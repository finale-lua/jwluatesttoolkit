function FCSlurContourPrefs_ValueTests_ItemNo1(prefs)
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
local prefs = finale.FCSlurContourPrefs()
AssureTrue(prefs:Load(1), "FCSlurContourPrefs:Load(1)")
FCSlurContourPrefs_ValueTests_ItemNo1(prefs)
