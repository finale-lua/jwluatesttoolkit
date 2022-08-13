function FCTextBlock_PropertyTests(obj)
   BoolPropertyTest_RO(obj, "FCTextBlock", "ExpandHorizontally")
   BoolPropertyTest(obj, "FCTextBlock", "ExpandSingleWord")
   BoolPropertyTest_RO(obj, "FCTextBlock", "ExpandVertically")
   NumberPropertyTest(obj, "FCTextBlock", "Height", {0, 144, 223})
   NumberPropertyTest(obj, "FCTextBlock", "HorizontalTextOffset", {-34, 0, 48})
   NumberPropertyTest(obj, "FCTextBlock", "Justification", {finale.TEXTJUSTIFY_LEFT, finale.TEXTJUSTIFY_RIGHT,
           finale.TEXTJUSTIFY_CENTER, finale.TEXTJUSTIFY_FULL, finale.TEXTJUSTIFY_FORCED_FULL})
   NumberPropertyTest(obj, "FCTextBlock", "LineInset", {-23, 0, 45})
   NumberPropertyTest(obj, "FCTextBlock", "LineSpacing", {-23, 0, 45})
   NumberPropertyTest(obj, "FCTextBlock", "LineWidth", {0, 4, 18})
   NumberPropertyTest_RO(obj, "FCTextBlock", "RawTextID")
   NumberPropertyTest(obj, "FCTextBlock", "RoundedCornerRadius", {0, 4, 18})
   NumberPropertyTest(obj, "FCTextBlock", "ShapeID", {0, 1})
   NumberPropertyTest(obj, "FCTextBlock", "VerticalTextOffset", {-34, 0, 48})
   NumberPropertyTest(obj, "FCTextBlock", "Width", {0, 512, 1037})
   
   if Is27_3OrAbove() then
      BoolPropertyTest(obj, "FCTextBlock", "FrameReference")
      BoolPropertyTest(obj, "FCTextBlock", "LineSpacingIsPercent")
      BoolPropertyTest(obj, "FCTextBlock", "RoundedCorners")
      BoolPropertyTest(obj, "FCTextBlock", "ShowBorders")
      BoolPropertyTest(obj, "FCTextBlock", "WordWrap")
   end
end


-- Call:
local obj = finale.FCTextBlock()
AssureTrue(obj:Load(1), "FCTextBlock:Load()")
FCTextBlock_PropertyTests(obj)
