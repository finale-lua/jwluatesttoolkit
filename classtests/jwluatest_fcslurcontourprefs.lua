function FCSlurContourPrefs_PropertyTests(prefs)
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "ExtraLongHeight", {-144, 0, 144})
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "ExtraLongInset", {-144, 0, 144})
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "ExtraLongSpan", {12, 245, 1256})
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "LongHeight", {-144, 0, 144})
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "LongInset", {-144, 0, 144})
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "LongSpan", {12, 245, 1256})
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "MediumHeight", {-144, 0, 144})
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "MediumInset", {-144, 0, 144})
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "MediumSpan", {12, 245, 1256})
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "ShortHeight", {-144, 0, 144})
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "ShortInset", {-144, 0, 144})
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "ShortSpan", {12, 245, 125})
end


-- Call:
if not AssureNonNil(finale.FCSlurContourPrefs, "finale.FCSlurContourPrefs") then
    return
end

local prefs = finale.FCSlurContourPrefs()
AssureTrue(prefs:Load(0), "FCSlurContourPrefs:Load()")
FCSlurContourPrefs_PropertyTests(prefs)
