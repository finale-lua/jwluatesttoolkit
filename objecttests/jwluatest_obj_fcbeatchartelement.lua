function FCBeatChartElement_ValueTests_ItemNo16_0(header)
   NumberValuePropertyTest(header, "FCBeatChartElement", "FullSpan", 358)
   NumberValuePropertyTest(header, "FCBeatChartElement", "HorizontalPosition", 358)
   BoolValuePropertyTest_RO(header, "FCBeatChartElement", "InitElement", true)
   NumberValuePropertyTest(header, "FCBeatChartElement", "MeasurePos", 4096)
   NumberValuePropertyTest(header, "FCBeatChartElement", "MinimumPosition", 0)
   NumberValuePropertyTest(header, "FCBeatChartElement", "MinimumWidth", 509)
   NumberValuePropertyTest(header, "FCBeatChartElement", "NextHorizontalPosition", 0)
   NumberValuePropertyTest(header, "FCBeatChartElement", "ReferenceWidth", 2819)
   NumberValuePropertyTest(header, "FCBeatChartElement", "TotalDuration", 4096)
end


function FCBeatChartElement_ValueTests_ItemNo16_7(element)
   NumberValuePropertyTest(element, "FCBeatChartElement", "FullSpan", 0)
   NumberValuePropertyTest(element, "FCBeatChartElement", "HorizontalPosition", 9)
   BoolValuePropertyTest_RO(element, "FCBeatChartElement", "InitElement", false)
   NumberValuePropertyTest(element, "FCBeatChartElement", "MeasurePos", 16)
   NumberValuePropertyTest(element, "FCBeatChartElement", "MinimumPosition", 172)
   NumberValuePropertyTest(element, "FCBeatChartElement", "MinimumWidth", 0)
   NumberValuePropertyTest(element, "FCBeatChartElement", "NextHorizontalPosition", 14)
   NumberValuePropertyTest(element, "FCBeatChartElement", "ReferenceWidth", 0)
   NumberValuePropertyTest(element, "FCBeatChartElement", "TotalDuration", 0)
end


function FCBeatChartElement_ValueTests_ItemNo16_13(element)
   NumberValuePropertyTest(element, "FCBeatChartElement", "FullSpan", 0)
   NumberValuePropertyTest(element, "FCBeatChartElement", "HorizontalPosition", 138)
   BoolValuePropertyTest_RO(element, "FCBeatChartElement", "InitElement", false)
   NumberValuePropertyTest(element, "FCBeatChartElement", "MeasurePos", 1024)
   NumberValuePropertyTest(element, "FCBeatChartElement", "MinimumPosition", 423)
   NumberValuePropertyTest(element, "FCBeatChartElement", "MinimumWidth", 0)
   NumberValuePropertyTest(element, "FCBeatChartElement", "NextHorizontalPosition", 222)
   NumberValuePropertyTest(element, "FCBeatChartElement", "ReferenceWidth", 0)
   NumberValuePropertyTest(element, "FCBeatChartElement", "TotalDuration", 0)
end


-- Call:

local elts = finale.FCBeatChartElements()
if AssureTrue(elts:LoadAllForItem(16) == 15, "FCBeatChartElements:LoadAllForItem == 15") then
    FCBeatChartElement_ValueTests_ItemNo16_0(elts:GetItemAt(0))
    FCBeatChartElement_ValueTests_ItemNo16_7(elts:GetItemAt(7))
    FCBeatChartElement_ValueTests_ItemNo16_13(elts:GetItemAt(13))
end
