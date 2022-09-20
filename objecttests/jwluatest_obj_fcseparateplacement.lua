function FCSeparatePlacement_ValueTests_ItemNo3_2_1(sep)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset1", -35)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset2", 0)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "Measure", 3)
   NumberValuePropertyTest_RO(sep, "FCSeparatePlacement", "Mode", 1)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "Staff", 2)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "VerticalOffset1", 0)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "VerticalOffset2", 0)
   BoolValuePropertyTest(sep, "FCSeparatePlacement", "Visible", true)
end


function FCSeparatePlacement_ValueTests_ItemNo3_3_1(sep)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset1", 50)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset2", 0)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "Measure", 3)
   NumberValuePropertyTest_RO(sep, "FCSeparatePlacement", "Mode", 1)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "Staff", 3)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "VerticalOffset1", 0)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "VerticalOffset2", 0)
   BoolValuePropertyTest(sep, "FCSeparatePlacement", "Visible", true)
end


function FCSeparatePlacement_ValueTests_ItemNo3_1_1(sep)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset1", 31)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset2", 0)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "Measure", 3)
   NumberValuePropertyTest_RO(sep, "FCSeparatePlacement", "Mode", 1)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "Staff", 1)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "VerticalOffset1", 0)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "VerticalOffset2", 0)
   BoolValuePropertyTest(sep, "FCSeparatePlacement", "Visible", true)
end


function FCSeparatePlacement_ValueTests_ItemNo6_1_2(sep)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset1", 2)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset2", 0)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "Measure", 0)
   NumberValuePropertyTest_RO(sep, "FCSeparatePlacement", "Mode", 2)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "Staff", 1)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "VerticalOffset1", 44)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "VerticalOffset2", 0)
   BoolValuePropertyTest(sep, "FCSeparatePlacement", "Visible", true)
end


function FCSeparatePlacement_ValueTests_ItemNo6_1_3(sep)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset1", 24)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset2", 0)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "Measure", 0)
   NumberValuePropertyTest_RO(sep, "FCSeparatePlacement", "Mode", 3)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "Staff", 1)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "VerticalOffset1", -34)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "VerticalOffset2", 0)
   BoolValuePropertyTest(sep, "FCSeparatePlacement", "Visible", true, true) -- Visible is read-only for Mode 3
end


function FCSeparatePlacement_ValueTests_ItemNo8_3_0(sep)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset1", 0)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset2", 0)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "Measure", 0)
   NumberValuePropertyTest_RO(sep, "FCSeparatePlacement", "Mode", 0)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "Staff", 3)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "VerticalOffset1", 0)
   NumberValuePropertyTest(sep, "FCSeparatePlacement", "VerticalOffset2", 0)
   BoolValuePropertyTest(sep, "FCSeparatePlacement", "Visible", false)
end


--Call:
function FCSeparatePlacement_ValueTests(rpt, measure)
    if not AssureTrue(rpt:Load(measure, 0), "FCSeparatePlacement_ValueTests load succeeded.") then return end
    for _, separates in pairs({rpt:CreateSeparatePlacements(), rpt.CreateTextSeparatePlacements and rpt:CreateTextSeparatePlacements()}) do
        for sep in each(separates) do
            local funcname = "FCSeparatePlacement_ValueTests_ItemNo"..tostring(measure).."_"..tostring(sep.Staff).."_"..tostring(sep.Mode)
            if AssureNonNil(_G[funcname], funcname) and AssureTrue(type(_G[funcname]) == "function", funcname.." is a function.") then
                _G[funcname](sep)
            end
        end
    end
end

FCSeparatePlacement_ValueTests(finale.FCTextRepeat(), 3)
FCSeparatePlacement_ValueTests(finale.FCEndingRepeat(), 6)
FCSeparatePlacement_ValueTests(finale.FCBackwardRepeat(), 8)
