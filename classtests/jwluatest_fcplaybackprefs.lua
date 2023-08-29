function FCPlaybackPrefs_PropertyTests(pref)
    NumberPropertyTest(pref, "FCPlaybackPrefs", "BaseKeyVelocity", {0, 24, 48, 64, 96, 127})
    PropertyTest_RO(pref, "FCPlaybackPrefs", "ClickInfoForMidiNotesOnDownBeats")
    PropertyTest_RO(pref, "FCPlaybackPrefs", "ClickInfoForMidiNotesOnOtherBeats")
    PropertyTest_RO(pref, "FCPlaybackPrefs", "ClickInfoForMidiDataOnDownBeats")
    PropertyTest_RO(pref, "FCPlaybackPrefs", "ClickInfoForMidiDataOnOtherBeats")
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
    ---------------
    local function FCHyperClick_PropertyTests(obj, propertyname, forMidiNote)
        local function save_func()
            return AssureTrue(pref:Save(), propertyname)
        end
        local function reload_func()
            return AssureTrue(pref:Reload(), propertyname)
        end
        NumberPropertyTest(obj, "FCHyperClick", "Duration", {0, 25, 350, 500, 1200, 13456}, save_func, reload_func, false)
        NumberPropertyTest(obj, "FCHyperClick", "MidiData1", {0, 12, 47, 127}, save_func, reload_func, false)
        NumberPropertyTest(obj, "FCHyperClick", "MidiData2", {0, 12, 47, 127}, save_func, reload_func, false)
        if not forMidiNote then -- the Midi Note metronome source doesn't save the status
            NumberPropertyTest(obj, "FCHyperClick", "MidiStatus", {0x80, 0x90, 0xa0, 0xb0, 0xc0, 0xe0, 0xf0}, save_func, reload_func, false)
        end
        NumberPropertyTest(obj, "FCHyperClick", "VirtualChannel", {0, 12, 47, 127}, save_func, reload_func, false)
    end
    FCHyperClick_PropertyTests(pref.ClickInfoForMidiNotesOnDownBeats, "ClickInfoForMidiNotesOnDownBeats", true)
    FCHyperClick_PropertyTests(pref.ClickInfoForMidiNotesOnOtherBeats, "ClickInfoForMidiNotesOnOtherBeats", true)
    FCHyperClick_PropertyTests(pref.ClickInfoForMidiDataOnDownBeats, "ClickInfoForMidiDataOnDownBeats")
    FCHyperClick_PropertyTests(pref.ClickInfoForMidiDataOnOtherBeats, "ClickInfoForMidiDataOnOtherBeats")
end

-- Call:
local pref = finale.FCPlaybackPrefs()
AssureTrue(pref:Load(1))
FCPlaybackPrefs_PropertyTests(pref)

-- Test new struct
if finenv.RawFinaleVersion > highest_playback_prefs_tested_version then
    pref = finale.FCPlaybackPrefs(true) -- hidden constructor to use bug-ridden playback prefs struct introduced in Finale 26.2
    AssureTrue(pref:Load(1))
    FCPlaybackPrefs_PropertyTests(pref)
end
