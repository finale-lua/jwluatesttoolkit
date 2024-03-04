if not AssureNonNil(finale.FCChordSuffixKeyNumberOffsets, "This version of the Lua plugin lacks FCChordSuffixKeyNumberOffsets. Tests skipped.") then
    return
end

function FCChordSuffixKeyNumberOffsets_PropertyTests(obj)
    local function reload_func()
        return obj:Load(obj.ChordSuffixID) and obj
    end
    TablePropertyTest(obj, "FCChordSuffixKeyNumberOffsets", "IntTable", {{3, 6, 9, 10}, {2, 4, 6}}, nil, reload_func)
end


-- Call:
local chord = finale.FCChord()
chord:ConnectCell(finale.FCCell(46, 1))
AssureTrue(chord:LoadFirst(), "FCChord:LoadFirst() for FCChordSuffixKeyNumberOffsets")
local obj = finale.FCChordSuffixKeyNumberOffsets()
AssureTrue(obj:Load(chord.ChordSuffixID), "FCChordSuffixKeyNumberOffsets:Load(" .. chord.ChordSuffixID .. ")")
FCChordSuffixKeyNumberOffsets_PropertyTests(obj)
