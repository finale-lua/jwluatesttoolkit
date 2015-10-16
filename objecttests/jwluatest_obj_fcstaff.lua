function FCStaff_ValueTests_ItemNo1(staff)
   BoolValuePropertyTest(staff, "FCStaff", "AllowHiding", true)
   BoolValuePropertyTest(staff, "FCStaff", "AltNotationDisplayOtherLayerNotes", true)
   NumberValuePropertyTest(staff, "FCStaff", "AltNotationLayer", 1)
   NumberValuePropertyTest(staff, "FCStaff", "AltNotationStyle", finale.ALTSTAFF_NORMAL)
   NumberValuePropertyTest(staff, "FCStaff", "BottomBarlineOffset", 0)
   BoolValuePropertyTest(staff, "FCStaff", "BreakBarlines", false)
   BoolValuePropertyTest(staff, "FCStaff", "BreakRepeatBarlines", false)
   BoolValuePropertyTest(staff, "FCStaff", "BreakTablatureLines", false)
   NumberValuePropertyTest(staff, "FCStaff", "CapoPosition", 0)
   NumberValuePropertyTest(staff, "FCStaff", "DefaultClef", 0)
   BoolValuePropertyTest(staff, "FCStaff", "DisplayEmptyRests", true)
   BoolValuePropertyTest(staff, "FCStaff", "FlatBeams", false)
   NumberValuePropertyTest(staff, "FCStaff", "FretInstrumentDefID", 0)
   BoolValuePropertyTest(staff, "FCStaff", "FretLetters", false)
   NumberValuePropertyTest(staff, "FCStaff", "HideMode", 0)
   BoolValuePropertyTest(staff, "FCStaff", "IgnoreKeySig", false)
   BoolValuePropertyTest(staff, "FCStaff", "IndependentFont", false)
   BoolValuePropertyTest(staff, "FCStaff", "IndependentKeySig", false)
   BoolValuePropertyTest(staff, "FCStaff", "IndependentTimeSig", false)
   StringValuePropertyTest(staff, "FCStaff", "InstrumentUUID", finale.FFUUID_UNKNOWN)
   NumberValuePropertyTest(staff, "FCStaff", "LineCount", 5)
   NumberValuePropertyTest(staff, "FCStaff", "LowestFret", 0)
   BoolValuePropertyTest(staff, "FCStaff", "NoKeySigShowAccidentals", false)
   NumberValuePropertyTest(staff, "FCStaff", "NotationStyle", finale.STAFFNOTATION_NORMAL)
   BoolValuePropertyTest(staff, "FCStaff", "NoteColors", false)
   BoolValuePropertyTest(staff, "FCStaff", "Optimization", true)
   BoolValuePropertyTest(staff, "FCStaff", "RedisplayOtherLayerAccidentals", false)
   BoolValuePropertyTest(staff, "FCStaff", "ShowAugmentationDots", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowBarlines", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowChords", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowClefs", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowFretboards", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowKeySignatures", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowLyrics", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowMeasureNumbers", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowNoteShapes", false)
   BoolValuePropertyTest(staff, "FCStaff", "ShowOnlyFirstMeasureClef", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowPartStaffNames", false)
   BoolValuePropertyTest(staff, "FCStaff", "ShowRepeats", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowRests", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowScoreStaffNames", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowStaffLines", false)
   BoolValuePropertyTest(staff, "FCStaff", "ShowStems", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowTextRepeats", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowTies", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowTimeSignatures", true)
   BoolValuePropertyTest(staff, "FCStaff", "ShowTuplets", true)
   NumberValuePropertyTest(staff, "FCStaff", "TopBarlineOffset", 0)
   NumberValuePropertyTest(staff, "FCStaff", "TransposeAlteration", 0)
   BoolValuePropertyTest(staff, "FCStaff", "TransposeChromatic", false)
   NumberValuePropertyTest(staff, "FCStaff", "TransposeClefIndex", 0)
   NumberValuePropertyTest(staff, "FCStaff", "TransposeInterval", 0)
   BoolValuePropertyTest(staff, "FCStaff", "TransposeSimplifyKey", true)
   BoolValuePropertyTest(staff, "FCStaff", "TransposeUseClef", false)
   NumberValuePropertyTest(staff, "FCStaff", "VerticalFretOffset", -1024)
end


-- Call:
local staff = finale.FCStaff()
AssureTrue(staff:Load(1), "FCStaff:Load(1)")
FCStaff_ValueTests_ItemNo1(staff)
