function FCChordSuffixElement_PropertyTests(obj)
   NumberPropertyTest(obj, "FCChordSuffixElement", "HorizontalOffset", {-144, 0, 144})
   BoolPropertyTest(obj, "FCChordSuffixElement", "NumberRepresentation")
   BoolPropertyTest(obj, "FCChordSuffixElement", "PrefixFlat")
   BoolPropertyTest(obj, "FCChordSuffixElement", "PrefixMinus")
   BoolPropertyTest(obj, "FCChordSuffixElement", "PrefixPlus")
   BoolPropertyTest(obj, "FCChordSuffixElement", "PrefixSharp")
   NumberPropertyTest(obj, "FCChordSuffixElement", "Symbol", {0, 1, 8, 17})
   NumberPropertyTest(obj, "FCChordSuffixElement", "VerticalOffset", {-144, 0, 144})
end


-- Call:
local obj = finale.FCChordSuffixElement()
AssureTrue(obj:Load(1, 0), "FCChordSuffixElement:Load()")
FCChordSuffixElement_PropertyTests(obj)
