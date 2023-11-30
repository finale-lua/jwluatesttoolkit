function TestConstants_PLAYBACKSTARTMODE()
   NumberConstantTest(finale.PLAYBACKSTART_MEASURE, "PLAYBACKSTART_MEASURE", 0)
   NumberConstantTest(finale.PLAYBACKSTART_LEFTMOST, "PLAYBACKSTART_LEFTMOST", 1)
   NumberConstantTest(finale.PLAYBACKSTART_CURRENTCOUNTER, "PLAYBACKSTART_CURRENTCOUNTER", 2)
end

-- Test the constants:
TestConstants_PLAYBACKSTARTMODE()


function TestConstants_PLAYBACKEXPS_()
   NumberConstantTest(finale.PLAYBACKEXPS_CHASE_FROM_ONE, "PLAYBACKEXPS_CHASE_FROM_ONE", 0)
   NumberConstantTest(finale.PLAYBACKEXPS_RESET, "PLAYBACKEXPS_RESET", 1)
   NumberConstantTest(finale.PLAYBACKEXPS_USECURRENT, "PLAYBACKEXPS_USECURRENT", 2)
end

-- Test the constants:
TestConstants_PLAYBACKEXPS_()


function TestConstants_SMPTETIMETYPE_()
   NumberConstantTest(finale.SMPTETIMETYPE_24, "SMPTETIMETYPE_24", 0)
   NumberConstantTest(finale.SMPTETIMETYPE_25, "SMPTETIMETYPE_25", 1)
   NumberConstantTest(finale.SMPTETIMETYPE_2997_DROP, "SMPTETIMETYPE_2997_DROP", 2)
   NumberConstantTest(finale.SMPTETIMETYPE_30, "SMPTETIMETYPE_30", 3)
   NumberConstantTest(finale.SMPTETIMETYPE_2997_NONDROP, "SMPTETIMETYPE_2997_NONDROP", 4)
end

-- Test the constants:
TestConstants_SMPTETIMETYPE_()


function TestConstants_METSOURCE_()
   NumberConstantTest(finale.METSOURCE_FINALECLICK, "METSOURCE_FINALECLICK", 0)
   NumberConstantTest(finale.METSOURCE_MIDINOTE, "METSOURCE_MIDINOTE", 1)
   NumberConstantTest(finale.METSOURCE_MIDIDATA, "METSOURCE_MIDIDATA", 2)
end

-- Test the constants:
TestConstants_METSOURCE_()
