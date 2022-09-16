
function FCExpression_Test_Unlinkable(measure, staff, partnumber)
    local expressions = finale.FCExpressions()
    if not AssureTrue(expressions:LoadAllInCell(finale.FCCell(measure, staff))>0, "FCExpressions:LoadAllInCell loaded items") then return end
    for expression in each(expressions) do
        UnlinkableNumberPropertyTest(expression, "FCExpression", "HorizontalPos", "Reload", nil, -24, partnumber)
        UnlinkableNumberPropertyTest(expression, "FCExpression", "MeasurePos", "Reload", nil, 24, partnumber)
        UnlinkableNumberPropertyTest(expression, "FCExpression", "VerticalPos", "Reload", nil, -24, partnumber)
        UnlinkableNumberPropertyTest(expression, "FCExpression", "Visible", "Reload", nil, -24, partnumber)
    end
end

-- Call:
FCExpression_Test_Unlinkable(3, 3, 1)
