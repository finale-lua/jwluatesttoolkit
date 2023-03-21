function FCChord_Test_Unlinkable(cell, partnumber)
    local chord = finale.FCChord()
    chord:ConnectCell(finale.FCCell(46,1))
    local loadfunc = function() return chord:LoadFirst() end
    UnlinkableNumberPropertyTest(chord, "FCChord", "ChordHorizontalPos", loadfunc, nil, 24, partnumber)
    UnlinkableNumberPropertyTest(chord, "FCChord", "ChordVerticalPos", loadfunc, nil, -24, partnumber)
    UnlinkableNumberPropertyTest(chord, "FCChord", "FretboardHorizontalPos", loadfunc, nil, -24, partnumber)
    UnlinkableNumberPropertyTest(chord, "FCChord", "FretboardVerticalPos", loadfunc, nil, 24, partnumber)
end


-- Call:
FCChord_Test_Unlinkable(finale.FCCell(46,1), staff_to_part[1])
