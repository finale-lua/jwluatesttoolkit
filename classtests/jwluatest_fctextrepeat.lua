-- Make the class test in the file test for this object type!
function FCTextRepeat_PropertyTests(textrepeat)
   NumberPropertyTest(textrepeat, "FCTextRepeat", "Action", 
            {finale.REPACTION_NEVERJUMP, finale.REPACTION_ALWAYSJUMP, 
            finale.REPACTION_JUMPONPASS, finale.REPACTION_PLAYSECTION,
            finale.REPACTION_STOPONPASS})       
   BoolPropertyTest(textrepeat, "FCTextRepeat", "AutoUpdateTarget")
   NumberPropertyTest(textrepeat, "FCTextRepeat", "HorizontalPos", {-289, 0, 310})
   NumberPropertyTest(textrepeat, "FCTextRepeat", "ID", {1,10, 50})
   BoolPropertyTest(textrepeat, "FCTextRepeat", "IndividualPositioning")
   BoolPropertyTest(textrepeat, "FCTextRepeat", "JumpIfIgnore")
   BoolPropertyTest(textrepeat, "FCTextRepeat", "ResetOnRepeat")
   NumberPropertyTest(textrepeat, "FCTextRepeat", "ShowMode", 
            {finale.REPSHOW_ALL, finale.REPSHOW_TOPSTAFF, finale.REPSHOW_STAFFLIST})       
   NumberPropertyTest(textrepeat, "FCTextRepeat", "StaffListID", {1, 3, 8})
   NumberPropertyTest(textrepeat, "FCTextRepeat", "Target", {-300, 0, 300})
   NumberPropertyTest(textrepeat, "FCTextRepeat", "TargetTrigger", 
            {finale.REPTARGET_DEFID, finale.REPTARGET_MEASURENUM, finale.REPTARGET_BACKWARDS})
   NumberPropertyTest(textrepeat, "FCTextRepeat", "TotalPasses", {0, 1, 2})
   NumberPropertyTest(textrepeat, "FCTextRepeat", "VerticalPos", {-310, 0, 309})
   BoolPropertyTest(textrepeat, "FCTextRepeat", "Visible")
end

local textrepeat = finale.FCTextRepeat()
AssureTrue(textrepeat:Load(14, 0))
FCTextRepeat_PropertyTests(textrepeat)   -- Class test here
