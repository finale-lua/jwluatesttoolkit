if not AssureNonNil(finale.FCListenToMidiResult, "finale.FCListenToMidiResult") then
    return
end

function FCListenToMidiResult_PropertyTests(obj)
   NumberPropertyTest(obj, "FCListenToMidiResult", "Data1", {0, 13, 127})
   NumberPropertyTest(obj, "FCListenToMidiResult", "Data2", {0, 13, 127})
   NumberPropertyTest(obj, "FCListenToMidiResult", "MidiChannel", {0, 4, 15})
   NumberPropertyTest(obj, "FCListenToMidiResult", "Status", {0x90, 0x8e, 0xd0})
end


-- Call:
local obj = finale.FCListenToMidiResult()
FCListenToMidiResult_PropertyTests(obj)
