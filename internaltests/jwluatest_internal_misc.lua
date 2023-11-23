-- These are tests more of Finale than Finale Lua, and some may be disabled if the
-- Finale bugs they test go away or are known to exist in current versions

local region = finale.FCMusicRegion()
if FunctionTest(region, "FCMusicRegion", "Playback") and do_playback_test then
    region.StartMeasure = 6
    region.EndMeasure = 6
    region.StartSlot = 2
    region.EndSlot = 3
    if not playback_test_expected_to_succeed then
        print("Starting playback test. If execution pauses here, click in the document window...")
    end
    region:Playback()
    if not playback_test_expected_to_succeed then
        print("...Finished playback test. If you had to click, the test failed.")
    end
end
