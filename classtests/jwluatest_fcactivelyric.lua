function FCActiveLyric_PropertyTests(obj)
   NumberPropertyTest(obj, "FCActiveLyric", "BlockType", {finale.LYRICSTEXTBLOCKVERSE, finale.LYRICSTEXTBLOCKCHORUS, finale.LYRICSTEXTBLOCKSECTION})
   NumberPropertyTest(obj, "FCActiveLyric", "Syllable", {1, 12, 144})
   NumberPropertyTest(obj, "FCActiveLyric", "TextBlockID", {1, 17, 144})
end


-- Call:
local obj = finale.FCActiveLyric()
AssureTrue(obj:Load(), "FCActiveLyric:Load()")
FCActiveLyric_PropertyTests(obj)
