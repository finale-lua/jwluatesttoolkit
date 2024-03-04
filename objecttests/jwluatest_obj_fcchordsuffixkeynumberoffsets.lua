if not AssureNonNil(finale.FCChordSuffixKeyNumberOffsets, "This version of the Lua plugin lacks FCChordSuffixKeyNumberOffsets. Tests skipped.") then
    return
end

function FCChordSuffixKeyNumberOffsets_ValueTests_Item67(obj)
    TableValuePropertyTest(obj, "FCChordSuffixKeyNumberOffsets", "IntTable", {3, 7, 10})
end


-- Call:
local chord = finale.FCChord()
chord:ConnectCell(finale.FCCell(46, 1))
AssureTrue(chord:LoadFirst(), "FCChord:LoadFirst() for FCChordSuffixKeyNumberOffsets")
local obj = finale.FCChordSuffixKeyNumberOffsets()
AssureTrue(obj:Load(chord.ChordSuffixID), "FCChordSuffixKeyNumberOffsets:Load(" .. chord.ChordSuffixID .. ")")
FCChordSuffixKeyNumberOffsets_ValueTests_Item67(obj)
