function FCAllotment_PropertyTests(obj)
   NumberPropertyTest(obj, "FCAllotment", "Width", {0, 84, 144})
end


-- Call:
if not AssureNonNil(finale.FCAllotments, "FCAllotments") then
    return
end

local allots = finale.FCAllotments()
if not AssureTrue(allots:LoadAll() > 0, "FCAllotments:LoadAll() > 0") then
    return
end

FCAllotment_PropertyTests(allots:GetItemAt(allots.Count - 1))
