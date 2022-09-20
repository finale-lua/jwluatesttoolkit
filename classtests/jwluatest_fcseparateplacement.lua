function FCSeparatePlacement_PropertyTests(rpt, measure)
    if not AssureNonNil(rpt.IndividualPositioning, "FCSeparatePlacement_PropertyTests repeat has individual positioning property.") then return end
    if not AssureTrue(rpt:Load(measure, 0), "FCSeparatePlacement_PropertyTests load succeeded.") then return end
    if not AssureTrue(rpt.IndividualPositioning, "FCSeparatePlacement_PropertyTests repeat marked for individual positioning.") then return end
    for _, separates in pairs({rpt:CreateSeparatePlacements(), rpt.CreateTextSeparatePlacements and rpt:CreateTextSeparatePlacements()}) do
        if AssureNonNil(separates, "FCSeparatePlacement_PropertyTests separates collection created.") then
            AssureTrue(separates.Count > 0, "FCSeparatePlacement_PropertyTests separates exist.")
            for sep in each(separates) do
                NumberPropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset1", {-144, 0, 144})
                if sep.Mode ~= finale.SEPARMODE_TEXTREPEAT and sep.Mode ~= finale.SEPARMODE_ENDINGREPEATTEXT then
                    NumberPropertyTest(sep, "FCSeparatePlacement", "HorizontalOffset2", {-144, 0, 144})
                end
                if sep.Mode == finale.SEPARMODE_TEXTREPEAT then
                    NumberPropertyTest(sep, "FCSeparatePlacement", "Measure", {-5, 0, 1, 12, 22})
                end
                NumberPropertyTest_RO(sep, "FCSeparatePlacement", "Mode")
                NumberPropertyTest(sep, "FCSeparatePlacement", "Staff", {-144, 0, 144})
                NumberPropertyTest(sep, "FCSeparatePlacement", "VerticalOffset1", {-144, 0, 144})
                if sep.Mode ~= finale.SEPARMODE_TEXTREPEAT and sep.Mode ~= finale.SEPARMODE_ENDINGREPEATTEXT then
                    NumberPropertyTest(sep, "FCSeparatePlacement", "VerticalOffset2", {-144, 0, 144})
                end
                if sep.Mode ~= finale.SEPARMODE_ENDINGREPEATTEXT then
                    BoolPropertyTest(sep, "FCSeparatePlacement", "Visible")
                end
            end
        end
    end
end


-- Call:
FCSeparatePlacement_PropertyTests(finale.FCEndingRepeat(), 4)
FCSeparatePlacement_PropertyTests(finale.FCTextRepeat(), 3)
FCSeparatePlacement_PropertyTests(finale.FCEndingRepeat(), 6)
FCSeparatePlacement_PropertyTests(finale.FCBackwardRepeat(), 8)
