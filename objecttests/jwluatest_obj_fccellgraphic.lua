function FCCellGraphic_ValueTests_Cell11_2_0(obj)
   AssureTrue(obj:IsEmbedded(), "FCCellGraphic_11_2_0 IsEmbedded")
   NumberValuePropertyTest(obj, "FCCellGraphic", "Height", 139)
   NumberValuePropertyTest(obj, "FCCellGraphic", "HorizontalPos", 40)
   NumberValuePropertyTest_RO(obj, "FCCellGraphic", "OriginalHeight", 174)
   NumberValuePropertyTest_RO(obj, "FCCellGraphic", "OriginalWidth", 460)
   NumberValuePropertyTest(obj, "FCCellGraphic", "VerticalPos", 22)
   BoolValuePropertyTest(obj, "FCCellGraphic", "Visible", true)
   NumberValuePropertyTest(obj, "FCCellGraphic", "Width", 368)
end

function FCCellGraphic_ValueTests_Cell11_2_1(obj)
   AssureTrue(obj:IsEmbedded(), "FCCellGraphic_11_2_1 IsEmbedded")
   NumberValuePropertyTest(obj, "FCCellGraphic", "Height", 47)
   NumberValuePropertyTest(obj, "FCCellGraphic", "HorizontalPos", 66)
   NumberValuePropertyTest_RO(obj, "FCCellGraphic", "OriginalHeight", 174)
   NumberValuePropertyTest_RO(obj, "FCCellGraphic", "OriginalWidth", 460)
   NumberValuePropertyTest(obj, "FCCellGraphic", "VerticalPos", -185)
   BoolValuePropertyTest(obj, "FCCellGraphic", "Visible", true)
   NumberValuePropertyTest(obj, "FCCellGraphic", "Width", 442)
end


-- Call:
if not AssureNonNil(finale.FCCellGraphics, "finale.FCCellGraphics") then
    return
end
local coll = finale.FCCellGraphics()
coll:LoadAllInCell(finale.FCCell(11, 2))
for index = 1, coll.Count - 1 do
    local funcname = "FCCellGraphic_ValueTests_Cell11_2".."_"..index
    if AssureNonNil(_G[funcname], funcname) then
        _G[funcname](coll:GetItemAt(index))
    end
end
