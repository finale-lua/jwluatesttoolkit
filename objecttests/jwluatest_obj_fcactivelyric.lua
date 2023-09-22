function FCActiveLyric_ValueTests_ItemNo1(obj)
   NumberValuePropertyTest(obj, "FCActiveLyric", "BlockType", finale.LYRICSTEXTBLOCKCHORUS)
   NumberValuePropertyTest(obj, "FCActiveLyric", "Syllable", 3)
   NumberValuePropertyTest(obj, "FCActiveLyric", "TextBlockID", 2)
end


-- Call:
local obj = finale.FCActiveLyric()
AssureTrue(obj:Load(1), "FCActiveLyric:Load(1)")
FCActiveLyric_ValueTests_ItemNo1(obj)
