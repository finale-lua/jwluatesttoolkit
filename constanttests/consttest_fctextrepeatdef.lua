function TestConstants_TEXTREPJUST_()
   NumberConstantTest(finale.TEXTREPJUST_CENTER, "TEXTREPJUST_CENTER", 2)
   NumberConstantTest(finale.TEXTREPJUST_FULL, "TEXTREPJUST_FULL", 3)
   NumberConstantTest(finale.TEXTREPJUST_LEFT, "TEXTREPJUST_LEFT", 0)
   NumberConstantTest(finale.TEXTREPJUST_RIGHT, "TEXTREPJUST_RIGHT", 1)
end

-- Test the constants:
TestConstants_TEXTREPJUST_()


function TestConstants_REPEATREPLACE_()
   NumberConstantTest(finale.REPEATREPLACE_TARGETMEASURE, "REPEATREPLACE_TARGETMEASURE", 2)
   NumberConstantTest(finale.REPEATREPLACE_TARGETTEXT, "REPEATREPLACE_TARGETTEXT", 1)
   NumberConstantTest(finale.REPEATREPLACE_TIMESPLAYED, "REPEATREPLACE_TIMESPLAYED", 0)
end

-- Test the constants:
TestConstants_REPEATREPLACE_()


function TestConstants_REPTARGET_()
   NumberConstantTest(finale.REPTARGET_UNDEFINED, "REPTARGET_UNDEFINED", 0)
   NumberConstantTest(finale.REPTARGET_MEASURENUM, "REPTARGET_MEASURENUM", 1)
   NumberConstantTest(finale.REPTARGET_BACKWARDS, "REPTARGET_BACKWARDS", 2)
   NumberConstantTest(finale.REPTARGET_DEFID, "REPTARGET_DEFID", 3)
   NumberConstantTest(finale.REPTARGET_NEVERSKIPENDING, "REPTARGET_NEVERSKIPENDING", 5)
   NumberConstantTest(finale.REPTARGET_FORWARDS, "REPTARGET_FORWARDS", 8)
   NumberConstantTest(finale.REPTARGET_NEXTENDING, "REPTARGET_NEXTENDING", 9)
end

-- Test the constants:
TestConstants_REPTARGET_()


function TestConstants_REPSHOW_()
   NumberConstantTest(finale.REPSHOW_ALL, "REPSHOW_ALL", 0)
   NumberConstantTest(finale.REPSHOW_TOPSTAFF, "REPSHOW_TOPSTAFF", 1)
   NumberConstantTest(finale.REPSHOW_STAFFLIST, "REPSHOW_STAFFLIST", 2)
end

-- Test the constants:
TestConstants_REPSHOW_()
