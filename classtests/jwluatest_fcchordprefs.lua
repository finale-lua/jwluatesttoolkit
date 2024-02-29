function FCChordPrefs_PropertyTests(chordprefs)
   BoolPropertyTest(chordprefs, "FCChordPrefs", "EnableChordPlayback")
   NumberPropertyTest(chordprefs, "FCChordPrefs", "FlatBaselineAdjustment", {-260, 0, 300})
   BoolPropertyTest(chordprefs, "FCChordPrefs", "ItalicizeCapoChords")
   BoolPropertyTest(chordprefs, "FCChordPrefs", "LeftAlignment")
   BoolPropertyTest(chordprefs, "FCChordPrefs", "MultipleItemsPerString")
   NumberPropertyTest(chordprefs, "FCChordPrefs", "NaturalBaselineAdjustment", {-259, 0, 301})
   NumberPropertyTest(chordprefs, "FCChordPrefs", "ScaleChordsBy", {10, 75.67, 100.56})
   NumberPropertyTest(chordprefs, "FCChordPrefs", "ScaleFretboardsBy", {10, 75.68, 100.57})
   NumberPropertyTest(chordprefs, "FCChordPrefs", "SharpBaselineAdjustment", {-258, 0, 302})
   BoolPropertyTest(chordprefs, "FCChordPrefs", "ShowFretboards")
   NumberPropertyTest(chordprefs, "FCChordPrefs", "Style", {finale.CHRDSTYLE_NORMAL,
                finale.CHRDSTYLE_ROMAN, finale.CHRDSTYLE_NASHVILLE_A,  
                finale.CHRDSTYLE_GERMAN, finale.CHRDSTYLE_SOLFEGGIO, finale.CHRDSTYLE_EUROPEAN,
                finale.CHRDSTYLE_SCANDINAVIAN, finale.CHRDSTYLE_NASHVILLE_B})
   BoolPropertyTest(chordprefs, "FCChordPrefs", "UseSimpleSpelling")
end

-- Call:
local chordprefs = finale.FCChordPrefs()
AssureTrue(chordprefs:Load(1))
FCChordPrefs_PropertyTests(chordprefs)
