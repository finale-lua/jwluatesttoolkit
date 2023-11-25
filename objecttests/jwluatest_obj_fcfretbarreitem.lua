if not AssureNonNil(finale.FCFretboardGroupItem, "FCFretboardGroupItem does not exist") then
    return
end

function FCFretBarreItem_ValueTests_ItemNo65534_0_11_0(obj)
   NumberValuePropertyTest(obj, "FCFretBarreItem", "FretNumber", 0)
   NumberValuePropertyTest(obj, "FCFretBarreItem", "LeftStringNumber", 6)
   NumberValuePropertyTest(obj, "FCFretBarreItem", "RightStringNumber", 1)
end


function FCFretBarreItem_ValueTests_ItemNo65534_0_11_0_AfterSetup(obj)
   NumberValuePropertyTest(obj, "FCFretBarreItem", "FretNumber", 7)
   NumberValuePropertyTest(obj, "FCFretBarreItem", "LeftStringNumber", 3)
   NumberValuePropertyTest(obj, "FCFretBarreItem", "RightStringNumber", 2)
end

-- Call:
local group_item = finale.FCFretboardGroupItem()
if not AssureTrue(group_item:Load(65534, 0, 11), "Loading FCFretboardGroupItem for file test of FCFretItem") then
    return
end
local obj = group_item.FretBarreItems:GetItemAt(0)
FCFretBarreItem_ValueTests_ItemNo65534_0_11_0(obj)

obj:SetupBarre(7, 3, 2)
FCFretBarreItem_ValueTests_ItemNo65534_0_11_0_AfterSetup(obj)


