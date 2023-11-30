if not AssureNonNil(finale.FCBookmark, "finale.FCBookmark") then
    return
end

function FCBookmark_ValueTests_ItemNo32768(bookmark)
   NumberValuePropertyTest(bookmark, "FCBookmark", "HorizontalPosInst", 2)
   NumberValuePropertyTest(bookmark, "FCBookmark", "Locator", 7)
   BoolValuePropertyTest(bookmark, "FCBookmark", "UseHorizontalPosInst", true)
   BoolValuePropertyTest(bookmark, "FCBookmark", "UseVerticalPosStaffSet", true)
   BoolValuePropertyTest(bookmark, "FCBookmark", "UseViewPercent", true)
   NumberValuePropertyTest(bookmark, "FCBookmark", "VerticalPosStaffSet", 7, 2)
   NumberValuePropertyTest(bookmark, "FCBookmark", "ViewPercent", 110)
   NumberValuePropertyTest(bookmark, "FCBookmark", "ViewType", 1)
end

-- Call:
local bookmark1 = finale.FCBookmark()
AssureTrue(bookmark1:Load(32768), "FCBookmark:Load(32768)")
FCBookmark_ValueTests_ItemNo32768(bookmark1)


function FCBookmark_ValueTests_ItemNo32769(bookmark)
   NumberValuePropertyTest(bookmark, "FCBookmark", "HorizontalPosInst", -73)
   NumberValuePropertyTest(bookmark, "FCBookmark", "Locator", 3)
   BoolValuePropertyTest(bookmark, "FCBookmark", "UseHorizontalPosInst", true)
   BoolValuePropertyTest(bookmark, "FCBookmark", "UseVerticalPosStaffSet", true)
   BoolValuePropertyTest(bookmark, "FCBookmark", "UseViewPercent", false)
   NumberValuePropertyTest(bookmark, "FCBookmark", "VerticalPosStaffSet", 1320)
   NumberValuePropertyTest(bookmark, "FCBookmark", "ViewPercent", 110)
   NumberValuePropertyTest(bookmark, "FCBookmark", "ViewType", 0)
end


-- Call:
local bookmark2 = finale.FCBookmark()
AssureTrue(bookmark2:Load(32769), "FCBookmark:Load(32769)")
FCBookmark_ValueTests_ItemNo32769(bookmark2)

