function FCCustomSmartLineDef_PropertyTests(customlinedef)
    local tryWithStyle = function(stylepropertyname, newstyle, propertyname, valuetable)
        local oldstyle = customlinedef[stylepropertyname]
        customlinedef[stylepropertyname] = newstyle
        NumberPropertyTest(customlinedef, "FCCustomSmartLineDef", propertyname, valuetable)
        customlinedef[stylepropertyname] = oldstyle
        customlinedef:Save()
    end
    
    tryWithStyle("EndArrowheadStyle", finale.CLENDPOINT_CUSTOM, "EndArrowheadShapeID", {0, 10, 345})
    NumberPropertyTest(customlinedef, "FCCustomSmartLineDef", "EndArrowheadStyle", {finale.CLENDPOINT_NONE, finale.CLENDPOINT_PRESET, finale.CLENDPOINT_CUSTOM, finale.CLENDPOINT_HOOK} )
    tryWithStyle("EndArrowheadStyle", finale.CLENDPOINT_HOOK, "EndHookLength", {-290, 0, 290})
    BoolPropertyTest(customlinedef, "FCCustomSmartLineDef", "Horizontal")
    NumberPropertyTest(customlinedef, "FCCustomSmartLineDef", "LineCharacter", {0, 128, 258})
    tryWithStyle("LineStyle", finale.CUSTOMLINE_CHARACTER, "LineCharacterBaselineShift", {-12, 0, 23})
    tryWithStyle("LineStyle", finale.CUSTOMLINE_DASHED, "LineDashLength", {0, 24, 260})
    tryWithStyle("LineStyle", finale.CUSTOMLINE_DASHED, "LineDashSpace", {0, 18, 258})
    NumberPropertyTest(customlinedef, "FCCustomSmartLineDef", "LineStyle", {finale.CUSTOMLINE_SOLID, finale.CUSTOMLINE_DASHED, finale.CUSTOMLINE_CHARACTER})
    tryWithStyle("LineStyle", finale.CUSTOMLINE_DASHED, "LineWidth", {0, 100, 345} )
    tryWithStyle("LineStyle", finale.CUSTOMLINE_SOLID, "LineWidth", {0, 100, 345} )
    tryWithStyle("StartArrowheadStyle", finale.CLENDPOINT_CUSTOM, "StartArrowheadShapeID", {0, 11, 456} )
    NumberPropertyTest(customlinedef, "FCCustomSmartLineDef", "StartArrowheadStyle", {finale.CLENDPOINT_NONE, finale.CLENDPOINT_PRESET, finale.CLENDPOINT_CUSTOM, finale.CLENDPOINT_HOOK})
    tryWithStyle("StartArrowheadStyle", finale.CLENDPOINT_HOOK, "StartHookLength", {-300, 0, 300})   
    BoolPropertyTest(customlinedef, "FCCustomSmartLineDef", "UseAfterStartTextOffset")
    NumberPropertyTest(customlinedef, "FCCustomSmartLineDef", "StartLineHorizontalOffset", {-48, 0, 144})
    BoolPropertyTest(customlinedef, "FCCustomSmartLineDef", "UseBeforeEndTextOffset")
    NumberPropertyTest(customlinedef, "FCCustomSmartLineDef", "EndLineHorizontalOffset", {-48, 0, 144})
    BoolPropertyTest(customlinedef, "FCCustomSmartLineDef", "UseAfterContinuationTextOffset")
    NumberPropertyTest(customlinedef, "FCCustomSmartLineDef", "ContinuationLineHorizontalOffset", {-48, 0, 144})
    NumberPropertyTest(customlinedef, "FCCustomSmartLineDef", "LineVerticalOffset", {-48, 0, 23})
end


-- Call:
local customlinedef = finale.FCCustomSmartLineDef()
AssureTrue(customlinedef:Load(1))
FCCustomSmartLineDef_PropertyTests(customlinedef)
