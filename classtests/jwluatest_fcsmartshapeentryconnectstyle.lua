local smartshape_prefs = finale.FCSmartShapePrefs()

function FCSmartShapeEntryConnectStyle_PropertyTests(prefs, style_type, index)
    local savefunction = function(obj)
        if not AssureTrue(smartshape_prefs:SaveEntryConnectStyle(obj, style_type, index), "smartshape_prefs:SaveEntryConnectStyle") then
            return nil
        end
        return AssureTrue(smartshape_prefs:Save(), "smartshape_prefs:Save")
    end
    local reloadfunction = function(obj)
        if not AssureTrue(smartshape_prefs:Reload(), "smartshape_prefs:Reload") then return nil end
        return smartshape_prefs:CreateEntryConnectStyle(style_type, index)
    end
   NumberPropertyTest_RO(prefs, "FCSmartShapeEntryConnectStyle", "ConnectionIndex")
   NumberPropertyTest(prefs, "FCSmartShapeEntryConnectStyle", "HorizontalOffset", {-12, 0, 12}, savefunction, reloadfunction)
   NumberPropertyTest(prefs, "FCSmartShapeEntryConnectStyle", "VerticalOffset", {-12, 0, 12}, savefunction, reloadfunction)
end


-- Call:
if not Is26_2OrAbove() then return end

if not AssureNonNil(smartshape_prefs.CreateEntryConnectStyle, "FCSmartShapePrefs.CreateEntryConnectStyle") then
    return
end
AssureTrue(smartshape_prefs:Load(1), "FCSmartShapePrefs:Load(1)")
for _, style_type in pairs({finale.SSENTCNCTSTYLETYPE_SLURS, finale.SSENTCNCTSTYLETYPE_TAB_SLIDES, finale.SSENTCNCTSTYLETYPE_GLISSANDOS, finale.SSENTCNCTSTYLETYPE_BEND_CURVES}) do
    for index = 0, smartshape_prefs:GetEntryConnectStyleCount(style_type) - 1 do
        local prefs = smartshape_prefs:CreateEntryConnectStyle(style_type, index)
        if AssureNonNil(prefs, "FCSmartShapePrefs:CreateEntryConnectStyle for style_type "..tostring(style_type).." and index "..tostring(index)..".") then
            FCSmartShapeEntryConnectStyle_PropertyTests(prefs, style_type, index)
        end
    end
end

