function FCVerseLyricsText_PropertyTests(obj)
   NumberPropertyTest_RO(obj, "FCVerseLyricsText", "BlockType")
   NumberPropertyTest_RO(obj, "FCVerseLyricsText", "ItemNo")
   NumberPropertyTest_RO(obj, "FCVerseLyricsText", "NumChars")
end


-- Call:
local obj = finale.FCVerseLyricsText()
AssureTrue(obj:Load(1), "FCVerseLyricsText:Load()")
FCVerseLyricsText_PropertyTests(obj)
