function FCAllotment_ValueTests_ItemNo0(allotment)
   NumberValuePropertyTest(allotment, "FCAllotment", "Width", 84)
end


function FCAllotment_ValueTests_ItemNo409(allotment)
   NumberValuePropertyTest(allotment, "FCAllotment", "Width", 65)
end


function FCAllotment_ValueTests_ItemNo8192(allotment)
   NumberValuePropertyTest(allotment, "FCAllotment", "Width", 521)
end


-- Call:
if not AssureNonNil(finale.FCAllotments, "FCAllotments") then
    return
end

local allots = finale.FCAllotments()
if not AssureTrue(allots:LoadAll() == 23, "FCAllotments:LoadAll() == 23") then
    return
end

FCAllotment_ValueTests_ItemNo0(allots:GetItemAt(0))
FCAllotment_ValueTests_ItemNo409(allots:GetItemAt(11))
FCAllotment_ValueTests_ItemNo8192(allots:GetItemAt(22))
