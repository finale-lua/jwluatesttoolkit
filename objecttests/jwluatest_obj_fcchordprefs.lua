function FCChordPrefs_ValueTests_ItemNo1(chordprefs)
   BoolValuePropertyTest(chordprefs, "FCChordPrefs", "EnableChordPlayback", true)
   NumberValuePropertyTest(chordprefs, "FCChordPrefs", "FlatBaselineAdjustment", 19)
   BoolValuePropertyTest(chordprefs, "FCChordPrefs", "ItalicizeCapoChords", true)
   BoolValuePropertyTest(chordprefs, "FCChordPrefs", "LeftAlignment", false)
   BoolValuePropertyTest(chordprefs, "FCChordPrefs", "MultipleItemsPerString", false)
   NumberValuePropertyTest(chordprefs, "FCChordPrefs", "NaturalBaselineAdjustment", 22)
   NumberValuePropertyTest(chordprefs, "FCChordPrefs", "ScaleChordsBy", 100.12)
   NumberValuePropertyTest(chordprefs, "FCChordPrefs", "ScaleFretboardsBy", 77.65)
   NumberValuePropertyTest(chordprefs, "FCChordPrefs", "SharpBaselineAdjustment", 23)
   BoolValuePropertyTest(chordprefs, "FCChordPrefs", "ShowFretboards", true)
   NumberValuePropertyTest(chordprefs, "FCChordPrefs", "Style", finale.CHRDSTYLE_ROMAN)
   BoolValuePropertyTest(chordprefs, "FCChordPrefs", "UseSimpleSpelling", true)
end

-- Call:
local chordprefs = finale.FCChordPrefs()
AssureTrue(chordprefs:Load(1))
FCChordPrefs_ValueTests_ItemNo1(chordprefs)
