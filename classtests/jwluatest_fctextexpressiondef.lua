function FCTextExpressionDef_PropertyTests(exprdef)
   BoolPropertyTest(exprdef, "FCTextExpressionDef", "BreakMMRest")
   NumberPropertyTest(exprdef, "FCTextExpressionDef", "CategoryID", {1, 20, 30})
   NumberPropertyTest(exprdef, "FCTextExpressionDef", "ExecutableShapeID", {0, 4, 30})
   BoolPropertyTest(exprdef, "FCTextExpressionDef", "HideMeasureNumbers")
   NumberPropertyTest(exprdef, "FCTextExpressionDef", "HorizontalAlignmentPoint", {finale.ALIGNHORIZ_CLICKPOS,
            finale.ALIGNHORIZ_LEFTOFALLNOTEHEAD, finale.ALIGNHORIZ_LEFTOFPRIMARYNOTEHEAD,
            finale.ALIGNHORIZ_STEM, finale.ALIGNHORIZ_CENTERPRIMARYNOTEHEAD,
            finale.ALIGNHORIZ_CENTERALLNOTEHEADS, finale.ALIGNHORIZ_RIGHTALLNOTEHEADS,
            finale.ALIGNHORIZ_LEFTBARLINE, finale.ALIGNHORIZ_TIMESIGSTART,
            finale.ALIGNHORIZ_AFTERCLEFKEYTIMEREPEAT, finale.ALIGNHORIZ_STARTOFMUSIC,
            finale.ALIGNHORIZ_CENTERBETWEENBARLINES, finale.ALIGNHORIZ_CENTEROVERUNDERMUSIC, finale.ALIGNHORIZ_RIGHTBARLINE})
   NumberPropertyTest(exprdef, "FCTextExpressionDef", "HorizontalJustification", {finale.EXPRJUSTIFY_LEFT, finale.EXPRJUSTIFY_CENTER, finale.EXPRJUSTIFY_RIGHT})
   NumberPropertyTest(exprdef, "FCTextExpressionDef", "HorizontalOffset", {-100, 0, 100})
   NumberPropertyTest(exprdef, "FCTextExpressionDef", "PlaybackPass", {0, 1, 2, 3, 5})
   NumberPropertyTest(exprdef, "FCTextExpressionDef", "PlaybackType", {finale.EXPPLAYTYPE_NONE,
            finale.EXPPLAYTYPE_KEYVELOCITY, finale.EXPPLAYTYPE_TEMPO, finale.EXPPLAYTYPE_CONTROLLER,
            finale.EXPPLAYTYPE_TRANSPOSE, finale.EXPPLAYTYPE_MIDIDUMP, finale.EXPPLAYTYPE_MIDICHANNEL,
            finale.EXPPLAYTYPE_RESTRIKEKEYS, finale.EXPPLAYTYPE_PLAYTEMPOTOOL, finale.EXPPLAYTYPE_IGNORETEMPOTOOL,
            finale.EXPPLAYTYPE_PATCHCHANGE, finale.EXPPLAYTYPE_CHANNELPRESSURE, finale.EXPPLAYTYPE_PITCHWHEEL,
            finale.EXPPLAYTYPE_PERCUSSIONMAP, finale.EXPPLAYTYPE_SWING, finale.EXPPLAYTYPE_HUMANPLAYBACKON,
            finale.EXPPLAYTYPE_HUMANPLAYBACKOFF}) -- EXPPLAYTYPE_UNKNOWN intentionally omitted because it can't be set
   NumberPropertyTest(exprdef, "FCTextExpressionDef", "RehearsalMarkStyle", {finale.REHMARKSTYLE_MANUAL, finale.REHMARKSTYLE_LETTER,
            finale.REHMARKSTYLE_LETNUM, finale.REHMARKSTYLE_LETTER_LC,
            finale.REHMARKSTYLE_LETNUM_LC, finale.REHMARKSTYLE_NUMBER, finale.REHMARKSTYLE_MEASNUM })
   NumberPropertyTest_RO(exprdef, "FCTextExpressionDef", "TextID", {1, 1000, 20000})
   BoolPropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryFont")
   BoolPropertyTest(exprdef, "FCTextExpressionDef", "UseCategoryPos")
   BoolPropertyTest_RO(exprdef, "FCTextExpressionDef", "UseEnclosure") -- Is actually R/W
   BoolPropertyTest(exprdef, "FCTextExpressionDef", "UseExecutableShape")
   NumberPropertyTest(exprdef, "FCTextExpressionDef", "VerticalAlignmentPoint", {
            finale.ALIGNVERT_CLICKPOS, finale.ALIGNVERT_STAFF_REFERENCE_LINE, 
            finale.ALIGNVERT_ABOVE_STAFF_BASELINE, finale.ALIGNVERT_BELOW_STAFF_BASELINE,
            finale.ALIGNVERT_TOPNOTE, finale.ALIGNVERT_BOTTOMNOTE, finale.ALIGNVERT_ABOVEENTRY,
            finale.ALIGNVERT_BELOWENTRY, finale.ALIGNVERT_ABOVE_STAFF_BASELINE_OR_ENTRY,
            finale.ALIGNVERT_BELOW_STAFF_BASELINE_OR_ENTRY})
   NumberPropertyTest(exprdef, "FCTextExpressionDef", "VerticalBaselineOffset", {-200, 0, 200})
   NumberPropertyTest(exprdef, "FCTextExpressionDef", "VerticalEntryOffset", {-300, 0, 300})
end


-- Call:
local exprdef = finale.FCTextExpressionDef()
AssureTrue(exprdef:Load(1))
FCTextExpressionDef_PropertyTests(exprdef)
