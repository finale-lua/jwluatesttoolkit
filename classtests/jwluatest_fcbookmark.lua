if not AssureNonNil(finale.FCBookmark, "finale.FCBookmark") then
    return
end

function FCBookmark_PropertyTests(obj)
   obj.ViewType = finale.BOOKMARKTYPE_SCROLLVIEW
   NumberPropertyTest(obj, "FCBookmark", "VerticalPosStaffSet", {1, 3, 8})
   obj.ViewType = finale.BOOKMARKTYPE_PAGEVIEW
   NumberPropertyTest(obj, "FCBookmark", "HorizontalPosInst", {-144, 0, 144})
   NumberPropertyTest(obj, "FCBookmark", "Locator", {1, 3, 7})
   BoolPropertyTest(obj, "FCBookmark", "UseHorizontalPosInst")
   BoolPropertyTest(obj, "FCBookmark", "UseVerticalPosStaffSet")
   BoolPropertyTest(obj, "FCBookmark", "UseViewPercent")
   NumberPropertyTest(obj, "FCBookmark", "VerticalPosStaffSet", {-144, 0, 144})
   NumberPropertyTest(obj, "FCBookmark", "ViewPercent", {0, 47, 100, 124})
   NumberPropertyTest(obj, "FCBookmark", "ViewType", {finale.BOOKMARKTYPE_PAGEVIEW, finale.BOOKMARKTYPE_SCROLLVIEW})
   obj.ViewType = finale.BOOKMARKTYPE_SCROLLVIEW
end


-- Call:
local obj = finale.FCBookmark()
AssureTrue(obj:Load(32769), "FCBookmark:Load()")
FCBookmark_PropertyTests(obj)
