if not AssureNonNil(finale.FCCustomKeyModeDef, "This version of Lua plugin does not support FCCustomKeyModeDef. Tests skipped.") then
    return
end


function FCCustomKeyModeDef_ValueTests_ItemNo0(obj)
    local key = obj:CreateKeySignature()
    AssureNonNil(key, "FCCustomKeyModeDef " .. obj.ItemNo .. " created no key signature.")
    AssureTrue(obj:IsPredefined(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is predefined.")
    AssureTrue(key:IsMajor(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is predefined major.")
    AssureFalse(key:IsMinor(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined minor.")
    AssureTrue(obj:IsLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is linear.")
    AssureFalse(obj:IsNonLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not non-linear.")
    AssureEqual(obj:GetKeyID(1), 0x001, "FCCustomKeyModeDef " .. obj.ItemNo .. " GetKeyID().")
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalAmounts", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalFontID", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalOrder", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "BaseTonalCenter", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "ClefAccidentalPlacements", {})
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
    local key = obj:CreateKeySignature()
    AssureNonNil(key, "FCCustomKeyModeDef " .. obj.ItemNo .. " created no key signature.")
    AssureTrue(obj:IsPredefined(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is predefined.")
    AssureFalse(key:IsMajor(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined major.")
    AssureTrue(key:IsMinor(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is predefined minor.")
    AssureTrue(obj:IsLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is linear.")
    AssureFalse(obj:IsNonLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not non-linear.")
    AssureEqual(obj:GetKeyID(-1), 0x1ff, "FCCustomKeyModeDef " .. obj.ItemNo .. " GetKeyID().")
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalAmounts", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalFontID", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalOrder", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "BaseTonalCenter", 5)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "ClefAccidentalPlacements", {})
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
    local key = obj:CreateKeySignature()
    AssureNonNil(key, "FCCustomKeyModeDef " .. obj.ItemNo .. " created no key signature.")
    AssureFalse(obj:IsPredefined(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined.")
    AssureFalse(key:IsMajor(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined major.")
    AssureFalse(key:IsMinor(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined minor.")
    AssureTrue(obj:IsLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is linear.")
    AssureFalse(obj:IsNonLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not non-linear.")
    AssureEqual(obj:GetKeyID(-2), 0x2fe, "FCCustomKeyModeDef " .. obj.ItemNo .. " GetKeyID().")
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalAmounts", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalFontID", 9)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalOrder", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "BaseTonalCenter", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "ClefAccidentalPlacements", {})
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



function FCCustomKeyModeDef_ValueTests_ItemNo3(obj)
    local key = obj:CreateKeySignature()
    AssureNonNil(key, "FCCustomKeyModeDef " .. obj.ItemNo .. " created no key signature.")
    AssureFalse(obj:IsPredefined(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined.")
    AssureFalse(key:IsMajor(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined major.")
    AssureFalse(key:IsMinor(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined minor.")
    AssureTrue(obj:IsLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is linear.")
    AssureFalse(obj:IsNonLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not non-linear.")
    AssureEqual(obj:GetKeyID(2), 0x302, "FCCustomKeyModeDef " .. obj.ItemNo .. " GetKeyID().")
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalAmounts", finale.FCCustomKeyModeDef.GetDefaultAccidentalAmounts())
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalFontID", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalOrder", finale.FCCustomKeyModeDef.GetDefaultAccidentalOrder())
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "BaseTonalCenter", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "ClefAccidentalPlacements", finale.FCCustomKeyModeDef.GetDefaultClefAccidentalPlacements())
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "DiatonicStepsMap", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "GoToKeyUnit", 1)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "HarmonicReference", 0)
    BoolValuePropertyTest(obj, "FCCustomKeyModeDef", "HasClefAccidentalPlacements", true)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "MiddleKeyNumber", 60)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "SymbolListID", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "TonalCenters", finale.FCCustomKeyModeDef.GetDefaultTonalCenters())
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "TotalChromaticSteps", 0)
end


-- Call:
local obj = finale.FCCustomKeyModeDef()
AssureTrue(obj:Load(3), "FCCustomKeyModeDef:Load(3)")
FCCustomKeyModeDef_ValueTests_ItemNo3(obj)



function FCCustomKeyModeDef_ValueTests_ItemNo4(obj)
    local key = obj:CreateKeySignature()
    AssureNonNil(key, "FCCustomKeyModeDef " .. obj.ItemNo .. " created no key signature.")
    AssureFalse(obj:IsPredefined(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined.")
    AssureFalse(key:IsMajor(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined major.")
    AssureFalse(key:IsMinor(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined minor.")
    AssureTrue(obj:IsLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is linear.")
    AssureFalse(obj:IsNonLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not non-linear.")
    AssureEqual(obj:GetKeyID(4), 0x404, "FCCustomKeyModeDef " .. obj.ItemNo .. " GetKeyID().")
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalAmounts", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalFontID", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalOrder", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "BaseTonalCenter", 2)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "ClefAccidentalPlacements", {})
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "DiatonicStepsMap", {})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "GoToKeyUnit", 1)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "HarmonicReference", 0)
    BoolValuePropertyTest(obj, "FCCustomKeyModeDef", "HasClefAccidentalPlacements", false)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "MiddleKeyNumber", 60)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "SymbolListID", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "TonalCenters",
            {[-7]=2, [-6]=6, [-5]=3, [-4]=0, [-3]=4, [-2]=1, [-1]=5, [0]=2, [1]=6, [2]=3, [3]=0, [4]=4, [5]=1, [6]=5, [7]=2})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "TotalChromaticSteps", 0)
end


-- Call:
local obj = finale.FCCustomKeyModeDef()
AssureTrue(obj:Load(4), "FCCustomKeyModeDef:Load(4)")
FCCustomKeyModeDef_ValueTests_ItemNo4(obj)



function FCCustomKeyModeDef_ValueTests_ItemNo16384(obj)
    local key = obj:CreateKeySignature()
    AssureNonNil(key, "FCCustomKeyModeDef " .. obj.ItemNo .. " created no key signature.")
    AssureFalse(obj:IsPredefined(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined.")
    AssureFalse(key:IsMajor(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined major.")
    AssureFalse(key:IsMinor(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not predefined minor.")
    AssureFalse(obj:IsLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is not linear.")
    AssureTrue(obj:IsNonLinear(), "FCCustomKeyModeDef " .. obj.ItemNo .. " is non-linear.")
    AssureEqual(obj:GetKeyID(4), obj.ItemNo, "FCCustomKeyModeDef " .. obj.ItemNo .. " GetKeyID().")
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalAmounts", {-1, -1, 1, 0, 0, 0, 0})
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalFontID", 0)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "AccidentalOrder", {6, 2, 3, 1, 5, 2, 6}) -- only the first three matter (due to 0 at index 4 of AccidentalAmounts)
    NumberValuePropertyTest(obj, "FCCustomKeyModeDef", "BaseTonalCenter", 1)
    TableValuePropertyTest(obj, "FCCustomKeyModeDef", "ClefAccidentalPlacements", {
                        {[1]=0, [2]=1, [3]=1, [4]=1, [5]=0, [6]=1, [7]=0},
                        {[1]=-1, [2]=0, [3]=0, [4]=0, [5]=-1, [6]=0, [7]=-1},
                        {[1]=-1, [2]=0, [3]=-1, [4]=0, [5]=-1, [6]=0, [7]=-1},
                        {[1]=-2, [2]=-1, [3]=-1, [4]=-1, [5]=-2, [6]=-1, [7]=-2},
                        {[1]=0, [2]=1, [3]=1, [4]=1, [5]=0, [6]=1, [7]=0},
                        {[1]=-1, [2]=0, [3]=0, [4]=0, [5]=-1, [6]=0, [7]=-1},
                        {[1]=-3, [2]=-2, [3]=-2, [4]=-2, [5]=-3, [6]=-2, [7]=-3},
                        {[1]=-1, [2]=-1, [3]=-1, [4]=-1, [5]=-1, [6]=-1, [7]=-1},
                        {[1]=0, [2]=1, [3]=1, [4]=1, [5]=0, [6]=1, [7]=0},
                        {[1]=-1, [2]=-1, [3]=-1, [4]=-1, [5]=-1, [6]=-1, [7]=-1},
                        {[1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=0},
                        {[1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=0},
                        {[1]=0, [2]=1, [3]=1, [4]=1, [5]=0, [6]=1, [7]=0},
                        {[1]=1, [2]=2, [3]=2, [4]=2, [5]=1, [6]=2, [7]=1},
                        {[1]=-1, [2]=0, [3]=0, [4]=0, [5]=-1, [6]=0, [7]=-1},
                        {[1]=0, [2]=1, [3]=1, [4]=1, [5]=0, [6]=1, [7]=0},
                        {[1]=0, [2]=1, [3]=1, [4]=1, [5]=0, [6]=1, [7]=0},
                        {[1]=0, [2]=1, [3]=1, [4]=1, [5]=0, [6]=1, [7]=0}})
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
