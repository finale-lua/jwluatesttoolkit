function FCClefDef_PropertyTests(obj)
    NumberPropertyTest(obj, "FCClefDef", "BaselineOffset", {-144, 0, 144})
    NumberPropertyTest_RO(obj, "FCClefDef", "ClefIndex", {finale.DEFAULTCLEFID_TREBLE, finale.DEFAULTCLEFID_BASS, finale.DEFAULTCLEFID_TAB1})
    NumberPropertyTest(obj, "FCClefDef", "ClefPosition", {-144, 0, 144})
    BoolPropertyTest(obj, "FCClefDef", "IsShape")
    if obj.IsShape then
        NumberPropertyTest(obj, "FCClefDef", "ShapeID", {0, 1, 3})
    end
    NumberPropertyTest(obj, "FCClefDef", "Symbol", {0, string.byte("&"), 0xe062})
    BoolPropertyTest(obj, "FCClefDef", "UseCustomFont")
    NumberPropertyTest(obj, "FCClefDef", "VerticalAdjust", {-144, 0, 144})
end


-- Call:
local obj = finale.FCClefDef()
AssureTrue(obj:Load(finale.DEFAULTCLEFID_ALTO), "FCClefDef:Load()")
FCClefDef_PropertyTests(obj)

AssureTrue(obj:Load(finale.DEFAULTCLEFID_TAB2), "FCClefDef:Load()")
FCClefDef_PropertyTests(obj)
