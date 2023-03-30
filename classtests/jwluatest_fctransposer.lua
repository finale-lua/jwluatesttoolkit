if not AssureNonNil(finale.FCTransposer, "finale.FCTransposer") then
    return
end

function FCTransposer_PropertyTests(obj)
   PropertyTest_RO(obj, "FCTransposer", "Displacement")
   PropertyTest_RO(obj, "FCTransposer", "RaiseLower")
end


-- Call:
local obj = finale.FCTransposer(0, 0, nil)
FCTransposer_PropertyTests(obj)
