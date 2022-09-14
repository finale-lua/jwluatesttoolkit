local smartshape_prefs = finale.FCSmartShapePrefs()

function FCSlurContourPrefs_PropertyTests(prefs)
    local savefunction = function(obj)
        if not AssureTrue(smartshape_prefs:SaveSlurContourPrefs(obj), "smartshape_prefs:SaveSlurContourPrefs") then
            return nil
        end
        return AssureTrue(smartshape_prefs:Save(), "smartshape_prefs:Save")
    end
    local reloadfunction = function(obj)
        if not AssureTrue(smartshape_prefs:Reload(), "smartshape_prefs:Reload") then return nil end
        return smartshape_prefs:CreateSlurContourPrefs()
    end
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "ExtraLongHeight", {-144, 0, 144}, savefunction, reloadfunction)
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "ExtraLongInset", {-144, 0, 144}, savefunction, reloadfunction)
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "ExtraLongSpan", {12, 245, 1256}, savefunction, reloadfunction)
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "LongHeight", {-144, 0, 144}, savefunction, reloadfunction)
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "LongInset", {-144, 0, 144}, savefunction, reloadfunction)
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "LongSpan", {12, 245, 1256}, savefunction, reloadfunction)
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "MediumHeight", {-144, 0, 144}, savefunction, reloadfunction)
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "MediumInset", {-144, 0, 144}, savefunction, reloadfunction)
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "MediumSpan", {12, 245, 1256}, savefunction, reloadfunction)
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "ShortHeight", {-144, 0, 144}, savefunction, reloadfunction)
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "ShortInset", {-144, 0, 144}, savefunction, reloadfunction)
   NumberPropertyTest(prefs, "FCSlurContourPrefs", "ShortSpan", {12, 245, 125}, savefunction, reloadfunction)
end


-- Call:
AssureTrue(smartshape_prefs:Load(1), "FCSmartShapePrefs:Load(1)")
local slur_prefs = smartshape_prefs:CreateSlurContourPrefs()
FCSlurContourPrefs_PropertyTests(slur_prefs)
