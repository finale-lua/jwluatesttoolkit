if not AssureNonNil(finale.FCTransposer, "finale.FCTransposer") then
    return
end

function FCTransposer_ValueTests_ItemNo3_n2(transposer)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "Displacement", 3)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "RaiseLower", -2)
end


function FCTransposer_ValueTests_ItemNo0_n2(transposer)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "Displacement", 0)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "RaiseLower", -2)
end


function FCTransposer_ValueTests_ItemNon1_n1(transposer)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "Displacement", -1)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "RaiseLower", -1)
end


function FCTransposer_ValueTests_ItemNo1_n4(transposer)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "Displacement", 1)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "RaiseLower", -4)
end


function FCTransposer_ValueTests_ItemNon1_n1(transposer)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "Displacement", -1)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "RaiseLower", -1)
end


function FCTransposer_ValueTests_ItemNo8_1(transposer)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "Displacement", 8)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "RaiseLower", 1)
end


function FCTransposer_ValueTests_ItemNo15_1(transposer)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "Displacement", 15)
   NumberValuePropertyTest_RO(transposer, "FCTransposer", "RaiseLower", 1)
end


-- Call:

local key = finale.FCCell(1,1):GetKeySignature()
local transposer = finale.FCTransposer(1, -2, key)
transposer:ChromaticTranspose(2, -1)
FCTransposer_ValueTests_ItemNo3_n2(transposer)
transposer:DiatonicTranspose(-3)
FCTransposer_ValueTests_ItemNo0_n2(transposer)
transposer:DefaultEnharmonicTranspose()
FCTransposer_ValueTests_ItemNon1_n1(transposer)
transposer:EnharmonicTranspose(1)
transposer:EnharmonicTranspose(1)
FCTransposer_ValueTests_ItemNo1_n4(transposer)
transposer:SimplifySpelling()
FCTransposer_ValueTests_ItemNon1_n1(transposer)
transposer:EDOStepTranspose(17)
FCTransposer_ValueTests_ItemNo8_1(transposer)
transposer:OctaveTranspose(1)
FCTransposer_ValueTests_ItemNo15_1(transposer)

