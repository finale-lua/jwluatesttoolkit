function FCFretboardStyleDef_PropertyTests(obj)
   NumberPropertyTest(obj, "FCFretboardStyleDef", "BarreShapeID", {0, 1, 17})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "CustomShapeID", {0, 1, 17})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "FingeredShapeID", {0, 1, 17})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "FingeringWhiteout", {-144, 0, 144})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "FretCountDefault", {65392, 0, 144})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "FretSpacing", {-144, 0, 144})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "FretThickness", {-144, 0, 144})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "HorizontalFingeringOffset", {-144, 0, 144})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "HorizontalFretNumberOffset", {-144, 0, 144})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "HorizontalHandleOffset", {-144, 0, 144})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "MuteStringShapeID", {0, 1, 17})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "NutThickness", {-144, 0, 144})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "OpenStringShapeID", {0, 1, 17})
   BoolPropertyTest(obj, "FCFretboardStyleDef", "ShowLastFret")
   NumberPropertyTest(obj, "FCFretboardStyleDef", "StringSpacing", {-144, 0, 144})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "StringThickness", {-144, 0, 144})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "VerticalFingeringOffset", {-144, 0, 144})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "VerticalFretNumberOffset", {-144, 0, 144})
   NumberPropertyTest(obj, "FCFretboardStyleDef", "VerticalHandleOffset", {-144, 0, 144})
   
   FCStringGetterSetterTest(obj, "FCFretboardStyleDef", "GetName", "SetName", {"", "Moravia", "Jazzier", "Myfrets", "纏わった", "Grünheit"})
   FCStringGetterSetterTest(obj, "FCFretboardStyleDef", "GetFretNumberText", "SetFretNumberText", {"", "fretty", "fra.", "纏わった", "Grünheit"})
end


-- Call:
local obj = finale.FCFretboardStyleDef()
AssureTrue(obj:Load(1), "FCFretboardStyleDef:Load()")
FCFretboardStyleDef_PropertyTests(obj)
