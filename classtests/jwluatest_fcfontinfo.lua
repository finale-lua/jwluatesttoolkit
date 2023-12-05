function FCFontInfo_PropertyTests(obj)
    BoolPropertyTest(obj, "FCFontInfo", "Absolute")
    BoolPropertyTest(obj, "FCFontInfo", "Bold")
    NumberPropertyTest(obj, "FCFontInfo", "EnigmaStyles", {finale.ENIGMASTYLE_PLAIN, finale.ENIGMASTYLE_BOLD, finale.ENIGMASTYLE_ITALIC,
            finale.ENIGMASTYLE_UNDERLINE, finale.ENIGMASTYLE_STRIKEOUT, finale.ENIGMASTYLE_ABSOLUTE, finale.ENIGMASTYLE_HIDDEN,
            bit32.bor(finale.ENIGMASTYLE_BOLD, finale.ENIGMASTYLE_ITALIC, finale.ENIGMASTYLE_ABSOLUTE)})
    BoolPropertyTest(obj, "FCFontInfo", "Hidden")
    BoolPropertyTest_RO(obj, "FCFontInfo", "IsSMuFLFont")
    BoolPropertyTest(obj, "FCFontInfo", "Italic")
    PropertyTest(obj, "FCFontInfo", "Name")
    NumberPropertyTest(obj, "FCFontInfo", "Size", {6, 12, 37})
    NumberPropertyTest(obj, "FCFontInfo", "SizeFloat", {6.5, 12.7, 37.5})
    BoolPropertyTest(obj, "FCFontInfo", "StrikeOut")
    BoolPropertyTest(obj, "FCFontInfo", "Underline")
end


-- Call:
local obj = finale.FCFontInfo()
FCFontInfo_PropertyTests(obj)
