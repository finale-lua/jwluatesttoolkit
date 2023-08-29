function FCPlaybackPrefs_PropertyTests(pref)
    NumberPropertyTest(pref, "FCPlaybackPrefs", "BaseKeyVelocity", {0, 24, 48, 64, 96, 127})
    BoolPropertyTest(pref, "FCPlaybackPrefs", "ClickWhenPlaying")
    BoolPropertyTest(pref, "FCPlaybackPrefs", "ClickWhenRecording")
    NumberPropertyTest(pref, "FCPlaybackPrefs", "CountOffMeasures", {0, 1, 2, 5, 126})
    BoolPropertyTest(pref, "FCPlaybackPrefs", "CountOffWhenPlaying")
    BoolPropertyTest(pref, "FCPlaybackPrefs", "CountOffWhenRecording")
    NumberPropertyTest(pref, "FCPlaybackPrefs", "ExpressionsMode", {finale.PLAYBACKEXPS_CHASE_FROM_ONE, finale.PLAYBACKEXPS_RESET, finale.PLAYBACKEXPS_USECURRENT})
    NumberPropertyTest(pref, "FCPlaybackPrefs", "MetronomeBeat", {256, 512, 1024, 1536, 2048})
    NumberPropertyTest(pref, "FCPlaybackPrefs", "MetronomeSoundSource", {finale.METSOURCE_FINALECLICK, finale.METSOURCE_MIDINOTE, finale.METSOURCE_MIDIDATA})
    NumberPropertyTest(pref, "FCPlaybackPrefs", "MetronomeSpeed", {30, 60, 96, 120, 144})
    BoolPropertyTest(pref, "FCPlaybackPrefs", "PlayContinuousData")
    BoolPropertyTest(pref, "FCPlaybackPrefs", "PlayKeyVelocities")
    BoolPropertyTest(pref, "FCPlaybackPrefs", "PlayNoteDurations")
    BoolPropertyTest(pref, "FCPlaybackPrefs", "PlayTempoChanges")
    BoolPropertyTest(pref, "FCPlaybackPrefs", "RepeatsIgnore")
    BoolPropertyTest(pref, "FCPlaybackPrefs", "RepeatsReset")
    NumberPropertyTest(pref, "FCPlaybackPrefs", "SMPTEFrameRate", {finale.SMPTETIMETYPE_24, finale.SMPTETIMETYPE_25, finale.SMPTETIMETYPE_2997_DROP,
            finale.SMPTETIMETYPE_30, finale.SMPTETIMETYPE_2997_NONDROP})
    NumberPropertyTest(pref, "FCPlaybackPrefs", "SMPTEStartTime", {0, 517, 1234, 0x6fffff})
    BoolPropertyTest(pref, "FCPlaybackPrefs", "ScrollingPlayback")
    BoolPropertyTest(pref, "FCPlaybackPrefs", "SendClickOff")
    BoolPropertyTest(pref, "FCPlaybackPrefs", "SendPatchesToMidi")
    NumberPropertyTest(pref, "FCPlaybackPrefs", "StartMeasure", {1, 10, 20})
    NumberPropertyTest(pref, "FCPlaybackPrefs", "StartMeasurePos", {0, 512, 3072, 1536})
    if finenv.IsRGPLua then
        -- a typo in the PDK Framework source code (now fixed in RGP Lua) caused JW Lua to crash Finale if it executed this line:
        NumberPropertyTest(pref, "FCPlaybackPrefs", "StartMode", {finale.PLAYBACKSTART_MEASURE, finale.PLAYBACKSTART_LEFTMOST,  finale.PLAYBACKSTART_CURRENTCOUNTER})
    end
    NumberPropertyTest(pref, "FCPlaybackPrefs", "StartRepeatPass", {1, 2, 3, 4, 1245})
    NumberPropertyTest(pref, "FCPlaybackPrefs", "StopMeasure", {1, 10, 20})
    NumberPropertyTest(pref, "FCPlaybackPrefs", "StopMeasurePos", {0, 512, 3072, 1536})
    NumberPropertyTest(pref, "FCPlaybackPrefs", "StopRepeatPass", {1, 2, 3, 4, 1245})
    NumberPropertyTest(pref, "FCPlaybackPrefs", "Swing", {10, 100, 100, 10000})
    BoolPropertyTest(pref, "FCPlaybackPrefs", "SyncChaseContinuousData")
    BoolPropertyTest(pref, "FCPlaybackPrefs", "SyncChasePatches")
    BoolPropertyTest(pref, "FCPlaybackPrefs", "SyncReceiveMidi")
end

-- Call:
local pref = finale.FCPlaybackPrefs()
AssureTrue(pref:Load(1))
FCPlaybackPrefs_PropertyTests(pref)

-- Test new struct
pref = finale.FCPlaybackPrefs(true) -- hidden constructor to use bug-ridden playback prefs struct introduced in Finale 26.2
AssureTrue(pref:Load(1))
FCPlaybackPrefs_PropertyTests(pref)

