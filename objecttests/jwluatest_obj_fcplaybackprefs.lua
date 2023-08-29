function FCHyperClick_ValueTests_ItemNo1(obj)
   NumberValuePropertyTest(obj, "FCHyperClick", "Duration", 500)
   NumberValuePropertyTest(obj, "FCHyperClick", "MidiData1", 37)
   NumberValuePropertyTest(obj, "FCHyperClick", "MidiData2", 127)
   NumberValuePropertyTest(obj, "FCHyperClick", "MidiStatus", 144)
   NumberValuePropertyTest(obj, "FCHyperClick", "VirtualChannel", 9)
end


function FCHyperClick_ValueTests_ItemNo2(obj)
   NumberValuePropertyTest(obj, "FCHyperClick", "Duration", 250)
   NumberValuePropertyTest(obj, "FCHyperClick", "MidiData1", 37)
   NumberValuePropertyTest(obj, "FCHyperClick", "MidiData2", 100)
   NumberValuePropertyTest(obj, "FCHyperClick", "MidiStatus", 144)
   NumberValuePropertyTest(obj, "FCHyperClick", "VirtualChannel", 9)
end


function FCHyperClick_ValueTests_ItemNo3(obj)
   NumberValuePropertyTest(obj, "FCHyperClick", "Duration", 500)
   NumberValuePropertyTest(obj, "FCHyperClick", "MidiData1", 37)
   NumberValuePropertyTest(obj, "FCHyperClick", "MidiData2", 127)
   NumberValuePropertyTest(obj, "FCHyperClick", "MidiStatus", 144)
   NumberValuePropertyTest(obj, "FCHyperClick", "VirtualChannel", 9)
end


function FCHyperClick_ValueTests_ItemNo4(obj)
   NumberValuePropertyTest(obj, "FCHyperClick", "Duration", 250)
   NumberValuePropertyTest(obj, "FCHyperClick", "MidiData1", 37)
   NumberValuePropertyTest(obj, "FCHyperClick", "MidiData2", 100)
   NumberValuePropertyTest(obj, "FCHyperClick", "MidiStatus", 144)
   NumberValuePropertyTest(obj, "FCHyperClick", "VirtualChannel", 9)
end

function FCPlaybackPrefs_ValueTests_ItemNo1(pref)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "BaseKeyVelocity", 64)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "ClickWhenPlaying", false)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "ClickWhenRecording", true)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "CountOffMeasures", 2)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "CountOffWhenPlaying", false)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "CountOffWhenRecording", true)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "ExpressionsMode", 0)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "MetronomeBeat", 1024)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "MetronomeSoundSource", 1)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "MetronomeSpeed", 120)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "PlayContinuousData", true)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "PlayKeyVelocities", true)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "PlayNoteDurations", true)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "PlayTempoChanges", true)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "RepeatsIgnore", true)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "RepeatsReset", true)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "SMPTEFrameRate", 2)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "SMPTEStartTime", 65100)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "ScrollingPlayback", true)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "SendClickOff", true)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "SendPatchesToMidi", true)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "StartMeasure", 1)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "StartMeasurePos", 0)
    if finenv.IsRGPLua then
        -- a typo in the PDK Framework source code (now fixed in RGP Lua) caused JW Lua to crash Finale if it executed this line:
        NumberValuePropertyTest(pref, "FCPlaybackPrefs", "StartMode", 0)
    end
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "StartRepeatPass", 1)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "StopMeasure", 32766)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "StopMeasurePos", 0)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "StopRepeatPass", 1)
    NumberValuePropertyTest(pref, "FCPlaybackPrefs", "Swing", 0)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "SyncChaseContinuousData", false)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "SyncChasePatches", false)
    BoolValuePropertyTest(pref, "FCPlaybackPrefs", "SyncReceiveMidi", false)
    --------
    FCHyperClick_ValueTests_ItemNo1(pref.ClickInfoForMidiNotesOnDownBeats)
    FCHyperClick_ValueTests_ItemNo2(pref.ClickInfoForMidiNotesOnOtherBeats)
    FCHyperClick_ValueTests_ItemNo3(pref.ClickInfoForMidiDataOnDownBeats)
    FCHyperClick_ValueTests_ItemNo4(pref.ClickInfoForMidiDataOnOtherBeats)
end

-- Call:
local pref = finale.FCPlaybackPrefs()
AssureTrue(pref:Load(1), "FCPlaybackPrefs:Load(1)")
FCPlaybackPrefs_ValueTests_ItemNo1(pref)

-- Call:
if finenv.RawFinaleVersion > highest_playback_prefs_tested_version then
    pref = finale.FCPlaybackPrefs(true) -- secret constructor for Finale testing. Should not be used in real code.
    AssureTrue(pref:Load(1), "FCPlaybackPrefs:Load(1) (new struct)")
    FCPlaybackPrefs_ValueTests_ItemNo1(pref)
end
