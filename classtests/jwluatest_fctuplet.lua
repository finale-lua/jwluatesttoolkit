function FCTuplet_PropertyTests(obj)
   BoolPropertyTest(obj, "FCTuplet", "AllowHorizontalDrag")
   BoolPropertyTest(obj, "FCTuplet", "AlwaysFlat")
   BoolPropertyTest(obj, "FCTuplet", "AvoidStaff")
   BoolPropertyTest(obj, "FCTuplet", "BracketFullDuration")
   NumberPropertyTest(obj, "FCTuplet", "BracketMode", {finale.TUPLETBRACKET_ALWAYS, finale.TUPLETBRACKET_UNBEAMEDONLY,
                        finale.TUPLETBRACKET_NEVERBEAMEDONBEAMSIDE})
   BoolPropertyTest(obj, "FCTuplet", "BreakSlurBracket")
   BoolPropertyTest(obj, "FCTuplet", "CenterUsingDuration")
   BoolPropertyTest(obj, "FCTuplet", "EngraverTuplet")
   NumberPropertyTest(obj, "FCTuplet", "HorizontalOffset", {-144, 0, 144})
   NumberPropertyTest(obj, "FCTuplet", "HorizontalShapeOffset", {-144, 0, 144})
   BoolPropertyTest(obj, "FCTuplet", "IgnoreNumberOffset")
   NumberPropertyTest(obj, "FCTuplet", "LeftExtension", {-144, 0, 144})
   NumberPropertyTest(obj, "FCTuplet", "LeftHookLength", {-144, 0, 144})
   BoolPropertyTest(obj, "FCTuplet", "MatchHookLengths")
   NumberPropertyTest(obj, "FCTuplet", "NumberStyle", {finale.TUPLETNUMBER_NONE, finale.TUPLETNUMBER_REGULAR, finale.TUPLETNUMBER_RATIO,
                        finale.TUPLETNUMBER_RATIOANDNOTE, finale.TUPLETNUMBER_RATIOANDNOTE_BOTH})
   NumberPropertyTest(obj, "FCTuplet", "PlacementMode", {finale.TUPLETPLACEMENT_MANUAL, finale.TUPLETPLACEMENT_STEMSIDE, finale.TUPLETPLACEMENT_NOTESIDE,
                        finale.TUPLETPLACEMENT_ABOVE, finale.TUPLETPLACEMENT_BELOW})
   NumberPropertyTest(obj, "FCTuplet", "ReferenceDuration", {-144, 0, 144})
   NumberPropertyTest(obj, "FCTuplet", "ReferenceNumber", {-144, 0, 144})
   NumberPropertyTest(obj, "FCTuplet", "RightExtension", {-144, 0, 144})
   NumberPropertyTest(obj, "FCTuplet", "RightHookLength", {-144, 0, 144})
   NumberPropertyTest(obj, "FCTuplet", "ShapeStyle", {finale.TUPLETSHAPE_NONE, finale.TUPLETBRACKET_UNBEAMEDONLY,
                        finale.TUPLETBRACKET_NEVERBEAMEDONBEAMSIDE})
   NumberPropertyTest(obj, "FCTuplet", "SlopeAdjust", {-144, 0, 144})
   NumberPropertyTest(obj, "FCTuplet", "SymbolicDuration", {-144, 0, 144})
   NumberPropertyTest(obj, "FCTuplet", "SymbolicNumber", {-144, 0, 144})
   BoolPropertyTest(obj, "FCTuplet", "UseBottomNote")
   NumberPropertyTest(obj, "FCTuplet", "VerticalOffset", {-144, 0, 144})
   NumberPropertyTest(obj, "FCTuplet", "VerticalShapeOffset", {-144, 0, 144})
   BoolPropertyTest(obj, "FCTuplet", "Visible")
end


-- Call:
local entry = LoadMeasureEntry(29, 2, 307)
if AssureNonNil(entry, "FCTuplet_PropertyTests load entry") then
    local obj = finale.FCTuplet()
    obj:SetNoteEntry(entry)
    if AssureTrue(obj:LoadFirst(), "FCTuplet_PropertyTests: LoadFirst") then
        FCTuplet_PropertyTests(obj)
    end
end
