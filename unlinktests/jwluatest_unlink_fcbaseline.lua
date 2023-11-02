
function FCBaseline_Test_Unlinkable(baseline, partnumber)
    UnlinkableNumberPropertyTest(baseline, "FCBaseline", "VerticalOffset", "Reload", nil, 144, partnumber, skip_finale_version)
end

-- Call:

local process_mode = function(mode, lyric_number)
    local global_baseline = finale.FCBaseline()
    if lyric_number then 
        AssureTrue(global_baseline:LoadDefaultForLyricNumber(mode, lyric_number), "LoadDefaultForLyricNumber in unlink global baseline for mode "..tostring(mode).." lyric_number "..tostring(lyric_number)..".")
    else
        AssureTrue(global_baseline:LoadDefaultForMode(mode), "LoadDefaultForMode in unlink global baseline for mode "..tostring(mode)..".")
    end
    FCBaseline_Test_Unlinkable(global_baseline, staff_to_part[2])
    local sys_staves = finale.FCSystemStaves()
    sys_staves:LoadAllForItem(0)
    for sys_staff in each(sys_staves) do
        -- get baselines every time because Relink could shuffle them
        local baselines = finale.FCBaselines()
        baselines:LoadAllForPiece(mode)
        local baseline = nil
        if lyric_number then
            baseline = baselines:AssureSavedLyricNumberForPiece(mode, sys_staff.Staff, lyric_number)
        else
            baseline = baselines:AssureSavedStaffForPiece(mode, sys_staff.Staff)
        end
        if AssureNonNil(baseline, "Function baselines:AssureSaved failed.") then
            FCBaseline_Test_Unlinkable(baseline, staff_to_part[sys_staff.Staff])
        end
    end
end

for _, mode in pairs({finale.BASELINEMODE_EXPRESSIONABOVE, finale.BASELINEMODE_EXPRESSIONBELOW, finale.BASELINEMODE_CHORD, finale.BASELINEMODE_FRETBOARD}) do
    process_mode(mode)
end

for _, mode in pairs({finale.BASELINEMODE_LYRICSVERSE, finale.BASELINEMODE_LYRICSCHORUS, finale.BASELINEMODE_LYRICSSECTION}) do
    for lyric_number = 1, 5 do
        process_mode(mode, lyric_number)
    end
end

-- This is a Finale test. Currently it fails on Finale 27.3, and this test is to discover if MakeMusic ever fixes it:
for _, mode in pairs({finale.BASELINEMODE_LYRICSVERSE, finale.BASELINEMODE_LYRICSCHORUS, finale.BASELINEMODE_LYRICSSECTION}) do
    local original_baselines = finale.FCBaselines()
    AssureEqual(10, original_baselines:LoadAllDefaultsForLyrics(mode), "Lyrics default Baseline mode "..mode.." has 10 incis.")
    if original_baselines.Count > 0 then
        local baseline = finale.FCBaseline()
        if AssureTrue(baseline:LoadDefaultForLyricNumber(mode, 1), "Load default baseline for lyric number 1, mode "..mode..".") then
            AssureTrue(baseline:DeleteData(), "Delete default baseline for lyric number 1, mode "..mode..".") 
            local new_baselines = finale.FCBaselines()
            local new_count = original_baselines.Count - 1
            local got_count = new_baselines:LoadAllDefaultsForLyrics(mode)
            if ignore_baselines_delete_version ~= finenv.RawFinaleVersion then
                AssureEqual(new_count, got_count, "Lyrics default Baseline mode "..mode.." expects "..new_count.." incis, got "..got_count..".")
            end
            AssureTrue(original_baselines:SaveAll(), "Restore original_baselines with SaveAll for mode "..mode..".")
        end
    end
end
