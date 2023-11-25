if not AssureNonNil(finale.FCFretboardGroupItem, "FCFretboardGroupItem does not exist") then
    return
end

function FCFretItem_ValueTests_ItemNo65534_0_11_0(obj)
   NumberValuePropertyTest(obj, "FCFretItem", "FretNumber", 1)
   NumberValuePropertyTest(obj, "FCFretItem", "Fingering", finale.FRETFINGERING_NONE)
   NumberValuePropertyTest(obj, "FCFretItem", "StringNumber", 1)
   NumberValuePropertyTest(obj, "FCFretItem", "Symbol", finale.FRETITEM_DOT)
end

function FCFretItem_ValueTests_ItemNo65534_0_11_0_AfterSetup(obj)
   NumberValuePropertyTest(obj, "FCFretItem", "FretNumber", 13)
   NumberValuePropertyTest(obj, "FCFretItem", "Fingering", finale.FRETFINGERING_THUMB)
   NumberValuePropertyTest(obj, "FCFretItem", "StringNumber", 7)
   NumberValuePropertyTest(obj, "FCFretItem", "Symbol", finale.FRETITEM_DIAMOND)
end


-- Call:
local group_item = finale.FCFretboardGroupItem()
if not AssureTrue(group_item:Load(65534, 0, 11), "Loading FCFretboardGroupItem for file test of FCFretItem") then
    return
end
local obj = group_item.FretItems:GetItemAt(0)
FCFretItem_ValueTests_ItemNo65534_0_11_0(obj)

obj:SetupItem(finale.FRETITEM_DIAMOND, 13, 7, finale.FRETFINGERING_THUMB)
FCFretItem_ValueTests_ItemNo65534_0_11_0_AfterSetup(obj)

