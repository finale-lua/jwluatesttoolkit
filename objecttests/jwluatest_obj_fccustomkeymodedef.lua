if not AssureNonNil(finale.FCCustomKeyModeDef, "This version of Lua plugin does not support FCCustomKeyModeDef. Tests skipped.") then
    return
end


function FCCustomKeyModeDef_ValueTests_ItemNo0(obj)
    AssureTrue(obj:IsPredefined(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is predefined.")
    AssureTrue(obj:IsLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is linear.")
    AssureFalse(obj:IsNonLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not non-linear.")
    AssureEqual(obj:GetKeyID(1), 0x100, "FCCustomKeyModeDef " .. obj.ItemNo .. " GeteKeyID().")
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "DiatonicStepsMap", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "GoToKeyUnit", 0)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "HarmonicReference", 0)
    BoolValuePropertyTest(obj, "FCCustomKeyModeDef", "HasClefAccidentalPlacements", false)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "MiddleKeyNumber", 0)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "SymbolListID", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "TonalCenters", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "TotalChromaticSteps", 0)
end


-- Call:
local obj = finale.FCCustomKeyModeDef()
AssureFalse(obj:Load(0), "FCCustomKeyModeDef:Load(0)")
FCCustomKeyModeDef_ValueTests_ItemNo0(obj)



function FCCustomKeyModeDef_ValueTests_ItemNo1(obj)
    AssureTrue(obj:IsPredefined(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is predefined.")
    AssureTrue(obj:IsLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is linear.")
    AssureFalse(obj:IsNonLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not non-linear.")
    AssureEqual(obj:GetKeyID(-1), -255, "FCCustomKeyModeDef " .. obj.ItemNo .. " GeteKeyID().") -- -255 == 0xff01
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "DiatonicStepsMap", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "GoToKeyUnit", 0)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "HarmonicReference", 0)
    BoolValuePropertyTest(obj, "FCCustomKeyModeDef", "HasClefAccidentalPlacements", false)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "MiddleKeyNumber", 0)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "SymbolListID", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "TonalCenters", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "TotalChromaticSteps", 0)
end


-- Call:
local obj = finale.FCCustomKeyModeDef()
AssureFalse(obj:Load(1), "FCCustomKeyModeDef:Load(1)")
FCCustomKeyModeDef_ValueTests_ItemNo1(obj)



function FCCustomKeyModeDef_ValueTests_ItemNo2(obj)
    AssureFalse(obj:IsPredefined(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined.")
    AssureTrue(obj:IsLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is linear.")
    AssureFalse(obj:IsNonLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not non-linear.")
    AssureEqual(obj:GetKeyID(-2), -510, "FCCustomKeyModeDef " .. obj.ItemNo .. " GeteKeyID().") -- -510 == 0xfe02
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "DiatonicStepsMap", {0, 5, 10, 13, 18, 23, 28})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "GoToKeyUnit", 1)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "HarmonicReference", 0)
    BoolValuePropertyTest(obj, "FCCustomKeyModeDef", "HasClefAccidentalPlacements", false)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "MiddleKeyNumber", 125)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "SymbolListID", 1)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "TonalCenters", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "TotalChromaticSteps", 31)
end


-- Call:
local obj = finale.FCCustomKeyModeDef()
AssureTrue(obj:Load(2), "FCCustomKeyModeDef:Load(2)")
FCCustomKeyModeDef_ValueTests_ItemNo2(obj)



function FCCustomKeyModeDef_ValueTests_ItemNo16384(obj)
    AssureFalse(obj:IsPredefined(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined.")
    AssureFalse(obj:IsLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not linear.")
    AssureTrue(obj:IsNonLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is non-linear.")
    AssureEqual(obj:GetKeyID(4), obj.ItemNo, "FCCustomKeyModeDef " .. obj.ItemNo .. " GeteKeyID().")
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "DiatonicStepsMap", {0, 2, 3, 6, 7, 9, 10})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "GoToKeyUnit", 0)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "HarmonicReference", 0)
    BoolValuePropertyTest(obj, "FCCustomKeyModeDef", "HasClefAccidentalPlacements", true)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "MiddleKeyNumber", 0)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "SymbolListID", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "TonalCenters", {[0]=1, [1]=4, [2]=1, [3]=5, [4]=2, [5]=6, [6]=3, [7]=0})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "TotalChromaticSteps", 12)
end


-- Call:
local obj = finale.FCCustomKeyModeDef()
AssureTrue(obj:Load(16384), "FCCustomKeyModeDef:Load(16384)")
FCCustomKeyModeDef_ValueTests_ItemNo16384(obj)
