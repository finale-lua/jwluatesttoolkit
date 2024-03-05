function FCFontInfo_ValueTests_ItemNoFinaleMaestro_24(obj)
   BoolValuePropertyTest(obj, "FCFontInfo", "Absolute", false)
   BoolValuePropertyTest(obj, "FCFontInfo", "Bold", false)
   NumberValuePropertyTest(obj, "FCFontInfo", "EnigmaStyles", 0)
   BoolValuePropertyTest(obj, "FCFontInfo", "Hidden", false)
   if Is27_1OrAbove()  then
      BoolValuePropertyTest_RO(obj, "FCFontInfo", "IsSMuFLFont", true)
   end
   BoolValuePropertyTest(obj, "FCFontInfo", "Italic", false)
   StringValuePropertyTest(obj, "FCFontInfo", "Name", "Finale Maestro")
   NumberValuePropertyTest(obj, "FCFontInfo", "Size", 24)
   NumberValuePropertyTest(obj, "FCFontInfo", "SizeFloat", 24.0)
   BoolValuePropertyTest(obj, "FCFontInfo", "StrikeOut", false)
   BoolValuePropertyTest(obj, "FCFontInfo", "Underline", false)
   AssureEqual(obj:CreateEnigmaString().LuaString, "^font(Finale Maestro)^size(24)^nfx(0)", "FCFontInfo.CreateEnigmaString()")
end


-- Call:
-- use JW Lua compatible initialization
local obj = finale.FCFontInfo()
obj.Name = "Finale Maestro"
obj.Size = 24
FCFontInfo_ValueTests_ItemNoFinaleMaestro_24(obj)


function FCFontInfo_ValueTests_ItemNoTimesNewRoman_17_efx(obj)
   BoolValuePropertyTest(obj, "FCFontInfo", "Absolute", true)
   BoolValuePropertyTest(obj, "FCFontInfo", "Bold", true)
   NumberValuePropertyTest(obj, "FCFontInfo", "EnigmaStyles", 99)
   BoolValuePropertyTest(obj, "FCFontInfo", "Hidden", false)
   BoolValuePropertyTest_RO(obj, "FCFontInfo", "IsSMuFLFont", false)
   BoolValuePropertyTest(obj, "FCFontInfo", "Italic", true)
   StringValuePropertyTest(obj, "FCFontInfo", "Name", "Times New Roman")
   NumberValuePropertyTest(obj, "FCFontInfo", "Size", 17)
   NumberValuePropertyTest(obj, "FCFontInfo", "SizeFloat", 17.0)
   BoolValuePropertyTest(obj, "FCFontInfo", "StrikeOut", true)
   BoolValuePropertyTest(obj, "FCFontInfo", "Underline", false)
   AssureEqual(obj:CreateEnigmaString().LuaString, "^font(Times New Roman)^size(17)^nfx(99)", "FCFontInfo.CreateEnigmaString()")
end


-- Call:
local obj = finale.FCFontInfo()
-- use JW Lua compatible initialization
obj.Name = "Times New Roman"
obj.Size = 17
obj.Absolute = true
obj.Bold = true
obj.Italic = true
obj.StrikeOut = true
FCFontInfo_ValueTests_ItemNoTimesNewRoman_17_efx(obj)
