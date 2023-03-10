function FCBeatChartElement_PropertyTests(element)
   BoolPropertyTest_RO(element, "FCBeatChartElement", "InitElement")
   if element:GetInitElement() then
       NumberPropertyTest(element, "FCBeatChartElement", "TotalDuration", {32, 1024, 4096})
       NumberPropertyTest(element, "FCBeatChartElement", "FullSpan", {0, 245, 543})
       NumberPropertyTest(element, "FCBeatChartElement", "MinimumWidth", {0, 12, 144})
       NumberPropertyTest(element, "FCBeatChartElement", "ReferenceWidth", {23, 123, 654})
   else       
       NumberPropertyTest(element, "FCBeatChartElement", "MeasurePos", {0, 32, 512, 1024})
       NumberPropertyTest(element, "FCBeatChartElement", "HorizontalPosition", {0, 13, 144})
       NumberPropertyTest(element, "FCBeatChartElement", "NextHorizontalPosition", {0, 13, 144})
       NumberPropertyTest(element, "FCBeatChartElement", "MinimumPosition", {0, 20, 144})
   end
end


-- Call:
local elements = finale.FCBeatChartElements()
if not AssureTrue(elements:LoadAllForItem(16) > 1, "FCBeatChartElements:LoadAllForItem(16) > 1") then
    return
end
FCBeatChartElement_PropertyTests(elements:GetItemAt(0))
FCBeatChartElement_PropertyTests(elements:GetItemAt(1))
