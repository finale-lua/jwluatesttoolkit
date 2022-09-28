function FCCellGraphic_PropertyTests(obj)
   NumberPropertyTest(obj, "FCCellGraphic", "Height", {-144, 0, 144})
   NumberPropertyTest(obj, "FCCellGraphic", "HorizontalPos", {-144, 0, 144})
   NumberPropertyTest_RO(obj, "FCCellGraphic", "OriginalHeight", {-144, 0, 144})
   NumberPropertyTest_RO(obj, "FCCellGraphic", "OriginalWidth", {-144, 0, 144})
   NumberPropertyTest(obj, "FCCellGraphic", "VerticalPos", {-144, 0, 144})
   BoolPropertyTest(obj, "FCCellGraphic", "Visible")
   NumberPropertyTest(obj, "FCCellGraphic", "Width", {-144, 0, 144})
end


-- Call:
if not AssureNonNil(finale.FCCellGraphic, "finale.FCCellGraphic") then
    return
end
local obj = finale.FCCellGraphic()
obj:ConnectCell(finale.FCCell(11, 2))
AssureTrue(obj:LoadFirst(), "FCCellGraphic:LoadFirst()")
FCCellGraphic_PropertyTests(obj)
